Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F52654009C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:01:11 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZlc-0000Tj-7j
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyZjh-000866-PC
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:59:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyZjg-00060T-9J
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:59:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id d14so15312206wra.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hoPEt8eIrv1b3Tjsqgv/wDN59lmx5DAGpPXTM89l3wE=;
 b=DGlBPE0onL67Z5fX0nfaeaF2f/nwLpYZTXBUn3ptdiv2LqZwzCHb6I9zf3AzXZLq/3
 WQ/5vq0Uo0ftrKBe83NgQm1V6TYQtESAW1xEa6AA8H8bcuTsbH0a3safDhPbO3PpDBuO
 9vOlFh+ob2eE4MKbT4/GKKNbQoqHgUZIsAoqceKWgPtsfBe9CW0KK63pK68C/FN/Qwyk
 wcGHLKpvJ8/2YwcZYSlD5IwWSSUgZBWv/FQZre6IxhBLPppRT6hXmfjYeXzQ4Ai2ZOv+
 9+h4GoqkaXhC4qLXOBsXeqtbwR98WPKS39OeJMVGT3Vz6nhrVKmVhesZ4il3vZqTt79u
 5rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hoPEt8eIrv1b3Tjsqgv/wDN59lmx5DAGpPXTM89l3wE=;
 b=o84ll48GZxv1dn66cf6MV4Q0OQhWnVGUuqnnsk0UQTE0WxDt4LUDmDvSH8M1WrvSzy
 PpCmvjmasTu2I7mmwTlHg74TZvhR8Tw7FTINcjigcDL4by0whVLPrZI1+vN6CH/X94RK
 6eoOwwudZu08Y7+bSXSCtGh/H37WqD5WM0ovT4XW8kah75u8DwRNnKpeS1GU/Te1kqv0
 GkbFESyB4jIm3uBgudLHwRP+Wc96+KFJiDpJB44FPV+nCQ2Mc3p8H1As8ZIhyctiXLHG
 gwB/E7j6sAjFihLGMEEB3k/VHS/bw2yz88dYMFdD/1xihtXV64EMz0x9PU2EdKNC2B3G
 VblA==
X-Gm-Message-State: AOAM530XzV0RZb8LxV//jjApIN+KCNE5s/gY/84BzjaARhu1ePFPJpaR
 7ANWLen3PAZPUw2u9Vf1KwekEQ==
X-Google-Smtp-Source: ABdhPJzTLBNC5w/HlxkA0YYRh6QlUDLYM55ufThoqZGdxQUEAJKKbDaVDqZ7ozlYfNcGdB1Khixa+A==
X-Received: by 2002:a5d:69d2:0:b0:217:5ad1:e61f with SMTP id
 s18-20020a5d69d2000000b002175ad1e61fmr13888752wrw.602.1654610346264; 
 Tue, 07 Jun 2022 06:59:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c19cf00b003973b9d0447sm21538977wmq.36.2022.06.07.06.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 06:59:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A13A11FFB7;
 Tue,  7 Jun 2022 14:59:03 +0100 (BST)
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-15-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3 14/49] include/exec: Move gdb open flags to gdbstub.h
Date: Tue, 07 Jun 2022 14:58:58 +0100
In-reply-to: <20220521000400.454525-15-richard.henderson@linaro.org>
Message-ID: <878rq8val4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> There were 3 copies of these flags.  Place them in the
> file with gdb_do_syscall, with which they belong.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

