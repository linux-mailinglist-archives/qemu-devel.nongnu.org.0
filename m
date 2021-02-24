Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4A32447F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:18:42 +0100 (CET)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzgH-0007j1-4I
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:18:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEzUR-0007H4-93; Wed, 24 Feb 2021 14:06:27 -0500
Received: from mail-mw2nam12on2088.outbound.protection.outlook.com
 ([40.107.244.88]:23521 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEzUO-0006Oa-NG; Wed, 24 Feb 2021 14:06:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8n4ijSR7dZxeAvHpih2HSX3nyQGSDaoETgkOMxGfPsPf8agNN8arcp0NH3O+O2w95M+nMud8u0UM9MCpUPyhn7jMfePCCKPgjtEIMrGeUCkikbWzdKg1WQaGO2HkHjE8D2Q0vehRzET+SrLnh2e6J5HxURIU6UYiCAEJaRMyvYGJRiiQgTXnwAj72EaPrNpozZ6B3hMazL1Ooi99ufwn3GE3G+uCd2II7kvTCKbX6P7n8UdSECKxT214Kzze72vbvd2kV+413lS5vjWgD7bANh0NpLUjlQgE9Lm0obBmGwdqHLg0Bakiu4qzlZuTgA4TSf8MzeLHqQQFzEQ0hnBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlKZaleISkqws4QTYkJ5fvhqBYNpCaZBSF4GEwDfmZY=;
 b=KZ4tY2O9jxMsK48+1w4V8iDHXCQivXMD9uwpr1tpZK7isfy52r3BYDbdmRqtl7Z8idSuZTgZARD/Xt3d3j7jMSTCA4uKD3NIHNB5ZAGyRZHknfa+IkZrYZJkjQxVipgUEVZ2pcx02WbBOSe+w5U8VGfkHCtvwNBZNRIbFzQG8wAxINbyWawlMn/31FsyYS4gsOrYFFqNc55+WX+f03tgkbwx8wblaahnrHuelDrTMsriGI4jO1lsZfQ0MTVnYLxdcCA78qX/+DjIofWMhJbnuT/ya9T6Slbn8hMLq5CsJWNGwDyEkVM9fJa2/PX2kclectBIU+h0k67+sSmee/J2Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlKZaleISkqws4QTYkJ5fvhqBYNpCaZBSF4GEwDfmZY=;
 b=Z+Zigr/7aSACF4KyiWLchz5QnQceOhaqwmyRfvzbhsFm05ssEnAQZ3EzEAG3Fhj7Gd49CGCTrJtRUCmtWOGglD7qmAc1UO4/e0xlFAQ4A+Vhl66XcooKR4RwoWA8uD7PeIuYM28BXK0VaJ6Sp/qjGD3XA/NWO5GYCFjvZhA1y1o=
Received: from CH2PR02MB6774.namprd02.prod.outlook.com (2603:10b6:610:a8::18)
 by CH2PR02MB6632.namprd02.prod.outlook.com (2603:10b6:610:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Wed, 24 Feb
 2021 19:06:20 +0000
Received: from CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::fddd:4746:8bef:bd2]) by CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::fddd:4746:8bef:bd2%9]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 19:06:19 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH v2 01/22] block: add eMMC block device type
Thread-Topic: [PATCH v2 01/22] block: add eMMC block device type
Thread-Index: AQHXCPMCc9P7MYpy7UqlbMux6TiW26pkE7eAgAHtmfCAATB3AIAAe90w
Date: Wed, 24 Feb 2021 19:06:19 +0000
Message-ID: <CH2PR02MB6774BEAFC857831706DC2309CA9F9@CH2PR02MB6774.namprd02.prod.outlook.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
 <BY5PR02MB6772EEE95845BAD093CAC972CA809@BY5PR02MB6772.namprd02.prod.outlook.com>
 <YDY7KKI1Xme29UlQ@stefanha-x1.localdomain>
In-Reply-To: <YDY7KKI1Xme29UlQ@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a737c420-7aa8-46af-ef0c-08d8d8f744fd
x-ms-traffictypediagnostic: CH2PR02MB6632:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6632D6F444D9211B06F159E2CA9F9@CH2PR02MB6632.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1hh8/vc3qz0KG/DRzBoNpfx5MBYQuWKx9nP7j2p+K6uOtUnacpD1OBOsLXKH+5hvGSXi19YPpNNph4hnK8xAwPK9BLmnXw8zc1p93YJr5yLx/mfdXKAE/tF7AXPtP01Mn6gHcPEcL1qkvw3gOGPul+o5szwK47qsUdbjXL/We7n0blxfV/uVFvCypNUs6yNr1ZUH8wliKULCcBbgV7vPrP36HnSzbqjKDdCTuYmNhgU6DCJ6KNEJLHeHumL3KfCGFxpE2MJVx6rQ4OmUcjkwusPtFyMnOTCP5r367pqSAWttqOShR9DjbAGxpMoPdsV8NEcK6UPE3aawz3NejukZyjrTtflWoYpskWVf1VSfaa1C2tdUmMzk/ywqBbvpRHQ4guSXpgPsv7iGjdNudLNPmp3nqrerUabMHm4YeHpcVrUjvR0WUzl0J/KUOo+mRGtUKQezMeX1fb93UylSVOyjeApawp5fp9+2UssWj/L9UGxPhua2MJzg9En+X6JtZBVrJK8pJ0cU2Tu9fc07kL02Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR02MB6774.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(6916009)(2906002)(66446008)(7696005)(5660300002)(66946007)(52536014)(9686003)(86362001)(316002)(4326008)(8936002)(83380400001)(66556008)(186003)(478600001)(7416002)(71200400001)(66476007)(55016002)(8676002)(53546011)(6506007)(33656002)(26005)(64756008)(76116006)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?5CscSlgC0+26YrsMWNhd9sx63WSW8uJ5CJA5V25Sn/RxrifrglMht9g5TO?=
 =?iso-8859-1?Q?ngUZqZhI/rWLUWD1qVz5gtW/cFUk1kbSj8BnNeTzaSLlSZMZ3aw8sfz0Tv?=
 =?iso-8859-1?Q?LC4NWXW8e5BLydo28/ORk0XUR24PP6E2kfPD7tgdxbIrrf6UjBEVp4xca4?=
 =?iso-8859-1?Q?0erXfFaSmLr3oiDzNP/7wVoCUbSG6ONbI8AsRhH2mAfetwpQAqL5yE9gXI?=
 =?iso-8859-1?Q?I0WY3a5+m2PfyDIxWzKD/wPIEx+xzCbYs//u2+TAVSP4j6DthiJQ/FPcyy?=
 =?iso-8859-1?Q?pJA3CAyKBnyOJnVD7LZgmaPB/e+h14HuWWFpqAb4X43OaZF3wR8xn+BFLw?=
 =?iso-8859-1?Q?aepT50lnn1EflPnVBEH07jIq7MBUNd1lUz8sfNw9K33/BHd3tuLDBbMDsi?=
 =?iso-8859-1?Q?NOflAxHi/m8g2v7SggfoKUTGufiHJbgQn0JhhTV8EqklQmcoM9hYgicMmQ?=
 =?iso-8859-1?Q?6w1C8mBGCDF9JId0vacrgrFUD2ujEBy5/yn6G5+C7BuAk+asxeX6AUSvbk?=
 =?iso-8859-1?Q?eZJoWrcQgNlSZdd3ExFXtAahZ6tlxMcPc6HeSUtewXNQb26elXP7AANzNG?=
 =?iso-8859-1?Q?o35AKgEZg5gVe/6lOEqIJ1HtEPigqKfLzXhfc57FPPjZc+aK99fwHx9mRT?=
 =?iso-8859-1?Q?kPgnaocuFkuhU75wla+vmq70hojNi8C+Y9aBhtyEkhP33wv1E1S23GZyxX?=
 =?iso-8859-1?Q?8r8wOr9BqsWa6vhMXawAFy5LCA3b7Uc1m7X4kZoDM9HrU6BMnOTRdJ/8em?=
 =?iso-8859-1?Q?VWWaJTOMcLDDGBidz8bYnfLAXWDpjSoeSA9HVhJcm0olZzpugmmM67Wza5?=
 =?iso-8859-1?Q?fDLPyuVM6CX5WUFp30T5Fbmr+Y+PFRnWYBpSFtwZTHcWt8rzKJuOjpkYBn?=
 =?iso-8859-1?Q?vWmDXougl03exBzhAr/ecGA1eArkysWi6WJYPLRuoEsdPgTnMKpOqb9Q+5?=
 =?iso-8859-1?Q?iI1mZN7c3uunsDcaujbKvhKLQbhxvX5Ie1fhabtgivuUqI9thvBZ7Y1L9O?=
 =?iso-8859-1?Q?lcIrLHPqQ52v4ndlOEIiDUwfjMhkxgD+quzg4r94fQpKivRqO3EwVkyUDP?=
 =?iso-8859-1?Q?l2eKKdA+mFN/Eujs+hEn5kteI2ViCFiOLkGnQJvLCIagOh+4MW5SNMno73?=
 =?iso-8859-1?Q?SNY+HwhskHrVhtjPMgHUsnNvjrYWOMiwbvZHomH2udyg4gtpkMahrKgNI+?=
 =?iso-8859-1?Q?Jabb/Lif5Z/+eE2klFfsX1399DAEALlaHRvfP7Dle02e1tUrFUxTij83VR?=
 =?iso-8859-1?Q?Au8ugPOO/4ibuoF4uKljbKslKf7XTDrJcDGAUIU1iycG55GK7Ut5EHgCpt?=
 =?iso-8859-1?Q?uhvF19zXGly8IlOZ30dF+/Lzqr4kcXtiE5H7tsO9GL8T/0022LZSIxsO3F?=
 =?iso-8859-1?Q?YeDqsU7Hae?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR02MB6774.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a737c420-7aa8-46af-ef0c-08d8d8f744fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 19:06:19.7381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lPxqITAps0bGwAk4gmdWNXymkZMMpEVfjDqtslNsENWXU8+TQjDikFhOXzVlgVAsEIZj3/mDUCCZqC6GmF+hIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6632
Received-SPF: pass client-ip=40.107.244.88; envelope-from=saipava@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>, Luc Michel <luc.michel@greensocs.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan

> -----Original Message-----
> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: Wednesday, February 24, 2021 5:10 PM
> To: Sai Pavan Boddu <saipava@xilinx.com>
> Cc: Philippe Mathieu-Daud=E9 <philmd@redhat.com>; Markus Armbruster
> <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
> <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel Stanley
> <joel@jms.id.au>; C=E9dric Le Goater <clg@kaod.org>; Vincent Palatin
> <vpalatin@chromium.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>;
> Thomas Huth <thuth@redhat.com>; Peter Maydell
> <peter.maydell@linaro.org>; Alistair Francis <alistair.francis@wdc.com>; =
Edgar
> Iglesias <edgari@xilinx.com>; Luc Michel <luc.michel@greensocs.com>; Paol=
o
> Bonzini <pbonzini@redhat.com>; qemu-devel@nongnu.org; qemu-
> block@nongnu.org
> Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
>=20
> On Tue, Feb 23, 2021 at 05:35:20PM +0000, Sai Pavan Boddu wrote:
> > Hi Philippe,
> >
> > > -----Original Message-----
> > > From: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > Sent: Monday, February 22, 2021 5:34 PM
> > > To: Sai Pavan Boddu <saipava@xilinx.com>; Markus Armbruster
> > > <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
> > > <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
> > > <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel
> > > Stanley <joel@jms.id.au>; C=E9dric Le Goater <clg@kaod.org>; Vincent
> > > Palatin <vpalatin@chromium.org>; Dr. David Alan Gilbert
> > > <dgilbert@redhat.com>; Thomas Huth <thuth@redhat.com>; Stefan
> > > Hajnoczi <stefanha@redhat.com>; Peter Maydell
> > > <peter.maydell@linaro.org>; Alistair Francis
> > > <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>; Luc
> > > Michel <luc.michel@greensocs.com>; Paolo Bonzini
> > > <pbonzini@redhat.com>
> > > Cc: Sai Pavan Boddu <saipava@xilinx.com>; qemu-devel@nongnu.org;
> > > qemu- block@nongnu.org
> > > Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
> > >
> > > On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
> > > > From: Vincent Palatin <vpalatin@chromium.org>
> > > >
> > > > Add new block device type.
> > > >
> > > > Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> > > > [SPB: Rebased over 5.1 version]
> > > > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> > > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > > Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > ---
> > > >  include/sysemu/blockdev.h | 1 +
> > > >  blockdev.c                | 1 +
> > > >  2 files changed, 2 insertions(+)
> > > >
> > > > diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> > > > index 3b5fcda..eefae9f 100644
> > > > --- a/include/sysemu/blockdev.h
> > > > +++ b/include/sysemu/blockdev.h
> > > > @@ -24,6 +24,7 @@ typedef enum {
> > > >       */
> > > >      IF_NONE =3D 0,
> > > >      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD,
> > > > IF_VIRTIO, IF_XEN,
> > > > +    IF_EMMC,
> > > >      IF_COUNT
> > > >  } BlockInterfaceType;
> > > >
> > > > diff --git a/blockdev.c b/blockdev.c index cd438e6..390d43c 100644
> > > > --- a/blockdev.c
> > > > +++ b/blockdev.c
> > > > @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] =3D {
> > > >      [IF_SD] =3D "sd",
> > > >      [IF_VIRTIO] =3D "virtio",
> > > >      [IF_XEN] =3D "xen",
> > > > +    [IF_EMMC] =3D "emmc",
> > > >  };
> > >
> > > We don't need to introduce support for the legacy -drive magic.
> > >
> > > -device should be enough for this device, right?
> > [Sai Pavan Boddu] I was seeing to use -device for emmc. But I see we an=
yway
> need blockdev support for this, which would require us the use -drive.
> >
> > Can you give some pointers, how to approach this ?
>=20
> It is probably not necessary to add a new IF_ constant. Would this work:
>=20
>   -drive if=3Dnone,id=3Demmc0,file=3Dtest.img,format=3Draw
>   -device emmc,...,drive=3Demmc0
[Sai Pavan Boddu] Great, this works for me.
>=20
> Or the more modern:
>=20
>   -blockdev node-name=3Demmc0,driver=3Dfile,filename=3Dtest.img
>   -device emmc,...,drive=3Demmc0
[Sai Pavan Boddu] Thanks, I would try to follow the modern approach then!

Regards,
Sai Pavan
>=20
> ?
>=20
> (The syntax might need small tweaks but is shows the general idea.)
>=20
> Stefan

