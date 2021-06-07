Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D73139E01A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:18:26 +0200 (CEST)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqH1F-0000Sj-Gp
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGzp-0006ot-Uz
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:16:58 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGzk-00039f-LR
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:16:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so12992165wmd.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=H5uZwLtrYYyuQobzNvDJhcf4xpCiIORDaV9+rIBAQ/Y=;
 b=dsXLoaVV3hwTFtheNcCbblQRhwklDw/U2Bq6d0i1AfspZBBd38Nkn2rcyf9qPDvA04
 PgbVejVJdvMyITkLPhzO9MTg+XhOLvkudOMoS72lLagEQWZG4OQath+7KhVK8NmT0AiS
 sRbjtNwypdl5OA7aLp8RaIQG8eHi27oYWhU9UZ6mleVAhN+fLfdqIjqrdxxds3Q8R0vY
 Mdo0CrH8XDOnJL11A02K/IxgN5B6HvfgCsR9NpSdhfYgVFgfgCk7Z7jCegH/09DjsI1B
 O8WMSqta23LmfcnAU7xZbjKKTe90lr80Vct/i97sPdX0YcblnOCcbieSZIObwdHCnH6d
 hmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=H5uZwLtrYYyuQobzNvDJhcf4xpCiIORDaV9+rIBAQ/Y=;
 b=rGm5uJWzaw3GjZGs+06On4rbylPKC8/+VENC9xhCQGFuKclpLRQ0l7si3O261uAae2
 Fw1JleIP5WHRYxnLxEegFzV2J5xce5R6fOVIGk/hR73kPPT4pu9wJ9rZ2RR0k+vgWMri
 bUcaUbp26F0gy6QpfXRYEtyAM4ZawAgaIfv4VYUr9TrhY61CIo10vzdiqWlzyIMMEPSv
 VMQt53EwpkTaOQMvSATpX5SPzd/4hHGpsrw9GRcv5XP5gNtqaeXMz6iJWBuaI1Z6eFV7
 M4l9aV5fgWOwjXM3YlxqJQhQ7XUNMmZ32JKZuVnV6NR3Utl3fY2duKYmKJ8aiDWvSWuD
 xkqA==
X-Gm-Message-State: AOAM530wDRs03F5X9ZbEHqdtf/56E5eIWSCiiYRga4ul5mglidvoKnZp
 9WnEtVdmI2bV/JkjjQsEycKX9w==
X-Google-Smtp-Source: ABdhPJymFmm16QVp/68ytkJGbjA6dmuRXEbk/RzGLOQEwRmLc9vWpt3d8qN8/+oQi39JIivFj1J33A==
X-Received: by 2002:a1c:bc09:: with SMTP id m9mr17879187wmf.143.1623079011041; 
 Mon, 07 Jun 2021 08:16:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d131sm18056347wmd.4.2021.06.07.08.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:16:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A82EF1FF7E;
 Mon,  7 Jun 2021 16:16:49 +0100 (BST)
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 02/11] softfloat: Rename float_flag_output_denormal to
 float_flag_oflush_denormal
Date: Mon, 07 Jun 2021 16:16:45 +0100
In-reply-to: <20210527041405.391567-3-richard.henderson@linaro.org>
Message-ID: <877dj5ogbi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The new name emphasizes that the output denormal has been flushed to zero.
>
> Patch created mechanically using:
>   sed -i s,float_flag_output_denormal,float_flag_oflush_denormal,g \
>     $(git grep -l float_flag_output_denormal)
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

