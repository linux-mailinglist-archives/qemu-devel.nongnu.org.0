Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6732B342
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 04:54:32 +0100 (CET)
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHIal-0007cQ-46
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 22:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lHIZm-00074l-1E; Tue, 02 Mar 2021 22:53:30 -0500
Received: from mail-co1nam11on2057.outbound.protection.outlook.com
 ([40.107.220.57]:33633 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lHIZj-0004nu-Ec; Tue, 02 Mar 2021 22:53:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OouNq11LbNvAO8/pDS0MaAS+tiTBXz3IqkZxfBXo4pSId0rAeFjYrLnAlrbpIHuTEyhl4k6Xq2icu80catOqyng7DCikwx5fRooH4VKdJLOWCoQWwiCvJg8Nh8pXc00AywxOBU5F40dp3z0gIKSGmICEUH3hRG+3H3FYIhFvnBesYWL9UIjLBu6/dQlHAC2aAV3onn64Ib42Ilo7ZAu4P2kdWhgnWIyuEHNT44/LaGwbmKkn1UqGqStpzyBXh7rfws9n8OK5ZQsGUDAP15VwkcJ6xaxNkGoOdDuX0TSgCcfPhL5EPU7ZLg/7UxSQWFqWVFfgi0smoPA6yQeaSxud1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMWdL5C0nErpan4jnffAUr7iPuz1BSklC5A2sOfnv6c=;
 b=AlD0hBJAxhywMHZYLkihWstDAMNK0V45agGUPVhN+GFzdmeCYzL7ZdCiTE77vKHKnTXx8hpIY/U+4z4kewZiY4Z/20y82nifaOoQX5dzx4dRCbOF8FRYHX4dZSx8KgRQJ1dLpMAFnHeXzfevS3T3dVZRg2BtF9pKW4+OjZYrPJTx7Sn/mWxK8EnZSMq+Vl7RS1+iHln2yi7oZxv2ZgY+4jspj1FaGtVHa9hXApYsNe0qYE5aOr4MIl/bMr1rJjmFTwxpNQdILTym8rret+03ZUlxMshmpzObeL4etGLPovugwsG+dc07oVt6xsYnkxF8gRvzobLdJ2owkvLcd6TYRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMWdL5C0nErpan4jnffAUr7iPuz1BSklC5A2sOfnv6c=;
 b=BEqq46Gnm+EOd5IJI6K39G35L9L9ulIcj7qXoGaKB1xwC49MrOIASUkGNSj6nPoHiYUI92VfWrGnnBAD2NLI18/GY/1Ja6LmTrAmR4XtOCPXxMtlbJuhxAmIN+omZQ0wzMQNOJ5tfaEATExFCW1hU6b+vLC7GokdaKnZrRyPr3g=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by SJ0PR02MB7453.namprd02.prod.outlook.com (2603:10b6:a03:29b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 03:53:21 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::9452:d0d8:c17b:a3d6]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::9452:d0d8:c17b:a3d6%8]) with mapi id 15.20.3890.030; Wed, 3 Mar 2021
 03:53:21 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH v3 12/21] sd: emmc: add CMD21 tuning sequence
Thread-Topic: [PATCH v3 12/21] sd: emmc: add CMD21 tuning sequence
Thread-Index: AQHXDggHye5GBINTTkmMK2O3MMJ9tqpu8xKAgAKxq2A=
Date: Wed, 3 Mar 2021 03:53:21 +0000
Message-ID: <BY5PR02MB6772300E84C0553278094EBDCA989@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-13-git-send-email-sai.pavan.boddu@xilinx.com>
 <YDzFEZvgF5aj4qrw@work-vm>
In-Reply-To: <YDzFEZvgF5aj4qrw@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 02d3906d-d22c-4c6b-673d-08d8ddf7e378
x-ms-traffictypediagnostic: SJ0PR02MB7453:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB74530B0F432DF1C46E4F6A33CA989@SJ0PR02MB7453.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hb16qZmvSIILJgdX65IrgrYRLdtTR4JSE2E8WJhIttm6CENfeYL92gj/LONXhmVrx3Uv/0JBcRJDxRjMAKOhiofawUx2xL7B/nMXNTlctikxQA+k9CIghniWlgSPhrFBEyVJO40DO8ymVCL61FV9QtebE+iEAn2Bc0xU70tv5JkXN6lw4BkiiIg9QpsIeumw1MPf/NRf2hFAySPYEijVMxQ3so1DYzFJDesOE9gJPnb+Ct9dRPdoR4uiShqEOfjNcjuJihQOhjsb5a6ONHK7STS/NrGYgrDrIi1LpsTVnhu1NNGoopIyZFdtI/SBXJGIGN7TYkEfvxE9i/qeJRi8v4P/hUKkJxhNoUpr1MsQPya/VqYrttE92S74B9woTCm8B8e7TgKdPTp9q7IDZeWhBYMbLNEjSOnbIH5XLezmxaoXW5d6IqVUkICLsvl14+VAA3MlOgk5iEhyC/t1H8AG2jbLo/yXTfHNf5RmrDu9r6gBRNyTePWx+stgms6MbdtSuvmCktV1MXs7BG7XY4DlDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39850400004)(7416002)(76116006)(83380400001)(316002)(9686003)(186003)(4326008)(6916009)(54906003)(55016002)(52536014)(53546011)(86362001)(26005)(33656002)(6506007)(66946007)(478600001)(7696005)(8936002)(8676002)(64756008)(71200400001)(2906002)(66446008)(66556008)(66476007)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?yQdJqL+ZQNuL1qp5G5jtg4sKbUEDEvBGCIoyXGkcw0u4bhEBZ1r3xxCaEz?=
 =?iso-8859-1?Q?v1IpeK0dzElNIcKBC6Am92hmnAQvUkgCvbf1jJ0BxeqA0twqauojMl7Jly?=
 =?iso-8859-1?Q?Z1Og/3oTovy2T5qwZmkrax3SzdsUqvcSa9CjsOB5Fwa1sd+RCcErati2ce?=
 =?iso-8859-1?Q?yBAH/OZJ8uLJjbaM81jiAqlBXkpJZd4wAZP8RFJKdLor89/fk5mlCraf51?=
 =?iso-8859-1?Q?OhmandcXyMcl3OGhfo+d24+d/057Fz15Umg8NOTxmBrzXblY5SchWkDBYW?=
 =?iso-8859-1?Q?soflRF78Z+UGstRztp0hD95N8qgX4woWAImPCW6ifR0Vky+pQZ4H2U6dx7?=
 =?iso-8859-1?Q?BbeGAWb7aCVLOpG9zNiFcJgsW2uY7QCRbYj26FBFXSeBCvimygPslbqYNG?=
 =?iso-8859-1?Q?oU6ZA+gAKRTqPHwltqcBYnBLee8NyePZ0rDoVWpFGYzGGmrmR2FhJJH8kx?=
 =?iso-8859-1?Q?FLbbFExZs//3gMhz1AfP77Nm4ObB0zPqMpHb55RzgnDSrU3Ozrn/DTJnMB?=
 =?iso-8859-1?Q?GcMgqTJ4qhWbuS/6+swq/VxaQ0xsZ0nGKRbUK0eFD/mGi5YkXaouuK+/1p?=
 =?iso-8859-1?Q?OIb3ZvBhQXOl63e16laeLvZCUsQLDaJVgGbSkXgdnvAz/pAiRt6HZcEeCM?=
 =?iso-8859-1?Q?izXdcQLDmVChZLjW40oUcqwQHRLzQpuL8+9lwWMyV71vHtj5UQ4XUKIYCO?=
 =?iso-8859-1?Q?EvQ66SMHxvwbqfkpP4eIyL01LhO0Bu+VyT8gGV3Rp0wTs4OS7bvHoa6D4S?=
 =?iso-8859-1?Q?5yW2d/WoddPsYYZMi5jED5kti6CVRAE9/vA8F6ZL9GdsI1WjBJ0Pg/YAX0?=
 =?iso-8859-1?Q?WgYDOFEOlyqIAXB9E8lWuiKOlsvUnPP5PgSfQ/JYejf6+A9obUpQ+K9MfR?=
 =?iso-8859-1?Q?ElGmnmGYoUvBBejtH1V0CB/BNVrGOTnC/9dVPd7OJaiD+xOEdGQnDiWE50?=
 =?iso-8859-1?Q?dnx0DqFV+wU8BWzXorEbQjNxFvIeRRMH2vxSCMpqGo1iVCjoS/qLLMArkp?=
 =?iso-8859-1?Q?xAbGjeIAdzhJ5+zZk8yHS0bXX6NBQJmxEqo3IBCoZCtpdu9GGsEHPwoPq2?=
 =?iso-8859-1?Q?KAeIs9x6W/oiqUb9ij7EiuorXbRCXnfZKzVgVrE1ydk/AOVnDn4XRaYOew?=
 =?iso-8859-1?Q?sPzbrabOqVUoo65fK6ZTt1C8Bl04mYKsW2gOIAbrJyP9RNG64bfEuUsHXe?=
 =?iso-8859-1?Q?VMBnRF7OHfGYUTDZ+lmc9l/7mx2OoU1vbIDbxmyAhgXPbFCtm1x3Nbv//U?=
 =?iso-8859-1?Q?ntg3Ch33NYWjM6yopBKUeBPor07vDciPRKs98dMDZX9LHaJOFv8yoh4SbZ?=
 =?iso-8859-1?Q?D1bjIqV1QAZtxnWB9IpnV3v1Vwb6BkpXS6wElca7yTv8bMTW4BvXr7AQ0y?=
 =?iso-8859-1?Q?lFJqkffher?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d3906d-d22c-4c6b-673d-08d8ddf7e378
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 03:53:21.4679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8meIM3wu687vOv9v5rWny4aDDUUoL/9on2XzjHXersjgccCoqmbsKanA4DEfGgK7o67Sp5K6Mgm3qUxASCUGBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7453
Received-SPF: pass client-ip=40.107.220.57; envelope-from=saipava@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
 Vincent Palatin <vpalatin@chromium.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>,
 =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Monday, March 1, 2021 4:12 PM
> To: Sai Pavan Boddu <saipava@xilinx.com>
> Cc: Markus Armbruster <armbru@redhat.com>; Kevin Wolf
> <kwolf@redhat.com>; Max Reitz <mreitz@redhat.com>; Vladimir Sementsov-
> Ogievskiy <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>;
> Joel Stanley <joel@jms.id.au>; C=E9dric Le Goater <clg@kaod.org>; Vincent
> Palatin <vpalatin@chromium.org>; Thomas Huth <thuth@redhat.com>; Stefan
> Hajnoczi <stefanha@redhat.com>; Peter Maydell <peter.maydell@linaro.org>;
> Alistair Francis <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilin=
x.com>;
> Luc Michel <luc.michel@greensocs.com>; Paolo Bonzini
> <pbonzini@redhat.com>; qemu-block@nongnu.org; qemu-devel@nongnu.org;
> Sai Pavan Boddu <saipava@xilinx.com>
> Subject: Re: [PATCH v3 12/21] sd: emmc: add CMD21 tuning sequence
>=20
> * Sai Pavan Boddu (sai.pavan.boddu@xilinx.com) wrote:
> > eMMC cards support tuning sequence for entering HS200 mode.
> >
> > Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  hw/sd/sd.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> > index bf963ec..174c28e 100644
> > --- a/hw/sd/sd.c
> > +++ b/hw/sd/sd.c
> > @@ -1386,6 +1386,14 @@ static sd_rsp_type_t
> sd_normal_command(SDState *sd, SDRequest req)
> >          }
> >          break;
> >
> > +    case 21:    /* CMD21: mmc SEND TUNING_BLOCK */
> > +        if (sd->emmc && (sd->state =3D=3D sd_transfer_state)) {
> > +            sd->state =3D sd_sendingdata_state;
> > +            sd->data_offset =3D 0;
> > +            return sd_r1;
> > +        }
> > +        break;
> > +
> >      case 23:    /* CMD23: SET_BLOCK_COUNT */
> >          if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
> >              break;
> > @@ -2120,6 +2128,30 @@ static const uint8_t
> sd_tuning_block_pattern[SD_TUNING_BLOCK_SIZE] =3D {
> >      0xbb, 0xff, 0xf7, 0xff,         0xf7, 0x7f, 0x7b, 0xde,
> >  };
> >
> > +#define EXCSD_BUS_WIDTH_OFFSET 183
> > +#define BUS_WIDTH_8_MASK    0x4
> > +#define BUS_WIDTH_4_MASK    0x2
> > +#define MMC_TUNING_BLOCK_SIZE   128
> > +
> > +static const uint8_t mmc_tunning_block_pattern[128] =3D {
> > +       0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00, 0x00,
> > +       0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc, 0xcc,
> > +       0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff, 0xff,
> > +       0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee, 0xff,
> > +       0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd, 0xdd,
> > +       0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff, 0xbb,
> > +       0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff, 0xff,
> > +       0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee, 0xff,
> > +       0xff, 0xff, 0xff, 0x00, 0xff, 0xff, 0xff, 0x00,
> > +       0x00, 0xff, 0xff, 0xcc, 0xcc, 0xcc, 0x33, 0xcc,
> > +       0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc, 0xcc, 0xff,
> > +       0xff, 0xff, 0xee, 0xff, 0xff, 0xff, 0xee, 0xee,
> > +       0xff, 0xff, 0xff, 0xdd, 0xff, 0xff, 0xff, 0xdd,
> > +       0xdd, 0xff, 0xff, 0xff, 0xbb, 0xff, 0xff, 0xff,
> > +       0xbb, 0xbb, 0xff, 0xff, 0xff, 0x77, 0xff, 0xff,
> > +       0xff, 0x77, 0x77, 0xff, 0x77, 0xbb, 0xdd, 0xee,
>=20
> Where does this magic pattern come from?  Is it part of some spec?
[Sai Pavan Boddu] Yes its part of JEDEC eMMC spec. It's the tuning sequence=
 for HS200 mode.

Regards,
Sai Pavan
>=20
> Dave
>=20
> > +};
> > +
> >  uint8_t sd_read_byte(SDState *sd)
> >  {
> >      /* TODO: Append CRCs */
> > @@ -2213,6 +2245,21 @@ uint8_t sd_read_byte(SDState *sd)
> >          ret =3D sd_tuning_block_pattern[sd->data_offset++];
> >          break;
> >
> > +    case 21:    /* CMD21: SEND_TUNNING_BLOCK (MMC) */
> > +        if (sd->data_offset >=3D MMC_TUNING_BLOCK_SIZE - 1) {
> > +            sd->state =3D sd_transfer_state;
> > +        }
> > +        if (sd->ext_csd[EXCSD_BUS_WIDTH_OFFSET] & BUS_WIDTH_8_MASK) {
> > +            ret =3D mmc_tunning_block_pattern[sd->data_offset++];
> > +        } else {
> > +            /* Return LSB Nibbles of two byte from the 8bit tuning blo=
ck
> > +             * for 4bit mode
> > +             */
> > +            ret =3D mmc_tunning_block_pattern[sd->data_offset++] & 0x0=
F;
> > +            ret |=3D (mmc_tunning_block_pattern[sd->data_offset++] & 0=
x0F) << 4;
> > +        }
> > +        break;
> > +
> >      case 22:    /* ACMD22: SEND_NUM_WR_BLOCKS */
> >          ret =3D sd->data[sd->data_offset ++];
> >
> > --
> > 2.7.4
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


