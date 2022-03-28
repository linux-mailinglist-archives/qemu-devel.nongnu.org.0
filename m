Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A84E8EAA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 09:06:20 +0200 (CEST)
Received: from localhost ([::1]:44326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYjSE-0005yY-KB
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 03:06:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nYjPu-0004WL-2s
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 03:03:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:36811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nYjPr-0003xX-3F
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 03:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648451031; x=1679987031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P/8uRGFK81kLEkf8idCDLReYdlQHDqt6pTzyJWSUBG4=;
 b=aYbFC89cU3GrjODo/zmZMqOdIzrJhqkB77HhKeWK4UJAyVAIUUMD4z2z
 MDDao+clGVmGxhdUwm58H0gYJDwC0GCYaRCnWUQ60KZGce19l9zGtU+QI
 gbcxPDee7vEzYelhzK4RT5d0LFDjE7xNflNH01PG+qu70+IPr3IUToFmO
 5bRSQzxf60Eb+gynCW06xDBT5aXGqLZFBrDn6dOjcuKd5arwja+r9xJRE
 1aUCcDdy/MH57/TcK3TV2IIO/lV01q0/pHKtTTkQL4Sw9Gr1Y5K19RSaz
 oT0L2ayK0lZGvQTrvUPlPR4HE/CJ+h/Jz7LLvjZbN+EGjME9fZ9KCtxzS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="345365574"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="345365574"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 00:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; d="scan'208";a="718993892"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 28 Mar 2022 00:03:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 00:03:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 00:03:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 00:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb2SWWuF7+8TMy1grSd44nkHf/UH1JXTZ9Rqj/a2OCTslCKRwK0T1NdMHYluRqhg8Jz+ioOQ6YbUUlgEjpw1JBwHZOdPs+MNSMyjnET2Dt2Xv8GZ4KVAwAlQnLQ9tVRLBYw3wpMn4qz4RrZ1Ot4hXhhW5CelwCUJ6y2CEoLkAEZXRmPELcRCtwYX0tl8AkdfM7b12WCRQKWR1dcZwQYWUPZBDukvVpRcqP0gH41dICZpiDcWOBkuEyK0cIV/QoAPq5h434zK9KMVGn2FPrjIGQScJNc+lcIXxwuWRLXZBL+5RVuxJxRoa7iwW4DGTCCe8UkicP69z/vzlryU//YSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn2IcLRCbxLXGP8HbZMh8RbkYkCyYj46ZwBPX9/MMos=;
 b=Qt26Nx9zyK7cIF+bHBj+xfRUmHZ+M4XyxESE1vxF1tXVSNVEZi5w9cLHBg7JhuKVyZs4WrftAHefJnZvOrIB6IO+JHt3KKaHyl0Rj8UC3pZjbKYQ9JAdr9gADkMOw2Cm8qMG1inAKDVmQmSjKcJNYSrMnTFc2qaGb3Toep7BNjETvcoWtNAhUcEBrDLKReXa7ML5rQpiO/uyRn4dQ//qy7uyg7R2MfRZUy75OfF/rG9DJWZnMlapfU2gL05mLxVdBCFuw3ATVlAXmVTnC/PHUI7tcjTSbY1SE0qU233vG+fdsl1Co/3aJbGLt8Pe5IQ9fMoggQ29AIO3y66t3/4Gdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR11MB1289.namprd11.prod.outlook.com (2603:10b6:3:b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.19; Mon, 28 Mar 2022 07:03:39 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 07:03:39 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>
Subject: RE: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Topic: [PATCH V2 4/4] intel-iommu: PASID support
Thread-Index: AQHYPOjLkFETw43vekSHA4amP0dz7KzUZd9w
Date: Mon, 28 Mar 2022 07:03:38 +0000
Message-ID: <BN9PR11MB527635384D3CD8F0FB4232388C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 38d652b0-2506-484b-db5c-08da108915e1
x-ms-traffictypediagnostic: DM5PR11MB1289:EE_
x-microsoft-antispam-prvs: <DM5PR11MB1289A29652FB0F800B947C048C1D9@DM5PR11MB1289.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kk84nMr9FtaoFtTxsvmnHwB9jSh9kaeBPzkLtd0DSuCt4bs4qvShqQWMPYfFi2nxe27R+fSw6ewFwQJ2MoA7St9ES0wvhHd/Vs2neRCyADFGIMYYFYQgxosos8Qx5854RzTzf7diXDl14V5U0neEwsuRUjJ+3R8v5fRH9EG5DBt7Wf5ndhlbd1u7StV8QDOk6fU7jCwh4E2CLLMPuh7uSxCE6hORlLamj6xeol5rLzp99bFl+ey7zESfvpNCiejOiaG2IjhyVgOGiu6D+2wz/boI/ByOHLW719n5Emnvuj8mA1Ln6ZiXQ2NbCihpjT3q6nOqz6C60YBKZr9vN9TzoRl9bxXGhFprDlFeHKb2KmKz84xB/ZgDQ9A4aQ3BrEeP97wUHH+XqaIQS8PwYjmo3424sfOnUGQ8lwyn5byBdBKaXYB7E1VKyUyWUMZrOOWcdcZcK4kUr/4k+WzHtSKsslEGm2qkDKxQHb6t9wLf/uPvCMTntFf3rSipEByA0n53YO3mLE53+fmQNxl0kiBOhPouiWXRpeUxeFfSxj6r6h28Y4vKGVlyCcdfDRG6Uw1nrIZIa6XfgIo5+sBcfWGL/evbtCJnph2hZtDWSni1MlehTe67GjwHAAUJSUavpo6NxvGl4lEcDPeHu1C6UJIQnECZjtSTMjt3jmxJS/kauFRL3GBqOjNNBlYrjYpELEiZIxSgcX1LHaE5EvwcwrUpXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(82960400001)(122000001)(83380400001)(86362001)(38100700002)(26005)(186003)(316002)(5660300002)(110136005)(52536014)(4326008)(76116006)(64756008)(54906003)(8936002)(66446008)(66476007)(66556008)(66946007)(8676002)(508600001)(9686003)(6506007)(7696005)(55016003)(2906002)(33656002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B515VhmG77nx+zgCMc7H954rtoFF+qvCenVAdtPxZPrgVF4wU8bxaS/tkBLS?=
 =?us-ascii?Q?9QmwKobma3jft2zT0I6C4nZqzFJQYJ+OPsCrGvgnpPkykDMHc/7AFNW31ljz?=
 =?us-ascii?Q?p38MZjqSpcNT+7TGIvYJuAjRua1BK39xnBkT+Ybg/Cz0LNyvqmcJfzqzrM7U?=
 =?us-ascii?Q?/FfMjtkGDaEEIeHJEtR7pJzyUzVipc6bOgh8Eg85OJthI701lg5M/Yh9QVdv?=
 =?us-ascii?Q?TT/1pUmVaUBz1Zbesk41RJm1nQcG91epSQMe97FI+nOXG8Aum6oQWv/XNauu?=
 =?us-ascii?Q?5+KD45dfN8BWLiJELLyHzj8NadAXy7+K3IvNybxpvxusTE0RtO19mC+mmzoT?=
 =?us-ascii?Q?+dUEhBaoGtvc2Nh2oxcfXBMutTrXHKXlbSpitashMk2Dj4Y8DuQlDOLWdfaT?=
 =?us-ascii?Q?NG01QUN25o7bYJhQa1zJ3M9pQnekGqB5F2JbXvWRMMJsXreZdHxKkNwl1RM3?=
 =?us-ascii?Q?33WePI0rkzuv4p4nvLNls9/aTeeaSBSKsUjgzCHpfoGwUx0ZH1K+eOrf6bvE?=
 =?us-ascii?Q?R9uRH6PGxaUktiAablCKGgdszQo9Ie/S/QLYl75jK7r+UhTPEVIaPVbFtQ/g?=
 =?us-ascii?Q?B9RjSkIwO1UMkRSr8ZHpvmk5yfiuqWc0+7DwVFJ3KXYH7Ne4KvkB1DzTtJ2y?=
 =?us-ascii?Q?K+A7KRGoTj0aCB0GrSmj7BnrpT9Puk5SWvhExkNof5x16CUU349x2z1xoloJ?=
 =?us-ascii?Q?DDzt7YwTA5HuTwmONgcv9zqe65zpQfiZ7nwFtxDaEZSs/LrHf7fj1nPSYpFM?=
 =?us-ascii?Q?EBi28HI+YZsTXoKHPOzV/OXy8AgeBTSnP7DPAq0Pg/a9DwH7W7C6l6Pg8Lt4?=
 =?us-ascii?Q?O76NtfZFD/KiFwg6gOt4mG64J4dA0mOGowhqbjsZWGzJm8mcH12ytBwtrxTy?=
 =?us-ascii?Q?7VHQKNxtZSDe9dfsMZlKxt2dCSExHMGuXQD1S2akorxFkP2AMMuUgbpVB3vE?=
 =?us-ascii?Q?mNTRkupVmYVtMBBfilqyTuj0GxJO/C2S8Z9pWYY93oYiFsVsjWPqdigNgcK4?=
 =?us-ascii?Q?ovHKNCb9nIOsrO2iDFgzBKoEu4VaOUPLL1riyAsZAzhc0968Bfh/MmQD1ALD?=
 =?us-ascii?Q?heUd/IZKOBT10JIVP81fEgRmjYfAXbO0oYtG7iD3mvYNYp7LGhfAnPSOyv5B?=
 =?us-ascii?Q?5TDGgmeQW/EMnQQupsilveQ5880DForFeAR0FRE7aJGMMlj2WtuqZ/zCcxU7?=
 =?us-ascii?Q?pUGYXLBAKykYxKXIirCeCEEddgyR3JavtOSPq4WPq6D+h+V9uXF1fNzLreoa?=
 =?us-ascii?Q?14Tw5sgE+5ZouKQEP/SbOLgjX/zaFhPqZKdHdphA8LfDRpKVVzOfahxnbm86?=
 =?us-ascii?Q?zlSu+pNcOMWKhLSllgxPwVWHuHMWU0GC6LrfZqgjkXdKk+gNMu69qmFC0Cia?=
 =?us-ascii?Q?YzMb2L7SgPBPtOpIrylMWBPiGziIFRjj7bED5hyAnQGZfhh1n/mpfaVIjWH7?=
 =?us-ascii?Q?DnlXEcyT/TmT9dMawz4TccJZaXYW658KBCIwsKHtb+7zFYHtKRPGytlqkt68?=
 =?us-ascii?Q?mRRw66+BPBq6tD584s5rrdrHCVzpv0jJOPrbHRSKGlgk7GSda/49oOAE1VZJ?=
 =?us-ascii?Q?jdZydeASxxu3Nn4sTZ0qJsXmUk8KCGfjQEFvnZUR6E4iEcsoV3g2tm9RcU5Z?=
 =?us-ascii?Q?J8iCXV58W2gJOvxlFLq2olw8z6iDoDouq06Ez6ATbDpPGNF1jqKSGdH2ZQqg?=
 =?us-ascii?Q?dJQJBV88a6sQF+3FGc57Gw0V85FuqL0T1mpraWa8wiBy/hRhX6GLeVrsgbVo?=
 =?us-ascii?Q?N30nMguDlA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d652b0-2506-484b-db5c-08da108915e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 07:03:38.9096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kv3YCgJlY9z3E8knNd217FJyV5fe9TshlSZQE5HnQTATP48JIIWUXzvme5A90bZqV6OIyZEv+lml+B301tg1Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1289
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=kevin.tian@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> +    /*
> +     * vtd-spec v3.4 3.14:
> +     *
> +     * """
> +     * Requests-with-PASID with input address in range 0xFEEx_xxxx are
> +     * translated normally like any other request-with-PASID through
> +     * DMA-remapping hardware. However, if such a request is processed
> +     * using pass-through translation, it will be blocked as described
> +     * in the paragraph below.

While PASID+PT is blocked as described in the below paragraph, the
paragraph itself applies to all situations:

  1) PT + noPASID
  2) translation + noPASID
  3) PT + PASID
  4) translation + PASID

because...

> +     *
> +     * Software must not program paging-structure entries to remap any
> +     * address to the interrupt address range. Untranslated requests
> +     * and translation requests that result in an address in the
> +     * interrupt range will be blocked with condition code LGN.4 or
> +     * SGN.8.

... if you look at the definition of LGN.4 or SGN.8:

LGN.4:	When legacy mode (RTADDR_REG.TTM=3D00b) is enabled, hardware
	detected an output address (i.e. address after remapping) in the
	interrupt address range (0xFEEx_xxxx). For Translated requests and
	requests with pass-through translation type (TT=3D10), the output
	address is the same as the address in the request

The last sentence in the first paragraph above just highlights the fact tha=
t
when input address of PT is in interrupt range then it is blocked by LGN.4
or SGN.8 due to output address also in interrupt range.

> +     * """
> +     *
> +     * We enable per as memory region (iommu_ir_fault) for catching
> +     * the tranlsation for interrupt range through PASID + PT.
> +     */
> +    if (pt && as->pasid !=3D PCI_NO_PASID) {
> +        memory_region_set_enabled(&as->iommu_ir_fault, true);
> +    } else {
> +        memory_region_set_enabled(&as->iommu_ir_fault, false);
> +    }
> +

Given above this should be a bug fix for nopasid first and then apply it
to pasid path too.

Thanks
Kevin

