Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A22653421
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 17:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p823C-00035L-D2; Wed, 21 Dec 2022 11:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8239-00034C-V6
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 11:34:35 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8238-0003l2-GB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 11:34:35 -0500
Received: by mail-wm1-x334.google.com with SMTP id ja17so11541140wmb.3
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ztUkTOonrWZYhYPwQNXcCqqDgNvYBsDBRrTMrlpbbYg=;
 b=h8DHTio/VC4F/gQfHZo9PvpzJG88Y+eMFv128sBML3514lGgVGfGMbRwPoSVIyhvkw
 1ga4ClPxsrP1FIYzl1uCGw/GTKxZzBWPFNaFnMIQ1tnbgKj8v0d23sHTMMPWWmLdsymf
 n1jhydKTPpTyIcwq51Hdd4dXLW82XXhpyVVNvlMRg/3B3pRCE6JKKLc4nIhaB1ULSAdm
 NmXMgt8SyKStlSp1wpQzcpkS6CRPoTuBfjBcBzF9cff3MKTSLqQKSy4LULVD6j/mkXds
 zMBGtXcaJ2eyxYsiafimW4/5UoMICN3sWRgFw4FTKGYKZeihmanMFQCW4H3V6qK1+xBW
 qw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ztUkTOonrWZYhYPwQNXcCqqDgNvYBsDBRrTMrlpbbYg=;
 b=JGajEfzz/McnpzhMmDA7ePrOGCfoWAoV+Xgq4ebRn9EXwzSGQbhWFYXnwBILbgeJRm
 ADNZgQgMvDyMdqTL5K8NbYiWjiDYAX0i2c7jcBbccvo8BPdk72ZaFTwEpYIhnd8F6Z0E
 I4aJP52nz3GqloJXDM2sq8/83gl9SDYcfr+AwwVqDYgLgiH4epXpXEc8n+Qfwr8YCnKX
 C9/88fB3mhJp4fizjRn5nE75M2IcE9qBWefvFdmQpMzLlq6E0zS3+m9qb0vxLg2DbZtM
 PcswYt+EW7aGkAB3ZxOkjI1OCK8QX65E2PenxCHeoVLQny1B0ug6F1B/yHNeimVbp9Ty
 c4bA==
X-Gm-Message-State: AFqh2kooNHAch0qex+2qF8Xkfvi3y8fbiK9toKxpl7a9pPgid/Kq4mkY
 jjITdcdiDEqS+PSueNrhtcpm5g==
X-Google-Smtp-Source: AMrXdXsa2lGgf8lExYi2So+PwO5x51HoYghYKCfUBl1/lEfNlnDOnxGoMv8XnOt9UFGiNDrYDfGTOw==
X-Received: by 2002:a05:600c:3d98:b0:3cf:d70d:d5a8 with SMTP id
 bi24-20020a05600c3d9800b003cfd70dd5a8mr2255188wmb.6.1671640472318; 
 Wed, 21 Dec 2022 08:34:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r64-20020a1c4443000000b003d1e4120700sm3259523wma.41.2022.12.21.08.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 08:34:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23EFC1FFB7;
 Wed, 21 Dec 2022 16:34:31 +0000 (GMT)
References: <20221221132310.1485715-1-clg@kaod.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/core/loader: Remove declarations of
 option_rom_has_mr/rom_file_has_mr
Date: Wed, 21 Dec 2022 16:34:26 +0000
In-reply-to: <20221221132310.1485715-1-clg@kaod.org>
Message-ID: <87pmccyauh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> These globals were moved to MachineClass by commit 71ae9e94d9 ("pc: Move
> option_rom_has_mr/rom_file_has_mr globals to MachineClass"). Finish clean=
up.
>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Marcel Apfelbaum <marcel@redhat.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

