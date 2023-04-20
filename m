Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5BA6E8BB1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 09:49:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppP1n-0005Y5-5O; Thu, 20 Apr 2023 03:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ppP1k-0005WO-MO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ppP1j-0003iN-5W
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 03:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681976901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZrvzXT8Z2wIxNcT+Fv8rMIke6hFw66XFARMiYIjh7s=;
 b=Mxvq8nhCbWuXywlMvVsP53gxO6ReASHHpeM2QjXlhr1zzW0uChUxr9PTzUsioZEOotMRat
 qxNzIRiRpSyxFHNz62zeU83/rlFC8BlPt6d+Xn8DiEJLe3+DqK76+9HKCBv5GmrW+uFC/V
 hO4sNagYTPZr6doZMFd2Aq0+Zv+xin0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-t5EkkaMkNSaZ7NybL3Lk4Q-1; Thu, 20 Apr 2023 03:48:19 -0400
X-MC-Unique: t5EkkaMkNSaZ7NybL3Lk4Q-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-63d3b5c334eso522651b3a.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 00:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681976898; x=1684568898;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VZrvzXT8Z2wIxNcT+Fv8rMIke6hFw66XFARMiYIjh7s=;
 b=MX+8AAkhlsuNyQ5TO3/9y1WpXrSq9Ht+ydC61HgPPMNoPLDcEIC3e0xdRHpo7VFtTn
 Xp5qoo3XPAkfG1qX5lXnN6mh1CqYz2mOWypenzfLuqGVNDNOJb0CuJbQ/fPSodHYau0B
 P2ObIQmy8dn+diUnmjiGm3XbpKVslXP4j0K4DmktnwB1ArnSZANpFTXwByK1csmxqFAe
 gjc+8XGiwDPZnRsQToLmWiig/uH8N33CPRUEgbWTGqyaFxC2WOMl1lPODM3XMEaYLQ14
 ya+aNhotmh/NNcndlkEmtnWjVjxj/+Hnm08Foc36++tM0LZJivyqPx/339xEnMZiqApn
 utAw==
X-Gm-Message-State: AAQBX9c+V4CaRIy4onKrc0HTmkbtMFJ3wXsOIkWUkK+ZdF9gO8nR5OHL
 cfl2s6RhYXa84bA77JxO9om3f5gSnNl4YE+niMzC2dF0K2j+8w51hoSwKFU2YcVLyfgpe6Av4U5
 XGWJgyYdgTPmP40k=
X-Received: by 2002:a05:6a00:1acd:b0:63d:2aac:7b88 with SMTP id
 f13-20020a056a001acd00b0063d2aac7b88mr428999pfv.25.1681976898519; 
 Thu, 20 Apr 2023 00:48:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350b7vLQN9hKpjXe3wyA9eIh8NvoBC0dCj+UOHEu2LoeNAATzm0++CbV0zae1TtWh9U+DIu04iQ==
X-Received: by 2002:a05:6a00:1acd:b0:63d:2aac:7b88 with SMTP id
 f13-20020a056a001acd00b0063d2aac7b88mr428965pfv.25.1681976898195; 
 Thu, 20 Apr 2023 00:48:18 -0700 (PDT)
Received: from smtpclient.apple ([203.212.242.145])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a056a001a9000b0063b87f47062sm625116pfv.127.2023.04.20.00.48.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Apr 2023 00:48:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH] Add my old and new work email mapping and use work email
 to support biosbits
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230320114233.90638-1-anisinha@redhat.com>
Date: Thu, 20 Apr 2023 13:18:12 +0530
Cc: Ani Sinha <ani@anisinha.ca>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB13DA97-D042-49B0-8F19-A7710208F3D3@redhat.com>
References: <20230320114233.90638-1-anisinha@redhat.com>
To: Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> On 20-Mar-2023, at 5:12 PM, Ani Sinha <anisinha@redhat.com> wrote:
>=20
> From: Ani Sinha <ani@anisinha.ca>
>=20
> Update mailmap to indicate ani@anisinha.ca and anisinha@redhat.com are =
one and
> the same person. Additionally update MAINTAINERS and bits =
documentation to use
> my work (redhat) email.
>=20
> Signed-off-by: Ani Sinha <anisinha@redhat.com>

Now that v8.0.0 has been released, reminder to add this in the next PR.

> ---
> .mailmap                 | 1 +
> MAINTAINERS              | 2 +-
> docs/devel/acpi-bits.rst | 2 +-
> 3 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/.mailmap b/.mailmap
> index fad2aff5aa..460aac992f 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -54,6 +54,7 @@ Aleksandar Markovic =
<aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>
> Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> =
<arikalo@wavecomp.com>
> Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> =
<aleksandar.rikalo@rt-rk.com>
> Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
> +Ani Sinha <anisinha@redhat.com> <ani@anisinha.ca>
> Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori =
<aliguori@us.ibm.com>
> Christian Borntraeger <borntraeger@linux.ibm.com> =
<borntraeger@de.ibm.com>
> Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 011fd85a09..1e31cfad32 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1899,7 +1899,7 @@ F: hw/acpi/viot.c
> F: hw/acpi/viot.h
>=20
> ACPI/AVOCADO/BIOSBITS
> -M: Ani Sinha <ani@anisinha.ca>
> +M: Ani Sinha <anisinha@redhat.com>
> M: Michael S. Tsirkin <mst@redhat.com>
> S: Supported
> F: tests/avocado/acpi-bits/*
> diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
> index 9eb4b9e666..22e2580200 100644
> --- a/docs/devel/acpi-bits.rst
> +++ b/docs/devel/acpi-bits.rst
> @@ -135,7 +135,7 @@ Under ``tests/avocado/`` as the root we have:
>    (c) They need not be loaded by avocado framework when running =
tests.
>=20
>=20
> -Author: Ani Sinha <ani@anisinha.ca>
> +Author: Ani Sinha <anisinha@redhat.com>
>=20
> References:
> -----------
> --=20
> 2.39.2
>=20


