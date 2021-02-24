Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E6432449C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:28:42 +0100 (CET)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzpx-00081r-Eh
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEzb2-00053J-7o; Wed, 24 Feb 2021 14:13:20 -0500
Received: from mail-dm6nam11on2076.outbound.protection.outlook.com
 ([40.107.223.76]:2017 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lEzaz-0000rJ-1K; Wed, 24 Feb 2021 14:13:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWwU8xUI/KNXFsl9lRp0SxwtXZfUyNdUBifpbIvj9X2o04+7qm5GfoyJo4RuUjQdg/wt1HhqKhtk6miIbqJUm1WuxL2HWEVOZLQe9l4x9bKf6Lrf4m+vkIRTwDyjdNG93eRd8dyQ/ofEDs+ImvZEU3CVGp6BL1vXCOdJThkXVnjKmTdc1wbZ44NBb9sK3VS29MEunGzzFqIXjYSWdLlnrFbpvJYlwqnhHzdEuNXV0/Li2j59JaoBAID9wN2rCZDcQztmZcGfdAVYyuB7T7hHiVda6mVDStU4pbrOYyhO33p4w43aXcE2K4n5ANV3pZj01+Rt4skzv48kZJVg7fBrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atC8V9pA6zM/PONR8IYfDnpTLbUdixCeKLagWrChazc=;
 b=SpqUOtSESLwZjpKjwB+OzY4fEH7JxvBcS+havIPGHX3RYQKdHwUuUjvFFtWFzoGO/xcKqomffTAqJGToYfxL8jYY+e1+Y8mW0rM7VUl9lmikjIczJolSNnpfYUXqmv5qztiZcgx1rNDwvOPENEuCMWNNvU6UDr4GNbYhdZL12G1UHKVtoZ6WM+6p7jCkOzuy+zwX05Z83ybgwvtjlqCRBDls+W6w05BIzA6joR+HNL+qM92EyGovum7eitI6sX5Doe8qeb+h9g/+x3os6Hr89iBdjv7cZbJmxiXWNVgx38pJtRslE8XadzWQjmkIM0bEEI2scf1F+aPKYfkL2VcJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atC8V9pA6zM/PONR8IYfDnpTLbUdixCeKLagWrChazc=;
 b=jTvru43//nJlCK/HOYUWgiSAHDNbzvgPB2JGF+mivp684nWI2+wFQfpw8inGCKB97YkR3gmLIVVESKkuL5JC2pUdTH/9i7xPKwVRDGp2P49w5VdXlZkYSF/gTpVmTcoFtN59I3bhLiHxZzRz2wnE3yh84dppvqwIu81uEGGRjUg=
Received: from CH2PR02MB6774.namprd02.prod.outlook.com (2603:10b6:610:a8::18)
 by CH2PR02MB7079.namprd02.prod.outlook.com (2603:10b6:610:82::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 19:13:10 +0000
Received: from CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::fddd:4746:8bef:bd2]) by CH2PR02MB6774.namprd02.prod.outlook.com
 ([fe80::fddd:4746:8bef:bd2%9]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 19:13:10 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: RE: [PATCH v2 01/22] block: add eMMC block device type
Thread-Topic: [PATCH v2 01/22] block: add eMMC block device type
Thread-Index: AQHXCPMCc9P7MYpy7UqlbMux6TiW26pkE7eAgAHtmfCAATB3AIAAJaGAgABXtjA=
Date: Wed, 24 Feb 2021 19:13:10 +0000
Message-ID: <CH2PR02MB67742411A5C6595E2D6703DACA9F9@CH2PR02MB6774.namprd02.prod.outlook.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-2-git-send-email-sai.pavan.boddu@xilinx.com>
 <3c229241-fdc5-a445-d96e-ca16a5c0106b@redhat.com>
 <BY5PR02MB6772EEE95845BAD093CAC972CA809@BY5PR02MB6772.namprd02.prod.outlook.com>
 <YDY7KKI1Xme29UlQ@stefanha-x1.localdomain>
 <5c7cd4cd-ffe0-fa5d-5a9f-96bc07d7b037@kaod.org>
In-Reply-To: <5c7cd4cd-ffe0-fa5d-5a9f-96bc07d7b037@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6853ed0-fac8-49dc-d7af-08d8d8f8397f
x-ms-traffictypediagnostic: CH2PR02MB7079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB7079539C844FF41B3566FD0DCA9F9@CH2PR02MB7079.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cKN76s6nupyXStqSPm8YbcZ/rE7LA4Jg7iIFaI9WUQL033o/dSOCt/ETrVPIz03boDoQc4UQFr1ksXsYDWFglSngWuKHEs6ucdGAT5o9r/mL2pLU4wKA2eNPJVtZJfpSrS/w7ZvqFUtwxWwTXxIdpKbykl14S3D4OGcMerDqRU8As3va0ScWlZLGf/UI11b4InzOIlpbVtvF2RuT4pzqYUCbDgmbFqVZ0sGgzmw/fSJLjlJ7ARgB5eTJP76Vg684BvA1aMZSPbt8TREgnRU9IoKPvt320YBssXgnbS+xeLWd5NvFet6kblhyQdDmSrcCBoMKNs+lOT/sKCK5aZi2JRV+RS4bNJQRq/ZUuQ92HM9w+P3IDcwNZfHBxMtNG6Qv4HzBfhSh+rSccyzAsDSXY6Uboof0nNcwQirPyNatfCbWo8s1AdIgbgfhkxLVylEPKYF79xB9+BvbgK9+8wORWjOqDG1oadFh/A0BmW/CxV82fSXuELoJVT5Uq/mkpVrxCwkuxK8aTKRXGs1MK6yyfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR02MB6774.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(5660300002)(76116006)(26005)(66476007)(53546011)(110136005)(2906002)(4326008)(55016002)(33656002)(64756008)(66946007)(66446008)(71200400001)(83380400001)(316002)(52536014)(66556008)(54906003)(7416002)(66574015)(86362001)(478600001)(8936002)(6506007)(9686003)(186003)(8676002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?MD10JYARCksaUFakwmNwWmljPUJ7ZVgj6XkD3shpj9LoyY+8hn/x6cl+hg?=
 =?iso-8859-1?Q?d858XY/k+Kr5IQOkY3/leSy1XpyxFUUUJMuuzeP46GtO0X/mWfNYU5nLQ0?=
 =?iso-8859-1?Q?/vTsXadPNTVTVpsAKICNYrhhv8KwoVlF8ipX3iubTq2ApfqFjnqgRKU2Kv?=
 =?iso-8859-1?Q?kl49Oy6/oalmhNCFDYaNEPFpRHPs5c/AOaohXBHSvBTEL6+IEy8mdJ86Gj?=
 =?iso-8859-1?Q?eO+BJn/Gak0yivm2thE83khseOZ+LgxCGRRdUO0Ff1z7fqud7cKYkBQvI7?=
 =?iso-8859-1?Q?hlnIl6oKoMhCPB/p4OL/sECrNpM0hBKKjuKUMMKBXhbKMmnecmGxUNDA7U?=
 =?iso-8859-1?Q?RLhutjzC4cabmDXS57gGYOGjGqW2/pvHUZcJQQh9WG5NTrc5lTtfr3Uoao?=
 =?iso-8859-1?Q?1qbNrHP51RPXyhFf0pOvmGHGHwauVFeYFxaQ8fPco91wQkFXYoa4g71TiX?=
 =?iso-8859-1?Q?pJHxjrhjVFO15yKf2KbtiKO+x+faA3SJeHxqSLh7ZrIVexc5ayiUjH2PbU?=
 =?iso-8859-1?Q?S0rJ7+GWBMciMxq91bUSrZLzjBq+ByfSIfXSWWSgxEsY9CDmqL3nF1YTsQ?=
 =?iso-8859-1?Q?Au0SApvMVITPhMhXbfMQ08SIa8gVuUXQRfjedTy3H48f3+k/1DvGQtH357?=
 =?iso-8859-1?Q?zCaMf4ULUGN8HTB+vFgSxUKy3hLzf357LhESWCrIgEG1E6RUDIabNtbWF0?=
 =?iso-8859-1?Q?KgzWe5vix4h2hDLJTXHzSLUkZi8sn9mheyifgGydbHv22QbPYAHhEePty2?=
 =?iso-8859-1?Q?blk/KmLpgdgSIPkPx6V8oaOvWMDm5p1l86pystDTif93VAH8gAvsizADlW?=
 =?iso-8859-1?Q?WDapbqRtr97KGS5Wvsd/0Y9V5gPFQFj/2lSs+TODRL7o5R4K9eXOHMfna7?=
 =?iso-8859-1?Q?qotEH0aYllMpHeQOrGRAWuovVIGUX4InrOnhfivTkOXruF9ftgrAIGeMD7?=
 =?iso-8859-1?Q?ncz2e5DVf/hLRn9hm/eYKn/WE8C/1ZYI7FbflF9RkfolRIkytFVFflo4FK?=
 =?iso-8859-1?Q?YFypCQbn+xuXwT53yJ0wItot2MUXJYy87YSy/ZHwhZLcNV5Xh3STRlLPdz?=
 =?iso-8859-1?Q?PjmeWrNCFxXtRBEUrxmq7lRe2U3UZuzzI2ESsPtFStAWN4xUcsv28fZpCz?=
 =?iso-8859-1?Q?bb0gB9mjCHPfcYhThhW9m6MOQ94bMRqZsMxPXTc91f7yqgpE3d0e1Hhpjw?=
 =?iso-8859-1?Q?oLotLJYbPOlRtt3ASMWRcVW4ozGrLFnuYwAKJKGlblzhd389scgqDv+sam?=
 =?iso-8859-1?Q?rVyccrHBFuSUzCdCZd9IjEi95p4NTP/3LD4tJln8kby+wgezdaEO9HxwmV?=
 =?iso-8859-1?Q?tumHJ+Olw5zMcDDzbMqkd/P8mjS0JoCHWdrsSHHQBzVecOO5R007J729xM?=
 =?iso-8859-1?Q?uEbJlrIUND?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR02MB6774.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6853ed0-fac8-49dc-d7af-08d8d8f8397f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 19:13:10.0476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YU82DYyazLOJPO6su1Olpp8V7f1L8VLwL056pmQlSLGUzEv5jqQwIuiXXxLGWOR15lXq5DJ/D6/PqGB9qoTR/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7079
Received-SPF: pass client-ip=40.107.223.76; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cedric,


> -----Original Message-----
> From: C=E9dric Le Goater <clg@kaod.org>
> Sent: Wednesday, February 24, 2021 7:25 PM
> To: Stefan Hajnoczi <stefanha@redhat.com>; Sai Pavan Boddu
> <saipava@xilinx.com>
> Cc: Philippe Mathieu-Daud=E9 <philmd@redhat.com>; Markus Armbruster
> <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
> <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel Stanley
> <joel@jms.id.au>; Vincent Palatin <vpalatin@chromium.org>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Thomas Huth <thuth@redhat.com>; Peter
> Maydell <peter.maydell@linaro.org>; Alistair Francis
> <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>; Luc Miche=
l
> <luc.michel@greensocs.com>; Paolo Bonzini <pbonzini@redhat.com>; qemu-
> devel@nongnu.org; qemu-block@nongnu.org
> Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
>=20
> On 2/24/21 12:40 PM, Stefan Hajnoczi wrote:
> > On Tue, Feb 23, 2021 at 05:35:20PM +0000, Sai Pavan Boddu wrote:
> >> Hi Philippe,
> >>
> >>> -----Original Message-----
> >>> From: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >>> Sent: Monday, February 22, 2021 5:34 PM
> >>> To: Sai Pavan Boddu <saipava@xilinx.com>; Markus Armbruster
> >>> <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
> >>> <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
> >>> <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel
> >>> Stanley <joel@jms.id.au>; C=E9dric Le Goater <clg@kaod.org>; Vincent
> >>> Palatin <vpalatin@chromium.org>; Dr. David Alan Gilbert
> >>> <dgilbert@redhat.com>; Thomas Huth <thuth@redhat.com>; Stefan
> >>> Hajnoczi <stefanha@redhat.com>; Peter Maydell
> >>> <peter.maydell@linaro.org>; Alistair Francis
> >>> <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>; Luc
> >>> Michel <luc.michel@greensocs.com>; Paolo Bonzini
> >>> <pbonzini@redhat.com>
> >>> Cc: Sai Pavan Boddu <saipava@xilinx.com>; qemu-devel@nongnu.org;
> >>> qemu- block@nongnu.org
> >>> Subject: Re: [PATCH v2 01/22] block: add eMMC block device type
> >>>
> >>> On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
> >>>> From: Vincent Palatin <vpalatin@chromium.org>
> >>>>
> >>>> Add new block device type.
> >>>>
> >>>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> >>>> [SPB: Rebased over 5.1 version]
> >>>> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> >>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >>>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >>>> ---
> >>>>  include/sysemu/blockdev.h | 1 +
> >>>>  blockdev.c                | 1 +
> >>>>  2 files changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> >>>> index 3b5fcda..eefae9f 100644
> >>>> --- a/include/sysemu/blockdev.h
> >>>> +++ b/include/sysemu/blockdev.h
> >>>> @@ -24,6 +24,7 @@ typedef enum {
> >>>>       */
> >>>>      IF_NONE =3D 0,
> >>>>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD,
> >>>> IF_VIRTIO, IF_XEN,
> >>>> +    IF_EMMC,
> >>>>      IF_COUNT
> >>>>  } BlockInterfaceType;
> >>>>
> >>>> diff --git a/blockdev.c b/blockdev.c index cd438e6..390d43c 100644
> >>>> --- a/blockdev.c
> >>>> +++ b/blockdev.c
> >>>> @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] =3D {
> >>>>      [IF_SD] =3D "sd",
> >>>>      [IF_VIRTIO] =3D "virtio",
> >>>>      [IF_XEN] =3D "xen",
> >>>> +    [IF_EMMC] =3D "emmc",
> >>>>  };
> >>>
> >>> We don't need to introduce support for the legacy -drive magic.
> >>>
> >>> -device should be enough for this device, right?
> >> [Sai Pavan Boddu] I was seeing to use -device for emmc. But I see we
> anyway need blockdev support for this, which would require us the use -dr=
ive.
> >>
> >> Can you give some pointers, how to approach this ?
> >
> > It is probably not necessary to add a new IF_ constant. Would this work=
:
> >
> >   -drive if=3Dnone,id=3Demmc0,file=3Dtest.img,format=3Draw
> >   -device emmc,...,drive=3Demmc0
> >
> > Or the more modern:
> >
> >   -blockdev node-name=3Demmc0,driver=3Dfile,filename=3Dtest.img
> >   -device emmc,...,drive=3Demmc0
> >
> > ?
> >
> > (The syntax might need small tweaks but is shows the general idea.)
>=20
> Yes. This is better.
>=20
> We could have an "emmc" device inheriting from "sd-card". The "emmc"
> property would not be necessary anymore and may be, we could cleanup up
> some parts doing :
>=20
>     if (sd->emmc) { /* eMMC */
>         ...
>     } else {
>=20
>     }
>=20
> with SDCardClass handlers. the SWITCH_FUNCTION command is a good
> candidate, CMD8 also.
[Sai Pavan Boddu] Nice, this approach looks clean.
But we still may be depending on emmc property. Not sure!

I would get back with v3, your review on those patches would be great.

Thanks & Regards,
Sai Pavan
>=20
> C.

