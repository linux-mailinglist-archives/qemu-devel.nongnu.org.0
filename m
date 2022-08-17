Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F3597351
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:51:16 +0200 (CEST)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLK7-0001Dt-LA
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asinghal@nvidia.com>)
 id 1oOFOf-0002RZ-Ow; Wed, 17 Aug 2022 05:31:34 -0400
Received: from mail-bn7nam10on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::62c]:18913
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asinghal@nvidia.com>)
 id 1oOFOR-00064I-Up; Wed, 17 Aug 2022 05:31:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gm1eGJLEjQ0+5MVD+q2+iuwOnpCW1KO2w4uGjQ2mQ9njExDMUa7EMEyVRgOKjTlVLis524mvnCJ7oP2MDdZeqn/Lrop4fIADwjJrxg6hIksKZzChwRM/uY9W/a9ShKCaihtzks2+XaCBjAk2vDTycHiU7wwCkpKVwSlIC+829bIA2w0yvELd2VtHOGKWDCNv9ZPg0mPcJA8xT42uaxw5lbt7hzkfaZ3AlyhtsbmkXcQMWmi7H+HnrZfUWdW/tpbAVJhiQ24kbK+eAobDU+/jJJm074UgaS9PWWgOXqMBv6esx3vck4qglWeOI7qH/T4pVBj4b4Ll9ooh5TPhZjqR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEeuL1mr2b5KacyZT7MA8gEJ8GAy1YP3A/ujBICsK44=;
 b=YhcRmvKntqPfQI2SdKTtikqH9ChtE4K6M+Ws4JY8ExU+nNf+S32PsWq1FEzeT2y7B/IVan89aMMg/Z81LHFOc5OEnBsZOw0fmSiZljk1pGqFyCbhHyuDaO9+hb814LO1acZtqWqnIdrIf5UH07Nt8rxIWwaAnTZHOebSGYxZcc3wfXYFR/7ZIZjNUpdCpkZTeYajS/5uPCO8XzxJQYIwawa1LUy4QfMEyMnEs2/y6Dzsnk0TbXX7YCqgGKQBFYGYFtnjZ9O1gUf6amtCANhd5QeWsaak4RgZInCxg6QWqA2xpoROwvY0XQ8qj3pI5dOLh3yzq+kpm4cDRTm9Dt+h5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEeuL1mr2b5KacyZT7MA8gEJ8GAy1YP3A/ujBICsK44=;
 b=b/M3yN4fS7of9OG2+LIKooX00BFznfKFzqavBk6v9E2AN1rWrfYbshuYwnnIoPgf6ergXDNM0gR5MXyNBWdFD38LaJbYlP/S//RElG5CnwebfkBiGfbazv3l9xlWFWzqEA7qum3msFNzCEi1A3d9LdP9NucHZPhnF15Es+5+lvkWZm4xiEFQUy4At1m5v6B+ic4O7tp82aQ3gUfSK8pAgvxHhlEyHehxUqmLK2sh/O4yKb/Ff0i5OUWFKSorf6PGS6n19s1kXRsf1uJgASNtM9pUm7X1rLspmVA0D0q0fhcPgBeDTEegqE1EmNm4rpKmYcuMOxYGT8IZlkx+B/cLmA==
Received: from MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10)
 by BYAPR12MB3080.namprd12.prod.outlook.com (2603:10b6:a03:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 09:26:13 +0000
Received: from MN0PR12MB5740.namprd12.prod.outlook.com
 ([fe80::70b6:6426:21df:4f72]) by MN0PR12MB5740.namprd12.prod.outlook.com
 ([fe80::70b6:6426:21df:4f72%5]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 09:26:12 +0000
From: "Amit Kumar (Engrg-SW)" <asinghal@nvidia.com>
To: Dan Zhang <dz4list@gmail.com>, =?iso-8859-1?Q?C=E9dric_Le_Goater?=
 <clg@kaod.org>
CC: Joel Stanley <joel@jms.id.au>, Shivi Fotedar <sfotedar@nvidia.com>, Peter
 Delevoryas <peter@pjd.dev>, Jeremy Kerr <jk@ozlabs.org>, Klaus Jensen
 <its@irrelevant.dk>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Andrew Jeffery
 <andrew@aj.id.au>, Prasanna Karmalkar <pkarmalkar@nvidia.com>, "Tim Chen
 (SW-GPU)" <timch@nvidia.com>, Newton Liu <newtonl@nvidia.com>, Deepak
 Kodihalli <dkodihalli@nvidia.com>, qemu-arm <qemu-arm@nongnu.org>
Subject: RE: AST2600 support in QEMU
Thread-Topic: AST2600 support in QEMU
Thread-Index: AdisIeSsY02sPIDTTCawmJGYit8mSgAQEX+AAAa47wAA+16EgABsHloA
Date: Wed, 17 Aug 2022 09:26:12 +0000
Message-ID: <MN0PR12MB574081DCEE8272B2D1422BAABF6A9@MN0PR12MB5740.namprd12.prod.outlook.com>
References: <BY5PR12MB38917595B0306085EEBB1921B4629@BY5PR12MB3891.namprd12.prod.outlook.com>
 <CACPK8XfjXq6RW=M++UebfiGeij=GDSk5f6ZftNaL+2oeyCGnHw@mail.gmail.com>
 <ec20d3af-5f99-8e56-9352-75562c4548de@kaod.org>
 <CAJxKyLf1jUvx6m=0u3cf+vEfj6j4t6L7g7cowxKpNx-Xhh+xyQ@mail.gmail.com>
In-Reply-To: <CAJxKyLf1jUvx6m=0u3cf+vEfj6j4t6L7g7cowxKpNx-Xhh+xyQ@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f654356-9493-4882-6e3b-08da8032870d
x-ms-traffictypediagnostic: BYAPR12MB3080:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hQLCrn7TTKPhojHh2lsF7v/JTG6UYn76di/xBpDhQJkD2FYRRRplkxO8har+rnJB6mG9drp28h5qlvGWZOpNNUphOmlfX5v7IyBrLBNGU11DVqjCJ56ZM+0GypM3U9VBnNegQVvzNcBywaGmY9bI67GNGsVKzqhasWpC5Eo7jFXLYaDsSQjVJD3O5EKW/njQoRBEt3auvfDetv2Om6BBTPHMrIXGBjpjZrdgWsqQHmbnv0Tk5NJs5Hu9tOf27AEZf8rCV1ulI+MvxEXk0eNgZXdK+sksIWh/pKlKoCT3SRfaa3lDgcPXoCWvOZdsiE1KIbttHLMhsdkezAzfyYlfF7k+bjfjTBzYCJ/QIjQX3PZcb6M00tIrjYJrocXEBcN7LPdoIzKvMByjmCmUAdt2azWDwroehEyM3OGHf4JK4IvdOcxIm6F88o8ndX/4WCKWpyqdB+jZZ5ovxy4KFyFXwD//rcytKTxTZRvlTIKvLnlDttv0UhzNoRDkVwI+1dm28PbFHwRqg62sP6k0ZsmMR22ZiA0c4KTcvSdQVJxcg9y9s7no+ztLBdQirj4MizKr2CwxAZTyjyG5vu7g27E3by3F12+CYKqCAzE3d8x36GIrvfo5GKh8ClhjHgXrfa5ReZbTyIR9HXQFgW0U7z+HcmiE7Ydl5ZdZsOq3INaWa0M3jZy7AckyAEgaAcavQwsfK8dz+MlwgrCiaGl+XBE8tJNrtUUborsfpK/NAcxdpzyeMUEWhYjJ0ahYPktQc9zrRKAaGu56rfxwnoPHigT6m1NDLtaGf7wwSnHy/7f+zWUxArgMxy2TLQn1iP3fASkCig6nCn5LaFEpIpd5fyqG9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB5740.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(2906002)(76116006)(83380400001)(4326008)(52536014)(5660300002)(8936002)(7416002)(33656002)(64756008)(66476007)(66556008)(8676002)(66946007)(66446008)(53546011)(54906003)(86362001)(478600001)(71200400001)(110136005)(7696005)(186003)(9686003)(6506007)(55236004)(26005)(316002)(38100700002)(55016003)(41300700001)(45080400002)(966005)(38070700005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+10fibf0RSfJYLqUotM/cvG9f6d50xiUB3vMVjLJToeYQ+dyI/ZtMyyAmb?=
 =?iso-8859-1?Q?Rjf9EA6uZKw8z37BxdIVhgO33YRS0PVluHHtaxZhY8ZGaPtGV3dDjSL0NX?=
 =?iso-8859-1?Q?PMJyX9me4tzW1eYUkNn5FDz5/32cRkOdaPP4c5HNj+cjkV3gqTn5TZg+KF?=
 =?iso-8859-1?Q?IuFwtAgolDcKoiQ/pyS+usQq77bG/rVIYyxOjdlK/uk524WirDw2fBOFuA?=
 =?iso-8859-1?Q?Zy3BYm+h/Kq4JRgCjUBkWWD624Rvg6puIlf0yyd5SqDYd7QebbrvYsHHFl?=
 =?iso-8859-1?Q?7jF1PMogVvd9pEBgsSKBVZ2FJ/s99+8eOhf+YJIW5o3XNODnGTd33wrElT?=
 =?iso-8859-1?Q?94XYD7WackEsa7Qvlusl0DOvSVRN0x3yiknEA5mxd9sN9wQ25TPAdnEItX?=
 =?iso-8859-1?Q?mNSiR2X/XFOYrSFWUrkx8vfKCrJ2ZZU3B9rJSnOBfFp1786Byz4dv7+6N/?=
 =?iso-8859-1?Q?3qZmxy/XaiUtU1IlHSMilX/ydQa2utA57UwhBiL6n7ubcXrToSjUtrG0X5?=
 =?iso-8859-1?Q?VbAApSMMHaHlULl7fUYHAmolEGMGKmqMxreBImWAb5VvSUQWsfBgJUfFSO?=
 =?iso-8859-1?Q?9/K2CHhN1TuHd2Kre7ESoUFYdLjp0Dds/19FEfTBQQtR2OC2Y9cLaQzoNw?=
 =?iso-8859-1?Q?aD+AZIRL1quqLnq6ylHmTFt3hsBZctcuChhKAnSQIXLNzkwA4L+/TlMFq8?=
 =?iso-8859-1?Q?xZhDHjGa/S2dcC+AGGFhCoC4NBRbWBrxaSO/nh9WejeB+I4Z+GUTqfx1oz?=
 =?iso-8859-1?Q?kLWJItf4ve+asSgeKm636g/6WQXAGuJ9yzoEP+/coSQMRGgTCHCIJLsqlH?=
 =?iso-8859-1?Q?3K36zA8hfJt9ERwWbC11K9t1kALvcHTi6zQx+Le2oDOCOJ6et0rmTyJfDf?=
 =?iso-8859-1?Q?KmrVLilu8p0VfF56tNdwKN7f202IZ9OYZy0uTSjFmBazK6OL6Gpd/VBKIH?=
 =?iso-8859-1?Q?iKv/fqiF53kLkpOoBvMOA5ywXqFBkHAGDrV+SXQsD6qJbaoMU51riY6vuE?=
 =?iso-8859-1?Q?EPeTHdKkw2WZi1ODV7Ym2ZAC3Ap3BWImznTwf+HjDnA/vAqxNwoU6PQmio?=
 =?iso-8859-1?Q?SgPUvwlwMwWYY2gA1e8nhz/cYOcOF2fp0LSzTgwoIJbBqrhN15RZRX1d6Q?=
 =?iso-8859-1?Q?HmSJ4WPqEFle+0BlK85I7cylzVwjbz1S3cP8POVe5w98eZ0ivZM/PtTMOV?=
 =?iso-8859-1?Q?5Gas6A0Emt/6jhN+6GPfWmfuU8Y4ETxKWr+W+Sh0oKdZXm58hWz6WISG8N?=
 =?iso-8859-1?Q?Jg/P9CGPMy7LfkTEYh94BxOe7naJMAB9b0rKIEDl5kclrFkzrylPA0BsI6?=
 =?iso-8859-1?Q?peEKfXjHnCC5V6OiEsUs14oUxW6b1A31HnCF0jTEG/5jSDKWV/UFFRsY0b?=
 =?iso-8859-1?Q?LPEQmZ+PWP/3780ZWYHZyH/bq+vh+EMQIpwmykNnIt3+TP2KRkqQbnAjI7?=
 =?iso-8859-1?Q?CDqT6EcAqKasgraTEwiwQ59ACUj8g0WjrKFPdahY7X+HjRM+VjEBp6ZKLT?=
 =?iso-8859-1?Q?/nc///8DyYzm6s85xfGPvgsVWUR9tqyQbDoQtZ0kRnovM0jGgjk7OIjhQy?=
 =?iso-8859-1?Q?vDiQG5WeZ3Y5Ftxt/sfYxCbXOHdWHDBPjhNgBtSkJvMX3ZtSjopOX6zsLl?=
 =?iso-8859-1?Q?JQafCqpL5eFVYbsD0JLHNnTeW4zI4Up/rN?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5740.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f654356-9493-4882-6e3b-08da8032870d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 09:26:12.8714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7DcTGe5+Jg2pFB1TeMeOW/eMFuf/3iOWOZw946UBK4irSWbZ2DH4h5P+EgwKxaFmjV99NzLLoe134cy2sjj/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3080
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::62c;
 envelope-from=asinghal@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Aug 2022 11:28:47 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dan,

Responding on behalf of Shivi.

>> "So what does the "PCIe RC support" means? the BMC will be the PCIe RC?"
Yes, BMC will be the PCIe RC to control downstream PCIe devices (end-points=
).

- Amit

-----Original Message-----
From: Dan Zhang <dz4list@gmail.com>=20
Sent: 15 August 2022 11:18
To: C=E9dric Le Goater <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>; Shivi Fotedar <sfotedar@nvidia.com>; Pet=
er Delevoryas <peter@pjd.dev>; Jeremy Kerr <jk@ozlabs.org>; Klaus Jensen <i=
ts@irrelevant.dk>; Jonathan Cameron <jonathan.cameron@huawei.com>; qemu-dev=
el@nongnu.org; Andrew Jeffery <andrew@aj.id.au>; Amit Kumar (Engrg-SW) <asi=
nghal@nvidia.com>; Prasanna Karmalkar <pkarmalkar@nvidia.com>; Tim Chen (SW=
-GPU) <timch@nvidia.com>; Newton Liu <newtonl@nvidia.com>; Deepak Kodihalli=
 <dkodihalli@nvidia.com>; qemu-arm <qemu-arm@nongnu.org>
Subject: Re: AST2600 support in QEMU

External email: Use caution opening links or attachments


On Tue, Aug 9, 2022 at 10:51 PM C=E9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> On 8/10/22 04:37, Joel Stanley wrote:
> > Hello Shivi,
> >
> > I've added others to cc who may have some input.
> >
> > On Tue, 9 Aug 2022 at 21:38, Shivi Fotedar <sfotedar@nvidia.com> wrote:
> >>
> >> Hello, we are looking for support for few features for AST2600 in=20
> >> QEMU, specifically
> >>
> >> PCIe RC support so BMC can talk to downstream devices for management f=
unctions.
Normally the RC is the host CPU, BMC and the devices to be managed, which s=
upport MCTP-over-PCIe will be the endpoint (downstream) device as BMC.  The=
 MCTP message Peer transaction between BMC and managed device will using ro=
ute-by-Id to RC(host) then down to endpoint.  I am referring to DMTF DSP023=
8 spec. section 6.4

So what does the "PCIe RC support" means? the BMC will be the PCIe RC?
or BMC will be PCIe-Endpoint connect to host PCIe RC.

> >
> > I haven't seen any PCIe work done yet.
>
> I haven't either. There is clearly a need now that we are moving away=20
> from LPC.
>
> >> MCTP controller to run MCTP protocol on top of PCIe or I2C.
> >
> > What work would be required to do this on top of i2c?
>
> I think Jonathan and Klaus worked on this. See :
>
>   =20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> .kernel.org%2Fqemu-devel%2F20220525121422.00003a84%40Huawei.com%2F&amp
> ;data=3D05%7C01%7Casinghal%40nvidia.com%7C714d293de2ac4b7f5f9308da7e81b2
> 7b%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637961392786299602%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D9I35YQPk86Tjza6fa0jFVnLGCM
> SZ7ioTHpJEQN5c%2F1g%3D&amp;reserved=3D0
>
> >> I2C slave so BMC can talk to host CPU QEMU for IPMI
> >
> > Some support for slave mode was merged in v7.1.
>
> yes.
>
> Peter D. experimented with IPMI. See :
>
>   =20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> .kernel.org%2Fqemu-devel%2F20220630045133.32251-14-me%40pjd.dev%2F&amp
> ;data=3D05%7C01%7Casinghal%40nvidia.com%7C714d293de2ac4b7f5f9308da7e81b2
> 7b%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637961392786299602%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DHwFjdPHcM4MocoDz8hrZatYJiz
> gmDePy24KFivENpeU%3D&amp;reserved=3D0
>
> We also merged a new machine including a BMC ast2600 running OpenBMC=20
> and an ast1030 SoC running OpenBIC. Work to interconnect them on the=20
> same I2C bus is in progress.
>
> Thanks,
>
> C.
>

