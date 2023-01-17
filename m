Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A480266E577
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:58:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqDv-0000N4-6X; Tue, 17 Jan 2023 12:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqDt-0000Mb-Ej
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:58:13 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqDr-0006cb-Tc
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:58:13 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso181860wmb.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5SmBdkkGd757wrDDwOB9JWl/RvULh8e6JfuVlWsBms=;
 b=KDkagKPzFYsPQpIGS/IPoVEtfsFL9VnooEI+w6vOnLyNwsVg4fKNrK4G+jpHHI5FOs
 jck1X0LuTSr116hca5ab6TnjUye/Zb2NG5EbvaigPXUrS5FSG5Qr9ewtCK/164Po5Owx
 VZ+dNBmMiyszKschRjR5BqB0SqhQYsJKs/9rEbeKtyHq6P+Dl5q46gS+rWljhKp6WIfc
 wLn/c2m8EUDoyYQdi6Q10KPAEeeC609wevfdKmhb0HHtyAA+AybHxy5S+yqJR0t3PVVB
 gFdewvJHkFUL3RvUxnH+gfeQ9AW9NrQ8BZ0Wba3Zs8EP+sE+eBL0jy0jBe2KKabhbd5Q
 i88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P5SmBdkkGd757wrDDwOB9JWl/RvULh8e6JfuVlWsBms=;
 b=sTRM7cSZ+eSwi4ogkw2+ObFEj/vd8YVlF8DseRAPdnuDchT5Dv21fp3a0mRrvNmhab
 hpCFklOhOBsxXHOvw9+GVMTuVmMST73+PSoE2FCG5/mdMAmbe9PQ3ZozHWFrzDe+2JB0
 1Na9rpkFhpsJib3oBgyCSMZbZnPboJgXm604LcPvlUOts3bhGgwoKYnHc86G1YsMnV46
 HYkWNvV2fbd80LH4Nm6pRd+gJVB50Mzv+D0RPaw79bgIf2AXLLNiVAuwW8P3NmXLHRQf
 65uxshpqxDfAiAspqggmyiygbX9qiSA3uq7QlFL96cioAHOjz5oayVfvM9QyI5gpFJGp
 pj8w==
X-Gm-Message-State: AFqh2krOucY8ozoiT8+bt6fUYYwtbAYMxtUdPFRduj96hI+eIaasafdT
 T/vM4+uupTPR1/LdflNIBB73o3seht/Vhclq
X-Google-Smtp-Source: AMrXdXu9+yL1mT9IccAuyrW608+yVzUpRGcawwk3DwqBm+fO244m5+GT0leuOOUv8yrqTDHuCyPuHw==
X-Received: by 2002:a05:600c:c85:b0:3d7:72e3:f437 with SMTP id
 fj5-20020a05600c0c8500b003d772e3f437mr4011315wmb.21.1673978290370; 
 Tue, 17 Jan 2023 09:58:10 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a7bc055000000b003d9aa76dc6asm49518999wmc.0.2023.01.17.09.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:58:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 891EA1FFB7;
 Tue, 17 Jan 2023 17:58:09 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-11-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 10/22] tcg: Add gen_tb to TCGContext
Date: Tue, 17 Jan 2023 17:58:05 +0000
In-reply-to: <20230109014248.2894281-11-richard.henderson@linaro.org>
Message-ID: <87k01l2gcu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> This can replace four other variables that are references
> into the TranslationBlock structure.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

