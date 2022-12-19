Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E5651024
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 17:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7IqE-0005Fb-Gb; Mon, 19 Dec 2022 11:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Iq3-0005FT-Hh
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:18:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Iq1-0005sU-Cv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 11:18:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id o15so6784035wmr.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 08:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swjpQG6LNHdyhVJLQndpH8jIHbQo1OE6jyUH8tZRfK0=;
 b=t8QHsVeK1aXs/iRGwz7PGzIv26GXuTXmh1dB2BVPR0LSgxCy0sTm9jp22yu8tzq7k9
 KBmeXL4JTZnuSQiVUH2HUjcOpaMtODc03B51kPzPezIBAtnfoDrEpDxfPRxtX7vdGhkS
 47YIVSrMBjhX8gi7LlHFFRMmYLZQqAHx04yjctXuTWuFalV5Fnsg+VKiDm15oz6N8Ji5
 DwtUoBoHHRBeOZeXg/BnE9wXE91+8zvZwlJDS83P7cTnA2egheFv7wmRuopUflKDophF
 ZFQyaYErs5tHsm6LKWOsVOe5poBIxY9VcqbUHWfdYiLRhhFxA/JssUF4qqxYRi3tBSUa
 ZO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=swjpQG6LNHdyhVJLQndpH8jIHbQo1OE6jyUH8tZRfK0=;
 b=aJhm6Z/1g0mup5l6YtZUkNV6VBipjIq/XI9YLTLjmGULKE+J4cWjCHLskt1VCJi+T3
 I70+ologmkAAeRQBmG8Z1F7OTbPH6yVkpIeMpS11doeZD9oRRwTVw94XJ/fCFP6dAxYg
 XY8ExrMhkaJgsI1ssdzfEtV24Ro6CJ3JGNchY4OQ91RGt+cM1aauGUJVwR6WyP2v4Xam
 4qbRLuJSaYut8DcgMsJslHJlQUYmgNDjQRg0vmizlPb18ZBMSww7JcdwcfsZSrDCm666
 niw4CA13/NvlyKjFeqT6W18i+TebMhM/FBnx7Eh+pO/5N5i/ewrcL3U9EvsqFifdnhz4
 CMIA==
X-Gm-Message-State: ANoB5pmWiC0WHwFTLsljSB/jj/hILVgbH+9A09S+yAjSrZiGfTb8p+cZ
 QqeBLZpMvrpetsHCKKAtSEUm9jvEESDM8c94
X-Google-Smtp-Source: AA0mqf47Pof7aMNvzBLlA4BGfwSV8c/K3XS54cuuh5FuYLzUwWZ+iO9dRATkZLfFCbVMeG9OAJTfEA==
X-Received: by 2002:a05:600c:4fc3:b0:3d2:2fa9:cffa with SMTP id
 o3-20020a05600c4fc300b003d22fa9cffamr18989216wmq.25.1671466679813; 
 Mon, 19 Dec 2022 08:17:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003c5571c27a1sm15023558wmr.32.2022.12.19.08.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 08:17:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30C8E1FFB7;
 Mon, 19 Dec 2022 16:17:59 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 03/27] tcg: Remove check_regs
Date: Mon, 19 Dec 2022 16:17:55 +0000
In-reply-to: <20221213212541.1820840-4-richard.henderson@linaro.org>
Message-ID: <87pmcfjrk8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> We now check the consistency of reg_to_temp[] with each update,
> so the utility of checking consistency at the end of each
> opcode is minimal.  In addition, the form of this check is
> quite expensive, consuming 10% of a checking-enabled build.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

