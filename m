Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2151B4E5782
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:29:34 +0100 (CET)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4nd-0006L0-6D
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:29:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX4gE-0001Uf-RV
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:21:55 -0400
Received: from [2a00:1450:4864:20::636] (port=43931
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX4gC-00072w-9e
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:21:54 -0400
Received: by mail-ej1-x636.google.com with SMTP id d10so4211283eje.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KrmpP4HlcXEr2d4/dEiciNJi4N7ZSDHoIGWUfG0Es9I=;
 b=nrmzAOmDBDFARLrjv35B+zUWgJBPd0Jit8QgREzYWRT234/iPfmqxFPngM+MMilXCQ
 O3mB3U6h/G0ICbnBLl/yLk7xQkufWXmNpn/faUbUOWXmPeABX8FapqlePGdPS9Y+R3Z1
 Er+UaHtaKlLiYtASbhfPWpozGRCoFgjDDUaa5DiK/eDpuF46EabwhPN2XSHxLDXy2qbv
 Ls7TylNFKrRp65Sx3jCgn81ohs3c4Ksy+Qb1ErTIkSxzDKjqdBL2qMW6QuDUbKK6ACP/
 YXotIcPGc0YnR5f1X+GKHq4y1PygZ6liQO4+jSNl8qC6N4swDUhbp92ZNMsf58ISUpcK
 hAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KrmpP4HlcXEr2d4/dEiciNJi4N7ZSDHoIGWUfG0Es9I=;
 b=3IU+MQ6GVKIYkqgEcY3ciQrcGxzZqwHQpsulZK5EK/sRV9UIuot7HBVh/LYDIsf77a
 8ovaFI8zzQwGHEUJuvF3RJi5qXr7A4P9KBHA3+YyZ4GOpaH3bpYkKRtUAKdimzNUjxKa
 2eZi8a0vPuO9GO+aEtLONce76qsq8g+YkvzVU6VPm3Q82yiZL5Np0xFLjytLbquYB3lo
 LZ36IjzGH51GOOgbWqnfyBi721DRyD7KgfPCwubtJ2e5cuUB2RfVYA0P0QGdpS/f20WB
 W7/f+VY5RY9C2QARQUM8MjEBGq4rLnsX5SQB9AbdSfNXLSDI6wJdnXeXvIem2+CzDa4t
 cnLg==
X-Gm-Message-State: AOAM531W+R6w7Hw91zHQX/GVgQP3PVhsfGz9a7z/5ZvV35O8womBEU9C
 54cb9TN3C5vXJtjn3aZKuL5gNw==
X-Google-Smtp-Source: ABdhPJwVvPdIya5eXZ8z789V8imM198+GcZauyoDeY99DRBdD24Gur4p32uxyqi9HzmYTlog7vESMQ==
X-Received: by 2002:a17:906:a08b:b0:6cf:65bc:e7de with SMTP id
 q11-20020a170906a08b00b006cf65bce7demr1217769ejy.220.1648056110134; 
 Wed, 23 Mar 2022 10:21:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 da19-20020a056402177300b00413583e0996sm244663edb.14.2022.03.23.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:21:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CD5B1FFB7;
 Wed, 23 Mar 2022 17:21:47 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 07/36] hw/xen: Split out xen_pv_output_msg
Date: Wed, 23 Mar 2022 17:19:46 +0000
In-reply-to: <20220320171135.2704502-8-richard.henderson@linaro.org>
Message-ID: <87ee2s4mac.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not replicate the individual logging statements.
> Use qemu_log_lock/unlock instead of qemu_log directly.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I don't know why Xen wants to have it's own special handling for errors.
It seems a lot of the xen_pv_printf's of level 0 should probably be
using qemu's report_err infrastructure. But this change itself seems
sane:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

