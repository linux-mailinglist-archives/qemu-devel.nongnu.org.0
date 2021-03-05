Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B232F017
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:31:52 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDMl-0000HU-AG
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDKc-0007o9-66
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:29:38 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIDKa-0003IW-Eq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:29:37 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w17so4631751ejc.6
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=snU/usU3XU/boEb5Trf6h55LQUGffPIm8KWZn0l9OpU=;
 b=I7SZKM5OX+5yw7vXiwHAWDrL20IyUORx66PpyMEp+OUlBzoJr0chMaLkNsj6TXJuSG
 h9o2PGKRXkh9cCSHcNgGg42oiCzyOs9MMYmyfmbxyNrFoUsvqpi0j40qQkcylExX3BCK
 xt5i6E6LEDpVKdk8X7+2H0cVQY9J8ncmFKO3c8ri/1bPonmCR7jU413uCK/Oji5lJzGz
 qCj1giQ9Cgbo4xP/VEsf80dhxv//i8H1+g0PzDT94OSWWRKSG8FFwnWBudZTSRCh0q33
 6t/LOqcZhJm2mLPQA/WPBkWTw3LZneeUrh2EFJW5x4UNh17Lk6sJilXa/m0olsUel2En
 /M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=snU/usU3XU/boEb5Trf6h55LQUGffPIm8KWZn0l9OpU=;
 b=jgNfhuKmwcJ5SsnWtj8sdXL/CKfxt/uJbS0wTZVV0CSAFyGr/2hvobgimif8c2W4Ov
 f1cCkcqv8wMhTVZte0FkT1jyM5/PWtN8857ME2LS1yvioKO5RvM4ClXmFgeBoJxZedc7
 TYVPAVDIEAzofla5AGt+DR0qCC7wE+yfJMvy5LfXLwEVCzDqFkicpVGN+acAH+y+vwQs
 PpFvvc+vRIYWpgOhZUvZue93dzHOWJ2O8V+Am9VBSaxfUCVwL/jTk2l1eW1ahxj4Q0o/
 k5nXWdyVTQpFqmD3+k8hjxmkoBk/lLPQjDmge5BFNNoPpyRiiR1wC31CT56iXbQxiaag
 86YQ==
X-Gm-Message-State: AOAM531zwWYg6Ymw9hjgxN78M+4GzIWPBJ7ZyVtoTaSQbo+0dhzenJtP
 xVNMbWRl4bMVNQdq1CLaWOL/XA==
X-Google-Smtp-Source: ABdhPJxohDX2tSj/nCOGWwx2ArOPMbjJmADCrBaw1P38LXd7zE/BOJL4Md6Rn5zCQtC/6Sa+jzejCg==
X-Received: by 2002:a17:906:b042:: with SMTP id
 bj2mr2875913ejb.261.1614961773577; 
 Fri, 05 Mar 2021 08:29:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n17sm1894180eds.96.2021.03.05.08.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:29:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D318B1FF7E;
 Fri,  5 Mar 2021 16:29:31 +0000 (GMT)
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <20210208023752.270606-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 04/70] tcg/tci: Merge identical cases in generation
Date: Fri, 05 Mar 2021 16:29:27 +0000
In-reply-to: <20210208023752.270606-5-richard.henderson@linaro.org>
Message-ID: <875z25ftsk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
> cases that are identical between 32-bit and 64-bit hosts.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

