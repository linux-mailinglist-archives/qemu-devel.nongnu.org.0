Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502373A4123
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:18:23 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfB8-0000uZ-Dh
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrf9o-0008Ab-8n
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:17:00 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrf9m-0000if-IM
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:16:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso8434597wmh.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=q198SIT5zY/Wa/y31wtJHO1iik7xSncGShrdoQdriaQ=;
 b=pbgFKYU5myZ7YyHttAY4iid7Fg0vDzvF/W14fmzkCsofOuNxbThaHN2hN2Y/HrR5dh
 MxyGYulZrg5JXE1hRGYTwkfs42CZTKoFHMsuJClFia613B6B5i5MVXfe9ET+oAUOK7YL
 fMiz4bfnP/oW7YczP3TaZoqCvFcPs+HXavh0uAp9xROdaRPGDFijK3RNOkqIOCtXZoIs
 hdxqgpKFpE2C5Ca9WeEdwyB4bWgUWucdTK9nJgYoedc/5xgOyJTXE7YDETqGYIwv0lYz
 D7aNuQeBydZ4LROO8up04Ft5jwCedp6F1LHY4LpzwXchVFm6bSdUSF9uZuA4B+ydYOcz
 9mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=q198SIT5zY/Wa/y31wtJHO1iik7xSncGShrdoQdriaQ=;
 b=Vyykmc6F88/1RRTl6o6cm+WMt2DmBCFLebx4J6beIKbLTE8ByP0xuHqwhOatqa/LzP
 1wNc+DD60IpF6fLtDC+r0w932RiAxORmIaYDXRMqEbVn1NtF+XbVOsBWYYpBIhSnw0EB
 mcoif4xHTnWrBmNvJ6WzdLc7ku0NEOCI5fL8ynbojomEmRswnV4To8CAl2EfntrVaOxf
 V/wrxZc+ptsqe0K8E878V9pNord0auQXbtE4kLUjrxYjYGktoWHjd1Msn3STG5YqhA+6
 0Raum+y0zTOcR/dGP4P4jGuPQ6AHFd6cOl69TGnDnX60lL9T8OoYZUOSNrNGIOJT7JTT
 n3TQ==
X-Gm-Message-State: AOAM532AGowjHMjmBiUX4ZTPi51e7Q7GfrV7XATPUYWBIbGj+COaw8Yx
 rLOnDxRGrjkIbWDFm6Jrw2i9Pbc2t059nQ==
X-Google-Smtp-Source: ABdhPJxcLpUHGXYczyDnayu6v3hdXcuBAGmT45hMTuEXJ8qs3qzoVGBds6+p8MZ0V3nTSFfryqewMQ==
X-Received: by 2002:a1c:5407:: with SMTP id i7mr19984786wmb.21.1623410216646; 
 Fri, 11 Jun 2021 04:16:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 73sm7189800wrk.17.2021.06.11.04.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:16:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0AC201FF7E;
 Fri, 11 Jun 2021 12:16:55 +0100 (BST)
References: <20210610164040.233820-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] accel/tcg: Use MiB in tcg_init_machine
Date: Fri, 11 Jun 2021 12:16:48 +0100
In-reply-to: <20210610164040.233820-1-richard.henderson@linaro.org>
Message-ID: <87a6nwirbs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> This sits in the middle of my "Clean up code_gen_buffer allocation"
> patch set.  Alex mentioned it during review, and I had already made
> the change.
>
> This is the only patch in the set that has not been posted and
> reviewed.  Rather than re-posting the entire set, I'm just
> sending this one and will queue the whole thing to tcg-next.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

