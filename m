Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03576FF59B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:15:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px80I-0000OE-0m; Thu, 11 May 2023 11:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px80F-0000O2-81
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:14:48 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px809-0003RQ-DU
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:14:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315712406so290117235e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683818070; x=1686410070;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=T8uizldANfest+0xPaH+fedtHjrPcwmtYGs1UUecSX1Dy3n22dezKzuqlZ/u2tBVxB
 9cs6scQKPfS/TyKvNxqK+cl50dg+uR3T1OH1d8/qF7XjY9M6Y4u6IBHwRPm9Cx47V/vM
 xajwfe6P/DN3AYUbYgm90kUMHLAnTAX1ne6lPkm9P+uD38jMJRNTzo/9VI3r5S8MgAip
 9Z74ZnoS2AKYBZsRasX6ANqGnbdcGxNlCZsBWhWrKGKDY/dFtqWRj7DYJ+yvy+prH9Wz
 4mENGQdkE5fEZQCExcF5azH73hEMrsA/9+leyE/ZekQ8NDHqkd0YrRLFk22ouOcsVRDS
 2JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683818070; x=1686410070;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S70hy7hnAxt29XEEJxeHBbBUW/HBjwefMHzH1X/OuoM=;
 b=GSCn1POG/ICFoNND2Gw493rDlkm+YDKVKhA8WJOuCYzNMFKURaI3gcKAVWTczCfDPJ
 e8a85yP+zzA4cXTATG6Fu1aGNx2x3HFJHxKjDjUDp/4sF83rctTr7Sv2OXCLuxg+5stL
 1Ew3bGuKZYAOL6BxCU7Xk7RpQ3ewly9a9SKM86yPC+mCeGTBf5KdG6lfqE4i6KsQTCG1
 2BuXtiYFIMyTV3y1/3yGh4OKvwcLAjB9TV0G9mVSe1I/xkYMJpF3dGKHoSdkQM/mKuOS
 QBvJcbBu1Wbg6gyy92ZeEHlWnWDqomzckL/GN1BrLdiuv5vmM1xxIYE5oOPyKqCZJSxk
 KrzA==
X-Gm-Message-State: AC+VfDzaVptPXw6tDMuUW3jGvoiXiRi1440vuYZfB5SNG0vkEsJa1up3
 N/lFawnA21B0a7srUz/pSWg2jw==
X-Google-Smtp-Source: ACHHUZ4BUWKY7gdsXLC+HK4VNcDlT3EN8vJ5uSOTYP8S3U18OGe61CnYThlekXokdrdR4kQBpQvJrg==
X-Received: by 2002:a05:600c:468e:b0:3ee:93d2:c915 with SMTP id
 p14-20020a05600c468e00b003ee93d2c915mr14781730wmo.6.1683818069797; 
 Thu, 11 May 2023 08:14:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f42bb3a5adsm8148664wmc.4.2023.05.11.08.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:14:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B95AA1FFBB;
 Thu, 11 May 2023 16:14:28 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-2-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/84] tcg: Split out memory ops to tcg-op-ldst.c
Date: Thu, 11 May 2023 16:14:24 +0100
In-reply-to: <20230503072331.1747057-2-richard.henderson@linaro.org>
Message-ID: <87ttwi3nor.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

