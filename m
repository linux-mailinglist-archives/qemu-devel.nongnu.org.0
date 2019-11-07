Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3838F2F39
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 14:27:40 +0100 (CET)
Received: from localhost ([::1]:42398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iShp5-0007tF-Kw
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 08:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iSho2-0007Qo-8x
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:26:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iSho1-0002aL-9i
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:26:34 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45907)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iSho1-0002Zg-3j
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 08:26:33 -0500
Received: by mail-wr1-x442.google.com with SMTP id h3so2961208wrx.12
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eiFdKnvhAPIIfC89HK/3Nedg5WpM1dbP996DOBIdu7k=;
 b=UXcr9Ca959DJX2xrccXdol3If/70Uuofl0sovUfgr6QqzoTKLKkk9FRvAqczj/g3mK
 cMHGS+gLuPpVvO+hmSrxUNX5em/Tyd2uMk9kxtKGe4rP04nR3TnyS5faAAM4Rh5F/+lg
 7VVzObltXmxN9IYsfJ2fUlKI3D838muXOHLMmkwxffRIUe+DCpt+t2OTb63GfCspXxcU
 IrZqKIFoC7nFhLGAKdrjfUNbMYAUx3xI+LSv4oLNAoouko5rmRi87pfU23tdeJVnaR96
 v/ABjn2U7GgofBZqA2EUS6INDAnfCtSodfnsWF2DmGp+Z7AFTu1KpE19cbQEvmjM/g3N
 5Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eiFdKnvhAPIIfC89HK/3Nedg5WpM1dbP996DOBIdu7k=;
 b=jLVhIbUIOUJAfBoW+1v6kTDwYa2a1XqyR90Q0QoJDXxippSU9+puXhMB5S54BEqClB
 IlsEKGBTNFDWPkg7EF/U6ZF2HNIgFSt3gaAv+EBGKfjZH/En14Yymgbjtn8UWkWz/AJ0
 uM2EzKhgpqY3YA4P97ufBGmTUU1gKBHKoDc3dJffrN9Ei5uGusSMbF2bQya7dmSK0nsZ
 v0lE7H3xRQm+3/Nuax8JuplGvgsgU5TQZCFSmKHXMNl/CZAnNcvWerzOMbGzKxCtLSNi
 rKWD2dbu9eqOA7BPuxuXR9+Y8A4DwmPToxOngPqkTiSaEMGtfc6FJlEu7zisXHbf/ZUa
 viCw==
X-Gm-Message-State: APjAAAX4qMQHOp3iVkjj33tb81C7e5S/bvczs4dwjpXTuddfLRJpv3Xl
 /N1D5nDBAB5XzzdpjUxy71kEus1xVYc=
X-Google-Smtp-Source: APXvYqyHwry9dpct8L/Glk0TTUsNb/6SPvaL6m5URQNqBagF1ATpfo4ndfmCeeYNBTjNRdVk2PH3lw==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr2756655wru.55.1573133191625; 
 Thu, 07 Nov 2019 05:26:31 -0800 (PST)
Received: from localhost (77.119.131.75.wireless.dyn.drei.com. [77.119.131.75])
 by smtp.gmail.com with ESMTPSA id t5sm1956154wro.76.2019.11.07.05.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 05:26:30 -0800 (PST)
Date: Thu, 7 Nov 2019 14:26:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [PATCH v4 18/20] fuzz: add i440fx fuzz targets
Message-ID: <20191107132621.GD365089@stefanha-x1.localdomain>
References: <20191030144926.11873-1-alxndr@bu.edu>
 <20191030144926.11873-19-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline
In-Reply-To: <20191030144926.11873-19-alxndr@bu.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 30, 2019 at 02:50:03PM +0000, Oleinik, Alexander wrote:
> +static void i440fx_fuzz_qos_fork(QTestState *s,
> +        const unsigned char *Data, size_t Size) {
> +    if (fork() == 0) {
> +        i440fx_fuzz_qos(s, Data, Size);
> +        _Exit(0);
> +    } else {
> +        wait(NULL);
> +    }
> +}
> +
> +static const char *i440fx_qtest_argv = "qemu_system_i386 -machine accel=qtest"

Binaries are named qemu-system-TARGET.  I guess nothing looks at argv[0]
but it should use hyphens instead of underscores.

> +                                       "-m 0 -display none";
> +static char *i440fx_argv(FuzzTarget *t)
> +{
> +    return (char *)i440fx_qtest_argv;

.get_init_cmdline() should probably return const char *.

Otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3EG30ACgkQnKSrs4Gr
c8jySQgAri1aoBrupHF3Ob8HcNw7Uz38GvbK1iN91VJD3lkAAewjl0laCeEzbE/l
P99g+2tKsHjaWdJZUBNxV7MeW8ZtZTusSEg0hM4kU9K+JtwFSKK9pVGbe4cnl59i
oB8RJuthELT/LJk4xSSula1R89xtWGut8++xuirYVEQi8TEtrBG+4kvy4DBJvtir
D+8gcbVUCNJdiuAyHd/Vezj3EzOzkK2LieJXE0d4jKU2bvdaKaqRny9PD5KiRQe2
SXoxGF+WKtPRbK7nFdhwayBQQRJhuBNk8H00hRWfAGbstC+0r5uJobp6V8FnkV4f
ZT+uaq/SREfn/uhapS7iz+mhsYlOaw==
=2AD8
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--

