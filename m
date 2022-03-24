Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3114A4E60C4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:58:55 +0100 (CET)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJJ0-0003jO-7G
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:58:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nXJEG-0000jW-04
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:54:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:24491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nXJED-0003uu-DT
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648112037; x=1679648037;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MZcnXwPNOJc47Vwt77Jl66SY4nMwM/lxiHs1tB2XFxc=;
 b=mioV5D+l186iu3pIXUdj3JpkCqO9x29itdABbKf3PjU+gf/l0dqzXLjc
 uUltFqrv0ulhtqjv2N+JmkdkwEFCsrdbHsHiNN+srCuIuLJCni0hJNgOH
 I/vQjk6vOWaxkl31iyaFdcsfoRwchROeNnxLeXlc9w1LRFL8i0cW1N9g0
 PnP6nbhKwNMwkzC93I9kqhaxX44KefzvnFy8pSPXnGsklFydjEV3wwckZ
 Urfbe4V14jyjN234g0LUHyik0GwgjA0IbQyv1Q0geG+dbmUe2wnRFYz6n
 k6JIf12yKqsuSSVl2C2xsk+QdqnOloJBtvloTzs0bsD8mrU1geTPtozC+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="319032533"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="319032533"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 01:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="519700361"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 24 Mar 2022 01:53:54 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 01:53:54 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 01:53:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 01:53:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 01:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFZLiN6kV6mYl8LQx5MYLrO9rYkYKAYqwU0XWFRVd3429y5zkmsGR7qB50HLSDpAltftJJMAUkXjJx3iBMVMoVpQAoBSLi1GKyJIwGulfoxJT4Te5hTbkwdEScH672YGqcvh4+8pnNIJX5LLWImq6vKeYF/krakSDgtGOKm0CQztJl12zXukwlE4pXlDpwhvsHuo3lqsr04QadNBslMhnF5DFQb3eNinNAGrOPsn9mBApgF5iPDBd0CsmNSEE6qGquADN4blI197H50hmaLgYD6xidbB1WtiicQu8tlEOhulGki/BFqZC94I/4viCF6EgHgWknT+YpRTJXIoCq1Vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWE5GD+2lTcEt5uXU3CkpsChWSpTZf6QxO78xLM94nk=;
 b=LZkUKe/itioHOOD8kljOf6c+YjLdC6OiEP1T9fUHhzUjQY2fdKWcqQ80+1sbHL1NDsS8gfhfQ3iicDDn7veB8+63WcbU/LWEc7tD1yk8E7BtkIZt4prlck9ggwH/QIZ8cZDGGCfpSvx4EEBJMvK2O9qlKxzoUkfZRRzal+2qugkVtFk2BIiOXv1qxUd6ZQcbJ998GHrrZzco/MTa8T9PHGGVqjWwE7qw+Rx/EdNUDxUqCvirqGx6uFut5Iq7exV+pMMosekcAQHe3ro42eKAWqr6HZl1toZcMwOPPL+PfI698eMU8HFjDLsa4E2YVYO3y9hmLD/WeoiZzZqVhppFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 08:53:51 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 08:53:51 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>
Subject: RE: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Topic: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Index: AQHYPOjLkFETw43vekSHA4amP0dz7KzOPTaQ
Date: Thu, 24 Mar 2022 08:53:51 +0000
Message-ID: <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
In-Reply-To: <20220321055429.10260-5-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0db889fa-7104-4463-b7ec-08da0d73d1bd
x-ms-traffictypediagnostic: PH0PR11MB4901:EE_
x-microsoft-antispam-prvs: <PH0PR11MB490183B6C2E0F28C0DB882048C199@PH0PR11MB4901.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U1VaZfWQriPEhgkG3Y1OECaD25M82hACvhWyBLD8/npqpshdl8BekmbciOImMFmbdZPVGWzUt/zkEjVqTuHRka2AmeDo+0qQTwqdG6u1mZIXQG3yHtwTLvv+9HxaTCRKnOKfouZJOtIbN4wOQggC9P3Tfw8bIzXrYg9oXM7rNKj6QXhPUA9UM3Yh62RYvJ2x4mcmnGLsZqueGfA1abohB//eY7MVk6Hjtl0iJuTAUXo78bcud6nlGOg8nAaOFCGH4ASNffQnnacaYsSZ/FNODiwC5nmPkYjzaC6Oi8BvP5tCcyVQMGvnO5+WvFqEpeep5q3a+EiHzXoyFz/QdPUYPrG845rxayMcraDT+4MdV8aWLacFgnxsRLULyrKNopSDMB9yyJL6fvaM6Ef8jtZS/AYslDR/T90BgSR5iFwpmMKDKgvCSWJLyTTm3ZESAymJrBvLFZSxavVIUNQaVKxYjNyTI6KgjkniyNkeNfGOcVGYhdqZD9VWaMOc/K/8EpArbERjFqA4m4WrNCYfGY1NBE8i1Jrcpmpf2s8SCAsZIaY3OuZqZRy/D+eKHAMlIYf7s7WfV5Iu87qf3FfGr8qKkFsbCpWo4RdMc36QDM3Mafnh4alNZAG3iSiDa5gvBVM55fnaFGhtXbdBfSWpQY6wzCN7W/XJ8NE9bIMNUNo9FbPN7NyVx5cSjXle97itIYhvN/MsGBcTgW15v8om4LHfyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(9686003)(76116006)(5660300002)(6506007)(7696005)(186003)(66946007)(64756008)(26005)(4326008)(66476007)(8676002)(66556008)(66446008)(82960400001)(122000001)(316002)(508600001)(38070700005)(83380400001)(71200400001)(2906002)(33656002)(8936002)(55016003)(86362001)(38100700002)(52536014)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uOMhOy2nUVZoCh4fBzi56VKZsgbg9fCbQvV9XchkmfHNpHn1hY4Nnw1gxFea?=
 =?us-ascii?Q?ox/xamz7r/gZuObWqhoMUbwT9wzJ0mWPs55XU+ptcy88EFMwTYHGDDAwu/Or?=
 =?us-ascii?Q?qoitYvrpVCjFS+wsWhL8c5uIuyFZ/BRJcgoq7rekbH22I3Efyp/SRdF3Uj+6?=
 =?us-ascii?Q?NjCT6QoDAvDVpauW5EkojLiguYrXTkeC6X3wnMBphJhAQziM7b/Nhxhe7g9L?=
 =?us-ascii?Q?6/fePSd0zJGoxWeoqr2K9Hheh7Rc3lasJDhaDNEzOGFP33AQqq7UEMlvt+w6?=
 =?us-ascii?Q?65ptl5ZTXM4J6oo/VSzCL9xGiowh7NIoGBUbz5ueMFYPu/eMhBUJxvJzFv7H?=
 =?us-ascii?Q?RD9i5PkItokaOgZuVbbXKVRKb080QL/gS9e4SqywWuwtk7GQ9vjyLmN/x7li?=
 =?us-ascii?Q?O3Hs7+VIs6Z96Uz9oKpoSLOdiTfXI1flcTPXrt5ouIAwZ4qYNjTa6VbIftpw?=
 =?us-ascii?Q?dEXoFiBKcO9fC5SMXKnKNPzfhFi0pgQK3oees/Lp1ox7hUXwYeC2SETlaB4k?=
 =?us-ascii?Q?qVzJqGUny15Esffrh6AdW1rcT9ZSsnTLBA3PyzJcv4lMMeC5jYtxeZlZTpqw?=
 =?us-ascii?Q?FsvC0fsn+ByEOpeZRJChjUO2YDtqU/radYRSBHQSBoxkKZtlVJ+zgWfhyoLx?=
 =?us-ascii?Q?bW4K4wuDmj2roUKt6UWNY5ecbvF2ihvMkKDc4Nn7M6xjDUqxjqFiYGGSt/3z?=
 =?us-ascii?Q?9oS3kfdQkxGwHFZZOOwl5jFxrmoA+LcXvnV7rZpWaSP93umsr3WAR+ahEizW?=
 =?us-ascii?Q?xEBZFH89UcKPnEE72dgozOEA4PvmOgiHknivqmDRQb8SUA+SpiqpHlWl9Pq2?=
 =?us-ascii?Q?DURh91YuLm82S+5UH6GwL+2BAApKLTtR0WTBER4U42KUBMoskenlwp3YpyYd?=
 =?us-ascii?Q?hARWLPp8k6r/aQ3n7zooyEc6HLsssbSzT/phnsu942wl/QegdhiQ5x/vfnYv?=
 =?us-ascii?Q?jdz19EQ7kssbUP2/2YUcJcGxo5E0brfpkBI1moUV0bUikLGNZNg7qTw7mZTh?=
 =?us-ascii?Q?K9OJAmfQdwedCAEFZezi660I2lKttl9Y1NCHICi9+iVDwukogpGmvNVwzcY4?=
 =?us-ascii?Q?sPAQf3vw6NTSEtUj/xHtB9Qcdl5N2zjGVu5RHNNQg+7SrURVZwZJhH0Rx4qj?=
 =?us-ascii?Q?rBd0pYw3v71t0tCvDUKGyJt6tQsbBOs3ew8eWPcm1l+LumMHFrmrxCfASs+n?=
 =?us-ascii?Q?kIa1blHEeSjUhZXVM2oUfKfDwbXXhngiud8+7VjQCNDH9Vp9krudIg8vP+dc?=
 =?us-ascii?Q?TztBMWZBViekt4AbhdqnXegkCW3NatSF/VtoZon+Zzq4yiohWTWrAU3+DIL8?=
 =?us-ascii?Q?veyDlMw6YfuBuO6oiPyE1p3COgGQpk4TvC/uCrHhks+PvgPvL0uFoIvHUI5i?=
 =?us-ascii?Q?SjTAC2o2Fg1WkgU4ymQ2zcpb8bicNPxEdTjffLY/R+xr38E81VPs0QgT3YRt?=
 =?us-ascii?Q?yWIvfy9Lm92ZoYVDiVmvU+XdkLYPLZ2U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db889fa-7104-4463-b7ec-08da0d73d1bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 08:53:51.6368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOiqd9ma6aCb2ge1fIsMrA4ocWqJwJoi6e3SePPRDEF87zmiCyh4uTWMu6fJmho2yFb/jNBl4t7Ex+YtsOSI+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=kevin.tian@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Jason Wang
> Sent: Monday, March 21, 2022 1:54 PM
>=20
> This patch introduce ECAP_PASID via "x-pasid-mode". Based on the
> existing support for scalable mode, we need to implement the following
> missing parts:
>=20
> 1) tag VTDAddressSpace with PASID and support IOMMU/DMA translation
>    with PASID
> 2) tag IOTLB with PASID

and invalidate desc to flush PASID iotlb, which seems missing in this patch=
.

> 3) PASID cache and its flush
> 4) Fault recording with PASID
>=20
> For simplicity:
>=20
> 1) PASID cache is not implemented so we can simply implement the PASID
> cache flush as a nop.
> 2) Fault recording with PASID is not supported, NFR is not changed.
>=20
> All of the above is not mandatory and could be implemented in the
> future.

PASID cache is optional, but fault recording with PASID is required.
I'm fine with adding it incrementally but want to clarify the concept first=
.

>=20
> Note that though PASID based IOMMU translation is ready but no device
> can issue PASID DMA right now. In this case, PCI_NO_PASID is used as
> PASID to identify the address w/ PASID. vtd_find_add_as() has been
> extended to provision address space with PASID which could be utilized
> by the future extension of PCI core to allow device model to use PASID
> based DMA translation.

I didn't get the point of PCI_NO_PASID. How is it different from RID_PASID?
Can you enlighten?

>=20
> This feature would be useful for:
>=20
> 1) prototyping PASID support for devices like virtio
> 2) future vPASID work
> 3) future PRS and vSVA work

Haven't got time to look at the code in detail. stop here.=20

Thanks
Kevin

