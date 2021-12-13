Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDB472F98
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:43:07 +0100 (CET)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmXi-0006Od-K3
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmV5-00050T-Oo
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:40:25 -0500
Received: from [2a00:1450:4864:20::32a] (port=37564
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmV3-0007N9-Ro
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:40:23 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso14179008wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 06:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JPm4WcBXxKEVqbRyNP4V4zmVvbgKYNseoNTPacrvNZU=;
 b=m7/nUYPieZL547EYdrzUojLwW3ZnYBV2pshWMOZ9wkcz9sJRVqKmK85swQMS8iFsyK
 iZTdfWCJp/U7QSVDWqLUSU0i3k0zyjb0MjQ9YM3i8vC+F5LYxMHqu+NcIi9G+s4y/nrQ
 TjpzybblLRYDza5Lxu28F1NE4GYlBKAQb5jPvFaVQoyVkvIzJQpu/shjN9iegqXq3P1G
 LXfgcXfaFKJgaUW7CKpCEQ2lDgGyN2rxR3HCh6Bcow0xN7G3qPUcnp6K9j4RnvFOk8MJ
 Xd1Ra4rOp5W4o19awK2950TGPShHiTnglQE7JAezMzTJUu91+mkISFRb5dndMP/pq9Mq
 CaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JPm4WcBXxKEVqbRyNP4V4zmVvbgKYNseoNTPacrvNZU=;
 b=TsC//y6+kQUV//RfAVsOzxb6EZMkUJHFYjZOjLr0q/RmrysXJBAycSp7fzX4A1JjcT
 O6/msYKD/2/wL5LIzNinsWmbUmIsest9rhwM0QyDYpFaBchEiz699en9H4mA0dNCAKIh
 lGvAB+kxU9X+vvnbxXPoXRVz2MFwv6ZZj75epDZEtj200lS47SnQ9/DaYciYcXO6Ddkq
 QxOBLNtFoyVWf3mt1eA8JO6Gqk6h4N+s3+br/DzwYT3c4vTtU+gNaCyHyfxriAh959Z7
 TjiENTSAMyPj3SoLM50TpxhAn2zCqCDNRGbSYyWVHlzPYicnUjWAH1uNJj+BhAjiWtMf
 SXWg==
X-Gm-Message-State: AOAM530WjKEJ1YYG/34MsVJvXT8hAaPRjpcdtXzqYs7oH/KIqlpqV53L
 L1LNb80gJSgiXESYQvtIt19Clg==
X-Google-Smtp-Source: ABdhPJxf1KFueGH7vMjhWdLCJJawjYySibyB1CGDgaV3ay767lbD1L6ollGTAc/wBAjG6tXG9wbmvQ==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr38710473wmj.30.1639406412841; 
 Mon, 13 Dec 2021 06:40:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm11079168wrz.97.2021.12.13.06.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 06:40:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 169E71FF96;
 Mon, 13 Dec 2021 14:40:11 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-21-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 20/26] hw/intc/arm_gicv3_its: Use enum for return value
 of process_* functions
Date: Mon, 13 Dec 2021 14:40:06 +0000
In-reply-to: <20211211191135.1764649-21-peter.maydell@linaro.org>
Message-ID: <87v8zsk1pw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> When an ITS detects an error in a command, it has an
> implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
> to ignore the command, proceeding to the next one in the queue, or to
> stall the ITS command queue, processing nothing further.  The
> behaviour required when the read of the command packet from memory
> fails is less clearly documented, but the same set of choices as for
> command errors seem reasonable.
>
> The intention of the QEMU implementation, as documented in the
> comments, is that if we encounter a memory error reading the command
> packet or one of the various data tables then we should stall, but
> for command parameter errors we should ignore the queue and continue.
> However, we don't actually do this.  To get the desired behaviour,
> the various process_* functions need to return true to cause
> process_cmdq() to advance to the next command and keep processing,
> and false to stall command processing.  What they mostly do is return
> false for any kind of error.
>
> To make the code clearer, replace the 'bool' return from the process_
> functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
> In this commit no behaviour changes; in subsequent commits we will
> adjust the error-return paths for the process_ functions one by one.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

