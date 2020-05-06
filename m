Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA37B1C6DF5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 12:06:12 +0200 (CEST)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWGwN-0004Pi-SH
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 06:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eyal.moscovici@oracle.com>)
 id 1jWGlk-0005q4-U3; Wed, 06 May 2020 05:55:12 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:55776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eyal.moscovici@oracle.com>)
 id 1jWGli-0005rm-6a; Wed, 06 May 2020 05:55:12 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0469rpYW006882;
 Wed, 6 May 2020 09:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : subject : from
 : to : cc : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=HHCISilUIWEMJOR3hboHEcpNQ6UrfIAkcvRJIaaOa8w=;
 b=cw8ov/CeSaZSBdZOD6iue85ACE2W3CfOyLlhggWBCKftbVApXtL5a+DhHIJ4Wvr2kxJT
 9YlnTNs1s6uZFN5dTovf4a7PukREer54m+YaeqetXQdlVW2YZg9wbQeU42xosenL4JJy
 DCWwd4u6MjHqSYznNg6OwDE18iD6XhbXysiTJ3JdGQmqZxODnDtw1m9vRigxbGNwfc+9
 pOgq0Jy9SEMPfWQfP95IKcwkGKiHXdvSiij5+kDcBrhgOs8oomECZcKRI2kCxeqG3Q1M
 UQluoPeyzle2das5KJlkmpnrSwrSj9NZVhBLjQkLXLTXcvHBUU/hYbAVWumWmdA1HgRT bQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 30s1gn98pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 09:55:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0469qawH072281;
 Wed, 6 May 2020 09:55:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 30us7m7ceg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 09:55:07 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0469t6RY000694;
 Wed, 6 May 2020 09:55:06 GMT
Received: from [10.74.121.227] (/10.74.121.227)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 May 2020 02:55:06 -0700
User-Agent: Microsoft-MacOutlook/10.1e.0.191013
Date: Wed, 06 May 2020 12:55:04 +0300
Subject: Re: [PATCH 1/2] qemu-img: refactor dump_map_entry JSON format output
From: Eyal Moscovici <eyal.moscovici@oracle.com>
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
Message-ID: <794C0193-218B-4914-95A8-FA2CEF8E4908@oracle.com>
Thread-Topic: [PATCH 1/2] qemu-img: refactor dump_map_entry JSON format output
References: <20200322091117.79443-1-eyal.moscovici@oracle.com>
 <20200322091117.79443-2-eyal.moscovici@oracle.com>
 <487b9270-4e39-9a0d-ca7e-c261ee2f02c2@redhat.com>
In-Reply-To: <487b9270-4e39-9a0d-ca7e-c261ee2f02c2@redhat.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9612
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9612
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060077
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=eyal.moscovici@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 05:55:08
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_QP_LONG_LINE=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, liran.alon@oracle.com, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=EF=BB=BFOn 29/04/2020, 17:58, "Eric Blake" <eblake@redhat.com> wrote:

    On 3/22/20 4:11 AM, Eyal Moscovici wrote:
    > Previously dump_map_entry identified whether we need to start a new J=
SON
    > array based on whether start address =3D=3D 0. In this refactor we remove
    > this assumption as in following patches we will allow map to start fr=
om
    > an arbitrary position.
    >=20
    > Acked-by: Mark Kanda <mark.kanda@oracle.com>
    > Signed-off-by: Eyal Moscovici <eyal.moscovici@oracle.com>
    > ---
    >   qemu-img.c | 12 ++++++++----
    >   1 file changed, 8 insertions(+), 4 deletions(-)
    >=20
   =20
    > @@ -2871,8 +2870,8 @@ static int dump_map_entry(OutputFormat output_f=
ormat, MapEntry *e,
    >           }
    >           putchar('}');
    >  =20
    > -        if (!next) {
    > -            printf("]\n");
    > +        if (next) {
    > +            printf(",\n");
   =20
    As long as you're touching this, puts(",") is slightly more efficient=20
    than printf().  But what you have is not wrong.

Thanks, will fix.
   =20
    Reviewed-by: Eric Blake <eblake@redhat.com>
   =20
    --=20
    Eric Blake, Principal Software Engineer
    Red Hat, Inc.           +1-919-301-3226
    Virtualization:  qemu.org | libvirt.org
   =20
   =20



