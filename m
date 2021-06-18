Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84ED3AC96E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 13:05:28 +0200 (CEST)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luCJT-00083f-Ob
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 07:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luCIX-0007HQ-2R
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1luCIT-0001UT-0M
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624014263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cs0mqVClmoMUY6cCwI7AcKviYXDPwZgllE6l1xhZEoM=;
 b=hWpuwdaipD9Uh8aB2L5JDq66Ggme1jUjqVXU0PvCh3n0BsWxrPcDAK+AlA2+rpdX/vla1D
 2a2Buy/YgFW/alMMlAXWh3UNuA0hJDlYjlZ8OS2JnlK6Uyh/DS0Y5muV+vc8ME/cJDaAXG
 s59ZYb+rmYXSRGyiK98WCtho/ugLYQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-_6YX2fNcPFqM6Q1DeCbc-w-1; Fri, 18 Jun 2021 07:04:21 -0400
X-MC-Unique: _6YX2fNcPFqM6Q1DeCbc-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89346C73A4;
 Fri, 18 Jun 2021 11:04:20 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB0C617D48;
 Fri, 18 Jun 2021 11:04:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
In-Reply-To: <20210617232537.1337506-2-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210617232537.1337506-1-farman@linux.ibm.com>
 <20210617232537.1337506-2-farman@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 18 Jun 2021 13:04:12 +0200
Message-ID: <877dirph77.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:

> The Interrupt Response Block is comprised of several other
> structures concatenated together, but only the 12-byte
> Subchannel-Status Word (SCSW) is defined as a proper struct.
> Everything else is a simple array of 32-bit words.
>
> Let's define a proper struct for the 20-byte Extended-Status
> Word (ESW) so that we can make good decisions about the sense
> data that would go into the ECW area for virtual vs
> passthrough devices.
>
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  hw/s390x/css.c            | 19 +++++++++++++------
>  include/hw/s390x/ioinst.h | 12 +++++++++++-
>  2 files changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> index c6737a30d4..e7ab401781 100644
> --- a/include/hw/s390x/ioinst.h
> +++ b/include/hw/s390x/ioinst.h
> @@ -123,10 +123,20 @@ typedef struct SCHIB {
>      uint8_t mda[4];
>  } QEMU_PACKED SCHIB;
> =20
> +/* format-0 extended-status word */
> +typedef struct ESW {
> +   uint32_t word0;
> +   uint32_t erw;
> +   uint64_t f_addr;     /* Zeros for other ESW formats */
> +   uint32_t s_addr;     /* Zeros for other ESW formats */
> +} QEMU_PACKED ESW;

Eww, this fails with mingw:
https://gitlab.com/cohuck/qemu/-/jobs/1358335494

i686-w64-mingw32-gcc -Ilibcommon.fa.p -I../slirp -I../slirp/src -I../dtc/li=
bfdt -I../capstone/include/capstone -I. -Iqapi -Itrace -Iui -Iui/shader -I/=
usr/i686-w64-mingw32/sys-root/mingw/include -I/usr/i686-w64-mingw32/sys-roo=
t/mingw/include/glib-2.0 -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.=
0/include -I/usr/i686-w64-mingw32/sys-root/mingw/include/gtk-3.0 -I/usr/i68=
6-w64-mingw32/sys-root/mingw/include/cairo -I/usr/i686-w64-mingw32/sys-root=
/mingw/include/pango-1.0 -I/usr/i686-w64-mingw32/sys-root/mingw/include/fri=
bidi -I/usr/i686-w64-mingw32/sys-root/mingw/include/harfbuzz -I/usr/i686-w6=
4-mingw32/sys-root/mingw/include/atk-1.0 -I/usr/i686-w64-mingw32/sys-root/m=
ingw/include/pixman-1 -I/usr/i686-w64-mingw32/sys-root/mingw/include/freety=
pe2 -I/usr/i686-w64-mingw32/sys-root/mingw/include/libpng16 -I/usr/i686-w64=
-mingw32/sys-root/mingw/include/gdk-pixbuf-2.0 -I/usr/i686-w64-mingw32/sys-=
root/mingw/lib/libffi-3.1/include -I/usr/i686-w64-mingw32/sys-root/mingw/in=
clude/p11-kit-1 -I/usr/i686-w64-mingw32/sys-root/mingw/include/SDL2 -fdiagn=
ostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -=
iquote . -iquote /builds/cohuck/qemu -iquote /builds/cohuck/qemu/include -i=
quote /builds/cohuck/qemu/disas/libvixl -iquote /builds/cohuck/qemu/tcg/i38=
6 -mms-bitfields -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -m32 -D_GNU_SOURCE=
 -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredunda=
nt-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing =
-fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-l=
imits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wemp=
ty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-f=
allthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psa=
bi -fstack-protector-strong -Dmain=3DSDL_main -Wno-undef -mms-bitfields -mm=
s-bitfields -mms-bitfields -MD -MQ libcommon.fa.p/hw_s390x_virtio-ccw-gpu.c=
.obj -MF libcommon.fa.p/hw_s390x_virtio-ccw-gpu.c.obj.d -o libcommon.fa.p/h=
w_s390x_virtio-ccw-gpu.c.obj -c ../hw/s390x/virtio-ccw-gpu.c
In file included from /usr/i686-w64-mingw32/sys-root/mingw/include/winsock2=
.h:54,
                 from /builds/cohuck/qemu/include/sysemu/os-win32.h:29,
                 from /builds/cohuck/qemu/include/qemu/osdep.h:135,
                 from ../hw/s390x/virtio-ccw-gpu.c:11:
/builds/cohuck/qemu/include/hw/s390x/ioinst.h:131:13: error: expected ':', =
',', ';', '}' or '__attribute__' before '.' token
  131 |    uint32_t s_addr;     /* Zeros for other ESW formats */
      |             ^~~~~~
In file included from /builds/cohuck/qemu/include/qemu/osdep.h:37,
                 from ../hw/s390x/virtio-ccw-gpu.c:11:
/builds/cohuck/qemu/include/qemu/compiler.h:80:36: error: static assertion =
failed: "size of IRB is wrong"
   80 | #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
      |                                    ^~~~~~~~~~~~~~
/builds/cohuck/qemu/include/hw/s390x/ioinst.h:143:1: note: in expansion of =
macro 'QEMU_BUILD_BUG_MSG'
  143 | QEMU_BUILD_BUG_MSG(sizeof(IRB) !=3D 96, "size of IRB is wrong");
      | ^~~~~~~~~~~~~~~~~~

> +
> +#define ESW_ERW_SENSE 0x01000000
> +
>  /* interruption response block */
>  typedef struct IRB {
>      SCSW scsw;
> -    uint32_t esw[5];
> +    ESW esw;
>      uint32_t ecw[8];
>      uint32_t emw[8];
>  } IRB;


