Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93BC6A46F7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:27:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWgKf-0002cK-I0; Mon, 27 Feb 2023 11:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWgKd-0002bk-Kt
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:26:31 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWgKb-0003gK-WE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:26:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7590635wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 08:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0roiBvZapZssi1jOAbpmVAbrD3ihJbRnDsp4/ZPARY4=;
 b=z0DnTvk1DP8Il6LF7Anlec5bmE8sfWDHOMiLzqoJut2TY1C8wyCcPGV6uVH/jhQBe3
 M3k6KZ5Sjr7mcTbGCgZfxyC/17o3Q6aaA0G8w0Xajt8gjwP/PhPs8aVNa31kmCopDg03
 NidQK+CMzm1UFb7/chAYvsJ00kbddijOcnZiJRuzoeMcCSnMAshpwwGmQyXW9eTZqWTI
 xrAMTBnr5RcyI82elDk2AauzunLERFyW+FpyDlP0R13LyGfVd9WDmW3L9Ay5gfdkGSPY
 q8EjXTQogb0lDVUR6B8M6dSDVHav8fq6Pmgy9V70ZwPCr7LEFuMcMeZXzwoQEWYKfq3v
 NSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0roiBvZapZssi1jOAbpmVAbrD3ihJbRnDsp4/ZPARY4=;
 b=UoWavAISSmgZKRPPKXEwA5It0I7ze5vCFxsq+Qv7HkoDTwqe/bbsoqVqj0mwibYm3k
 NHT3U6CrZpv1x9QHf9BpbE//JUAjgml08lnZVvhhmkAmqjyHWwY3bhHmd9SEAkTwukcF
 pUGM0SExzKThGfYRtxHVc0R6yObUwok06DmJbpM0avuwsAfe9Q0HEbh+s2Y6rWIZRM1o
 k7XpFOHqpntbcyuAQYPJWrkjNIATVu93OywWzrrO1UF3UTZ2s/QmpldQ5fRPZ9feTF0q
 ndgNbhVquWCYDtx2xeAAdMZn7dw3xJKAhhggnNHkdm13vBbV3dlh7mPOjWXAFKrQxDeU
 S/6Q==
X-Gm-Message-State: AO0yUKUc+DsHw+svn5bY6f9h3jkon60xP4lpaKo8DjE8dFIflHrIf3ch
 qxp3lJHb5/O2IqfYR8dyyOO+jA==
X-Google-Smtp-Source: AK7set9rOMneURYcmzqk8HIahYwvadv+iY0eVH8T7se7VHX0l7vqOSUUxhg4wlgVbit4iyiBgyo2MA==
X-Received: by 2002:a05:600c:1d96:b0:3ea:e7f7:4faa with SMTP id
 p22-20020a05600c1d9600b003eae7f74faamr10801158wms.26.1677515186425; 
 Mon, 27 Feb 2023 08:26:26 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm13955128wmq.47.2023.02.27.08.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 08:26:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B6BC1FFB7;
 Mon, 27 Feb 2023 16:26:25 +0000 (GMT)
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
 <20230227084621.15cab9da.alex.williamson@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>, Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
Date: Mon, 27 Feb 2023 16:24:16 +0000
In-reply-to: <20230227084621.15cab9da.alex.williamson@redhat.com>
Message-ID: <87o7pfgjm6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


Alex Williamson <alex.williamson@redhat.com> writes:

> On Mon, 27 Feb 2023 11:32:57 +0100
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Empty commit logs are a pet peeve of mine, there must be some sort of
> motivation for the change, something that changed to make this
> possible, or perhaps why this was never necessary.  Thanks,

I think that is a little unfair for this case as the motivation and
action are all covered by the summary line. Granted the overall goal is
covered by the cover letter and the following patch however for this
patch I would hope its self explanatory.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

