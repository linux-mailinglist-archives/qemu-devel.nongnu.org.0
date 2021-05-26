Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB339208C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:06:54 +0200 (CEST)
Received: from localhost ([::1]:50870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyrl-0001BC-Hz
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1llxTU-0004f0-Hz
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:37:44 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:5264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mmorrell@tachyum.com>)
 id 1llxTN-00041Q-RZ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:37:40 -0400
Received: by mx1.tachyum.com (Postfix, from userid 1000)
 id 02F141005691; Wed, 26 May 2021 10:37:34 -0700 (PDT)
Received: from THQ-EX1.tachyum.com (unknown [10.7.1.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.tachyum.com (Postfix) with ESMTPS id 762BF1005283
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:37:34 -0700 (PDT)
Received: from THQ-EX3.tachyum.com (10.7.1.26) by THQ-EX1.tachyum.com
 (10.7.1.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 26 May
 2021 10:37:34 -0700
Received: from THQ-EX1.tachyum.com (10.7.1.6) by THQ-EX3.tachyum.com
 (10.7.1.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 26 May
 2021 10:37:33 -0700
Received: from THQ-EX1.tachyum.com ([10.7.1.6]) by THQ-EX1.tachyum.com
 ([10.7.1.6]) with mapi id 15.01.2176.014; Wed, 26 May 2021 10:37:33 -0700
From: Michael Morrell <mmorrell@tachyum.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Denormal input handling
Thread-Topic: Denormal input handling
Thread-Index: AddSVLVuQ70cTMk8SjeoZZpZvpdwcw==
Date: Wed, 26 May 2021 17:37:33 +0000
Message-ID: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.252.4]
Content-Type: multipart/alternative;
 boundary="_000_30eafc8be31446f9aecbc40f487467e1tachyumcom_"
MIME-Version: 1.0
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mmorrell@tachyum.com;
 helo=mx1.tachyum.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 May 2021 15:02:53 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_30eafc8be31446f9aecbc40f487467e1tachyumcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I see support in QEMU for architectures which have a denormal input flag bi=
t and those that have a "flush inputs to zero" control bit, but the impleme=
ntation is not specializable and seems wrong for x86 at least.

For example, in sf_canonicalize, if the input is denormal and "flush_inputs=
_to_zero" is true, the "input denormal" flag is set and then the value is s=
et to a zero value, and if the input is denormal and "flush_inputs_to_zero"=
 is false, then the input is simply normalized.

I think the behavior should be for denormal inputs that if "flush_inputs_to=
_zero" is true, then the value is set to zero; and if "flush_inputs_to_zero=
" is false, set the "input denormal" flag and normalize the input.

This matches what x86 does (I'm not sure about other architectures).

Am I missing something?  If not, I can work on a patch (there are several p=
laces which check "flush_inputs_to_zero" which will need to be changed).

  Michael

--_000_30eafc8be31446f9aecbc40f487467e1tachyumcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I see support in QEMU for architectures which have a=
 denormal input flag bit and those that have a &quot;flush inputs to zero&q=
uot; control bit, but the implementation is not specializable and seems wro=
ng for x86 at least.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For example, in sf_canonicalize, if the input is den=
ormal and &quot;flush_inputs_to_zero&quot; is true, the &quot;input denorma=
l&quot; flag is set and then the value is set to a zero value, and if the i=
nput is denormal and &quot;flush_inputs_to_zero&quot; is false,
 then the input is simply normalized.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I think the behavior should be for denormal inputs t=
hat if &quot;flush_inputs_to_zero&quot; is true, then the value is set to z=
ero; and if &quot;flush_inputs_to_zero&quot; is false, set the &quot;input =
denormal&quot; flag and normalize the input.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This matches what x86 does (I'm not sure about other=
 architectures).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Am I missing something?&nbsp; If not, I can work on =
a patch (there are several places which check &quot;flush_inputs_to_zero&qu=
ot; which will need to be changed).<br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Michael<o:p></o:p></p>
</div>
</body>
</html>

--_000_30eafc8be31446f9aecbc40f487467e1tachyumcom_--

