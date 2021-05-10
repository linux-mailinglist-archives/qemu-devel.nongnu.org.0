Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F36379256
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:16:50 +0200 (CEST)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7eL-0004hi-D5
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg7cE-0003fr-8X
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:14:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg7cC-0002O3-P9
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:14:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p14-20020a05600c358eb029015c01f207d7so3378580wmq.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+GcpU/VQx2CmILKkj8SKkY66fmQSArw+6hpkoPTo7q8=;
 b=RiZjYTdWDaCqBqUg1YK1NBX8wBoedv2rLQ6Ja6sOsM1VuoaCGn0mu0OvYwg3GWVJnG
 7+EG9ZNVkhb6qFsFKC/mUqIJ8abtn8Xd1dqbqYtGtochDE+6aK/0SVEsYn0pQVDCDJE6
 0UbavbLUPXVRE68pIG9NJzHdvKy8q0kHPlkBZvYkry85+YCZi78lRFHKOR4M8AVHGLhS
 pjGH7GZSQP8m3KdgCyQHN+s0QHDqWkbM23kkHpp1sqsPYIdOZ7Iw0ROatp8O2LHVXtfB
 w7GNXglJSYOXQ9m5gSqEvOG/pnru0XSAzHt6LaCJT+/kAZijc0IuyZOZ0w2Kht6JLPl1
 lyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+GcpU/VQx2CmILKkj8SKkY66fmQSArw+6hpkoPTo7q8=;
 b=GP0+/iyLziJFdVCCpNdgaO6DxttIJrWzw1gTSq4cXkF8MclYeTzx/T9Rj+7gInztvt
 4BIuHXrm/pOu9CKO3+Id2PqfIGy2Gdu4TBIDgpGNWxqQMwJI7gkMKSXZYY31/8gecdFF
 rEYlYuPtXgXtBIIaZTgqa6xO3tTNtxz7q1Uf3/AJLJGNQ7X+IBDGrnAWN2wGlopB2iru
 984cdOdAvluRKSplmgntCJLGjJlBvl5bQTY6wimsqo4wDkb43LMWsDcpnwmDJLmfnzNY
 xXYYcn5qoM74NFG1NLpxRVa4aJN4cajf4YNlH7VQ86JZNvCqocxvxxhCSnOyo/b2eDmN
 shfQ==
X-Gm-Message-State: AOAM533wLyg2+JJ/x7Iv5b6g2534qCaBUYZXpv7ixlouHXeRguQFIoUf
 V1lUEowNHoA78BxABYNMc/DpNA==
X-Google-Smtp-Source: ABdhPJx6GdOpqm5ANhoBGasTMTlcBuirZ/hAJDzchGiFxOF85Pk1tLPCbSJM9dek6OvCRWhwHH7GGg==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr37848134wml.55.1620659675060; 
 Mon, 10 May 2021 08:14:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p17sm23577393wru.1.2021.05.10.08.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:14:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84E361FF7E;
 Mon, 10 May 2021 16:14:33 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-13-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 12/72] softfloat: fix return_nan vs default_nan_mode
Date: Mon, 10 May 2021 16:12:41 +0100
In-reply-to: <20210508014802.892561-13-richard.henderson@linaro.org>
Message-ID: <875yzqy61y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not call parts_silence_nan when default_nan_mode is in
> effect.  This will avoid an assert in a later patch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

