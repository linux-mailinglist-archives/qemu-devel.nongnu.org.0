Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6B342B3B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 07:25:19 +0100 (CET)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNV2z-0003wC-UY
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 02:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNV0t-0003Q9-VM
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 02:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNV0r-0008TG-FF
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 02:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616221383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBLTVH7J4p+jgob0X6h7HLR5gEQo9IIKi4nHXNeu9Q0=;
 b=JpnxZt2v8etTT+1SMXZkbDM1cVpv9xlSIoUweibsQbT+S653i4AhfMM1A9CEZ3cLpKeDbV
 CoiYj5tSWWu3DCY7Bmt8QIfoxSu5rjv1kAKEACCK7WQuXrJLwN+LcR2/wnZU9TD9Ijc2N7
 pTMeZOroNBNnAvhydfAUyx3S7YdrnzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-4r5CJI1mOpaBbglFCgJEvg-1; Sat, 20 Mar 2021 02:23:01 -0400
X-MC-Unique: 4r5CJI1mOpaBbglFCgJEvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6D7287A82A;
 Sat, 20 Mar 2021 06:22:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD5E46;
 Sat, 20 Mar 2021 06:22:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECE1B11386A7; Sat, 20 Mar 2021 07:22:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 3/6] blockdev: with -drive if=virtio, use generic
 virtio-blk
References: <20210319202335.2397060-1-laurent@vivier.eu>
 <20210319202335.2397060-4-laurent@vivier.eu>
Date: Sat, 20 Mar 2021 07:22:57 +0100
In-Reply-To: <20210319202335.2397060-4-laurent@vivier.eu> (Laurent Vivier's
 message of "Fri, 19 Mar 2021 21:23:32 +0100")
Message-ID: <87tup6e43i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <laurent@vivier.eu> writes:

> Rather than checking if the machine is an s390x to use virtio-blk-ccw
> instead of virtio-blk-pci, use the alias virtio-blk that is set to
> the expected target.
>
> This also enables the use of virtio-blk-device for targets without
> PCI or CCW.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  blockdev.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index 5cc7c7effe9f..64da5350e3ad 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -969,11 +969,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterf=
aceType block_default_type,
>          QemuOpts *devopts;
>          devopts =3D qemu_opts_create(qemu_find_opts("device"), NULL, 0,
>                                     &error_abort);
> -        if (arch_type =3D=3D QEMU_ARCH_S390X) {
> -            qemu_opt_set(devopts, "driver", "virtio-blk-ccw", &error_abo=
rt);
> -        } else {
> -            qemu_opt_set(devopts, "driver", "virtio-blk-pci", &error_abo=
rt);
> -        }
> +        qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
>          qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
>                       &error_abort);
>      }

Acked-by: Markus Armbruster <armbru@redhat.com>


