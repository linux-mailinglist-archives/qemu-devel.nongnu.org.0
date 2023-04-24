Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37F36ED3D6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 19:45:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr0Ek-000418-Up; Mon, 24 Apr 2023 13:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pr0Eh-0003zn-Gd
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:44:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pr0Ee-0005e8-Tt
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 13:44:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso47596305e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682358259; x=1684950259;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyOEYZ/Mmw0unNyxxuujuOojy0uxahv3uE2nf6S2/0w=;
 b=mBIRt70YXtxOJXBC3Ms3gx1NpDcYSxh0pNdvtHa5E3mWtUjHZ7vRCKaZs5E+lhR5s9
 DD7Nj/qC7AwI7I60hPNNTQdRjKxJW+cyVHuvLiUT/Cs8dVLt++WdiJHiBVjrAGO272P1
 GrhbysncSHTA7Uxz3+3PyfFzqJ7BjsZ1Bbzwdu4fja+TkxFgJ9LTPXVYMjnRIjP7aE2R
 Ev5f4AxAvnaibsVjRwtHCaAtIYoGy5Jex6HAhJSvKYIO1en8Dncx+yrjqDdWCmHGu6rk
 Vej22UjM89BcxBvaMlLdS2Uwm/Z9/KAJce2covFqmUK964jZiZmkLRpvZ5Ycn3C3zFtY
 99YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682358259; x=1684950259;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dyOEYZ/Mmw0unNyxxuujuOojy0uxahv3uE2nf6S2/0w=;
 b=R/LkVKTaM3mPqoRYoOPfVp8OQ+yb/EhToVJrjpz12Cz7nktGk+6PeIebtudLCy3W63
 kPsg3aqMDm56TywInKkwtjHRDIStW3izNqAi0iAKA7nzwrnCLIGZbrjtxxk3YujK4XBD
 tyBUXbmU5yimluo8Jn/g6bGK9gsk2fNTHwRIeruoBk/etvQfTiZLy+EmDOMS1aiq0pg4
 WhMKqkZaz9g22hVAdBEhdblGGHpvDn7Q4rmTu3/Q/D5bp2M6QIF919VhbXJjpsS81mPj
 Di57rIB+rnKvgy0JWrjyeQ+pQBw/+s/qBJH2BTuwhgF4yAE1DOqb5HS5gRwmNalPK9ga
 f1kQ==
X-Gm-Message-State: AAQBX9dkb+5Q7CLIkm2Y2s45iMDNPtoKhzHIAQ7g6wL9uVfBobz/G/hH
 sJ6zUjBLiNl6MHNTHFF//S224Q==
X-Google-Smtp-Source: AKy350YYmy+tiFbeNRTH+3q38lK5q/hP4KSgBSryTE27130SR1JiBmE9GgAD9wIzEnCg8hI36sgSqg==
X-Received: by 2002:a7b:cd02:0:b0:3ef:d8c6:4bc0 with SMTP id
 f2-20020a7bcd02000000b003efd8c64bc0mr7875504wmj.40.1682358259150; 
 Mon, 24 Apr 2023 10:44:19 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002ff1751ec79sm11194778wrm.65.2023.04.24.10.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 10:44:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BD091FFB7;
 Mon, 24 Apr 2023 18:44:18 +0100 (BST)
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-3-peter.maydell@linaro.org>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 qemu-stable@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/2] hw/net/allwinner-sun8i-emac: Correctly byteswap
 descriptor fields
Date: Mon, 24 Apr 2023 18:44:05 +0100
In-reply-to: <20230424165053.1428857-3-peter.maydell@linaro.org>
Message-ID: <877cu19nv1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Peter Maydell <peter.maydell@linaro.org> writes:

> In allwinner-sun8i-emac we just read directly from guest memory into
> a host FrameDescriptor struct and back.  This only works on
> little-endian hosts.  Reading and writing of descriptors is already
> abstracted into functions; make those functions also handle the
> byte-swapping so that TransferDescriptor structs as seen by the rest
> of the code are always in host-order, and fix two places that were
> doing ad-hoc descriptor reading without using the functions.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

