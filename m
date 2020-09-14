Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ACA268995
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 12:48:11 +0200 (CEST)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHm1q-0000wp-PM
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 06:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHm0r-0000RO-11
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:47:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40480
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kHm0p-00039G-N7
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600080426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SaR4JTmaSqlvN904/PycN4uOY/zfNJZvN1o8fSD/394=;
 b=iV7+gYcueZZf8gRNB6bIR/R2IAzcOVvYITtRH5UVlQmEKmZh8WPA0XSrTNbDkno9vz2Q+D
 HCz1rBmWiUr8yLuoin7g3vkjX6w1H6UVMSztzuXsGUbcnEpRPw5ZQXtSHB4fpvOUBH/IPW
 2OYFETs4F/oYSeR3Gzuh2gHl6KdlBfg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-J6ey9jgDNGewx_S94RIWcg-1; Mon, 14 Sep 2020 06:47:04 -0400
X-MC-Unique: J6ey9jgDNGewx_S94RIWcg-1
Received: by mail-ed1-f72.google.com with SMTP id y1so9075454edw.16
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 03:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to;
 bh=GPPRIrVWMtY7zZJEOCpPQjLVOYCUrff+PhvOzQTCzqQ=;
 b=ucRoO6HPznLWrRhDnwShtE3G0b2rCKTXimOUsfp1akCeNbvR/jcRmxJZJqksRrojj2
 Y5EJgIG2oVuDCLwsquI9ooMXWBOnVCy38wSX8IMoR2wcfoD3RMN6VEJqvHnu089OPlhv
 jc7OKjQ6SP76RR+3oJzkDb/yAjSYB5tGpxsE9eSiLm8gw3ipkzej/QkSTi+KzxwTR4ZE
 7hTvHEC75GjtbjDgYafek5Ad/yZzpLWGCpF+5h0KFR/D/SxazTBnfhsWbRKIEqXt2rBq
 wr0aH6+5UN8fy50B7hODbHKBeWrZsSH+MyJ+dEyUblTImWMzfMKvgU/MH/f4kgqXKyVH
 /5Bw==
X-Gm-Message-State: AOAM532LmUiXgkiazCRa08t4IlUAf4wu/kfhe7QGuLpf6ufppCcTHUQp
 LqM+JqPjYKeE2j2lojEU0nYYKS0CrarCMsA5NBgwKIQY8DDBDH4viZk4I2UDA4a8vfy8d63WJ1G
 L2866xljFPq+wfOw=
X-Received: by 2002:a17:906:4a44:: with SMTP id
 a4mr13903848ejv.492.1600080422498; 
 Mon, 14 Sep 2020 03:47:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF5tWPg7oRwiZOOqJxmJeYhRWmwMUAoe1QP7EnGL3gzlzQz3IbDr9plS2vmR4khQmDicARIg==
X-Received: by 2002:a17:906:4a44:: with SMTP id
 a4mr13903829ejv.492.1600080422328; 
 Mon, 14 Sep 2020 03:47:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:6047:f58e:7d32:2e02?
 ([2001:b07:6468:f312:6047:f58e:7d32:2e02])
 by smtp.gmail.com with ESMTPSA id z17sm9355912edi.90.2020.09.14.03.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 03:47:01 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add QEMU storage overview blog post
To: Stefan Hajnoczi <stefanha@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20200907150421.8106-1-stefanha@redhat.com>
 <20200914103507.GG579094@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <063f3f71-d7a8-cf8a-7f90-49018d091436@redhat.com>
Date: Mon, 14 Sep 2020 12:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200914103507.GG579094@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JhsoHvmYd44HKt1qHo34ijm4schuOGzNH"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:36:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, afrosi@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JhsoHvmYd44HKt1qHo34ijm4schuOGzNH
Content-Type: multipart/mixed; boundary="UoqxAfThNMEQ83BkPqdisq9D9a2IMWF0Z"

--UoqxAfThNMEQ83BkPqdisq9D9a2IMWF0Z
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 14/09/20 12:35, Stefan Hajnoczi wrote:
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  _posts/2020-09-07-qemu-storage-overview.md | 122 +++++++
>>  screenshots/2020-09-07-block-device-io.svg | 366 +++++++++++++++++++++
>>  screenshots/2020-09-07-lifecycle.svg       | 328 ++++++++++++++++++
>>  3 files changed, 816 insertions(+)
>>  create mode 100644 _posts/2020-09-07-qemu-storage-overview.md
>>  create mode 100644 screenshots/2020-09-07-block-device-io.svg
>>  create mode 100644 screenshots/2020-09-07-lifecycle.svg
> Ping? Thomas, you would you be able to merge this?
>=20

I have pushed this now.

Thanks,

Paolo


--UoqxAfThNMEQ83BkPqdisq9D9a2IMWF0Z--

--JhsoHvmYd44HKt1qHo34ijm4schuOGzNH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl9fSiIACgkQv/vSX3jH
roOLzAf/WmWbXUbM2JOKKnB6r8TuspFHwLJHJsDcW/Toz9P+U2e7/6yKUyw1Gnzz
qHGwJtVy47tu0l2vXLhvZOOPyQy3Ng7xuddXgZtXsUIk8B6JZyUL/PHYBkyizWN1
TbF5qvX4b1y1fzNCnLWDs/rlC6SxL2CEUUfFQYlWHjxEfnj6XmZRoaR6w4GmANnV
sdIdQP7kr+8dQBcIDJrZ6ryweCIoaOA4Fkkz/VBL8PR/KVT5XpsLJXwAK+M4yVb9
BDzQtepP4ZpRMm8nuMgm+WIChogNh++N+XB9Z1Pdyr5OayilJQneVgmDRDJVxVrF
YiWgQ0eMUtsOu+vtiGmwkwRLSKOjxg==
=s3mR
-----END PGP SIGNATURE-----

--JhsoHvmYd44HKt1qHo34ijm4schuOGzNH--


