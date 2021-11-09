Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74144B184
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:47:27 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUHO-000295-Hj
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUEs-0007hP-2K
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:44:50 -0500
Received: from [2607:f8b0:4864:20::12f] (port=40540
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUEq-0008Vd-1l
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:44:49 -0500
Received: by mail-il1-x12f.google.com with SMTP id k1so21248995ilo.7
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DJx3TZJyFKP0wooDwBBtk93uthmC7mBWetwwQWKL+gI=;
 b=fV4ySmgZbPjA6MhKtCoSN3xGBDUbUK1ms1E97gu9+w+VOW2JDU20hLyUeUlmXeyJ8t
 UgbOrFIG4TK0wkfXmOpCURoAfYmfT6sda0lDGEATRot/CnYv6ZHaiFfNNMsnekP5HgC2
 6PfmI5KkclAuOALTlF9zJioC+elcB9Sr5mMYuW8YITQo9tlLKS+iKmDH8CdeEirRkNye
 BvNfbTsH9giDwnWAd2a5tpJFDNEH1U/Zz3xKeKIeZ9SWCOwRO59t2ZqqDwpxM1HbLL2i
 TZzYfE+Znr2thbIpIaB+miMjz5U0sZLQqmNklPfg+s3DzawB/MIvJ3YU3qnic10hxlgV
 FcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=DJx3TZJyFKP0wooDwBBtk93uthmC7mBWetwwQWKL+gI=;
 b=A1A7eQqD/MrUnNjpfUbodUofK8WJpKcw0IJm86MfZ7EjpVorDIfAyQadHXc2qgFFxk
 YEmGiaSej6x+c1IxlQdNp4B6EwBirGNen7C0RO6GwTr8z2KnvuIvvSw1Rn7+Tee/H3/v
 R4qo0MQRz06wWRr0OhXLq0a2HPCKUFhpnRuUHjfh7wvyjNgC+vU6FZgNE3eXDcwKhXhN
 cRJCJ4kZpOTQKSkukcQT6zvH9FyGIvz+y+oUU5S8ZGPSzlSNthJn9hkPLMx6kXqbAwPL
 TjsfiDQLaMQ0hdECBvtNvDMNWxKSPaYDZG30EVSkTUINkGsaS+c6PVwFL4ZR0O1RqIkI
 3OsA==
X-Gm-Message-State: AOAM530eFVqePFAgpIyOXw+7No6xau1HgZ+A+SiIaILKrkpv0HKbLsXS
 4HVL2FwcFJwXEJv2V6/XGaLjOw==
X-Google-Smtp-Source: ABdhPJyUn/qtEQxNkFgf666Y5cAgE7HeitXzv9uJye2PFC5WXoQ/Azkx54MXaMdEInINqef3GlQPNg==
X-Received: by 2002:a05:6e02:178f:: with SMTP id
 y15mr6151604ilu.126.1636476286965; 
 Tue, 09 Nov 2021 08:44:46 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id i16sm10197369ioh.54.2021.11.09.08.44.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:44:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 3/4] linux-user: Fix member types of target_dirent64
In-Reply-To: <20211107124845.1174791-4-richard.henderson@linaro.org>
Date: Tue, 9 Nov 2021 09:44:46 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <DE74CDE5-3990-4F2A-832A-E9002AC6AD85@gmail.com>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
 <20211107124845.1174791-4-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 7, 2021, at 5:48 AM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> The host uint64_t (etc) does not have the correct
> alignment constraint as the guest: use abi_* types.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> linux-user/syscall_defs.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 98b09ee6d6..41aaafbac1 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -437,9 +437,9 @@ struct target_dirent {
> };
>=20
> struct target_dirent64 {
> -	uint64_t	d_ino;
> -	int64_t		d_off;
> -	unsigned short	d_reclen;
> +	abi_ullong      d_ino;
> +	abi_llong       d_off;
> +	abi_ushort      d_reclen;
> 	unsigned char	d_type;
> 	char		d_name[];
> };
> --=20
> 2.25.1
>=20
>=20


