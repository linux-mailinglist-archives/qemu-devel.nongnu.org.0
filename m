Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA96FD08F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 23:10:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwUaH-0005E0-QX; Tue, 09 May 2023 17:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwUaF-0005Dd-S7
 for qemu-devel@nongnu.org; Tue, 09 May 2023 17:09:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwUaD-0003PU-Nx
 for qemu-devel@nongnu.org; Tue, 09 May 2023 17:09:19 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349K76JN018512
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 21:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=JDvN3W5mgm0vGXkxIOR05jbZ1uYb2NIp08mrQotWeow=;
 b=TgfxSQ20NEW7mjFzf214mD5q3Ew43mMw2uMw0B9evTxJe3sGm1Irelhb7IDgDUYeeGes
 xLXjzVGq30Vq/ITxDYxEaMIJr90930lv+Cm0cJqcCBPdSmDIf/yC1Mx28m1HJ0rghhAu
 7snbBpeNjDHRq4BehGrwAT9kBFOWWGtp1UgKUdnghP2pel2ZhXzwjUKcyfahb8OEZBpz
 hAGjSnkH4cpB9qeDbH4ditbYis79hF8n4Jo24YwvP8kH7m32n6JWBI8AUozXY3w3t1CP
 AWQcE97UHgQD3fMKdJD2xlrFkrCoCiKKMUD7JdJVc+1cZzjsam7kwqT+DgQmZqqLl7AY hA== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfr508uc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 21:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXRT5AXpYiR+hMVR6sxAOPCI5qFOVNGzgRuozMU+SO/ygeojbdvQkyShY5+rAW1QZo9rq62WVZK7yLHNouqQJezWvTUSVslLJJBbXz5Z4VaQ8M3CO5MX6FOGk4l4V/jO02Nb/VK8KYhhkjTNy19Cdz25EbPXhUExqnnY/UYYC7b2Z3NVaJPLK+zsqojdUuumyaQipG7IHriLAXD3zeSgsl4jwomXFs6G7pOjlYqFFQdIxKjUxTn6mkL+BD9YguE1HvNb61MQB0/jOt4MDNX8zex+osfgQRVT+FoMrAkOUAWTl6oo11dPWdldde+9ob2kAcutjIDgR5onx0+52IqNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDvN3W5mgm0vGXkxIOR05jbZ1uYb2NIp08mrQotWeow=;
 b=Cq7gj3zq/lUh5GIzlEPSam+7HtwCh38ciWur3cALc2VullxVSoyzusrA89dU9eUoweVsPAcMzpkh+u/5xI6OIfvUWkoTFLlMJBIh1gTvo16LNE1uYe47fYV/Xyb0d3QLMkPqKyWZH4hQ5ksi02A6W9/5phWccIeF1QWjw5BBovbBVhYPfxsjjYmh4Vk8LdGiI+4SL2rUx26Vee9h6GzWv28WxXv1eeF5bENwjcYg+M/IvgHowuLmeBduSZANSqYWuhr+PLZ4bW2nYZjkm7fP08S8FWzazDZWY8xjTpw0hYdmE9RNG/T/ir0hCXpxH+9VaYB+BaxcTLi7aUM5Oi9zkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by IA1PR02MB8971.namprd02.prod.outlook.com
 (2603:10b6:208:3ac::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 21:09:04 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 21:09:03 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Brian Cain <bcain@quicinc.com>, "Marco Liebel (QUIC)"
 <quic_mliebel@quicinc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Topic: [PATCH] Remove test_vshuff from hvx_misc tests
Thread-Index: AQHZgqYRveCUq/4llku/sxuerSm3vq9SU1tQgAAJOICAABLXAA==
Date: Tue, 9 May 2023 21:09:03 +0000
Message-ID: <SN4PR0201MB880894A6D70E0952214BC02CDE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230509184231.2467626-1-quic_mliebel@quicinc.com>
 <SN4PR0201MB8808DC3221D2D5FC8F6530C2DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN6PR02MB4205E963C4443B22808CC939B8769@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4205E963C4443B22808CC939B8769@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|IA1PR02MB8971:EE_
x-ms-office365-filtering-correlation-id: 128578d6-de9f-4d2a-dc2a-08db50d19e65
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CJdKmx8vCcGIzBmE9h3KGCeh44BQahlBKIhZfgpydhG8+C93V7Fv8S4FGWrflQ8VwTogz7CF7yiEFOrcUNf2uq6augis6OkXqrqpCp4KnigB1TZRm5id2afLBep9vbyHtfKcQd8hX9CH7CkPFpc2sqySIDiyWHzh/O0ROGEj55ekMvWn42U/9KuNeDuqg/SR0SuwQeoLOqqEyl4gJWga8WMwX6GYVme46JnwRK5yJI17nVT8WjVDGFxeQgHclclDAUGl92aRH7kxLL3tKZZdWgLTrxrOIiw/CS20m9x0aJ0ituZ2v6PwLqdHicKGcGn+L0x8tnRwG/WW9VN0eezKqXiYfe1g8Pdr9fSpBYaZp/p16Gbg9MZw6/wqI4w8sWRLfYQEoW2gHRHLeK6UpHT4iMhKuzUqofiE6Ryzo8tDO1yZU3r62Uj2GB/0RtVx0pGbuZz6dhBnHKJnWU/wTXavaFl/0vmOCSoDOqenqWhu8kRAkRbx7CIwvu8NhXuIK2rQ/H2OhrW5+Q8vhFKIhy37z9syfiVQuojdwzEvOIdr8H0zMqsWLYSfg3V8afBnxPoogyOXwcnp/V9sj0hiABgjpvX1zFEX6b1ayjVZximGsbYQCi7Gqwm+7JyNEE0IBJwC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(4326008)(478600001)(76116006)(316002)(66946007)(7696005)(66556008)(64756008)(110136005)(66446008)(66476007)(33656002)(86362001)(83380400001)(107886003)(53546011)(26005)(6506007)(9686003)(71200400001)(8936002)(5660300002)(41300700001)(52536014)(8676002)(55016003)(186003)(38100700002)(122000001)(2906002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ri33EuFokYqZ0cj4mAX+s6ofD/o4aEe/Ps29NiaCygdq+BpfNrCX7GRn33ih?=
 =?us-ascii?Q?2RTrAUXFcOVl/HHpB0iNS44S2oL8Uhkpq5BtZFMMTraMWvkK5TbU5LFL7OQy?=
 =?us-ascii?Q?+9pcS34lGS1aOFFc+IWzYCzwRt1nlu4vwazQ3vnBtx7dm6TfmNA86WWD+/Gr?=
 =?us-ascii?Q?d2ouYDLyt27vyNFX3e+XWYmCOWNh88VedsWTW6pWJs56B8UykblRZMiENW9r?=
 =?us-ascii?Q?HxfILJP0CVgstyoiJP5AA4z0nUbTFLNSbQF1YYWAD8cu25Nx/K+ERfCJvMD5?=
 =?us-ascii?Q?dycd/t91BDP8sPiOhWYzrG2w0OzKfyt9HCdLz+lv0pTZr5RaZGgTaVgdc7Pc?=
 =?us-ascii?Q?NGOS0niHbl2jj0uc9S0I3fevtEwEQH7kaG7uKUL7UoP0x31tjn5I5FNf6t9f?=
 =?us-ascii?Q?lJX+Iulgu6x7XpTfzQO7A8BCUYsHCkW5Tjm9nYlCi48WHjXWn1RrxTUO3hEK?=
 =?us-ascii?Q?2UrMcCIIGA0LC3LY1ym9njL6R/K61sw5PpfjdZAhbDqWfzghk35o9aD9z4QK?=
 =?us-ascii?Q?1FAj2FBIvii7XnK627iXnzNQhj0Czot3Tqgjhrdexk9Xpfg5++1d4pObhlxU?=
 =?us-ascii?Q?6JSQUkk5EqgqVof1VPoH7ED/1FW6ToZxpQvtTvJ1mJkZITucwtUXXN7Buve1?=
 =?us-ascii?Q?JypTaMlqwuAJb+bQbT6RM2Tu17pcTiw0CiQ5Us3aQgnNpIzOMw3CvgcZGFS/?=
 =?us-ascii?Q?CQMiXkXDG8hAJlCAKTXWXYdwaJsbKm4/3EC+pJvKiOsiKssv2z61/GbwZ8/G?=
 =?us-ascii?Q?YhJVIy3DGZX0BIVzZ1vEURRanNww8LF5vySl4ydAz+giNoFlt4YoEyRZ4WRh?=
 =?us-ascii?Q?rUfRItOOliqBtQXbYXI4j7wqqY40V0HGrSc7o2shkYXcAOnlA4rLCV2Q5SlE?=
 =?us-ascii?Q?UlCj9/0ZsDaKOdGb+Yew6oTt7v8pcMZPS2FNRRTfNV3uf1KMhphyyd01K+fc?=
 =?us-ascii?Q?jqT116lhEeG+0FWsghI7AH6ngr9As4yNsVUY9p/tEvUqkcXDhkl1uxmHwZI4?=
 =?us-ascii?Q?PULGI2/Rdqs/NZrYxCE0UAY/57KJ+z8vjmqGhiTSrtNYbD//njvVJoNwRgZ1?=
 =?us-ascii?Q?XKFKz/7ziAZtaQkcqqQIctbNdcCrpx1NzQ8QaFPxZJhFlyAVyH7YRl4chD1Z?=
 =?us-ascii?Q?E50RLkGNlg+iNKrNJTFhzOpV9IVIPEDk4QHq3ejeldt/oax2SdRj8Ceo8cz/?=
 =?us-ascii?Q?ilsD2jNaK/+5+shUMqqU8ukwZ016gGikDsPWmmeOyLxotSqO0Llp5t6ueePN?=
 =?us-ascii?Q?8oqMGroSFKKA+bdrKCyan3T61UgiTl24r4q6oYKW3GmEyV5hLnPDgwkZZf3t?=
 =?us-ascii?Q?w8CXpM1gO8td/e6HJX2J6JsUEAyCOZE8GvaiIISQD7PWdSywTRASS4CR9Z22?=
 =?us-ascii?Q?7eInxARKQgq67kLwljsoAYq3yIqb8nZVQh7D6ssE8OldPXfJMcdqJdXP15tB?=
 =?us-ascii?Q?1zJp8ZR84wSxgDqw3/RD2wlq2bDJyCt1tdC/sVeuIdzoxBa0Oh8UCFrXifD4?=
 =?us-ascii?Q?kh7/fkIp+sp/40tsAZQeqZ9Bjx4UnuwOBJhosj/okzImkB+vwI6X0vNxJbX3?=
 =?us-ascii?Q?uTnib7kq/seHqcXGvHv15VmkAVSLl150OfQC6HF/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: I44yraWkdhqHeURGlblSqePwi7ZdeUjeouSeT8tnm3FZl130MNju27zsotVkfpOVHyjDnAFzkxoXI0T2j+SjcowHoYdcsLh69sbXG/EgXqQo7x4b9welCHw73Pr5BNpZ6zaebFOgCbwildhLMKgy9tPKogJeWnRYSDxK4esz65KrREsSZcNcIiPdkqPPVz4wY893Vz9F4MI33g6tV1mZzR8sqcjnEfJyDBwBmbSw8lwMxlDe3SDZkCKsgFtatDABNRO4HPmes2KOryEY/Uny/ovw25/SWRkAYAQWEFnkmPPDI1BSigtX71yRw0G0iZ7RKmgl9c+GJFTq28EkSNFScWuuSB86eugzpskJ9T98ucL+tQwff0Fyxmhtie0IgNCGA8nlcOfMwXe43SWXtSP985RCKjj064dE/rEpzntwckzf+QidjPWfVP23I922g7OIlY94WflHu6F+JscTAV3ttrGg3kumofed5LUyig7Dl3MwmLotCJRKOm53x4ckeMJJ/W6QAl5i8+jFdHk4UslaJA8CGCv702+0+G4zw1w0hM30Bgxh4OwqBn4FygkDt35fjwYbj0XycPx/9GaoERXAm/h/xHYK5g9qpHCdtpcEemaFjYzOFNP21Pae25pJU9+QXx0auS8Ga/NN72PLOAvhnhMfUKsNMXntc2vPHBeZEqB34EL8P1GJoQPsA9vxqSHNFEusZnIuSMjpnloLdyBpqrlN5pAEEGYM+UNWGs66YK0G+k8/sVEvteyxshDygg4UBmOQjntfylIklu+5Qft22Q==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128578d6-de9f-4d2a-dc2a-08db50d19e65
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 21:09:03.8327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDES2gmyIkKqCjc8g3EJL37xpECQUtQeP3N09dLjYV1BNCsyigzILKYYBDUNFgEnecWesIuFfDShU9Ayh+afwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB8971
X-Proofpoint-GUID: yMywvI4CoIUVG_4GNo6XjtGnojQFPro5
X-Proofpoint-ORIG-GUID: yMywvI4CoIUVG_4GNo6XjtGnojQFPro5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=685 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090173
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Brian Cain <bcain@quicinc.com>
> Sent: Tuesday, May 9, 2023 3:01 PM
> To: Taylor Simpson <tsimpson@quicinc.com>; Marco Liebel (QUIC)
> <quic_mliebel@quicinc.com>; qemu-devel@nongnu.org
> Cc: Matheus Bernardino (QUIC) <quic_mathbern@quicinc.com>
> Subject: RE: [PATCH] Remove test_vshuff from hvx_misc tests
>=20
>=20
>=20
> > -----Original Message-----
> > From: Taylor Simpson <tsimpson@quicinc.com>
> > Sent: Tuesday, May 9, 2023 2:28 PM
> > To: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>; qemu-
> > devel@nongnu.org
> > Cc: Brian Cain <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> > <quic_mathbern@quicinc.com>
> > Subject: RE: [PATCH] Remove test_vshuff from hvx_misc tests
> >
> >
> >
> > > -----Original Message-----
> > > From: Marco Liebel (QUIC) <quic_mliebel@quicinc.com>
> > > Sent: Tuesday, May 9, 2023 1:43 PM
> > > To: qemu-devel@nongnu.org
> > > Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> > > <bcain@quicinc.com>; Matheus Bernardino (QUIC)
> > > <quic_mathbern@quicinc.com>; Marco Liebel (QUIC)
> > > <quic_mliebel@quicinc.com>
> > > Subject: [PATCH] Remove test_vshuff from hvx_misc tests
> > >
> > > test_vshuff checks that the vshuff instruction works correctly when
> > > both vector registers are the same. Using vshuff in this way is
> > > undefined and will be rejected by the compiler in a future version of=
 the
> toolchain.
> > >
> > > Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
> > > ---
> > >  tests/tcg/hexagon/hvx_misc.c | 45
> > > ------------------------------------
> > >  1 file changed, 45 deletions(-)
> >
> > Let's not remove the test completely.  Just change it to use different
> registers.
>=20
> I'm fine either way.  But IIRC we added this test particularly in order t=
o verify
> the potentially ambiguous behavior of the same operand here.  It may be
> well tested otherwise.

I confirmed the hvx_histogram test executes this instruction, so
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


