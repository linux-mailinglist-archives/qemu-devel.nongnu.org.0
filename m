Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA243CF99
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:21:32 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmcF-0000IZ-4x
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mflVc-0000MD-8l
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:10:36 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mflVT-00016S-Hn
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:10:33 -0400
Received: by mail-pg1-x536.google.com with SMTP id c4so3347260pgv.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NMuSpFtePuW0FeFj4pDC7ShmNaulMV6zqVNnTfTX0WU=;
 b=BQCAelkR/lFK8i7B+yEzQUOQGoTxVm/f/Kq6DeT3RWr9PB+3/h2uIWBENItd9iPEcC
 0yKBq+yMzdPh2E7GGJLRiyRTkbvH3iX1a5WC+JMfOBMF1SzmT9wl10c3yl3ZcLkEjJhD
 /6alHIgcc5OGzI8g1s9UbsjhQL9Oth8dm6Fz4g1ndZl9vUAy70BRSJtoR7gUpj46TUSK
 y2TCNqkdvwn5oUyRhdS/ckHrEr5iGjJBw6CC3ccOp22Yrw2zi0VQ8goh3oA5hJdsjWj4
 ToyX6bii5r/tJOB9EQqu1QlogUDDDpCb9pK57+iH9lMRJFD1FfSKIee2ABH8E1Q5Cuss
 1CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=NMuSpFtePuW0FeFj4pDC7ShmNaulMV6zqVNnTfTX0WU=;
 b=ssXW7u5Z2uBYOoCBMNldzumaR9LrxdPSZBy9ocUNe8kJZVOyU/aq9W43VXtfBkzN+Y
 pk/olEj3YtcIOTxJtZnh3hOXVqS/OrEhDAlJaYeiZf1Yv+VN50rsVAZNMsIcIJpuC3jg
 i+TdSKhxYk45Y0JNKmsjb9oW422oVsFU1UDSds0miRh+M3arA1OeDbJ48n6fRBZPnJqT
 aLYUUGh65eO3UQtkkPse5cJvNPjIeJfJ0XoPP/m7PC8MwvSB3tAPwyrZf13Rm6pe9kw7
 6strlyaEUjK0arVOPHOdjUdVrz0w+A9vX7g5w23p3hgBNFHF5uZlxLtVi1sWccwUUF/E
 1DFw==
X-Gm-Message-State: AOAM530mcj4QykItFbKxMYExIsQgZWDAunvO/M1dxbc/Vo90Do2/87f9
 Byzq+d7NcOB6bhka2k6gAC711w==
X-Google-Smtp-Source: ABdhPJwOpbOEYjPgtwy9L8fcvnIST24WAk5XgwpYVB8/ZMgIFF5H0dp1pCewUO1ut8GcWz/p+/LWIQ==
X-Received: by 2002:aa7:8246:0:b0:44b:4870:1b09 with SMTP id
 e6-20020aa78246000000b0044b48701b09mr34235238pfn.82.1635351025255; 
 Wed, 27 Oct 2021 09:10:25 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:91db:7d7:39c3:b8a1?
 ([2603:300b:6:5100:91db:7d7:39c3:b8a1])
 by smtp.gmail.com with ESMTPSA id b13sm5195379pjl.15.2021.10.27.09.10.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 09:10:24 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH  v1 12/28] ebpf: really include it only in system emulators
In-Reply-To: <20211026102234.3961636-13-alex.bennee@linaro.org>
Date: Wed, 27 Oct 2021 10:10:23 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <059076AD-CB0C-4CBC-B7F2-90C8666AE650@gmail.com>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-13-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=wlosh@bsdimp.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 aaron@os.amperecomputing.com, qemu-devel@nongnu.org, robhenry@microsoft.com,
 f4bug@amsat.org, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Oct 26, 2021, at 4:22 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
> From: Paolo Bonzini <pbonzini@redhat.com>
>=20
> eBPF libraries are being included in user emulators, which is useless =
and
> also breaks --static compilation if a shared library for libbpf is
> present in the system.
>=20
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20211012162252.263933-1-pbonzini@redhat.com>

Reviewed-bt: Warner Losh <imp@bsdimp.com>

> ---
> meson.build | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git a/meson.build b/meson.build
> index 2c5b53cbe2..bc520b579c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2610,8 +2610,6 @@ subdir('bsd-user')
> subdir('linux-user')
> subdir('ebpf')
>=20
> -common_ss.add(libbpf)
> -
> specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>=20
> linux_user_ss.add(files('thunk.c'))
> --=20
> 2.30.2
>=20
>=20


