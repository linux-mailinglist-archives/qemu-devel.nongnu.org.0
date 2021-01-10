Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865EE2F08E0
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 18:52:28 +0100 (CET)
Received: from localhost ([::1]:35788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyet9-0002qA-2q
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 12:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kyerr-0001jd-Ni
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 12:51:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:48260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kyerp-0008Jt-FD
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 12:51:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02A7FAC8F;
 Sun, 10 Jan 2021 17:51:02 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] unbreak non-tcg builds
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201013143806.14321-1-cfontana@suse.de>
 <cd8e9295-dcd0-18c4-e7a2-86bed74f967c@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e58c8f9d-402d-3b74-3c8d-0488f0ce0d48@suse.de>
Date: Sun, 10 Jan 2021 18:51:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cd8e9295-dcd0-18c4-e7a2-86bed74f967c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.012,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/20 4:55 PM, Philippe Mathieu-Daudé wrote:
> On 10/13/20 4:38 PM, Claudio Fontana wrote:
>> This series now unbreaks current non-tcg builds
>> (!CONFIG_TCG).
>>
>> tests Makefiles need to avoid relying on all non-native
>> archs binaries to be present,
>>
>> bios-tables-test needs to skip tests that are tcg-only,
>>
>> and notably the replay framework needs to consider that
>> it might not be functional (or its code present at all)
>> without TCG.
>>
>> Tested ok target x86_64-softmmu on x86_64 host with:
>>
>> ./configure --enable-tcg --disable-kvm
>> ./configure --enable-kvm --disable-tcg
>> ./configure --enable-tcg --enable-kvm
> 
> If you want to avoid these configurations to bitrot,
> consider covering them by adding Gitlab jobs :)))
> 

Hello Philippe,

happy new year,

I am going back to look at the current code in master, slowly trying to get back a hold on things,
and I remember some time ago you suggested to keep testing "tools" builds,

with

./configure --disable-tcg --disable-kvm --enable-tools

but the drawback of the "tools-only" build is that currently one cannot run make check on it.

It fails with ERRORS in bios-tables-test and others.

Is it supposed to actually work? Is there any make check work that can be done without any accelerator?
I would assume so...

Thanks,

Claudio


