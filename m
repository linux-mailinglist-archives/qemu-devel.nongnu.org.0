Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DF4A5723
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 07:09:49 +0100 (CET)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEmMN-0004zx-8E
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 01:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nEmFn-0003Vy-LS; Tue, 01 Feb 2022 01:03:00 -0500
Received: from [2607:f8b0:4864:20::62d] (port=44859
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nEmFl-0003Ew-Jm; Tue, 01 Feb 2022 01:02:59 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c9so14513632plg.11;
 Mon, 31 Jan 2022 22:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=i8nvtj+MdABVCT7tIJYUq9z1oRwVfL9WysN+QICk/sA=;
 b=hmLy0l7UNm2XtPomTpk/0otzgtZV/yhOvUIHT41zjSdGXaL+w20PBckp9kLtGA/omP
 TMQelIJ91xGR1l0/MmnXosFr/rXcJPFv5DuUTuasDdRyLB0Lk0oUuojwVecew2nPiLtx
 +RTUZ3t96JJ7cAfk9kjsjSKDGEvTneN2uimrcmuwKxTEBe6FWWFkfEvgqA6OEDb7OklK
 lzKwZmH807d8zKYTP7vKTDCqH55RZRtvMaEhQ/xXr3OY4oBXXd+SFeG8axycadVDNFVa
 BeR0vitaDOYW/5+EtCoRbshG0djbwRFAAVSJp2R7TMXmDZhKqZw+Rre8Ax+Gyc3YBliH
 Jwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=i8nvtj+MdABVCT7tIJYUq9z1oRwVfL9WysN+QICk/sA=;
 b=EQDPvZsxUkZN19xqDXiYrz5FmEOMx9prQC2AkSKXUXrg08b6Lmg6hfShn+oEawp1fP
 gcaVQ4BGoz4EEqJbM0iHOvZ1iY9ampaACihJ9pjgiYpcWtQ5KHQSUvkdWui0Wmb2SUq7
 3yUSYJ1NOOCfDH6bal1RCNxadelJjqtlXFuHUfViu4wSlTx7CfUOHKNsgd6uaAIB64Mv
 sYetG77T4cojK1Clpr/+Pf6s4A8i8W7T72mApfvlji30ki3U741NUC3+wLXbGmqJ94ae
 JGo0lANIjuYqcUBnXxVcZUbn5ZVy3pjokxHH8Eqwc+v7nlKjpAvRLgO7ZpLJhd7qUtRJ
 DclQ==
X-Gm-Message-State: AOAM531NabwPUw6857VmrKd7cchCp+23aAahP0dyKddj9JWABgV3Ml1d
 3CG0pSXfPgr0GRhECRt4NNQ=
X-Google-Smtp-Source: ABdhPJzdwH6u4mCM9rbxgXDfcPfmeBXs4yAnFcVaWvzHTrpiDToyDcXyp3m+CsBmKvO7XWJXyKTdsQ==
X-Received: by 2002:a17:902:c101:: with SMTP id
 1mr24338522pli.70.1643695375166; 
 Mon, 31 Jan 2022 22:02:55 -0800 (PST)
Received: from localhost ([203.111.178.100])
 by smtp.gmail.com with ESMTPSA id h5sm20569325pfi.111.2022.01.31.22.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 22:02:54 -0800 (PST)
Date: Tue, 01 Feb 2022 16:02:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20220129065007.103681-1-npiggin@gmail.com>
 <87y22vdhuj.fsf@linux.ibm.com>
In-Reply-To: <87y22vdhuj.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1643694992.q6ka0bg4i9.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of February 1, 2022 1:51 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> The behaviour of the Address Translation Mode on Interrupt resource is
>> not consistently supported by all CPU versions or all KVM versions.  In
>> particular KVM HV only supports mode 0 on POWER7 processors, and does
>> not support mode 2 on any processors. KVM PR only supports mode 0. TCG
>> can support all modes (0,2,3).
>>
>> This leads to inconsistencies in guest behaviour and could cause
>> problems migrating guests.
>>
>> This was not too noticable for Linux guests for a long time because the
>> kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
>> advisory (KVM would not always honor it either) and it kept both sets of
>> interrupt vectors around.
>>
>> Recent Linux guests depend on the AIL mode working as defined by the ISA
>> to support the SCV facility interrupt. If AIL mode 3 can not be provided=
,
>> then Linux must be given an error so it can disable the SCV facility.
>>
>> Add the ail-modes capability which is a bitmap of the supported values
>> for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
>> a new KVM CAP that exports the same thing, and provide defaults for PR
>> and HV KVM that predate the cap.
>> ---
>>
>> I just wanted to get some feedback on the approach before submitting a
>> patch for the KVM cap.
>=20
> Could you expand a bit on what is the use case for setting this in the
> QEMU cmdline? I looks to me we already have all the information we need
> with just the KVM cap.

To be able to match TCG with KVM HV or PR behaviour here.
I guess I'm not sure how much that is actually needed though.

>> +    if (kvm_enabled()) {
>> +        if (val & (0x01 << 2)) {
>> +            error_setg(errp, "KVM does not support cap-ail-modes mode A=
IL=3D2");
>=20
> Isn't this something KVM should tell us via the capability?

Yeah, might as well do that. I changed some of the interfaces halfway
through and didn't clean this up.

>> +            error_append_hint(errp,
>> +                              "Ensure bit 2 (value 4) is clear in cap-a=
il-modes\n");
>> +            if (kvmppc_has_cap_ail_3()) {
>> +                error_append_hint(errp, "Try appending -machine cap-ail=
-modes=3D9\n");
>> +            } else {
>> +                error_append_hint(errp, "Try appending -machine cap-ail=
-modes=3D1\n");
>> +            }
>> +            return;
>> +        }
>> +        if ((val & (0x01 << 3)) && !kvmppc_has_cap_ail_3()) {
>> +            error_setg(errp, "KVM implementation does not support cap-a=
il-modes AIL=3D3");
>> +            error_append_hint(errp,
>> +                              "Ensure bit 3 (value 8) is clear in cap-a=
il-modes\n");
>> +            error_append_hint(errp, "Try appending -machine cap-ail-mod=
es=3D1\n");
>> +            return;
>> +        }
>> +    }
>> +}
>=20
> I think the error reporting here is too complex. A user who just wants
> to make their guest start will not bother thinking about binary
> representation. There's also some room for confusion in having three
> numbers present in the error message (bit #, decimal value and AIL
> mode). Imagine dealing with this in a bug report, for instance.
>=20
> I would just tell outright what the supported values are. Perhaps in a
> little table:
>=20
> Supported AIL modes:
>  AIL =3D 0   | cap-ail-modes=3D1
>  AIL =3D 2   | cap-ail-modes=3D5
>  AIL =3D 3   | cap-ail-modes=3D9
>  AIL =3D 2&3 | cap-ail-modes=3D13
>=20
> We could then make the code a bit more generic. Roughly:

Yeah I didn't like the interface either :P

The nicest option I guess is to be able to give it a list

cap-ail-modes=3D0,2,3

Maybe there's already some parsing to be able to do that. I'll
look a bit harder.

Thanks,
Nick

