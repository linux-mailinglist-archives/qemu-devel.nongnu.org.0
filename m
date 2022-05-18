Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4E52B682
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:58:10 +0200 (CEST)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGRU-0002Wd-PB
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1nrGPq-0000tD-VY; Wed, 18 May 2022 05:56:28 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1nrGPl-0004GL-Jo; Wed, 18 May 2022 05:56:26 -0400
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L37b91DmbzQk9d;
 Wed, 18 May 2022 17:53:09 +0800 (CST)
Received: from [10.174.187.250] (10.174.187.250) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 18 May 2022 17:56:03 +0800
Subject: Question about commit 1adf528ec3bd ("hw/rtc/pl031: Send RTC_CHANGE
 QMP event")
To: <eric.auger@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <wanghaibin.wang@huawei.com>
Message-ID: <876a4b1f-a5ca-6bdc-28a8-682a64661f4c@huawei.com>
Date: Wed, 18 May 2022 17:55:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.250]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  jokenzhang <zhangxinhao1@huawei.com>
From:  jokenzhang via <qemu-devel@nongnu.org>

Hi Eric,

Have you ever tested the value reported by the PL031 RTC_CHANGE when
the qemu clock is using the virtual clock, which is not identical to
mc146818.

For instance, adding 20s to the guest RTC value, the expected value should be
20, but the actual value is 1652863291:

{"timestamp": {"seconds": 1652863355, "microseconds": 298846}, "event": "RTC_CHANGE", "data": {"offset":
1652863291}}

This is tested with qemu option "-rtc base=utc,clock=vm"

>         s->tick_offset += value - pl031_get_count(s);
>+
>+        qemu_get_timedate(&tm, s->tick_offset);
>+        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));

It may be caused by the calculation of the new reference time. The new reference
time is calculated with s->tick_offset and rtc_ref_start_datetime, and
s->tick_offset is initialized with rtc_ref_start_datetime, resulting that the
rtc_ref_start_datetime is double counting.


Thanks

