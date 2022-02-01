Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B94A652D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:49:43 +0100 (CET)
Received: from localhost ([::1]:40000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEz9q-0006eY-Id
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw8Z-0005gp-VH
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:36:15 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:22612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw8Y-0000Wh-Ev
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:36:11 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 9E1577F4F8
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:36:00 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9Xw2Rywz4dvB
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:36:00 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nOp3TuIvWbYQDqx2SBuda4kR6a7hCLBD+cepM0jSRJE=;
 b=u9BJt5tCDaTCzYXA3fha/vCEPbQsTzVv7XeG/W5DbWrX4CPDUE7Xj0QlLtiDCcLVoIEnQH
 XNKdtPRlaipsrfEdq8FYbyJ90lVjGUE1yq9P8kVUdM+Ux/CvVRmJTu8UAJ7UdN741dl6WV
 7KJ0cALVRvSzO3V0lQ7soe2PB94uopgLcSYsn6pZgJIcMXf2BDIrM01CybVvhg/yHRrhm3
 HHmjmib4wt+t9KMwUKY0q5vPjEZWUINbr6nWZTbfuE5rjvUVk70Z800EAZsvqiKRrkMN22
 4cdjxE/4H6WzKNWk/bvyjtQ7ZF7JgFkb21LqplT2+NfokPzapxgnCqnFBd0YPQ==
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 2F7702EEE7
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:36:00 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f49.google.com with SMTP id k9so16460685qvv.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:36:00 -0800 (PST)
X-Gm-Message-State: AOAM5315llypXJ7upSEmqek5eFYXy2tEb1fMFZsjIfNzCkxwnXCs9Jfr
 sPeASsuiiMVmP7VNVnAdOJ7fTbtVPPYeyNbYybA=
X-Google-Smtp-Source: ABdhPJwYVGrewBroKXEM7TVUHp23zFhN/tuuXXWXwA8DAmVke4FmKKnJC7cZbOe3xsZDEoBJqG4jpmiWcJOrt7SN7QY=
X-Received: by 2002:ad4:5f8d:: with SMTP id jp13mr22783924qvb.70.1643733359856; 
 Tue, 01 Feb 2022 08:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-13-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-13-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:35:48 -0600
X-Gmail-Original-Message-ID: <CACNAnaFhksVCVFLq08z+DdMFaM+OHmUaKa+uppNLkniz2gUzcg@mail.gmail.com>
Message-ID: <CACNAnaFhksVCVFLq08z+DdMFaM+OHmUaKa+uppNLkniz2gUzcg@mail.gmail.com>
Subject: Re: [PATCH 12/22] bsd-user/freebsd/os-syscall.c: Add get_errno and
 host_to_target_errno
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nOp3TuIvWbYQDqx2SBuda4kR6a7hCLBD+cepM0jSRJE=;
 b=V2vUF7ue2bZ/LVzS2mgCFZgPGnuGDZMR5mItf3LxdfOXOyuXDNB5XdDEh3gYXXHdl1ez3M
 OARivKpOv5YAO38NdlPBGSXCGV3umSsa6HDZOz+gHX91POzq2VazFIpkBqtqRSYRLwWV2Y
 bHlzPa0nFy2MuZOkVb3f7wKr8sf0Xzh+Ud/CwiU1zbKOl+trjwYGI9ww6XG45tpe50KAWK
 vBZCuxQ/JwOR6Rjqx9SHHjrajJ1odIZsW08NfJfvMsTZdRqt1V6H0bPsNyIUlsK3vXyFsQ
 iEzhckKQrB8xKhahWFmep2LeydgpN2oY1w7CLyxKIzo2wY98jkd+vBCR1qp0xA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733360; a=rsa-sha256; cv=none;
 b=MTuTqIYFm9NWPNWZHtSFeFFQKy0RHRUMkQ05TurI0+OmYNljKiUoZ0mh9kHQkrnmOX9v2O
 +mb/2rpe7ufD8Qac6tu/HKtmIQ6Dzd7XaIz5RHziGJY89WtBasUx32/cucFhXfRo+6otgE
 fFE62tesff4VyUtsam0QoO9OWG4GVTQzlFZXNwUTCDgIKmd9Rc3YoP5KIRC4WmVjg6qUPq
 w0S49CYZ7qfOLPIySZ3JPAaB0+Ha1pqCJry9ql542oWuzeqgQs/vHPJdAU5ah/OqmSd1Ts
 cgdGER1MhQputZ15SMD7cs7M+5+isiT7TDqXL/2Q0MLRoDDk223eHOhz/8TJjA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Add the helper functions get_errno and host_to_target_errno. get_errno
> returns either the system call results, or the -errno when system call
> indicates failure by returning -1. Host_to_target_errno returns errno
> (since on FreeBSD they are the same on all architectures) along with a
> comment about why it's the identity.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/freebsd/os-syscall.c | 23 +++++++++++++++++++++++
>  bsd-user/qemu.h               |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index 7e2bedb918d..2e84cf350b1 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -44,6 +44,29 @@ void target_set_brk(abi_ulong new_brk)
>  {
>  }
>
> +/*
> + * errno conversion.
> + */
> +abi_long get_errno(abi_long ret)
> +{
> +
> +    if (ret == -1) {
> +        return -host_to_target_errno(errno);
> +    } else {
> +        return ret;
> +    }
> +}
> +
> +int host_to_target_errno(int err)
> +{
> +    /*
> +     * All the BSDs have the property that the error numbers are uniform across
> +     * all architectures for a given BSD, though they may vary between different
> +     * BSDs.
> +     */
> +    return err;
> +}
> +
>  bool is_error(abi_long ret)
>  {
>
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index e5742bd6c03..56042ddbc5d 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -246,9 +246,10 @@ extern unsigned long target_dflssiz;
>  extern unsigned long target_maxssiz;
>  extern unsigned long target_sgrowsiz;
>
> -/* syscall.c */
> +/* os-syscall.c */
>  abi_long get_errno(abi_long ret);
>  bool is_error(abi_long ret);
> +int host_to_target_errno(int err);
>
>  /* os-sys.c */
>  abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
> --
> 2.33.1
>

