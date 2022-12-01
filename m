Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFF063EFC2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 12:43:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0hxX-00044S-FX; Thu, 01 Dec 2022 06:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0hxV-000445-Vh
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:42:30 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0hxU-0001MS-AP
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:42:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id bx10so2319412wrb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 03:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mngMxsSsRFRfGaooU7Y4Qj9mE08tLgwyHxHSVy5JVU=;
 b=m3oB/irYhXGUoZDVIaRQRw6Z6jG74KkLqK6h7joE4RmYjgS0LtrocUrUaxHwOQgnbT
 QBa68080+bUeM6W+BNgd2o6ZVEQCnXPKT7wjyPRBr2DyYGmhqVQBvxRQnmj8OW/6bK0S
 z1EkoPWULEtc8liWPv1Fb/kNP/S8NQR4o57x3QKo87F7J3wF/lGQIbjeSaRybKFcvz6k
 ph1dKoFgcZhddmIgEMLriHVo41beESkr+uZoPHEjyOlMNzy5mAclDsc1WtXZwgOXMwMr
 brthTXT98L/AgkjoG8KeFHIQyj33QClImI9M41duLROcCuQVawPDDcz5rqRs7badYGFm
 magA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9mngMxsSsRFRfGaooU7Y4Qj9mE08tLgwyHxHSVy5JVU=;
 b=3SCP2FCxvMayKnoQR+FMkriXbFxcikE7pvsf8cW8thhZG1V1C/h0pfn4skOhnnU+vs
 veNn5Vqp5v/lLoXL4Lfnh/qA2Ef/QkL/eO7Up8DY6uO65tgv1lWXZuLeWZQfOb1pndY5
 QGTr7n3j/pf2JGMxbwR2E6huCEv8K6mB9bFeh4OevnPnh4EzoCp4G/0Ut+BCrqKavnxC
 b8vhNBvfg4hNXSBN7Xam04aAbGnEUdsRiWfej/I6K3aoadp+vXe1QFYzyIoBXaiyBNSD
 KjPg/7VlK8bZJ4ObzCeD/Gj8SbwJ5EmlTEcGa03FTPG8L1iEO8wFLI9i9ANeF951Vic+
 /5ZA==
X-Gm-Message-State: ANoB5pkBKoXKaZkzhlTOlOx9O8hnjrL/knunpt1qghZOmPeNZe7eSbni
 b9FBpZQZWdNaz8cc1QlimLAQXw==
X-Google-Smtp-Source: AA0mqf6/2SK2igoEfuq292KCoFPuAd0C9U1TAWwGZSJNRTUKMfrgSf+mfZZ9nQBY4DGycELtfnjnHQ==
X-Received: by 2002:a5d:4c48:0:b0:241:bd2c:bef with SMTP id
 n8-20020a5d4c48000000b00241bd2c0befmr34538401wrt.304.1669894946839; 
 Thu, 01 Dec 2022 03:42:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05600c225700b003cfe1376f68sm4947956wmm.9.2022.12.01.03.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 03:42:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9018D1FFB7;
 Thu,  1 Dec 2022 11:42:25 +0000 (GMT)
References: <20221004120047.857591-1-berrange@redhat.com>
 <Y4hP5HS8L4O6KsVO@cota-l14>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, ncopa@alpinelinux.org, Kyle Evans
 <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
Date: Thu, 01 Dec 2022 10:49:27 +0000
In-reply-to: <Y4hP5HS8L4O6KsVO@cota-l14>
Message-ID: <87cz93cpum.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


Emilio Cota <cota@braap.org> writes:

> On Tue, Oct 04, 2022 at 13:00:47 +0100, Daniel P. Berrang=C3=A9 wrote:
> (snip)
>> Can't say I especially like this but I'm out of other ideas for how
>> to guarantee a solution. Users can't set env vars prior to launching
>> QEMU user emulators when using binfmt.
>
> An alternative is to not use GSlice between fork/exec. I'm
> not sure if within that region there are other users besides
> GTree (GArray perhaps?), but if there aren't, then just using
> a different binary tree implementation should do.

Hmm my distros version of GArray certainly does and that is used quite
heavily across gdbstub and plugins.

>
> Untested patches using ccan's AVL tree:=20
>   https://github.com/cota/qemu/commits/avl
>
> Would that be more palatable?

I think generally we wouldn't want to have multiple implementations
unless there was a definite benefit (c.f. QHT). That said I think
Richard's latest optimisation work:

  Subject: [PATCH v2 0/7] accel/tcg: Rewrite user-only vma tracking
  Date: Thu, 27 Oct 2022 22:12:51 +1100
  Message-Id: <20221027111258.348196-1-richard.henderson@linaro.org>

brings in the kernel's interval tree (with unit tests). I wonder if the
page_collection use of GTree could be converted to that?

I don't know how you would defend against re-introducing it into
linux-user though aside from commentary.

>
> Thanks,
> 		Emilio


--=20
Alex Benn=C3=A9e

