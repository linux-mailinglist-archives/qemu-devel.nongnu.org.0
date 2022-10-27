Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF8160F2BC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:42:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onySL-0000ie-0u; Thu, 27 Oct 2022 04:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onySD-0000Uj-NK
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:41:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyS0-0007tD-Sv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:41:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id w14so959637wru.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ciO9wzqDJBohEQ8HfojpLhNd+QMTSlu+YI/hytMwZ1w=;
 b=v0mfmniZbpC86gyjj1j07A1k6oA7cmZVznvQ8L6eMMYweqS64J9MxRroVRX6sC6Rna
 RB2HBJ+2hFZAM3XUBxk46pPy6DgNre5qZAm5n60d+ZGoPeT06fFE0pCrAN2Mwypy7A0y
 ULufsH0Efl5YYtPwDt3rTMEW8qJ6Hrz+gPopoTbFrKGx4V4jks1cTjoMlX7aADaNTC/m
 b7vkfRpl2hOtjynlFt9aPjV8fSPrkIY3uzc8/Ed8fihn/px6Ue8u84fjPqLhMkJWEsQU
 C5VYQpmSLBypHTZUeVfDuZUe0B1KVIVmvB78f18RVPTc5N6lhKfPFGbjVm4FPqZPWh5D
 ntfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ciO9wzqDJBohEQ8HfojpLhNd+QMTSlu+YI/hytMwZ1w=;
 b=pANON5zroeHFz7ROANpUgsybQIPYjbMAZlnBmhs/LLPA3Trr2xdsSjF6kun8A4AsB8
 2F9AJO05YDiLwFWhJtjjpQulTte3IlQ6UzmXOXknHMbWvrNEYjnfaWdaW4wcEo10MImK
 H4ZTLlzTim7lP3r0HvdPxfPPcJm2pZc9voE0dkgdFOoqL2TGx2ty2rfL1vH95rcyLm59
 3ghmTEs466KpOdKW9xGdCVBUmh8S57fZWv7BEbHFSAV347r+mtUf7ZzsSCDkvLT7lnNT
 XGfjUL/RomVwb5Ao5l/vMYFqAkDIkjbnTiL73lBod4CtSy23ACH1lw3N+i4rZwUQ7ydg
 XzSQ==
X-Gm-Message-State: ACrzQf0yYyQHAPeSs0k4sFMD1hcZtbv77cJPBOm2CDtsR/MS0/8/nGGe
 1syi/lqNB3T/lyPQQaPVsN7eOA==
X-Google-Smtp-Source: AMsMyM638r8gzQZMR8CORrK9O03zbBgnd6gqJhp7ycsjV8TfmSVTN7UJj+OFIHVG8gJkH2fYp2m0xA==
X-Received: by 2002:a05:6000:22f:b0:236:4f8e:a913 with SMTP id
 l15-20020a056000022f00b002364f8ea913mr22270263wrz.240.1666860079283; 
 Thu, 27 Oct 2022 01:41:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d43d0000000b00236733f0f98sm524419wrr.107.2022.10.27.01.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:41:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61DFE1FFB7;
 Thu, 27 Oct 2022 09:41:18 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:40:20 +0100
In-reply-to: <20221015050750.4185-11-vikram.garhwal@amd.com>
Message-ID: <87fsf93bgx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add a new machine xenpv which creates a IOREQ server to register/connect =
with
> Xen Hypervisor.
>
<snip>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
<snip>
> +
> +static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
> +{
> +
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    mc->desc =3D "Xen Para-virtualized PC";
> +    mc->init =3D xen_arm_init;
> +    mc->max_cpus =3D 1;
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);

This needs #ifdef CONFIG_TPM because while doing --disable-tpm to try
and get the cross build working it then fails with:

../../hw/arm/xen_arm.c: In function =E2=80=98xen_arm_machine_class_init=E2=
=80=99:
../../hw/arm/xen_arm.c:148:48: error: =E2=80=98TYPE_TPM_TIS_SYSBUS=E2=80=99=
 undeclared (first use in this function)
  148 |     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
      |                                                ^~~~~~~~~~~~~~~~~~~
../../hw/arm/xen_arm.c:148:48: note: each undeclared identifier is reported=
 only once for each function it appears in

--=20
Alex Benn=C3=A9e

