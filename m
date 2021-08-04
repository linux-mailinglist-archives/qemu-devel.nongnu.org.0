Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC83E06E7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:44:19 +0200 (CEST)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBKwE-0001ns-SH
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBIBz-0000GH-BX
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:48:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBIBw-0000I8-Nm
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:48:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so1628659wmg.4
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s5AlkAUf0LqO1mz9AU0LUkT1ROhkgzjGo8+akI9yYC4=;
 b=Mb3guP5Km5BxoAtqFEDZ9HqvI0y+2QFyLiOndTu0GEf6rvboSssMmP+jQs2nMEL6aL
 Z3A8MwgwarLzaNaFGmfzSDvbzkp7//CpZA0MQdIDWBjqDgQA0lprqgFacuHXD7AJWD8q
 vg67cMQp3J+IoWrFm3KM7kfcGhcAa8zkBxNsuOTNGLjDZSXTxUzQA8WiQ0zy4buvK+PG
 o/s8dh4OTiA/5GT5LlWCYmJwW5i9E00sdE3qOl6RcYVp8wJdpIbWeRmlslVOdOr6RF6F
 n0+cEh2+nBMSPBdrTLYZgQ30WO/L9vv0qZCs9oELe+waidcYaPrSknDXM1v/BRvKrH5w
 vHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s5AlkAUf0LqO1mz9AU0LUkT1ROhkgzjGo8+akI9yYC4=;
 b=LAhOGaVctztBb53mySLz7enX+nUfqjdqgyYtz+H2Jc+C2GrXqZBJzfCt0+4mLzaxW7
 uIK5Jzp28Tx+RoqzsUF0adK1Prs14uLCy3exwbzTng9cx44lb1qJE6qwMgRlbFXoAxyJ
 V/7g82CS/nF0kI9bwh8fsOpou8GpdDJC56ODvmZOR9aZ8q3r/YAdxPNpBjpcRNDDeDDZ
 jR34lwG66asnzKZUHhKDDFAZnBM9XAoEDvnqvtcNlCA85y/1FbF5ZhEEk6+A5cUBJjK4
 xkVK8rItYSPFSwKpexEiKNKHT+Sq1M4Ig5F2yszWIrYiVGnRda3FNSL4WQuPqsBhgwVj
 OegQ==
X-Gm-Message-State: AOAM530ZpqUZwDi9/FQ+/253uPJsiypndOiFy1WKDMVr2kXR47DvMn6e
 moRZTHLf1Br5b84B6B9jINp5Gg==
X-Google-Smtp-Source: ABdhPJx94k9oE8XrjewJ34D+FH3g+i04tc4lDBm1LWHfojpA9290S9TU0ul3+eSAusNg4a1VWodyFA==
X-Received: by 2002:a1c:7218:: with SMTP id n24mr20070174wmc.183.1628088497919; 
 Wed, 04 Aug 2021 07:48:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i186sm6437488wmi.43.2021.08.04.07.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:48:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89F821FF96;
 Wed,  4 Aug 2021 15:48:15 +0100 (BST)
References: <20210803151301.123581-1-ma.mandourr@gmail.com>
 <87fsvqfd4b.fsf@linaro.org>
 <CAD-LL6hBoC44T4GythOAvvZBYK1O=WjZhv4KkoNw3QHiAeoMEQ@mail.gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v5 0/2] plugins/cache: multicore cache modelling
Date: Wed, 04 Aug 2021 15:47:51 +0100
In-reply-to: <CAD-LL6hBoC44T4GythOAvvZBYK1O=WjZhv4KkoNw3QHiAeoMEQ@mail.gmail.com>
Message-ID: <8735rpfeq8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> On Tue, Aug 3, 2021 at 11:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>  Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
>  > Hello,
>  >
>  > This series introduce multicore cache modelling in contrib/plugins/cac=
he.c
>  >
>  > Multi-core cache modelling is handled such that for full-system
>  > emulation, a private L1 cache is maintained to each core available to
>  > the system. For multi-threaded userspace emulation, a static number of
>  > cores is maintained for the overall system, and every memory access go
>  > through one of these, even if the number of fired threads is more than
>  > that number.
>
>  Queued to plugins/next, thanks.
>
> From what I can see from your fork, qemu/cache.c at plugins/next =C2=B7 s=
tsquad/qemu =C2=B7 GitHub,=20
> here, I think you enqueued v4 of the patches

No I just haven't re-pushed the branch yet.

>=20=20
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

