Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAFD60C77E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:07:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFmg-00062N-V3; Tue, 25 Oct 2022 04:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFeM-0000CS-Iy
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:51:15 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFeJ-0007up-BA
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:51:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id y16so9198730wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QnA0BpkOCpl9YyAeD7es+725onovI4WkUt7mdLGXVI=;
 b=CRV3+f+cmvggxvy1tFrdnO5pY5zBH+I7CgdteVpceXELIxBJxoUeZZVbu7II24vgvS
 mHR8L6KPUoz3O6IxS+MpDmve4WCM96jtHWJnj5bxzDwA2kmlCYBpj/Y+U3vDirB5Lx3U
 TDdgv3iG4/iQJccjX7x7+wRlzhXod/obXERHdoCC37Wi2L/XEuS8cNwzHi1SMYHIqIcV
 JhsgYUv8rSCpE1deJILj86ghSkeP+3wNYmy1UOhrIqecX8XiN2v4tnky2GlZgqusalhr
 mDfvJlHZcRHaNBR+1yWZ+FqTMNPdaxRHYAT4M//9KMwpMDrQPuKYVE8B8ADLJE62WSKR
 BzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9QnA0BpkOCpl9YyAeD7es+725onovI4WkUt7mdLGXVI=;
 b=AcSdjM2KRFhB7zHHnkdd9S/PTF0rddRs1SucFpzKntAL/adqrVqfBWhydwltFWvTBS
 PPVwglnxNLK4azKubEqrva9QMCjgxDEG+Dg2oPOSy8Pd/U1GGPDbGAhO6dFHMslzEMjT
 DJ3Z8SBQZbg9QiSCzBfBooxLlrW3pktiuRmDxtGAj8m1PsS/ug4PemCDilc6PYBk/f9+
 7yM7GW5yQBeCSdK8gLfqxf1QLrAFpgql6/XBYooyv0KSvwbVNhLCDFGZlT/wHYhzKhMd
 HYU9WOH71955IPPGB9LvLYWO0SbEMGEnMcMJ/LraReOC48S2TYmEKf8M3YG9tD/WZkex
 D/TQ==
X-Gm-Message-State: ACrzQf2e6ZkrEnOR8lCtZo/H3NklxbtoTnYTOeJHzXXgrI9Q69hngZdN
 2Z0NS+0dH88/S6utOUzsm1YN8g==
X-Google-Smtp-Source: AMsMyM4QwXUHMECGF0TPFiataP6rsn9UAMGujOQtdWuHcfZVlYrmUBNMx10zSgrHJ0BzSbZUxhTcUw==
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr24506889wrb.487.1666687860652; 
 Tue, 25 Oct 2022 01:51:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q63-20020a1c4342000000b003c43dc42b4dsm10303133wma.16.2022.10.25.01.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 01:51:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA0051FFB7;
 Tue, 25 Oct 2022 09:50:59 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-8-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 07/24] accel/tcg: Drop cpu_get_tb_cpu_state from
 TARGET_HAS_PRECISE_SMC
Date: Tue, 25 Oct 2022 09:50:55 +0100
In-reply-to: <20221006031113.1139454-8-richard.henderson@linaro.org>
Message-ID: <874jvs8ex8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> The results of the calls to cpu_get_tb_cpu_state,
> current_{pc,cs_base,flags}, are not used.
> In tb_invalidate_phys_page, use bool for current_tb_modified.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

