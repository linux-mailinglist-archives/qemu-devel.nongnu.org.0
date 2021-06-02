Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE66398699
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:33:30 +0200 (CEST)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOBl-00006F-DK
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loOAf-0007sp-FW
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:32:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loOAc-0002fF-9R
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:32:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so3455569wmq.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lt+V/sE8w9pbsOJ4EY0Cp18YxEgnXbZgkDJHMAJBXCo=;
 b=ABvpNSnQx4qZrshNXVOD2pu1eBkcOcUlpHCYIC+1YfDPLoVTWd81TwzvUqugKDPooj
 N2PdQJYQM6kEJG9B2auxFoCr95jeF8zGJPJJIPzyiXlibl6Udgk593D+bx9epYQQyRK/
 GpupUCXm7WcIu5iQhCYRhJ7DgqcKM5nk9+r1+ckVdpClLs4fnY0Lv1Zh+v/KzpGZw6TN
 8/BYTmQ95+0/UqEk4S/aaJkPjXn4q0kvolpiZl/KaePah/xBc5GwBPjTJEDyQZkVMh0c
 R63JWVp+nkW54i1oeRzJ2cRx8SalCYyocCTkPOQFPwm+fS4LFYJHeRzqlfNa94j6/rq+
 wkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lt+V/sE8w9pbsOJ4EY0Cp18YxEgnXbZgkDJHMAJBXCo=;
 b=hG9EvOFdKSH61AWUD09G1CE5d3qB2naV3yi5K0Kb35b1gBFY/0NKlZlU84ZtXoWzqs
 31lVO+w0jZlHVjCY5Na5ceXnvfT1kz9m4dd+AKZAjQD4Xx/6I/EafRTxPNO8kArAuDCY
 Ki1UdWkW0Qal5QhKE1OVcJCl9CedvZXU3jPlvMnaTBZxqdS+C8e6L2FNRyC5TTZH63Fx
 ZTbiR51AWxBQKrsvte3iom53pFH/O+Ppasw7RsUGKLGS+Cc1Dc02h8G+IHR6qO1rb0NF
 QJdVyV5Ggi/KL7NwroozrNmmxjBqgWyfjXk31h/TSLeElaHJNYvyYCQn8x/eMSjzavLd
 NnaA==
X-Gm-Message-State: AOAM530rcLdPTwF2FuH1YPDPwFlVjLFYSIiATXpNeBg9bTiJ6ZgPWwFy
 Mwit06vjE2ZDTnxjrxuklTsI8g==
X-Google-Smtp-Source: ABdhPJxj2CeeNsH+Jhy09xqyYjtjoBgXzE3gYCi/AVXWb3xazD++v5xM0IVSmPQdOqEvB/a/vYdx1A==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr4590693wmg.24.1622629936758;
 Wed, 02 Jun 2021 03:32:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm2672006wmq.45.2021.06.02.03.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:32:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 287FD1FF7E;
 Wed,  2 Jun 2021 11:32:15 +0100 (BST)
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-12-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v7 11/27] tcg/tci: Use ffi for calls
Date: Wed, 02 Jun 2021 11:31:36 +0100
In-reply-to: <20210601150106.12761-12-richard.henderson@linaro.org>
Message-ID: <87bl8oblqo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This requires adjusting where arguments are stored.
> Place them on the stack at left-aligned positions.
> Adjust the stack frame to be at entirely positive offsets.
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

FWIW checkpatch is being anal about comment formatting:

--8<---------------cut here---------------start------------->8---
fixup! tcg/tci: Use ffi for calls

2 files changed, 16 insertions(+), 14 deletions(-)
tcg/tcg.c | 24 ++++++++++++------------
tcg/tci.c |  6 ++++--

modified   tcg/tcg.c
@@ -2148,18 +2148,18 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int na=
rgs, TCGTemp **args)
         }
=20
         if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
-           /*
-            * If stack grows up, then we will be placing successive
-            * arguments at lower addresses, which means we need to
-            * reverse the order compared to how we would normally
-            * treat either big or little-endian.  For those arguments
-            * that will wind up in registers, this still works for
-            * HPPA (the only current STACK_GROWSUP target) since the
-            * argument registers are *also* allocated in decreasing
-            * order.  If another such target is added, this logic may
-            * have to get more complicated to differentiate between
-            * stack arguments and register arguments.
-            */
+            /*
+             * If stack grows up, then we will be placing successive
+             * arguments at lower addresses, which means we need to
+             * reverse the order compared to how we would normally
+             * treat either big or little-endian.  For those arguments
+             * that will wind up in registers, this still works for
+             * HPPA (the only current STACK_GROWSUP target) since the
+             * argument registers are *also* allocated in decreasing
+             * order.  If another such target is added, this logic may
+             * have to get more complicated to differentiate between
+             * stack arguments and register arguments.
+             */
 #if defined(HOST_WORDS_BIGENDIAN) !=3D defined(TCG_TARGET_STACK_GROWSUP)
             op->args[pi++] =3D temp_arg(args[i] + 1);
             op->args[pi++] =3D temp_arg(args[i]);
modified   tcg/tci.c
@@ -26,8 +26,10 @@
 #include <ffi.h>
=20
=20
-/* Enable TCI assertions only when debugging TCG (and without NDEBUG defin=
ed).
- * Without assertions, the interpreter runs much faster. */
+/*
+ * Enable TCI assertions only when debugging TCG (and without NDEBUG defin=
ed).
+ * Without assertions, the interpreter runs much faster.
+ */
 #if defined(CONFIG_DEBUG_TCG)
 # define tci_assert(cond) assert(cond)
 #else
--8<---------------cut here---------------end--------------->8---

--=20
Alex Benn=C3=A9e

