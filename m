Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419BB67EBF2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLS9M-0005vG-4v; Fri, 27 Jan 2023 12:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLS9A-0005tT-7R
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:04:16 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pLS98-0001lC-8u
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:04:15 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso3948681wms.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wa+HL4RrjY5zzq60G4Cx42RkGD1iNGLqyyLUG5y9vFQ=;
 b=ETEcz/cH3KJlBEjQkCiT88FRJE4dF+RhQV5TzdecgGjczrSj9VtVi6rzweTDoSSVzX
 eRIeBsTc8es2MuXtDwRRNE0rL3+ojnZolpUl7PsUtwbOhdMOkn7NBSP+W/dE4MJ3xPj3
 /OIFC2DdWA5MH7GOBMU1UYFBXQxm6NaDEcVXyIIN1UgwyyooVhJvsaBkh8QaIUEuBE/4
 vfARNaoYe2oVQbWa/WerJlpNQCakN402YvLop6FBdAerOFwlhs/JAeRZ3XfcbYvCOLLo
 qTpt54kfVKnBDhh/QpnAo+DioFoO1Bvh3VE7kbbsSl2YeJbo4HGv5v0Ups2PVvyi235X
 5g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wa+HL4RrjY5zzq60G4Cx42RkGD1iNGLqyyLUG5y9vFQ=;
 b=T0TamdDuii5Nxi6z88BmGGnSJn8etg9Ne1A80s9+GJKTZWKix9Qd4xBGI8Kl+XLOIR
 QqSGTMetNExwpgsHKqGQNIlBrpR8Hxe8Sr6Xry8yeGV5F1Ig39IY71tDJuhAwask6snL
 dBwg0UucgZP42A8GrYbE7iynGVkncR9hpwyh9i3tbTdFnrm1bUkSSSPi40mt30X8EZ9A
 9OwHQ/FnIUK85ChlX/+uqzNYfZdVddUgcmtllDsICfj1SLOpYabNMpkZrSnYDUn4y3IS
 IyZh3Hsp8+dDsmP+hzXc3bNoxBDx168jPPjCzVWJptsJeIC7C6soM2mNcJJjxJiG22t+
 zPfA==
X-Gm-Message-State: AFqh2ko52jUvGOdRslQd4/ZWxSGVfcFws3OkAp4FwAnITSidh/okcpP3
 widM/A+itrxxlMKy/2N/CQjUAA==
X-Google-Smtp-Source: AMrXdXu5y/lzVfChBDQg5KthxTU5ZW6B9l0Qv7IN6tR8wODObOlNrysUOBTUMmqIYuhM09SBmnp/dw==
X-Received: by 2002:a05:600c:1c8b:b0:3d9:f492:f25f with SMTP id
 k11-20020a05600c1c8b00b003d9f492f25fmr39446581wms.16.1674839049760; 
 Fri, 27 Jan 2023 09:04:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4445282wro.6.2023.01.27.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:04:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D06F51FFB7;
 Fri, 27 Jan 2023 17:04:08 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-13-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 12/36] tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
Date: Fri, 27 Jan 2023 17:04:02 +0000
In-reply-to: <20230126043824.54819-13-richard.henderson@linaro.org>
Message-ID: <87edrfoqnr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> Fill in the parameters for the host ABI for Int128 for
> those backends which require no extra modification.
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

