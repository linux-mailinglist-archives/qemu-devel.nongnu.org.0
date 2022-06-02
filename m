Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3E53B2BB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 06:28:47 +0200 (CEST)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwcRx-0001L6-JO
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 00:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nwcOO-0000XC-DQ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 00:25:04 -0400
Received: from mga11.intel.com ([192.55.52.93]:26453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nwcOJ-0007Tt-ER
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 00:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654143899; x=1685679899;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VSoEcL+PtqovxUw5+oQg0J9F3LGHeZT//5p7+ERTc+Q=;
 b=iYN3u6ykb+TV62QttWPr9KybB4Q6u99RF2hOrtAoEsAfGKx0AXkIaGp+
 lRDY22GY5A5EfTvKdysxwZMVmCDZJYsaMz0xsGxKYaIO6muSfCjteVowS
 7g3yAlFKVtuuJNPmZjnWU6dw8Msrx3Qy8fALHCwu7k0SPp2hd3Y9yMOai
 TZM8m0o1PVqU815QEF8qHgdFIIqg1oTYXuieu7/aJB1NWZjmVPyJ+8Usf
 D8OCnSTg+EVioUVa2+Y+o3X2KmEGeqn+uQIh96CBZUM0xevAWxsJH9bXf
 LTJqxNCOJRsbPZ8+h+DFLmgi4bsCkQVBicADqiHXB7hWTwJH1E+PvB2Dz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273384658"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="273384658"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 21:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; d="scan'208";a="756788913"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 01 Jun 2022 21:24:50 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 1 Jun 2022 21:24:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 1 Jun 2022 21:24:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 1 Jun 2022 21:24:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDYHsi2T3gzkEI8DN/iszRYWIKep25qR6N/nffhI6Mr1skn9t4zRyQZ0zSbX+m2LyKdPQFYuFWT6phj3lW6T3uaFqvC9n5pl0N7KttCibLGFZaeDwHuwXTMJ0Kb4gQP4RrKOmkkZTgoGMvstyx4Zv6EKlubmL3Wu50XIX0QzXmW13aJoOOOcUy4q2vHnkuo9l17q2VkVi2NARa5PPZjWcQNwgTka6ZCdHeXcLIe9Ug5vJEf67t2XPxiL5lZykYn2sQzr+jNzUPRSaV8ol/mvt2f9lknqCh+KDN8corlpfAzrzuPYm78In2d13qpnh98BC6psGnYM3ezKh7TyheNjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv8WJUz95jaKZrZBcq41RMjcotkT/g1mxZaRhkrNzrQ=;
 b=Yzs3CeaUjTFH+/zHg5gDmFGpsGjnohjS/P+x2jDDMOY4IwUx8ysrIY1Vfwi362QJJJTeOubKPKl+8+AobgiZNA20bsifuHwAN7gP6fl1of3O2YEUWZfcAb9GFsjAsIO5JWsWwc35YlzJJ8mOdr6+TdjrsqTez2YlXFZwGuj8JzsJuVvVNWdUK+Aw4eRJR1Xm5JX7ZRbFYGJJjZxLQ9G8AOel7HGvUY6k5C5bV6xmM3jvGXgEuqQFADnFG4otgRiR3aDgRDT2zmWeNR7PTS2ExNdDey3POuNib1Eq9Vk+xgFzOhZjNkEm0Ndl9ArhGOFSPCQxSHhNfYRxsWDfbZz5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB1331.namprd11.prod.outlook.com (2603:10b6:404:49::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 04:24:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8%7]) with mapi id 15.20.5314.012; Thu, 2 Jun 2022
 04:24:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Dong, Eddie"
 <eddie.dong@intel.com>
CC: "Rao, Lei" <lei.rao@intel.com>, "Zeng, Jason" <jason.zeng@intel.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "Li, Yadong" <yadong.li@intel.com>, "Liu, Yi L"
 <yi.l.liu@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 00/13] Add a plugin to support out-of-band live
 migration for VFIO pass-through device
Thread-Topic: [RFC PATCH 00/13] Add a plugin to support out-of-band live
 migration for VFIO pass-through device
Thread-Index: AQHYbzYujgIQpPnJUkW3n2FDwdrGJK0xgtSAgAlTb4CAAA6CAIAAm0jg
Date: Thu, 2 Jun 2022 04:24:47 +0000
Message-ID: <BN9PR11MB52761A05CD0143321402DC298CDE9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
 <20220526124427.3f23708f.alex.williamson@redhat.com>
 <BL0PR11MB30424D25A1C7C5544AF643868ADF9@BL0PR11MB3042.namprd11.prod.outlook.com>
 <20220601120120.46c7a057.alex.williamson@redhat.com>
In-Reply-To: <20220601120120.46c7a057.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b64325ea-8da5-48bb-0d7f-08da444fd406
x-ms-traffictypediagnostic: BN6PR11MB1331:EE_
x-microsoft-antispam-prvs: <BN6PR11MB13314D9B0C508FFF5887F1EE8CDE9@BN6PR11MB1331.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rv3Bm4oGhgvKu/css1Euwlis1wFz5qVHkWCQEL83RXRWBeflbYjKEpEMAXmRzrMsyZ3isO7kNG7Z+8LUQhH7NDEk5jP0ykIlCtG+BtOK0ZbAyR8fQ4BLKgOJSdCS0VN4Men8dk89g4B7u44VXf5RpGegGH3FAQwbEp5MUvjLA+/WTrfEjHO2hwxJZxqcl96b89khYOM75xrVIzJZ9AfNAubL8KDzKAQ096UXF65TMnvoqtPP/xI84xqQD2eaEqARyKryKMMXbgOzd9NhdI1ZDf8AIp9AWmAG0IN4QltHe8gqBADOP5DJEqo21u2SEKriuAsPmSninBDNNz89Lt52x4pxcew25r+cTK1JgTcLEZCaeNvYDFhjyiHHK9PWMoS1npjADmO0qkCt9GepGm5ZG5sjKKnrxE8Yefr3NK1rw5QrD+P4sGyQv5DjykHEnHncHEMoLT0J9BWWlCx1VQI2gJW2i6XRJObY+QvuKtnmHRCulffSBuUI1MCEoJKZodkVGWn3QOswF7acAKzFoQWL/rqi/gqLJuN6hLJGJLgtDP6wZh+2JtgmCaUvuPfciXGWpPwrzoo3bR4YlEqjd6b0CryzqzjJpcrJXIFu98z4JGFODFiyNouoKXnmytCVLiQY6C7ai4SNJ/MfX7RqZTjPMVA7lL9AW0iN1WrXu32m1+PXPidbHf9dDRcPhZZl7Ft2KeIe7oZx2qrHnTAQzm+wlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(9686003)(186003)(7696005)(6506007)(5660300002)(33656002)(55016003)(8936002)(2906002)(52536014)(76116006)(508600001)(66946007)(66556008)(64756008)(86362001)(66476007)(8676002)(66446008)(4326008)(71200400001)(38070700005)(82960400001)(122000001)(38100700002)(110136005)(54906003)(83380400001)(6636002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V0SBvscOTAyy63arWgQ1/L2atEXdbj/Wzk1eb6NOBPc1g1dOlvtTVFh3JSlX?=
 =?us-ascii?Q?57qIHSFQWYJR4i1ioUWVEV4hqdDJcpNUSYyyc/QRhWNDLqxMyfIiVlq1F5HN?=
 =?us-ascii?Q?A1g0qcrkdrFFmpYF3nk6rGZE2PAHPqnidKlPBRPJhmCbAkvDgHTuKOOZR+99?=
 =?us-ascii?Q?PwoNF1hvg309DKHb0Hxbv7lQIk5VZDL+JCWx+47JLJysIFQDFsE8xMjc2d8I?=
 =?us-ascii?Q?qgv5yq+cNvPYhxJwcz9BVKnhba9JYHHH19v7H97W/bJGEzw1LFumvYng9rgI?=
 =?us-ascii?Q?caMCvGd995z+lxbp+TBB3/RUZW/cqOAGX7reGz8Or5w9Y3G4R2VliI+r4llE?=
 =?us-ascii?Q?i8CVtA6irzOO0SQFPspcQ/ADUKRx0/O2khmCWrFWQaauU1DHGynSWNymbAXR?=
 =?us-ascii?Q?4ImtrOb0A9ljYc/zP82tBW0DKXysbEA9i3QpIjxc8nWP/cSB1N0acyuftdk2?=
 =?us-ascii?Q?qbgR+eCHtqaBcWPkrXSHhnnLS5M7uw6EtetMKB08wqbSgOXRt9quFNLIn1M5?=
 =?us-ascii?Q?MhaBk68pqF6LRepehvTgYL2c6aODp4moPhbcmdkvrg1lNweORnK75Qb6NsIy?=
 =?us-ascii?Q?eGLAMWHpQpbcgchlMcEOQIgcBy6RX3NwHlSaV+XU3KYg+hOiPeOT1qqYtO0X?=
 =?us-ascii?Q?YANXi1FwiVPtBEThGeV89Ep5IawdanM/tO9XertgkTT4DrKg93bBX3LORtlB?=
 =?us-ascii?Q?h2qwIfdUlv95sEtbBqeXbWMZAWnoCj/pkTaXEL/2O71a/ZHwEGSNPtCLpBp4?=
 =?us-ascii?Q?iI9vU2DeHM120O1HMqr+ZE0BWDexlU83pc57KtEbvriUQu0CJeHuuVV4NBgt?=
 =?us-ascii?Q?7Bcsm8FY6yDshwg4r5nn+Ywb/pcBrT66Gik0oK2aVTAtt7VIhHKV16i9RZyE?=
 =?us-ascii?Q?VfNL0rDI/fQqirVDwYryec+cJOlMOGEDiqJZM8RhBVbmuOplre3os73PH8P1?=
 =?us-ascii?Q?nirV6cbf435EWSxtf2cm3w0CdCcSOyMxekziTtMcwVN4+dYZSuUThuAmNJpr?=
 =?us-ascii?Q?Giakx5NhzBQhoypdrGUOyileUrFR6SNzf0wX4KTyfQO7/aNMLq9qB08ixsBD?=
 =?us-ascii?Q?xM+z6FLIU0ans0cPGqQdcBnUt3RHyFWwJxWsgCUDcJYLmewX09meP5z1/8y8?=
 =?us-ascii?Q?ayQNf0x0NDeqy5hAWaVPNDvfXVLjSkfxD8881H5Ye2Eg4DVSMaa40yN7zvGu?=
 =?us-ascii?Q?pyijI6VEOqKjRmWEkrgeRTYPfCC36Fwtf+r4AecNo4+OeGrZyxAakyjifTtq?=
 =?us-ascii?Q?g/pwtGjUgWjKUlL2VXnGMOtxzrJLx5x1aisBaq8aFh/EgBUF2azXi/vJ7O+f?=
 =?us-ascii?Q?JJYY/Pf2LMUgqyqgaWd3FiTXIbBA+JAxPxrby/YN+++4RcVojynGDhHYe7dV?=
 =?us-ascii?Q?uGaBFXxgkskUEUzNm5Oaxog0Xf6xVohkRGb0gn0RM7W1JxdtCl3b60y4DfQL?=
 =?us-ascii?Q?pN4vB3GfCklVoWtsEZtaQ1F4ycBJihoOwlf9MNV1hFLzYqJrn0RxHz03jDRa?=
 =?us-ascii?Q?WFcmreUV55I/HV6peHqPJEPapaAaQm3B6u0IHHZ7S7DG+WsAWJTut2g9ZHp+?=
 =?us-ascii?Q?obBUI29RGvdqTug2ZyqFUX6NpbcxIF4Sz6FI0hkLqySCl5DJGsPG9OAO7wlA?=
 =?us-ascii?Q?Xj1cxHEghAqQ4WUpp/rCGCPLN26lrlcUqSYesvl3BI2m0PBh9vBghlbCVNgZ?=
 =?us-ascii?Q?gcKMAoF5YqGrOon96EnNG68SkpTCXU5xYGsb5hjlEx6tpVbRngDrnNUhEr5N?=
 =?us-ascii?Q?BH1cd5UDcw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64325ea-8da5-48bb-0d7f-08da444fd406
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 04:24:47.6305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HEPFp0GBGE3pMk6pcY/rIFUie90nYZUeuZvyLfVJig+PE3aWXfWsFA88APyz6n25h9Opt0kBJ76CBSiEpKXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1331
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=kevin.tian@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Alex,

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Thursday, June 2, 2022 2:01 AM
>=20
> On Wed, 1 Jun 2022 17:09:25 +0000
> "Dong, Eddie" <eddie.dong@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Qemu-devel <qemu-devel-
> > > bounces+eddie.dong=3Dintel.com@nongnu.org> On Behalf Of Alex
> Williamson
> > > On Tue, 24 May 2022 14:18:35 +0800
> > > Lei Rao <lei.rao@intel.com> wrote:
> > > > This proposal adopts a plugin mechanism (an example can be found in
> > > > [1]) given that IPU/DPU vendors usually implement proprietary
> > > > migration interfaces without a standard. But we are also open if an
> > > > alternative option makes better sense, e.g. via loadable modules (w=
ith
> > > > Qemu supporting gRPC or JSON-RPC support) or an IPC mechanism
> similar
> > > to vhost-user.
> > >
> > > AFAIU, QEMU is not interested in supporting plugin modules, especiall=
y
> > > proprietary ones.  I don't see that a case has really been made that =
this
> > > cannot be done in-band, through a vfio-pci variant driver, possibly
> making
> > > use of proprietary interfaces to a userspace agent if necessary (thou=
gh
> > > please don't ask such to be accepted in-tree for the kernel either). =
 A vfio-
> > > user device server might also host such proprietary, device specific =
agents
> > > while supporting the standard, in-band migration interface.  Thanks,
> > >
> >
> > Thanks Alex. Removing plug-in module is not a problem.
> >
> > Do you mean to implement the migration and protocol handling inside
> > Qemu-client (probably vfio-client after the VFIO-user is merged)? Or
> > to build as part of libvfio-user? We can also build it as a separate
> > process of Qemu-server as part of Multi-Process Qemu.
>=20
> AIUI, the QEMU "client" in a vfio-user configuration is simply QEMU
> itself.  The vfio-user "server" provides the actual device
> implementation, which could support different license models, depending
> on what libraries or existing code is incorporated to implement that
> server.  The QEMU remote machine type is simply a QEMU-based
> implementation of a vfio-user server.  The vfio-user server is analogous
> to a vfio-pci variant driver in the kernel/ioctl interface model.  The
> vfio-user client should be device agnostic, possibly with similar
> exceptions we have today via device specific quirk handling for the
> vfio kernel interface.
>=20

Sounds like vfio-user is currently defined around virtual device
oriented usages, e.g.:

  - Client accesses virtual pci regions via VFIO_USER_REGION_READ/WRITE
    or mmap if the server passes a shmem fd for a given region in
    VFIO_USER_DEVICE_GET_REGION_INFO;

  - Client maps DMA memory to server via VFIO_USER_DMA_MAP/UNMAP;

  - Server access client memory via VFIO_USER_DMA_READ/WRITE or
    mmap if client passes a fd for the DMA region when doing DMA_MAP;

  - Server delivers virtual interrupt to client via IPC e.g. eventfd;

But in this usage it is still expected to allow Qemu directly access the
physical device for performance. Turning to vfio-user suggests that it
may need to support a model where from kernel p.o.v the physical
device is assigned to vfio-user server but in the end vfio-user client
actually operates the device (or, 'partially').=20

'partially' comes from that mmap must be done by Qemu otherwise
we lose all the performance merit of passthrough while DMA map
and interrupt delivery may be still routed via server (for DMA map
this requires that the server can mmap the client's memory). Such
indirect routes does bring some overhead but it's less obvious than
losing mmap.

I'm not sure how it works w/o additional kernel-side cooperation
though. Currently there is only one fd to represent the entire=20
kernel vfio device then how could the server delegate pci regions
to another process (client) for mmap?

If the server just passes the vfio device fd to the client then it's
not vfio-user any more.

Did I misunderstand your idea?

Thanks
Kevin

