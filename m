Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A922F35EB70
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:27:59 +0200 (CEST)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWWC6-0001d2-G1
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWWAz-0000jm-Oc; Tue, 13 Apr 2021 23:26:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWWAy-0005Fx-4w; Tue, 13 Apr 2021 23:26:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y16so12809831pfc.5;
 Tue, 13 Apr 2021 20:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CvA+nxoL9oXTfAHZ4hUdeB4LZgmmKO10V5rXQ4sQQ6w=;
 b=YKufCDmuumMH1Rq99JXz8uuEjeTgSM4RoYKQO7OC4H7ZAEgKs2D4an/vct6H9AOLGa
 23/4PxfFcMvjsbdSgMz8UtamK+84I3FN69BIM0WvMLJo/9x65aHeS5vrK0P0Th5OjsJy
 pxp4cO5Oi/LKAX5LQD5ppgqfpq2jY3KULEkkYC5G4TEjAeZ/8EhBmBIOSbxTKE6gdfF7
 7mn1DViKnkFejhqwvftQ1UO1IumMMFoPGQKsh8c1VP2rYLxu6QqAXTwKPrl7Qsrt0BL+
 LLS0+GuVRWMFKGu67Ulzus6UgnOjwXilMfE3Ukp3bhmGaeY7bvigfLMCO+zi8sm/3nl6
 MPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CvA+nxoL9oXTfAHZ4hUdeB4LZgmmKO10V5rXQ4sQQ6w=;
 b=BXT3eG621IbkHif3frzC94fl1KQMk8bLhFZ/xd+kAPsWJ+hZHx2SrqDxG0ufUPpvIH
 1tYtkrBh1x5JYKmX4ZkGjBf/VC/MS6SRlySnQNUU3M4SRjBqIkdfXj4hvpHaLUHt6cI8
 BsKkJnWBqN9Qau0E+EKf/uOi22Lc29SKrUHMs4UBAG23Rzd+2Gawmv7hvzeXkJTKEQbb
 qbnYar5JfcxwwAjWMCQZnWkOshMordYuI+FMgYA6FKEi+YbadDDBfeEuOoCaOlJ15xdI
 g18uuY4qveEqREsOGeTrllX+DumZJ2wLjTTGVWTb9d1udQ0rleJzN+DCVbbihC7xb/8S
 dqfw==
X-Gm-Message-State: AOAM530Z4bBaG7ivNA6mKSwUdza8wuubgU99EL6HWot8t291yjLjsccD
 AkWMuBKMWzdRlgdsx2hDooeZHzrg1Fg=
X-Google-Smtp-Source: ABdhPJwhv+XYoenXpG1w3Q46F9ii+ST0601QxbdwYi7QQ8BvNxfy+DpsZpV8+A9ZdqIlDxQwxXK40g==
X-Received: by 2002:aa7:9dcd:0:b029:246:6209:5c22 with SMTP id
 g13-20020aa79dcd0000b029024662095c22mr24911023pfq.62.1618370806320; 
 Tue, 13 Apr 2021 20:26:46 -0700 (PDT)
Received: from localhost (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id u24sm143987pga.78.2021.04.13.20.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 20:26:46 -0700 (PDT)
Date: Wed, 14 Apr 2021 13:26:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 1/3] target/ppc: Fix POWER9 radix guest HV interrupt
 AIL behaviour
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20210413125448.1689545-1-npiggin@gmail.com>
 <20210413125448.1689545-2-npiggin@gmail.com> <87y2dm47nb.fsf@linux.ibm.com>
In-Reply-To: <87y2dm47nb.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1618370656.ss5qyaukyq.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of April 13, 2021 11:48 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
>> the LPCR[AIL] value can apply to hypervisor interrupts.
>>
>> This affects machines that emulate HV=3D1 mode (i.e., powernv9).
>>
>=20
> Ah ok, so we actually want to replicate the quirk in the pnv
> machine. Took me a while.

Yes. Quirk is probably the wrong word for me to use. It's architected=20
behaviour so it must be implemented, it's just slightly surprising /
easy to miss.

>=20
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

Thanks,
Nick

>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  target/ppc/excp_helper.c | 17 +++++++++++++----
>>  1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 85de7e6c90..b8881c0f85 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, i=
nt excp_model, int excp)
>>  #endif
>> =20
>>      /*
>> -     * AIL only works if there is no HV transition and we are running
>> -     * with translations enabled
>> +     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
>>       */
>> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
>> -        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
>> +    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>>          ail =3D 0;
>>      }
>> =20
>> +    /*
>> +     * AIL does not work if there is a MSR[HV] 0->1 transition and the
>> +     * partition is in HPT mode. For radix guests, such interrupts are
>> +     * allowed to be delivered to the hypervisor in ail mode.
>> +     */
>> +    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
>> +        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
>> +            ail =3D 0;
>> +        }
>> +    }
>> +
>>      vector =3D env->excp_vectors[excp];
>>      if (vector =3D=3D (target_ulong)-1ULL) {
>>          cpu_abort(cs, "Raised an exception without defined vector %d\n"=
,
>=20

