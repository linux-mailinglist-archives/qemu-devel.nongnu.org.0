Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C353ACB51
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 14:47:59 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luDug-0008KS-8l
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 08:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luDtE-0006zZ-IZ
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luDtB-000576-Ey
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 08:46:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624020385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsp5ebULPj+oCuf8d2RfejiCwFwCZw4uUoxxAelVEX8=;
 b=PRs5CodMGXraSczaS0aHVOrBQrVMeGEkmTgN8PCGJSaowDpmc4mj2jQtWyMC+iJOfj3uk1
 CbGyUn7lpzzjokg2WtwhB+5C8T8QCJQk6OxetPD8GeWXwLdpVRbW/8FIR3lc2czkbJc64Z
 jmBmjR+oGQIIkiYK5U/wJHw2+AyDAJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-btTeJoPKMZy3Cbo29HLDTg-1; Fri, 18 Jun 2021 08:46:21 -0400
X-MC-Unique: btTeJoPKMZy3Cbo29HLDTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 621778015F5;
 Fri, 18 Jun 2021 12:46:20 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EADB19D61;
 Fri, 18 Jun 2021 12:46:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
In-Reply-To: <877dirph77.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20210617232537.1337506-1-farman@linux.ibm.com>
 <20210617232537.1337506-2-farman@linux.ibm.com>
 <877dirph77.fsf@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 18 Jun 2021 14:46:06 +0200
Message-ID: <874kdvpchd.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:
>
>> The Interrupt Response Block is comprised of several other
>> structures concatenated together, but only the 12-byte
>> Subchannel-Status Word (SCSW) is defined as a proper struct.
>> Everything else is a simple array of 32-bit words.
>>
>> Let's define a proper struct for the 20-byte Extended-Status
>> Word (ESW) so that we can make good decisions about the sense
>> data that would go into the ECW area for virtual vs
>> passthrough devices.
>>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> ---
>>  hw/s390x/css.c            | 19 +++++++++++++------
>>  include/hw/s390x/ioinst.h | 12 +++++++++++-
>>  2 files changed, 24 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
>> index c6737a30d4..e7ab401781 100644
>> --- a/include/hw/s390x/ioinst.h
>> +++ b/include/hw/s390x/ioinst.h
>> @@ -123,10 +123,20 @@ typedef struct SCHIB {
>>      uint8_t mda[4];
>>  } QEMU_PACKED SCHIB;
>> =20
>> +/* format-0 extended-status word */
>> +typedef struct ESW {
>> +   uint32_t word0;
>> +   uint32_t erw;
>> +   uint64_t f_addr;     /* Zeros for other ESW formats */
>> +   uint32_t s_addr;     /* Zeros for other ESW formats */
>> +} QEMU_PACKED ESW;
>
> Eww, this fails with mingw:
> https://gitlab.com/cohuck/qemu/-/jobs/1358335494
>
> i686-w64-mingw32-gcc -Ilibcommon.fa.p -I../slirp -I../slirp/src -I../dtc/=
libfdt -I../capstone/include/capstone -I. -Iqapi -Itrace -Iui -Iui/shader -=
I/usr/i686-w64-mingw32/sys-root/mingw/include -I/usr/i686-w64-mingw32/sys-r=
oot/mingw/include/glib-2.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-=
2.0/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/gtk-3.0 -I/usr/i=
686-w64-mingw32/sys-root/mingw/include/cairo -I/usr/i686-w64-mingw32/sys-ro=
ot/mingw/include/pango-1.0 -I/usr/i686-w64-mingw32/sys-root/mingw/include/f=
ribidi -I/usr/i686-w64-mingw32/sys-root/mingw/include/harfbuzz -I/usr/i686-=
w64-mingw32/sys-root/mingw/include/atk-1.0 -I/usr/i686-w64-mingw32/sys-root=
/mingw/include/pixman-1 -I/usr/i686-w64-mingw32/sys-root/mingw/include/free=
type2 -I/usr/i686-w64-mingw32/sys-root/mingw/include/libpng16 -I/usr/i686-w=
64-mingw32/sys-root/mingw/include/gdk-pixbuf-2.0 -I/usr/i686-w64-mingw32/sy=
s-root/mingw/lib/libffi-3.1/include -I/usr/i686-w64-mingw32/sys-root/mingw/=
include/p11-kit-1 -I/usr/i686-w64-mingw32/sys-root/mingw/include/SDL2 -fdia=
gnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g=
 -iquote . -iquote /builds/cohuck/qemu -iquote /builds/cohuck/qemu/include =
-iquote /builds/cohuck/qemu/disas/libvixl -iquote /builds/cohuck/qemu/tcg/i=
386 -mms-bitfields -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -m32 -D_GNU_SOUR=
CE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredun=
dant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasin=
g -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype=
-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -We=
mpty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit=
-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-p=
sabi -fstack-protector-strong -Dmain=3DSDL_main -Wno-undef -mms-bitfields -=
mms-bitfields -mms-bitfields -MD -MQ libcommon.fa.p/hw_s390x_virtio-ccw-gpu=
.c.obj -MF libcommon.fa.p/hw_s390x_virtio-ccw-gpu.c.obj.d -o libcommon.fa.p=
/hw_s390x_virtio-ccw-gpu.c.obj -c ../hw/s390x/virtio-ccw-gpu.c
> In file included from /usr/i686-w64-mingw32/sys-root/mingw/include/winsoc=
k2.h:54,
>                  from /builds/cohuck/qemu/include/sysemu/os-win32.h:29,
>                  from /builds/cohuck/qemu/include/qemu/osdep.h:135,
>                  from ../hw/s390x/virtio-ccw-gpu.c:11:
> /builds/cohuck/qemu/include/hw/s390x/ioinst.h:131:13: error: expected ':'=
, ',', ';', '}' or '__attribute__' before '.' token
>   131 |    uint32_t s_addr;     /* Zeros for other ESW formats */
>       |             ^~~~~~

It seems to be the name that is tripping it; if I rename it to sec_addr
and the preceding field to fail_addr, the build passes.

Anyone know why that is? And if renaming is unavoidable, are fail_addr
and sec_addr ok, or can we find better names?

> In file included from /builds/cohuck/qemu/include/qemu/osdep.h:37,
>                  from ../hw/s390x/virtio-ccw-gpu.c:11:
> /builds/cohuck/qemu/include/qemu/compiler.h:80:36: error: static assertio=
n failed: "size of IRB is wrong"
>    80 | #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
>       |                                    ^~~~~~~~~~~~~~
> /builds/cohuck/qemu/include/hw/s390x/ioinst.h:143:1: note: in expansion o=
f macro 'QEMU_BUILD_BUG_MSG'
>   143 | QEMU_BUILD_BUG_MSG(sizeof(IRB) !=3D 96, "size of IRB is wrong");
>       | ^~~~~~~~~~~~~~~~~~
>

These were just follow-on errors.

>> +
>> +#define ESW_ERW_SENSE 0x01000000
>> +
>>  /* interruption response block */
>>  typedef struct IRB {
>>      SCSW scsw;
>> -    uint32_t esw[5];
>> +    ESW esw;
>>      uint32_t ecw[8];
>>      uint32_t emw[8];
>>  } IRB;


