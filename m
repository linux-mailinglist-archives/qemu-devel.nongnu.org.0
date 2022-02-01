Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6B4A6556
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:04:50 +0100 (CET)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzOT-0006yD-Lx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw9d-0006uA-W4
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:37:18 -0500
Received: from [2610:1c1:1:606c::19:2] (port=29943 helo=mx2.freebsd.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw9a-0000mA-Th
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:37:16 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 05F2D80173
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:37:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9ZK6JY9z4fYQ
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:37:13 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x6BIYmcZiXgnwA+t0xyoZcPDiolXv+e7eG9bQMIXEec=;
 b=GmMCykk9/QyD2C9Ehtl1z28t94lQNiqcXOd5psWQRBwZbHoxiiV/Ai3+ygzTOg3JlCRCs4
 OyUWYs+N9qXTnBhZBqHnofeDzrzij04yu1ex8DSk0eZdRnacgIXemtKt923tPlXOeoGo7s
 ogpPsEcG3m5vj4ZgXukOT5VIPvTFGzjgQ9Umx+rf1wBdB2KsW2av0C+nz7/CLJ5ln444Cs
 xXHQOyh5Nc3D8MloWLkeurps2hAul34cxviNaEBI0c+oviEtrrelc2+T4HkCIo02S3uoBL
 7jj4xqO13w8YskerC/6QX5ez7KTQRYI1Zu4Wls5l49c4Lg62FLkao7PrlSvG3g==
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id B8D812F1D7
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:37:13 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f45.google.com with SMTP id b4so11649748qvf.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:37:13 -0800 (PST)
X-Gm-Message-State: AOAM5325CRE0JVgEeElwGLj6t3yKdOprqTKilzKvdvmKpl49kiT+JDV+
 PKaOqu5KLkgFZ+KXBYynrWwFqJT38UfAtohHeLw=
X-Google-Smtp-Source: ABdhPJwcejvAQ+O/uhSutgYDzqrb8N3I7TizhR2Q/S1kPyhUYxf2V9GaCT/+qSYOTpU/DaRtburU7igxNa4DBLzdyjE=
X-Received: by 2002:ad4:5f8d:: with SMTP id jp13mr22789661qvb.70.1643733433452; 
 Tue, 01 Feb 2022 08:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-16-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-16-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:37:02 -0600
X-Gmail-Original-Message-ID: <CACNAnaGZm971UE-KAwq9ui_EyezJAdhjzZmAPX5T5=2bGwRhug@mail.gmail.com>
Message-ID: <CACNAnaGZm971UE-KAwq9ui_EyezJAdhjzZmAPX5T5=2bGwRhug@mail.gmail.com>
Subject: Re: [PATCH 15/22] bsd-user/freebsd/os-syscall.c: unlock_iovec
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x6BIYmcZiXgnwA+t0xyoZcPDiolXv+e7eG9bQMIXEec=;
 b=d55Hot/uypOpYZroXmMblMTkKF2tqoAzDxg6+sjoUYtCidOtax2r3Km3rU6y2wDRB9TCRA
 0TmbCABfewKWCcnTTDCOf2ZAXHU20Q08J/wiAHkmO+0unTpBSllN9xA6f/G1jt2Tvj9gM5
 8Fe+nfIHMTVqVue7psg41ZdXBnq/BsKjBQAEYxUGsmbckxi9anwaQqLw7e96NuU4Drc1L3
 T7vLQX7P5kjuqAYycF1xo8kEIc4E85+CQabl4LAjI0mX1r3pRAdXxj6CPiO1V2jCEk55Ye
 Mq0w/BDJei9hkHhhhDsm+LPnQsWG3rfz7KhHC3ZYjvp/sMSMCv+GBMCukCsxAg==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733433; a=rsa-sha256; cv=none;
 b=fD0wXI4EFTB9pClOgxEJz0dFCjPzi78pJRSeY/APDKnewSt9A2+mQSSSyPo17hZRuoGY/C
 GS8qj0jEppx8yofwbgrJpmKsR5zmX/m8tYDxPCNgwVwKWN1VskRAv+mOamqap+ApLG5n6e
 aBiWF+Bg1Opm002+D7PTIG0dStchCFHJO0MEGapTFySnclcYSGrmxsttyz57nur7laPuCM
 VcKkCEgn2KuZvMrq5JPtVlTd6rMlTe9RcfoxuIXzX2Ps2LHLEt7l7/KsVvacEDA3Iz8a4c
 fmNCU5AjGFfWzHXeiqPaeMHEOrSXYRxJOZ4Rw2gdTZTsA5jl6QT632q04j/9Ow==
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

On Tue, Feb 1, 2022 at 5:15 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Releases the references to the iovec created by lock_iovec.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/freebsd/os-syscall.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index c21759ae7ce..d49945f0fcc 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -167,6 +167,29 @@ struct iovec *lock_iovec(int type, abi_ulong target_addr,
>      return NULL;
>  }
>
> +void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
> +        int count, int copy)
> +{
> +    struct target_iovec *target_vec;
> +    int i;
> +
> +    target_vec = lock_user(VERIFY_READ, target_addr,
> +                           count * sizeof(struct target_iovec), 1);
> +    if (target_vec) {
> +        for (i = 0; i < count; i++) {
> +            abi_ulong base = tswapal(target_vec[i].iov_base);
> +            abi_long len = tswapal(target_vec[i].iov_len);
> +            if (len < 0) {
> +                break;
> +            }
> +            unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
> +        }
> +        unlock_user(target_vec, target_addr, 0);
> +    }
> +
> +    free(vec);
> +}
> +
>  /*
>   * do_syscall() should always have a single exit point at the end so that
>   * actions, such as logging of syscall results, can be performed.  All errnos
> --
> 2.33.1
>

