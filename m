Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6CA452475
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 02:36:28 +0100 (CET)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmnOd-0004Bj-KM
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 20:36:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnME-0003Kk-Sf; Mon, 15 Nov 2021 20:33:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:5242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnMB-0006UW-7C; Mon, 15 Nov 2021 20:33:57 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="233538753"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="233538753"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 17:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="604117562"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 15 Nov 2021 17:33:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 17:33:52 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 17:33:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 17:33:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 17:33:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkw70b+Lyp+MKIatP36DYr18UnQ0hW3ns0NSFF7lJGrkZC5gCNkieaiIhDKdYcdpsYYp0Q3//hCFmSyoEa2bokhSdbhBBSWDD9DM8O+pDEfWP12OQax4nsfneSA5dINtA/BjxOBB5fd/Vc5FwM/xOQFsF4cgnrj3Vpwgw9s81Xh8c67G1xI9zSvIEmCYWkfIMmUYThVjNzoqXYQB8MRmlJZfgE8QOpg5ZdAEB+NUcrev3mZky6jxpQYw2XAsLHHeWUwBKthASn9sp6cw2fE6ultiH78F9P5G4VDml5T+ji6aiVjLmlKSggtO7sH4YbD46hiegEzbrRlJ7KQmUZ8XlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZcD9Gh2KuklMILFa8unNfaveGziGTAI3b9Lg67wh0s=;
 b=KrROQzy5/zzKOZlJbVH6EdR/+kNzzS5adnO/6bNzigCoTA05jtYuzpfOpFP0Xsug5oEoDVDGjZJT/J4P4kWaPMxdFrl+XA/CsLksuRnHAHqvVuNRyGpFvx4oDKOzsc6eSfes+nPO78vMelaUXNomioRBtZzbEZwggfC1EKKw0AXlQ69cnL5Sy91dv5eqzicvnVnBQA6DR/PdSP1MmLt4H78CjHFNyaMGVgb2kimeR3OTxAR1ZXFXTd78ioTk8gIcXyzM34rYe8KUvwE5lgsCddl/N+Ygw4tC/DgB5e3+pcRtoVumCWpT+d6iZe6BAr5pPMB8/4/6WBbYXqwA0IKEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZcD9Gh2KuklMILFa8unNfaveGziGTAI3b9Lg67wh0s=;
 b=iy5HHxUju1s6K+aNXEnW2b+ape387MP5EZJAPn6MjImbC4euRWg1Mwav/MxhCOLH0AftVd5yS1GNJVck2Q1h3SfyqM+fJ2KnXn0V7pOg5qP+HK9cDGmTwcUBHlYE+icEHjg72ezcm6AFl7UJ4f9rvjXAuwqg34FKFCeQmfBJWhU=
Received: from BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18)
 by MN2PR11MB4518.namprd11.prod.outlook.com (2603:10b6:208:24f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 01:33:42 +0000
Received: from BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3]) by BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 01:33:42 +0000
From: "Qi, Yadong" <yadong.qi@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Thread-Topic: [PATCH 2/2] virtio-blk: support BLKSECDISCARD
Thread-Index: AQHX2dzbzzrtmm1d0kC8epzjRyQo16wEa3YAgAD0XQA=
Date: Tue, 16 Nov 2021 01:33:42 +0000
Message-ID: <BL1PR11MB5479F46D0D0D2A11B20D6AECE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-3-yadong.qi@intel.com>
 <20211115055630-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211115055630-mutt-send-email-mst@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88b26e56-e41e-46f6-00bb-08d9a8a11fb4
x-ms-traffictypediagnostic: MN2PR11MB4518:
x-microsoft-antispam-prvs: <MN2PR11MB4518B2DB9686A59D3CA61D61E3999@MN2PR11MB4518.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qXTQ5Ank8QOhf0mjsLKDC7oy8dnKr9xd0axRadmJC9QzZoeCB40/aoAv8QTrZH0Iy16R7xWPNRcoZzwRR57Yxji9HmR562BoqVvdirnn0CLNsufCge2J7ZWcqRVAB3lP1h6/ZTqa66lEDYNcesy/Coo5f08vLv+ttbwlplJ1d6XMpiGStVPaSIEVFTNq3UbTbGUzBNvpYx+vKieImO9wPDxHSLisylGcEsc16UH2wHvVT6tzypXSBozUSUJ7S265mp2kzQwUcwoKckrY7Rm4RINwYrcGPpdtkf0G9GxaYfubukUmwp9H5LXjjBTUZ+YSiEHpaL0udHWyJJ1kFY51UrDYVcbucwS12MZ3k2SS+ppx7eJGygX7ZlWlDFccVJ6EDQSvI7tP0vJHueFLpVtiw2nnf3m2PwQ0QYJDqJOZYY5bfEvrx6lgBboVC8kRr385LZE+iLofhBmWee5w3w9tGdeGz1ljflVqrQomIwng5S32Lr9Kn+SRFuiC59JIxdDEGQH7YwAgEAaXk7kXT+Jq4dPQpii/FBddoZl3n+01LcZigCd4nvqFnWZymKmAUTQ8fKR4qn7TfoSgLxHyzXOEO5zr38E7W5ZWG+dax5ZYm8cm9HVngS/5O/5NWuTGtoT+UcX1qc5oypDBML03yCMDCbAOp/O6m6HSG50eXGO7UnTeySRAa5YklNT47fPI5+Z8melBwyi/TN78Tb45Mww6mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5479.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(38100700002)(52536014)(8676002)(122000001)(54906003)(71200400001)(6916009)(5660300002)(186003)(4326008)(2906002)(316002)(9686003)(6506007)(86362001)(107886003)(508600001)(7696005)(26005)(66446008)(4744005)(55016002)(33656002)(66556008)(64756008)(66476007)(66946007)(76116006)(82960400001)(38070700005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2q/nSr3ZofncX3+N4nYpEMArgZKB9BUuNi3WrdW87+K/AULcb4Qg50HI2BRu?=
 =?us-ascii?Q?yecpMyFnGTSAZ9r05XiA9Q9Udt33aSvnEJjYtvOSiNO/sCpfU2iPVJhYN3XY?=
 =?us-ascii?Q?viPGOiHtXoETYCEEosDtm344cg7c/UHLJoxhZ4WpNVRL4qZpV+dbpTWZQiVI?=
 =?us-ascii?Q?RjZxw1VsPvlMYA5DUdlgkJfh5YnlfAPLSscmmakp0wf6kBNeTuArBmkKl8W2?=
 =?us-ascii?Q?0mzkdIIwMfTTEvlaPDUb1yl+lCunePbBB4kuM/mJ8HhaJZJOtfbpcUcDms3A?=
 =?us-ascii?Q?syz/nj2QD9bzd073IJy+MA6AA/0JusxCG1EgsFdkPyflW0KKZBn60c8IGjZE?=
 =?us-ascii?Q?EQGGodh9RBAn8XbILub2agUxc9BUrGNWPzhV8qe5TQSlfI5bWtPF5cOlbPOr?=
 =?us-ascii?Q?xv8fVbxRlCMEl1ZQid2b9S0ULUkFStR2jly+5T34pzKzQ4nRh+v/ZzNz9t2j?=
 =?us-ascii?Q?0lPELyRCvldkIBD6jWGVebHX18ZDnmNt9xoerpY3ijstPZxvYGuT2pl91MiI?=
 =?us-ascii?Q?7Or8piMI3K4eQU1ZKIZ3zpghdKEB68XIATjEzoNuH2Wvo3NrH/TamrmJiGbS?=
 =?us-ascii?Q?gUd91sdHbJZwugoX8up1L11NXEFuITkUNEnuPrVnc638ibgQn83JMMuUX29i?=
 =?us-ascii?Q?QWSLld1BhOPArra3njGd1xH+9fl2tBU/4EDiydITIO877jfe+cQC5a4zHRI0?=
 =?us-ascii?Q?BLRTVOXDpEogaWV2r08s+6Nt7crKKig9jHq2g0kbpK1OAmLC2rjkC9+oxaHD?=
 =?us-ascii?Q?aMob5icOauWLR1uL0yjNcPo25Coya2MBXCUhzkCytaJSX/gEaH5p7QbL7SZL?=
 =?us-ascii?Q?w9S3BYuUV26wnShJzFk/GQg8U+r7ICq7h53xY12dVGrv9ytOHah0E+t4pReU?=
 =?us-ascii?Q?20J6hKpnJpS5tiDK+WoMhXWRS1St9oT7WZhDNB6IU/HkCvaKqZKxFP/UEMXb?=
 =?us-ascii?Q?v2TJFanYlkwwJ4GQiSzA5xuenzUGRkYZEcuTL0kIXMwx4CbojQfxie4Hl/H/?=
 =?us-ascii?Q?814Ais0nutrMKIWTlqoHuZxDK9VoHPprIjoefVfvvUR2UYar+oVzm83cYWSJ?=
 =?us-ascii?Q?UGRiGi3eYpSv8cFd2H9pkSnUzThSiSTb1dClACtGC3wLz7Bn02nT9oOAjzG7?=
 =?us-ascii?Q?wborMS8uCF5WCqClcTldHGNKitm8YvflydfBiRxoKAT20O4T4cq5kbwGs5Z7?=
 =?us-ascii?Q?LWdGmo2rSWn1Ii4JRepv1Hrcn3gtei9C1witxVfuxPo6hOLxIBl9NMKEU+kk?=
 =?us-ascii?Q?2lk3u9ELPAouvjOLassAJBOcoicuOmGBD7EQrKDtOkVYfGZQli2PNegLqscT?=
 =?us-ascii?Q?MlmRlO4hm/lV1C5UbWJiFxDB2KUM3CN0l/Zo/G5c25dz1GvVGz0P7Ew1nZz3?=
 =?us-ascii?Q?AxABSoc4ctgbX0bEY5SaOs2oAI3CCrBqVe6c2K2EqLj1sHqhjrOPzx/6e3WF?=
 =?us-ascii?Q?zsnKyIpVRMSwCkSHxSk9Ha42T9bK2TaDuo8jKHiz0eGjZT+gA+Eq2KWaNbzT?=
 =?us-ascii?Q?mM43iIrRoNH49MmhuiokdP6QjDtPNRGZmWlskHrOqG+oLS2ZOLuqpjsz+qqh?=
 =?us-ascii?Q?CwFaL2kN/Ri4CB+YH3eSn2BKeQWJ0e4THQuuTiDx8uqqureykJ1VdLPsWU5S?=
 =?us-ascii?Q?7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b26e56-e41e-46f6-00bb-08d9a8a11fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 01:33:42.3343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCy0wKmHauRwG3csim8AvnI1dTxXstdSia44psIAuOuNG6gj2go1WxsoaB8GVrfnKeTYNeMUOPhA6BNhLZ+t0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4518
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=yadong.qi@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Chen, 
 Luhai" <luhai.chen@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Wang, Kai Z" <kai.z.wang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Mon, Nov 15, 2021 at 12:52:00PM +0800, yadong.qi@intel.com wrote:
> > From: Yadong Qi <yadong.qi@intel.com>
> >
> > Add new virtio feature: VIRTIO_BLK_F_SECDISCARD.
> > Add new virtio command: VIRTIO_BLK_T_SECDISCARD.
> >
> > This feature is disabled by default, it will check the backend
> > bs->open_flags & BDRV_O_SECDISCARD, enable it if BDRV_O_SECDISCARD
> > is supported.
> >
> > Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> > ---
> >  hw/block/virtio-blk.c                       | 26 +++++++++++++++++----
> >  include/standard-headers/linux/virtio_blk.h |  4 ++++
>=20
>=20
> Any changes to standard headers need to go to linux and virtio TC.
Sure. I will draft proposal to virtio-comment for review.



