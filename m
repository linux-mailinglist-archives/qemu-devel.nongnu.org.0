Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1239F59A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:51:02 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqaG4-0007nG-VW
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaDv-0003TE-09
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:48:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqaDt-00064k-Ik
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:48:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id m18so21255995wrv.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=cq/9gfb1IT2RXboRBpa1i3vNJVxnfUheeVTabg4s9vNLbQJNbBkUOavr/Rp2q8AiTR
 PP4ML9ft4q0IEbKTwu9o1nXVtF6QGPQRmrl4i5q7gbEj4v0x9MRNaInawEPkApO/vI0I
 YJ4Dv2C+CoKgMvECsEs0nWm1hniR0ZSn8SF/8rNWoFpKC8j900fsxvl8Byn4M6afsYz/
 bpOKwWJ7Ra1fQpGh9Y02KTO/B/FRI5cQPCsq/HjNPaUUUpm921j/Pr07aACSxBonnIlr
 8yXTrnVlwnfhlyAqvSm4orFm84l8pibdLU37vKNMv4xROP4OyTEUscIQo5HXm3QbLz5p
 CEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=e6zcBeBV4l9n7mAZYp3syXPE+IaN2JS1EDwi+hGEgStG2bapKMPz+UzR4IjV/XTuJL
 GuzjoD/GhhEDSxr/uzhyewAfzB8JLNIl2b/Pyfj4+88stievE5Mids+EmyPtNGGYFkKl
 wqvMo7Bt9O4JNrwN3h9kMN0UOGQbMbgD61RUNa+kGULKWUwm8uw3rKElxltKuyYok2D4
 1TdGlujJKtdy+5IqyiMBqePjL7J7/wjpoPEL5Ha/WBDFLk/laO10doO1mRsq92UPKQ96
 QUa+qcV1VlDu5Wy+X+NOgJ2oCYzjp8xocHrN77Ze0Q/XSsHr3v7NiN9HQoxkHUuOknLc
 kn4w==
X-Gm-Message-State: AOAM531ceo1gX2sIIhXu/67u2jmnugSSZFrD7Rzb929w8OphQbhDc4L5
 8BrXM6WXhlDDU4Tvb1khRUB2sQ==
X-Google-Smtp-Source: ABdhPJzuY9IBYmZX794kbEjzSa5FjSsiASgZSPS/JSmHuiCOciPbwrcHQbKErDBxVL3rIyCJV8i25Q==
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr22181190wrb.42.1623152924171;
 Tue, 08 Jun 2021 04:48:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g17sm14812140wrp.61.2021.06.08.04.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:48:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D6ACB1FF7E;
 Tue,  8 Jun 2021 12:48:42 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 07/28] tcg: Split out region.c
Date: Tue, 08 Jun 2021 12:48:33 +0100
In-reply-to: <20210502231844.1977630-8-richard.henderson@linaro.org>
Message-ID: <875yyomvad.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

