Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C065112E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7JrC-0002FE-8H; Mon, 19 Dec 2022 12:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7JrA-0002DW-7U
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:23:16 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Jr8-0003FI-OK
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:23:15 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h11so9346979wrw.13
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tO3aIVvtNgy9QCqW+vni+o793f7Ag/E0G52cKnKsAxg=;
 b=RgM9fvurSrBOsyuvZjLFAKybbsMsDc48JX0nmWE16aqtS3h/UhUXVCPn6167x3y11O
 kRVz8vyW5m8L/s/OvvSM2XMs5Bvpd+yqAgLqI0lEydhbhj6cHFoHLVNNxvbmMFOt/1d7
 epkjoT2nLzIIErSLzD/bNey9NsHXJOyqZodiQTEs2FU+aqa2OHA6SwNwEUyVIeZ/tDLU
 83IJny+9YUsf2ZDVVNelFTAK+YidvyoFtnjmON/Xsk30afQ3r7yFtdfr/DyxrBUJKXK7
 SGfeGHoK1j7OTmzC1m3D+cCaVtSmXgAHVwUWAFuJZzaAM67bencYVw9/1W4Rdw8Pcqq8
 t4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tO3aIVvtNgy9QCqW+vni+o793f7Ag/E0G52cKnKsAxg=;
 b=TQCKJutE+tar+kPtVbdBdt0p3spJjYMto8wNeCBaUYv53jdaNX5wwKuCFztiACgkh1
 1m32JBigILKGWj/y9ddf7XTSGVTv7S3ZY5ZduP3mhC9duzxSXuWaQQrpkTNkXC5buZT7
 A8jbvMlguxOIbhXpyvEDYhx+h/AVGcxbaLKgnNOZT3tMAQcKI2HhGvJPoTp5pUILJAwM
 5AB1tn6Y8PxCdTO7A7wOOU3Up3JcAwNItEfM20ZzUMPziOFZfMZL/64iBHw80tnVKo8n
 tasqNBgw4JbTB4s/Klea/dPAZV5YoclBak0B8WSlFscH/TvHUkHYnxbaNVw0ly5vK/Ar
 847Q==
X-Gm-Message-State: ANoB5pnVuOeoppafMj3EgX2FBwgfWCQLfXaf2f0BydKYSJg4mocouJHg
 8dgHbVC0/QEnWlPbCWNSf8DODn18wUYhifCv
X-Google-Smtp-Source: AA0mqf5/zauvSIG+tlOzrNv8IsJXc5GJhNyFLe55FaXYsuniGy5zrt7ZhVhBKZCh2DG5+Z/FLrORmQ==
X-Received: by 2002:a5d:54ce:0:b0:242:4f8:78ee with SMTP id
 x14-20020a5d54ce000000b0024204f878eemr25361332wrv.53.1671470593086; 
 Mon, 19 Dec 2022 09:23:13 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 co26-20020a0560000a1a00b0023677081f3asm10492136wrb.42.2022.12.19.09.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:23:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 522651FFB7;
 Mon, 19 Dec 2022 17:23:12 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-14-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 13/27] tcg: Introduce TCGCallReturnKind and
 TCGCallArgumentKind
Date: Mon, 19 Dec 2022 17:23:06 +0000
In-reply-to: <20221213212541.1820840-14-richard.henderson@linaro.org>
Message-ID: <87h6xrjojj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

> Prepare to replace a bunch of separate ifdefs with a
> consistent way to describe the ABI of a function call.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

