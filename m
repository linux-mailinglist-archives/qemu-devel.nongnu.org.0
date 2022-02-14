Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A0C4B404D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 04:29:18 +0100 (CET)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJS3B-00016q-9j
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 22:29:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nJS2H-0000Dp-66
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:28:21 -0500
Received: from ma1-aaemail-dr-lapp02.apple.com ([17.171.2.68]:38132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nJS2E-0002vb-ME
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:28:20 -0500
Received: from pps.filterd (ma1-aaemail-dr-lapp02.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp02.apple.com (8.16.0.42/8.16.0.42) with SMTP id
 21E3DtRL053880; Sun, 13 Feb 2022 19:28:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=rZ/ghvmHlUyb+zHLA6RvSABb6sGdXO/bZxzr/myJwiY=;
 b=qGdWu/jUDjOjEWC8qx7FktNbl2d8CbOh+VYJEtAoUNi7F+ylWbZWq+gob4ZvB9NbwP/3
 49cyGx8giveakzFLcyRO3EyHJAm/GF/2UXnzATCu7I4z9c8LRsAKmAbXReI0Zgxeoxmr
 mweIBErO30oIBf5ZiHYkR8W3c3tfxWOQk61oLFhjWDsD2apr/SgwFRNoJiwq9fTCyn0a
 N0S1HFtvkN50SMKBxRAuD1sIiB1mbFAVuDxXuP1nCextWI1ZfhSKBkHxLP94XbHzmud3
 f7IOhTA2TdgRez5AWRHymrbn+K5QGZNSjGisT7bXz7nLVc9zzSu5EhuoQlCvBm7ayQJz ww== 
Received: from rn-mailsvcp-mta-lapp04.rno.apple.com
 (rn-mailsvcp-mta-lapp04.rno.apple.com [10.225.203.152])
 by ma1-aaemail-dr-lapp02.apple.com with ESMTP id 3e6aex1g5c-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sun, 13 Feb 2022 19:28:06 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R7900IZQYYUMSA0@rn-mailsvcp-mta-lapp04.rno.apple.com>; 
 Sun, 13 Feb 2022 19:28:06 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R7900U00YYQBX00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Sun,
 13 Feb 2022 19:28:06 -0800 (PST)
X-Va-A: 
X-Va-T-CD: a4993044822e62ac2b1465e3850df6e0
X-Va-E-CD: 41a1522e228337b98c8164712077f4a5
X-Va-R-CD: 23f0c9f98d43c78a7da597b3c3549874
X-Va-CD: 0
X-Va-ID: 6b70cd29-999a-47bf-a82b-1d20b2fe1f11
X-V-A: 
X-V-T-CD: a4993044822e62ac2b1465e3850df6e0
X-V-E-CD: 41a1522e228337b98c8164712077f4a5
X-V-R-CD: 23f0c9f98d43c78a7da597b3c3549874
X-V-CD: 0
X-V-ID: 95079ae8-b599-4dae-83a9-9ef52b8addb8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-14_01:2022-02-11,
 2022-02-14 signatures=0
Received: from smtpclient.apple ([17.234.2.16])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R79008JHYWU7H20@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Sun,
 13 Feb 2022 19:27:50 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
Message-id: <325F9502-C325-474B-8C4F-03F32512A644@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_D04F0D81-A8E3-449D-8542-DF3D7C32E531"
MIME-version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH v4 09/13] block/file-posix: Remove a deprecation warning on
 macOS 12
Date: Sun, 13 Feb 2022 19:27:50 -0800
In-reply-to: <20220211163434.58423-10-f4bug@amsat.org>
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-10-f4bug@amsat.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-14_01:2022-02-11,
 2022-02-14 signatures=0
Received-SPF: pass client-ip=17.171.2.68; envelope-from=dirty@apple.com;
 helo=ma1-aaemail-dr-lapp02.apple.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_D04F0D81-A8E3-449D-8542-DF3D7C32E531
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Reviewed by: Cameron Esfahani <dirty@apple.com <mailto:dirty@apple.com>>

> On Feb 11, 2022, at 8:34 AM, Philippe Mathieu-Daud=C3=A9 via =
<qemu-devel@nongnu.org> wrote:
>=20
> When building on macOS 12 we get:
>=20
>  block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: =
first deprecated in macOS 12.0 [-Wdeprecated-declarations]
>      kernResult =3D IOMasterPort( MACH_PORT_NULL, &masterPort );
>                   ^~~~~~~~~~~~
>                   IOMainPort
>=20
> Replace by IOMainPort, redefining it to IOMasterPort if not available.
>=20
> Suggested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> block/file-posix.c | 14 ++++++++++----
> 1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 1f1756e192..13393ad296 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3319,17 +3319,23 @@ BlockDriver bdrv_file =3D {
> #if defined(__APPLE__) && defined(__MACH__)
> static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char =
*bsdPath,
>                                 CFIndex maxPathSize, int flags);
> +
> +#if !defined(MAC_OS_VERSION_12_0) \
> +    || (MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_12_0)
> +#define IOMainPort IOMasterPort
> +#endif
> +
> static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
> {
>     kern_return_t kernResult =3D KERN_FAILURE;
> -    mach_port_t     masterPort;
> +    mach_port_t mainPort;
>     CFMutableDictionaryRef  classesToMatch;
>     const char *matching_array[] =3D {kIODVDMediaClass, =
kIOCDMediaClass};
>     char *mediaType =3D NULL;
>=20
> -    kernResult =3D IOMasterPort( MACH_PORT_NULL, &masterPort );
> +    kernResult =3D IOMainPort(MACH_PORT_NULL, &mainPort);
>     if ( KERN_SUCCESS !=3D kernResult ) {
> -        printf( "IOMasterPort returned %d\n", kernResult );
> +        printf("IOMainPort returned %d\n", kernResult);
>     }
>=20
>     int index;
> @@ -3342,7 +3348,7 @@ static char =
*FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>         }
>         CFDictionarySetValue(classesToMatch, =
CFSTR(kIOMediaEjectableKey),
>                              kCFBooleanTrue);
> -        kernResult =3D IOServiceGetMatchingServices(masterPort, =
classesToMatch,
> +        kernResult =3D IOServiceGetMatchingServices(mainPort, =
classesToMatch,
>                                                   mediaIterator);
>         if (kernResult !=3D KERN_SUCCESS) {
>             error_report("Note: IOServiceGetMatchingServices returned =
%d",
> --=20
> 2.34.1
>=20
>=20


--Apple-Mail=_D04F0D81-A8E3-449D-8542-DF3D7C32E531
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Reviewed by: Cameron Esfahani &lt;<a =
href=3D"mailto:dirty@apple.com" class=3D"">dirty@apple.com</a>&gt;<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 11, 2022, at 8:34 AM, Philippe Mathieu-Daud=C3=A9 via =
&lt;<a href=3D"mailto:qemu-devel@nongnu.org" =
class=3D"">qemu-devel@nongnu.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">When =
building on macOS 12 we get:<br class=3D""><br class=3D""> =
&nbsp;block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: =
first deprecated in macOS 12.0 [-Wdeprecated-declarations]<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kernResult =3D IOMasterPort( =
MACH_PORT_NULL, &amp;masterPort );<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~~~~~~~~<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IOMainPort<br class=3D""><br =
class=3D"">Replace by IOMainPort, redefining it to IOMasterPort if not =
available.<br class=3D""><br class=3D"">Suggested-by: Akihiko Odaki =
&lt;<a href=3D"mailto:akihiko.odaki@gmail.com" =
class=3D"">akihiko.odaki@gmail.com</a>&gt;<br class=3D"">Signed-off-by: =
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" =
class=3D"">f4bug@amsat.org</a>&gt;<br class=3D"">---<br class=3D""> =
block/file-posix.c | 14 ++++++++++----<br class=3D""> 1 file changed, 10 =
insertions(+), 4 deletions(-)<br class=3D""><br class=3D"">diff --git =
a/block/file-posix.c b/block/file-posix.c<br class=3D"">index =
1f1756e192..13393ad296 100644<br class=3D"">--- a/block/file-posix.c<br =
class=3D"">+++ b/block/file-posix.c<br class=3D"">@@ -3319,17 +3319,23 =
@@ BlockDriver bdrv_file =3D {<br class=3D""> #if defined(__APPLE__) =
&amp;&amp; defined(__MACH__)<br class=3D""> static kern_return_t =
GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CFIndex maxPathSize, int =
flags);<br class=3D"">+<br class=3D"">+#if !defined(MAC_OS_VERSION_12_0) =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;|| (MAC_OS_X_VERSION_MIN_REQUIRED =
&lt; MAC_OS_VERSION_12_0)<br class=3D"">+#define IOMainPort =
IOMasterPort<br class=3D"">+#endif<br class=3D"">+<br class=3D""> static =
char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)<br =
class=3D""> {<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;kern_return_t =
kernResult =3D KERN_FAILURE;<br class=3D"">- =
&nbsp;&nbsp;&nbsp;mach_port_t &nbsp;&nbsp;&nbsp;&nbsp;masterPort;<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;mach_port_t mainPort;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;CFMutableDictionaryRef &nbsp;classesToMatch;<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;const char *matching_array[] =3D =
{kIODVDMediaClass, kIOCDMediaClass};<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;char *mediaType =3D NULL;<br class=3D""><br =
class=3D"">- &nbsp;&nbsp;&nbsp;kernResult =3D IOMasterPort( =
MACH_PORT_NULL, &amp;masterPort );<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;kernResult =3D IOMainPort(MACH_PORT_NULL, =
&amp;mainPort);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;if ( KERN_SUCCESS =
!=3D kernResult ) {<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf( "IOMasterPort returned =
%d\n", kernResult );<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("IOMainPort returned =
%d\n", kernResult);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;}<br =
class=3D""><br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;int index;<br =
class=3D"">@@ -3342,7 +3348,7 @@ static char =
*FindEjectableOpticalMedia(io_iterator_t *mediaIterator)<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CFDictionarySetValue(class=
esToMatch, CFSTR(kIOMediaEjectableKey),<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;kCFBooleanTrue);<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kernResult =3D =
IOServiceGetMatchingServices(masterPort, classesToMatch,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kernResult =3D =
IOServiceGetMatchingServices(mainPort, classesToMatch,<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;mediaIterator);<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (kernResult !=3D =
KERN_SUCCESS) {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;er=
ror_report("Note: IOServiceGetMatchingServices returned %d",<br =
class=3D"">-- <br class=3D"">2.34.1<br class=3D""><br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_D04F0D81-A8E3-449D-8542-DF3D7C32E531--

