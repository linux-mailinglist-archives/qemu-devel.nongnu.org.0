Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF29837AC2B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:42:26 +0200 (CEST)
Received: from localhost ([::1]:50002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgVSj-0000bH-I8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lgVQK-0008FT-O8
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:39:57 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lgVQI-0006Lv-Lc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:39:56 -0400
Received: by mail-wm1-x329.google.com with SMTP id o127so11476406wmo.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=654aLg8cJvZRFsRQpQlrwE1XM96VydsUbEQhfkoaMao=;
 b=ERCL3Sv0LAn4ZHcUYQ+UJzKzDX7BCK2PiBkr9Mlj8/Mn0l1CuExGCcFNngMFeuHtKR
 xwf9WZMjH38p00QFw+XB4Cd5vA4uPjxM+al1i6Vzm8GS1fiuoKPKmLhZY7EaQ/6hSvWZ
 mG2Sw8a3UMfGh1E7xWd0CJtt6yvO7MX3mT7YDkVdQ+UmrR84Z/VV/MMw7BKf+kEybZsw
 fWlPiAIbsgFUH+R57CIWdZtRm6iQx4JnfARaUbWrUjPVuTlP+yuEP5rr1VBschmM2WRz
 d+MuZmCM55wxqH8LjwtJ9xXGRh9MY8S6lVHA9us25qB8MpqBdiZvfRce7jV+GcBVJxlD
 GM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=654aLg8cJvZRFsRQpQlrwE1XM96VydsUbEQhfkoaMao=;
 b=fPb9pElYHk9tlEvBPLg4M85Dy1GOYqer2FZShN6Sbjz4/afr6vOU4RpzNcANuuPufm
 zQSrCrSWO9OckLf6YjpliZdMYg6sQPUzWsdE7/I5HM7BctvEMpfs2FOnJgTwkPikCg9e
 JUTWedsGA6ar1RDsAstAOtkn3xmLNHss69ICqCrF44bltUmw2Ffv9WzlKJkoecWo1zK+
 LixCctV1Euejkrz4wGiV92ROXZr0oNXgk7IpIMuNdB7C1aM82j9FbRd82AiNL152f6/Q
 Ce1XoHReuo5zl0uQ/aeCT9V5GhWZ75t8gF1G6Q0UVvymxkceqhIIHoYv+RqZK0+o3QwF
 ZzhA==
X-Gm-Message-State: AOAM532HXkkxuWRVqQ9i7zFrvorRozOZSYFJtOeZnii+/JPULOA3P6E/
 OOByWGwSLTvdYY1NH1Tmszs=
X-Google-Smtp-Source: ABdhPJxnfCnnRaqm1s9AlC/jtAW0TjWA77RkVBzjhhGWMjXcnGtFJuIIt6/YwLIeT43Kz67lRpn8Vg==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr6598337wma.31.1620751192386; 
 Tue, 11 May 2021 09:39:52 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id k11sm28176189wrm.62.2021.05.11.09.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:39:51 -0700 (PDT)
Date: Tue, 11 May 2021 17:39:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v3 2/9] qapi: move gen_if/gen_endif to QAPISchemaIfCond
Message-ID: <YJqzVkWfOo3MPzj2@stefanha-x1.localdomain>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ikLrr1GhRERMwfwL"
Content-Disposition: inline
In-Reply-To: <20210429134032.1125111-3-marcandre.lureau@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ikLrr1GhRERMwfwL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 05:40:25PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Move the generating function to the QAPISchemaIfCond class.

I'm not familiar enough with the QAPI code generator to know whether
schema.py is supposed to generate C code directly. Otherwise this
refactoring makes sense.

--ikLrr1GhRERMwfwL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCas1YACgkQnKSrs4Gr
c8icWwf+P/sekL9UPBtfgEbfgOCVXwoRze2k3mgsZu1MhlrgUE4f3yfm3iu7Q6zt
CTnFrJomJtZPsepzccYNTD4pZ1KuLptsd9edUYpjZ/Es2yZehqgC24gBKNcMMsEH
CdJwsl7TDdcJG8/knY7Lp3lTdgorcQt2VrcvHLFa8ersE/Uk7GM8GK0+/yCsQrhj
a8rYkB7n4VG5HIWHW39oqPK3Wme++rkQNxqb5FViTMQwigcMa8K0UHu6xePwccli
TbhAG3ENN9bmpKnNRtR5Ci0uxnt890TMD9WtNQr+N2aYmZwRZ2EkBCABHTmH8UJ9
1VbWQq3MzLIXEKYZsijOFIPb2GSt0Q==
=otp3
-----END PGP SIGNATURE-----

--ikLrr1GhRERMwfwL--

