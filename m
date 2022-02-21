Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372354BDB0D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:01:38 +0100 (CET)
Received: from localhost ([::1]:55060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMC48-0007SB-RU
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:01:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMC0g-0005wp-Pq
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:58:03 -0500
Received: from [2a00:1450:4864:20::32d] (port=39823
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMC0b-0003fR-75
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 11:57:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso13924518wmq.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 08:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=u3PJGpC5YWC/no0rAz6K+nE4CXcuNHTSSTVEmc/FuMg=;
 b=YLlthEfh9/61fXB2g8EMp7PnyRoZgdb4+mNotPIiRy1mxONyuhoJkGdf7fRlsRnHM+
 pKWao73Kq/8lmOBOKrlp81MRRFmaFQxNLx0xkmuWdnbzdrD1HStdsdtCWoHVpJmY1NoB
 NWPsq4ULUTa/03iLqc/AM4NmR5VdUlJq38MbuPVGCJKri6EnNIGFNgfNyVzRZ82Ss5r8
 uUKf+DCQg8aPAOI81V/dz2FQ/tpvR6cZCGBJKBf2B0w1roOsm2FuxrfjIXdsLIppBIK+
 6BQWz+3cZR5I5Q/WmtkF0XKY6nnv1GdoX5yO53/C3aQVtjEuGvEs1BU5ZTUwBJCxcz8v
 yTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=u3PJGpC5YWC/no0rAz6K+nE4CXcuNHTSSTVEmc/FuMg=;
 b=kRYEvBdKg7fW50kTh9mgA+ZHZrCaEejr+LK8rRyYDXwe4ndYR2sFWN5VdNy6qr0HHt
 wGE4Tuf8FYsiWTJB/eI/olscnM5MoyVfHLXLqTlotbs76UYzKo/5dxxzer3kSZaLaG2z
 XCrCSecmfL9NP6r6LXvIzK6qO/98FTZCmQYzT/ZO8h6C8jqA7zREV6QavW8gQCzG8Kfl
 U7Gyqx3zmKVp/LyUSTaBgH7iTwkGlsJcRpgFkufjItLAoTncauC7ducjKPuxM27iRJpU
 i75ec6Jp1/hhBuk+PGS7fJVPivynYy0wfFcltxXkdZjTLNAIdnG4EiXPU/CBZGf1lFt0
 BvhQ==
X-Gm-Message-State: AOAM532yvRrW513mzW+CSQ3eSJeo6pZtQlXnE+6zrNYFQejmcYTBZd/g
 POVyw+F0dWcVkCS+Cp/Hosl3ew==
X-Google-Smtp-Source: ABdhPJxtyGBbwdhUXbvOe+m9a6Y2FpKyZe6kq8GD3PXqPM8RAi8mWxoOp6cPwJzrzXL+N5Sl5dex8A==
X-Received: by 2002:a1c:4c0b:0:b0:37c:505:d460 with SMTP id
 z11-20020a1c4c0b000000b0037c0505d460mr22607108wmf.101.1645462675042; 
 Mon, 21 Feb 2022 08:57:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j12sm1196114wrs.1.2022.02.21.08.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 08:57:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FA631FFB7;
 Mon, 21 Feb 2022 16:57:53 +0000 (GMT)
References: <20220221153423.1028465-1-thuth@redhat.com>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] travis.yml: Update the s390x jobs to Ubuntu Focal
Date: Mon, 21 Feb 2022 16:57:48 +0000
In-reply-to: <20220221153423.1028465-1-thuth@redhat.com>
Message-ID: <87o830ma26.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> QEMU will soon drop the support for Ubuntu 18.04, so let's update
> the Travis jobs that were still using this version to 20.04 instead.
>
> While we're at it, also remove an obsolete comment about Ubuntu
> Xenial being the default for our Travis jobs.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

