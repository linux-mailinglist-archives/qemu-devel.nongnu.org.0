Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E505E2EBD4B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 12:44:01 +0100 (CET)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7EO-0006yS-TC
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 06:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx7Cg-0006BB-FB
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:42:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx7Ce-00089o-BV
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:42:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id a6so2186636wmc.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ye0+Afs4GxM/cTNI5PUVAYDdHtSv/Y0BnSuMhVbs7hc=;
 b=BHUdDBaWBaKLOPLKWnWhQRhF/4Dq67XZlCTYCDyjoIOFQKjcGpsIKn5SLPQaO9ob90
 nr4G2AKw1Av1Vw8bl7nY6SwD24hHuLOandGmXsnCYAnpVuxEsxFPn2Vp7jH1yYLlF9kR
 qWmARIUvbe4GAW62tQY7ED34LR5SlClMPjLVeTwHEVL6gcrsBIuslwWS0jJZGZpQWhCK
 218zsQtAxxlNChf36byJqoQvAyYGDJNWMJJo5oljy2jxcomogyb9E0+akX9rXjLreFeB
 dNserUhGvj52vRNqDBILQM0I3y/YX1ygkW+D0WIfvxyNMpND9WiJm6wjmRrSRnKnkLgq
 H/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ye0+Afs4GxM/cTNI5PUVAYDdHtSv/Y0BnSuMhVbs7hc=;
 b=HfH0brveB1yfD6l2V4j6QNLBlIuXOmCuQEN/ULy0bZw34CFkkziEjRj34iYog9ScqI
 euWH5yXSCeafT6vDHyEmD23NKOpgpobnbjxT6VpPgvY+M5pfFbJE2Ml6Np0KhnVJC6uQ
 XUi8Ul5MNi00Ubt0UBm8zwji3/LMtfsBavrpOBnhK/X5x9MN+TOWZVbykEsVCKIKga3w
 KU1uesFPX/jn1r5gOEcy7pRKTu3wxQBousXMh3RgM6DAPgvAYjRsVhSjuWx47niS7VQZ
 KYDInR59n4WaKboAZV/MB0OR3ydIiu9flT8lBlHj7U6XY8FgCTvb57lk0+nOMVYan4qd
 Fnzg==
X-Gm-Message-State: AOAM531TUfkqGr50w6z3OpgxlQbt4PC0mjnJmq6EG4Sd654XWXCn2PLh
 55j11RBg5c/mXoVrcHg1lRZr3lhQiWb1jw==
X-Google-Smtp-Source: ABdhPJxDrMAyz8EOGXuJtGSDCEIphhe+e5uzwo/1eLXT83kK/cqi7HRROkh61pb3ZjyrU/Iz90szpw==
X-Received: by 2002:a1c:220a:: with SMTP id i10mr3271004wmi.93.1609933330367; 
 Wed, 06 Jan 2021 03:42:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z8sm2650353wmg.17.2021.01.06.03.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 03:42:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AB3C1FF7E;
 Wed,  6 Jan 2021 11:42:08 +0000 (GMT)
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: VirtioSound device emulation implementation
Date: Wed, 06 Jan 2021 11:40:15 +0000
In-reply-to: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
Message-ID: <87a6tm2sxb.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com> writes:

> Hey everyone!
>
> I want to work on implementing the emulation for the VritioSound device. I
> contacted the mentor for the project, (Greg), who said it's fine and that=
 I
> should declare it on the mailing list in order to find out if someone else
> is already working on this project. That is what this mail is for. I tried
> searching for "Virtio", "Sound", and "VirtioSound" in the qemu-devel
> mailing archives but couldn't find anything. If someone is already working
> on it, please let me know, and if not then I'll start working on it right
> away.

I'm not working on it but please feel free to CC me on discussion and
patches. I have a general interest on Virtio IO implementations at the
moment.

Are you planning to make it an in-QEMU device or maybe a external
vhost-user daemon?

--=20
Alex Benn=C3=A9e

