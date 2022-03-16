Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140D4DB3BF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:54:36 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUV2p-0004JW-6c
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:54:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUV0m-0003UQ-Oq
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:52:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nUV0k-00035t-32
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647442345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vevYgX3Q7orXAn/OG+0pU0G0y6XrfWnpZ6jeLE7KFgM=;
 b=byYCQqwTceBxZpPxxofDeej7xj3HQPItntv+wTpeSlOhkH8pqj6smkp+Xf0eTMmOA0wth9
 zbJJAO9nIeWP7hG5qkGT7sf7kuMLVE9MAeXMwVS2dVaIfYVf+JDLj77SeReaeT7XzVNCcX
 caQxbDvTsLfyd/8wmLv+4N2e2be2IXQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-g4bLp7UPNA2N8z78jehWFQ-1; Wed, 16 Mar 2022 10:52:21 -0400
X-MC-Unique: g4bLp7UPNA2N8z78jehWFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E491C05EBA;
 Wed, 16 Mar 2022 14:52:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52063400F752;
 Wed, 16 Mar 2022 14:52:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3024821E6821; Wed, 16 Mar 2022 15:52:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Murilo Opsfelder =?utf-8?Q?Ara=C3=BAjo?= <muriloo@linux.ibm.com>
Subject: Re: [PATCH v2] block-qdict: Fix -Werror=maybe-uninitialized build
 failure
References: <20220311221634.58288-1-muriloo@linux.ibm.com>
 <a7ce477a-ebed-dbb0-3257-8bc82fe27ce4@gmail.com>
 <11970663.O9o76ZdvQC@localhost.localdomain>
Date: Wed, 16 Mar 2022 15:52:20 +0100
In-Reply-To: <11970663.O9o76ZdvQC@localhost.localdomain> ("Murilo Opsfelder
 =?utf-8?Q?Ara=C3=BAjo=22's?= message of "Tue, 15 Mar 2022 14:43:47 -0300")
Message-ID: <87tubyt0ez.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> writes:

> Hi, Philippe.
>
> On Monday, March 14, 2022 10:47:11 AM -03 Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 11/3/22 23:16, Murilo Opsfelder Araujo wrote:
>> > Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with th=
e
>> > following error:
>> >
>> >      $ ../configure --prefix=3D/usr/local/qemu-disabletcg --target-lis=
t=3Dppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
>> >      ...
>> >      $ make -j$(nproc)
>> >      ...
>> >      FAILED: libqemuutil.a.p/qobject_block-qdict.c.o
>>
>> This part >>>
>>
>> >      cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubprojects/=
libvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shade=
r -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/sysp=
rof-4 -I/usr/include/lib
>> >      mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/inc=
lude/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=3Dauto -Wall -Wi=
nvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /root/qemu/linux-headers -i=
system linux-headers -iquote
>> >       . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/qe=
mu/disas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SO=
URCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wred=
undant-decls -Wundef -Wwrite
>> >      -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -f=
wrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat=
-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnest=
ed-externs -Wendif-label
>> >      s -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-=
include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong =
-fPIE -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p/q=
object_block-qdict.c.o.d -
>> >      o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-qdi=
ct.c
>>
>> <<< is noise (doesn't provide any value) and could be stripped.
>
> Is this something the committer/maintainer could edit when applying the c=
ommit
> or do you need I resend the v3?
>
> Cheers!

I'll take care of it unless Kevin or Hanna beat me to the punch.


