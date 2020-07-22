Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50141228EAE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 05:39:25 +0200 (CEST)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy5bI-0004Gy-DU
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 23:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1jy5aU-0003qQ-47
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 23:38:34 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60836 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1jy5aS-0002W2-9B
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 23:38:33 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9BD23B771DDAAC2506D1;
 Wed, 22 Jul 2020 11:38:25 +0800 (CST)
Received: from [127.0.0.1] (10.174.186.173) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 22 Jul 2020 11:38:16 +0800
Subject: Re: [PATCH v1] migration: tls: unref creds after used
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200717091943.1942-1-yezhenyu2@huawei.com>
 <20200721115445.GG843362@redhat.com>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Message-ID: <c7b05334-0484-8bc5-7476-81adbce24fca@huawei.com>
Date: Wed, 22 Jul 2020 11:38:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200721115445.GG843362@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.173]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yezhenyu2@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:38:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xiexiangyou@huawei.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/7/21 19:54, Daniel P. Berrangé wrote:
> On Fri, Jul 17, 2020 at 05:19:43PM +0800, Zhenyu Ye wrote:
>> We add the reference of creds in migration_tls_get_creds(),
>> but there was no place to unref it.  So the OBJECT(creds) will
>> never be freed and result in memory leak.
>>
>> Unref the creds after creating the tls-channel server/client.
>> ...
>>
>> +
>> +cleanup:
>> +    object_unref(OBJECT(creds));
>>  }
> 
> Simpler to just change  migration_tls_get_creds() to remove the
> object_ref() call, since we're fine to use the borrowed reference
> in these methods.
> 

Thanks for your review.  I have sent a new series since the current
title "unref creds after used" is no longer appropriate:

https://lore.kernel.org/qemu-devel/20200722033228.71-1-yezhenyu2@huawei.com/

Thanks,
Zhenyu


