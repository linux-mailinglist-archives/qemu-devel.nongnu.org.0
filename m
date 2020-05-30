Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170D1E8FE5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 May 2020 10:57:38 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jexJB-0005CG-3f
	for lists+qemu-devel@lfdr.de; Sat, 30 May 2020 04:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jexIN-0004fU-QQ; Sat, 30 May 2020 04:56:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34810 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jexIM-0003TS-En; Sat, 30 May 2020 04:56:47 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 804FF58645D72788304E;
 Sat, 30 May 2020 16:56:40 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.233) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 30 May 2020 16:56:33 +0800
From: Ying Fang <fangying1@huawei.com>
To: <drjones@redhat.com>
Subject: About the kvm-no-adjvtime CPU property
Message-ID: <b4389848-10fd-a906-9901-d1d354ce4842@huawei.com>
Date: Sat, 30 May 2020 16:56:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.233]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/30 04:56:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

About the kvm-no-adjvtime CPU property

Hi Andrew,
To adjust virutal time, a new kvm cpu property kvm-no-adjvtime
was introduced to 5.0 virt machine types. However the cpu
property was enabled only for host-passthrough and max cpu model.
As for other cpu model like cortex-a57, cortex-a53, cortex-a72,
this kvm-adjvtime is not enabled by default, which means the
virutal time can not be adjust for them.

Here, for example, if VM is configured with kvm enabled:

   <cpu mode='custom' match='exact' check='partial'>
     <model fallback='allow'>cortex-a72</model>
     <topology sockets='2' dies='1' cores='2' threads='1'/>
     <numa>
       <cell id='0' cpus='0-1' memory='16777216' unit='KiB'/>
       <cell id='1' cpus='2-3' memory='16777216' unit='KiB'/>
     </numa>
   </cpu>

We cannot adjust virtual time even if 5.0 virt machine is used.
So i'd like to add it to other cpu model, do you have any
suggestions here ?


