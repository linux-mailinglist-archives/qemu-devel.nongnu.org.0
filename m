Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86908302440
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:29:02 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l403J-0000to-D8
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l4026-0008Sb-C2; Mon, 25 Jan 2021 06:27:46 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:45450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l4024-00086Q-1H; Mon, 25 Jan 2021 06:27:46 -0500
Received: by mail-qt1-x82c.google.com with SMTP id d15so9342298qtw.12;
 Mon, 25 Jan 2021 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VfkIM6cRb2Yk3pemO9P08XiRHkJGl8e9BBO9WZWfUrQ=;
 b=OEOjBEN5eFFuFVCZ7SzBU7xMEnKOMht13l6uohMVmz9Chgx72WiQyPmPB91Fzh3eN6
 eMscS4BbhYit3qmEbzyXqlSmsD73jEcjS/fSNfPM0cYNkBELT1p970L3BmRV7VseU0oN
 BbGlQkSW8nXA9yr+dPwXvBERY4Dflt/xyTwsbf3V4yk7wBbluASGUl24tMKq36kG20BK
 Eppmcy2IUHalw/z12GRz0p9q0PdJBbYYKP7hulH7GxWHmDInU+eT2kA75IoL05/eHdzi
 qDt8W84Z5XIX6sqtJsH2dy2OQkzJesZM5tp8x7N8gz/adBL3uWw+emwoQm1xFtoarZ3C
 UnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VfkIM6cRb2Yk3pemO9P08XiRHkJGl8e9BBO9WZWfUrQ=;
 b=Zi/mosO170tQBV3eCvLQKDtiPcq2wLoNAhG5QgVg0U+jo6OB8nxvQFQrNkViRbmnF6
 hJu4W+99UNopeYQMSMV3j9pbUgppomPxMaswUCrWIFKJCFSS3z69plb36sQSYpeuuCt9
 SRzIMfgeYu/ueldoVtltl+NDZd83AmXG4DArJuEvhzFHaXyV9yjsHbiK6IEon2ox8CRT
 u+Cg4w1EO9gfR67Mg1IA6HH6QJeVSr2tWWl0eC513r+aDGHHA9n+lZ8qjgDf5APGDjud
 Xhi48JIgBaAj66DX1JHf8XjA06owhRDt7BwKzRlmVjQO2q1yUTr563Zw3YdCztgpC3ZB
 zVnA==
X-Gm-Message-State: AOAM531OmbZ8TKbO70dsjNXoiOIh19jzt3/Ct9k4a8WveKhcUuCX6sIH
 5LL4PaYnukRzPRSeb2cQMU8=
X-Google-Smtp-Source: ABdhPJy0WTJgOQF9nwHVs0EDniElEEALjUO5m61BdrYieJ5QNrFISdFwN2KGfKdsjsE2+sHUHoUNDA==
X-Received: by 2002:ac8:6c52:: with SMTP id z18mr232941qtu.173.1611574062020; 
 Mon, 25 Jan 2021 03:27:42 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:8054:4ea2:2099:411c:227c?
 ([2804:431:c7c7:8054:4ea2:2099:411c:227c])
 by smtp.gmail.com with ESMTPSA id h8sm11256691qtm.5.2021.01.25.03.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 03:27:41 -0800 (PST)
Subject: Re: [PATCH v2 1/1] spapr_caps.c: check user input before warning
 about TCG only caps
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210120105406.163074-1-danielhb413@gmail.com>
 <20210120105406.163074-2-danielhb413@gmail.com>
 <20210123014625.GH4400@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <a0afb814-2f82-f697-63fd-3dddcf5f4490@gmail.com>
Date: Mon, 25 Jan 2021 08:27:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123014625.GH4400@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/22/21 10:46 PM, David Gibson wrote:
> On Wed, Jan 20, 2021 at 07:54:06AM -0300, Daniel Henrique Barboza wrote:
>> Commit 006e9d361869 added warning messages for cap-cfpc, cap-ibs and
>> cap-sbbc when enabled under TCG. Commit 8ff43ee404d3 did the same thing
>> when introducing cap-ccf-assist.
>>
>> These warning messages, although benign to the machine launch, can make
>> users a bit confused. E.g:
>>
>> $ sudo ./ppc64-softmmu/qemu-system-ppc64
>> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cfpc=workaround
>> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sbbc=workaround
>> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ibs=workaround
>> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ccf-assist=on
>>
>> We're complaining about "TCG doesn't support requested feature" when the
>> user didn't request any of those caps in the command line.
>>
>> Check if these caps were set in the command line before sending an user
>> warning.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> Oof.  I have real mixed feelings about this.
> 
> So, yes, the warnings are annoying, but they're not meaningless.  They
> are really indicating that the guest environment is different from the
> one you requested (implicitly, via the machine version). The fact that
> they are only warnings, not hard errors, is already a compromise
> because otherwise there would be no real way to use TCG at all with
> current machines.
> 
> In short, the warnings are scary because they're *meant* to be scary.
> TCG will not, and cannot, supply the Spectre mitigations that are
> expected on a current machine type.

Quick story: I'm involved in helping folks in a local Brazilian college working
with QEMU in Power ([1] for more info). One user is trying to run a pseries TCG
guest in Windows 10, and he is having problems with the current pseries machine,
while we is still able to do it with the pseries-2.8 one (I'm actually surprised
that it works at all in Windows 10 TBH).

So this user ask me for help with this scenario because he didn't know how to
fix these TCG warnings, because he was thinking that they had something to do
with the problem he is having with his use case. I said that these warnings
could be safely ignored for TCG.

These warnings are indeed scary, as you said. But not in a helpful way. Consider
that most QEMU warnings are a call for action for the user to fix something, e.g.
an option that's about to be deprecated/no longer supported. In this case we're
warning the user of something that the user has no fault on, and more important,
can do nothing about it but to ignore. And this user interaction I had made me
realize that it's not trivial to ignore warnings when your use case is not
working as intended. You will attempt to fix the warnings before trying to open
a developer bug and so on.

What we're doing here I can call a 'developer warning', something to remind us,
developers, that TCG does not implement Spectre caps that are default in the
pseries machine. Well, I'd rather document somewhere (in tcg/README, or perhaps
create a hw/ppc/README since this is a pseries exclusive behavior) that TCG is
ignoring default Spectre caps of the pseries machine, than to issue warnings about
it.


> 
> I agree that the current behaviour is pretty irritating, but I don't
> know that silently pretending TCG can do what's normally expected of
> that command line is a great option either.


I can send a patch to change the messages to say something like "this can be safely
ignored. Use -machine cap-X=broken to hid it". At least we will inform TCG users
that these warning are not their fault and they shouldn't spend their time trying to
figure them out. But then, why issue a warning and tell the user "this is warning,
please ignore me"?



Thanks,


DHB



[1] https://openpower.ic.unicamp.br/minicloud/

> 
> 
>> ---
>>   hw/ppc/spapr_caps.c | 47 ++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 36 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>> index 9341e9782a..629c24a96d 100644
>> --- a/hw/ppc/spapr_caps.c
>> +++ b/hw/ppc/spapr_caps.c
>> @@ -244,9 +244,15 @@ static void cap_safe_cache_apply(SpaprMachineState *spapr, uint8_t val,
>>       uint8_t kvm_val =  kvmppc_get_cap_safe_cache();
>>   
>>       if (tcg_enabled() && val) {
>> -        /* TCG only supports broken, allow other values and print a warning */
>> -        warn_report("TCG doesn't support requested feature, cap-cfpc=%s",
>> -                    cap_cfpc_possible.vals[val]);
>> +        /*
>> +         * TCG only supports broken, allow other values and print a warning
>> +         * in case the user attempted to set a different value in the command
>> +         * line.
>> +         */
>> +        if (spapr->cmd_line_caps[SPAPR_CAP_CFPC] != SPAPR_CAP_BROKEN) {
>> +            warn_report("TCG doesn't support requested feature, cap-cfpc=%s",
>> +                        cap_cfpc_possible.vals[val]);
>> +        }
>>       } else if (kvm_enabled() && (val > kvm_val)) {
>>           error_setg(errp,
>>                      "Requested safe cache capability level not supported by KVM");
>> @@ -269,9 +275,15 @@ static void cap_safe_bounds_check_apply(SpaprMachineState *spapr, uint8_t val,
>>       uint8_t kvm_val =  kvmppc_get_cap_safe_bounds_check();
>>   
>>       if (tcg_enabled() && val) {
>> -        /* TCG only supports broken, allow other values and print a warning */
>> -        warn_report("TCG doesn't support requested feature, cap-sbbc=%s",
>> -                    cap_sbbc_possible.vals[val]);
>> +        /*
>> +         * TCG only supports broken, allow other values and print a warning
>> +         * in case the user attempted to set a different value in the command
>> +         * line.
>> +         */
>> +        if (spapr->cmd_line_caps[SPAPR_CAP_SBBC] != SPAPR_CAP_BROKEN) {
>> +            warn_report("TCG doesn't support requested feature, cap-sbbc=%s",
>> +                        cap_sbbc_possible.vals[val]);
>> +        }
>>       } else if (kvm_enabled() && (val > kvm_val)) {
>>           error_setg(errp,
>>   "Requested safe bounds check capability level not supported by KVM");
>> @@ -297,9 +309,15 @@ static void cap_safe_indirect_branch_apply(SpaprMachineState *spapr,
>>       uint8_t kvm_val = kvmppc_get_cap_safe_indirect_branch();
>>   
>>       if (tcg_enabled() && val) {
>> -        /* TCG only supports broken, allow other values and print a warning */
>> -        warn_report("TCG doesn't support requested feature, cap-ibs=%s",
>> -                    cap_ibs_possible.vals[val]);
>> +        /*
>> +         * TCG only supports broken, allow other values and print a warning
>> +         * in case the user attempted to set a different value in the command
>> +         * line.
>> +         */
>> +        if (spapr->cmd_line_caps[SPAPR_CAP_IBS] != SPAPR_CAP_BROKEN) {
>> +            warn_report("TCG doesn't support requested feature, cap-ibs=%s",
>> +                        cap_ibs_possible.vals[val]);
>> +        }
>>       } else if (kvm_enabled() && (val > kvm_val)) {
>>           error_setg(errp,
>>   "Requested safe indirect branch capability level not supported by KVM");
>> @@ -483,8 +501,15 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
>>       uint8_t kvm_val = kvmppc_get_cap_count_cache_flush_assist();
>>   
>>       if (tcg_enabled() && val) {
>> -        /* TCG doesn't implement anything here, but allow with a warning */
>> -        warn_report("TCG doesn't support requested feature, cap-ccf-assist=on");
>> +        /*
>> +         * TCG doesn't implement anything here, but allow with a warning
>> +         * in case the user attempted to set a different value in the command
>> +         * line.
>> +         */
>> +        if (spapr->cmd_line_caps[SPAPR_CAP_CCF_ASSIST] != SPAPR_CAP_OFF) {
>> +            warn_report("TCG doesn't support requested feature, "
>> +                        "cap-ccf-assist=on");
>> +        }
>>       } else if (kvm_enabled() && (val > kvm_val)) {
>>           uint8_t kvm_ibs = kvmppc_get_cap_safe_indirect_branch();
>>   
> 

