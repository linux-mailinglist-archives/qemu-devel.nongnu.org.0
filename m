Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3244B187
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:48:33 +0100 (CET)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUIS-0005DY-QW
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:48:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUGy-00039F-Cg
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:47:00 -0500
Received: from [2607:f8b0:4864:20::130] (port=37873
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkUGo-000128-1g
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:47:00 -0500
Received: by mail-il1-x130.google.com with SMTP id h23so21242390ila.4
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5zpnbzrx/b758IJSWBeC+kgASEsXRnWDdgsTZnWZghI=;
 b=oQaeO/jfYLIoLbsdfSQphRn88a8wv3nLTSxBtuyN2ZCCZApOa1j0qq6gvE50RpnGPH
 Bkj6HAf7Ta1VV9IfgE1HKD6qRHzfqMlWivu3FXAGVKEsQXF9stRhuLccfTdYFHioicJ7
 QVJaSK3jChUDe4HMQXkR5YtlwYpvh4kweiYJRmCzjqYMY8IZi7rYH62wRzp/8OW1UwCa
 kP1QbMWJ9+Cd3QWpgRXuXyVSIbdXztmyd/1yarXmWfJZAJUCfPfrRpgqk3/BnS3xytkn
 HovUZhpneSu2WetE9WOs55hcMNirmHlo9xkyy/EiZCmDt7hkxgmZUkwbLvvF2vH0W/jL
 EJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=5zpnbzrx/b758IJSWBeC+kgASEsXRnWDdgsTZnWZghI=;
 b=HNozP/Htr8I6FhjnW6mghuumwlbR0nRnIhkDrEIiJXuO0+SY86AsRDLPcyjbtRPYnN
 +XvxYz2oQf4FVczwc42gyifDGKqTbVU5RWgMKYEVAKCK2P6NcNjHGJ9VqNG+EfRP44DP
 DIDFPjp9/0eHws6m+jrOADhOD/GytMhmiVeg4GFQbY+zmGJKIJ5O/xKK9vMZ0Qyyl/Dn
 PZ61hJMblX1NGIoX2ZQfwU2XtAGsbLTJzpn/MNbw9MCVhrmaR2WDOadvp11gMl01YsWm
 0uwoPyrVJrcIEOGgA/80Ea3sEIBxEKr3gxLnDkrC443WAG0QCvoAIrmW7ISy2+yPQagY
 vEJw==
X-Gm-Message-State: AOAM533kLipsnN59w6PWwHxqINxsng1YPdmC4Qdb9XS829XqkBVFHNSJ
 AwAY4BHxC1gZJNpxJcV5cDV4G0k2m+FrxQ==
X-Google-Smtp-Source: ABdhPJwoXbc0CHDXMXiriVg/4lpoKM9ANqkSZrFziVxgCYLANhfJIPiw9M4oWll43vQzPZaenS/vLQ==
X-Received: by 2002:a05:6e02:1846:: with SMTP id
 b6mr6092292ilv.164.1636476407586; 
 Tue, 09 Nov 2021 08:46:47 -0800 (PST)
Received: from ?IPv6:2603:300b:6:5100:3543:ecc0:2149:6a1b?
 ([2603:300b:6:5100:3543:ecc0:2149:6a1b])
 by smtp.gmail.com with ESMTPSA id m13sm12200727ilh.32.2021.11.09.08.46.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:46:47 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 0/4] linux-user: Fix getdents alignment issues (#704)
In-Reply-To: <20211107124845.1174791-1-richard.henderson@linaro.org>
Date: Tue, 9 Nov 2021 09:46:46 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <766F517B-509D-45C7-94B1-51BCE5D4FE36@gmail.com>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x130.google.com
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
> There are a number of alignement issues flagged up by clang,
> this attempts to fix only one of them: getdents.

Does it make sense to have size asserts for these types? That would =
catch the alignment issues and are cheap to maintain since ABI sizes =
should never change=E2=80=A6

Warner

> r~
>=20
> Richard Henderson (4):
>  linux-user: Split out do_getdents, do_getdents64
>  linux-user: Always use flexible arrays for dirent d_name
>  linux-user: Fix member types of target_dirent64
>  linux-user: Rewrite do_getdents, do_getdents64
>=20
> linux-user/syscall_defs.h |  12 +-
> linux-user/syscall.c      | 290 ++++++++++++++++++--------------------
> 2 files changed, 141 insertions(+), 161 deletions(-)
>=20
> --=20
> 2.25.1
>=20
>=20


