Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A0315823
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:00:13 +0100 (CET)
Received: from localhost ([::1]:49348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9a7H-0000Vi-JE
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9a2o-0005ek-B9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:55:34 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9a2m-0004XJ-O4
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 15:55:34 -0500
Received: by mail-wr1-x434.google.com with SMTP id u14so23769865wri.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HTsxfAUwNTOGp4bf8zPCXfLFChQlEFdi8dKs6UEV3Xc=;
 b=CC42WIQivHtIv5QgpGG1WRS8Rc3y9W9bydTAmi3yfDM4YgVKgx82T9QfnE1thYtiLm
 U8soHzQCpZkCNwRiUO7856c/QZICVt8QTuuvz9q4B3jRMK/4J9VM2K4DEVk/zHSkNU44
 G790zn5MS9GU+noeCEDVOo4mhYPVgsmOKqPD0xkUh/PeZ+HEzQ9hyBBwUxuXJlOZhV45
 L8vAQcf9js9RZJLdSCdplWiV7sz9Tc61wTv0aK/4WeRjy+g9CqUEEg+tPXCi1zP+k/FO
 YHR6f1FwcZXwpr85uCMjuBkDx5Vfj6DFzcTSlp0dpSlsU36QvCHhgZs7Q6L6wBM6aJFr
 KMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HTsxfAUwNTOGp4bf8zPCXfLFChQlEFdi8dKs6UEV3Xc=;
 b=WeIvTSNPNuS+d/IwTJyd2j8Zz7SCWtTwv4DTU3ZU+zLn9pkw67jH16cB87UZdCWxcU
 aJn1XKh62UYZHjpv/yFqKeUIIuo2syjVvBam1V9tj9zFAbW2q++dyXmOFGjMD/hcr+/a
 fv5ETRr81TDqV91XWBTFOB/5pTY7AlDokscHH8Oxnrv/PtLZQyHCsbB8rJt07uX33Lox
 UiJMGYzv/89EaoW4ENHUFisNAGoafcc8SBqHvuNGDzka0veGvlEpNGyIepB3s22TYUFP
 1ZcNwqdpjPedtWnDAVCeTwkTc3nVyKnObqC1A+14EcG5K3kLKCbntdf9CaZxEx0YABRH
 Y3zg==
X-Gm-Message-State: AOAM5315W6pr/TUA0WJnrDzb8Oh0O37iI6vy32Bja0qzwimSjj8+UNWN
 vruQLHl7acmG8ogQxg+p9lepEw==
X-Google-Smtp-Source: ABdhPJwr74Gbu1lw54o0oaZQU+O0Y84YFVkMtDea52/y7JHnFsxf7BfeerRWXp+mnQs6e1bkp52cCQ==
X-Received: by 2002:a5d:6847:: with SMTP id o7mr3122wrw.216.1612904131186;
 Tue, 09 Feb 2021 12:55:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm5992517wmc.28.2021.02.09.12.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:55:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 790871FF7E;
 Tue,  9 Feb 2021 20:55:29 +0000 (GMT)
References: <20210208113428.7181-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/5] Drop float32/float64 accessors used by gdbstub code
Date: Tue, 09 Feb 2021 20:55:23 +0000
In-reply-to: <20210208113428.7181-1-peter.maydell@linaro.org>
Message-ID: <87tuql7ygu.fsf@linaro.org>
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Philippe =?utf-8?Q?Mat?= =?utf-8?Q?hieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> We used to make a distinction between 'float64'/'float32' types and
> the 'uint64_t'/'uint32_t' types, requiring special conversion
> operations to go between them.  We've now dropped this distinction as
> unnecessary, and the 'float*' types remain primarily for
> documentation purposes when used in places like the function
> prototypes of TCG helper functions.
>
> This means that there's no need for special gdb_get_float64() and
> gdb_get_float32() functions to write float64 or float32 values to the
> GDB protocol buffer; we can just use gdb_get_reg64() and
> gdb_get_reg32().
>
> Similarly, for reading a value out of the GDB buffer into a float64
> or float32 we can use ldq_p() or ldl_p() and need not use ldfq_p()
> or ldfl_p().
>
> This patchseries drops the use of the gdb_get_float* and ldf*
> functions from the three targets that were using them, and then
> removes the now-unused functions from gdbstub.h and bswap.h.

Queued to gdbstub/next, thanks.

--=20
Alex Benn=C3=A9e

