Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330F6B1061
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:46:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxqg-0000TZ-HD; Wed, 08 Mar 2023 12:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZxqd-0000Ok-Qe
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:45:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZxqb-0000LH-K1
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:45:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id g3so16163456wri.6
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 09:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678297504;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2b3l18QStlBtG93sm8H2YqTMy+4DIUd+ubdl4gZ/pY=;
 b=hFVxBQBTpUWFAVGyfQqDJymt+WdChvYIGpq/a5P0hmDrwrmZ4JwIkYnKNgXYyy8ekr
 LTW9gyWKexR3GbUzojlXFS4uxp9xfcRvteipGaqfCKWH19MZYx3PRDX/rjO0Grc74nIA
 YPC7Mnc1ACfUHnYbUkb6f0ZGKoefYHDG/uPvmgRnuftl3WWO15vRoaSknezNFoG7pGpp
 T01BLuF0s0eWQX3A2HZ9jv8er2GRS6Xgr6M/HT9cJcWpMmWVZ5nj7UsQ3Q2sBU3YTWb9
 /3tYbwJ18h8AHGxEWtv4kRWkYWhFE9pMZc+NCO4KpEuDtjxD8ii/jxC2WiBF8fIz1uJw
 hBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678297504;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=S2b3l18QStlBtG93sm8H2YqTMy+4DIUd+ubdl4gZ/pY=;
 b=K/PevnFrKD1jlLZZqTTcLXu6jR9Kbp39usDm5i9rICU2BN4lJj7DYs6k4bhYlCkCMu
 oO3L2klvIpRpijzt90EwUBva5Yc7WYml8eKpHqQJUceRaqQagv9pTgoguI6ucguKrtTD
 QrTlEnLFNdFfFxo8+htJ+qJU1f5vAv0TTfcdMhJBk0FnI2MxucSFIQSktYIpR6g6itRJ
 2gPgDDuqz0p3fNNfJAGUYqebjFWJHRwz5iiAm9+gNdzw7fsV1ZtVjVKbGMDJuQbskK+t
 iy/2GsF7WbNIvayjmTAdUxTdd7xSRgXABuM1etGVFyl5WsxvBe4QGmOYRALx4MWpK8ym
 aBSA==
X-Gm-Message-State: AO0yUKUZbExijdHt7E+n4hCmwIFG8H6ZcOfRIKkRiI8cIMRcAspoiox5
 lUBwkUWoCBF810icritVNrR6oQ==
X-Google-Smtp-Source: AK7set+7hv6PpUiBz2FCBFACsVYephy0yR+rxxDutGDRFDw1wBKgeN/Ghd7fHuTVGXBL1LutKhAgLw==
X-Received: by 2002:a5d:5746:0:b0:2c9:5dd8:2978 with SMTP id
 q6-20020a5d5746000000b002c95dd82978mr12818715wrw.59.1678297503848; 
 Wed, 08 Mar 2023 09:45:03 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c19c900b003e9ded91c27sm147496wmq.4.2023.03.08.09.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 09:45:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28B5D1FFB7;
 Wed,  8 Mar 2023 17:45:03 +0000 (GMT)
References: <20230308111952.2728440-1-dwmw2@infradead.org>
 <20230308111952.2728440-3-dwmw2@infradead.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu
 <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] tests/avocado: Add Fedora 34 distro, including
 kernel/initrd checksums
Date: Wed, 08 Mar 2023 17:42:45 +0000
In-reply-to: <20230308111952.2728440-3-dwmw2@infradead.org>
Message-ID: <87pm9jnnmo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


David Woodhouse <dwmw2@infradead.org> writes:

> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The kernel in Fedora 31 doesn't support 'xen_no_vector_callback' on
> its command line, so add a slightly newer version as a prelude to
> enabling avocado tests for Xen guests.

Why slightly newer rather than current release?

Our existing Fedora guest builds cause all sorts of timeout issues
running under TCG and seem particularly heavyweight considering the
coverage we manage to get.

>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  tests/avocado/avocado_qemu/__init__.py | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avoca=
do_qemu/__init__.py
> index a313e88c07..49e414e267 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -485,6 +485,23 @@ class LinuxDistro:
>                                    ' console=3Dtty0'),
>                   },
>              },
> +            '34': {
> +                'x86_64':
> +                {'checksum': ('b9b621b26725ba95442d9a56cbaa0547'
> +                              '84e0779a9522ec6eafff07c6e6f717ea'),
> +                 'pxeboot_url': ('https://archives.fedoraproject.org/'
> +                                 'pub/archive/fedora/linux/releases/34/'
> +                                 'Everything/x86_64/os/images/pxeboot/'),
> +                 'kernel_hash': ('085fc6e47f2e3a271b591f3e56739ca9'
> +                                 '4c16718837a5f431ab95468e1e95f9eb'),
> +                 'initrd_hash': ('d6cd2e03e8188eed6c896fd65ff05f81'
> +                                 '2c4c1c8777d630b5909e9a1a4627e337'),
> +                 'kernel_params': ('root=3DUUID=3D386769a3-cfa5-47c8-879=
7-'
> +                                   'd5ec58c9cb6c ro no_timer_check '
> +                                   'net.ifnames=3D0 console=3Dtty1 '
> +                                   'console=3DttyS0,115200n8'),
> +                },
> +            },
>          }
>      }
>=20=20
> @@ -513,6 +530,16 @@ def pxeboot_url(self):
>          """Gets the repository url where pxeboot files can be found"""
>          return self._info.get('pxeboot_url', None)
>=20=20
> +    @property
> +    def kernel_hash(self):
> +        """Gets checksum of the pxeboot kernel image"""
> +        return self._info.get('kernel_hash', None)
> +
> +    @property
> +    def initrd_hash(self):
> +        """Gets checksum of the pxeboot initrd image"""
> +        return self._info.get('initrd_hash', None)
> +
>      @property
>      def default_kernel_params(self):
>          """Gets the default kernel parameters"""


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

