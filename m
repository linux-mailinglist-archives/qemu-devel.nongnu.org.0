Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79186687D40
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:23:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYbm-0000Zw-KB; Thu, 02 Feb 2023 07:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYbc-0000Z1-7O
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:22:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYba-00065v-Eg
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675340536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuptMoOERKi/o207WNrjdEoaX7u7evT6Y0Y4ZRF/X9g=;
 b=QbG5zErRaLLQ5wRrnSHJfUZrx0/1wzW0ALqIzu64axrUFWxSXsIkCLmg94ciD9sDk1H/Jo
 MPoqsIxnxz2nsWIFCSrc3kj3MaebIHsdg1MkaZmiXwy6Uc1G/1QbXX1/PWvFmfFewMkSX2
 DT7nZzXbc3E9Um02pv5jHFojc+O63Sk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-atU6YBjuOfyepq5HRDERrg-1; Thu, 02 Feb 2023 07:22:15 -0500
X-MC-Unique: atU6YBjuOfyepq5HRDERrg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o2-20020a05600c510200b003dc51c95c6aso2006891wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 04:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wuptMoOERKi/o207WNrjdEoaX7u7evT6Y0Y4ZRF/X9g=;
 b=xoqon9EDOxzSMs6BS49A3Gk7oIyFPjolXkNKDwBSSxEQmREZBLeSO22D5cH3oVWcAQ
 mgc1/vL39HXgm+JS3MNvwodQwkXUyuqPpmWs/d7aP9X5og+X3gxz5mrVtd9VOCBw5jTU
 i/ezFn1cXhzNPLXS+WSevBQVhJ6/Mfrsa8pS5+meN9C5YpwgiNDMn2VU//FneAKCCGCg
 1x0/N9M/ijXF+k6JRcSDGl+5a1s5FL4Q08xI+5OvnJrQePElRik6Xi3o61hhTLrTxD0p
 9lx4aDifL4LX5ZLicC80d9Ld7EY0OvsKfFSZtK8oI6ZY/PuxNrlprgXrAQWV8gINt1Fo
 5tVg==
X-Gm-Message-State: AO0yUKWrFs2octc//Rbt5M5YmuUEDvVN4YHG/rAOz7Uy3xF4xtcfQ6Bv
 2PbenUwzrNuTbqVwPJ+snuyq4Dn8r0+PaCBQh5Na92eHY9lCJw5+zNT0kT18Ykp5ecCz1NHmpET
 R/iTiMZB0x3cN00k=
X-Received: by 2002:a5d:660f:0:b0:2bf:ad43:8f08 with SMTP id
 n15-20020a5d660f000000b002bfad438f08mr5358830wru.14.1675340534110; 
 Thu, 02 Feb 2023 04:22:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9MILB6KAgCzxyJogxu7nbctOyWq0uPM12P4Gu2SI3UaY1m0RsFuKVgsV/f3cz3oOhIgHBXUg==
X-Received: by 2002:a5d:660f:0:b0:2bf:ad43:8f08 with SMTP id
 n15-20020a5d660f000000b002bfad438f08mr5358817wru.14.1675340533900; 
 Thu, 02 Feb 2023 04:22:13 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfdb4c000000b002bfb1de74absm19738924wrj.114.2023.02.02.04.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 04:22:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  lsoaresp@redhat.com,
 Peter Xu <peterx@redhat.com>,  "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
In-Reply-To: <20221220184418.228834-2-manish.mishra@nutanix.com> (manish
 mishra's message of "Tue, 20 Dec 2022 18:44:17 +0000")
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-2-manish.mishra@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 13:22:12 +0100
Message-ID: <877cx0mf4b.fsf@secure.mitica>
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

"manish.mishra" <manish.mishra@nutanix.com> wrote:
> MSG_PEEK peeks at the channel, The data is treated as unread and
> the next read shall still return this data. This support is
> currently added only for socket class. Extra parameter 'flags'
> is added to io_readv calls to pass extra read flags like MSG_PEEK.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>


This change breaks RDMA migration.

FAILED: libcommon.fa.p/migration_rdma.c.o
cc -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/usr/include/libp=
ng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/include/caca=
rd -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sys=
prof-4 -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -I/usr/=
include/p11-kit-1 -I/usr/include/libusb-1.0 -I/usr/include/SDL2 -I/usr/incl=
ude/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/includ=
e/slirp -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11=
 -O2 -g -isystem /mnt/code/qemu/full/linux-headers -isystem linux-headers -=
iquote . -iquote /mnt/code/qemu/full -iquote /mnt/code/qemu/full/include -i=
quote /mnt/code/qemu/full/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SO=
URCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -fno-st=
rict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing-prototy=
pes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -Wold-sty=
le-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wig=
nored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-t=
o-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute -Wno-missin=
g-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-stron=
g -fPIE -D_REENTRANT -Wno-undef -DSTRUCT_IOVEC_DEFINED -MD -MQ libcommon.fa=
.p/migration_rdma.c.o -MF libcommon.fa.p/migration_rdma.c.o.d -o libcommon.=
fa.p/migration_rdma.c.o -c ../../../../mnt/code/qemu/full/migration/rdma.c
../../../../mnt/code/qemu/full/migration/rdma.c: In function =E2=80=98qio_c=
hannel_rdma_class_init=E2=80=99:
../../../../mnt/code/qemu/full/migration/rdma.c:4020:25: error: assignment =
to =E2=80=98ssize_t (*)(QIOChannel *, const struct iovec *, size_t,  int **=
, size_t *, int,  Error **)=E2=80=99 {aka =E2=80=98long int (*)(QIOChannel =
*, const struct iovec *, long unsigned int,  int **, long unsigned int *, i=
nt,  Error **)=E2=80=99} from incompatible pointer type =E2=80=98ssize_t (*=
)(QIOChannel *, const struct iovec *, size_t,  int **, size_t *, Error **)=
=E2=80=99 {aka =E2=80=98long int (*)(QIOChannel *, const struct iovec *, lo=
ng unsigned int,  int **, long unsigned int *, Error **)=E2=80=99} [-Werror=
=3Dincompatible-pointer-types]
 4020 |     ioc_klass->io_readv =3D qio_channel_rdma_readv;
      |                         ^
cc1: all warnings being treated as errors

And I don't really know how to fix it, because the problem is that rdma
don't use qio_channel_readv_full() at all.

Sorry, I have to drop the series until a fix is found.

Later, Juan.


