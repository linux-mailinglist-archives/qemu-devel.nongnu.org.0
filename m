Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506256FCC6A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 19:11:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQrG-0000LE-Cw; Tue, 09 May 2023 13:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwQrD-0000Iv-Pf
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:10:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pwQrB-0007GQ-8t
 for qemu-devel@nongnu.org; Tue, 09 May 2023 13:10:35 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349Ggj7t014199
 for <qemu-devel@nongnu.org>; Tue, 9 May 2023 17:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=YiSA9sW261/btTYekQPDjN4QCyPg1c9XSCTYoBnwLEo=;
 b=AbGKwvn/jHiCiW9yuw2wWf8cfg7i45SaHYFUPUEmqKVjMWzxIs/nCxfwTYJ7jv7u0Mp4
 sBs2kNNalSzeaXhl3h4MMxVZPCa4k7tmOMWLmtfiWKN9vzw3pU1Sotbe4me+fuv+5wbI
 hwpx/fHV5Ld0tI6po08SGOtJSCDziMzolihD7aP6vOHsUWkrVA+ycLvPmv8Cge9H9xwK
 G40gXd29gPpQDhDf8Qvzh/aij5wC4ODYlEh7iuE0fLVzBBE2KQdEDqXIa3K7s257zOvE
 DafZwYdpb1X2ivyyPcQiiDFNiijY4vm2bYQvTtjSqZtLdj/K0glloB8cvHTm1o26gDny ug== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qf7862ers-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 17:10:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+EKMAybc4ELo0uhE5s2KSqed1btq6tJKD2InvFoMzcHPa2wwlB5KmYJHlXLGUM9GauVvQ9fPui9ih7PnwJXOcDX9E3mrdmWq7wcBjCDi7pwDt3aQAxFuad6+F3RWF1dNnq1VI4U3JSDdCAiuLnQsuxVQevyFAiivl8fXZQ8S8TAL531BZmO994L1bHmxKPqvrHEehC+OT9oMEATOMMPN7a0ei0O79e8K9a9nuKcRKeNYvAeGydiOwKgGDzc+rQ4OUJOPXoKc2MzNIGssiJTWn0PD5W71er8tEDoroL5HkFBE20yHXJPfNpiocxG4hitf7z4GgD4ZbcB176Mho6qow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiSA9sW261/btTYekQPDjN4QCyPg1c9XSCTYoBnwLEo=;
 b=BiC+w8VHlCTU/IdRsVqrC7eVGSKf7YnhmCQPD4MCrGNKsJK2/o7+Kurr7IKrGFIHt98lI3412YtchX2uj872N9Qd7WIEmL+QvEnC61gUIyDEDr9T90Ah2Gmije4cgphYw1WimPETlj4o8m83yMaUkiJVwip9uShKThWeO0SPuhuwpoDRnIL56XNmwC/fBCLhiJxROb6DF+xgitowzYmP8XTKNcXDyGlwBsdKyCLOvUHl58ChHbsBtMh2wHMVK8IZ06ZIXVJt8vv7gj/4OOpi6bllpcntHBVyNOY4ymAv/OVfwJ4RsneJlGEcDEeO4RhMbykCfXnBB3/K9myFm2xZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA3PR02MB9278.namprd02.prod.outlook.com
 (2603:10b6:806:314::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Tue, 9 May
 2023 17:10:24 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 17:10:24 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] Hexagon (decode): look for pkts with multiple insns at
 the same slot
Thread-Topic: [PATCH v2] Hexagon (decode): look for pkts with multiple insns
 at the same slot
Thread-Index: AQHZgbI8afcDoIooKEu2h58joNgTZq9SJ3/wgAAF3wA=
Date: Tue, 9 May 2023 17:10:24 +0000
Message-ID: <SN4PR0201MB8808BEDB9D971A4F2274B097DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <f8b829443523568823d062adf8bf6659bc6d4a3f.1683552984.git.quic_mathbern@quicinc.com>
 <SN4PR0201MB8808A31E8428BD84D15F4071DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB8808A31E8428BD84D15F4071DE769@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SA3PR02MB9278:EE_
x-ms-office365-filtering-correlation-id: 4b487d49-8ecb-4924-0ea3-08db50b04764
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BQsLNRFd04/UD4QIh8UiFQkxsplk0+SbS1rkJf1OqBttctmbyp7lmBO13Hi800cQutPjP5hxu/MH3qTZ7DHMEe8RLEMGHg36iGJS5R8z7x7p2vWZ+GSKPIzX4NJRdY+K4lZb4L3CU46gKtcyPo2Mo1RkCwR93oHY2sot7pF1I0k3mFDhr6PLXirTBMmdKt1HzchN7kY1VNWVDDaWb5bKGdrtXR25LHS+YpVwrM5P3rQTxtcvZF4aWVigm6hNI6igfuvx4WeM/sdL+7hlNY4YUiTrGTECo1qrS8QTVaqjS2lykcUfs1LSKbumrRe3+BkAPARZsw1eqmk3cLH1u/3FZqg04dQNK5JwfYS7wIO4Fv+iypMXN+tu5MmCyPpKMTI8Pm3vncfV7Zre5TeJ22kMwShzqz1eJ0U9SyBESkwQJi1GpC2OWgeM9h2L1aoeEcMQs9TPoLiPWi5swxrpF5usheD53bZXsCvZ0zIYQL8xWC4QUJBuzckYfIqcnnZuZaZto4Vm2zQrN1YoU6eKJ2legbHL39ZvgDlqSNZ4O+Ual970Ezj/Ad24pD/wmvTYzt+hgOD/jry6kyiJ6ZnNK7SchSZx1lbOZSpAyhyNjEYMeVM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(8676002)(5660300002)(33656002)(52536014)(26005)(9686003)(6506007)(53546011)(478600001)(86362001)(2906002)(8936002)(316002)(2940100002)(186003)(110136005)(966005)(83380400001)(66556008)(38070700005)(66476007)(76116006)(66946007)(64756008)(66446008)(7696005)(71200400001)(38100700002)(122000001)(55016003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mPfxG9jfzt9AdznqCPLO33a/uE6I3+LRmUYIekn7LoxaKdXJNI0uKRGEHQXl?=
 =?us-ascii?Q?bfJyBFtQGBMuHd9/2vwGgStoujZSVM9vZ2ZdqN+jcy+5KFCA26/KPLfUzWCC?=
 =?us-ascii?Q?8eZX9ZllUFLLbm1i7um2R415wa3Xp2atWyLw7V452Lqy7XvdOItiWkZEQLmC?=
 =?us-ascii?Q?QGUjw+bfE/7rwr/L8GKCE2m/Y8UeobYABJR+PY909m4h02Diw2Q0f/uAL32L?=
 =?us-ascii?Q?cMtvQp2p+KkJ2SMvjvBsk18MRPdQyIKX9Z5Xp/9usEP1WzTYXg/6Ltd/uK+J?=
 =?us-ascii?Q?RckvN0lVXy9rVsTzNAPNyDhCVJuUJCL8QsW6tOVaU5nFBOGaNgil77Ql5vT7?=
 =?us-ascii?Q?k8t1yR3sncj0KPrqtdH9K0iUuO9WQeOGV+zO8Uj1Tb9xdCXm7gvYg9Hkaz6z?=
 =?us-ascii?Q?MIr/C+qcYyGaqb1vudDlfIkwhxDktifWarCpg3BRX1ELpq4kQUj69rVtN7b5?=
 =?us-ascii?Q?htdDltrXSKS2XoHeWog0U7mD4OSOl9murUUrg5U6ExmOzuC6wDW6wEQkOnWa?=
 =?us-ascii?Q?GIIsaWeU2ZdJB4N+kBbuNQUsyUN0U8Gpe+qjpqs8hppK0yMVVJIP2RoEH9eY?=
 =?us-ascii?Q?NNjF3kjTyiJ6aJxPJtRIN7qeY3BjafO8EAlaPTPD+hXBBXgxTFu5Z6Ft+phQ?=
 =?us-ascii?Q?Ty7Ft4/Z3XHI8AVd/kvD++/c1lOq/H1dV1qYQNhsXXAD50/gltI7UdfbsBIf?=
 =?us-ascii?Q?m0jn3NCToj/XOFb6PkBjVSseoDe0+5XOEwl3Le8cIs4qRNQ9hkXThvCIuscu?=
 =?us-ascii?Q?caS0uW3L30TUci2pOXKc95Eo2ZDOQuOtCc4nYpaQUqrOrc4ri/MMCNh3TVbD?=
 =?us-ascii?Q?gWGkzq7EPYwnDCbisOwsPUSwYVqFPt17skQuvXY72JjN1XbgsuQFlDGTtYNq?=
 =?us-ascii?Q?aWtrBbZQ3W0yoGZMYFuczlp50CEJSX1HX+Vxev6swq8j+h7BpYHa/yyWO1D5?=
 =?us-ascii?Q?/P9IQu9GUhV5qRn3T9YFqSsEZ38OGm/MUcidjs5RgqlcVuH8TxAhWnuWLN5z?=
 =?us-ascii?Q?Jmq+sO4NHD2ExSHvB0Xlq4FJnFavJMORvf2zCF2qUO/69tJU9KY76TdWxd9Z?=
 =?us-ascii?Q?JjBkC9te11fpJ1qforE00QjbDDm6LAjuCGry2kqp/VodI/X/bpO859uj9O5S?=
 =?us-ascii?Q?keoaYJd3vWjjnwiPTVGoGTj1ge5QHTnMQz/8xeA+rAmtn7OfIVcxI8rng7GE?=
 =?us-ascii?Q?93pzQRDa/UxVlzuD4Rw/ajk9TuRFvER9tzbS+FDdagO05Cb7McV7WPwyapI2?=
 =?us-ascii?Q?rvPM9vynkzy0xdCHFSjKkTSDomTMpRe5/8+mWFzq8vN1xg1EOP2SYqttCaEX?=
 =?us-ascii?Q?bCisCA6emPg0B/1riB6nYCHCvdWTxIrHLbIPEbiN1Dlh9FcnRBjMSsbZnGDp?=
 =?us-ascii?Q?VlRo8vbSLGPA32vfeFrhjOJo9trRf6bHqsL5Xv9MEWVFF2PhOjuZ+DrKwrlt?=
 =?us-ascii?Q?j3LGcbOBYQHUXbw8TIY4LRP81k7d1EnsmOZq6wTTaeQ3u5/uNG6u0Zv7AnDI?=
 =?us-ascii?Q?xB6xtoYQA/9bJNUdTPemriQbO6e2tIUuA52UxV9KihJn9A8nbcFtgHf3f9eO?=
 =?us-ascii?Q?MVEkRHnerCFsH+5SYHluXjJI7hkxxj0mOvQz7siE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uiq89VHyzE02QxZBLL6Gah9lUBQ7n40ll76tK1XVVNGKlW9x6nXULzXJa7nu2h1jVYT6xOdz7OrLK4t79mxQ/YsASX9GFH+z0vswAQuHYeV2HdGeZoogY3SpdZe+XYHOWQGyl1GXFUs5UClB0LSuLAxMg2/UyQwf9np9exTSb4pjpMdZuPdMC0MFW23TErGwv6zYY139ga0QwrHCHV8pVrwOD6xAuOw5SP0Fw1nQPaqeNV3zbDv5JF0JMuN5hZflftxn+HBym7v0eG6jQe4Mp+1BhLwxc/iecovRritQru6IcadK3pLmoltZ/8f+Pr+SKeMYHUkx4MZz5h2kL7vwp8ESxsjWyCNegjFHNNe6RjVivYq/pYwKEuDCCR7T30c9vjN6cc485eKdn+JKBIrS0Uo24fXztbdKsPsoPyYyh5dXvpcE65pJhnvfxXNvzNbeybRDRcozZltnGj9TfRdmb2Ev4C6o7kOYJEXxquNyALSNyf7gwZtnBUcV+DoT2UIXUqhBu+aYnUnv3jMnSqDVRn+pjyv2rIyOFI8HjyBL9QIwXPBXLY00fxPNyC4jKRezdcHsaN2gMsmDHKCxXxjPTO7psIjyvGZLcWCSlChQaxiA2zu9GxRHHwlLvx4+fjf1wEXYVtDJ/L1/UkyFwmjnNw4Ddk3cEZTpy/ROqBZIH/YvNMtwfQVGHXJ53m22lZ/awIXtXsUG0QGs8XOuXzv+1+MUD5nr9SwrKopKGCxMSy5XNClbwz3AntEWQJzY3ZjOK20fyI5jj/S9B/Ysk7LvZQ==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b487d49-8ecb-4924-0ea3-08db50b04764
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 17:10:24.4788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rE90+6U88GwI6nBb0AktBWjFwQJNWX+2r+JFbOL4BAEjyOV4wHcoKj3yn09nW/zDYnsRPnCGnMHZfslv8UqAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB9278
X-Proofpoint-GUID: 9JwJR2iJkI3DHPGA8T6z1S_1B6AKsOVj
X-Proofpoint-ORIG-GUID: 9JwJR2iJkI3DHPGA8T6z1S_1B6AKsOVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=801 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090142
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
> From: Taylor Simpson
> Sent: Tuesday, May 9, 2023 11:46 AM
> To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>; qemu-
> devel@nongnu.org
> Subject: RE: [PATCH v2] Hexagon (decode): look for pkts with multiple ins=
ns
> at the same slot
>=20
>=20
>=20
> > -----Original Message-----
> > From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> > Sent: Monday, May 8, 2023 8:37 AM
> > To: qemu-devel@nongnu.org
> > Cc: Taylor Simpson <tsimpson@quicinc.com>
> > Subject: [PATCH v2] Hexagon (decode): look for pkts with multiple insns=
 at
> > the same slot
> >
> > Each slot in a packet can be assigned to at most one instruction.
> > Although the assembler generally ought to enforce this rule, we better =
be
> > safe than sorry and also do some check to properly throw an "invalid
> packet"
> > exception on wrong slot assignments.
> >
> > This should also make it easier to debug possible future errors caused =
by
> > missing updates to `find_iclass_slots()` rules in target/hexagon/iclass=
.c.
> >
> > Co-authored-by: Taylor Simpson <tsimpson@quicinc.com>
> > Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> > Signed-off-by: Matheus Tavares Bernardino
> <quic_mathbern@quicinc.com>
> > ---
> > Changes in v2:
> > - Only call decode_set_slot_number() with !disas_only, fixing the -d
> >   in_asm case.
> >
> > v1: https://lore.kernel.org/qemu-
> >
> devel/7a90f0925f182e56cf49ec3ec01484739fa2f174.1683226473.git.quic_mat
> > hbern@quicinc.com/
> >
> >  target/hexagon/decode.c           | 30 +++++++++++++++++++++++++++---
> >  tests/tcg/hexagon/invalid-slots.c | 29
> +++++++++++++++++++++++++++++
> > tests/tcg/hexagon/Makefile.target | 11 +++++++++++
> >  3 files changed, 67 insertions(+), 3 deletions(-)  create mode 100644
> > tests/tcg/hexagon/invalid-slots.c
> >
> > diff --git a/tests/tcg/hexagon/Makefile.target
> > b/tests/tcg/hexagon/Makefile.target
> > index 7c94db4bc4..0c69216c6c 100644
> > --- a/tests/tcg/hexagon/Makefile.target
> > +++ b/tests/tcg/hexagon/Makefile.target
> > @@ -49,6 +49,17 @@ HEX_TESTS +=3D vector_add_int  HEX_TESTS +=3D
> > scatter_gather  HEX_TESTS +=3D hvx_misc  HEX_TESTS +=3D hvx_histogram
> > +HEX_TESTS +=3D invalid-slots
> > +
> > +run-and-check-exception =3D $(call run-test,$2,$3 2>$2.stderr; \
> > +	test $$? -eq 1 && grep -q "exception $(strip $1)" $2.stderr)
> > +
> > +run-invalid-slots: invalid-slots
> > +	$(call run-and-check-exception, 0x15, $@, $(QEMU) $(QEMU_OPTS)
> > $<)
> > +
> > +run-plugin-invalid-slots-with-%: invalid-slots
> > +	$(call run-and-check-exception, 0x15, $@, $(QEMU) $(QEMU_OPTS)
> > \
> > +	-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) $(call
> > +strip-plugin,$<))
>=20
> This isn't invoked and is missing some pieces.  I'll remove it from the P=
R.
>=20
> Otherwise,
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

Also
Tested-by: Taylor Simpson <tsimpson@quicinc.com>



