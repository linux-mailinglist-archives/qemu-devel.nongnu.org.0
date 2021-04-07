Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB43572F4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:19:19 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBpm-0001FZ-KF
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUBnT-0007Fh-D7
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:16:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUBnP-0006fH-HF
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:16:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id x15so9581296wrq.3
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 10:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4TOhjxRjq/xGPXIKxMJ7SHnexUTLVo2dPpz1KI6jQa0=;
 b=T15fiUOxUIxvipIk4iDy8WvbBA9pSYleRtwRBfUb5+DsJDEoYI7Z+wNAEQTxRW6qg2
 BsYlg/lHBrYbZR2MvVbBHo3265BUNlRMD528p3QzNoIoVIFryUjkt1iPkZMNEBiAkiOC
 a6Bm+ktWBlPQCnlOBEFqxcSPLKm8XGRIMztn3tdY1dDzZNNWMKfycnweey3ryFbE9kCh
 DI+ttzwVnWJHzqTE8RmVgcXxc01w3ZX0IzPKgUC3v6QcyLc/HGoufhK/xJtxt8Kbgp4E
 /wX653su2EMzN1bc9MhBKdg0Yl2+s0A4khRtyQvD7G4xCT2yLuRCzku6W3JMNd6Kojgf
 o6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4TOhjxRjq/xGPXIKxMJ7SHnexUTLVo2dPpz1KI6jQa0=;
 b=qr5gltKIt7QH33+7efBo8drIaX8J4/joAgSkylyC7ak8cw8Uo2DxRW3VwOFszYq9bP
 yQyaizDp23bAUmZq2FzWXoIS4DtgF5yXvmXHds/exrU2B7i8u9wW+C/Oe7jAtithZyuJ
 saz5DqugdCcNmwVdzbiKW7EYiw+xkTSTV2/zcUquyjfXZxo0lDjYVEhD2LmzpV0DYh9I
 i0miZXpqrCvScMFqt/ChY6zv5HMeEU2aTSGs48sgxid0lax6FP2PoAQ+Cxc4HFoYU6Px
 JBivzXoVwg1D7omnV/jF3fsqKsMnzRg7ZjmaBT1pcYQBgjAlpn0CoFVPmlIoKz+3n1K3
 2ulA==
X-Gm-Message-State: AOAM531Z1VsPXvP3xI5Cx93/ay1FwHNWiKPZo9baF0Tq2ZUyO2TEAd2y
 45iC5QFcmkXAr4+jReUWXoWPNw==
X-Google-Smtp-Source: ABdhPJwVG9fU5LNmS43MAGaLRK9/ngzRlsrcaCaUYfgq9K3+6wlErHOQgUSoMY9J+HF8cte/YDzLKA==
X-Received: by 2002:adf:9243:: with SMTP id 61mr5565963wrj.11.1617815809950;
 Wed, 07 Apr 2021 10:16:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s5sm25177186wrw.2.2021.04.07.10.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 10:16:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 318F01FF7E;
 Wed,  7 Apr 2021 18:16:48 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-13-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 12/12] exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
Date: Wed, 07 Apr 2021 18:16:32 +0100
In-reply-to: <20210406174031.64299-13-richard.henderson@linaro.org>
Message-ID: <87ft02ui9r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Unfortuately, the elements of PAGE_* were not in numerical
> order and so PAGE_ANON was added to an "unused" bit.
> As an arbitrary choice, move PAGE_TARGET_{1,2} together.
>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Fixes: 26bab757d41b ("linux-user: Introduce PAGE_ANON")
> Buglink: https://bugs.launchpad.net/bugs/1922617
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

