Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C00472B95
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:36:01 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjce-0007CX-QG
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:36:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjaE-0005W5-Bi
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:33:31 -0500
Received: from [2a00:1450:4864:20::32f] (port=35592
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwjaB-00017C-IK
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:33:30 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so13836611wme.0
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=okSRAz3yvwk2UpwgWWvz7rFkrn5BNAOaF1W+skjjiH8=;
 b=v+Ze5BcR4XZNnKzlwV5qJkGOVveSEcNCWYtxwrIPRBzVInb7Gk33IU6KQolBpQyEeH
 9T12A4WYXqvgviekH55hM87KIg95XewEOgZcaamUiiHRQypBcArFwK4fb41F6973EZIy
 LfZR1K0N0EymTLYby9dw6/hGOFv9IOPgEUD9Qzb94qyyXpupMOvl7byC6cSxzDqHZ4EL
 bg/PRuGmpb9IZ1pxOiwU2r8yBkQEQD1lk0JpsQXlBV3uIy4c10QsdS25ODOUQCV13zFs
 TIwyBjA306Ym/30ABVpHOSoLNpiTEcalr47QPJmWiqMCW1cMtDoA74X8N9wZrikO1dsv
 bTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=okSRAz3yvwk2UpwgWWvz7rFkrn5BNAOaF1W+skjjiH8=;
 b=lGloUMLnYG/ZJ9DKdk1mx2qSEMmuA0rIIS1hnjVBA0MPgzrKbagE8JAdsNmxlCnY2p
 j+V6KSSGt8Dw86/iR4li2HQh/Qm+0JibSe+HDYMSq83YmgW8XK7DCDXQ7DgKaK6hzqmG
 AwPnOomU45Zj26CbYuHm6J3q+6x2Ylkr1tPOfRuPvffpW1KBIY5R/lI6UdVTSibT8Om2
 oCa3PuxjJXH0KiGTucvF9w2mKfLJ16z3NDTN88pwqktvkr3PtD8Gliw1To5FCjEvMvZW
 3ZWTo/8HDsyhiK/KyfwPYDGphNwoC+rdh0ZoXbni2DuRoUwAFSWn6qtC7S/JXzCoiCaX
 47bA==
X-Gm-Message-State: AOAM531vyLPg8WLYGffAGOM7bA37pHxsT/mUPG/hL/EujiZ3GAxt93ZH
 SWNWsDyMOKP2Z0cYkuFWPedijQ==
X-Google-Smtp-Source: ABdhPJzXTAQ8LXqOE8EfKlOf0vxSLBobonJlhribdg4ej/C5c2hkmenlZgUO4YBrgC9penOinxPHfQ==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr36530970wmh.107.1639395205381; 
 Mon, 13 Dec 2021 03:33:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q14sm7928665wrz.109.2021.12.13.03.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:33:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEA031FF96;
 Mon, 13 Dec 2021 11:33:23 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-6-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 05/26] hw/intc/arm_gicv3_its: Don't return early in
 extract_table_params() loop
Date: Mon, 13 Dec 2021 11:33:17 +0000
In-reply-to: <20211211191135.1764649-6-peter.maydell@linaro.org>
Message-ID: <87sfuwn3i4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

> In extract_table_params() we process each GITS_BASER<n> register.  If
> the register's Valid bit is not set, this means there is no
> in-guest-memory table and so we should not try to interpret the other
> fields in the register.  This was incorrectly coded as a 'return'
> rather than a 'break', so instead of looping round to process the
> next GITS_BASER<n> we would stop entirely, treating any later tables
> as being not valid also.
>
> This has no real guest-visible effects because (since we don't have
> GITS_TYPER.HCC !=3D 0) the guest must in any case set up all the
> GITS_BASER<n> to point to valid tables, so this only happens in an
> odd misbehaving-guest corner case.
>
> Fix the check to 'break', so that we leave the case statement and
> loop back around to the next GITS_BASER<n>.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

