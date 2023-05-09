Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9446FCB9F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:48:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQUY-0005wu-PG; Tue, 09 May 2023 12:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwQUX-0005wm-Hq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:47:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwQUO-0002OU-BU
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:47:09 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349GhDi5009203
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 16:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=FOjjn8K3smNb1aSsjui6gFh9onJZExOX/cyNP0fihFE=;
 b=ECaeSYWfbTkhokoeE8XQ0z/lxxpRfNfIKv4n4e4rt36bs6vGhhACsC59z/uQlQasiGe+
 E0p6i7H0atOVwBC0Hw6H+PvGQ6ZietAeG2UssylsgIxolpC6nQ3HyfSaFOLGdoPlGAro
 SJKnf/3iYrw/OaKZWNtN3v6qxWhQRmOwZUkrTUJ/43FYEvQ/8Noq1A13xQ0c4Om/e9wT
 zNUgU70S78J6oLWtKMYiCz7cvJR1Z7cppcMnkyHTK0THU7L5VGQWmu9hQOzHg4e0F7l2
 YQrn8neMH8MLNUCJRjyqcx0dj3VAJOtxvTNkF4cnAQ+vxoA8hn9p7D5BfS1IimKZRJMo yQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf785abuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 16:46:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtL3VMDUJ2u5WZODCfWnpyqUCz8erfAzvKyiGp9VdH406bgqYQmmsuDilxkTUDRRZbOMPiQexgbuyJKGXSRZe1MRC7gOb4xh1O0DoAo6L6bThjtRrflBvuxfnQEWU6ECXhUpvDOgpgKgTa93Q57/4Lei2Xhqp7QNnDJ8cig+RryiiM5+2flmp6MV5HuaPTM7MNWKhQnnwAdEa6cxM/JHFXX7yoZ+ccOPzNIw0cpB9ue6T46UKxkhLW57FaybT2ETVFYIuNJFEBixJOr3YCrwdp9yVPSYb0Ocid/6/eqIQ+4FQz99sPqvfXSDhRURd8yQbujcEzyYA+lgutbzclC+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOjjn8K3smNb1aSsjui6gFh9onJZExOX/cyNP0fihFE=;
 b=R1j1lJm66wRMHVF3yQybm/ACh9QlmGy/ssKyt0N0sb5s39hn4SsI4RTOuhA7iLIECJS3834MuTuDIzyladGqOcSQpc95xffH++X4vuulkHDeGyI5AUlH9xO9s54iRVxosuFaX5wQXAmWApN0qDiNYb2Abp0vchiR6Fo2DesP6duw0e8JG3T8YkjxNWGwlYH+pCn06jWmq5mLoPz8K98yl3HgEXH1Dy8UVlNjVGE0U8dHLidDx/bf2rsS9yWHBbPqcOOrw3vEDPdPPJHzoXJ411poFzlh/Nci1WZBt+7PRwdtvpaJ+jyrFC6LteWLRCz7sFDJ6owC3HgqhoZuWzeAVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CO1PR02MB8601.namprd02.prod.outlook.com
 (2603:10b6:303:15c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 16:46:22 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 16:46:22 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] Hexagon (decode): look for pkts with multiple insns at
 the same slot
Thread-Topic: [PATCH v2] Hexagon (decode): look for pkts with multiple insns
 at the same slot
Thread-Index: AQHZgbI8afcDoIooKEu2h58joNgTZq9SJ3/w
Date: Tue, 9 May 2023 16:46:22 +0000
Message-ID: <SN4PR0201MB8808A31E8428BD84D15F4071DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <f8b829443523568823d062adf8bf6659bc6d4a3f.1683552984.git.quic_mathbern@quicinc.com>
In-Reply-To: <f8b829443523568823d062adf8bf6659bc6d4a3f.1683552984.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CO1PR02MB8601:EE_
x-ms-office365-filtering-correlation-id: 5abba27c-e8d8-425c-fdab-08db50acebac
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dvlD7JtFO+4od4xpAT1V6dBAprKHLgRrYNVE8t51GNeHQhUI7s5WeOlQKHXlzAmzVL3sKtsFYCtsmCZWUeb89oD7K5ONox69z2q+LPoKtr9BQjUzLxyoLRwAGtD+wXw3jvF0PX2OWNh3zxKGrc6IooI47k4T80BB86+CjJaKdvk4kotHofSR8BJVbEmrDW7Qt6bAWDfNUiFgq/pp/JnsKJYiRFcEUupXIu13Ky1gqSHa4L9AkMU8QM7lH4RFN6VJ+BgGeVCIu7Ndvsr7yr74YSJb3QDRhrsAgmkwH9fbV+S+JWz8KrhKGJzz1cOm5DQoRyoTOeEmUnj9DU6kgjE39e9UJqM0cn2fFFDmkOkM2yTNtuxYmZqJ8nGIjD6ay0k8cc9ryfOUaHmLbKyo6Cig7RodO22hHj9+i7Skaivu4I+3faeQbLjs7o4yhVRXhNE8wvxyXuCpCtpzBdu2KcsC+uT2dQU1YDc2ZEDBEQPgwqgXZSklIDqyeIo957n6MdiYt5naH/7wBEsqdEl2lusqs8Y2IR9edt3Ea+FmzZmNCp1Zz1bDBNmsoSni8D1bBeAbiVU+RHwjGflyxcijwmRyK5t7ibdERxv3KT5oHKOuLho=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(66946007)(76116006)(71200400001)(66446008)(478600001)(66556008)(66476007)(64756008)(966005)(8936002)(52536014)(5660300002)(8676002)(26005)(110136005)(316002)(7696005)(41300700001)(9686003)(6506007)(53546011)(2906002)(83380400001)(186003)(122000001)(55016003)(38070700005)(33656002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A8FlfwhDq0LJgE2PMsEMSfzjNy0wmI4uQllCBk15GGHMi0Hn4VYq+x6sc7jk?=
 =?us-ascii?Q?BJnKvZEDSm1gVhAnUnE5ptpZYxeG3Vk97rGNhQ1NPKNypeZDRXuhSYSMv44y?=
 =?us-ascii?Q?8poSHI9I9l5L0xBoXQk50SaehlA7TqB1yXW1C7eQXMr8zD5ywGcAWyIQAxdB?=
 =?us-ascii?Q?KKZahTCeLJrMujmGsMCHJwTBiI5Z7Vd476xcpnOIQPRXDtG/U0qAmlg3rpm6?=
 =?us-ascii?Q?2VF+55Ra7W8sXHvhOLbl+eP1mcajbq5L0nZnwDFSE8s9s1Hl9fLGksgn1IOf?=
 =?us-ascii?Q?/iLF/H08dQ+G8XpgbNSB2khFhtL4u/ZdHv0csqKDqgEZ9HmQSZsLcHEurSkz?=
 =?us-ascii?Q?nDmQJSbBUgURClUxy3pfqAtlzWYG5IQcSb9pV+l4mioScGXSlqm6t+AqbCV1?=
 =?us-ascii?Q?DpSQdvkJHwfDxCbyOPxHv8hggCdYdqyU3toJgMEWXMEB2yxPhMvlWTqlynHn?=
 =?us-ascii?Q?Wl+6dQ9bXK9aP9lih+xVQJEwrD50QaRWxnXpsh8JfYPQJ/CJBoqrwhmVC4vG?=
 =?us-ascii?Q?OtnfkoMbgoI0Vu02CgSF06DrkzMMkw52B8dTD2m5D9i/LMwVMQpAP4tUaHj6?=
 =?us-ascii?Q?I+buxXzR4CihGGvDYJJjE8ZCZhgbHtXHnBH0bAhe27FzNwx2POfdIpZBES6f?=
 =?us-ascii?Q?Jsw+IxLavF040o1TQBIT85b5WKb89wHyhbbLp28JeC8ZTtIXe3HQzZ9oHk89?=
 =?us-ascii?Q?MqoWKRNjkdTL7yaNLA9+JVs580WJd0+Oj6+i1pf0LsP/EX1ilN9zFzcahGE2?=
 =?us-ascii?Q?dUwsV7rf7LobjTstQtpqIv4j02leeINUwcdXd4TxhWLJRGcYX7JwrV31au/C?=
 =?us-ascii?Q?6d08J0SOSYLc6QLiYzmMHKkdHFrp9CMAt26XrZKZAUmx181PgoHScclZytnE?=
 =?us-ascii?Q?BuVb2MSbs50pY9QrZ+1SmfCUKgSicu72SHonuUMwCoy7Yq2LucwfwkJzLA6k?=
 =?us-ascii?Q?69f+zMAhjA87RcQyYO/f8kIC166YLFSb6hFUqBWxmo8y7BIYs67C+64U+LcJ?=
 =?us-ascii?Q?dM5WgcnCNmRk0rbI6bcZ+ArEZ01UaJ15V5m2RQrOxoR7pbFGTzQ6Oz801mDV?=
 =?us-ascii?Q?JXCXMSfo7dMQQ/7I3At2d8unJvNjNUYlLI2lyTFPwiy4O5Ac2dLnsMNkvxAf?=
 =?us-ascii?Q?wFv+X5Y8fATNSTLyNS113umamNWysRHGcNHiPt/1J5tM2QVpaOawx6kiG9O8?=
 =?us-ascii?Q?ExFSq9SuKnHBVnrP7J9EN0pcWGYLy16RClStwnBRRBXFl4FD9tJiKZ6CQKzV?=
 =?us-ascii?Q?nyLR0z2TQDC6aF0NJYoWMvLcI/zHhpRVOZgCQC+00OlgEqaBva/KzpYz6nQv?=
 =?us-ascii?Q?VKnnYvwxBp3DPARaOfgGreWAqk3zf+fzFOs2sLUJ1oPKGUYYeAPeYx+mFNR/?=
 =?us-ascii?Q?vdH8Hj08FT6LCXct46x1DmAUSCvAACHBr1Nszoc55y0USZ9GTO0d8F7lpJ9/?=
 =?us-ascii?Q?qkEvS8g5d/cKRLJ1bxBdiIjXbcWInNJ/pO8D0PrkeqYzD9m5waSA6saBAdnn?=
 =?us-ascii?Q?cjhux6ahy1Y4eO9ZjwbENsZUjX0oL3X4P8jXH0LxCdyruEn+GgSTPcF0YZAv?=
 =?us-ascii?Q?Sa79Y2FJfVx6Ue9P+FSQWJwq3z6x5/q4gTc0EJ5u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: p7hOcJJzErS1xazsr9V4mF0bahSo2XdwjRqwfB/PuPHTwH3zsyHmrf6ds2b83UgZ4R2ltaFxJhAnyXPJVbGN4C7vfVq3FsgNqV0qo41/V0xRfNTW0OfE+Q2qtT0WpMWVLJgtbYkrWuYJH7QstHfhLXbwUOTlzJymC8gE2HK3Xwgj3V7BayDKvGbHY1xqokZUs8v0qjEO2fMOOB6qYnis9mE8RIuTVwMGHkvbPGmDl85ZZ6y418Eewb838G5/wod4fls17LU/Q4dt+F61EnSfdIbBzOZaBJLiYIUdvLFkeSIoumKrE4SHdo2Aa3smWbZ8yANM5/OMdleqvFLmef5YDRIWlJK7hbK6Z9S9/hZWQB9oIfs8e6mb7zOzql/8NtLbge5LHCCxxSDkUAaYzxhFxwulGa3mLQ+iF/Gufzll/y800FT7q3VZ872a+RIEq77J5F3YPuu0GzI687/hoHiH9NpYMY60OLl8Xnzq6jeJjvCn9Ay8+zw4QVX765AuLeu4FybccbTGo2lJkBU/Go22l0GQRKZvBSutNF0mzSNX2CwTtJvshenvXQLW9gUJQ5d4Cnw5HxoUJ031i+n+dlO5etsIF3BRYx+pCpj8BhnEZam1GBj2wIrTNz2NeMJ5gFZ/7YNXbkR5rrpYWU0pRW+d1BFjm/q0w8ctWskhT4Qqt9Bb3hbCiqsikNQRW36Yoe5DsSc2gv9GTTUHclDRCXol9IhGYy9nFR1O8XrrjgluNhn/Znlh4dC9z1cKa5qCuanRLbJ6ggYd6EhShbX5vg2eYA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abba27c-e8d8-425c-fdab-08db50acebac
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 16:46:22.1407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TeaVd/qChalan4320XdIB2Gn9jStuvFNh5sMwfLi8e7PfpduBNI/ChF1tnsKgiHMhEndYR1IdzwuBQfq5lD8Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8601
X-Proofpoint-ORIG-GUID: vE0fRYvrncIvCU8yHeYw8YAhe0p9oAX5
X-Proofpoint-GUID: vE0fRYvrncIvCU8yHeYw8YAhe0p9oAX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxlogscore=773
 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090139
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



> -----Original Message-----
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Monday, May 8, 2023 8:37 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH v2] Hexagon (decode): look for pkts with multiple insns a=
t
> the same slot
>=20
> Each slot in a packet can be assigned to at most one instruction.
> Although the assembler generally ought to enforce this rule, we better be
> safe than sorry and also do some check to properly throw an "invalid pack=
et"
> exception on wrong slot assignments.
>=20
> This should also make it easier to debug possible future errors caused by
> missing updates to `find_iclass_slots()` rules in target/hexagon/iclass.c=
.
>=20
> Co-authored-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
> Changes in v2:
> - Only call decode_set_slot_number() with !disas_only, fixing the -d
>   in_asm case.
>=20
> v1: https://lore.kernel.org/qemu-
> devel/7a90f0925f182e56cf49ec3ec01484739fa2f174.1683226473.git.quic_mat
> hbern@quicinc.com/
>=20
>  target/hexagon/decode.c           | 30 +++++++++++++++++++++++++++---
>  tests/tcg/hexagon/invalid-slots.c | 29 +++++++++++++++++++++++++++++
> tests/tcg/hexagon/Makefile.target | 11 +++++++++++
>  3 files changed, 67 insertions(+), 3 deletions(-)  create mode 100644
> tests/tcg/hexagon/invalid-slots.c
>=20
> diff --git a/tests/tcg/hexagon/Makefile.target
> b/tests/tcg/hexagon/Makefile.target
> index 7c94db4bc4..0c69216c6c 100644
> --- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -49,6 +49,17 @@ HEX_TESTS +=3D vector_add_int  HEX_TESTS +=3D
> scatter_gather  HEX_TESTS +=3D hvx_misc  HEX_TESTS +=3D hvx_histogram
> +HEX_TESTS +=3D invalid-slots
> +
> +run-and-check-exception =3D $(call run-test,$2,$3 2>$2.stderr; \
> +	test $$? -eq 1 && grep -q "exception $(strip $1)" $2.stderr)
> +
> +run-invalid-slots: invalid-slots
> +	$(call run-and-check-exception, 0x15, $@, $(QEMU) $(QEMU_OPTS)
> $<)
> +
> +run-plugin-invalid-slots-with-%: invalid-slots
> +	$(call run-and-check-exception, 0x15, $@, $(QEMU) $(QEMU_OPTS)
> \
> +	-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) $(call
> +strip-plugin,$<))

This isn't invoked and is missing some pieces.  I'll remove it from the PR.

Otherwise,
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


