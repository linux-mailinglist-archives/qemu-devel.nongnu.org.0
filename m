Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E782205441
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 16:16:38 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnjj3-0003gb-5q
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 10:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jnjhV-0002Gr-Q7
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:15:01 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jnjhU-0003kF-1p
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:15:01 -0400
Received: by mail-wr1-x443.google.com with SMTP id q5so8308054wru.6
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zdh8nL83ChuffQXhGtfWbDudk9KnDwzijLPZPRPHH0s=;
 b=WX53TdyEOL2Fo79GRCZqgYC6KKGiblNFE/ITPrScSybLas7aU2oL7ZuTNK7+ocIhog
 oU4DVKwNUS1I9ZAq3QOq1br7HlBHkpok6rjEY2tpN4SlONgVJh0Xio0QbrO5YMooGyJf
 pKiq/StJAjTCq94lPwUYaoxvat1JI0V6DQT1MwAvZfIs+3CLPawCIJb+BFb5Djh53+9R
 HkG3u8lplk/PxM3qN9u3/miK7o6eWTvk4GdndpKOQKWeuBeRLeYyKmlv7X/3PMC/91b5
 +yQuC/yKibJxCzxBXKuVFfY46GXCLxGpfCMra1mh1r5CeLuKayLEKMcjeglsoQy7KMz6
 ILtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zdh8nL83ChuffQXhGtfWbDudk9KnDwzijLPZPRPHH0s=;
 b=LbkkR4gApgNo7kM89+kjPvc0gwOBWJLgsT7ncZK2GTJ4f2JCgU3cHa3r9jqD/NQHbJ
 FZ7LpiRIXw71FzAb3jktCPH0jZoijTi7NSne+eng6aYR8KN3OsoONhsgPbpGkXtjgjIZ
 sb9HU/qQnfoy2xavEYI5/edN6kwgfYoq2m/LUkrUYp2wyP9sWcFSGD1rDdxgcrMnASa2
 acUUyPHGtxq70UsQf8vjSk9dboEL5UIZeSstzU/lX+rDqX4i7afZqj3urjObdnA3fN8T
 jzD/OZA7dIMuBsVPAKtdv5qbl6MzYmnPSHaqwfAMkOrGEJTuqVG1mxlpipfm0aZHb20d
 ICKQ==
X-Gm-Message-State: AOAM533qTAEWrYuuSnMQMyV93NG/Jp4xwPXJcyCNL0awMGxk+2USmEqF
 wTkLk2yJAnH4q/0blg5WiR8=
X-Google-Smtp-Source: ABdhPJzA+4G7E3HEtncwiCgPg8GBp+tEq31lbqN2brlDBBAFZ0b6oSm34rucVXvVHL29Mvel1L8i0g==
X-Received: by 2002:a5d:54c9:: with SMTP id x9mr26786987wrv.247.1592921698380; 
 Tue, 23 Jun 2020 07:14:58 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id v4sm7780125wro.26.2020.06.23.07.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 07:14:57 -0700 (PDT)
Date: Tue, 23 Jun 2020 15:14:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [RFC PATCH 3/3] fuzz: Add callbacks for dma-access functions
Message-ID: <20200623141456.GK36568@stefanha-x1.localdomain>
References: <20200611055651.13784-1-alxndr@bu.edu>
 <20200611055651.13784-4-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EVcIhgQsEzAXu06J"
Content-Disposition: inline
In-Reply-To: <20200611055651.13784-4-alxndr@bu.edu>
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EVcIhgQsEzAXu06J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2020 at 01:56:51AM -0400, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  exec.c                                | 17 ++++++++++++++++-
>  include/exec/memory.h                 |  8 ++++++++
>  include/exec/memory_ldst_cached.inc.h |  9 +++++++++
>  include/sysemu/dma.h                  |  5 ++++-
>  memory_ldst.inc.c                     | 12 ++++++++++++
>  5 files changed, 49 insertions(+), 2 deletions(-)

Please rename dma_read_cb() to fuzz_dma_read_cb() so the purpose of the
function is clear.

The ifdefs can be avoided by defining an empty function when CONFIG_FUZZ
is undefined. In a header file:

  #ifdef CONFIG_FUZZ
  void fuzz_dma_read_cb(size_t addr, size_t len);
  #else
  static inline void fuzz_dma_read_cb(size_t addr, size_t len)
  {
      /* Do nothing */
  }
  #endif

Now the compiler should eliminate the deadcode:

  #ifdef CONFIG_FUZZ
  if (as->root == get_system_memory()) {
      dma_read_cb(addr, len);
  }
  #endif

becomes:

  if (as->root == get_system_memory()) {
      fuzz_dma_read_cb(addr, len);
  }

Hopefully gcc and clang will eliminate this and emit no instructions
when CONFIG_FUZZ is undefined. If not, you can simply pass in 'as' and
'is_write' too:

  void fuzz_dma_read_cb(AddressSpace *as, bool is_write, size_t addr, size_t len)

This way the conditional is moved inside fuzz_dma_read_cb() and deadcode
elimination becomes trivial for the compiler:

  fuzz_read_cb(as, is_write, addr, len);

--EVcIhgQsEzAXu06J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7yDl8ACgkQnKSrs4Gr
c8iQmgf+OK8zpI9HIAcefHt27an+veCpRrqSPCAx1G9gQRCfLmNNVwqiW//PHCxL
hDegTZSALqQOkZztlcbceVj0LpMDNuxGDSiLJ7yD5Sv0maWsDYUI+7gAUcu8RBW9
UdGDkQP3M6FxGbjAsBF5wovHNg4UmhRCfzYNPf+itCF6RyeeMp22iAza+LGI+Pw7
VhAm5R4lI+JXJ+9DBUHLo1kjb2yKJ4+/pilYYZ0CVhYhh5N5wU0Ohj+pBf1V3D7A
X7PbmpB58hzP45Iz53V1bhj8qoHSGNyZzf7PyZ3W3kVO+T4QhCaidtwERtZrVvho
R81zxu1bDoHdcyjPn72E8NiWMPPZug==
=3cTO
-----END PGP SIGNATURE-----

--EVcIhgQsEzAXu06J--

