Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B517C66BC04
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 11:43:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHMwG-00087r-MN; Mon, 16 Jan 2023 05:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHMwE-00086z-Km
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:42:02 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHMwC-0000LU-U7
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:42:02 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso1902502wms.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 02:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2sawABAHZIcknnBBnQ1pGoElKNqhwH4D2GJK6UqlMs=;
 b=tzdYLAgCOD6R7PI3ITQnxYmFl7REl3tgub7nhIiZQuGyzstAswTIKOJV9x7SO6bfmv
 9tZiL1wdAHRdPzPRosBYC87kFP6h0nugJbEVdDPr42JmTExRgAEvUZyusa9mtKWLPyL4
 AOD7GGeHD6sW3lKMYKj10M5OYn5LVz6lFSwQEyiHKJYkulGK3t5LAD0jRI67jv2jCJwx
 ME7fywrYz5QiKsz4toUQE4l9V8X5sEIW4tCyG+ONoNWLxNxoQIF7aoSqYLzYjK6nf5UT
 yriNBPTBawZ0BNSSenizB873K2zeznq7tpgy1Wyi0StyvVcqX6uMXDMbXRiInj7GWXkj
 x94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y2sawABAHZIcknnBBnQ1pGoElKNqhwH4D2GJK6UqlMs=;
 b=qOKUO6iDg3js37tIEkL3r8qaQ+oK1av8vxeLbKbD/FroIPJ0YVQ2rfFrxHM7LP+lsN
 T/50y84OkF7SX/ZWMHYCmXxKCrS4I3JU5dSsIiOgTbZ2pPiARR3vcZ9JdYzw37w58pl7
 MWVExnlpe6qXRqpO8S8qvMXWccFWy92qXzcidfwH54tW89gXgkqjHD6freMxZBqG1P8H
 HEMU0FFMwTSAFFtGZjsa4QZIZEEjJsXbr7ROC+cGEUecJ9UIj8efAdnmvPA5wDOmb7u2
 ZIpoqS4m+iBZiR5iYq2bjz0vfnuVLxFadKw42IFSnENDxvtH/WwktLCmN2AwOsHpfrZ0
 9Jrw==
X-Gm-Message-State: AFqh2kqFtOW2NJrE9MnzNGQHOKlnL7TU1NE+nu8jrJP0pAoIX1mQW/GA
 GIrtNkc1yiegSzDZtkmc+5t/Vw==
X-Google-Smtp-Source: AMrXdXuf10f/PrBwKJj0MIZc1D5be9qRDqFsArcJMocS5h3/73kjcOmkf59++5vp/m8/SlXD4eD0eQ==
X-Received: by 2002:a05:600c:5569:b0:3d9:779e:9788 with SMTP id
 ja9-20020a05600c556900b003d9779e9788mr7674236wmb.37.1673865719294; 
 Mon, 16 Jan 2023 02:41:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b003c21ba7d7d6sm36474599wmn.44.2023.01.16.02.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 02:41:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E3E71FFB7;
 Mon, 16 Jan 2023 10:41:57 +0000 (GMT)
References: <CAHEcVy56ZTmPEiEn5yHVyrNWK8nBtRZF5gK=sRb4x6RMnOu+gQ@mail.gmail.com>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Yu Zhang <yu.zhang@ionos.com>
Cc: Jinpu Wang <jinpu.wang@ionos.com>, Alexei Pastuchov
 <alexei.pastuchov@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>,
 qemu-devel@nongnu.org
Subject: Re: regarding qapi and qapi-rs
Date: Mon, 16 Jan 2023 10:40:10 +0000
In-reply-to: <CAHEcVy56ZTmPEiEn5yHVyrNWK8nBtRZF5gK=sRb4x6RMnOu+gQ@mail.gmail.com>
Message-ID: <87wn5mep6z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Yu Zhang <yu.zhang@ionos.com> writes:

> Hi all,
>
> I noticed that with each qemu release, the qapi (C version) may introduce=
 some changes, and the qapi-rs
> (Rust version) also changes correspondingly. However, recently there is n=
o qapi-rs release yet for qemu-7.2.
> I'd like to know, is the release of the qapi-rs synchronized with the rel=
ease of qemu, or independent from the
> release of qemu?

As far as I'm aware we don't ship any rust in the QEMU project. If you
mean the following:

  https://crates.io/crates/qapi

I think that is maintained by someone downstream of the QEMU project.

>
> Thank you very much for your reply.
>
> Best regards,
> Yu Zhang @ Compute Platform, IONOS
> 16.01.2023


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

