Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEE4B432C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:02:25 +0100 (CET)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWJS-0007Z4-Ft
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:02:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJWCT-0004kS-RL; Mon, 14 Feb 2022 02:55:09 -0500
Received: from [2607:f8b0:4864:20::435] (port=43993
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJWCS-0004Wa-4f; Mon, 14 Feb 2022 02:55:09 -0500
Received: by mail-pf1-x435.google.com with SMTP id d187so27837747pfa.10;
 Sun, 13 Feb 2022 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=agYGiZYohCWoUpRzfKzmmTUDsTJkxx//+9tzZoDXBFE=;
 b=UtQWigDtGOd2PFu/hCmRxtovBU/IDaTfCLUSmieLjg7g7zpfO2kofvNtHsnCC/CWX/
 D4YFlTa5PrMyS/gHDOH3M2wTN2G4XjBdGza2GufaP63iKTekTMUig9f7n+NjnVD29Y0o
 E/EJVr60lhGGUGOxUQZkkI8ZbIZhyj8MZPrN+8pCJfGQmduoh9cfkcmyUNypZbndhqHs
 xZuWUGvsGHmbZl3WGL6Dp77zV+5IYi8r1P+K/BGjb6ln1eNKsBf1h2+nUupwPe0y2WbB
 BKuZneeNcNKlF/1RxRxe8Lc9wtPWt0gp0drV+4cwKu1AjTwV0m5vtuM2kHT4JtOPuxwU
 FEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=agYGiZYohCWoUpRzfKzmmTUDsTJkxx//+9tzZoDXBFE=;
 b=b20doWHcormBYAzoSZGARozuN3Ukipk7USzD4UCzE0BT/JTZpcLHnG1b/XD1PlkvF8
 tBO15CcJVVF/GnWdt0J4NXLrGi82iMyrabBzr9Qo0ynQZtJwsEmGvDGfJFA5UBTqiwDw
 kLW/uGvyx5xZRf/GdnpDBMuCRxVKeNcgjBFMkG5P5Ee7wRLsSwlXVvN+EjXe1hYLUpmJ
 5xuI4taGKscyiySamHqEpnb/uS1u/TRxp4kDtHBZXyg4Yrzb3oNHtptSpGPsTivEBzBZ
 Jl87G7bFQIrnNpxRSF0gvyOBus9PqYwpAgouUEsj57mecTlDVf6TUoaKh5cK3ZekubHQ
 6UjQ==
X-Gm-Message-State: AOAM530h2kltliQhhOiDH90inx+AurPVXLoJz8+MyWF6+eRTbXiCjfMO
 /XD/GalTWXTJZEF3Wz/i9Z3AmlCQL7E=
X-Google-Smtp-Source: ABdhPJy3Uo2LAs8qa4Y9krtZHSaX5hFOIFzueQ73JLOsAQaQ7UbrKBKCPy3fkbqaXhJwMscu56NtvA==
X-Received: by 2002:aa7:888f:: with SMTP id z15mr2729174pfe.15.1644825304602; 
 Sun, 13 Feb 2022 23:55:04 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id u18sm12483449pjn.49.2022.02.13.23.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 23:55:04 -0800 (PST)
Date: Mon, 14 Feb 2022 17:54:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220129065007.103681-1-npiggin@gmail.com>
 <YgB4u+L0z6LhMU9n@yekko>
In-Reply-To: <YgB4u+L0z6LhMU9n@yekko>
MIME-Version: 1.0
Message-Id: <1644823535.aiy9exufpx.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from David Gibson's message of February 7, 2022 11:41 am:
> On Sat, Jan 29, 2022 at 04:50:07PM +1000, Nicholas Piggin wrote:
>> The behaviour of the Address Translation Mode on Interrupt resource is
>> not consistently supported by all CPU versions or all KVM versions.  In
>> particular KVM HV only supports mode 0 on POWER7 processors, and does
>> not support mode 2 on any processors. KVM PR only supports mode 0. TCG
>> can support all modes (0,2,3).
>>=20
>> This leads to inconsistencies in guest behaviour and could cause
>> problems migrating guests.
>>=20
>> This was not too noticable for Linux guests for a long time because the
>> kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
>> advisory (KVM would not always honor it either) and it kept both sets of
>> interrupt vectors around.
>>=20
>> Recent Linux guests depend on the AIL mode working as defined by the ISA
>> to support the SCV facility interrupt. If AIL mode 3 can not be provided=
,
>> then Linux must be given an error so it can disable the SCV facility.
>>=20
>> Add the ail-modes capability which is a bitmap of the supported values
>> for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
>> a new KVM CAP that exports the same thing, and provide defaults for PR
>> and HV KVM that predate the cap.
>> ---
>>=20
>> I just wanted to get some feedback on the approach before submitting a
>> patch for the KVM cap.
>>=20
>> The reason I don't make that a boolean cap for AIL=3D3 is that future
>> processors might implement new modes a guest would like to use even
>> though it's not the nicest interface.
>=20
> [snip]
>>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =3D {
>>      [SPAPR_CAP_HTM] =3D {
>>          .name =3D "htm",
>> @@ -730,6 +802,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM]=
 =3D {
>>          .type =3D "bool",
>>          .apply =3D cap_rpt_invalidate_apply,
>>      },
>> +    [SPAPR_CAP_AIL_MODES] =3D {
>> +        .name =3D "ail-modes",
>> +        .description =3D "Bitmap of AIL (alternate interrupt location) =
mode support",
>=20
> A bitmap doesn't quite work as an spapr cap.  The general caps code
> assumes that bigger is always better, or more precisely that migrating
> from an instance that has a lower value to one which has a higher
> value is "good enough" to be compatible.  That's obviously not the
> case for a bitmap.

Yeah, it was clearly a nasty wart :P

> I think to handle this properly within the limitations of papr caps,
> you instead want a separate boolean cap for each supported AIL mode
> (or at least for each AIL mode you want to have control over).

Oh that's a good idea. We could just do ail-mode-3 for now.

2 is supported by previous processors, but is now deprecated. I don't=20
think AIX ever used it although it (or something else) may have. Even
KVM never really implemented it correctly. Although I think TCG does.

So in theory we could be causing a regression if we leave out mode 2,
although it should be easy to re-add (we can leave the support in TCG
for a while and it's not much work anyway).

I'll try with just 3 as the optional cap. Should make it a lot cleaner.

Thanks,
Nick

