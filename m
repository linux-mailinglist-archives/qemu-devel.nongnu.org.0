Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669614A6515
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:37:37 +0100 (CET)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyy3-0008LS-Ot
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:37:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw71-0004Us-Ub
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:34:36 -0500
Received: from [2610:1c1:1:606c::19:2] (port=65295 helo=mx2.freebsd.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw70-0000Ds-IO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:34:35 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id D0E147E707
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:34:33 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9WF51dnz4cxK
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:34:33 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0GkRA51u+zXGGhN5KbRCFkjZuv79fos5ss+kGKg428k=;
 b=MJ4+ltWg4eHzrZSNcsTSZG9NhARumEOydG2MP0nnzH8zZbIZv7lVeMLFs7juFZ/xNlcH5h
 inFwyhWhjCMvMzOVIBR8iJfN2sniOvGw3tQ1tee//SQu0gDcuF5EZnXrbg96ix5IC8thad
 WCyZxp23Mj1yF2PcO2urZbLSYhLW51B8zm1MT1tg2IvUu1zJogrFNM6SC98XyRcKH/9YlE
 bJWnBey9nDqrnEHT4hqRKtr3EggFzddVseultNJB4jB9ekh4VY3Ee7z8tK8qIjWnvGYU8d
 rr+YT7+ribnHe5G45QfjyJ1OwNSgyl8lZnsx0B2w9zYUOltwWQ28zdNThtBNQw==
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 8B9602E74F
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:34:33 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f172.google.com with SMTP id y8so14876198qtn.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:34:33 -0800 (PST)
X-Gm-Message-State: AOAM532u8kESMEoGhSjwS39/sd9dL752pDQnLcS9H/bfctkCJ0Ue/9gq
 lKhwhDLvlHtZpMD6YA8ER0q0qLW488SFayJoubw=
X-Google-Smtp-Source: ABdhPJxEorR4XbOh2m29i6pwYJWNqMlmWVJsQEuANAL/DKPoG4FX21Apb8XJPLgP3kwOHTVni/xvvdOs0P/cGw3HUKY=
X-Received: by 2002:a05:622a:514:: with SMTP id
 l20mr19396548qtx.86.1643733273168; 
 Tue, 01 Feb 2022 08:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-9-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-9-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:34:22 -0600
X-Gmail-Original-Message-ID: <CACNAnaH+t-VfrZwWAfog9vJoahve4RNr9sx4dKYgqw=sWHSTHA@mail.gmail.com>
Message-ID: <CACNAnaH+t-VfrZwWAfog9vJoahve4RNr9sx4dKYgqw=sWHSTHA@mail.gmail.com>
Subject: Re: [PATCH 08/22] bsd-user: Remove bsd_type
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0GkRA51u+zXGGhN5KbRCFkjZuv79fos5ss+kGKg428k=;
 b=bMaTGA7sStuclHIVQAjz96GroT27127z1UzFATav14Byis61R/12CpxceSjwfU2p0kJ3jO
 n50BZaIpJ6cG9W4BL4kI2kEuOkrMhO/9KyY4YCl10fTW5LfsK2ZqlUo1liByjAisp2VwOJ
 3fKevvgB5L94qFV+cUIBYtYaGXvtcpG+cZRbwpot7uDRQG/7/XJqkdrz1Pag3Dq7EcLsv9
 iWfqOApWljs6iXTqUkx6OCyS+SNnl1IwZ4J3UzaGv1XIDsOuvbLQ1KdONlStGEWaK4ICLC
 u5MZWSYXi7IUJaScFvZLfvC+0sfueQFm0ENhGSPaAbCUVJUh1a0pIVrJCa2Rgg==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733273; a=rsa-sha256; cv=none;
 b=aoy+4m4E4vWCBYNBt9pABRf6fCG7XQSMpv0cDAdo2xAJIQv3bbgY2UuSh4j6hBCWaa6/Gc
 WN03pI9IMD0oZziSItE98Ygnwzs+zuGsTUYqgly5ZhO9nRYf5WfJo6J3/A8KSA7HuPq/kc
 qMf5siwPQfN1P2tokoVL1FQIyTfqtK+ubrZhNWvR5s/2qxrD/Ys5PF5T1zkC9GgkKEcf+l
 H5tNjqmr1boI1MM/bBy8T5trroMHyriQLJKAq+PdyesI0imDvd4ukKUsG6/hrIaX57ojDK
 5PFkWLFOTtUKcJkkLo7DWg/TCzhq+ba9cPWuggsIqMcqjeBmlVQgEONQohesVA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2610:1c1:1:606c::19:2
 (failed)
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:14 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Remove keeping track of which type of bsd we're running on. It's no
> longer referenced in the code. Building bsd-user on NetBSD or OpenBSD
> isn't possible, let alone running that code. Stop pretending that we can
> do the cross BSD thing since there's been a large divergence since 2000
> that makes this nearly impossible between FreeBSD and {Net,Open}BSD and
> at least quite difficult between NetBSD and OpenBSD.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/main.c | 2 --
>  bsd-user/qemu.h | 7 -------
>  2 files changed, 9 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index bddb830e99b..88d347d05eb 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -96,7 +96,6 @@ unsigned long reserved_va;
>
>  static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
>  const char *qemu_uname_release;
> -enum BSDType bsd_type;
>  char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
>
>  unsigned long target_maxtsiz = TARGET_MAXTSIZ;   /* max text size */
> @@ -284,7 +283,6 @@ int main(int argc, char **argv)
>      const char *gdbstub = NULL;
>      char **target_environ, **wrk;
>      envlist_t *envlist = NULL;
> -    bsd_type = HOST_DEFAULT_BSD_TYPE;
>      char *argv0 = NULL;
>
>      adjust_ssize();
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 02921ac8b3b..e5742bd6c03 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -29,13 +29,6 @@
>
>  extern char **environ;
>
> -enum BSDType {
> -    target_freebsd,
> -    target_netbsd,
> -    target_openbsd,
> -};
> -extern enum BSDType bsd_type;
> -
>  #include "exec/user/thunk.h"
>  #include "target_arch.h"
>  #include "syscall_defs.h"
> --
> 2.33.1
>

