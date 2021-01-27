Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B308A3067F9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:33:00 +0100 (CET)
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uJ1-0001sX-Q4
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6542a1e1f=Dmitry.Fomichev@wdc.com>)
 id 1l4uH0-0000YO-8J; Wed, 27 Jan 2021 18:30:54 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6542a1e1f=Dmitry.Fomichev@wdc.com>)
 id 1l4uGx-0007Dk-Ap; Wed, 27 Jan 2021 18:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611790792; x=1643326792;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PH6JcsyATlxyXNerF+F/+ewLWS1i2k8PrxJReS1EJxU=;
 b=Lujof9zTvfmMAsXJcA/OCH7/jh8MIrptxwbZZdph3tXdRENTJsuR5xFm
 efJKobxKqlkbbwueXFK0JARBVtfRMkcz2FqkEuKGjSQgl9oRx/36S3TCO
 6PJNbOvfJ9vmQzPlJOSqRxr69aaKCaOPqCAZG47cQvz34LIhhRGCqpzTS
 WvksfOm6m9NeDlRZmPKY2dswxaDOVAYRNjP5+q8nMNRffC/Vp22o7CiLm
 lu/ubb2MhtlpiukexfP8Ods7L2ecITxS/vGi0C8vzJ9nE7L2amWBHAwRE
 sn9SUIpUx+E812GQDiVgXRlkBbrFE9HxB2UtR9sbC6MKHMEJkDXwLA8T1 Q==;
IronPort-SDR: /VHePd6x1XqX8PZCd051bF1idAt1avzeTW0mmNTY3F3MWdHmiZVPR/6x5Ls8xl8BNfpRW99jmH
 4xdgldnVLfLt0+Icy6i8Mnb68jDoFFkP7sdK5b1BIqKfYmVXrJykLOTMhe0iRTxMa8FUs/7tdn
 l0S+qC0PzAdenMLXoDWDK4678i4E8FYmnrGhJ+3GWRSrm8O+rSSWxkTxBhXO+xH43fEJxXBBVH
 npqbupDhTmPoxiAw17pXdb0I5vchu1a1oCivOXisZR8iDyodpj6IohgqcAndWLscnhlMGqP+iH
 f/4=
X-IronPort-AV: E=Sophos;i="5.79,380,1602518400"; d="scan'208";a="262517755"
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 07:39:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pr/x0erY0x3pe8NRoL8nt2DynWysW3/KzQaqca0Cwvf/SRMXTJFgatGtQoJ+kgj28MLIhdRp45tkHI+DRGOq5Gg4okSrZ62ujcuSGdKVQalwe49FqC/mC6AbHClCZ3sSmrB5oekkNEvthyiZKhnxFUFN1OKJEoZnK6NwqZ3PYephkGe9ojq9Lu0YTCe3U7+XaLVfiTXmBUYTSRQdlr4VsLQdA1oyBy3Rcl17o2wJZf52kquZRQnkV00KtRFaaDoRkyzUrx2Q3ju3CsxlFyGmnt8pgvs6sOeFA5ihB10msoq/hw8gJGpwEzwYvO271OsGkO0uVp5BKupzrH1TlKr8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH6JcsyATlxyXNerF+F/+ewLWS1i2k8PrxJReS1EJxU=;
 b=J36g3xWLzN+qhNoKw9VTjXXbcmIY0dcv8+mLrszhpzh9LQhoHmi38ziu/XRKkO8vwCuyR1/7g4n/Oc/XzMUi67tCHMUtrvRKQqND9Hqb2flFJejiG7UNCn9ARB4TktJEzn7UvFDnb58jBKsRWldIZ76/GIHukMkhAGSGEh1jG+B+zR0hbL3bXgpps6JITj4VFprhTzdIeXa0h4X+Af1ZeFKNWzkHo830uC8pbjXWNeFhmssDnP3Aj1tEBIYZCz6grMvSTjAgGoNuxAtW9wkppXa1QJ9zY9+2VHciUqZGPVaDcd5K+SVXAvtxBCyBVTW13Y+6pgWhHPBNkobLwfFXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH6JcsyATlxyXNerF+F/+ewLWS1i2k8PrxJReS1EJxU=;
 b=wCkWK3jA09ikhRSmvi4qFUejDv6SbJiCac5sdoFBV0jgrK4rNTGGTOF/w+wqgYdUPQjoiXCCMoAU/dNPuSS2ih6glhdeK/MjeDDef9wSRlv3XiLBHQFkhA8gEOg7p0fKUEi9LnJqQhAv05G7mn59KZz1omPztFLMSeNfACKhWak=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MN2PR04MB5678.namprd04.prod.outlook.com (2603:10b6:208:3f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Wed, 27 Jan
 2021 23:30:45 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::e99b:29e0:c2df:8617%4]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 23:30:45 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Subject: RE: [PATCH 0/2] hw/block/nvme: zoned fixes
Thread-Topic: [PATCH 0/2] hw/block/nvme: zoned fixes
Thread-Index: AQHW7mq06uPlYAWtgE6/z7pGm8HsuKo7yrIAgABf1oA=
Date: Wed, 27 Jan 2021 23:30:44 +0000
Message-ID: <MN2PR04MB5951D0333F233F0155D9798EE1BB9@MN2PR04MB5951.namprd04.prod.outlook.com>
References: <20210119135500.265403-1-its@irrelevant.dk>
 <20210127174222.GB1816249@dhcp-10-100-145-180.wdc.com>
In-Reply-To: <20210127174222.GB1816249@dhcp-10-100-145-180.wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b252ea35-c4e9-4386-bc72-08d8c31b91c6
x-ms-traffictypediagnostic: MN2PR04MB5678:
x-microsoft-antispam-prvs: <MN2PR04MB56784CF996320FD2CF1109EFE1BB9@MN2PR04MB5678.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 15al4EEAgY5yVlfV7da8tjcEeLQEN7pGHaUybxSQKm+BW+IakKtsx3t4+uTDThnrQkewfDPDd2uPZhQqRsb1b37bMlzwn9Dj1AdrBLK7Cy8f2Z7ADZcqSY9WFk4Oqz2IZOwpfrERvarIK+tnb6xPpWE5TOzZrxRJAHXPbUfk4uto5HPTjJ3vO1cGnveM92+a0LHGWW8z2GXOtviE0XiSdevNwMFhvB8JMmaWk8yo1qs4VPYElOTGoQ7Qbp+SikSoRptBKivRFifcFfRibobp5ExbvNLzU7eP6tuEdjQRsxAFbWa83dkeEnRUZDkH5kRZ9nGFMWn4vCWBZwrFJurRIfGEMoZzMr6/qhdsv2XbSMnD5Uyri061MYgujhsSW2vggzw8kfTw/TnnEM3bOzp8mhj/bwGmuBmRBCY5oK/59IeTqHOOBuqCSzj505M2YQXz5mcVQHhLuS25khs7iE74ugk3FSBXeYyUF68Vmx8ng2Sh3NF4du+XR3wdnxQCI6UTYEwyTJB86u0kkcl97mb2qQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(7696005)(110136005)(54906003)(71200400001)(8936002)(2906002)(83380400001)(6506007)(53546011)(8676002)(86362001)(478600001)(5660300002)(33656002)(66946007)(66446008)(186003)(9686003)(66476007)(64756008)(76116006)(55016002)(316002)(52536014)(4326008)(66556008)(4744005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ysPqs5ioyO0FjWqVWsGF+Ix9cO11N5ToxHyQlhZN3OS1WzbzfyKyewHNU5D1?=
 =?us-ascii?Q?QSExquBBFIAadR+jobrdm1DETGz8SRD+pwL1OYhUWh93hP2/+26XLaIbHKu2?=
 =?us-ascii?Q?KzWrYsF8MUyIUd1TfiMvgjTEfJp/073FQMgsROhEqHK56f//FnjN+vQpdppq?=
 =?us-ascii?Q?DfRW2PnqkeI8/pO4h9tv9EuRnhRu1Dq/NJ83hOWPmL65XlxprjlPjnDNV8k6?=
 =?us-ascii?Q?uVhQSy4Jacu1lyIkYnKxN+ttKjA6pSRoyxWFPTqqdViwSR7QgVK6dg3msBMi?=
 =?us-ascii?Q?SC7s10cA7l3dA2yEJEyiwX2PzdAd9HWbxM9pzs15kg4LPrMR8+g2CNSqVJov?=
 =?us-ascii?Q?zbm0pYGmMt2fGNvTQTSOnbOhFAHpET9Uwf+xMRRqBWUw9/8CBYrfhPXD9oJo?=
 =?us-ascii?Q?qW2AirsZ4gYn712v0Zir+t9MBybSDw9a1DpnQ0Tww/W+J6Vr0Aa5A5nJKLK/?=
 =?us-ascii?Q?6mBaNOfLpwTQ7pJ7hJ781xGUwBjOz9C0BFcBYVPR84y5G5OnTTt0NZWNHaYC?=
 =?us-ascii?Q?SkMkp53Sn45QXS+A/zQTP2rZFhoq7jkK0oiNycSjucYC6gmKXJ86EJIQvZBG?=
 =?us-ascii?Q?BUGDbIwSyk2ISisRkqhh+LqcmgsRYKMoMN7eRENNZc0qA1qpx4WO2OV0YyuF?=
 =?us-ascii?Q?iLQoWmufbv5DYiNrD0aKrODXnsKA2cXl3bc740fZgc1BBotpJdxHxlCTPhjF?=
 =?us-ascii?Q?xle/at1+tE8EX3YqkmY2TyERCXCqrqq593Ciad/IGsKbTWlK5Kbi8UjP6F6h?=
 =?us-ascii?Q?EhSDEVVXE8ppn1NZm/gmTBnjCoTS0JkZ6cm2KnhmVxRzL/gmfx0UOQv5G16N?=
 =?us-ascii?Q?mJIcz8uPnmGlecGRyRgVcloOdOJvA87DjV1mk87quMwHO3FyTpNSaobumxwP?=
 =?us-ascii?Q?8/PKVmecNbega6gvpGXqVBpiPYZksPBxSiNMELGLcVLIXyof8fcqsYwtM1Me?=
 =?us-ascii?Q?iSmbKcmeuMi4aDPC5FcKlH9deGF8886BKCoLwxoNXggSoMFljHJ+sAKK4MpM?=
 =?us-ascii?Q?CCJGyjrxG+nM0nCAXvNWlzHAXTFpzSdOPkuGGQNOwEviloyZoRXcZ4q8LNG+?=
 =?us-ascii?Q?THIWfYcy?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b252ea35-c4e9-4386-bc72-08d8c31b91c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2021 23:30:44.9529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: egKrlG6ae40kbCaZxntn/iZuoTESgEXicX0OB3rPKGOwZD6LiN2kKJVSfZQK0G4z9MnumHTn+1wSGso6Opxwag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5678
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=6542a1e1f=Dmitry.Fomichev@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Keith Busch <kbusch@kernel.org>
> Sent: Wednesday, January 27, 2021 12:42 PM
> To: Klaus Jensen <its@irrelevant.dk>
> Cc: qemu-devel@nongnu.org; Kevin Wolf <kwolf@redhat.com>; Max Reitz
> <mreitz@redhat.com>; qemu-block@nongnu.org; Dmitry Fomichev
> <Dmitry.Fomichev@wdc.com>; Klaus Jensen <k.jensen@samsung.com>
> Subject: Re: [PATCH 0/2] hw/block/nvme: zoned fixes
>=20
> On Tue, Jan 19, 2021 at 02:54:58PM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Patch [1/2] fixes the zone append bug reported by Niklas. [2/2]
> > refactors the zone write check function to return status codes in a
> > different order if there are multiple zone write violations that apply.
>=20
> Looks good to me.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Besides aesthetics, I don't have any complaints about this series :)

Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>

