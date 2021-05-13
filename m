Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866537F97B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:14:11 +0200 (CEST)
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhC6M-0000uN-8o
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC3E-0005z9-EV
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:10:56 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC3C-0007eR-Cu
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:10:56 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1422617wmh.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AQKzhouw8YYLDL0OQdscfjCipA61M8HaZ3OkV0FX7h8=;
 b=nl7Wqw/TFNTaJBfyme0JeZAttLMrGk9PpJvPIReIFLNSuljg9slpb70wkVRLDgt3Zn
 eHX78PhYMwHoJEnzfS3adM7A9BXaXTrlXZKmT8uALKzoqcEXjRzSg7zT8pSkdQNVd7YM
 f/bK9jDwFeYxWo8HrLD8kXp6Sm9WZA3M2l3WmcvT1xosyZKl4GDnluJVdwSmYXj6WSVW
 rTY2dIZnbED+PgaPQxkVK5uwtjwYbNx7w/RwFtqhTo12BewBG+Y6YSu6z7RQxfYy+oQk
 g+miyGVV/zp+cYPgXg1tnQ4ZPqFDw8yC9mDgG1TCwRq3vj5sRKORcMdmvgKDykmryWBK
 2Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AQKzhouw8YYLDL0OQdscfjCipA61M8HaZ3OkV0FX7h8=;
 b=L+gOY92cAsev/ILhBB/+g/dTtLyHt91y7meM8c2Zi0azoYEGTP7e46M+3Q1o5jhFtd
 aMy4aofjhM2KTg8MYbknhObBacp6fJltQjLbbmzmfY6vB6EPpVefnurntqcPLdyPUB3I
 uQJ3ALn7Ky4Q+ZHPFfTmdcQ8WbXs3fmfRCmTxUG/LPMbuIqQpCiSrzBcmmz+MOrP4xSG
 N2jfgh7sED2HBRHbrrvypw1lnqRYoV8AYq4kg6/lMDj7VU6u2chhwe+8DqtWACI7/LGF
 yADVCoarEJSYfja3qLALGCKPPTj0OBqpx9Lf3U9fKfRlCIV2F2liwkwQF38RBj5x6PkX
 RDnA==
X-Gm-Message-State: AOAM5330lTDit5t38PNDdMnoQrEoy833Um338sdBEPTZg/lB5BgfBCC5
 n2XKTFcr/H1ykqhbkic6sqEVUw==
X-Google-Smtp-Source: ABdhPJxawonG6UYgoIOjP+poWA3iu+n6przfEJSj8UCAsHlnATWBOW0o2gGbN/j+EplT/PSufPS3cg==
X-Received: by 2002:a1c:2786:: with SMTP id n128mr4178934wmn.82.1620915052764; 
 Thu, 13 May 2021 07:10:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g25sm8836259wmk.43.2021.05.13.07.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 07:10:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31B5A1FF7E;
 Thu, 13 May 2021 15:10:51 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-46-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 45/72] softfloat: Move round_to_int to
 softfloat-parts.c.inc
Date: Thu, 13 May 2021 15:10:46 +0100
In-reply-to: <20210508014802.892561-46-richard.henderson@linaro.org>
Message-ID: <87lf8ilo5w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> At the same time, convert to pointers, split out
> parts$N_round_to_int_normal, define a macro for
> parts_round_to_int using QEMU_GENERIC.
>
> This necessarily meant some rearrangement to the
> rount_to_{,u}int_and_pack routines, so go ahead and
> convert to parts_round_to_int_normal, which in turn
> allows cleaning up of the raised exception handling.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

