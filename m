Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CAF66E283
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:42:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHo6Y-0006kV-Es; Tue, 17 Jan 2023 10:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHo6V-0006bi-Tq
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:42:27 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHo6T-00076S-RX
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:42:27 -0500
Received: by mail-wm1-x331.google.com with SMTP id m15so1386474wms.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flThYOQP8xt7P8MpaAVvUTWUODtNg8Hsnk7hiiwQwBk=;
 b=icgik6CRVy4STaF4CMLCRjq5oGWQmq1Pc/I4IOKtKIQS1v4/lins+xy+XIcue4c1eL
 K4MAjiNL8x41qpPJ84+jj25FayoKegDnqmupA45IJQBnWv3tPFeSyxkn7hmnlV+KBZWT
 HUY2xMBtQ4izU4Xi68L+fdZ7iYCexC1GBda5iUiKarFMBTm3/kggd62MFDd1coFTQVdP
 iNJHU+p13Dm9X3cCBZ7mcS5ZDh9aNh/nCGrWN+RyRY9dH8q4zePw8wXlBnmv8bgwqlWm
 1MWtmKTd2dVG87Xc7uQ+GZ5dIqWS9Q2yf62oHyy8IbMZS30MGUua+baJfV1V77sdPcQs
 Zjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=flThYOQP8xt7P8MpaAVvUTWUODtNg8Hsnk7hiiwQwBk=;
 b=x0G/x296BPcRv45oelYCBb9fE5frjGyVzr7ACILN3HHo/UkbaOB8YH5RlWUmTY/aiz
 19uqLmbunlh4f8m5qLi+sO5jXOW5/xEf3ssrGXfEsqr3nTBXK5OThvtXP2VQyhWtt8Gp
 qKu/7A3M0Xv4TjrGHnBCyIbkhOalPKIw9W8Z5+OTkDamDb3gfDdyiSin2Wp6/sIOEC+Q
 uOdv7g9yaxipGirrzLwGI8hYBlCfOMbdkUT2MpBdPhDvF/oytP0i8+TTeKQZEghtaRaX
 LJcIMQuJ0TthNZduaNoCsSj79QTkSCnqCtvi9w9WOTjsOFx0zNMEYhvnLfa5E7jhV5mf
 pUoA==
X-Gm-Message-State: AFqh2kosyI4C7kXsi+uCeBYObbiMYneYjI81w3ypBoHo12rpnXXJWtNN
 AwXkk5XYSiEkWu9CcJ1j7f167g==
X-Google-Smtp-Source: AMrXdXstFvHSG0ZBv+GiuCFi5vZ1zTPzpeLvdX3dvRugjorwlmWZDUpXWIMwf90euuSjhogYZL6dLQ==
X-Received: by 2002:a05:600c:5545:b0:3d9:f806:2d26 with SMTP id
 iz5-20020a05600c554500b003d9f8062d26mr3720882wmb.7.1673970144048; 
 Tue, 17 Jan 2023 07:42:24 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm47993125wmb.42.2023.01.17.07.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 07:42:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C47B1FFB7;
 Tue, 17 Jan 2023 15:42:23 +0000 (GMT)
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-2-richard.henderson@linaro.org>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/2] target/arm: Reorg do_coproc_insn
Date: Tue, 17 Jan 2023 15:42:18 +0000
In-reply-to: <20230106194451.1213153-2-richard.henderson@linaro.org>
Message-ID: <87lem1cgm8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> Move the ri =3D=3D NULL case to the top of the function and return.
> This allows the else to be removed and the code unindented.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

