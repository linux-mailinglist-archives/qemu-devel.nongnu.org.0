Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DB446353
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 13:24:07 +0100 (CET)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miyGM-0002ss-Di
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 08:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1miyES-00018H-0P
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:22:08 -0400
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:46344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1miyEN-0001Qv-Vz
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 08:22:07 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0772229|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.16216-0.00185049-0.835989;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.Lo4Unkm_1636114914; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lo4Unkm_1636114914)
 by smtp.aliyun-inc.com(10.147.41.199);
 Fri, 05 Nov 2021 20:21:54 +0800
Subject: Re: [PATCH] configure: Support modules for Windows
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20211105032002.83792-1-zhiwei_liu@c-sky.com>
 <c082bdc1-f2d7-1943-31dd-629f28bb3b11@msgid.tls.msk.ru>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <9f05fc0a-fc20-9828-c01e-80774bf105bb@c-sky.com>
Date: Fri, 5 Nov 2021 20:21:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c082bdc1-f2d7-1943-31dd-629f28bb3b11@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.171; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-171.mail.aliyun.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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


On 2021/11/5 下午6:36, Michael Tokarev wrote:
> 05.11.2021 06:20, LIU Zhiwei wrote:
> ...
>> diff --git a/meson.build b/meson.build
>> index 47df10afc2..26195cb24f 100644
> ...
>> @@ -2800,14 +2800,15 @@ common_ss.add(hwcore)
>>   ###########
>>   # Targets #
>>   ###########
>> -
>> -foreach m : block_mods + softmmu_mods
>> -  shared_module(m.name(),
>> -                name_prefix: '',
>> -                link_whole: m,
>> -                install: true,
>> -                install_dir: qemu_moddir)
>> -endforeach
>> +if targetos != 'windows'
>> +  foreach m : block_mods + softmmu_mods
>> +    shared_module(m.name(),
>> +                  name_prefix: '',
>> +                  link_whole: m,
>> +                  install: true,
>> +                  install_dir: qemu_moddir)
>> +  endforeach
>> +endif
>>     softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
>>   common_ss.add(qom, qemuutil)
>> @@ -2826,6 +2827,7 @@ common_all = static_library('common',
>>   feature_to_c = find_program('scripts/feature_to_c.sh')
>>     emulators = {}
>> +emulator = 0
>
> mm...
> ...
It is an executable object that is not  visible in this patch.
>> @@ -3023,6 +3026,17 @@ foreach target : target_dirs
>>       endif
>>     endforeach
>>   endforeach
>> +if (targetos == 'windows')
>> +  foreach m : block_mods + softmmu_mods
>> +    shared_module(m.name(),
>> +        name_prefix: '',
>> +        link_whole: m,
>> +        install: true,
>> +        dependencies: glib,
>> +        link_with: emulator,
>> +        install_dir: qemu_moddir)
>> +  endforeach
>> +endif
>
> Now we have two almost-identical blocks in different places.
> Can we either move them closer to each other or combine them into one?

The difference is the next one need to link with an import library which 
is generated by an executable.
If we want to make them closer, I don't know if it influences the build 
on Linux.

I am not familiar with meson and the right way to implement this 
feature. Look forward to your more advice.

Thanks,
Zhiwei

>
> Thanks!
>
> /mjt

