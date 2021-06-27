Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C2D3B52FA
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 13:11:52 +0200 (CEST)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxShb-0003oj-N2
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 07:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1lxSfc-0002ER-Pn; Sun, 27 Jun 2021 07:09:48 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13628
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1lxSfa-0002xr-Eo; Sun, 27 Jun 2021 07:09:48 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15RB4NlX192024; Sun, 27 Jun 2021 07:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=1Jr5JTpCWIGqHdI/HeM/4EOwQKoyzx8P1XTbWIw19RI=;
 b=r1wWfWaZTGwcSjPDQa+S76nXrz+otPcaPPrLvSSZjLzbZM4/cYZUtelyTmhxe+28RLf9
 AlsRD/pVF8rO5jK8JJCQq8Fk/Kd56/p69cz/pDhb/UKn9f4jjfzeDO9x3JG1wHYjcJnN
 N7Pu7NRyV7OrgGBuxlDTSJ4eedjDGn/KyU/rBxh53EkmodWaKbEW2zt0Df4rvIZIKNwL
 DwH7QhtdiNVF8BoNWZUO3A8a9JwDvRQt7upIqemF4iBRgRMt0ARXFz2gp0qQpXxDy2OU
 gS4paiTZ3rt19w7gbKjyzmsKQdTAHsxThCVx3VZOlUKs9eniQXjaUM7Whm2Y5MMOk6mj nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ennva8a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 07:09:44 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15RB58BQ193331;
 Sun, 27 Jun 2021 07:09:43 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ennva8a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 07:09:43 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15RB6cwa028337;
 Sun, 27 Jun 2021 11:09:43 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 39duv9jsb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 11:09:43 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15RB9gTI30278034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 27 Jun 2021 11:09:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38A4A6A04F;
 Sun, 27 Jun 2021 11:09:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AD816A054;
 Sun, 27 Jun 2021 11:09:42 +0000 (GMT)
Received: from mww0312.dal12m.mail.ibm.com (unknown [9.208.69.17])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sun, 27 Jun 2021 11:09:42 +0000 (GMT)
In-Reply-To: <CAOi1vP-pZrqFyjh4cDoNy5pC=4ooQPp=9yXcZxzoDNj8W4=YGA@mail.gmail.com>
From: "Or Ozeri" <ORO@il.ibm.com>
To: "Ilya Dryomov" <idryomov@gmail.com>
Date: Sun, 27 Jun 2021 11:09:39 +0000
Message-ID: <OFD9731CF1.77FDF819-ON00258701.003D4F3D-00258701.003D4F41@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAOi1vP-pZrqFyjh4cDoNy5pC=4ooQPp=9yXcZxzoDNj8W4=YGA@mail.gmail.com>,
 <20210627083054.3920288-1-oro@il.ibm.com>
 <OFDCE9D738.9662FBDF-ON00258701.002FE1AF-00258701.00300179@ibm.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF94   June 24, 2021
X-MIMETrack: Serialize by http on MWW0312/03/M/IBM at 06/27/2021 11:09:39,
 Serialize complete at 06/27/2021 11:09:39
X-KeepSent: D9731CF1:77FDF819-00258701:003D4F3D; name=$KeepSent; type=4
X-Disclaimed: 37723
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aJWzGm_PxIUnD1t4nr5zyZI4p_Jmnowh
X-Proofpoint-ORIG-GUID: R_61lkg0r-X3Hf_mRJSHQSfD1zfKqLIe
Subject: RE: [PATCH] block/rbd: Add support for rbd image encryption
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-27_01:2021-06-25,
 2021-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106270080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ORO@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Danny Harnik <DANNYH@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Should I still leave the encryption format part of the state, and ju=
st not report it? or should I also remove it from the state?<br><br><div><f=
ont color=3D"#990099">-----"Ilya Dryomov" &lt;<a href=3D"mailto:idryomov@gm=
ail.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">idryomov@gmail.com=
</a>&gt; wrote: -----</font></div><div class=3D"iNotesHistory" style=3D"pad=
ding-left:5px;"><div style=3D"padding-right:0px;padding-left:5px;border-lef=
t:solid black 2px;">To: "Or Ozeri" &lt;<a href=3D"mailto:ORO@il.ibm.com" ta=
rget=3D"=5Fblank" rel=3D"noopener noreferrer">ORO@il.ibm.com</a>&gt;<br>Fro=
m: "Ilya Dryomov" &lt;<a href=3D"mailto:idryomov@gmail.com" target=3D"=5Fbl=
ank" rel=3D"noopener noreferrer">idryomov@gmail.com</a>&gt;<br>Date: 06/27/=
2021 02:00PM<br>Cc: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"=5Fb=
lank" rel=3D"noopener noreferrer">qemu-devel@nongnu.org</a>, <a href=3D"mai=
lto:qemu-block@nongnu.org" target=3D"=5Fblank" rel=3D"noopener noreferrer">=
qemu-block@nongnu.org</a>, <a href=3D"mailto:kwolf@redhat.com" target=3D"=
=5Fblank" rel=3D"noopener noreferrer">kwolf@redhat.com</a>, "Mykola Golub" =
&lt;<a href=3D"mailto:to.my.trociny@gmail.com" target=3D"=5Fblank" rel=3D"n=
oopener noreferrer">to.my.trociny@gmail.com</a>&gt;, "Danny Harnik" &lt;<a =
href=3D"mailto:DANNYH@il.ibm.com" target=3D"=5Fblank" rel=3D"noopener noref=
errer">DANNYH@il.ibm.com</a>&gt;, "Daniel P. Berrang=C3=A9" &lt;<a href=3D"=
mailto:berrange@redhat.com" target=3D"=5Fblank" rel=3D"noopener noreferrer"=
>berrange@redhat.com</a>&gt;<br>Subject: [EXTERNAL] Re: [PATCH] block/rbd: =
Add support for rbd image encryption<br><br><div><font face=3D"Courier New,=
Courier,monospace" size=3D"2">On Sun, Jun 27, 2021 at 10:44 AM Or Ozeri &lt=
;<a href=3D"mailto:ORO@il.ibm.com" target=3D"=5Fblank" rel=3D"noopener nore=
ferrer">ORO@il.ibm.com</a>&gt; wrote:<br>&gt;<br>&gt; Ilya,<br>&gt;<br>&gt;=
 I fixed according to your suggestions, except for the passphrase zeroing.<=
br>&gt; Looks like it's not a one-liner, but rather a long list of ifdefs t=
o try and cover all possible platforms/compilers (this is what I've seen th=
ey do in k5-int.h).<br>&gt; I didn't want to copy this into rbd.c.<br>&gt; =
I guess that the right solution would be adding a qemu utility function (no=
t sure where exactly), but anyways perhaps this, like the changes I previou=
sly made to raw=5Fformat.c, should be made in different patch.<br><br>Hi Or=
,<br><br>Yes, given that there doesn't seem to be an existing straightforwa=
rd<br>API for it, I don't think it is a blocker. &nbsp;Just something to ke=
ep in<br>mind.<br><br>You also implemented one change that I didn't suggest=
 -- storing<br>the encryption status in BDRVRBDState. &nbsp;BTW it is a goo=
d practice<br>to include the version in the subject (e.g. [PATCH v3] ...) a=
nd<br>a per-version changelog in the description.<br><br>The way the encryp=
tion format is reported in this patch actually begs<br>more questions becau=
se now I think we need to differentiate between an<br>encrypted image for w=
hich the encryption profile has been loaded and<br>one for which it hasn't =
been loaded and probably also report the raw<br>size...<br><br>The previous=
 approach of reporting the encryption format only for "raw"<br>images was a=
 good starting point IMO. &nbsp;I'd keep the bit that switches<br>from rbd=
=5Fget=5Fsize() to s-&gt;image=5Fsize and drop everything else for now.<br>=
<br>&gt;<br>&gt; Thanks,<br>&gt; Or<br>&gt;<br>&gt; -----"Or Ozeri" &lt;<a =
href=3D"mailto:oro@il.ibm.com" target=3D"=5Fblank" rel=3D"noopener noreferr=
er">oro@il.ibm.com</a>&gt; wrote: -----<br>&gt; To: <a href=3D"mailto:qemu-=
devel@nongnu.org" target=3D"=5Fblank" rel=3D"noopener noreferrer">qemu-deve=
l@nongnu.org</a><br>&gt; From: "Or Ozeri" &lt;<a href=3D"mailto:oro@il.ibm.=
com" target=3D"=5Fblank" rel=3D"noopener noreferrer">oro@il.ibm.com</a>&gt;=
<br>&gt; Date: 06/27/2021 11:31AM<br>&gt; Cc: <a href=3D"mailto:qemu-block@=
nongnu.org" target=3D"=5Fblank" rel=3D"noopener noreferrer">qemu-block@nong=
nu.org</a>, <a href=3D"mailto:oro@il.ibm.com" target=3D"=5Fblank" rel=3D"no=
opener noreferrer">oro@il.ibm.com</a>, <a href=3D"mailto:kwolf@redhat.com" =
target=3D"=5Fblank" rel=3D"noopener noreferrer">kwolf@redhat.com</a>, <a hr=
ef=3D"mailto:to.my.trociny@gmail.com" target=3D"=5Fblank" rel=3D"noopener n=
oreferrer">to.my.trociny@gmail.com</a>, <a href=3D"mailto:dannyh@il.ibm.com=
" target=3D"=5Fblank" rel=3D"noopener noreferrer">dannyh@il.ibm.com</a>, <a=
 href=3D"mailto:berrange@redhat.com" target=3D"=5Fblank" rel=3D"noopener no=
referrer">berrange@redhat.com</a>, <a href=3D"mailto:idryomov@gmail.com" ta=
rget=3D"=5Fblank" rel=3D"noopener noreferrer">idryomov@gmail.com</a><br>&gt=
; Subject: [PATCH] block/rbd: Add support for rbd image encryption<br>&gt;<=
br>&gt; Starting from ceph Pacific, RBD has built-in support for image-leve=
l encryption.<br>&gt; Currently supported formats are LUKS version 1 and 2.=
<br>&gt;<br>&gt; There are 2 new relevant librbd APIs for controlling encry=
ption, both expect an<br>&gt; open image context:<br>&gt;<br>&gt; rbd=5Fenc=
ryption=5Fformat: formats an image (i.e. writes the LUKS header)<br>&gt; rb=
d=5Fencryption=5Fload: loads encryptor/decryptor to the image IO stack<br>&=
gt;<br>&gt; This commit extends the qemu rbd driver API to support the abov=
e.<br>&gt;<br>&gt; Signed-off-by: Or Ozeri &lt;<a href=3D"mailto:oro@il.ibm=
.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">oro@il.ibm.com</a>&gt=
;<br>&gt; ---<br>&gt; &nbsp;block/rbd.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|=
 380 ++++++++++++++++++++++++++++++++++++++++++-<br>&gt; &nbsp;qapi/block-c=
ore.json | 110 ++++++++++++-<br>&gt; &nbsp;2 files changed, 484 insertions(=
+), 6 deletions(-)<br>&gt;<br>&gt; diff --git a/block/rbd.c b/block/rbd.c<b=
r>&gt; index f098a89c7b..dadecaf3da 100644<br>&gt; --- a/block/rbd.c<br>&gt=
; +++ b/block/rbd.c<br>&gt; @@ -73,6 +73,18 @@<br>&gt; &nbsp;#define LIBRBD=
=5FUSE=5FIOVEC 0<br>&gt; &nbsp;#endif<br>&gt;<br>&gt; +#define RBD=5FENCRYP=
TION=5FLUKS=5FHEADER=5FVERIFICATION=5FLEN 8<br>&gt; +<br>&gt; +static const=
 char rbd=5Fluks=5Fheader=5Fverification[<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5FLEN] =3D {<br>&gt; + =
&nbsp; &nbsp;'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1<br>&gt; +};<br>&gt; +<br>=
&gt; +static const char rbd=5Fluks2=5Fheader=5Fverification[<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5FLE=
N] =3D {<br>&gt; + &nbsp; &nbsp;'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2<br>&gt=
; +};<br>&gt; +<br>&gt; &nbsp;typedef enum {<br>&gt; &nbsp; &nbsp; &nbsp;RB=
D=5FAIO=5FREAD,<br>&gt; &nbsp; &nbsp; &nbsp;RBD=5FAIO=5FWRITE,<br>&gt; @@ -=
106,6 +118,7 @@ typedef struct BDRVRBDState {<br>&gt; &nbsp; &nbsp; &nbsp;c=
har *snap;<br>&gt; &nbsp; &nbsp; &nbsp;char *namespace;<br>&gt; &nbsp; &nbs=
p; &nbsp;uint64=5Ft image=5Fsize;<br>&gt; + &nbsp; &nbsp;ImageInfoSpecificR=
bd image=5Finfo;<br>&gt; &nbsp;} BDRVRBDState;<br>&gt;<br>&gt; &nbsp;static=
 int qemu=5Frbd=5Fconnect(rados=5Ft *cluster, rados=5Fioctx=5Ft *io=5Fctx,<=
br>&gt; @@ -341,6 +354,207 @@ static void qemu=5Frbd=5Fmemset(RADOSCB *rcb,=
 int64=5Ft offs)<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;}<br>&gt;<br>&=
gt; +#ifdef LIBRBD=5FSUPPORTS=5FENCRYPTION<br>&gt; +static int qemu=5Frbd=
=5Fconvert=5Fluks=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryp=
tionOptionsLUKSBase *luks=5Fopts,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;char=
 **passphrase,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;size=5Ft *passphrase=5F=
len,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>&gt; =
+ &nbsp; &nbsp;return qcrypto=5Fsecret=5Flookup(luks=5Fopts-&gt;key=5Fsecre=
t, (uint8=5Ft **)passphrase,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 passphrase=5Flen, errp);<br>&gt; +}<br>&gt; +<br>&gt; +static int qemu=5Fr=
bd=5Fconvert=5Fluks=5Fcreate=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;RbdEncryptionCreateOptionsLUKSBase *luks=5Fopts,<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;rbd=5Fencryption=5Falgorithm=5Ft *alg,<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;char **passphrase,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;size=
=5Ft *passphrase=5Flen,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<=
br>&gt; +{<br>&gt; + &nbsp; &nbsp;int r =3D 0;<br>&gt; +<br>&gt; + &nbsp; &=
nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Foptions(<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;qapi=5FRbdEncryptionCreateOptionsLUKSBase=5Fbase(=
luks=5Fopts),<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;passphrase=
, passphrase=5Flen, errp);<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br=
>&gt; + &nbsp; &nbsp;if (luks=5Fopts-&gt;has=5Fcipher=5Falg) {<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;switch (luks=5Fopts-&gt;cipher=5Falg) {<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case QCRYPTO=5FCIPHER=5FALG=5FAES=
=5F128: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
*alg =3D RBD=5FENCRYPTION=5FALGORITHM=5FAES128;<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;c=
ase QCRYPTO=5FCIPHER=5FALG=5FAES=5F256: {<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;*alg =3D RBD=5FENCRYPTION=5FALGORITHM=5FAES=
256;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;default: {<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "unkno=
wn encryption algorithm: %u",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; luks=5Fopts-&gt;cipher=5Falg);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;} =
else {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/* default alg */<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;*alg =3D RBD=5FENCRYPTION=5FALGORITHM=5FAES256;<br>=
&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;return 0;<br>&gt; +}=
<br>&gt; +<br>&gt; +static int qemu=5Frbd=5Fencryption=5Fformat(rbd=5Fimage=
=5Ft image,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;RbdEncryptionCreateOptions *encrypt,<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>&gt; +{<br>&gt; + &nbsp; =
&nbsp;int r =3D 0;<br>&gt; + &nbsp; &nbsp;g=5Fautofree char *passphrase =3D=
 NULL;<br>&gt; + &nbsp; &nbsp;size=5Ft passphrase=5Flen;<br>&gt; + &nbsp; &=
nbsp;rbd=5Fencryption=5Fformat=5Ft format;<br>&gt; + &nbsp; &nbsp;rbd=5Fenc=
ryption=5Foptions=5Ft opts;<br>&gt; + &nbsp; &nbsp;rbd=5Fencryption=5Fluks1=
=5Fformat=5Foptions=5Ft luks=5Fopts;<br>&gt; + &nbsp; &nbsp;rbd=5Fencryptio=
n=5Fluks2=5Fformat=5Foptions=5Ft luks2=5Fopts;<br>&gt; + &nbsp; &nbsp;size=
=5Ft opts=5Fsize;<br>&gt; + &nbsp; &nbsp;uint64=5Ft raw=5Fsize, effective=
=5Fsize;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5Fget=5Fsize(image, &am=
p;raw=5Fsize);<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "cannot get raw image size")=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp;}<b=
r>&gt; +<br>&gt; + &nbsp; &nbsp;switch (encrypt-&gt;format) {<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS: {<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;luks=5Fopts, 0=
, sizeof(luks=5Fopts));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
format =3D RBD=5FENCRYPTION=5FFORMAT=5FLUKS1;<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;opts =3D &amp;luks=5Fopts;<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;opts=5Fsize =3D sizeof(luks=5Fopts);<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Fc=
reate=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;qapi=5FRbdEncryptionCreateOptionsLUKS=5Fbase(&amp;encr=
ypt-&gt;u.luks),<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;&amp;luks=5Fopts.alg, &amp;passphrase, &amp;passphrase=
=5Flen, errp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt=
; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ret=
urn r;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=5Fopts.passphrase =3D passphrase;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=5Fopts.passphrase=
=5Fsize =3D passphrase=5Flen;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2: {<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;luks2=5Fopts, 0, sizeof=
(luks2=5Fopts));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =
=3D RBD=5FENCRYPTION=5FFORMAT=5FLUKS2;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;opts =3D &amp;luks2=5Fopts;<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;opts=5Fsize =3D sizeof(luks2=5Fopts);<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Fcreate=
=5Foptions(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;qapi=5FRbdEncryptionCreateOptionsLUKS2=5Fbase(<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;&amp;encrypt-&gt;u.luks2),<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;luks2=5Fopts.alg, &=
amp;passphrase, &amp;passphrase=5Flen, errp);<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks2=5F=
opts.passphrase =3D passphrase;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;luks2=5Fopts.passphrase=5Fsize =3D passphrase=5Flen;<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;default: {<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;errp, -r, "unknown image =
encryption format: %u",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;encrypt-&gt;format);<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<b=
r>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5Fencryp=
tion=5Fformat(image, format, opts, opts=5Fsize);<br>&gt; + &nbsp; &nbsp;if =
(r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp=
, -r, "encryption format fail");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;retur=
n r;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5F=
get=5Fsize(image, &amp;effective=5Fsize);<br>&gt; + &nbsp; &nbsp;if (r &lt;=
 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "=
cannot get effective image size");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ret=
urn r;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=
=5Fresize(image, raw=5Fsize + (raw=5Fsize - effective=5Fsize));<br>&gt; + &=
nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fse=
tg=5Ferrno(errp, -r, "cannot resize image after format");<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + =
&nbsp; &nbsp;return 0;<br>&gt; +}<br>&gt; +<br>&gt; +static int qemu=5Frbd=
=5Fencryption=5Fload(rbd=5Fimage=5Ft image,<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionOptions *encrypt,<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ImageInfoSpecificRbd *image=5F=
info,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Error **e=
rrp)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;int r =3D 0;<br>&gt; + &nbsp; &nbsp;=
g=5Fautofree char *passphrase =3D NULL;<br>&gt; + &nbsp; &nbsp;size=5Ft pas=
sphrase=5Flen;<br>&gt; + &nbsp; &nbsp;rbd=5Fencryption=5Fluks1=5Fformat=5Fo=
ptions=5Ft luks=5Fopts;<br>&gt; + &nbsp; &nbsp;rbd=5Fencryption=5Fluks2=5Ff=
ormat=5Foptions=5Ft luks2=5Fopts;<br>&gt; + &nbsp; &nbsp;rbd=5Fencryption=
=5Fformat=5Ft format;<br>&gt; + &nbsp; &nbsp;rbd=5Fencryption=5Foptions=5Ft=
 opts;<br>&gt; + &nbsp; &nbsp;size=5Ft opts=5Fsize;<br>&gt; +<br>&gt; + &nb=
sp; &nbsp;switch (encrypt-&gt;format) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS: {<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;luks=5Fopts, 0, sizeof(luks=5Fopts))=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD=5FENCRY=
PTION=5FFORMAT=5FLUKS1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
opts =3D &amp;luks=5Fopts;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;opts=5Fsize =3D sizeof(luks=5Fopts);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Foptions(<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=5FRbd=
EncryptionOptionsLUKS=5Fbase(&amp;encrypt-&gt;u.luks),<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;passphrase,=
 &amp;passphrase=5Flen, errp);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=5Fopts.passphrase =
=3D passphrase;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=5Fo=
pts.passphrase=5Fsize =3D passphrase=5Flen;<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;image=5Finfo-&gt;encryption=5Fformat =3D RBD=5FIMAGE=5F=
ENCRYPTION=5FFORMAT=5FLUKS;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2: {<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;luks2=5Fopts, 0, sizeof(l=
uks2=5Fopts));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =
=3D RBD=5FENCRYPTION=5FFORMAT=5FLUKS2;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;opts =3D &amp;luks2=5Fopts;<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;opts=5Fsize =3D sizeof(luks2=5Fopts);<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Foption=
s(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;qapi=5FRbdEncryptionOptionsLUKS2=5Fbase(&amp;encrypt-&gt;u.luks2),<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;&amp;passphrase, &amp;passphrase=5Flen, errp);<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=
2=5Fopts.passphrase =3D passphrase;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;luks2=5Fopts.passphrase=5Fsize =3D passphrase=5Flen;<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;image=5Finfo-&gt;encryption=5Fform=
at =3D RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2;<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;default: {<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;error=5Fsetg=5Ferrno(<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;errp, -r, "unknown image encryption =
format: %u",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;encrypt-&gt;format);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;return r;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &n=
bsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D rbd=5Fencryption=5Fload=
(image, format, opts, opts=5Fsize);<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "encryp=
tion load fail");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>&gt; + =
&nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;image=5Finfo-&gt;has=5Fencr=
yption=5Fformat =3D true;<br>&gt; + &nbsp; &nbsp;return 0;<br>&gt; +}<br>&g=
t; +#endif<br>&gt; +<br>&gt; &nbsp;/* FIXME Deprecate and remove keypairs o=
r make it available in QMP. */<br>&gt; &nbsp;static int qemu=5Frbd=5Fdo=5Fc=
reate(BlockdevCreateOptions *options,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;const char *keypairs, const char *password=5Fsecret,<br>&gt; @@ -358=
,6 +572,13 @@ static int qemu=5Frbd=5Fdo=5Fcreate(BlockdevCreateOptions *op=
tions,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -EINVAL;<br>&gt; &n=
bsp; &nbsp; &nbsp;}<br>&gt;<br>&gt; +#ifndef LIBRBD=5FSUPPORTS=5FENCRYPTION=
<br>&gt; + &nbsp; &nbsp;if (opts-&gt;has=5Fencrypt) {<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;error=5Fsetg(errp, "RBD library does not support image encr=
yption");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return -ENOTSUP;<br>&gt; + &=
nbsp; &nbsp;}<br>&gt; +#endif<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;if (opt=
s-&gt;has=5Fcluster=5Fsize) {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int=
64=5Ft objsize =3D opts-&gt;cluster=5Fsize;<br>&gt; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;if ((objsize - 1) &amp; objsize) { &nbsp; &nbsp;/* not a power o=
f 2? */<br>&gt; @@ -383,6 +604,28 @@ static int qemu=5Frbd=5Fdo=5Fcreate(Bl=
ockdevCreateOptions *options,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;got=
o out;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt;<br>&gt; +#ifdef LIBRBD=5FSUPPO=
RTS=5FENCRYPTION<br>&gt; + &nbsp; &nbsp;if (opts-&gt;has=5Fencrypt) {<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fimage=5Ft image;<br>&gt; +<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;ret =3D rbd=5Fopen(io=5Fctx, opts-&gt;location-&=
gt;image, &amp;image, NULL);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (ret &=
lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5F=
errno(errp, -ret,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "error opening image '%s=
' for encryption format",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; opts-&gt;locatio=
n-&gt;image);<br><br>No need to include image name here.<br><br>Thanks,<br>=
<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Ilya<br></=
font></div></div></div></font><BR>
<BR>

