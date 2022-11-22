Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9F633953
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQB4-00043D-7n; Tue, 22 Nov 2022 05:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQB1-00042s-IF
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:06:51 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQB0-0006Er-17
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:06:51 -0500
Received: by mail-wm1-x335.google.com with SMTP id 5so10338409wmo.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sn92A2PLzV4Z5oZH9RC7kmsiSeRiFjHpphBGLQ/Llo4=;
 b=PPUPxIFuFhyuSiTgO/EP+e4ZHQb5nlhZbK/1Di9997tvvRNLZ6Ew74G3nPJRdq53Ml
 jox0yOu8YA0tqqfZSDlSeGoCY17tPtztdhuS8TsPJKsRabFeh0kZ5pkEiRN2mWxK6msW
 d/oh6KogM3pAj1wl10+0GSxb6ghFdmGq+U7WU/8WDMt3xy0C+Ytj6ifgDcSRz3aUjUJr
 ZJSBvqJe7xL0hOD4STnypjgkvbM0/xr52G1oH6wwlpeLsb4Cwxt7ytvEAcCMjvCt6HG1
 WsbES6/e48PiNgw0z3wAJ9eUQtukxL4Sq6wBN/96mnFHG/HWWZs7pvEgDa9KTGaXS7WR
 SQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sn92A2PLzV4Z5oZH9RC7kmsiSeRiFjHpphBGLQ/Llo4=;
 b=7tyuV2+FmFI4cJ9lk6s3cGcG2GGPyUHWE0IOL2VUNYbC7ROd1aw77BTOH+Wx3CND9D
 hjERCpDmDfdgXctYlrevBsB1PON2x0QNCvK7ZL5ghs2i8ADTH0IpVgOeL1BZHbqglxem
 6j/oIYdE80Owu2/Rno6FUp1TUcd6nHj+JUudkP9LpSQ52VDgnVMkZ8qjurX5DsI43U/7
 BC2LZ+joW0cHieUzloC+kdNQg9KTkhv3qsuhJmyImcGJyE7HUPrdiR8cUO4X91Tcnx2x
 eJDjSxDStu8U1kZOoiNGvihHk8EynTb62gxSzgxYwwO3V5J+iY/XdlWQB7sk2Hi3xm2a
 GJog==
X-Gm-Message-State: ANoB5plKbzMf7DbaEfhvaK62F25SRcuiHnG+3uo/0vDLGVaCfoVQCGwU
 PGMrvFMt1gtOCQofQAlAC4YdSg==
X-Google-Smtp-Source: AA0mqf75oK5Q2SS/Y75s+x0N2jQ+Hd11065qaZDiSBRCjoyZBK4VHwJy0EV6aorBjg+2FL8ke9iDxw==
X-Received: by 2002:a05:600c:2204:b0:3cf:a02d:86a8 with SMTP id
 z4-20020a05600c220400b003cfa02d86a8mr8970940wml.157.1669111607812; 
 Tue, 22 Nov 2022 02:06:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003c6b9749505sm22440681wmq.30.2022.11.22.02.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:06:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9D181FFB7;
 Tue, 22 Nov 2022 10:06:46 +0000 (GMT)
References: <20221116174749.65175-1-fcagnin@quarkslab.com>
 <20221116174749.65175-2-fcagnin@quarkslab.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: Re: [PATCH v2 1/3] arm: move KVM breakpoints helpers
Date: Tue, 22 Nov 2022 10:06:21 +0000
In-reply-to: <20221116174749.65175-2-fcagnin@quarkslab.com>
Message-ID: <87o7szb8w9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


francesco.cagnin@gmail.com writes:

> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> These helpers will be also used for HVF. Aside from reformatting a
> couple of comments for 'checkpatch.pl' and updating meson to compile
> 'hyp_gdbstub.c', this is just code motion.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Peter,

I assume as this is all in target/arm you'll take it via your tree?

--=20
Alex Benn=C3=A9e

