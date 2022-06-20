Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA9552088
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:23:09 +0200 (CEST)
Received: from localhost ([::1]:47938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JF6-0002pm-Fs
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o3JDA-0000TE-U0
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:21:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o3JD8-0001W9-01
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:21:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id n1so14903448wrg.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rKXxEdRHBforNoYh6VALAQdcrh8FtRUE6ynkvN/Xep0=;
 b=Yub4gRD9/5feVGPFHB5+u+Hvt+DLv349VTeOwU9UI8lOFmiCK3tT/Qpv0Qyj1VS6Pm
 DzrFcNXmZH+kwHxiAsggyNapWV0X/PHmRoSLwz/3wrzuujWHjYSDixChRBOf4mF3H4hA
 XWlxmV5bYe5wFv14VmEkW9nz0pjuPvwnN5f/M0Utrl6laJ4bb0K30HgEnIFJnM+LzSIf
 SdSkvESGD9/9BoWI5bLpKp+HOtGNKM1aSAKuxUluVT3zBuYdebLGLFpD6Khmz7Z6p0np
 SPwJzjFezewoZWaAz88OrPrg0HRYKf8UFETGAoxUMQcwKgjgek+zgi1t5bHLsiGwgVlM
 jTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rKXxEdRHBforNoYh6VALAQdcrh8FtRUE6ynkvN/Xep0=;
 b=ENUmUaODeG5KKxMkltaiKhdAZDcir7Ssm9b83NXp+3h48g6BTGQUBz39QENXEh5G4F
 IGGsFKQAC12op01wV3Q8DYvuQZDMoHUEB3c4QFj6uTsAIEDSVAezS8GhJAOX9Curdb0F
 DexPXBVhoAsTtv2gScUyhz02KyZmGxl/GdT2G+xW2PFUrqyAFXLpTrNGkfTDa6a/9rEh
 wjkpPh5Eh0ZecqxqddDK1APNAH2V7tJ8igllzY7SiHYrESYwHJpbesbPncejW+/xn1YX
 qEjg/dwQbWhadL32oqnnae0MaoILAPqNXWeA90M6QN5rXAPJU0OCXoQwREH8TF2FJ4W+
 eGdw==
X-Gm-Message-State: AJIora/KP45/U3tgIpeWkv7/qqeqdFLfXeuWFGiMZ9fOXsKYpBUTp9Ot
 7PTS+o9ECJne+y3zSEvIWMqUBCj3sRBCZmIA
X-Google-Smtp-Source: AGRyM1ugDTEn4B3LISs0QhHlE5ZcgB5vA2IasEG+UBNfX6OxaZBumO31Frc9+JvhYVkAyTq22wEZ4w==
X-Received: by 2002:a05:6000:1789:b0:219:cb95:79a6 with SMTP id
 e9-20020a056000178900b00219cb9579a6mr23721009wrg.353.1655738463640; 
 Mon, 20 Jun 2022 08:21:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a7bc31a000000b00397623ff335sm15264221wmj.10.2022.06.20.08.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:21:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBDF31FFB7;
 Mon, 20 Jun 2022 16:21:01 +0100 (BST)
References: <CAK7rcp8M=B0PmvZ4FnXNAnSh5TuvxNA4aKXJ8+JF06XogMmsEg@mail.gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: TCG development tools?
Date: Mon, 20 Jun 2022 16:17:59 +0100
In-reply-to: <CAK7rcp8M=B0PmvZ4FnXNAnSh5TuvxNA4aKXJ8+JF06XogMmsEg@mail.gmail.com>
Message-ID: <871qvj5pk2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


Kenneth Adam Miller <kennethadammiller@gmail.com> writes:

> Hello all,
>
> Suppose I am wanting to implement and test for the TCG. Is there any set =
of interactive binaries or other things that I
> could use to work with it? Could I open a shell to it?  Perhaps feed it s=
pecific byte sequences for tests to ensure
> correct operation? Are there a canonical set of unit tests that
> exercise the TCG that each architecture implements?

We don't have any explicit tests for the core TCG although it would be
nice to have some to exercise and test the optimiser.

We do have a bunch of linux-user and system tests in ./tests/tcg which
include generic multiarch tests which compile on most targets as well as
guest specific tests under the appropriate directory. The coverage is a
little ad-hoc but at least new features often come a basic smoke test.

--=20
Alex Benn=C3=A9e

