Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDD13D368E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:20:20 +0200 (CEST)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qPr-0005df-S6
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6qOn-0004rp-WF
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:19:14 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:51972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m6qOm-0000Vu-DJ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:19:13 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D68621D52;
 Fri, 23 Jul 2021 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627028351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ql2fcmTGz0MmlQQY9t4vq6bY3ciS+6xBTlBqgNeteqk=;
 b=sQE1tWzFuQqD49bJAyDb7i1Qcf/Stf8p4ZEVJ+zjWaaPWm6GEr94aGpFZwehVpI8/dInnN
 phOfPU36LwYeb65+zJ+aFL8qqUE+ZrqtmzPGRkUCJPYXcdMuCAiJZvLqm0GUyCiT/DbwGr
 WsomG6HIlluOgPUfKsVCX52QnmXYvmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627028351;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ql2fcmTGz0MmlQQY9t4vq6bY3ciS+6xBTlBqgNeteqk=;
 b=wpC3Lay2q8l97TU/nHCp2zbIe5xpFOvz8I8M4xmjS1iSMQgqgXDrS2vylGwVxPihUJeWE8
 PqREebt7Uhm96MBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C791C13DF5;
 Fri, 23 Jul 2021 08:19:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qUHvLn57+mA4ZQAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Jul 2021 08:19:10 +0000
Subject: Re: [PATCH for-6.1] i386: do not call cpudef-only models functions
 for max, host, base
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210722083851.24068-1-cfontana@suse.de>
 <101ca50d-5bec-d4cc-7874-a296bf43421f@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ed9132b0-6b10-ad8b-3344-6cf0e3ed25b5@suse.de>
Date: Fri, 23 Jul 2021 10:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <101ca50d-5bec-d4cc-7874-a296bf43421f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/21 6:13 PM, Philippe Mathieu-Daudé wrote:
> On 7/22/21 10:38 AM, Claudio Fontana wrote:
> 
> It seems the subject got dropped and the first line
> used as subject... But I'm not sure you want to
> start the description with it.

hmm the subject got dropped from where? I see it in the mail subject..
> 
>> properties set by function x86_cpu_apply_props, including
>> kvm_default_props, tcg_default_props,
>> and the "vendor" property for KVM and HVF,
>>
> 
> This newline is what confuses me.

hmm maybe better:

"
Some cpu properties have to be set only for cpu models in builtin_x86_defs,
registered with x86_register_cpu_model_type, and not for
cpu models "base", "max", and the subclass "host".

These properties are the ones set by function x86_cpu_apply_props,
(also including kvm_default_props, tcg_default_props),
and the "vendor" property for the KVM and HVF accelerators.

After recent refactoring of cpu, which also affected these properties,
they were instead set unconditionally for all x86 cpus.

>> This has been detected as a bug with Nested on AMD with cpu "host",
>> as svm was not turned on by default, due to the wrongful setting of
>> kvm_default_props via x86_cpu_apply_props.

.. which set svm to "off".

>> Rectify the bug introduced in commit "i386: split cpu accelerators"
>> and document the functions that are builtin_x86_defs-only.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Tested-by: Alexander Bulekov <alxndr@bu.edu>
>> Fixes: f5cc5a5c ("i386: split cpu accelerators from cpu.c,"...)
>> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/477
> 
> If you want to have gitlab closes the issue once merged, you'd
> need to use Resolves:/Fixes: tag instead, see
> https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#default-closing-pattern

I'll try Resolves: to avoid collision with Fixes: used to mark the commit that introduced the regression.

Wdyt about the new text?

Thanks,

Claudio

> 
>> ---
>>  target/i386/cpu.c         |  19 ++++++-
>>  target/i386/host-cpu.c    |  13 +++--
>>  target/i386/kvm/kvm-cpu.c | 105 ++++++++++++++++++++------------------
>>  target/i386/tcg/tcg-cpu.c |  11 ++--
>>  4 files changed, 89 insertions(+), 59 deletions(-)
> 


