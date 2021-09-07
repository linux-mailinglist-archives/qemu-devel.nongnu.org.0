Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85440280A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:51:26 +0200 (CEST)
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZdO-0002ky-0K
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mNZc6-0001zI-V8
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:50:07 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mNZc4-0006FA-H7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:50:06 -0400
Received: by mail-ej1-x630.google.com with SMTP id h9so19122397ejs.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Bt6J9TZT1D6V8YJEW16z95RmfGa7/YOKjsHA7QaUdy0=;
 b=Go12waj56XfAaAkm3fp7kVFO3pCXqd2WrqvTqeG5FytA6WlQZnKdvgmO7Wqde3Cxti
 pR+/NjtZz8+uCvqMUdqZh9uKznPrtetebd/9nE71cEs6wnugxJUICYxhqPqXGR4E8aTk
 DnZ1ibbf5yXGc4Xyxa7KA7VJNUvljyoFMpMyw0VQTo+84aKGLzbndHbR8S+p4SeBuTu5
 5bEN825eD6M7zrT02aDq5leTd7qhuVD15oHIBOoL4GbSIiZGs/LvViOSAStv7Qb+04sa
 agtfVc81g2NyqiSoMhV0v7Ztd6EJ2phPFB+ZUbZK/oW9vi2J9S4g4TKGe9zGa0PfMbhI
 Teag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Bt6J9TZT1D6V8YJEW16z95RmfGa7/YOKjsHA7QaUdy0=;
 b=HAtJ0wi2jAhAkCk0vd1Lsq6cVIgMksktWCcsqULy/rAiDn1GbnWWPM8ZRADftZng3B
 9IcH6GUxUCgpk98l4tS0GqSNf6jgYlsYuyZbaC5nD+Q2AoDKM0CEXB3F3tLfdB0Vf8NV
 UoRSJ4dQDtLBTHXmMMhnrBSAXC4Dy7YN4vUFAWGxNdHafLH8QN7aj2n58GFJDrOzwU7x
 6XFiUVWHJLDo8lfYroJ0/gkJjpS2fjLTW/xlHYkOMVbWo0NVDJxIeNwJdrSTtXRzM30l
 idMG7a6z7cJVjGZQaP3lQ7+XBVgzH1GLpNaRBMgn0ljl5hEh/UC11bnlMLBoHRMDv2th
 FT/w==
X-Gm-Message-State: AOAM532W8ihAHaRnnRL+ifLBWwnODnTFd3mNQDIw2iFYqx8qO74idQqt
 b+XslLDJ995b5cVQ6e/MBsyOmg==
X-Google-Smtp-Source: ABdhPJy3LFjnocM3sQl52DLyZyvyA57LOwbzONygkI73reCEIu7ReLIyvwRzERhw9sUaYbOvttDKmw==
X-Received: by 2002:a17:906:b88f:: with SMTP id
 hb15mr18801719ejb.507.1631015402189; 
 Tue, 07 Sep 2021 04:50:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d16sm6446867edu.8.2021.09.07.04.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:50:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DE8F1FF96;
 Tue,  7 Sep 2021 12:50:00 +0100 (BST)
References: <20210905140939.638928-1-lukas.junger@greensocs.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lukas =?utf-8?Q?J=C3=BCnger?= <lukas.junger@greensocs.com>
Subject: Re: [PATCH 0/1] Add missing function names to symbol list
Date: Tue, 07 Sep 2021 12:43:57 +0100
In-reply-to: <20210905140939.638928-1-lukas.junger@greensocs.com>
Message-ID: <87ilzcy593.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Lukas J=C3=BCnger <lukas.junger@greensocs.com> writes:

> Hi all,
>
> I have been trying to use the hwprofile and cache plugin on
> qemu-system-riscv64. They failed to load with an undefined
> symbol error. It looks like some of the plugin API functions
> are missing from the symbol list, so I added them.

Heh I had a similar patch in plugins/next but yours includes more
symbols so queued to plugins/next, thanks. Not sure how I missed it
before - I think we might not have been honouring the symbol list
before.

> Afterwards
> the plugins worked (eventhough the cache plugin is segfaulting
> on shutdown, but that is a separate, unrelated issue).

Has this been tracked down yet? There is a fix f7e68c9c99 (tcg/plugins:
implement a qemu_plugin_user_exit helper) which was for user mode. At
the time I didn't think system mode would be affected due to the atexit
callback only being called once vCPUs had shutdown.

>
> Hope that's okay.
>
> BR,
> Lukas
>
> Lukas J=C3=BCnger (1):
>   plugins/: Add missing functions to symbol list
>
>  plugins/qemu-plugins.symbols | 3 +++
>  1 file changed, 3 insertions(+)


--=20
Alex Benn=C3=A9e

