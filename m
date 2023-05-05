Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DA36F87D0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 19:43:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puzRt-0008OC-Dh; Fri, 05 May 2023 13:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1puzRq-0008Nl-Ac
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:42:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1puzRo-0001Vw-0U
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:42:25 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345Dhhcc001195
 for <qemu-devel@nongnu.org>; Fri, 5 May 2023 17:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=oXkGlqS3QVjD62KbqwI4Z3mOgqSbl62bg2XyliFN7Zs=;
 b=JUNbc01OPhYwlb/GhtNZK9+jsn/kyMaj+DbMCCdEjB+rl9vO0hPYscB6DASxiwMjFuHr
 P7mhb2TAAlQnuEbQuVVir8w4L5OmdBXFSd4oJ32Bg7J8cQwJLnae6GnIaV+P6OQYR1ax
 sWD38U+zFqfBHUPZH9JScfjgfCapVOYFNi2pGtpdOpk3l/MUXlCU05731eaBUVBuyr7k
 q3y82ojTTrexVAJV33GqijE60adLy9B2QxmPTMY0ECo0woQMoqg2bmyMvOo5xPfm5R2j
 6r+1EN8kcML98uK94IwXS93HdDySIlLE6RDlzfKjRCzV1K5dUzRFcKUHyaGMyO0n71K2 dQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qcsa9hsne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 17:42:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sm+Us7JEfCl6StsNkfmRjYqAGeXE1eXcr6bSTEoONVT7nwyvqY/U3O0kwQqlbACb4C9Oxt30Dd35nHeYmuYl7QipEJwEh8/5Ywg9M98nCmInbTZhmAjT9b+WGXGVgFuM921fEGAijcoZRyKwEr/KXUAP3XV1tY2l0s6pEWnVniaUjhUBoTUPqfA9Lg3+0X9J6KItMuxgE0L3ViLxHfcvh0M2bJ9m0gBApmpqKrTSzoPAowYxvEehlkX8M6TWvjww/MdybUinFqGDRPdeyAwQDt1iFBAp4LQ2pglRWR4IW8n3RBAQEkAsXTDTi3fvkcIIV3sM2O79Z3dicUgYxXUP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXkGlqS3QVjD62KbqwI4Z3mOgqSbl62bg2XyliFN7Zs=;
 b=Lrc8Na0SEa4Hh1l+6cRqFwxYh11adDZIFTBOi7kP6DiSybwrLZSbEciNIEHh7H1t62OXObwEfvMTrgo4qJIzPDq3962Ws+q9skA1DgERIJQrM/LtSHGg+U8WDKu1/uWTjAK4v4sgFcBgvvrpV+gPml5flrDffQGAYoRJ2M29yVv49zgMc6FBQefGrJSnzM0bwi/g9rS36D6UmEkZye75y4CkxQpFJdAeep0021vQhuE4NFQy3zhhOk3Esa+30nB5OKppaqu/pDmAQsH9iZ2Xe7RgR2J2o7jscyit90HawQIi6oCosre5VCxrBTbZgJXT/gxtF9HF8ZPf42vxNSlGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6944.namprd02.prod.outlook.com
 (2603:10b6:208:209::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 17:42:16 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 17:42:15 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Hexagon (decode): look for pkts with multiple insns at
 the same slot
Thread-Topic: [PATCH] Hexagon (decode): look for pkts with multiple insns at
 the same slot
Thread-Index: AQHZfrom+lLq3j1PGUe6kW2gWcsAlq9L9Abg
Date: Fri, 5 May 2023 17:42:15 +0000
Message-ID: <SN4PR0201MB8808B7A7E1A508D2861873FDDE729@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <7a90f0925f182e56cf49ec3ec01484739fa2f174.1683226473.git.quic_mathbern@quicinc.com>
In-Reply-To: <7a90f0925f182e56cf49ec3ec01484739fa2f174.1683226473.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6944:EE_
x-ms-office365-filtering-correlation-id: f0cd02c2-27c3-4026-3a6a-08db4d9010b3
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ea9ExDSKmo0eNJVX1UEIKa9vM2dCC0EBO2GZp3k8deobPaSsFPIraZm82IEbGZi91whKY957KfxnAwbXkVFzVlFcMkOqDvG17dzHZAMq95b37AdS6jUyn4e62kwnljJdKuXUIrHjBpe9D3natHD8EGY8F9uQx3UyLh4QRBp9C+b8fGTKuwqpRF3IPppnue4Zcbojq8IA02TwRxT/L2bSSafQF2sR8yc9RbaSqCqKmQEKejcz3FR+mhWFYVsH02KXZxxMARuahM5xv91TgaZEBfFDfYR2J1c7asE08aoRgnHeJjltOBlYveIit5GujEGjqzCKReLebg8Zj+Ot0eksRur8WnQ6co4kMuF+Kntm6a60v+yw7EWTkBqbArM4+QZee7AQjPsyCeqYyobDPmr0RCqP+rgZZ/bFk+D4k3MAOEde24D9/5XuqRH2nsLMwsEa0gIvNAEecQemIjHWO+0uGUrxtCVWnO9c3nMZ2gD07NnFP9rm8XRsG630qVV+YqhIJNONHzh3sMdmNSHkGbv0YUD0+7cwHMyYr9oiAOFtRoFtFVR5Cr2YHYEv6UL6ox4vE59pa4yHGeZrXJ2RFV9UMvZYls7ti15NPZuEWWib60o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(64756008)(66446008)(52536014)(66946007)(76116006)(71200400001)(41300700001)(66556008)(66476007)(8936002)(5660300002)(8676002)(966005)(110136005)(9686003)(26005)(6506007)(53546011)(478600001)(316002)(7696005)(2906002)(83380400001)(33656002)(186003)(86362001)(38070700005)(55016003)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FxM+PHP2DimOCn2/LDN8odkPNJo8xNkyWGnwLIIPOphGiYn/tq8FjvSAK+8y?=
 =?us-ascii?Q?TX/aRH3oWA7AL7J9F3i2EfptWbqDRmLuNU2aWHK5ZdkKKGURUnWiO63O8UH8?=
 =?us-ascii?Q?RfiWh8079ebId6WMj/fMUHwo75UCpDb1oAJYmt9TbWb+w76B/rII3MHq6nN1?=
 =?us-ascii?Q?HJIflSbk53Uomogj5L6JAJBX79El/m3t8FMFo/J1+r9S0+gtWRU07RfSs78j?=
 =?us-ascii?Q?DSwGn76PmDS0/Y5mETHB1nkbBPcx+BWzjXgHrMoLOoLRQ8XPy5OatIJ8T2u4?=
 =?us-ascii?Q?+GDhvvfAjf30TjlbYRrftbgjoox+yGx28qq4mwbnEoaQXV61WRXLIhM7lpDB?=
 =?us-ascii?Q?aXdMSV+dsIzNk2BpM/tx445+iUYA57qZVzyDueXiJHnJt7jFFJEOMLkZeiod?=
 =?us-ascii?Q?g1KWfTbETMDuAm6Ui+4OOS03v4rEwuJjAsnrWxXSceHmz9HxVJLQ/VqVqj2F?=
 =?us-ascii?Q?Nuy8/Q14qBcWDQozwkTpvW7LF6SBgqDQqLAIixdoP44vdlCXPBsZIjmiOVuy?=
 =?us-ascii?Q?rtC39xg/8IWhZHII0gEYoMnbwrEsNZy+EGeOS5Vqik1d8wrRQJSRs+YFqNhG?=
 =?us-ascii?Q?hybRosvlFTJq1KlNbUXtTzS/prZlagUOnzTCDIESik7+vHtwp6oNWiDJ5Zlu?=
 =?us-ascii?Q?uBN5MMW5uwwBslga3ArDHhEdpnye5P82Aev+VmvJ3rEkIyBuytSI/kv6QSSr?=
 =?us-ascii?Q?CKl27wQxR6E+6uE4WKuEoyIeEldggp7t9/LNTvV598OkIp5DxCyts/IDR5sR?=
 =?us-ascii?Q?OaObFesfz8jPhyldSCM4UO1/STkmuUXsVviXo9CXxCcvikz4qFQa9zwmhiVX?=
 =?us-ascii?Q?qHUkLA48gmTWuQnxgSwi+12Ek01omGLuu7lPeueMlvT6CD9WK3P7T77tDxbM?=
 =?us-ascii?Q?vxiRN+LJXVNcxMy6vfBFoQMBsCuIxqTOe0ujZaDKGjvRjO6Hzpf+u/NlTzaJ?=
 =?us-ascii?Q?ONRxhV3L6yCobnZ+SbnCaPwGOSQX0plul17rII0erKDYWqb+t+ZGU22cl1fR?=
 =?us-ascii?Q?Lihk8vBgRXOWbp/g9xm51rbRbg2ZTzMMenAJs0tHLTlQ8b7qp7au+zXOCLtA?=
 =?us-ascii?Q?Zgg8XbFGQoqtB4g8LFnKTzHeJ8cRplsXz7KgQLw74UvLBJnGuDwZ9Ho+ydjA?=
 =?us-ascii?Q?3TwlAjT6moQdew2iULCedgpbTPY1R5qTDUUVP/0C4Z103fAIqUotZVNKt4Az?=
 =?us-ascii?Q?EsshfbEWmtRG2SZ7pzY/WRL3A6ylovokAnlA8od28Sm5Kh2EUUd7rUMeRpKK?=
 =?us-ascii?Q?/uuAGfl4pLvriuNFljnHmQQsPoBq9saXdvsTP/TzNaC6ZyciKTijphKRw4k/?=
 =?us-ascii?Q?vkuZc6j+SQSqhVbjh3A5IZ/aoc0gV0mShjlvkx4Nt5slJUqHXhA+JOtpNfiw?=
 =?us-ascii?Q?OLXUrkGmWpdFPr538DFdI4+5CEAXnTpjbGKb85TEfj1cwg+Hn34/mrTpaLMs?=
 =?us-ascii?Q?RPMAYUe/wOEeIFmgpbiqquI3ioFYXRNHQlh4npcOnm7jtwAvDH0ecVX5OdU5?=
 =?us-ascii?Q?DDfy7jcZcZpBVeeFtDYXQRtxXeqaDijOSqFcVqKeSz4mxlbBEtdH4PiGNcLs?=
 =?us-ascii?Q?pkVu0a5WaXIP6Ka3vGAwbn1Rr6UKWMn5C5ExD6GI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: z5YjCch4F54x1w3y/WDLMhbF8x5JXmaqywuu9SogPiEp7jD8SrtLej63e0X7cB85cLLJ5oaV3zRvcnBAluemE6AVoNKHcmpDNH0qKOkivj7JqBwkVHKGEzCUaF23+zgQ3jKXPHTH97OyktuaffgYhmFeef+SdKV8AEzPpl5tyV0MItwkaitgcBG0fQ5uDfFCzJ0p4yOlXstXmNO3gajHefqgKqk7wS8t8PzfqggLP2u/SO5D49wtz/5WgD7Nwyd0ccY2uG2lqz8sviFuhgGV0fYtWbRo1KHs1y3C1SD9msvelCxEUW/vISjNw7UNf0oqAo6RXJn7vlV7RZvX0/gWh+sevuFPevz6TfqGYLkfJ5bLgUgNsUqUtb+Tgacxw67TrmUgFmGFgOl8Kj23OhjcZGLEMGuFcabQeHF4vbReW+KzjQiFg2rpELYsPznZ3Nf/F5P2DEjBxfhE+w1o6pdCsppz2nXnIvXzqcZ1YCXA9jfvXEgRWkW4+c87snHqfSRDRf1wNSLzDYGJ0BWK5HEXc4mBraNDRl73iUucvZY3IWjiC/bdtJkaECFHcsJXKY1nYiONGLokZLp2lZ7SognRw1wLKaT/wpJ3ROPTdIDPPCdLeBAguhogdb/SfVhkfQN+X/93sRLjRoRxJnM8DkKSg5emvngmbZieSESp1dIb6Q2varNScrxNtmNwH6954skSvr1Z/rHQ0yJ9jO4BtMPYYd/CpXrvWkV+t2xIa1YjQ31ARkpsKw+RPVdemUb5YEkBtOEo3H9E55O08NYbdAicsA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cd02c2-27c3-4026-3a6a-08db4d9010b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 17:42:15.3663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q0+xb3jYC9hrBOBriiq1KneEl0WCLHAv6bUogF4nbj2wXU4QUhWt+CcfuAEtHVnspuUoy4gum0pzgTlmDx/9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6944
X-Proofpoint-ORIG-GUID: Wu0aNv1F-4mny3I8OQbJoTo05JlAMigq
X-Proofpoint-GUID: Wu0aNv1F-4mny3I8OQbJoTo05JlAMigq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxlogscore=554
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050144
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
> Sent: Thursday, May 4, 2023 1:57 PM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>
> Subject: [PATCH] Hexagon (decode): look for pkts with multiple insns at t=
he
> same slot
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
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
> I extracted this patch from [1]. There are more changes needed to support
> v73 in qemu, so the first patch in that series doesn't make sense to be
> incorporated yet. This one is useful nonetheless.
>=20
> [1]: https://lore.kernel.org/qemu-
> devel/cover.1673616964.git.quic_mathbern@quicinc.com/
>=20
>  target/hexagon/decode.c           | 30 +++++++++++++++++++++++++++---
>  tests/tcg/hexagon/invalid-slots.c | 29 +++++++++++++++++++++++++++++
> tests/tcg/hexagon/Makefile.target | 11 +++++++++++
>  3 files changed, 67 insertions(+), 3 deletions(-)  create mode 100644
> tests/tcg/hexagon/invalid-slots.c


This breaks the -d in_asm output.

We need to guard the call to decode_set_slot_number with !disas_only.

Thanks,
Taylor


