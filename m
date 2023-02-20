Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B92469D0B1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:32:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU89e-000444-NU; Mon, 20 Feb 2023 10:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU89c-0003yt-AF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:32:36 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU89a-0006EB-Eh
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:32:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p3-20020a05600c358300b003e206711347so1174363wmq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxCOwaTXlU5hw8Un0dGIXLFtcBjHvMQErjiA2Pn6g/A=;
 b=HFlm0eWfhXJ16vNDK5MN2J0gTXsXJbSFoLjm+NrO6OOr+puDAVGfj9n2+brIjlQuBC
 Ooow9Sg+kOfSHJbLQUTFeIGTmy7nNWPliDsJPeO6h1Z4ofgN5IT7X3LhrO0n1lK8Vn01
 iGxzHRwruHz9RGkZngR2rak3Mu1gHH57LfnIBuMAMJYZ2Ehm7JrPuFzf3IfDt75LZNhh
 J7b4qRMrfrjYpCY6gk0WsOE2rnMsx0C1K3WPNrOPyjSliIKANFK8PZlo9Cq4MtPQq89F
 Gvy8ntvZoENe4n0aiqghULHTouHnX1HNbks5P+YNq3Ya/aLm28f87ALaMyXRS1yzwRmH
 bCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pxCOwaTXlU5hw8Un0dGIXLFtcBjHvMQErjiA2Pn6g/A=;
 b=qS0ciZ/7AqTFjqCjk62M8mOLnGBAkwMKUUOBQX6IpmPwJ5ZlbVxqb28OqcZiVwiiRU
 3peMAbyBC8+Kv7V0AOjB7Lr1yAeMxabCX1bvcFXEnOpPsWmjXGEjX2ahN/ObIAIjHk9i
 m/05jqwgMWiyJ3nTRH+oEk782v+M5pvEH+35Qg0WnCZjIj3KukC9Q2wEDPHJwVpTyQUo
 tFGRIedgE/GdfbL6RFmIsFK/DXP9QC59UGYblKXjMdKETHs6I54cxvDe7F66HSHQZHaN
 8pwGm7yzaaNlpskmtrBrMk5x/MFEzU0cjXOlpaStDOdm1CIn55iTBR8zDQd3/X38CCXA
 pPfA==
X-Gm-Message-State: AO0yUKVdJrvBAb7zNWVpM9yZtKOhLtBDI94DvTxlLbmx4cbyJP5YG0In
 4/0qxN3Ve+beHfCI59z5oaFDsdcuWtp1NrOs
X-Google-Smtp-Source: AK7set87p3+h6aJW2PToY68Z7QgnW8t7xJ2qHM4NHORnqYQRLsgG2XjVC8Kzmg/563jNKnd93LeEsQ==
X-Received: by 2002:a1c:4c14:0:b0:3de:1d31:1042 with SMTP id
 z20-20020a1c4c14000000b003de1d311042mr929124wmf.23.1676907152954; 
 Mon, 20 Feb 2023 07:32:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iz7-20020a05600c554700b003e203681b26sm13970706wmb.29.2023.02.20.07.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:32:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5919F1FFB7;
 Mon, 20 Feb 2023 15:32:32 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-6-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 5/8] hw/char/xilinx_uartlite: Open-code
 xilinx_uartlite_create()
Date: Mon, 20 Feb 2023 15:32:28 +0000
In-reply-to: <20230220115114.25237-6-philmd@linaro.org>
Message-ID: <87h6vgs67j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Open-code the single use of xilinx_uartlite_create().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

