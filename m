Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952FA489EBC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:01:53 +0100 (CET)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6yzQ-0002I8-MH
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:01:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1n6yuJ-0005Nd-W9
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:56:36 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:26834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1n6yuH-0006q8-EZ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:56:35 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AFN7e4026900;
 Mon, 10 Jan 2022 09:56:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=J14JQ/dCyO2z6FHpr1lxFA1hDEecrPqJiIvEi7/oKcQ=;
 b=zMuXBRi1UEWnr1KdaN6+ueGfXVApYd9JQyHs6DGro07jfDhHi4xCjAksL80eKsm7vxmx
 Qc6MZ2kZMYqdGCOOaacTNh/K/XFqlqTUG990eONcJbySyjh+LTVLyhouLMKhv519TsyD
 djstdFnf6llx4gUA+iCv6UQ9iWBzV/j2BZyBW7zRKAzVyiQ9C1Ai9ijQg2jz7r0bK58x
 2KE6AS34SzEg5mylA/5pPp4fkk8ANZ0HL99LBcrvI2vGv79jyIS9EfMaKvZwBmfvVLTi
 V45Wx07YwkYANRfzyRoe+aOUotNlV9x1yTIE28NicN5LD11RqOYZLyf+4C5+kQ+q5cqA 9g== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3dgfvth4b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 09:56:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CveEBrqQMnysZWOP5vXjJ0wBtjJ0eQjNA+whfG1K6AKXauxkmJJWs7waRJUoAzo+lE1YzJuTBK2NatSq9HdBmez5ebpCyuT/p+iYsz+I3xANjoKet2P4ViZfMYHemRPXOgBNG8adOp+U+fQQGFY6x0Ym5xY+l/Sy8UNwuC1yxfIF7rKKgzAblPNN2L8c8diJmBP4AvtOrTtHt9RqvJu3ldjUll0HhY0Hv1I01kWZUS5HF0jBCC50+9/Bri9+NawYk7JGmF2IgXNzBqpLx0X2yufDtb9hgE360+QYamsQUEpdESwm2rtDosZMHRXUOOYYvC4sgtA7NMCekehdWbJzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J14JQ/dCyO2z6FHpr1lxFA1hDEecrPqJiIvEi7/oKcQ=;
 b=i0k4yu+9umtuykFu84VxFc29E/wHF8L2pHbj4aI5Yg44Tz7cdC657Hb1KVQrznac23PgqqWfV9ixd+sPLxrb0TGy/xKxPCJNxDWk6PNec6/CQOPbLYuE7zlTSOwJVD+0Qcq5ml8w6RzS08CJ54vmj/Aa6rZDXqIOvtzRw00x5DEKuIToCiGICXJO2E1kfnSbJqjdmAF3zAcceSMPQp9gnB+5VpQtXcmzuwjBLYZF9fqVT9BHfNZHv6KVFUat0LGKvedBhNaABoTgad9tO6DMPALxvGJMRKLqLxTqVwawJJsQ54mazA8iPzeHhx8EdaTKpKhGhPwEJE26k0MdBaPZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BY5PR02MB6115.namprd02.prod.outlook.com (2603:10b6:a03:1b2::26)
 by BYAPR02MB3957.namprd02.prod.outlook.com (2603:10b6:a02:f8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 17:56:26 +0000
Received: from BY5PR02MB6115.namprd02.prod.outlook.com
 ([fe80::38bf:9b3:275a:90e2]) by BY5PR02MB6115.namprd02.prod.outlook.com
 ([fe80::38bf:9b3:275a:90e2%5]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 17:56:26 +0000
From: John Levon <john.levon@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Topic: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Index: AQHX8cmDUxUylbY1jUCoUfQQobTHyKw0+ZMAgAICnACAHWDoAIABw+MAgAaSNAA=
Date: Mon, 10 Jan 2022 17:56:25 +0000
Message-ID: <YdxzRoyD5gZDduYr@movementarian.org>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
 <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
 <DM8PR02MB80054A55BCA44CD3525364308B4B9@DM8PR02MB8005.namprd02.prod.outlook.com>
 <YdbwJE2E0T6Lo9Aw@stefanha-x1.localdomain>
In-Reply-To: <YdbwJE2E0T6Lo9Aw@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a025a33-9d86-46be-e50e-08d9d4628585
x-ms-traffictypediagnostic: BYAPR02MB3957:EE_
x-microsoft-antispam-prvs: <BYAPR02MB395748A5A8856235A3BD6A8097509@BYAPR02MB3957.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: huNvgBud8yhYvN5BbwH+pgkcHrKnq3GSSTCSNHnPdJnhSv6PL10gkdrQo7fmkrYmVTxjNNg+DFgT838XH0vfIu30Znx2YkCZ4A0hCK8QzLA9116nIp10Wv1a0Kt62Wg5gYwbz38HmfT/syj4GRC0U+/UIJNch++9SQdc8HbL97gsOtzP3XpB1+BMzOJ6tE5CWEx6T2xuyK0+/kaKtlf418Jw+1lxO3q2rCH55JFFGucHI0gyXuDCrnD7WCcXwhdjmyQWRT0xLuvZ3elXA4Pbzc6QK04AifJ6B5lOlHdvPtREbuM+OxJxpND8Iq603ly1u0STxBcY7w14x1ikPheQ9qJCExfpBMHABnTAEyUdZbt7Bkpr9mW1DT2hW+vYp4B0/ZdV7qyFUj9Oe8LuCqREymzih7f/yVqJr4nKnaU6uu8y04e99o/o/16ziX1UoWhnOPJllodE91yaw4icmms0n3IwjE/vm99eH6R+a0jqp0WUUCuXG4Ez+MHowpFY5yw+mhsuxHoevosHXvtWxZhchjJUvytuAEklXuqHK2TC9m9w0DO2Wb1BnYecxTLs4bDg7dL/bKUOVx4YE/+QbkZVI1uO8spRC2XhPGnMKxdU1xbGXAepUO1KswXJqNP3h+Tror2ll2XDnLfFO6QZ+b2a+hs5gAkBGsgJZoOP7zxu/ezv9SUOhNWxticSI5SIbk5ZHG8QTu3fqEe6Bkp2TaSXZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6115.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(91956017)(86362001)(186003)(508600001)(8936002)(6486002)(6506007)(38070700005)(6916009)(7416002)(36756003)(83380400001)(66946007)(8676002)(4326008)(66476007)(26005)(2906002)(316002)(64756008)(66446008)(66556008)(122000001)(38100700002)(71200400001)(9686003)(44832011)(6512007)(107886003)(54906003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Y3O8e6jA2tbk7QbKmhG+gRtaMu7YUbVKw5B95VHmk49Jg35eJT0IrSbzne?=
 =?iso-8859-1?Q?cI+LG3R89ITdRCgSlnpYa3/XiBAhqDGlN366dFWW6+8MnQaHgf3lJyzLUf?=
 =?iso-8859-1?Q?hxcw116lw/EN5VXKu12/x07yVjQHSKkRRYz3RyApKdlzhMY2yz292Sucez?=
 =?iso-8859-1?Q?/Uiok6HRarns0oQ2563S3Pl2TRxp6tzvKne0br+UQYPrYAntQhFNGoWyJX?=
 =?iso-8859-1?Q?e2Kl4bil7r7Hnow93zoGCe39Ct/LEpdQ3HywyDLD/e4W3idDoH/VCwoQbY?=
 =?iso-8859-1?Q?iQYacSmgHLTnEC8p7NxmbdfooVpYxlFt2mW2VxCsvLR0oQHAayEX656pqu?=
 =?iso-8859-1?Q?3loxaaQd5V8NVgTzlSO7fmg/VvhmfLk2ADVnwMAxUg6GaYKEpouEp0iNAi?=
 =?iso-8859-1?Q?cSsqT2Y6IiU6pGtPv9rKrBB3QZZtxxh4ljSVpWtGn9bzSS/Vs5NdcHMrC9?=
 =?iso-8859-1?Q?szEFGYIWSKK5ZHsMEYWSlnRyo09XlFdRVQWhF4sJ3wHbAnEAVLpz2DQSHL?=
 =?iso-8859-1?Q?GDQsmWE0/6fZjam7iv1LKE9gS7BhiUGzju0MSKKiiIhBbDpW+UnWm0X8Qv?=
 =?iso-8859-1?Q?VZkOme3YJOBpYSu22jaTRtCpsC3GTyX18BVQomHdAumDlfICugrWISDVd5?=
 =?iso-8859-1?Q?wmjCVGaFYp6tYOUDrLIe5lIAdo3qO4tBTK+T0HdY0ZMew4y24GhXSX2PqU?=
 =?iso-8859-1?Q?DubmuKTQdmxA9Fh8HI1siremZdwNZ6Wt/nHcO5hiXaJfTxh8BRMxkpzux4?=
 =?iso-8859-1?Q?h5cFgWGCBOetJPUOccWB41nH0sEh+iudD5KXJGlWS3kkSq+UsZuKPdMbYB?=
 =?iso-8859-1?Q?St08p59yRxUEOJ8RvtyqXX35nwarbXiN4n2sgqgDAhaABFx7lrozj2Y1B4?=
 =?iso-8859-1?Q?SnfX3QlC26SCDWB8FlkaNZi8Vsi+WdzUPM7uHvkL0lYfF2zCz01cnGtkdz?=
 =?iso-8859-1?Q?Ol2eQZfxXMN99MN8v2krTdJbfHqdJJkM2tt4cDdt409m9R8KS3X3Ci8CvR?=
 =?iso-8859-1?Q?PxPjit5xWjQLa7m8x0T45XYdWCcbhKtEH7W3jyHT4x64bh7oLJrV9dxIvf?=
 =?iso-8859-1?Q?kX4jLptfYtkRR9ABcXCXxhEknJBmyBL0ZyP5+x7E2JoKjsYkxPusCTPJvX?=
 =?iso-8859-1?Q?Ld3GgoDM4Hur2Q4aCS94xTkDYEQU09jqldQyqWN0nqcLEvCi5tjauo5JYK?=
 =?iso-8859-1?Q?DeRcCdBwUZGiIJTj6HGc6wYLVaNC/ZVpA1Erl54uL5REh7LW1Wph30+mcy?=
 =?iso-8859-1?Q?5wO0GYCKk0/bqRdDYRFNJHDYBR6je0ea2ny3VZU05bNpraJBzkPxwZbvmu?=
 =?iso-8859-1?Q?cGGKMxXzgT5mGLD4WXs78SW3NH1bjKOxtRIghJDj+w0XQWLcwZ1GtNPfsW?=
 =?iso-8859-1?Q?BVXJNVJK9MpQ6FgRWiYH9FUdue49wlDwXiq7tGaSXfmEktTLHmBeXJRueB?=
 =?iso-8859-1?Q?h7138GVIeF5bOnUR3rrjUjjPwfpqyKTo6xOdn3CXAEuOrU5SIDsqI5bk8N?=
 =?iso-8859-1?Q?5nn2LZ/3Dwj29EfwwiK4hbWa6OSHlAuDsXQD5t7wUiypYaQgpaPBPQZdBK?=
 =?iso-8859-1?Q?uJQqXd3OerVHiC8wMO/c90ippELOAIX4Lwyos+7G/YJ9KJtRSWrbkIqUin?=
 =?iso-8859-1?Q?aMuweZoyNcN4/LPTbMmjwqKNKS8dygKUeMbt/l2sahK+DgumhRHHrJAEYw?=
 =?iso-8859-1?Q?kn94RP2A5DL5l+LkuKU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7C552CC4A84A2144A789FFC7664EC215@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6115.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a025a33-9d86-46be-e50e-08d9d4628585
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 17:56:26.0257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +l3MbQQLxCHCNilGO2V7WG1yG9mEe9o6EGOmHCW7H2fG5lLGOoI3lDFztWkYg7UrJoj4fSAawuHZhrYUNtMmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB3957
X-Proofpoint-GUID: xPLtcx5CnNgokU8SvIOAcTJeoveLmqR5
X-Proofpoint-ORIG-GUID: xPLtcx5CnNgokU8SvIOAcTJeoveLmqR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=john.levon@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, Jag Raman <jag.raman@oracle.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "crosa@redhat.com" <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 01:35:32PM +0000, Stefan Hajnoczi wrote:

> > > >> +static void vfu_object_attach_ctx(void *opaque)
> > > >> +{
> > > >> +    VfuObject *o =3D opaque;
> > > >> +    GPollFD pfds[1];
> > > >> +    int ret;
> > > >> +
> > > >> +    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
> > > >> +
> > > >> +    pfds[0].fd =3D o->vfu_poll_fd;
> > > >> +    pfds[0].events =3D G_IO_IN | G_IO_HUP | G_IO_ERR;
> > > >> +
> > > >> +retry_attach:
> > > >> +    ret =3D vfu_attach_ctx(o->vfu_ctx);
> > > >> +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLO=
CK)) {
> > > >> +        qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
> > > >> +        goto retry_attach;
> > > >
> > > > This can block the thread indefinitely. Other events like monitor
> > > > commands are not handled in this loop. Please make this asynchronou=
s
> > > > (set an fd handler and return from this function so we can try agai=
n
> > > > later).
> > > >
> > > > The vfu_attach_ctx() implementation synchronously negotiates the
> > > > vfio-user connection :(. That's a shame because even if accept(2) i=
s
> > > > handled asynchronously, the negotiation can still block. It would b=
e
> > > > cleanest to have a fully async libvfio-user's vfu_attach_ctx() API =
to
> > > > avoid blocking. Is that possible?
> > >=20
> > > Thanos / John,
> > >=20
> > >     Any thoughts on this?
> >=20
> > I'm discussing this with John and FYI there are other places where libv=
fio-user can block, e.g. sending a response or receiving a command. Is it j=
ust the negotiation you want it to be asynchronous or _all_ libvfio-user op=
erations? Making libvfio-user fully asynchronous might require a substantia=
l API rewrite.
>=20
> I see at least two reasons for a fully async API:
>=20
> 1. The program wants to handle other events (e.g. a management REST API)
>    from the same event loop thread that invokes libvfio-user. If
>    libvfio-user blocks then the other events cannot be handled within a
>    reasonable time frame.
>=20
>    The workaround for this is to use multi-threading and ignore the
>    event-driven architecture implied by vfu_get_poll_fd().
>=20
> 2. The program handles multiple clients that do not trust each other.
>    This could be a software-defined network switch or storage appliance.
>    A malicious client can cause a denial-of-service by making a
>    libvfio-user call block.
>=20
>    Again, the program needs separate threads instead of an event loop to
>    work around this.

Hi Stefan, we're certainly aware of the rationale. Ultimately we just haven=
't
yet found resources to fix this: in practice, we don't really hit problems =
from
the parts that are still synchronous. Of course, that's not a good argument=
 when
it comes to your second issue, and indeed the library is not currently suit=
able
for multiple untrusted clients.

For Jag but: patches are welcome. But it's not just negotiate(): all sorts =
of
things are potentially synchronous - for example, it's expected that the re=
gion
read/write callbacks are done synchronously. Any other client reply, or
server->client message, is also synchronous.

It's partly why we haven't yet stabilised the API.

regards
john=

