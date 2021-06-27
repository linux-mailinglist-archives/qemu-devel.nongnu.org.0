Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0B03B5298
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 10:45:52 +0200 (CEST)
Received: from localhost ([::1]:49724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxQQJ-00025M-Mg
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 04:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1lxQP1-0001AY-Sx; Sun, 27 Jun 2021 04:44:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50544
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1lxQOy-0002zs-Uq; Sun, 27 Jun 2021 04:44:31 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15R8Y6dK018479; Sun, 27 Jun 2021 04:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : message-id : content-transfer-encoding :
 content-type : mime-version : references; s=pp1;
 bh=vTPeLiw2Qw3Q/ZR9sgCSJNTQGfANNzIzvwgdkCsczso=;
 b=JpFqaPLDSQceJEIxxr5jDuPtqd7bFtIY4tTcZ4UV0/1FdBbkemzIJKn/JTj99Ny0ST6M
 PZxbIF402QXCB5FQcLfWzKeiBdf13vCelyah9+O4ANmh2mP4Ouj/Y+aKFweGpn8M6vDi
 4i2znaA2wjVUr1NvPrStbtS9ifllrlZZe11g72NsOnU8NAy1l6XRzWwyygaTI7OYOSy1
 8j9xno2MfJtVjn3yAPJhpiYpGCsSIywBp2NxwKsgsd7eqDcwBwwnRcM1o34ZMZfaBjs1
 /doW0q2o8RtlNcn9zUCnU0QpiINwTZYog0xjlwDH7mxILKIy7oSJPm/LpzKnMqkd5I5E nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39enpqgakt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 04:44:25 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15R8bnhh028582;
 Sun, 27 Jun 2021 04:44:25 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39enpqgakn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 04:44:24 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15R8QHfu023573;
 Sun, 27 Jun 2021 08:44:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 39ejyvtpg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Jun 2021 08:44:24 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15R8iNpa12976460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 27 Jun 2021 08:44:23 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68AF1136051;
 Sun, 27 Jun 2021 08:44:23 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FB1E13605E;
 Sun, 27 Jun 2021 08:44:23 +0000 (GMT)
Received: from mww0312.dal12m.mail.ibm.com (unknown [9.208.69.17])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sun, 27 Jun 2021 08:44:23 +0000 (GMT)
In-Reply-To: <20210627083054.3920288-1-oro@il.ibm.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
From: "Or Ozeri" <ORO@il.ibm.com>
To: qemu-devel@nongnu.org
Date: Sun, 27 Jun 2021 08:44:21 +0000
Message-ID: <OFDCE9D738.9662FBDF-ON00258701.002FE1AF-00258701.00300179@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20210627083054.3920288-1-oro@il.ibm.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF94   June 24, 2021
X-MIMETrack: Serialize by http on MWW0312/03/M/IBM at 06/27/2021 08:44:21,
 Serialize complete at 06/27/2021 08:44:21
X-KeepSent: DCE9D738:9662FBDF-00258701:002FE1AF; name=$KeepSent; type=4
X-Disclaimed: 6151
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zTOfRILuFnEQQ6HBI6L1TxGz5OWZzECz
X-Proofpoint-ORIG-GUID: muGF_CQvDcnVpoeG_hO3wahVtZezz8v2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-26_15:2021-06-25,
 2021-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106270061
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 Danny Harnik <DANNYH@il.ibm.com>, Or Ozeri <ORO@il.ibm.com>,
 idryomov@gmail.com, to.my.trociny@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Ilya,<div><br></div><div>I fixed according to your suggestions, exce=
pt for the passphrase zeroing.</div><div>Looks like it's not a one-liner, b=
ut rather a long list of ifdefs to try and cover all possible platforms/com=
pilers (this is what I've seen they do in k5-int.h).</div><div>I didn't wan=
t to copy this into rbd.c.</div><div>I guess that the right solution would =
be adding a qemu utility function (not sure where exactly), but anyways per=
haps this, like the changes I previously made to raw=5Fformat.c, should be =
made in different patch.</div><div><br></div><div>Thanks,</div><div>Or<br><=
br><div><font color=3D"#990099">-----"Or Ozeri" &lt;<a href=3D"mailto:oro@i=
l.ibm.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">oro@il.ibm.com</=
a>&gt; wrote: -----</font></div><div class=3D"iNotesHistory" style=3D"paddi=
ng-left:5px;"><div style=3D"padding-right:0px;padding-left:5px;border-left:=
solid black 2px;">To: <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"=
=5Fblank" rel=3D"noopener noreferrer">qemu-devel@nongnu.org</a><br>From: "O=
r Ozeri" &lt;<a href=3D"mailto:oro@il.ibm.com" target=3D"=5Fblank" rel=3D"n=
oopener noreferrer">oro@il.ibm.com</a>&gt;<br>Date: 06/27/2021 11:31AM<br>C=
c: <a href=3D"mailto:qemu-block@nongnu.org" target=3D"=5Fblank" rel=3D"noop=
ener noreferrer">qemu-block@nongnu.org</a>, <a href=3D"mailto:oro@il.ibm.co=
m" target=3D"=5Fblank" rel=3D"noopener noreferrer">oro@il.ibm.com</a>, <a h=
ref=3D"mailto:kwolf@redhat.com" target=3D"=5Fblank" rel=3D"noopener norefer=
rer">kwolf@redhat.com</a>, <a href=3D"mailto:to.my.trociny@gmail.com" targe=
t=3D"=5Fblank" rel=3D"noopener noreferrer">to.my.trociny@gmail.com</a>, <a =
href=3D"mailto:dannyh@il.ibm.com" target=3D"=5Fblank" rel=3D"noopener noref=
errer">dannyh@il.ibm.com</a>, <a href=3D"mailto:berrange@redhat.com" target=
=3D"=5Fblank" rel=3D"noopener noreferrer">berrange@redhat.com</a>, <a href=
=3D"mailto:idryomov@gmail.com" target=3D"=5Fblank" rel=3D"noopener noreferr=
er">idryomov@gmail.com</a><br>Subject: [PATCH] block/rbd: Add support for r=
bd image encryption<br><br><div><font face=3D"Courier New,Courier,monospace=
" size=3D"2">Starting from ceph Pacific, RBD has built-in support for image=
-level encryption.<br>Currently supported formats are LUKS version 1 and 2.=
<br><br>There are 2 new relevant librbd APIs for controlling encryption, bo=
th expect an<br>open image context:<br><br>rbd=5Fencryption=5Fformat: forma=
ts an image (i.e. writes the LUKS header)<br>rbd=5Fencryption=5Fload: loads=
 encryptor/decryptor to the image IO stack<br><br>This commit extends the q=
emu rbd driver API to support the above.<br><br>Signed-off-by: Or Ozeri &lt=
;<a href=3D"mailto:oro@il.ibm.com" target=3D"=5Fblank" rel=3D"noopener nore=
ferrer">oro@il.ibm.com</a>&gt;<br>---<br>&nbsp;block/rbd.c &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;| 380 ++++++++++++++++++++++++++++++++++++++++++-<br>&nbs=
p;qapi/block-core.json | 110 ++++++++++++-<br>&nbsp;2 files changed, 484 in=
sertions(+), 6 deletions(-)<br><br>diff --git a/block/rbd.c b/block/rbd.c<b=
r>index f098a89c7b..dadecaf3da 100644<br>--- a/block/rbd.c<br>+++ b/block/r=
bd.c<br>@@ -73,6 +73,18 @@<br>&nbsp;#define LIBRBD=5FUSE=5FIOVEC 0<br>&nbsp=
;#endif<br>&nbsp;<br>+#define RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATI=
ON=5FLEN 8<br>+<br>+static const char rbd=5Fluks=5Fheader=5Fverification[<b=
r>+ &nbsp; &nbsp; &nbsp; &nbsp;RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICAT=
ION=5FLEN] =3D {<br>+ &nbsp; &nbsp;'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1<br>=
+};<br>+<br>+static const char rbd=5Fluks2=5Fheader=5Fverification[<br>+ &n=
bsp; &nbsp; &nbsp; &nbsp;RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5F=
LEN] =3D {<br>+ &nbsp; &nbsp;'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2<br>+};<br=
>+<br>&nbsp;typedef enum {<br>&nbsp;&nbsp; &nbsp; RBD=5FAIO=5FREAD,<br>&nbs=
p;&nbsp; &nbsp; RBD=5FAIO=5FWRITE,<br>@@ -106,6 +118,7 @@ typedef struct BD=
RVRBDState {<br>&nbsp;&nbsp; &nbsp; char *snap;<br>&nbsp;&nbsp; &nbsp; char=
 *namespace;<br>&nbsp;&nbsp; &nbsp; uint64=5Ft image=5Fsize;<br>+ &nbsp; &n=
bsp;ImageInfoSpecificRbd image=5Finfo;<br>&nbsp;} BDRVRBDState;<br>&nbsp;<b=
r>&nbsp;static int qemu=5Frbd=5Fconnect(rados=5Ft *cluster, rados=5Fioctx=
=5Ft *io=5Fctx,<br>@@ -341,6 +354,207 @@ static void qemu=5Frbd=5Fmemset(RA=
DOSCB *rcb, int64=5Ft offs)<br>&nbsp;&nbsp; &nbsp; }<br>&nbsp;}<br>&nbsp;<b=
r>+#ifdef LIBRBD=5FSUPPORTS=5FENCRYPTION<br>+static int qemu=5Frbd=5Fconver=
t=5Fluks=5Foptions(<br>+ &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionOptionsLUK=
SBase *luks=5Fopts,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;char **passphrase,<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp;size=5Ft *passphrase=5Flen,<br>+ &nbsp; &nbsp; =
&nbsp; &nbsp;Error **errp)<br>+{<br>+ &nbsp; &nbsp;return qcrypto=5Fsecret=
=5Flookup(luks=5Fopts-&gt;key=5Fsecret, (uint8=5Ft **)passphrase,<br>+ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; passphrase=5Flen, errp);<br>+}<br>+<br>+st=
atic int qemu=5Frbd=5Fconvert=5Fluks=5Fcreate=5Foptions(<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp;RbdEncryptionCreateOptionsLUKSBase *luks=5Fopts,<br>+ &nbsp; =
&nbsp; &nbsp; &nbsp;rbd=5Fencryption=5Falgorithm=5Ft *alg,<br>+ &nbsp; &nbs=
p; &nbsp; &nbsp;char **passphrase,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;size=5Ft=
 *passphrase=5Flen,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>+{<br>=
+ &nbsp; &nbsp;int r =3D 0;<br>+<br>+ &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconve=
rt=5Fluks=5Foptions(<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=5FR=
bdEncryptionCreateOptionsLUKSBase=5Fbase(luks=5Fopts),<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;passphrase, passphrase=5Flen, errp);<br>+ &nbsp; =
&nbsp;if (r &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nbsp;=
 &nbsp;}<br>+<br>+ &nbsp; &nbsp;if (luks=5Fopts-&gt;has=5Fcipher=5Falg) {<b=
r>+ &nbsp; &nbsp; &nbsp; &nbsp;switch (luks=5Fopts-&gt;cipher=5Falg) {<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case QCRYPTO=5FCIPHER=5FALG=5FAES=
=5F128: {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*alg =
=3D RBD=5FENCRYPTION=5FALGORITHM=5FAES128;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;break;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;case QCRYPTO=5FCIPHER=
=5FALG=5FAES=5F256: {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;*alg =3D RBD=5FENCRYPTION=5FALGORITHM=5FAES256;<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default: =
{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSU=
P;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=
=5Ferrno(errp, -r, "unknown encryption algorithm: %u",<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; luks=5Fopts-&gt;cipher=5Falg);<br>+ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp;} =
else {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;/* default alg */<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp;*alg =3D RBD=5FENCRYPTION=5FALGORITHM=5FAES256;<br>+ &nbsp; &=
nbsp;}<br>+<br>+ &nbsp; &nbsp;return 0;<br>+}<br>+<br>+static int qemu=5Frb=
d=5Fencryption=5Fformat(rbd=5Fimage=5Ft image,<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionCreateOptions *encrypt,<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>=
+{<br>+ &nbsp; &nbsp;int r =3D 0;<br>+ &nbsp; &nbsp;g=5Fautofree char *pass=
phrase =3D NULL;<br>+ &nbsp; &nbsp;size=5Ft passphrase=5Flen;<br>+ &nbsp; &=
nbsp;rbd=5Fencryption=5Fformat=5Ft format;<br>+ &nbsp; &nbsp;rbd=5Fencrypti=
on=5Foptions=5Ft opts;<br>+ &nbsp; &nbsp;rbd=5Fencryption=5Fluks1=5Fformat=
=5Foptions=5Ft luks=5Fopts;<br>+ &nbsp; &nbsp;rbd=5Fencryption=5Fluks2=5Ffo=
rmat=5Foptions=5Ft luks2=5Fopts;<br>+ &nbsp; &nbsp;size=5Ft opts=5Fsize;<br=
>+ &nbsp; &nbsp;uint64=5Ft raw=5Fsize, effective=5Fsize;<br>+<br>+ &nbsp; &=
nbsp;r =3D rbd=5Fget=5Fsize(image, &amp;raw=5Fsize);<br>+ &nbsp; &nbsp;if (=
r &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, =
"cannot get raw image size");<br>+ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>=
+ &nbsp; &nbsp;}<br>+<br>+ &nbsp; &nbsp;switch (encrypt-&gt;format) {<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS: {=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;luks=5Fopts, 0, =
sizeof(luks=5Fopts));<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =
=3D RBD=5FENCRYPTION=5FFORMAT=5FLUKS1;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;opts =3D &amp;luks=5Fopts;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;opts=5Fsize =3D sizeof(luks=5Fopts);<br>+ &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Fcreate=5Foptions(<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=
=5FRbdEncryptionCreateOptionsLUKS=5Fbase(&amp;encrypt-&gt;u.luks),<br>+ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;luks=
=5Fopts.alg, &amp;passphrase, &amp;passphrase=5Flen, errp);<br>+ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=5Fopts.pa=
ssphrase =3D passphrase;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=
=5Fopts.passphrase=5Fsize =3D passphrase=5Flen;<br>+ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;break;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nb=
sp; &nbsp; &nbsp;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2: {<br>+ &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;luks2=5Fopts, 0, sizeof(l=
uks2=5Fopts));<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD=
=5FENCRYPTION=5FFORMAT=5FLUKS2;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;opts =3D &amp;luks2=5Fopts;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;opts=5Fsize =3D sizeof(luks2=5Fopts);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Fcreate=5Foptions(<br>+ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=5FRbdE=
ncryptionCreateOptionsLUKS2=5Fbase(<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;encrypt=
-&gt;u.luks2),<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;&amp;luks2=5Fopts.alg, &amp;passphrase, &amp;passphrase=5Flen=
, errp);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;luks2=5Fopts.passphrase =3D passphrase;<br>+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;luks2=5Fopts.passphrase=5Fsize =3D passphrase=5Flen;<b=
r>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;<br>+ &nbsp; &nbsp; &nbs=
p; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp;default: {<br>+ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;r =3D -ENOTSUP;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;error=5Fsetg=5Ferrno(<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;errp, -r, "unknown image encryption format=
: %u",<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;encrypt-&gt;format);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;re=
turn r;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp;}<br>+<br>+ &nb=
sp; &nbsp;r =3D rbd=5Fencryption=5Fformat(image, format, opts, opts=5Fsize)=
;<br>+ &nbsp; &nbsp;if (r &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;error=
=5Fsetg=5Ferrno(errp, -r, "encryption format fail");<br>+ &nbsp; &nbsp; &nb=
sp; &nbsp;return r;<br>+ &nbsp; &nbsp;}<br>+<br>+ &nbsp; &nbsp;r =3D rbd=5F=
get=5Fsize(image, &amp;effective=5Fsize);<br>+ &nbsp; &nbsp;if (r &lt; 0) {=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "cannot get=
 effective image size");<br>+ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nb=
sp; &nbsp;}<br>+<br>+ &nbsp; &nbsp;r =3D rbd=5Fresize(image, raw=5Fsize + (=
raw=5Fsize - effective=5Fsize));<br>+ &nbsp; &nbsp;if (r &lt; 0) {<br>+ &nb=
sp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp, -r, "cannot resize image=
 after format");<br>+ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nbsp; &nbs=
p;}<br>+<br>+ &nbsp; &nbsp;return 0;<br>+}<br>+<br>+static int qemu=5Frbd=
=5Fencryption=5Fload(rbd=5Fimage=5Ft image,<br>+ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;RbdEncryptionOptions *encrypt,<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ImageInfoSpecificRbd *image=5Finfo,<br>+=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>+{<br>+=
 &nbsp; &nbsp;int r =3D 0;<br>+ &nbsp; &nbsp;g=5Fautofree char *passphrase =
=3D NULL;<br>+ &nbsp; &nbsp;size=5Ft passphrase=5Flen;<br>+ &nbsp; &nbsp;rb=
d=5Fencryption=5Fluks1=5Fformat=5Foptions=5Ft luks=5Fopts;<br>+ &nbsp; &nbs=
p;rbd=5Fencryption=5Fluks2=5Fformat=5Foptions=5Ft luks2=5Fopts;<br>+ &nbsp;=
 &nbsp;rbd=5Fencryption=5Fformat=5Ft format;<br>+ &nbsp; &nbsp;rbd=5Fencryp=
tion=5Foptions=5Ft opts;<br>+ &nbsp; &nbsp;size=5Ft opts=5Fsize;<br>+<br>+ =
&nbsp; &nbsp;switch (encrypt-&gt;format) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;=
case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS: {<br>+ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;memset(&amp;luks=5Fopts, 0, sizeof(luks=5Fopts));<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD=5FENCRYPTION=5FFORM=
AT=5FLUKS1;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts =3D &amp;luk=
s=5Fopts;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts=5Fsize =3D siz=
eof(luks=5Fopts);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r =3D qemu=
=5Frbd=5Fconvert=5Fluks=5Foptions(<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=5FRbdEncryptionOptionsLUKS=5Fbase(&a=
mp;encrypt-&gt;u.luks),<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;&amp;passphrase, &amp;passphrase=5Flen, errp);<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;luks=
=5Fopts.passphrase =3D passphrase;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;luks=5Fopts.passphrase=5Fsize =3D passphrase=5Flen;<br>+ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;image=5Finfo-&gt;encryption=5Fformat =3D RBD=
=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;break;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp=
; &nbsp;case RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2: {<br>+ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;memset(&amp;luks2=5Fopts, 0, sizeof(luks2=5Fop=
ts));<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;format =3D RBD=5FENCRYP=
TION=5FFORMAT=5FLUKS2;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts =
=3D &amp;luks2=5Fopts;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;opts=
=5Fsize =3D sizeof(luks2=5Fopts);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;r =3D qemu=5Frbd=5Fconvert=5Fluks=5Foptions(<br>+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qapi=5FRbdEncryptionOption=
sLUKS2=5Fbase(&amp;encrypt-&gt;u.luks2),<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;passphrase, &amp;passphrase=5F=
len, errp);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<b=
r>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;luks2=5Fopts.passphrase =3D passphrase;<br>+ &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;luks2=5Fopts.passphrase=5Fsize =3D passphrase=5Flen=
;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;image=5Finfo-&gt;encryption=
=5Fformat =3D RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2;<br>+ &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;break;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &=
nbsp; &nbsp; &nbsp; &nbsp;default: {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;r =3D -ENOTSUP;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=
=5Fsetg=5Ferrno(<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;errp, -r, "unknown image encryption format: %u",<br>+ &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;encrypt-&gt=
;format);<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>+ &nbs=
p; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp; &nbsp;}<br>+<br>+ &nbsp; &nbsp;r =3D r=
bd=5Fencryption=5Fload(image, format, opts, opts=5Fsize);<br>+ &nbsp; &nbsp=
;if (r &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(errp,=
 -r, "encryption load fail");<br>+ &nbsp; &nbsp; &nbsp; &nbsp;return r;<br>=
+ &nbsp; &nbsp;}<br>+<br>+ &nbsp; &nbsp;image=5Finfo-&gt;has=5Fencryption=
=5Fformat =3D true;<br>+ &nbsp; &nbsp;return 0;<br>+}<br>+#endif<br>+<br>&n=
bsp;/* FIXME Deprecate and remove keypairs or make it available in QMP. */<=
br>&nbsp;static int qemu=5Frbd=5Fdo=5Fcreate(BlockdevCreateOptions *options=
,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const char *keypairs, const char *=
password=5Fsecret,<br>@@ -358,6 +572,13 @@ static int qemu=5Frbd=5Fdo=5Fcre=
ate(BlockdevCreateOptions *options,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; re=
turn -EINVAL;<br>&nbsp;&nbsp; &nbsp; }<br>&nbsp;<br>+#ifndef LIBRBD=5FSUPPO=
RTS=5FENCRYPTION<br>+ &nbsp; &nbsp;if (opts-&gt;has=5Fencrypt) {<br>+ &nbsp=
; &nbsp; &nbsp; &nbsp;error=5Fsetg(errp, "RBD library does not support imag=
e encryption");<br>+ &nbsp; &nbsp; &nbsp; &nbsp;return -ENOTSUP;<br>+ &nbsp=
; &nbsp;}<br>+#endif<br>+<br>&nbsp;&nbsp; &nbsp; if (opts-&gt;has=5Fcluster=
=5Fsize) {<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; int64=5Ft objsize =3D opts-=
&gt;cluster=5Fsize;<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; if ((objsize - 1) =
&amp; objsize) { &nbsp; &nbsp;/* not a power of 2? */<br>@@ -383,6 +604,28 =
@@ static int qemu=5Frbd=5Fdo=5Fcreate(BlockdevCreateOptions *options,<br>&=
nbsp;&nbsp; &nbsp; &nbsp; &nbsp; goto out;<br>&nbsp;&nbsp; &nbsp; }<br>&nbs=
p;<br>+#ifdef LIBRBD=5FSUPPORTS=5FENCRYPTION<br>+ &nbsp; &nbsp;if (opts-&gt=
;has=5Fencrypt) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fimage=5Ft image;<br=
>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp;ret =3D rbd=5Fopen(io=5Fctx, opts-&gt;lo=
cation-&gt;image, &amp;image, NULL);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;if (re=
t &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Fer=
rno(errp, -ret,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "error opening image '%s' for e=
ncryption format",<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; opts-&gt;location-&gt;image)=
;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out;<br>+ &nbsp; &nbsp=
; &nbsp; &nbsp;}<br>+<br>+ &nbsp; &nbsp; &nbsp; &nbsp;ret =3D qemu=5Frbd=5F=
encryption=5Fformat(image, opts-&gt;encrypt, errp);<br>+ &nbsp; &nbsp; &nbs=
p; &nbsp;rbd=5Fclose(image);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;if (ret &lt; 0=
) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* encryption format fail=
, try removing the image */<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r=
bd=5Fremove(io=5Fctx, opts-&gt;location-&gt;image);<br>+ &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;goto out;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nb=
sp; &nbsp;}<br>+#endif<br>+<br>&nbsp;&nbsp; &nbsp; ret =3D 0;<br>&nbsp;out:=
<br>&nbsp;&nbsp; &nbsp; rados=5Fioctx=5Fdestroy(io=5Fctx);<br>@@ -395,6 +63=
8,43 @@ static int qemu=5Frbd=5Fco=5Fcreate(BlockdevCreateOptions *options,=
 Error **errp)<br>&nbsp;&nbsp; &nbsp; return qemu=5Frbd=5Fdo=5Fcreate(optio=
ns, NULL, NULL, errp);<br>&nbsp;}<br>&nbsp;<br>+static int qemu=5Frbd=5Fext=
ract=5Fencryption=5Fcreate=5Foptions(<br>+ &nbsp; &nbsp; &nbsp; &nbsp;QemuO=
pts *opts,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;RbdEncryptionCreateOptions **spe=
c,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;Error **errp)<br>+{<br>+ &nbsp; &nbsp;QD=
ict *opts=5Fqdict;<br>+ &nbsp; &nbsp;QDict *encrypt=5Fqdict;<br>+ &nbsp; &n=
bsp;Visitor *v;<br>+ &nbsp; &nbsp;int ret =3D 0;<br>+<br>+ &nbsp; &nbsp;opt=
s=5Fqdict =3D qemu=5Fopts=5Fto=5Fqdict(opts, NULL);<br>+ &nbsp; &nbsp;qdict=
=5Fextract=5Fsubqdict(opts=5Fqdict, &amp;encrypt=5Fqdict, "encrypt.");<br>+=
 &nbsp; &nbsp;qobject=5Funref(opts=5Fqdict);<br>+ &nbsp; &nbsp;if (!qdict=
=5Fsize(encrypt=5Fqdict)) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;*spec =3D NULL;=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>+ &nbsp; &nbsp;}<br>+<br>+ &=
nbsp; &nbsp;/* Convert options into a QAPI object */<br>+ &nbsp; &nbsp;v =
=3D qobject=5Finput=5Fvisitor=5Fnew=5Fflat=5Fconfused(encrypt=5Fqdict, errp=
);<br>+ &nbsp; &nbsp;if (!v) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;ret =3D -EIN=
VAL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>+ &nbsp; &nbsp;}<br>+<br=
>+ &nbsp; &nbsp;visit=5Ftype=5FRbdEncryptionCreateOptions(v, NULL, spec, er=
rp);<br>+ &nbsp; &nbsp;visit=5Ffree(v);<br>+ &nbsp; &nbsp;if (!*spec) {<br>=
+ &nbsp; &nbsp; &nbsp; &nbsp;ret =3D -EINVAL;<br>+ &nbsp; &nbsp; &nbsp; &nb=
sp;goto exit;<br>+ &nbsp; &nbsp;}<br>+<br>+exit:<br>+ &nbsp; &nbsp;qobject=
=5Funref(encrypt=5Fqdict);<br>+ &nbsp; &nbsp;return ret;<br>+}<br>+<br>&nbs=
p;static int coroutine=5Ffn qemu=5Frbd=5Fco=5Fcreate=5Fopts(BlockDriver *dr=
v,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; const char *filename,<br>&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; QemuOpts *opts,<br>@@ -403,6 +683,7 @@ static int coroutine=5Ffn qemu=
=5Frbd=5Fco=5Fcreate=5Fopts(BlockDriver *drv,<br>&nbsp;&nbsp; &nbsp; Blockd=
evCreateOptions *create=5Foptions;<br>&nbsp;&nbsp; &nbsp; BlockdevCreateOpt=
ionsRbd *rbd=5Fopts;<br>&nbsp;&nbsp; &nbsp; BlockdevOptionsRbd *loc;<br>+ &=
nbsp; &nbsp;RbdEncryptionCreateOptions *encrypt =3D NULL;<br>&nbsp;&nbsp; &=
nbsp; Error *local=5Ferr =3D NULL;<br>&nbsp;&nbsp; &nbsp; const char *keypa=
irs, *password=5Fsecret;<br>&nbsp;&nbsp; &nbsp; QDict *options =3D NULL;<br=
>@@ -431,6 +712,13 @@ static int coroutine=5Ffn qemu=5Frbd=5Fco=5Fcreate=5F=
opts(BlockDriver *drv,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; goto exit;<br>&=
nbsp;&nbsp; &nbsp; }<br>&nbsp;<br>+ &nbsp; &nbsp;ret =3D qemu=5Frbd=5Fextra=
ct=5Fencryption=5Fcreate=5Foptions(opts, &amp;encrypt, errp);<br>+ &nbsp; &=
nbsp;if (ret &lt; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;goto exit;<br>+ &nbs=
p; &nbsp;}<br>+ &nbsp; &nbsp;rbd=5Fopts-&gt;encrypt &nbsp; &nbsp; =3D encry=
pt;<br>+ &nbsp; &nbsp;rbd=5Fopts-&gt;has=5Fencrypt =3D !!encrypt;<br>+<br>&=
nbsp;&nbsp; &nbsp; /*<br>&nbsp;&nbsp; &nbsp; &nbsp;* Caution: while qdict=
=5Fget=5Ftry=5Fstr() is fine, getting non-string<br>&nbsp;&nbsp; &nbsp; &nb=
sp;* types would require more care. &nbsp;When @options come from -blockdev=
<br>@@ -756,12 +1044,26 @@ static int qemu=5Frbd=5Fopen(BlockDriverState *b=
s, QDict *options, int flags,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; goto fai=
led=5Fopen;<br>&nbsp;&nbsp; &nbsp; }<br>&nbsp;<br>+ &nbsp; &nbsp;s-&gt;imag=
e=5Finfo.has=5Fencryption=5Fformat =3D false;<br>+ &nbsp; &nbsp;if (opts-&g=
t;has=5Fencrypt) {<br>+#ifdef LIBRBD=5FSUPPORTS=5FENCRYPTION<br>+ &nbsp; &n=
bsp; &nbsp; &nbsp;r =3D qemu=5Frbd=5Fencryption=5Fload(s-&gt;image, opts-&g=
t;encrypt, &amp;s-&gt;image=5Finfo,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; errp);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto failed=5Fpost=5Fopen;<br>+ =
&nbsp; &nbsp; &nbsp; &nbsp;}<br>+#else<br>+ &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D -ENOTSUP;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg(errp, "RBD libra=
ry does not support image encryption");<br>+ &nbsp; &nbsp; &nbsp; &nbsp;got=
o failed=5Fpost=5Fopen;<br>+#endif<br>+ &nbsp; &nbsp;}<br>+<br>&nbsp;&nbsp;=
 &nbsp; r =3D rbd=5Fget=5Fsize(s-&gt;image, &amp;s-&gt;image=5Fsize);<br>&n=
bsp;&nbsp; &nbsp; if (r &lt; 0) {<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; erro=
r=5Fsetg=5Ferrno(errp, -r, "error getting image size from %s",<br>&nbsp;&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;s-&gt;image=5Fname);<br>- &nbsp; &nbsp; &nbsp; &nbsp;rbd=5Fclos=
e(s-&gt;image);<br>- &nbsp; &nbsp; &nbsp; &nbsp;goto failed=5Fopen;<br>+ &n=
bsp; &nbsp; &nbsp; &nbsp;goto failed=5Fpost=5Fopen;<br>&nbsp;&nbsp; &nbsp; =
}<br>&nbsp;<br>&nbsp;&nbsp; &nbsp; /* If we are using an rbd snapshot, we m=
ust be r/o, otherwise<br>@@ -769,8 +1071,7 @@ static int qemu=5Frbd=5Fopen(=
BlockDriverState *bs, QDict *options, int flags,<br>&nbsp;&nbsp; &nbsp; if =
(s-&gt;snap !=3D NULL) {<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; r =3D bdrv=5F=
apply=5Fauto=5Fread=5Fonly(bs, "rbd snapshots are read-only", errp);<br>&nb=
sp;&nbsp; &nbsp; &nbsp; &nbsp; if (r &lt; 0) {<br>- &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;rbd=5Fclose(s-&gt;image);<br>- &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;goto failed=5Fopen;<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto failed=5Fpost=5Fopen;<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; }<br>=
&nbsp;&nbsp; &nbsp; }<br>&nbsp;<br>@@ -780,6 +1081,8 @@ static int qemu=5Fr=
bd=5Fopen(BlockDriverState *bs, QDict *options, int flags,<br>&nbsp;&nbsp; =
&nbsp; r =3D 0;<br>&nbsp;&nbsp; &nbsp; goto out;<br>&nbsp;<br>+failed=5Fpos=
t=5Fopen:<br>+ &nbsp; &nbsp;rbd=5Fclose(s-&gt;image);<br>&nbsp;failed=5Fope=
n:<br>&nbsp;&nbsp; &nbsp; rados=5Fioctx=5Fdestroy(s-&gt;io=5Fctx);<br>&nbsp=
;&nbsp; &nbsp; g=5Ffree(s-&gt;snap);<br>@@ -1050,6 +1353,58 @@ static int q=
emu=5Frbd=5Fgetinfo(BlockDriverState *bs, BlockDriverInfo *bdi)<br>&nbsp;&n=
bsp; &nbsp; return 0;<br>&nbsp;}<br>&nbsp;<br>+static ImageInfoSpecific *qe=
mu=5Frbd=5Fget=5Fspecific=5Finfo(BlockDriverState *bs,<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; Error **errp)<br>+{<br>+ &nbsp; &nbsp;BDRVRBDState *s =3D =
bs-&gt;opaque;<br>+ &nbsp; &nbsp;ImageInfoSpecific *spec=5Finfo;<br>+ &nbsp=
; &nbsp;char buf[RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5FLEN] =3D=
 {0};<br>+ &nbsp; &nbsp;int r;<br>+<br>+ &nbsp; &nbsp;if (s-&gt;image=5Finf=
o.has=5Fencryption=5Fformat) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;spec=5Finfo =
=3D g=5Fnew(ImageInfoSpecific, 1);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;*spec=5F=
info =3D (ImageInfoSpecific){<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;.type &nbsp;=3D IMAGE=5FINFO=5FSPECIFIC=5FKIND=5FRBD,<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;.u.rbd.data =3D g=5Fnew0(ImageInfoSpecificRbd, 1)=
,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;};<br>+ &nbsp; &nbsp; &nbsp; &nbsp;spec=
=5Finfo-&gt;u.rbd.data-&gt;has=5Fencryption=5Fformat =3D true;<br>+ &nbsp; =
&nbsp; &nbsp; &nbsp;spec=5Finfo-&gt;u.rbd.data-&gt;encryption=5Fformat =3D<=
br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s-&gt;image=5Fi=
nfo.encryption=5Fformat;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;return spec=5Finfo=
;<br>+ &nbsp; &nbsp;}<br>+<br>+ &nbsp; &nbsp;if (s-&gt;image=5Fsize &gt;=3D=
 RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5FLEN) {<br>+ &nbsp; &nbsp=
; &nbsp; &nbsp;r =3D rbd=5Fread(s-&gt;image, 0,<br>+ &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RBD=5FENCRYPTION=5FLUKS=5FH=
EADER=5FVERIFICATION=5FLEN, buf);<br>+ &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt=
; 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;error=5Fsetg=5Ferrno(e=
rrp, -r, "cannot read image start for probe");<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;return NULL;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}<br>+ &nbsp=
; &nbsp;}<br>+<br>+ &nbsp; &nbsp;spec=5Finfo =3D g=5Fnew(ImageInfoSpecific,=
 1);<br>+ &nbsp; &nbsp;*spec=5Finfo =3D (ImageInfoSpecific){<br>+ &nbsp; &n=
bsp; &nbsp; &nbsp;.type &nbsp;=3D IMAGE=5FINFO=5FSPECIFIC=5FKIND=5FRBD,<br>=
+ &nbsp; &nbsp; &nbsp; &nbsp;.u.rbd.data =3D g=5Fnew0(ImageInfoSpecificRbd,=
 1),<br>+ &nbsp; &nbsp;};<br>+<br>+ &nbsp; &nbsp;if (memcmp(buf, rbd=5Fluks=
=5Fheader=5Fverification,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; RBD=5FENCRYPTION=5FLUKS=5FHEADER=5FVERIFICATION=5FLEN) =3D=3D 0) {<br>=
+ &nbsp; &nbsp; &nbsp; &nbsp;spec=5Finfo-&gt;u.rbd.data-&gt;encryption=5Ffo=
rmat =3D<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RBD=5F=
IMAGE=5FENCRYPTION=5FFORMAT=5FLUKS;<br>+ &nbsp; &nbsp; &nbsp; &nbsp;spec=5F=
info-&gt;u.rbd.data-&gt;has=5Fencryption=5Fformat =3D true;<br>+ &nbsp; &nb=
sp;} else if (memcmp(buf, rbd=5Fluks2=5Fheader=5Fverification,<br>+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RBD=5FENCRYPTION=5FLUKS=5FHEADER=
=5FVERIFICATION=5FLEN) =3D=3D 0) {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;spec=5Fi=
nfo-&gt;u.rbd.data-&gt;encryption=5Fformat =3D<br>+ &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;RBD=5FIMAGE=5FENCRYPTION=5FFORMAT=5FLUKS2;<=
br>+ &nbsp; &nbsp; &nbsp; &nbsp;spec=5Finfo-&gt;u.rbd.data-&gt;has=5Fencryp=
tion=5Fformat =3D true;<br>+ &nbsp; &nbsp;} else {<br>+ &nbsp; &nbsp; &nbsp=
; &nbsp;spec=5Finfo-&gt;u.rbd.data-&gt;has=5Fencryption=5Fformat =3D false;=
<br>+ &nbsp; &nbsp;}<br>+<br>+ &nbsp; &nbsp;return spec=5Finfo;<br>+}<br>+<=
br>&nbsp;static int64=5Ft qemu=5Frbd=5Fgetlength(BlockDriverState *bs)<br>&=
nbsp;{<br>&nbsp;&nbsp; &nbsp; BDRVRBDState *s =3D bs-&gt;opaque;<br>@@ -124=
3,6 +1598,22 @@ static QemuOptsList qemu=5Frbd=5Fcreate=5Fopts =3D {<br>&nb=
sp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .type =3D QEMU=5FOPT=5FSTRING,=
<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .help =3D "ID of secret=
 providing the password",<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; },<br>+ &nbs=
p; &nbsp; &nbsp; &nbsp;{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.nam=
e =3D "encrypt.format",<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.type=
 =3D QEMU=5FOPT=5FSTRING,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.he=
lp =3D "Encrypt the image, format choices: 'luks', 'luks2'",<br>+ &nbsp; &n=
bsp; &nbsp; &nbsp;},<br>+ &nbsp; &nbsp; &nbsp; &nbsp;{<br>+ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;.name =3D "encrypt.cipher-alg",<br>+ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;.type =3D QEMU=5FOPT=5FSTRING,<br>+ &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;.help =3D "Name of encryption cipher algorit=
hm"<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;" (allowed values: aes-128, aes-256)",<br>+ &nbsp; &nbsp; &nbsp; &nbsp;}=
,<br>+ &nbsp; &nbsp; &nbsp; &nbsp;{<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;.name =3D "encrypt.key-secret",<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;.type =3D QEMU=5FOPT=5FSTRING,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;.help =3D "ID of secret providing LUKS passphrase",<br>+ &nbsp;=
 &nbsp; &nbsp; &nbsp;},<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; { /* end of li=
st */ }<br>&nbsp;&nbsp; &nbsp; }<br>&nbsp;};<br>@@ -1272,6 +1643,7 @@ stati=
c BlockDriver bdrv=5Frbd =3D {<br>&nbsp;&nbsp; &nbsp; .bdrv=5Fco=5Fcreate=
=5Fopts &nbsp; &nbsp;=3D qemu=5Frbd=5Fco=5Fcreate=5Fopts,<br>&nbsp;&nbsp; &=
nbsp; .bdrv=5Fhas=5Fzero=5Finit &nbsp; &nbsp; =3D bdrv=5Fhas=5Fzero=5Finit=
=5F1,<br>&nbsp;&nbsp; &nbsp; .bdrv=5Fget=5Finfo &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;=3D qemu=5Frbd=5Fgetinfo,<br>+ &nbsp; &nbsp;.bdrv=5Fget=5Fspecific=
=5Finfo =3D qemu=5Frbd=5Fget=5Fspecific=5Finfo,<br>&nbsp;&nbsp; &nbsp; .cre=
ate=5Fopts &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D &amp;qemu=5Frbd=5Fc=
reate=5Fopts,<br>&nbsp;&nbsp; &nbsp; .bdrv=5Fgetlength &nbsp; &nbsp; &nbsp;=
 &nbsp; =3D qemu=5Frbd=5Fgetlength,<br>&nbsp;&nbsp; &nbsp; .bdrv=5Fco=5Ftru=
ncate &nbsp; &nbsp; &nbsp; =3D qemu=5Frbd=5Fco=5Ftruncate,<br>diff --git a/=
qapi/block-core.json b/qapi/block-core.json<br>index 6d227924d0..6cf67d796e=
 100644<br>--- a/qapi/block-core.json<br>+++ b/qapi/block-core.json<br>@@ -=
127,6 +127,18 @@<br>&nbsp;&nbsp; &nbsp; &nbsp; 'extents': ['ImageInfo']<br>=
&nbsp;&nbsp; } }<br>&nbsp;<br>+##<br>+# @ImageInfoSpecificRbd:<br>+#<br>+# =
@encryption-format: Image encryption format<br>+#<br>+# Since: 6.1<br>+##<b=
r>+{ 'struct': 'ImageInfoSpecificRbd',<br>+ &nbsp;'data': {<br>+ &nbsp; &nb=
sp; &nbsp;'*encryption-format': 'RbdImageEncryptionFormat'<br>+ &nbsp;} }<b=
r>+<br>&nbsp;##<br>&nbsp;# @ImageInfoSpecific:<br>&nbsp;#<br>@@ -141,7 +153=
,8 @@<br>&nbsp;&nbsp; &nbsp; &nbsp; # If we need to add block driver specif=
ic parameters for<br>&nbsp;&nbsp; &nbsp; &nbsp; # LUKS in future, then we'l=
l subclass QCryptoBlockInfoLUKS<br>&nbsp;&nbsp; &nbsp; &nbsp; # to define a=
 ImageInfoSpecificLUKS<br>- &nbsp; &nbsp; &nbsp;'luks': 'QCryptoBlockInfoLU=
KS'<br>+ &nbsp; &nbsp; &nbsp;'luks': 'QCryptoBlockInfoLUKS',<br>+ &nbsp; &n=
bsp; &nbsp;'rbd': 'ImageInfoSpecificRbd'<br>&nbsp;&nbsp; } }<br>&nbsp;<br>&=
nbsp;##<br>@@ -3609,6 +3622,94 @@<br>&nbsp;{ 'enum': 'RbdAuthMode',<br>&nbs=
p;&nbsp; 'data': [ 'cephx', 'none' ] }<br>&nbsp;<br>+##<br>+# @RbdImageEncr=
yptionFormat:<br>+#<br>+# Since: 6.1<br>+##<br>+{ 'enum': 'RbdImageEncrypti=
onFormat',<br>+ &nbsp;'data': [ 'luks', 'luks2' ] }<br>+<br>+##<br>+# @RbdE=
ncryptionOptionsLUKSBase:<br>+#<br>+# @key-secret: ID of a QCryptoSecret ob=
ject providing a passphrase<br>+# &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;for unlocking the encryption<br>+#<br>+# Since: 6.1<br>+##<br>+{ 'st=
ruct': 'RbdEncryptionOptionsLUKSBase',<br>+ &nbsp;'data': { 'key-secret': '=
str' } }<br>+<br>+##<br>+# @RbdEncryptionCreateOptionsLUKSBase:<br>+#<br>+#=
 @cipher-alg: The encryption algorithm<br>+#<br>+# Since: 6.1<br>+##<br>+{ =
'struct': 'RbdEncryptionCreateOptionsLUKSBase',<br>+ &nbsp;'base': 'RbdEncr=
yptionOptionsLUKSBase',<br>+ &nbsp;'data': { '*cipher-alg': 'QCryptoCipherA=
lgorithm' } }<br>+<br>+##<br>+# @RbdEncryptionOptionsLUKS:<br>+#<br>+# Sinc=
e: 6.1<br>+##<br>+{ 'struct': 'RbdEncryptionOptionsLUKS',<br>+ &nbsp;'base'=
: 'RbdEncryptionOptionsLUKSBase',<br>+ &nbsp;'data': { } }<br>+<br>+##<br>+=
# @RbdEncryptionOptionsLUKS2:<br>+#<br>+# Since: 6.1<br>+##<br>+{ 'struct':=
 'RbdEncryptionOptionsLUKS2',<br>+ &nbsp;'base': 'RbdEncryptionOptionsLUKSB=
ase',<br>+ &nbsp;'data': { } }<br>+<br>+##<br>+# @RbdEncryptionCreateOption=
sLUKS:<br>+#<br>+# Since: 6.1<br>+##<br>+{ 'struct': 'RbdEncryptionCreateOp=
tionsLUKS',<br>+ &nbsp;'base': 'RbdEncryptionCreateOptionsLUKSBase',<br>+ &=
nbsp;'data': { } }<br>+<br>+##<br>+# @RbdEncryptionCreateOptionsLUKS2:<br>+=
#<br>+# Since: 6.1<br>+##<br>+{ 'struct': 'RbdEncryptionCreateOptionsLUKS2'=
,<br>+ &nbsp;'base': 'RbdEncryptionCreateOptionsLUKSBase',<br>+ &nbsp;'data=
': { } }<br>+<br>+##<br>+# @RbdEncryptionOptions:<br>+#<br>+# Since: 6.1<br=
>+##<br>+{ 'union': 'RbdEncryptionOptions',<br>+ &nbsp;'base': { 'format': =
'RbdImageEncryptionFormat' },<br>+ &nbsp;'discriminator': 'format',<br>+ &n=
bsp;'data': { 'luks': 'RbdEncryptionOptionsLUKS',<br>+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;'luks2': 'RbdEncryptionOptionsLUKS2' } }<br>+<br>+##<b=
r>+# @RbdEncryptionCreateOptions:<br>+#<br>+# Since: 6.1<br>+##<br>+{ 'unio=
n': 'RbdEncryptionCreateOptions',<br>+ &nbsp;'base': { 'format': 'RbdImageE=
ncryptionFormat' },<br>+ &nbsp;'discriminator': 'format',<br>+ &nbsp;'data'=
: { 'luks': 'RbdEncryptionCreateOptionsLUKS',<br>+ &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;'luks2': 'RbdEncryptionCreateOptionsLUKS2' } }<br>+<br>&nb=
sp;##<br>&nbsp;# @BlockdevOptionsRbd:<br>&nbsp;#<br>@@ -3624,6 +3725,8 @@<b=
r>&nbsp;#<br>&nbsp;# @snapshot: Ceph snapshot name.<br>&nbsp;#<br>+# @encry=
pt: Image encryption options. (Since 6.1)<br>+#<br>&nbsp;# @user: Ceph id n=
ame.<br>&nbsp;#<br>&nbsp;# @auth-client-required: Acceptable authentication=
 modes.<br>@@ -3646,6 +3749,7 @@<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; 'image': 'str',<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 '*conf': 'str',<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '*snaps=
hot': 'str',<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'*encrypt': 'Rbd=
EncryptionOptions',<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '*us=
er': 'str',<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; '*auth-clien=
t-required': ['RbdAuthMode'],<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; '*key-secret': 'str',<br>@@ -4418,13 +4522,15 @@<br>&nbsp;# &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;point to a snapshot.<br>&nbsp;# @size: Size=
 of the virtual disk in bytes<br>&nbsp;# @cluster-size: RBD object size<br>=
+# @encrypt: Image encryption options. (Since 6.1)<br>&nbsp;#<br>&nbsp;# Si=
nce: 2.12<br>&nbsp;##<br>&nbsp;{ 'struct': 'BlockdevCreateOptionsRbd',<br>&=
nbsp;&nbsp; 'data': { 'location': &nbsp; &nbsp; &nbsp; &nbsp; 'BlockdevOpti=
onsRbd',<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'size': &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'size',<br>- &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;'*cluster-size' : &nbsp; 'size' } }<br>+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;'*cluster-size' : &nbsp; 'size',<br>+ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;'*encrypt' : &nbsp; &nbsp; &nbsp; &nbsp;'RbdEncryp=
tionCreateOptions' } }<br>&nbsp;<br>&nbsp;##<br>&nbsp;# @BlockdevVmdkSubfor=
mat:<br>-- <br>2.27.0<br><br></font></div></div></div></div></font><BR>
<BR>

