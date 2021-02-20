Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B521732051F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 12:53:56 +0100 (CET)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDQpf-0002PS-D0
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 06:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lDQoU-000205-Cz
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 06:52:42 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lDQoP-0000iE-SH
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 06:52:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f7so12348289wrt.12
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:message-id
 :in-reply-to:mime-version:content-transfer-encoding;
 bh=L3WYxi8oRgI4QobIhF/HybpgFRK3aMSkw651cLY4UpQ=;
 b=jZFCpermSIkZNl5l1svmF+7nJIvC6i+nWnAn3FUwe1smfkfbM6K7/5Z6OcngLdhhR+
 5JzBxoeRf5h9KwusO0SUJTgl/W56I4LxWkPUvrvcKkNugHyCnSD3VMabieo+R1FrSUt9
 aclANmDxMv3bWylVT6BhQVR3cmiT9+mH9zk6nlP5BBHMxmHo43CEfq0jlBWBLmM4eCFT
 irMHn5Z3dJTgrp88Xv3Ny50GilB/XHEDleR4t2fv+nMbhZnEUteVlS1VQPBx6MDcXstN
 dqQr9561c0kPUIathi0vbCCiEYPBQBFhCMhszqs2poUPW7eHXl2eNYJ+j83OeQXBv0aV
 YMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :message-id:in-reply-to:mime-version:content-transfer-encoding;
 bh=L3WYxi8oRgI4QobIhF/HybpgFRK3aMSkw651cLY4UpQ=;
 b=bcn+bg0rTvKtCIgULg7tnLQLic1pdVPXdB2t56FCuT+tuEJj5UKyJV2yqujSgMGglR
 y5Rx0RNRgIOsoRVR7CT4P/LXbc9S6UwG0l60B5svipo+5nShxBuHY6cvn3k5O9eNH0RY
 U6ewPvwHf6elKFrDS+fVZkTw2S0j3tmAUUDocR6TMgks+O6SWfR2zOn34nnlc0PptUlY
 hyOLCTiDPgV2m4ptIe7qVXiI/4CDzULPCNZv4EY85G304IV26En7hsPLCSvxZO5yIiCV
 B+khxyFqEtXDE4v7+nILMlITnB/EScUe8a9BtSCJjZYTMNZ9L1DBT+kQGJp0GhSoCbU2
 hPfQ==
X-Gm-Message-State: AOAM5317tl70VHyUB0ikYDa+ujA+/BEY02hNUZ3ndAQ4pHabtC8RKGKG
 Yspd8cT4RtMwbgSlLLadeDESOg==
X-Google-Smtp-Source: ABdhPJwfyX/ICskvtNOf1v1VlkZOmRThx3WUoAdys4t9qo/IriyBZw0d1wuWV7PzcsEBnhbRmajFog==
X-Received: by 2002:adf:e510:: with SMTP id j16mr13207272wrm.153.1613821955397; 
 Sat, 20 Feb 2021 03:52:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w9sm16889904wmk.16.2021.02.20.03.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 03:52:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74AC31FF7E;
 Sat, 20 Feb 2021 11:52:33 +0000 (GMT)
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
Date: Sat, 20 Feb 2021 11:51:28 +0000
Message-ID: <871rdbklc9.fsf@linaro.org>
In-reply-to: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> Does anybody use the ozlabs patchwork install for QEMU patches,
> either occasionally or on a regular basis ?
> http://patchwork.ozlabs.org/project/qemu-devel/list/
> The admins for that system are trying to identify which of
> the various projects are really using their patchwork instances,
> so I figured I'd do a quick survey here. We don't use it
> as an official project tool but it's certainly possible to
> use it as an individual developer in one way or another.

Not really. My two go to archives are patchew.org/QEMU and
lore.kernel.org (which is where b4 gets it's patches from).


--=20
Alex Benn=C3=A9e

