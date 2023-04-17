Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187186E4B8D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 16:34:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPuu-0007Nr-9u; Mon, 17 Apr 2023 10:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1poPus-0007Nb-3U
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:33:14 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1poPup-0002JA-R2
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:33:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1681741987; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=lyI2nMeSeKg30F+bchjAPL76K35+C2lYHIj3HduuRL1GXIMeITfrJB30fU/QtGSpX/
 xSIWoZnzmVcYRz60VKkFFjricAsWkVXXwxdNWEXNq8rEEHewT8soI/GYqMADwx+e8igE
 lWj1VoSRpsIHcLvYibRAHPsMDwjdpf2yAyOKrNA5U9lhpRd/3G3dzjggQEmp6A+1nlv7
 wQ/Jvc1fV91Z0yLJSmaDbT5YbSah09BAGHN69IiD0lPT91crCI0aErP7nKk+4AAlrbu/
 jMTcsaOPXig+4dg7fk3e7YXoRmQdE9B8NyhPYU8dOwOvsIaEOz7i+cR3Y/s9fP3uXDFf
 E95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681741987;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=B3WfWHs/JYEZWbQB5oewQQjrpsQ60yBAPN3pjZSbEDQ=;
 b=EsW8Avg99bOa1/FHeDkEZv0uTnrrL4F7oAL+ajhG4qlCo7qX01PQrjRQqUqFK7ifxk
 iPWObadLuv2UUALAMrfjfTDPAevfWsplN1C6LrdFN/C1TvFgbMRpxBI0GGYSVJmnUJXQ
 O09tgfwHCh+mKZ6Q1BNAQ3yJvl+Ie/E8PpTRIcZgvt31tEjY+GS+lfB8wpHIKUwJTbMp
 js2YoJ23iEX3H3wv6JeGYiEv4J3GcuhWSQCBx7AGDyapeEMng+6+qotUnJsq8K3AS99P
 zz9tnegFOWUO4J1IB02ZHrIqyY9234pfeN50GZH4KV1xaNwyH82eFo2ePAUOf6W2s68j
 QPRg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681741987;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=B3WfWHs/JYEZWbQB5oewQQjrpsQ60yBAPN3pjZSbEDQ=;
 b=ZNxEeccHl5caxhhoXFV+oaToeZMj/3+I1HhtNAlM8g9jV6pS/qwwTVTRJC2XxpQ7hr
 mn7JgK1FkzvMrGyob1t+lRbbmQ97Goz7yKW5HfZ2uf5HYOJ+lAzV70/uvtkS+HJ3nkwo
 pdTTX2cVvhTmevroUSdaqHzBmP8ehNYTjcnq6/u9rHDkK1ZDSwlkGjdCPAxydibn9yWi
 FIQJmyAOVfJ+SVHbnexkr5gdrH3xAgmKsUYe8pL5SstdmMCdTGYj5WcS9IWyvazk90Sr
 +qjvpzxyxoP80eSO0wXAzfEYdasOX6dVvh8OI5AD7U47d+BV0oe2WTgpCJs1nPvbv9xe
 q0Lg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681741987;
 s=strato-dkim-0003; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=B3WfWHs/JYEZWbQB5oewQQjrpsQ60yBAPN3pjZSbEDQ=;
 b=nJjFLkXAAI3PFaeGaGfkCgo7vlw3OeJZh7HVVX14xP/9B801C5VW1WaA+SzRLc1X1N
 2tns0QaW2fB0URohIjCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BBKIYx7sXVVhU9+brASRK3ZldJTnR7IDHecOJA=="
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3HEX6jnH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 17 Apr 2023 16:33:06 +0200 (CEST)
Date: Mon, 17 Apr 2023 16:32:58 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Message-ID: <20230417163258.65586555.olaf@aepfle.de>
In-Reply-To: <a408b7f241ac59e5944db6ae2360a792305c36e0.1681735482.git.pkrempa@redhat.com>
References: <cover.1681735482.git.pkrempa@redhat.com>
 <a408b7f241ac59e5944db6ae2360a792305c36e0.1681735482.git.pkrempa@redhat.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem,
 kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0/8Mfi.QH0.oOg60TIx.tr=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=81.169.146.167; envelope-from=olaf@aepfle.de;
 helo=mo4-p01-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/0/8Mfi.QH0.oOg60TIx.tr=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 17 Apr 2023 14:46:54 +0200 Peter Krempa <pkrempa@redhat.com>:

> Switch the dockerfile to 15.4.

Given that Leap 15.5 is essentially done, please skip this meanwhile stale =
version of Leap.

Thanks,
Olaf

--Sig_/0/8Mfi.QH0.oOg60TIx.tr=
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmQ9WJoACgkQ86SN7mm1
DoAweQ/9GHXVMytIcC08hoQ6ayMPchC9X1je/nfJFuOVSDTnB/iTJ1nb21sGjWJZ
54M/LQyagNzD6QuyPbG+nbtI4wFhrRb6+UkxV7yCg/K2cgtd0nQjNbNgBXfdEQjM
ap5MxNFcuywHfxElJIp5Yf219TjS5FgxMd+kyFr0YvIC6ipo+ubx5Ek7BnaOIyUH
lforWulkAOgzlda92nXMKO7J+X+ij9T232OVh1QN04C8yj9l2GXCYdxFgqc43F28
Y9x+kuFq9VlfohUp6W203CzrQfFp5Sdfjh1zFIpgN6Q7FQCmBCKzx+5I9iMwbQC7
r2vxHOodJivXKKu7yLRiUGRHb3iGBwNyKas564+EgoXstd4fOZmzx7eumz9mVJio
tANHGLEi3AhDa+iJDyCqQCUKa5j5t46w8MmnxhJSLe5+pSr9zuPf5qkRlZm0p4FA
eNXLMIg6httRhIYFamJT6AD/VcZya3GMv3lMo1trLLjvJ48LZUhwXmQ5XJ2+nFqE
hvFlNWyifsd2yJs2ceHc8Dlw97QK06mhySv+6TkVTv+j7lgDxFUG76JdPS6LOcAz
xYC6YvgTbhYvdZBgq1gEptZ4q8QmkrpDP+tty82flZwquJsvetpCCeEeurKBRJ+e
+8OEBCj4Fqs4i1DcbnmjjBX/t9wTSplis4UiDxNEQBYSZhp6EyY=
=hg3K
-----END PGP SIGNATURE-----

--Sig_/0/8Mfi.QH0.oOg60TIx.tr=--

