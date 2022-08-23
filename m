Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729759DAB5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 12:35:02 +0200 (CEST)
Received: from localhost ([::1]:46958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQRFM-0006oz-M5
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 06:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQRAy-0003xr-T5
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 06:30:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQRAw-0007Mz-47
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 06:30:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r16so16435594wrm.6
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:to:from:user-agent:references:from:to:cc;
 bh=mbQo5U0b5EKEZShHjHSXVarbQoP4IpJXbI1d2by5DsU=;
 b=l2n9VouDRBn4kK3k+qhKM6uB56ikrhsNwftVcuOWaaS0XgP7jOmY03sKkPlQvwpQf6
 bB6aiREMLFn5C1YRLgMDQfXckRJvRIaIBAE01drU5zKSTe3DoOBumB/UYFpgfaiF6CzK
 /6xOt/pXNH4cZc0nxAA1hlZ4WPSngdvmxqac0ctjZfPsVHpvPmF8rV/xttqkKoR8Xvia
 EEW/QwVXmMuslcv+2goW0GEuvu92cs58QWPZbQqvcbianH4v65y3+2nmoUMzMATrQvVX
 LVaOBAHVP5mDSFI1FEuq4LxyzXabNE3frEYtQsspOx/OuiDFC6J1MKBmWnAmR2yu9DDV
 nbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:to:from:user-agent:references:x-gm-message-state:from:to:cc;
 bh=mbQo5U0b5EKEZShHjHSXVarbQoP4IpJXbI1d2by5DsU=;
 b=3/LpxZnVMH2nceIlsEZuzpm/7toMfXE9KiKNyRcb4PEVn+PFpB9hFOc0/MDwKkO7ON
 eYEfOl1swX9zwtR/nER6d6sfHsbCHZaDmStDFrEoF0O/rWOumIgdR826FEMiCXis8UcG
 jow9m6n+xYb+bFxJRbYN2JvAQGCtjU+ElXL2R/+D2gLNIAbdF36EATMzQc+DvsJZoLPA
 S7wp7Pbv6hn7ZZRhDpxW2pFFsO54J2AeHa8+SrWAICBPZmCIUPy6h2Olmgvk7D87ENsU
 44I6IwMt/EipOr+1J37DF3LBg2aa2u10HGXbC1w4Anb/meYVo1q29+yL0y+g1QwrcEjB
 RBhg==
X-Gm-Message-State: ACgBeo2PLlh9cIeXoqD/mREsKsNMGOPDJFPcS12hNFvr0e06DBLyN8CW
 YWMEI9s1jz98Gsw8RV7SwsQP3EwHQ4+PnQ==
X-Google-Smtp-Source: AA6agR4lJ9q0SDi6/Uw9f+/IWNHlYElP9Mft5jyqwlND3pHTV+FP5k92XUDYhGlBNe5zwBNfPqI2Og==
X-Received: by 2002:a5d:48d1:0:b0:225:3ee8:e5b8 with SMTP id
 p17-20020a5d48d1000000b002253ee8e5b8mr9245735wrs.105.1661250624210; 
 Tue, 23 Aug 2022 03:30:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d5228000000b0022542581800sm11560160wra.45.2022.08.23.03.30.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 03:30:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C84D31FFB7
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 11:30:22 +0100 (BST)
References: <87v8rkgfgl.fsf@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: QEMU Developer Survey for KVM Forum 2022
Date: Tue, 23 Aug 2022 11:29:03 +0100
In-reply-to: <87v8rkgfgl.fsf@linaro.org>
Message-ID: <87wnazi75t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> For the QEMU keynote at KVM Forum I'd like to repeat the developer
> survey this year. It's only short (7 questions) and reprises some of the
> questions from last year as well as a couple of new ones. It should only
> take a few minutes to complete.
>
> You can find the survey at:
>
>   https://forms.gle/Y1niFJLbBHmA5Pgk9
>
> I'll be presenting the data along with all the other interesting stats
> in our QEMU keynote session at this years KVM Forum (Sep 12th-14th).

Bumping for anyone who missed it (currently we have about half the
response rate of last year).

--=20
Alex Benn=C3=A9e

