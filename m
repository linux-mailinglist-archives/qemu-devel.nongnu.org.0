Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB2069D0A6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:31:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU88c-0002HO-L8; Mon, 20 Feb 2023 10:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU88a-0002Fz-CU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:31:32 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pU88Y-0005rK-Mf
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:31:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so1372999wms.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0rm9W10Ug3TIvuMn8IKP2wCae1QCOx18uv3aZ9S80xQ=;
 b=tbMHUVMDSxHaiVoMbEYd7HRTGRzv8KF5Q4nL30C5/Bj46oxglsOEJr7j5DSPW13MYG
 YmkMW9Fs2jLaRrNSRyK6v5MvLhGfTm2gIuTSAJvIx4sgb8ACTj9cOvrtpI/W6XFKB+aI
 rMeGJE5vk3aiC6jdWB0u+39cg76cXX59QZWc9Ee6QaxtSEieyW5+Uk0GXCyAev1Iovs9
 1+FQuYJ4nksfTJnDNPVeLAC4OQ/WW6EBjXQK3E3y4m2Cz8aOTziiMNpaBAkM7WmjgC0H
 bCVOttxeEIwDA3iubrtunsOb9VcjiEtOpObhMcUYzWigzAjpsKuzsgVXj4gw8pBU5d8M
 sRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0rm9W10Ug3TIvuMn8IKP2wCae1QCOx18uv3aZ9S80xQ=;
 b=su7e+L4arbNc0ZIUrSffNGx2GWqXLSuEtFFrsTT9FG7b7ru3+cFjR4t2TB8GuI7w6F
 wRzoiOTouRsUyRUuVx5/vhEcM7P2DTiqIKvpjrruF33JyKWur2NzF0X11iy2JKntVUKy
 7JBC7nwL51mDo/eAhfUyiV6/iFYoDsNNO+WIqqOBmoPrrQ3Zwf1fAvBUmmfw7ezw7dWW
 ftBLiSE9WurLOe6iXhyII58V6tH9RZsIN0H6aqXsEK2LxLdxXT2JMsmJCAt3lVFtJiKK
 l90yq5wilrLXt2mXeaaHY1aQQT3NnJ4hiFQKlcXmomEvfOHK/8BlVMZTCo+lcIGjop34
 gqhw==
X-Gm-Message-State: AO0yUKVyuelInTxJNan84xTkFMLdymEgmfvMkJlLg9Nd3lgoRgy5kzgW
 K5pYOYDQC9Zz5KOxs2fAIVS6DA==
X-Google-Smtp-Source: AK7set8RDMPgKFhf6Dw0McsjS0fuSABsmagvuSjTY5H5nAGTUHLukkw8/fx5f6J17zfH5NeYZ6gQWA==
X-Received: by 2002:a05:600c:511b:b0:3e2:1a01:3a7c with SMTP id
 o27-20020a05600c511b00b003e21a013a7cmr909322wms.6.1676907088678; 
 Mon, 20 Feb 2023 07:31:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c231200b003e20fa01a86sm1025760wmo.13.2023.02.20.07.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 07:31:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12B7E1FFB7;
 Mon, 20 Feb 2023 15:31:28 +0000 (GMT)
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-4-philmd@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 3/8] hw/char/pl011: Open-code pl011_luminary_create()
Date: Mon, 20 Feb 2023 15:31:23 +0000
In-reply-to: <20230220115114.25237-4-philmd@linaro.org>
Message-ID: <87pma4s69b.fsf@linaro.org>
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> pl011_luminary_create() is only used for the Stellaris board,
> open-code it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

