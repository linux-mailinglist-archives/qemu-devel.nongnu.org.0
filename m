Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B822C3BE4BB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:52:46 +0200 (CEST)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m13IT-0008SS-BP
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1m13Gy-0007eM-HT; Wed, 07 Jul 2021 04:51:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37236
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1m13Gw-0007AY-Ke; Wed, 07 Jul 2021 04:51:12 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1678YZ2G096306; Wed, 7 Jul 2021 04:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=BXPAQFNmkwIXp1DbhO+0zfogSl/eGIe1g8o7OvbzttM=;
 b=gX99N4dlD/iS8D0tYR684Sac6/mvznd5gHYxjvvSO3PvoAcE1gopoEs+nNG0XG5zhOXC
 WWPoDzwuBK8Ti+zN60/8r4lG0+gsoDh/smtu5fojXubM4sb6jIXwjRbHiEPZWFD1UnoI
 rCerVahr68bP+ZDeehF6sAsFKxJGsLKP0B5gqfttc+YcB5nODLmONTuDV+c8zTdScOMo
 unK4Jp2rR3UmsvPucFprtKHHl6kTebXlWnLots4/VKk5gHgBr6rKIUriu72JEsBcEHu9
 kerl2xyXXvns985c9MWJbETYAU4pbpXz+e/BYkomSBzxxc27YsWd3nXrpxo3r2P/fhFv CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39mahqw9uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 04:51:06 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1678oV3g189758;
 Wed, 7 Jul 2021 04:51:05 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39mahqw9sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 04:51:04 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1678c1Qh023631;
 Wed, 7 Jul 2021 08:51:02 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 39ju3bcpw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 08:51:02 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1678p0TI24772944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Jul 2021 08:51:01 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C8226A07F;
 Wed,  7 Jul 2021 08:51:00 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9102A6A07B;
 Wed,  7 Jul 2021 08:51:00 +0000 (GMT)
Received: from mww0312.dal12m.mail.ibm.com (unknown [9.208.69.17])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Jul 2021 08:51:00 +0000 (GMT)
In-Reply-To: <YOVdE/7VLcyE0/P/@redhat.com>
From: "Or Ozeri" <ORO@il.ibm.com>
To: "Kevin Wolf" <kwolf@redhat.com>
Date: Wed, 7 Jul 2021 08:50:58 +0000
Message-ID: <OFCAC1F821.335F9C72-ON0025870B.00309CB1-0025870B.00309CB5@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <YOVdE/7VLcyE0/P/@redhat.com>,
 <20210707053543.2521677-1-oro@il.ibm.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0312/03/M/IBM at 07/07/2021 08:50:58,
 Serialize complete at 07/07/2021 08:50:58
X-KeepSent: CAC1F821:335F9C72-0025870B:00309CB1; name=$KeepSent; type=4
X-Disclaimed: 47847
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RbmxNYQEMXGWW3ZGRNJ5C-lxeeBS3srl
X-Proofpoint-ORIG-GUID: FJXVNBKwsZA93X9VjzKlb_Ye-7ZdBhDo
Subject: RE: [PATCH v1] block/raw-format: implement .bdrv_get_specific_info
 handler
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_05:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=971 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107070050
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
Cc: berrange@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 to.my.trociny@gmail.com, idryomov@gmail.com, Danny
 Harnik <DANNYH@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Would you suggest to do this child traversal on&nbsp;bdrv=5Fquery=5F=
image=5Finfo, and have it returned as part of the ImageInfo struct?<div>In =
that case, I would add *driver-specific to ImageInfo, in addition to the ex=
isting *format-specific?</div><div><br></div><div>Or should I just do the t=
raversal in&nbsp;img=5Finfo (qemu-img.c), avoiding the change to the ImageI=
nfo struct?<br><br><div><font color=3D"#990099">-----"Kevin Wolf" &lt;<a hr=
ef=3D"mailto:kwolf@redhat.com" target=3D"=5Fblank" rel=3D"noopener noreferr=
er">kwolf@redhat.com</a>&gt; wrote: -----</font></div><div class=3D"iNotesH=
istory" style=3D"padding-left:5px;"><div style=3D"padding-right:0px;padding=
-left:5px;border-left:solid black 2px;">To: "Or Ozeri" &lt;<a href=3D"mailt=
o:oro@il.ibm.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">oro@il.ib=
m.com</a>&gt;<br>From: "Kevin Wolf" &lt;<a href=3D"mailto:kwolf@redhat.com"=
 target=3D"=5Fblank" rel=3D"noopener noreferrer">kwolf@redhat.com</a>&gt;<b=
r>Date: 07/07/2021 10:52AM<br>Cc: <a href=3D"mailto:qemu-devel@nongnu.org" =
target=3D"=5Fblank" rel=3D"noopener noreferrer">qemu-devel@nongnu.org</a>, =
<a href=3D"mailto:qemu-block@nongnu.org" target=3D"=5Fblank" rel=3D"noopene=
r noreferrer">qemu-block@nongnu.org</a>, <a href=3D"mailto:to.my.trociny@gm=
ail.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">to.my.trociny@gmai=
l.com</a>, <a href=3D"mailto:dannyh@il.ibm.com" target=3D"=5Fblank" rel=3D"=
noopener noreferrer">dannyh@il.ibm.com</a>, <a href=3D"mailto:berrange@redh=
at.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">berrange@redhat.com=
</a>, <a href=3D"mailto:idryomov@gmail.com" target=3D"=5Fblank" rel=3D"noop=
ener noreferrer">idryomov@gmail.com</a><br>Subject: [EXTERNAL] Re: [PATCH v=
1] block/raw-format: implement .bdrv=5Fget=5Fspecific=5Finfo handler<br><br=
><div><font face=3D"Courier New,Courier,monospace" size=3D"2">Am 07.07.2021=
 um 07:35 hat Or Ozeri geschrieben:<br>&gt; When using the raw format, allo=
w exposing specific info by the underlying storage.<br>&gt; In particular, =
this will enable RBD images using the raw format to indicate<br>&gt; a LUKS=
2 encrypted image in the output of qemu-img info.<br>&gt; <br>&gt; Signed-o=
ff-by: Or Ozeri &lt;<a href=3D"mailto:oro@il.ibm.com" target=3D"=5Fblank" r=
el=3D"noopener noreferrer">oro@il.ibm.com</a>&gt;<br><br>This doesn't feel =
right because it would introduce an inconsistency<br>(drivers are supposed =
to return information about their layer, and all<br>drivers except raw woul=
d still do so) and therefore wouldn't even solve<br>the full problem: For n=
on-raw images, the information isn't any less<br>useful, but it still would=
n't be available.<br><br>I believe the information is already available in =
QMP, using<br>query-named-block-nodes, because then you get a separate Bloc=
kDeviceInfo<br>(which contains ImageInfoSpecific) for each node, including =
the protocol<br>node.<br><br>So maybe what we need to do is change qemu-img=
 to iterate the node chain<br>(possibly using bdrv=5Fprimary=5Fbs()) and pr=
int the ImageInfoSpecific for<br>each layer if it's present, while indicati=
ng which part is for which<br>layer.<br><br>So the output could look like t=
his:<br><br>...<br>Driver specific information (qcow2):<br>&nbsp;&nbsp; &nb=
sp;compat: 0.10<br>&nbsp;&nbsp; &nbsp;compression type: zlib<br>&nbsp;&nbsp=
; &nbsp;refcount bits: 16<br>Driver specific information (rbd):<br>&nbsp;&n=
bsp; &nbsp;encryption format: luks<br><br>Kevin<br><br></font></div></div><=
/div></div></font><BR>
<BR>

