Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B17E475876
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:11:16 +0100 (CET)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxT7r-0006JK-LP
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxSdu-0002NR-AO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:40:19 -0500
Received: from [2a00:1450:4864:20::434] (port=46658
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxSdr-0001TU-Qw
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:40:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id i22so7863855wrb.13
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+KUaozHLUvU+YeVT21SWfKKvnMlisBchjGqjbYG/Zjg=;
 b=Rix3SHyr2R+Ii6IxLDisctDxPfYTjQj0ACDzLA/0rvy/lJZwpZr4W916EOtXOWt4ux
 QempJfKoZPvHFe60u5IoAbKIhlJxFx+jDwK8zhQ8PT5RAD5dVIhwASkjN80F15pJ4fET
 0T+K/orDdMDwMWs3kcdm/nRXUTqq6hzV25B6eRQDRQAdsJGv1+4Q+B6G2Qta0JGETj20
 Vk+r5C+oeidS+nT2XAMh+6rjcD7ppru5L66Znw1mYkpK0LuVM9SleNlQ9xfju41lH3bo
 IWaaYPypUzsQG17PwWiczjvGvuCZrfOdmjCgPbcxpSEm7iAEDgvVeSAY9AP/Y6R5hXDj
 DhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+KUaozHLUvU+YeVT21SWfKKvnMlisBchjGqjbYG/Zjg=;
 b=ZScQ3U9O7fkwfywV3Qbch77dnPHFfFs9we4asZ039US2/3X07JCyVvNZmwz4bGSMRP
 q+YpBK0q9PevtXr2fz/91G9ETCnQ8oEfSa/J2P7Gm94e8Hq4jHdA7Nen0R1I7locUheS
 NMCwuTDXx+vUiPg4j8NOEOB5vuHwdTO5RrsZwIFlAvskgY2wrWL94cA83hugedl3Qlr6
 iNe0lIVnrWC7xTZ6n8yKfbJviDfhNWKU8sX2qO0uq0xUscFESETRvjaJ39of1c2FO5UH
 lKqHNgkTjbCu+fj/OI8w3hFrS+4BFvM27nk4LdPlMmYYJVU3rXverQc4Wm0t8UIWgh2b
 vQQg==
X-Gm-Message-State: AOAM533KeW7rwG3jUmcaXE2VUoMXAaEpT+AGDlFeJq+SGvqosOX5h8wP
 oDDxBLHIRxkhlQAODBS/gOgdIQ==
X-Google-Smtp-Source: ABdhPJwDr67/e2O3lQ+p40AfPkj/+669PtuLy8tpJlOaUG1iD/ucc8CtqzLOv+3iiIx4HNOwX1r9WQ==
X-Received: by 2002:a05:6000:110a:: with SMTP id
 z10mr4178124wrw.396.1639568413305; 
 Wed, 15 Dec 2021 03:40:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm1681942wrr.65.2021.12.15.03.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 03:40:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8C731FF96;
 Wed, 15 Dec 2021 11:40:11 +0000 (GMT)
References: <20211215084958.185214-1-thuth@redhat.com>
 <fb033cf6-ab9b-3f85-e95d-0093715de48f@amsat.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Date: Wed, 15 Dec 2021 11:39:06 +0000
In-reply-to: <fb033cf6-ab9b-3f85-e95d-0093715de48f@amsat.org>
Message-ID: <878rwmgkpw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 12/15/21 09:49, Thomas Huth wrote:
>> It's likely broken, and nobody cared for picking it up again
>> during the deprecation phase, so let's remove this now.
>>=20
>> Since this is the last entry in deprecated_targets_list, remove
>> the related code in the configure script, too.
>
> Can we keep that part to keep the gate open to deprecate more
> targets / features?

I'm agnostic about it because it is essentially dead code so can
silently bit-rot. We can always resurrect the code from CI later if we
need to but I suspect future deprecation should be handled in meson?

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

