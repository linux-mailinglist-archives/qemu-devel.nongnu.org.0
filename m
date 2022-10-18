Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA4A603050
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 17:55:56 +0200 (CEST)
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okowd-0003pL-AO
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 11:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okoeD-0004hi-1U
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:36:56 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okoeB-00017U-DY
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:36:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id t4so10968799wmj.5
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bFlFc8X439/VhJJCCaA21Jzvrmb0AmgfC//jl5NZFOQ=;
 b=hTiXXWERXdWp3qrMNyCZcHWneS0H6VyaDx/J3Z3mP5fcdK8z1WXq0g31ylWd3CfdF7
 yrGbb8Mz6/SlmCPfUEgjVk8O4BoVVMK3YJEmCYULVE45KJpkaSRtqyPn+On6oRkqoPrY
 gK/E9U9gZTH6exSZ3SLI3+eiZCgK7fsc2kAi9c5XtqHgovXBFb1b/s1prTsJvLyqMOXu
 rao0DHZPXi6VikA+k6XTKDjgL6CnoGwC2sEC8bSfpyRoYMGnZrQJsDOBUR9OfnbDk7rF
 OWr/6Km+Pre+DhciryjSz7jd9msgkAJJhi76XmIH6eDVRDUetrfVoz6fSNAgjFh44JEn
 K/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bFlFc8X439/VhJJCCaA21Jzvrmb0AmgfC//jl5NZFOQ=;
 b=DgQTyU6dR2LlolZHLb3e6AaB9qj0+lR6dY1p2c/V/uik3IBXZ4IP3ZRjSDgELrWbLA
 3KgzYlc9iqMzWbQt2aiebuJpRiDbL+C1EIaIHHoPNGtctQfstfZKoxCdT46pExm0PNaF
 QzXxz4G/3qsexZtxGNEzc1sJs2l3Fy5rCVk8zVNqnKKsyyPYo0lOGC0fRsm1L2fBPKey
 4QyAXSZg3loc+EwpRFiEv87CjQdzvl2snT7WL2og+KCsvqlwh7CvmQqJCn5d4ZRPvmZ4
 WXHweiCcVMPlS+nEzixqUnWl7Ksht45yh/JE0h0Q2RoIY0feAxho0T7SXN6I58PKBVpZ
 /T8Q==
X-Gm-Message-State: ACrzQf1M84zEjEJ8NtFH8EadCU+1J60FYycFgueuPn+tC+KWSFaHS3WA
 lR4BzkPx6aDIopt1arPUSySRrQ==
X-Google-Smtp-Source: AMsMyM56WjP2aemG7zSipEIcnWcrj44ZBTLDzyO1EkKPXiprGUA5fk6SwuzWH5wnnvSTN/T7yuhIuw==
X-Received: by 2002:a05:600c:b4e:b0:3c5:c61c:8e20 with SMTP id
 k14-20020a05600c0b4e00b003c5c61c8e20mr22426167wmr.103.1666107408368; 
 Tue, 18 Oct 2022 08:36:48 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg38-20020a05600c3ca600b003c6c182bef9sm24119828wmb.36.2022.10.18.08.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 08:36:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F92A1FFB7;
 Tue, 18 Oct 2022 16:36:47 +0100 (BST)
References: <20221014173508.222823-1-ani@anisinha.ca>
 <20221014173508.222823-11-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, John Snow
 <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 10/10] MAINTAINERS: add myself as the maintainer for
 acpi biosbits avocado tests
Date: Tue, 18 Oct 2022 16:36:42 +0100
In-reply-to: <20221014173508.222823-11-ani@anisinha.ca>
Message-ID: <871qr5cfe8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ani Sinha <ani@anisinha.ca> writes:

> I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS impleme=
ntation
> and all the related changes including fixes in biosbits software itself. =
Making
> myself as the maintainer for QEMU's biosbits related files and test scrip=
ts.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

