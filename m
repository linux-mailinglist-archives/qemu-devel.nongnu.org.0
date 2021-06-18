Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86E3ACB7C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 14:56:29 +0200 (CEST)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luE2u-0006hi-4l
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 08:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1luE20-0005sm-11; Fri, 18 Jun 2021 08:55:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28564
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1luE1v-0006Fb-TP; Fri, 18 Jun 2021 08:55:31 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ICXSBd099254; Fri, 18 Jun 2021 08:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Kf8NhAxCXBCbF3P39VemHfdJLKEbV8WcY4BlcLCvaQo=;
 b=T7Gw5LC9O2qxPLr8TvjDyBtcWCo8cKBIAvbx//VLVGp3Aj0a6WutgG24ox9SNKcocpgF
 h8pSkCzvm1fbo9szjKuyx1v/wT+b4iB0Hex+Nhyz3Ra30tWmqas7THZ1D28/3C01n7Zc
 Nor4SXHntF1I1lRKc+wEPofmj9DXrR5e04BGYla8r8Bcvo+7TGvufM21wSHTjz4VvUjc
 OEB99JMq6y//AYC/TvhQm31HLx/hn1KTmBd1LXAXSh1KSIV7SbZAoEfLlKzUu30YceTW
 DP4UmZybq2nWl9/8eH9o+ai35PnRuW9aDcXfqezjUK9y1fCNsXryNLUasXiGS1W8aBqd 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398t71bfc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 08:55:24 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15ICXXkZ099607;
 Fri, 18 Jun 2021 08:55:24 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398t71bfbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 08:55:24 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15ICmQwd030739;
 Fri, 18 Jun 2021 12:55:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3980b9nycg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 12:55:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15ICtMYC32440742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 12:55:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28B35C6059;
 Fri, 18 Jun 2021 12:55:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B030C6055;
 Fri, 18 Jun 2021 12:55:21 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.1.119])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 18 Jun 2021 12:55:20 +0000 (GMT)
Message-ID: <adca6d5e3c3037da7923489fa28fcd34be099e75.camel@linux.ibm.com>
Subject: Re: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Fri, 18 Jun 2021 08:55:18 -0400
In-Reply-To: <874kdvpchd.fsf@redhat.com>
References: <20210617232537.1337506-1-farman@linux.ibm.com>
 <20210617232537.1337506-2-farman@linux.ibm.com> <877dirph77.fsf@redhat.com>
 <874kdvpchd.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: huRchTRpclyfM3LNqN5OWH04cQ6eEO43
X-Proofpoint-GUID: OnC4Tsu3rvbHhpSbktaIs7HbcEq1yeun
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_07:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106180073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-06-18 at 14:46 +0200, Cornelia Huck wrote:
> On Fri, Jun 18 2021, Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:
> > 
> > > The Interrupt Response Block is comprised of several other
> > > structures concatenated together, but only the 12-byte
> > > Subchannel-Status Word (SCSW) is defined as a proper struct.
> > > Everything else is a simple array of 32-bit words.
> > > 
> > > Let's define a proper struct for the 20-byte Extended-Status
> > > Word (ESW) so that we can make good decisions about the sense
> > > data that would go into the ECW area for virtual vs
> > > passthrough devices.
> > > 
> > > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > > ---
> > >  hw/s390x/css.c            | 19 +++++++++++++------
> > >  include/hw/s390x/ioinst.h | 12 +++++++++++-
> > >  2 files changed, 24 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/include/hw/s390x/ioinst.h
> > > b/include/hw/s390x/ioinst.h
> > > index c6737a30d4..e7ab401781 100644
> > > --- a/include/hw/s390x/ioinst.h
> > > +++ b/include/hw/s390x/ioinst.h
> > > @@ -123,10 +123,20 @@ typedef struct SCHIB {
> > >      uint8_t mda[4];
> > >  } QEMU_PACKED SCHIB;
> > >  
> > > +/* format-0 extended-status word */
> > > +typedef struct ESW {
> > > +   uint32_t word0;
> > > +   uint32_t erw;
> > > +   uint64_t f_addr;     /* Zeros for other ESW formats */
> > > +   uint32_t s_addr;     /* Zeros for other ESW formats */
> > > +} QEMU_PACKED ESW;
> > 
> > Eww, this fails with mingw:
> > https://gitlab.com/cohuck/qemu/-/jobs/1358335494
> > 
> > i686-w64-mingw32-gcc -Ilibcommon.fa.p -I../slirp -I../slirp/src
> > -I../dtc/libfdt -I../capstone/include/capstone -I. -Iqapi -Itrace
> > -Iui -Iui/shader -I/usr/i686-w64-mingw32/sys-root/mingw/include
> > -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0
> > -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
> > -I/usr/i686-w64-mingw32/sys-root/mingw/include/gtk-3.0 -I/usr/i686-
> > w64-mingw32/sys-root/mingw/include/cairo -I/usr/i686-w64-
> > mingw32/sys-root/mingw/include/pango-1.0 -I/usr/i686-w64-
> > mingw32/sys-root/mingw/include/fribidi -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/harfbuzz -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/atk-1.0 -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/pixman-1 -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/freetype2 -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/libpng16 -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/gdk-pixbuf-2.0 -I/usr/i686-w64-mingw32/sys-
> > root/mingw/lib/libffi-3.1/include -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/p11-kit-1 -I/usr/i686-w64-mingw32/sys-
> > root/mingw/include/SDL2 -fdiagnostics-color=auto -pipe -Wall
> > -Winvalid-pch -Werror -std=gnu99 -O2 -g -iquote . -iquote
> > /builds/cohuck/qemu -iquote /builds/cohuck/qemu/include -iquote
> > /builds/cohuck/qemu/disas/libvixl -iquote
> > /builds/cohuck/qemu/tcg/i386 -mms-bitfields -U_FORTIFY_SOURCE
> > -D_FORTIFY_SOURCE=2 -m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> > -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> > -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-
> > common -fwrapv -Wold-style-declaration -Wold-style-definition
> > -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-
> > qualifiers -Wempty-body -Wnested-externs -Wendif-labels
> > -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-
> > include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-
> > protector-strong -Dmain=SDL_main -Wno-undef -mms-bitfields -mms-
> > bitfields -mms-bitfields -MD -MQ libcommon.fa.p/hw_s390x_virtio-
> > ccw-gpu.c.obj -MF libcommon.fa.p/hw_s390x_virtio-ccw-gpu.c.obj.d -o
> > libcommon.fa.p/hw_s390x_virtio-ccw-gpu.c.obj -c ../hw/s390x/virtio-
> > ccw-gpu.c
> > In file included from /usr/i686-w64-mingw32/sys-
> > root/mingw/include/winsock2.h:54,
> >                  from /builds/cohuck/qemu/include/sysemu/os-
> > win32.h:29,
> >                  from /builds/cohuck/qemu/include/qemu/osdep.h:135,
> >                  from ../hw/s390x/virtio-ccw-gpu.c:11:
> > /builds/cohuck/qemu/include/hw/s390x/ioinst.h:131:13: error:
> > expected ':', ',', ';', '}' or '__attribute__' before '.' token
> >   131 |    uint32_t s_addr;     /* Zeros for other ESW formats */
> >       |             ^~~~~~
> 
> It seems to be the name that is tripping it; if I rename it to
> sec_addr
> and the preceding field to fail_addr, the build passes.

I was just wondering if it might have been the underscore directly, not
that it was a single letter before the underscore. Weird.

> 
> Anyone know why that is? And if renaming is unavoidable, are
> fail_addr
> and sec_addr ok, or can we find better names?

Since they're zero for Format-!0 ESWs, and regardless we don't fill
them in anyway, could we just make them wordN and change the comment to
give the descriptive name?

 /* format-0 extended-status word */
 typedef struct ESW {
-   uint32_t
word0;
+   uint32_t word0;      /* subchannel logout for format 0 */
    
uint32_t erw;
-   uint64_t f_addr;     /* Zeros for other ESW formats */
-   uint32_t s_addr;     /* Zeros for other ESW formats */
+   uint64_t
word2;      /* failing-storage address for format 0 */
+   uint32_t
word4;      /* scondary-CCW address for format 0 */
 } QEMU_PACKED ESW;

> 
> > In file included from /builds/cohuck/qemu/include/qemu/osdep.h:37,
> >                  from ../hw/s390x/virtio-ccw-gpu.c:11:
> > /builds/cohuck/qemu/include/qemu/compiler.h:80:36: error: static
> > assertion failed: "size of IRB is wrong"
> >    80 | #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x),
> > msg)
> >       |                                    ^~~~~~~~~~~~~~
> > /builds/cohuck/qemu/include/hw/s390x/ioinst.h:143:1: note: in
> > expansion of macro 'QEMU_BUILD_BUG_MSG'
> >   143 | QEMU_BUILD_BUG_MSG(sizeof(IRB) != 96, "size of IRB is
> > wrong");
> >       | ^~~~~~~~~~~~~~~~~~
> > 
> 
> These were just follow-on errors.
> 
> > > +
> > > +#define ESW_ERW_SENSE 0x01000000
> > > +
> > >  /* interruption response block */
> > >  typedef struct IRB {
> > >      SCSW scsw;
> > > -    uint32_t esw[5];
> > > +    ESW esw;
> > >      uint32_t ecw[8];
> > >      uint32_t emw[8];
> > >  } IRB;


