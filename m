Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D651543B5EB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:43:04 +0200 (CEST)
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfObP-00063H-Qi
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOPz-0001Pf-Uf
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:31:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfOPx-0008WH-KS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:31:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id g141so14506283wmg.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QLOvUGg4dHFGJhE1e1bFgH+Un6q6GlyaIp1yEgjtcRs=;
 b=qFasNpD7Dmnt8euAGOHD3QckYcyWtnoKD9SGlk6hWvhFvBQZOJXw3ij8enJN+SB7ju
 G4ZDl8Pc0llS58qhogoO1Ns9plfglIDS17Wzi92G9BVSdfvIu7anmVkV76Mq0SA690kB
 8AOUnaW80nxkuKLShqEy2oLIlvy2vDAzOLPRY1Yhpx/3pspuecRWcgdJoIIZtyF4PRlj
 IRns2C3wC2C90D0p5UPLSihRAkHJ649Z1I4Sv2pZtkKeWELFoMvlKhcSrZ0+abJHQhH2
 QyLNtcFQeJrRwoykYoTpfzcw6LY/ZTwj1ms+7dthdRzF4/T6+0bSjaIIrp8SifAJnvo/
 kQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QLOvUGg4dHFGJhE1e1bFgH+Un6q6GlyaIp1yEgjtcRs=;
 b=z5ChdbaxJUul+WHheSMxio0PnJWKwqJLOYPTS0ZpTwBY+f2SUjlFZvBQS4XbX53ZcR
 XpvqpMtyxqJSYleY783vzDMBC5b3vC+tSKW5HobXrrUJs/ykjNC47z/d0BaGQBzZWzZ7
 wgP+rWVhYNJthhx9tYg8AZ/OmC9Ax/eb3DQBydSQbgQ4lPB8dVZ29QDgSWl2AznSr39w
 iVCcqYVvD3Rt3bLTdOYOfOC6ElTBgPZoY0G3SCQP+lRCt2lz4BJacLedVBnljvu37q2Y
 WQ9ROcKAwcMJlGytbWxse31C43vPdPDfM/tHQMR2SOBbm87UuLdkqVWnsRfHLQlNI30N
 m9kw==
X-Gm-Message-State: AOAM531utieiOWV53bXPa58nGzUjO8KHnd9EI8oWpjJL0Jnj+w3TBt5W
 LoCaUZwOXtBXnuIfk2vjuYIHeA==
X-Google-Smtp-Source: ABdhPJxRM0aPXrg+NFtZvBSN38up5QZ3v9ecb0cRo2Q4lGhxRtiNxG/B7OyUkijYDJMv+bQwljabmQ==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr57033811wmj.65.1635262271242; 
 Tue, 26 Oct 2021 08:31:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y5sm10046804wrd.75.2021.10.26.08.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 08:31:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 509BC1FF96;
 Tue, 26 Oct 2021 16:31:09 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-17-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 16/48] tcg/optimize: Split out fold_setcond2
Date: Tue, 26 Oct 2021 16:31:03 +0100
In-reply-to: <20211021210539.825582-17-richard.henderson@linaro.org>
Message-ID: <875ytj2476.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reduce some code duplication by folding the NE and EQ cases.
>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

