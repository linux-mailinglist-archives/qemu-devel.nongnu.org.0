Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742B5265AE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:11:53 +0200 (CEST)
Received: from localhost ([::1]:52884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWxK-0003kg-WE
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1npWuf-0000yG-Sd
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:09:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1npWuc-00028R-BR
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:09:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a5so8038938wrp.7
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ar37dXkH46mG/ChpMcA7tZOoTAgmipA5AFz8b+ZoruQ=;
 b=CD6Fh6lGxGNuyW+uU+6mo1nLjlBlc+SzqutRU/YGOfsK2pPK3guWPBjuPk2CLBL+Lf
 V4L5nSVa6ZqWXAWsERiRioIPAK4os+t79MzLSBtY2Jprh8ZPl+qyX4u5b3ETZVT7Qp87
 sakUOh7Ks8W9oRRMV/1Mw3YYSY1Wr+7rGUP2ojXhXYr2yzk976MVstoaIYm1ldIl330i
 plod4vnIJqi4Lnt11bwRlYtW3KORqeb7io6lzgVUwkauewkDEa04VNcFOsfbHdJbwKX6
 mdBVH0GTFIEnOhmDPPbtqM9rNq+UqTeiXiPaei6YCvnsvmJQkYZfsPKz35hlm7+SKLB3
 Qv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ar37dXkH46mG/ChpMcA7tZOoTAgmipA5AFz8b+ZoruQ=;
 b=WwrjVuBP0F3K0ru0QTotmLb1k8q8FYNImsCH+v7tkAC3ruPpoc+qaK23JuNHFstTnZ
 4aO86sqTbQ/E4tVHzN3Iw4HAxYhc42SSA0PZkPsgASVBsFiizRvw4AAnGZSWDrJtf0MO
 lGT4g5WTZK6YMRoOjxyJyB2udrFiwiHAPgbV9W5HLq9tS4LuqxsB9ZxdskfcRtZuaNvo
 75V7TBWX897OdqCfMVvxfUo/1l9oL3Vac8NZJg4taiwrTffa2ORqfwu50EqYl59NM63W
 EMjd1WQWesRfntWzewllHpYElK+czsLFfzdvQ5NOillrNOn09DJfuQAb5kVb2Eust8MT
 s25Q==
X-Gm-Message-State: AOAM533FGQjvLrSPH47yM7mHeaudUpNJxuJa7xl/II7WGOskz7ly+r9J
 mi1KD1UFw+sMPeOmdwiF8HJPTA==
X-Google-Smtp-Source: ABdhPJxcA3u3f91A8v2i8PGwEp/qeaVk21r1v9ZU5/sQAPZ2KPaLngJQGrIJ9QrfCj81dSp8huDm2Q==
X-Received: by 2002:a5d:4b89:0:b0:20c:52e3:3073 with SMTP id
 b9-20020a5d4b89000000b0020c52e33073mr4498209wrt.140.1652454540101; 
 Fri, 13 May 2022 08:09:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adfc68a000000b0020c635ca28bsm2399115wrg.87.2022.05.13.08.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:08:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 99C241FFB7;
 Fri, 13 May 2022 16:08:56 +0100 (BST)
References: <20220513131801.4082712-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.20; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm/helper.c: Delete stray obsolete comment
Date: Fri, 13 May 2022 16:08:51 +0100
In-reply-to: <20220513131801.4082712-1-peter.maydell@linaro.org>
Message-ID: <87zgjlqxkn.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit 88ce6c6ee85d we switched from directly fishing the number
> of breakpoints and watchpoints out of the ID register fields to
> abstracting out functions to do this job, but we forgot to delete the
> now-obsolete comment in define_debug_regs() about the relation
> between the ID field value and the actual number of breakpoints and
> watchpoints.  Delete the obsolete comment.
>
> Reported-by: CHRIS HOWARD <cvz185@web.de>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

