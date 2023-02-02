Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAB687EFA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:41:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZoi-0007N3-8S; Thu, 02 Feb 2023 08:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNZo0-0005qD-KZ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:39:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNZny-0008Lo-Cd
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345149;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSH+Rqp5TyVFS91RYc1BnaOzcWWbZDPaEAOyVtvBkxM=;
 b=FdmbH2XW2DP1LQK7lAPdUikdw3Cffj5EF3AjmWeU8FSbCVIirpjssKwqYXejE0TiqiawPi
 ZihVTow4fNRg+kgIChqWU55yezNBB4O5uXtunwhTy7FAUFPSSoZMQp4h7QJtFLfLkQQbh+
 /bwwbKZ0pMgmeD2ojMNj0n0+RhRs/iA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-tTxTuqCzPTKZ91k1WVC9aw-1; Thu, 02 Feb 2023 08:39:08 -0500
X-MC-Unique: tTxTuqCzPTKZ91k1WVC9aw-1
Received: by mail-wm1-f70.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so1018767wmq.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 05:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSH+Rqp5TyVFS91RYc1BnaOzcWWbZDPaEAOyVtvBkxM=;
 b=H2hBXaTTRL2ACBPz6Ii2NFMiOagl2gFtgcc1tzhe2D9dbUfJeOpVbzpWWrKpmsUsjH
 nN4A3CSHZdqaMaTcBPFTq5PEPrnS+kEjfLdJvU0GsauSNj1XMQywvsfFv+1Zxq4K05Lh
 bv2g/AcAxvIzfMQLL25wzy683EaEeFnXJpOf9r6h4++KtJfqvjk8arlvsg5C1H2w4iLN
 QpfnCrocw6fGEj+YacTnKHLUe3u3ENf+aN9MmwON9C8gyfSH3bxK2rvN286MkvFEzkaL
 YksR/O0EbXQXomv8n8409G3RMVJ2kIMhhDGRqa3zyoEYgsk/sOZvPVh+VlRk52m6YXUE
 M2NQ==
X-Gm-Message-State: AO0yUKWDDJRvfGA6/iomUDEd+7wFcry18+dncsQkUkpb0WINUvTsAfqg
 8gx+PfBY83hFmkYwx+ocuFyWHwhL7Yjptm3giGcINWp7oc9t4JrSxfBj2Zx/NcayoSnOdTAmLnN
 PazvksCYJpVNGWaM=
X-Received: by 2002:a05:600c:3b89:b0:3dc:19d1:3c13 with SMTP id
 n9-20020a05600c3b8900b003dc19d13c13mr5794999wms.12.1675345146945; 
 Thu, 02 Feb 2023 05:39:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+tu9xuitDBLs3s4M/wS7xM5DDqeIAUm4V83UxdJwwHN/GmKLN51wGkt9LTWFUgq0X7Mna1ng==
X-Received: by 2002:a05:600c:3b89:b0:3dc:19d1:3c13 with SMTP id
 n9-20020a05600c3b8900b003dc19d13c13mr5794979wms.12.1675345146754; 
 Thu, 02 Feb 2023 05:39:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003dc36981727sm5592032wmq.14.2023.02.02.05.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 05:39:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,  qemu-devel@nongnu.org,
 dgilbert@redhat.com,  lsoaresp@redhat.com,  Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v6 1/2] io: Add support for MSG_PEEK for socket channel
In-Reply-To: <Y9u26aMxlryK5c3o@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 2 Feb 2023 13:13:13 +0000")
References: <20221220184418.228834-1-manish.mishra@nutanix.com>
 <20221220184418.228834-2-manish.mishra@nutanix.com>
 <877cx0mf4b.fsf@secure.mitica> <Y9utB91u5JFeHBiN@redhat.com>
 <87sffokz73.fsf@secure.mitica> <Y9u26aMxlryK5c3o@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 14:39:05 +0100
Message-ID: <87k010kwzq.fsf@secure.mitica>
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
> On Thu, Feb 02, 2023 at 01:51:28PM +0100, Juan Quintela wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> > On Thu, Feb 02, 2023 at 01:22:12PM +0100, Juan Quintela wrote:
>> >> "manish.mishra" <manish.mishra@nutanix.com> wrote:
>> >> > MSG_PEEK peeks at the channel, The data is treated as unread and
>> >> > the next read shall still return this data. This support is
>> >> > currently added only for socket class. Extra parameter 'flags'
>> >> > is added to io_readv calls to pass extra read flags like MSG_PEEK.
>> >> >
>> >> > Reviewed-by: Peter Xu <peterx@redhat.com>
>> >> > Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
>> >> > Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>> >> > Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
>> >>=20
>> >>=20
>> >> This change breaks RDMA migration.
>> >>=20
>> >> FAILED: libcommon.fa.p/migration_rdma.c.o
>> >> cc -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/usr/includ=
e/libpng16 -I/usr/include/spice-server -I/usr/include/spice-1 -I/usr/includ=
e/cacard -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/inclu=
de/sysprof-4 -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC -=
I/usr/include/p11-kit-1 -I/usr/include/libusb-1.0 -I/usr/include/SDL2 -I/us=
r/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/=
include/slirp -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=
=3Dgnu11 -O2 -g -isystem /mnt/code/qemu/full/linux-headers -isystem linux-h=
eaders -iquote . -iquote /mnt/code/qemu/full -iquote /mnt/code/qemu/full/in=
clude -iquote /mnt/code/qemu/full/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FO=
RTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE=
 -fno-strict-aliasing -fno-common -fwrapv -Wundef -Wwrite-strings -Wmissing=
-prototypes -Wstrict-prototypes -Wredundant-decls -Wold-style-declaration -=
Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-s=
elf -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexp=
ansion-to-defined -Wimplicit-fallthrough=3D2 -Wmissing-format-attribute -Wn=
o-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protect=
or-strong -fPIE -D_REENTRANT -Wno-undef -DSTRUCT_IOVEC_DEFINED -MD -MQ libc=
ommon.fa.p/migration_rdma.c.o -MF libcommon.fa.p/migration_rdma.c.o.d -o li=
bcommon.fa.p/migration_rdma.c.o -c ../../../../mnt/code/qemu/full/migration=
/rdma.c
>> >> ../../../../mnt/code/qemu/full/migration/rdma.c: In function =E2=80=
=98qio_channel_rdma_class_init=E2=80=99:
>> >> ../../../../mnt/code/qemu/full/migration/rdma.c:4020:25: error: assig=
nment to =E2=80=98ssize_t (*)(QIOChannel *, const struct iovec *, size_t,  =
int **, size_t *, int,  Error **)=E2=80=99 {aka =E2=80=98long int (*)(QIOCh=
annel *, const struct iovec *, long unsigned int,  int **, long unsigned in=
t *, int,  Error **)=E2=80=99} from incompatible pointer type =E2=80=98ssiz=
e_t (*)(QIOChannel *, const struct iovec *, size_t,  int **, size_t *, Erro=
r **)=E2=80=99 {aka =E2=80=98long int (*)(QIOChannel *, const struct iovec =
*, long unsigned int,  int **, long unsigned int *, Error **)=E2=80=99} [-W=
error=3Dincompatible-pointer-types]
>> >>  4020 |     ioc_klass->io_readv =3D qio_channel_rdma_readv;
>> >>       |                         ^
>> >> cc1: all warnings being treated as errors
>> >>=20
>> >> And I don't really know how to fix it, because the problem is that rd=
ma
>> >> don't use qio_channel_readv_full() at all.
>> >
>> > Likely qio_channel_rdma_readv just adds the 'int flags' param added.
>> > It doesn't need to actually do anything with the flags as they are
>> > checked before
>>=20
>> I can do that.  That would fix the compilation issue.
>>=20
>> But will rdma work?  Because it fakes a qio channel, so what is going to
>> implement the MSG_PEEK functionality for it?  It don't end calling
>> recv() at all.
>
> It is no problem - the qio_channel_readv method changes in this patch
> add:
>
> +    if ((flags & QIO_CHANNEL_READ_FLAG_MSG_PEEK) &&
> +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_READ_MSG_PEEK)=
) {
> +        error_setg_errno(errp, EINVAL,
> +                         "Channel does not support peek read");
> +        return -1;
> +    }
>
>
> so it is impossible for qio_channel_rdma_readv to be invoked with
> flags having MSG_PEEK set, thus RDMA can ignore the whole concept.

And as we require MSG_PEEK to do migration, we have lost RDMA migration
in the process.

The following patch on the series use this functionality to read the
beggining of the streams in the channels.

Later, Juan.


