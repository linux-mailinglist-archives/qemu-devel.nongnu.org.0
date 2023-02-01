Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10295685DB4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3Sc-0006Bg-Pa; Tue, 31 Jan 2023 22:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pN3Sb-0006BW-CE
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:06:57 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1pN3SZ-0003kc-9t
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:06:57 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3110PVbq010028
 for <qemu-devel@nongnu.org>; Wed, 1 Feb 2023 03:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=PuGGxJK1sDTw97DXx2ibDT8s4uMyNNvRiklT1HWp7oQ=;
 b=YFn5YEhFjfHyo5OO+WFa6S9mkzPk/q0aFteY3LlLX49EfK56TZ7Pq8tED+lvFCpCq9ZL
 IYXuezD1vV234hFoY8u30jXdfzio8B7z5KqMq53lGWK8WdNi68LQ9GSgExZYvVC5tsnu
 jA+XPdh/nnWgTIFQOmqCZwlWCmOk3pGdT2lnErLjeDWyOfM+sIIjn+UQZWjiL8s427q5
 w7XvhSUTkfLF64zyCmA0RQlFM7KbUI+XiGFfrVwGd8HVf4UC5DjMZTyu0ho/H1eYsSs4
 Q4aUYpS7yOKJ8R4Z7g6/tTuZHbZcaxZHXCEDK/dfqS+nUyT7uJRqbwFdKt+e4kXT27vX 5w== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfbyq0gyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 03:06:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnR61K7BeZ9LdQCY6nZbnTikPLSTZ487D2e4Byd/qGCjbu84lrNgHewijOEnoHOfADI1xaIHYOwyrvNpbJYJInBmsvj6PquI9xSxMiGzthFzz6cEHoBaz1V1LSmrH7747ceKOvtuT2q/9WvDKyvWo3pwkz+Tb5aj6npMjXTW4C+QkVh+unrUEGGMPYDpBA+kOGPqGNUnFtDXyNjIK37+FJBnHN4OVGl6SJivhLoWKaQuJDofuUvVisq7I0gf0vMIPdtBZkpCSXgTht7KNwhLpRjposH2iZtmsm17PMGePM7Y/2PXaLPrGTgaOpYXNvpzEB+/QR94Koa3Y4/eWgUYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuGGxJK1sDTw97DXx2ibDT8s4uMyNNvRiklT1HWp7oQ=;
 b=XDzXYLg7IS9EEhgWXHV5VGBxcvPvjeohOVd126nVqYoPUyuiUsDuvsD+q72/FS7ssClMpbxyiSk8L1J39RGf0kI7crk4iXUdj3xxpyV6a4kjBZH2U+NjQmhd2C8FQKHIpvlmmwylv5e9pQL7+SpWWmGC6XLg4NO3ptsXNDf9S4BpOGVREDBu645tFNSGFKPf4SdzvNfWb1w5TGJL7aksEObQbogaVALDJRc1AaUZa+ABLaQommoPRCUirxay+0jUnHhjbkn8Puy6ypsixANe0RI/LH6zwQBnJumnkwLQDYK3MpKqytm+50J+w/HfifkKLD0OQ9iLFHr+UiTZ1uoCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by BN0PR02MB8144.namprd02.prod.outlook.com (2603:10b6:408:14a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.23; Wed, 1 Feb
 2023 03:06:49 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::b52a:e0c7:e62c:c0a3%4]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 03:06:49 +0000
From: Sid Manning <sidneym@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Mark Burton <mburton@qti.qualcomm.com>, Brian Cain <bcain@quicinc.com>,
 Matheus Bernardino <mathbern@qti.qualcomm.com>
Subject: accel/tcg/translator.c question about translator_access
Thread-Topic: accel/tcg/translator.c question about translator_access
Thread-Index: Adk12mr35efZdwCASCS67YKvoZGk0g==
Date: Wed, 1 Feb 2023 03:06:48 +0000
Message-ID: <BYAPR02MB55094EC2D6BD8354B3313894BED19@BYAPR02MB5509.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR02MB5509:EE_|BN0PR02MB8144:EE_
x-ms-office365-filtering-correlation-id: 0fa6e5e6-436d-4a40-c147-08db04015c2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9JHdB2hNMwvzov1KdrVLnMCy9+mQ7BFUfO97fE8r/dxVDrbfLnCs11/fnC9QU3whR8BPn+pg9Q/inbFQdBmSziNvLVirMkeMyy6Q1X1aHTR7yMvL80p2rDK47Hv6RX4Vy8+VkWnbVOPcG1BJGoDHnccpzfPUxmrOBUfoZqeDzASO73uJvB/kOt+s34tcDeQsbMaEIW/FML01sx7UFqDJQiKVNTxgVdFXcWDc7r9oGmuE38t9rMblePaDLJDtaO0J4Zb3ITxDeKbwaqMVRxGLjWb0J48vVlfCqlstwpk4979V4rHPsgJT4SzZcmu8AyhaN9VD2BZBm5g8zP55lHVaz1mOLtREFiejRt+tHNbhvpknAqTQGw/jUoOOmXtpLNPN3TV+zeRPRlQQpb0nrctqOSlkK3yqJigFz0HUhZ+bBTVC+Pzxdo0Aq3ZW5b6RJUh41HTFp8yaFjr+wF8ZJfqFTR5t+ADQTaL6fdHk5QAV7Y21V/YMan0qGldRsRQ/JpyWwRDuc3pWeVqiUP5EqmG2dY1R2qWZQjzMBquH4kdIjPwrJyKWQA+cc5FFJbpF83ZnPPAq5HKXTXoWpM/40u7HvFih95rhHBqKc6mYY8p4aXlxOLM9Gh6xqdy+ZtImlLop+SMre26Hjr/afe6ElvUBUQniK/pKYwsIrsYJ7bTtJLE1W7bt/tl4RVJGadxXpnXePqu53gc4B39rt0Gof4sICg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199018)(478600001)(52536014)(55016003)(33656002)(54906003)(5660300002)(38070700005)(6506007)(2906002)(9686003)(26005)(186003)(4744005)(86362001)(122000001)(316002)(38100700002)(7696005)(76116006)(66946007)(4326008)(66476007)(6916009)(66556008)(64756008)(66446008)(107886003)(83380400001)(71200400001)(8676002)(8936002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3NiGMhRMG4uKVyX0FzjJTPfH0h0yKx1+bGi3Prb6C9efH4uxBrvoMI/JG223?=
 =?us-ascii?Q?zFeT98vtTh22uQe8QOJJIF08h2yjCU26S/UXL4VW/jXiRCM9JvMVAsKvjAk+?=
 =?us-ascii?Q?GkFuKOoQzlzn1YDLrqBA2KEul+jIaglW2Dc89+yShXw9St7CdWqpXCz1DIP1?=
 =?us-ascii?Q?fXAF4/g1D2yHNNbJab7i2zvOsHtLk9AYvZIUoihKAjTIQQ80U+fkbG6uIjQb?=
 =?us-ascii?Q?IE/5VrAYmXeFZ/vzh/121DKyZwJJc/GWFP9SbOdMvk1hqSB/okImPc/B+azS?=
 =?us-ascii?Q?34GRuPaHxnOpjRJB9On4KthaNu1jp8WzwQceC3/Fjp5fQ6rTJa2oFvSj0xmf?=
 =?us-ascii?Q?A2J0lsW8DsuAl9wkSB76dY7PAa8hMV9vqFxPTSV5/hmmcWqJdAYieTD7TdSL?=
 =?us-ascii?Q?VBK/y4LBUZk4301EJh2QEN0h/7eQsJ3zRUaA2OOoHrBecxCYJ+2xbw2meeYo?=
 =?us-ascii?Q?Gmnfaft8M8QCf7ZuM244TdhHop1nKPPmf2QJkfc4LGOa2pDzGGbfW4VJ3FeY?=
 =?us-ascii?Q?9n5BDREFc74vCGQWtgmy4B13uQfSZc+GLkB9xWQIdk2G0DPJ/EXCGrNTkCVE?=
 =?us-ascii?Q?acTtfXzH3VpEk1R3Iv2Vk9HaAidZ+dS/BAKj5uxr/187Na9ay2OdjRAfnbrb?=
 =?us-ascii?Q?CVHL2OOEpCIVMzY5slwuX3XQZkZwRwcZRH8CHVKZPDNjFV1Lll+h1LH9DjtP?=
 =?us-ascii?Q?4PlyWhy8JDQ966oUZrNP5zYiTzJvyHGUv+udO0Xi8LcWmJu6NVvYr4zGqnRL?=
 =?us-ascii?Q?1VgEt49TCJCPNPHt2ZyS0+Y1ZfXEEAlx+oKnpVPu0asQf5t0vA67DignVKGV?=
 =?us-ascii?Q?+eZAQJK2OMhtZ87XDa5OcD0toPvBpdkmJ0Nv393PH9G3vY5MxEH/ZzRpU40Y?=
 =?us-ascii?Q?lWrkzweaoQ9mtb9c6SflHlGHOS4cPBfAooHHZqJMuiNikHslcJuX7OVma6PV?=
 =?us-ascii?Q?/j4/WAy/QHsf82mPx7QFDpvUz5DTJwHUF5wzyHCM/ln5jHCmo3FWvAe9MeVA?=
 =?us-ascii?Q?ClHgaFVl7hSvX+er0exGJKE3P5I9N5acYJvYV8vw9/ANSFfWA7kkci6z5fzA?=
 =?us-ascii?Q?S3AMsNwNnc+oywjpngwHdhZkIM1OMt/frfP7Tht81F60Os9Y2CClYBtM3o1+?=
 =?us-ascii?Q?A6i6fpp7C4hdS8sGitJRWk0Oqyrh7v20yv/zKtkevVNy5R777QVIDIuFVxhn?=
 =?us-ascii?Q?AIhaw1EYp/98TKzDSeoJVDT8kRlrMiRaEyNJvEWr97FGFOl00mSoALN9RjN1?=
 =?us-ascii?Q?tl3KIft8NjzzvhgHu/vrDOQPwD7n50l5NUALvY2NoxeHIskGsI76jPVAwZ5i?=
 =?us-ascii?Q?VlMINsPzgZpQJpfkgcG548O1wZPbSy1RX/Z4zs2yR2ipTG2lAB847e4UpJAk?=
 =?us-ascii?Q?nV3VpOpr/zUCG9sgvEcvM2x4qzB45+urkcaJBJN0zm2k990deILiHfNr2I6e?=
 =?us-ascii?Q?LgcKSQCPW2v6xppr1wS6/I/cU69yuoLf4NC4/wMr0F8MHAeOKn/dTTwTQ2Ex?=
 =?us-ascii?Q?L9+0a8gK1CLA5tM4p9jGvn9rHe0oJoQl02kQAYFgBwLnUSNxH8tjhuFpGjA8?=
 =?us-ascii?Q?XqSt35Arb0+GDlM2p0AioEuHG+loLBQNmriM+QLB?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR02MB55094EC2D6BD8354B3313894BED19BYAPR02MB5509namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CRppD2vVuylH/g/6sadia5srGLj0vLrwMO6OsxLiNUcVSSi09ccuCNLwmcjzCKBC/MdJ+XLoueuHDV1XOpNYoLeP4OgMQ6WPgoCbwhdOLSBbc2vl2HqCZtWgFZAqr7TkTPFzmOufZ2HQ/LUlMQm8trDqMry0zpZZ0UTLEfJgn9mCbEOvyp0OHStisMzygsL/d5Q3hrGPjQ/+Xwe+cN6EKhOAePhXsSV1ztnVyH4ALXnw3byhPvQXJ5j7g1AuLWC40zZGgoMb+lB2IBkjYhmR95IE7Y2YU8tD9l61JZnGcu+EekmUQBN93HB4/ucDV7xMcMK4+jDshZABstGPlw08xTWmOm1aECKgK+LSOgImoFUt8uU/DijgwmrR3XwtyY8bmCa2jbBX0/lNwRtb1d1EW2/lSEiDJzfkSSmikpkjuSlQCbNB+XFBf8Pzeu9GtBxHWxctGJOpJQHUWpCcQeQnMAUUST69oJBfJkWfo3mbUNufwYc3LE34bTIfb+J05avqxYbF3O4nsN9eUTeraehCxbBl88ACqnbJb3M/JM3OsyFAXkA+4r/sSHpQyRIibRpjl8XH5fk+lRxWT7Ji30uRFWSV0kshuUEBpCmwN17FHKA1xqZyYPpMjXa92G7f0TC6BTmzq9F6jqvVAtrWOHFQB30Z6OH+laHJdQ8i7H86MfUGQZ4I2Q1oLyNGvgBwMMF7ZjQgeLm9RuToyOg+d9riqlL6g89Ulb3idJLDMlBVDFp1/LmywiN2gSApeWz2321GmOccUckMm7Q5UnkjJIVkWw==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa6e5e6-436d-4a40-c147-08db04015c2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 03:06:49.0438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdf+rdxp/Wn7tht75uhPkzSbqOxCG9MqqnCQlJy7XnuySRJecC868Vbd6j+vFoPdbFIVkeRu4pg2gkiicFlxgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8144
X-Proofpoint-ORIG-GUID: aLZNiIkLYP-IGu_bYxPpPBhamKccvuPe
X-Proofpoint-GUID: aLZNiIkLYP-IGu_bYxPpPBhamKccvuPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxlogscore=509 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302010024
Received-SPF: pass client-ip=205.220.180.131; envelope-from=sidneym@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_BYAPR02MB55094EC2D6BD8354B3313894BED19BYAPR02MB5509namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There is an assert in translator_access that I hit while running on a versi=
on of QEMU integrated into a Virtual Platform.

Since this function can return null anyway I tried the following experiment=
:

--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -172,7 +172,9 @@ static void *translator_access(CPUArchState *env, Disas=
ContextBase *db,
             tb_page_addr_t phys_page =3D
                 get_page_addr_code_hostp(env, base, &db->host_addr[1]);
             /* We cannot handle MMIO as second page. */
-            assert(phys_page !=3D -1);
+            if(phys_page =3D=3D -1) {
+                return NULL;
+            }
             tb_set_page_addr1(tb, phys_page);
#ifdef CONFIG_USER_ONLY
             page_protect(end);

which avoided the issue and the test ran to completion.  What is this asser=
t trying to catch?

--_000_BYAPR02MB55094EC2D6BD8354B3313894BED19BYAPR02MB5509namp_
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
<p class=3D"MsoNormal">There is an assert in translator_access that I hit w=
hile running on a version of QEMU integrated into a Virtual Platform.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since this function can return null anyway I tried t=
he following experiment:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--- a/accel/tcg/translator.c<o:p></o:p></p>
<p class=3D"MsoNormal">+++ b/accel/tcg/translator.c<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -172,7 +172,9 @@ static void *translator_access(C=
PUArchState *env, DisasContextBase *db,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;tb_page_addr_t phys_page =3D<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_page_addr_code_hostp(env, =
base, &amp;db-&gt;host_addr[1]);<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; /* We cannot handle MMIO as second page. */<o:p></o:p>=
</p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; assert(phys_page !=3D -1);<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if(phys_page =3D=3D -1) {<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; tb_set_page_addr1(tb, phys_page);<o:p></o:p></p>
<p class=3D"MsoNormal">#ifdef CONFIG_USER_ONLY<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; page_protect(end);<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">which avoided the issue and the test ran to completi=
on.&nbsp; What is this assert trying to catch?<o:p></o:p></p>
</div>
</body>
</html>

--_000_BYAPR02MB55094EC2D6BD8354B3313894BED19BYAPR02MB5509namp_--

