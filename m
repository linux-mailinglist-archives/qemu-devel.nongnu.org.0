Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318F4687DE4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZ3w-00037g-Qm; Thu, 02 Feb 2023 07:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNZ3u-00037U-Pw
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNZ3t-0003ss-4C
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675342292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hP3lkDQSwmetPwx97zfP1GdmMhi3TkPObpH/R+52ek=;
 b=XJ5lQJ5kMAzWrwLmn3JK+zDh3vluc4oeID+prHRCtbHQKgdWykQ5nUbCO0GjpYnMXPBTLm
 /BsTfeu9+fZMhTP3rc4nFyZJVWRWoI69fLxN1wuATpWOTJhXK0g7EvrvWafdrmYkdibCfY
 ILXOXspU8C4FjPrqozTPZgWHImikL9Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-462-1CatcOnIN7KDZCil9cA5rA-1; Thu, 02 Feb 2023 07:51:30 -0500
X-MC-Unique: 1CatcOnIN7KDZCil9cA5rA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n4-20020a05600c3b8400b003dfe223de49so163657wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 04:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7hP3lkDQSwmetPwx97zfP1GdmMhi3TkPObpH/R+52ek=;
 b=6SOoxRxcs7sUe+UDn+8Hw14WzZ6cnqKDbGZmooLj3GBlxrhTaMumuAFmg3YybPFhuF
 iyYrXqWJmHlDCwdy2SYtJo7CDFF3Rgo0sdpNhj7sVsSUu83bPOa1TdjrtfK8gBDVHbc8
 hv2z8pQ6m5Hk0Fj5wP3TInq0TGVsEtueM22smqb5C368MwPSVnkuZB5K7QPBbfQuStKP
 FIh/gVDgV5fcIM2ap2Q3lRdLW5zI59/7ld4AwdNAAl4Phyy2wlfEM+4Nojdz4tyoP61R
 kGU4XUdPlyCENP7urnjbhbbt+0VmhK0fEZDVI1uckZ2VcLBxoClY8ryqTBukPDG+KpoV
 XWSQ==
X-Gm-Message-State: AO0yUKXuDFubRrXKmk0cI9Dwog/GA1cM7eTJ1c95zEBsZxN3I24QRwyl
 WZwm0jLCU9JMCy9G0WpWdvjxLMblwBWiD/3pMA7cbiLJoTNKS0sBwIHltBaWBGktziKkf/LTwNG
 FMFfVfNj/YzrtnYA=
X-Received: by 2002:a05:600c:3512:b0:3d0:480b:ac53 with SMTP id
 h18-20020a05600c351200b003d0480bac53mr6075744wmq.12.1675342289812; 
 Thu, 02 Feb 2023 04:51:29 -0800 (PST)
X-Google-Smtp-Source: AK7set/VMqZdskVfU2RVfyOzmFCGbHtGaQgjj93Bj5Xa9Lx/PKO8PbdYrykqG0UjSTKpg6KldXjajw==
X-Received: by 2002:a05:600c:3512:b0:3d0:480b:ac53 with SMTP id
 h18-20020a05600c351200b003d0480bac53mr6075729wmq.12.1675342289579; 
 Thu, 02 Feb 2023 04:51:29 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 x24-20020a05600c189800b003ddc781b1d4sm4350093wmp.33.2023.02.02.04.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 04:51:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,  qemu-devel@nongnu.org,
 dgilbert@redhat.com,  lsoaresp@redhat.com,  Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
In-Reply-To: <Y9utB91u5JFeHBiN@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 2 Feb 2023 12:31:03 +0000")
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-2-manish.mishra@nutanix.com>
 <877cx0mf4b.fsf@secure.mitica> <Y9utB91u5JFeHBiN@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 13:51:28 +0100
Message-ID: <87sffokz73.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Thu, Feb 02, 2023 at 01:22:12PM +0100, Juan Quintela wrote:
>> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>> > MSG_PEEK peeks at the channel, The data is treated as unread and
>> > the next read shall still return this data. This support is
>> > currently added only for socket class. Extra parameter 'flags'
>> > is added to io_readv calls to pass extra read flags like MSG_PEEK.
>> >
>> > Reviewed-by: Peter Xu <peterx@redhat.com>
>> > Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
>> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> > Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>>=20
>>=20
>> This change breaks RDMA migration.
>>=20
>> FAILED: libcommon.fa.p/migration_rdma.c.o
>> cc -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/usr/include/l=
ibpng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/include/c=
acard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/=
sysprof-4 -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -I/u=
sr/include/p11-kit-1 -I/usr/include/libusb-1.0 -I/usr/include/SDL2 -I/usr/i=
nclude/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/inc=
lude/slirp -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgn=
u11 -O2 -g -isystem /mnt/code/qemu/full/linux-headers -isystem linux-header=
s -iquote . -iquote /mnt/code/qemu/full -iquote /mnt/code/qemu/full/include=
 -iquote /mnt/code/qemu/full/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY=
_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno=
-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-prot=
otypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -Wold-=
style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -=
Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansio=
n-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute -Wno-mis=
sing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-st=
rong -fPIE -D_REENTRANT -Wno-undef -DSTRUCT_IOVEC_DEFINED -MD -MQ libcommon=
.fa.p/migration_rdma.c.o -MF libcommon.fa.p/migration_rdma.c.o.d -o libcomm=
on.fa.p/migration_rdma.c.o -c ../../../../mnt/code/qemu/full/migration/rdma=
.c
>> ../../../../mnt/code/qemu/full/migration/rdma.c: In function =E2=80=98qi=
o_channel_rdma_class_init=E2=80=99:
>> ../../../../mnt/code/qemu/full/migration/rdma.c:4020:25: error: assignme=
nt to =E2=80=98ssize_t (*)(QIOChannel *, const struct iovec *, size_t,  int=
 **, size_t *, int,  Error **)=E2=80=99 {aka =E2=80=98long int (*)(QIOChann=
el *, const struct iovec *, long unsigned int,  int **, long unsigned int *=
, int,  Error **)=E2=80=99} from incompatible pointer type =E2=80=98ssize_t=
 (*)(QIOChannel *, const struct iovec *, size_t,  int **, size_t *, Error *=
*)=E2=80=99 {aka =E2=80=98long int (*)(QIOChannel *, const struct iovec *, =
long unsigned int,  int **, long unsigned int *, Error **)=E2=80=99} [-Werr=
or=3Dincompatible-pointer-types]
>>  4020 |     ioc_klass->io_readv =3D qio_channel_rdma_readv;
>>       |                         ^
>> cc1: all warnings being treated as errors
>>=20
>> And I don't really know how to fix it, because the problem is that rdma
>> don't use qio_channel_readv_full() at all.
>
> Likely qio_channel_rdma_readv just adds the 'int flags' param added.
> It doesn't need to actually do anything with the flags as they are
> checked before

I can do that.  That would fix the compilation issue.

But will rdma work?  Because it fakes a qio channel, so what is going to
implement the MSG_PEEK functionality for it?  It don't end calling
recv() at all.


Later, Juan.


