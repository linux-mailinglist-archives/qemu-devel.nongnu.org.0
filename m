Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEF0472F99
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:43:11 +0100 (CET)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmXm-0006a8-Gm
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:43:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmVe-0005HX-Qm
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:40:58 -0500
Received: from [2a00:1450:4864:20::429] (port=40479
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmVc-0007YF-N6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:40:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id t9so27423990wrx.7
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kBYFjiS2HUOTg9L8O5Owi12XGD5IuAyGDiE4XXlKX94=;
 b=ZJoVOfpAbmkbIfS9lgZqrEWb5S2rUyiFSuAfuvykpB/kOtCh8XkhrA+3G5Na7AJeyR
 ypZFMHuQrSrMaa/TdHPANFyPAFVCMipF8uvVpBjHMexF0SqawxcQ2DFQBF209/E09MTM
 rxotT5nv/n5l2oxU7R4D8p+4O+7B2Wy2pSn9p63sXwZ125fq4LQHuQbMlVfyJVVn564H
 SswdR1pNr37JJ4HBTgzvI5x15SlEunNt56P12WTYGjLWFBlVunJi70Dco7cWQ4rOdpCf
 5bEW3B3HoaTae26bOr8Fd0IgdplDTjXLJLsksjTms0KJ4hRLCi2qGc/1V1W+aOfs2anF
 ZeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kBYFjiS2HUOTg9L8O5Owi12XGD5IuAyGDiE4XXlKX94=;
 b=CeZUK3QpQz8Xcbn2lMFtzpwVmPwTNAainzX6e6R3lfvPnbzfpaFBUA3hkNF/JdUpdu
 lv94f3L+Rt3GFgGG6+qEQ0nEP0qdw/qkBibGEfZLCgbxg/x5itI77aQQ7wXwTzwRdjjJ
 AH99LesBjJ0CZbo8ZhsFxioPfgUaSCpF8sm7hDaSS5PH8cO3qyfQR05gFqxLwb1io4FN
 PcBURRUrwQG/zMEl64vpTcJLKW6ulLsHK1Bkvn/a1UoymP7ZDCr+kj8rwu3a6g2PTR+D
 GJxsasBcuD01enuHdfoVGZ0Bzk5J9ph1FwIFujHhGpSWCH7Nu7wIqoYYYFsbo2SC47LF
 AIGA==
X-Gm-Message-State: AOAM533Rs44cHnu8n9fKyePLbciz/w19JLE9/t7Xa5phK3OLTw9VcIqM
 q/LOg2oD1S+DFpaxL+XgySJoaw==
X-Google-Smtp-Source: ABdhPJx/lNSjLn9wrSte94CnhVe/fr6miQeiWdtiFE3AosqrI2/mulGqCU3FAuorTWwDOKqAQOmofw==
X-Received: by 2002:adf:e646:: with SMTP id b6mr16313999wrn.442.1639406455389; 
 Mon, 13 Dec 2021 06:40:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d8sm10918723wrm.76.2021.12.13.06.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:40:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 055141FF96;
 Mon, 13 Dec 2021 14:40:54 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-22-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 21/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_its_cmd()
Date: Mon, 13 Dec 2021 14:40:49 +0000
In-reply-to: <20211211191135.1764649-22-peter.maydell@linaro.org>
Message-ID: <87r1agk1op.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Fix process_its_cmd() to consistently return CMD_STALL for
> memory errors and CMD_CONTINUE for parameter errors, as
> we claim in the comments that we do.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

