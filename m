Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2C44DB08
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:18:30 +0100 (CET)
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDiX-0006sj-B4
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDga-0005W2-Gg
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:16:31 -0500
Received: from [2a00:1450:4864:20::429] (port=36734
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDgZ-0002tW-16
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:16:28 -0500
Received: by mail-wr1-x429.google.com with SMTP id s13so11002321wrb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jEKRUxlJ+6aLqXJR2iEGZlItiFsE+G1HoCcl0IPhv5Q=;
 b=hSr6k9ylVyfsaNuvbjbQLNCUOhmZH5AhmBFfiHJzMHGa9FnqZLLgsRZ8wAAXMeTKyF
 PVNcnhRr5PKo+4PA544G2RIHCgQOtW9MEYI874BKLt7NxhvXhw4Spi1uCz08ul8G0kaC
 yrTQHg4A8QxzCukkX7NgljJHDWB78c+mk5J1L7jEcvmOGaOLt04UpfLEDZA1DSfGaR38
 r5Rx2TEYae3wG4g/pGoIG3YMI/XQdQ0MEgyzIQS0IT59xAegFPdbXZHfYxtr4NNnZ6Tc
 D9FHQs0kOfXv0eJBLuFuY0a43H19CyqM13O4xC48UKIDrOXHSUbKy3hGokcc7/ncdgBL
 TWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jEKRUxlJ+6aLqXJR2iEGZlItiFsE+G1HoCcl0IPhv5Q=;
 b=6G+R7hdFUIZddkyDXmDfyHkkcxJ+R7XFzql18pjDZ9NZleuI0tAeiD5fvXtToritsl
 hiuK9lFBGHPJcf5ODQf59K6+R6jxELs1bqmQGnV03hNkLhSAJjId38UQK4zWvUCz6B/Z
 s8HBu+l5025vxZp2mlD1UD1hIy1DDrq4DZty0iGMSSEjYW/3uqfXVaX7jtBaN5TdeKjX
 Yg1V1iraYDqd/U9W5iSEcKRstzv4QETrRu8d6RC9De45cnu/QOCKWNQLtyTL/aRY2dfP
 prdu6/z2KCs+BcMDniiCzhc7mwCxg9HZv2WrpIMVIsHKpOyeshz61ifRN4ugHf7SbKa8
 ntHA==
X-Gm-Message-State: AOAM530iD25uAshEiNCKnay7Soer3qVdZ0I4SiWHHG44VmmRUVRMrAkq
 kkk5cs/2e0+577Uw2UQb33hHzS52v6OcMA==
X-Google-Smtp-Source: ABdhPJyfu2g6b+R+hCoZpER9Db3qgpH5tMy8CT7DZo9HrbanRJc24YQonCr7FpiIq+B78P/GWKOk8w==
X-Received: by 2002:adf:ea90:: with SMTP id s16mr10693556wrm.288.1636650984298; 
 Thu, 11 Nov 2021 09:16:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o4sm11813432wmq.31.2021.11.11.09.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:16:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8790D1FF96;
 Thu, 11 Nov 2021 17:16:22 +0000 (GMT)
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-5-pbonzini@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/5] gdbstub, kvm: let KVM report supported singlestep
 flags
Date: Thu, 11 Nov 2021 17:14:30 +0000
In-reply-to: <20211111110604.207376-5-pbonzini@redhat.com>
Message-ID: <874k8iipeh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cohuck@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> From: Maxim Levitsky <mlevitsk@redhat.com>
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [Extracted from Maxim's patch into a separate commit. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

