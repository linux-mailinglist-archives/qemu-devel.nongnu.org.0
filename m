Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA29C33BFAC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:24:45 +0100 (CET)
Received: from localhost ([::1]:55682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLp5I-0001D6-JK
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLp3H-0007eI-W6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:22:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:50248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLp3G-0000oO-7E
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:22:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94723AE3C;
 Mon, 15 Mar 2021 15:22:36 +0000 (UTC)
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210315135410.221729-1-thuth@redhat.com>
 <db946056-f099-ac99-38c2-60c61f079676@suse.de>
 <208fab42-d276-315b-e7df-a80b4c4004e2@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <46712c50-fcd9-d09b-c295-5207a18cc975@suse.de>
Date: Mon, 15 Mar 2021 16:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <208fab42-d276-315b-e7df-a80b4c4004e2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 4:08 PM, Thomas Huth wrote:
> On 15/03/2021 15.07, Claudio Fontana wrote:
>> On 3/15/21 2:54 PM, Thomas Huth wrote:
>>> We are generating a lot of target-specific defines in the *-config-devices.h
>>> and *-config-target.h files. Using them in common code is wrong and leads
>>> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
>>> as expected. To avoid these issues, we are already poisoning some of the
>>> macros in include/exec/poison.h - but maintaining this list manually is
>>> cumbersome. Thus let's generate the list of poisoned macros automatically
>>> instead.
>>> Note that CONFIG_TCG (which is also defined in config-host.h) and
>>> CONFIG_USER_ONLY are special, so we have to filter these out.
>>
>>
>>
>> I have the impression that CONFIG_USER_ONLY should be poisoned too.
>>
>> A lot of the
>>
>> #ifndef CONFIG_USER_ONLY
>>
>> end up currently doing the wrong thing in common modules includes,
>> especially due to the inverted nature of the check.
> 
> Not sure about that ... do you have an example at hand?

it was the whole story around hw/core/cpu.h .

It contains CONFIG_USER_ONLY, with the unwanted behavior mentioned,
and seeing its existing use, I stopped short of introducing a bug:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg768318.html

Other code in hw/core/cpu.c also uses CONFIG_USER_ONLY (See the XXX),

and the hw/core/cpu.h continues to carry CONFIG_USER_ONLY, with the potential to lead other people to misuse it
(putting in an extra prototype is harmless, but an extra field isn't).



> 
> Anyway, one thing is sure, if we want to poison CONFIG_USER_ONLY, this will 
> certainly cause a lot of clean up work first, since it is used all over the 
> place...
> 
>   Thomas

Yes, and probably a good idea.

Thanks,

Claudio


