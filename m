Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FAE3944C2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 17:06:16 +0200 (CEST)
Received: from localhost ([::1]:56430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lme3z-0003Sm-GX
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 11:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lme2X-0002Xx-66
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:04:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lme2V-0003bP-HB
 for qemu-devel@nongnu.org; Fri, 28 May 2021 11:04:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id f11so3650176wrq.1
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7MBybLcU/BPuXa38tVgLj7WefWdY7dawobNrCW9qb7o=;
 b=h7VO991rHWGQGV8yfJoOHdFRH8wU0+3AFeIL1Zhce+XOq+gW4FdIkAcz+hcLG93z49
 ld0e8WwjMHSB4/FSImilVTQvlGQqQJ7N/EXMd9+1bBfRhHocb1bO9M+UhTP0b6QxVTLy
 B/ALMHnlglaKhg1FJv1YxH20FKxWhi+2QFeRc90Y/tRXjdwVTIyZZ0DbCK5hhmN+ohAI
 oEskJQvTpBaaf70HbTiIRtfX5RUTV8zTod3+SOPxNqTg3sUZZRX86jWYxSo81t0wzj9z
 EFsYJpQrK0PUxdRJuDcCBKH6Bdo9L0hErzNu1vmbDA5T7YZohYwdEVYNEmrkuH4GOLF/
 c20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7MBybLcU/BPuXa38tVgLj7WefWdY7dawobNrCW9qb7o=;
 b=VHRNWx0axG87y+LXu/Y3KrS2nFkzLCkOCBMwaKeozQlkWJ5jOnLnH4A3mBcbsXoQcT
 w7wgrOdcmAATP+C+p7U1udyme0Qke7FE7mj4LvlNLJdwGEKEPnl0JieMeeErKNnt6tyq
 NCjffO1QC8PpLQvkBPe9R5fm0QZDyI1e2Cs8gQSdlVv2v+KcNSNdk5ArmureUYI+vFxD
 ZSUNAfOhrFLtEMKGBhe0U99w2evNwtvhTkJDWErGbMkzfIByfxUY5C3OqjgZOoJGmBNB
 8y2wRkJMbms0qYcUrCaAKjQ48AIwBhObjv8hYSFVmABwjcGeHLB4++PjBfvKPmJGrKeM
 7jRQ==
X-Gm-Message-State: AOAM5316GVJ4k1k70AuoaHOwmstMcaYI0tqUFwZvAQBPzYKxhekTkXyO
 rk3mGNSFjFPD3HvSxE9F2nfLEA==
X-Google-Smtp-Source: ABdhPJzJ1Kd0IK5p4xeyJ1aqPE8yV/4hh6IUiLDrtK8Sqo0EzVcWX+FBRUHv93EsnfnJgbKJ9ltBKg==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr9044130wrn.176.1622214280407; 
 Fri, 28 May 2021 08:04:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm4429979wrf.0.2021.05.28.08.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 08:04:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 880601FF7E;
 Fri, 28 May 2021 16:04:38 +0100 (BST)
References: <20210528123526.144065-1-luis.pires@eldorado.org.br>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH RESEND 1/1] docs/devel: Add a single top-level header to
 MTTCG's doc
Date: Fri, 28 May 2021 16:04:24 +0100
In-reply-to: <20210528123526.144065-1-luis.pires@eldorado.org.br>
Message-ID: <87k0ni292x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Luis Pires <luis.pires@eldorado.org.br> writes:

> Without a single top-level header in the .rst file, the index ended
> up linking to all of the top-level headers separately. Now the index
> links to the top-level header at the beginning of the document and
> any inner headers are correctly linked as sub-items in the index.
>
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>

Queued to testing/next for want of a better tree. thanks.

> ---
>  docs/devel/multi-thread-tcg.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tc=
g.rst
> index 92a9eba13c..5b446ee08b 100644
> --- a/docs/devel/multi-thread-tcg.rst
> +++ b/docs/devel/multi-thread-tcg.rst
> @@ -4,8 +4,9 @@
>    This work is licensed under the terms of the GNU GPL, version 2 or
>    later. See the COPYING file in the top-level directory.
>=20=20
> -Introduction
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Multi-threaded TCG
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
>  This document outlines the design for multi-threaded TCG (a.k.a MTTCG)
>  system-mode emulation. user-mode emulation has always mirrored the


--=20
Alex Benn=C3=A9e

