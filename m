Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0390628DC0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinf-0007vJ-V0; Mon, 14 Nov 2022 18:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ouifo-0006LX-Q7
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ouVXO-0001LS-5y
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 04:13:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 49F3D4025E;
 Mon, 14 Nov 2022 12:13:49 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 397AB30C;
 Mon, 14 Nov 2022 12:13:55 +0300 (MSK)
Message-ID: <be197f59-ee50-caac-ecc5-aa1398b2bad3@msgid.tls.msk.ru>
Date: Mon, 14 Nov 2022 12:13:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
 <Y3IDCbr/ZgsSuzkh@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <Y3IDCbr/ZgsSuzkh@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

14.11.2022 11:58, Daniel P. Berrangé wrote:
..
>> On current systems, using <capstone/capstone.h> works
>> now (despite the pkg-config-supplied -I/usr/include/capstone) -
>> since on all systems capstone headers are put into capstone/
>> subdirectory of a system include dir. So this change is
>> compatible with both the obsolete way of including it
>> and the only future way.
> 
> AFAIR, macOS HomeBrew does not put anything into the system
> include dir, and always requires -I flags to be correct.

Does it work with the capstone-supplied --cflags and the proposed
include path?  What does pkg-config --cflags capstone return there?

..
>> -  if capstone.found() and not cc.compiles('#include <capstone.h>',
>> +  if capstone.found() and not cc.compiles('#include <capstone/capstone.h>',
>>                                             dependencies: [capstone])
> 
> To retain back compat this could probe for both ways
> 
>      if capstone.found()
>          if cc.compiles('#include <capstone/capstone.h>',
> 	               dependencies: [capstone])
>             ...
>          else if cc.compiles('#include <capstone.h>',
> 	                    dependencies: [capstone])
>             ...
>          
> then, the source file can try the correct #include based on what
> we detect works here.

I don't think this deserves the complexity really, unless there *is*
a system out there which actually needs this.

I mean, these little compat tweaks, - it becomes twisty with time,
and no one knows which code paths and config variables are needed
for what, and whole thing slowly becomes unmanageable... If it's
easy to make it unconditional, it should be done. IMHO anyway :)

Thanks!

/mjt

