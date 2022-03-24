Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C44E6090
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:44:58 +0100 (CET)
Received: from localhost ([::1]:38982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXJ5T-0007bC-9a
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:44:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nXIoD-0005Yj-0T
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:27:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:26827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1nXIoB-0005e5-35
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648110423; x=1679646423;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y7LQhPhqQuNHjEYMaAOGYo6Wn7OJrGU2D4iHTgZMSec=;
 b=VsWb/Qt1lXPqLofFeO6LKtlJxR/DL3ZaazeE2zbA7e5vu5S/Wzb8eodG
 uVtJyLhcIvVANjKWLJLYUal2OYkXYJ/lZjEzAMmcr9ahxewNAW++uGxsS
 QrcZq+zYDATFAbKgBfU1NLJwv1ltdYo6ddlWpJWLuD99YT4vUE7Q5epSJ
 R+a5VN87vR3IhkERrGmRhGlcCk8NYD8uBS/ZBfFgELVEzRmF4Ijfip8yt
 HlZ7Ms8DGGJQD/rkUrIUWQmiFjGhDK2COAARlzhAsPeyoBR3f55QsRV/C
 51ijt4WKKhIUwxPyalil67xjevvnlD/kSt2MAaC55LVVaUZojRk8WNek/ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258505612"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="258505612"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 01:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="637770936"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2022 01:27:01 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 01:27:00 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 01:27:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 01:27:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 01:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsjNhYi16J2NNdy8v9kI7E6OERIxqD1SNWwGkHSRbuvjBfoO3vpSsUDS5nZI4tuZDOwZI1M2zVGgR0OdLgLVoGT25DZF5aOOM15xBLYBzB9lCLfCF0RYVxLokKn9WGM2afGzdB2KTkma/r5xNsyjxowqS3OAFEGz101DuXVtwfvLeKMNf+L22qxciAwhXcS9IJAUcKHpw6CGd0UIw6yo+v63gXCbQXYq+83ldvlEgJA+yyvO0MuD41Uy5pcn/EqHszf/CLF4q5FPMg1W0R2MaymhONy6/KhWGVHGV77giSYYN0BauBjteuGmQKS+uZV1Z01TdQ0HretE+ZHxz5xMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETeI6IJzeWXET/bGP2ttftmwChKEjGOBOOVbYR3CbLY=;
 b=J/aCY2ejltf/7UbYIWM3Uiq4bscCZQUr/yXAH6xCK1RWyik8J6JvkV0lMj0nQWVHh5dlt8/NOflN6qpfRse92JA3/zEMVAcWVkUJy8vWt2nZ97J2W4ag52CAPwfjNClOjF6laaHg1kk2r/0M341Mxqkkyfg9TD5HOALtP0rU0mknnqHEy6jUrjLcl3tjbID0Y5ZfyCM2HQV7+u2JGENboyVn+voUb1nury1lelmfg3BHQ5TeQJQdRoFdNTJuBLFEt/7MIIW/IEt2vtWYTBBoBBS9gHdH5lL+xJ074Ex9zowcDZIt7YL3ajSixbkKv7Qckzx0TOhCz/fN63LJU6wYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 08:26:58 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 08:26:58 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>
Subject: RE: [PATCH V2 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Thread-Topic: [PATCH V2 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
Thread-Index: AQHYPOjF4Qi0+yMY2Uep5+tIMIe5IqzON8sg
Date: Thu, 24 Mar 2022 08:26:58 +0000
Message-ID: <BN9PR11MB52767BEBCF2C191614FD68588C199@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-4-jasowang@redhat.com>
In-Reply-To: <20220321055429.10260-4-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c4018c9-7325-4e68-dd0b-08da0d701009
x-ms-traffictypediagnostic: DM6PR11MB4625:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4625D0F2384ED99C7CC2A7A08C199@DM6PR11MB4625.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4tCEEjbD2d9WCrFIBXJDdLAebagzc+v7uXwaYDFnoFgiD4zebmWqiv2jfoN4lJRWs9ROgB6u6ofRCBXbDX0EG4W0vdSVsvF1k3i1VC8I3Sa2DSInd06G8OD+ftOYzyn2QAaCa7agD2aOkG0rJkPadpMJugQPQ7U9OuhT09iUr3frqueGOSn58gvko92QpIMQhlDJH65maCxnyjMUyQZnDdDv8368oaEpUUHBb+/PSodoIidmnzHImUPYHb4W3oQ0oD72vYN+BTdBLVfJxsNRIza9wgn8+CvBs2k4ieDpa+vtcax7+YoCkQ08l1aPbf111NS3UbKW3/xutRca7ojfFuhSpDo6bm/olDUUm3WirSoQOOty7RXMQZhgy+GWoKHX4qfjDCR+ewtswttelMC85ie/1nkjtt86ofz+dwtkXAlOcXimDnrBQ2swPNhlf7Ofx2CLJMEoTtXTlwLt7Rn+N2yP6UGfTBfR6onWTyWyW0yf/AvYoJErAgPXdCGd4Ucgha6shchl0vW7tDgHPdxcdgp2WBMc5AKV+Uxvoiy9kxyovQiqIIfrwAdLXCo/mUGhLxsm47zESlxRJEmmobnu+9wu7ezMHrkm5m6Rd5GaEq5qxnbSt0zbcJeRMF2xrnLhl7wR5dbfygvi0t3JkwopNvIHhptL7S22GN87o2Md0F2dRCUf7awtNCe1QBrOc7ZEboIfq1G/l/yn9abcI+FCwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(52536014)(33656002)(8936002)(4744005)(5660300002)(508600001)(9686003)(6506007)(7696005)(2906002)(55016003)(38100700002)(82960400001)(122000001)(26005)(186003)(83380400001)(38070700005)(8676002)(71200400001)(66946007)(4326008)(66556008)(66476007)(66446008)(64756008)(110136005)(316002)(54906003)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L+nyEyXh5nOp9IcunWNukHZIvLkAY5Sz9dGO4aFtdEUlIuwwgQ5h5x9n9T7M?=
 =?us-ascii?Q?8ArSm8KEqTtQT/pBYtg2j+E7+MPQCWxFzGHy4JvEc+uR6uqQJz3mv9rEZbh2?=
 =?us-ascii?Q?Bp7XdQ4Iu2Okm41bzttZRqHpF+Vj+Rx//nad2quEpGL/IIsFPsU1nvQA00Uz?=
 =?us-ascii?Q?E41/NMVoKPL1UGHHm6S8IGmf6AfNh0YXFhmks3QTutoJD7bhTK84Lp+wDTZN?=
 =?us-ascii?Q?bPwRYJERB6WwWYbknePBOMdTjz/7dbsQ2UFnlObzhMODZEyjIj5hJy3Dv9Ig?=
 =?us-ascii?Q?HDJG/PhpJDA8W6Pclq/jVcJFQ7STc2WMiZHRtDofT6JYUxQ/8s5jErSwbpIn?=
 =?us-ascii?Q?ECR6mEKUBvco2ZwnB3HLVZMHsaSpIUVPhUQ7ybf/I+3yR6/EWvciS/JIz1Qw?=
 =?us-ascii?Q?DbYHsojmKk26aSi1am4FYAtinxZnVhR2Gqi87ZQzrQ1H7sUfhGAld7UtQcOG?=
 =?us-ascii?Q?hbCmQwTLyqFfRwTFu53YCxFk59YDcjGlO74LLJpIp9SZvRAlX3/cG96mf8nl?=
 =?us-ascii?Q?sKrfUhwIsephKWURiTv8EbS4m1lRfMNIN7D99ZMceKuPmJNXbbrWrlLZ3CXY?=
 =?us-ascii?Q?wnh4GL4fzGYcl03WcogYCPMS0s6NUN579e+TWF7BBNXkuFpqpggch6vkBkoe?=
 =?us-ascii?Q?67DRT5gsO/fPxRz3AUGqwcr5fx1MM3mvxIpcqakTd6eKZFejI8hreqTP1orn?=
 =?us-ascii?Q?FDInfbqAWYxkZmnIC7phk8eQN3SboMr/wpyD11xxFHkkCs7avrC8F3RvyLkb?=
 =?us-ascii?Q?JgiOkQBDFfveNTBTAA9mY3YMAyvAQGlU93e/0U0fj7UkreAWOKooLrt2FBUH?=
 =?us-ascii?Q?bPL/sITf+SdfoSJl4PlWIf3BeIw+V2WRCxKsPhO57v8pbtEDlCpZRB9WGPbf?=
 =?us-ascii?Q?wrvQGUOoBZ/pER4N5axOjlGIRMbZGb2SMFdKRAVHy4aonqwvAxIuz+zC+trP?=
 =?us-ascii?Q?iVFagGZtRoexH3a41lSi8iEk/ocyktUApflQ9sOLGCnkMGYiMOrgrJSzsF9X?=
 =?us-ascii?Q?kxPr7qTWzdDSjbpGSHVOeA4/J+8JrgBnEwGb5lfFKuqOVK/ON0OUdY+pRYIC?=
 =?us-ascii?Q?ERgXmo7Z9WpcRbyBEH5NxKbBQstZ7XKXX/X7uStZX/aHFh/HmWGQ2NzBAOjj?=
 =?us-ascii?Q?3D5jPmbMfypZ6rGoQqGRw2+Jb6n0VsTVo2bO2C6PaCdQDLAMHd4tFtZiYFkx?=
 =?us-ascii?Q?s9UKcU7A2x5pNtFB1ylvGDNO4zwn0L1FQP91SdzSIhxjMv/EZzWj+7Nm3DEq?=
 =?us-ascii?Q?UvE/EOAwfC0rWVBGk7cI+JEurLF3zjdyyIALm6eAXjTLcbIkMjLwrfwinI7f?=
 =?us-ascii?Q?zrcRFQTpGTfR/6oHxSWLF15yc7n7XKb/L0sByqPrc2+nYwFW29mvzHlAGZ1h?=
 =?us-ascii?Q?E0f3GJwWEpbudTLA3JQ39jpY2ux0DAn0GxnrNwA1zg1Xn+PBJOF3oorOkci7?=
 =?us-ascii?Q?HDGL5InwUU/7S/wyDLUZiLO4dR1KcJNMiWKDK57qnhdd+WB0DgJQuxPYBmNl?=
 =?us-ascii?Q?qjdslm/mLCarhLsDdW858TEIyx1suuridV/YgDnhx2rgg/Z519hliYDvfUNt?=
 =?us-ascii?Q?cronrdzuQFQu3kENnwT8+67mn44RUpTcS+8U73alX6rf7cXK/3wANR+cz3ub?=
 =?us-ascii?Q?nsReJKw4QIwN5AE4T/4EsC1+2HqIUQTQLSFuSGBQbeSV9khg/MwF/WfFaOFA?=
 =?us-ascii?Q?/iCmPW7lcCVv68TFaRa/PKhQm8bpeYmiGmJ7pjwCVwl3DS0r64AZdIfa0Wai?=
 =?us-ascii?Q?zkfAOKRkxg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4018c9-7325-4e68-dd0b-08da0d701009
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 08:26:58.1833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpUiBz5PllGPrj+XaQS/X/pJo7q51oZaaxv7gZ39P828kZ9csNWRhaQOxgCz+qwZczmxdtqlosOKDtQnjDv/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=kevin.tian@intel.com;
 helo=mga14.intel.com
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Jason Wang
> Sent: Monday, March 21, 2022 1:54 PM
> @@ -1724,6 +1713,19 @@ out:
>      trace_vtd_pt_enable_fast_path(source_id, success);
>  }
>=20
> +static void vtd_qualify_report_fault(IntelIOMMUState *s,
> +                                     int err, bool is_fpd_set,
> +                                     uint16_t source_id,
> +                                     hwaddr addr,
> +                                     bool is_write)

vtd_report_qualified_fault() is clearer.

> +{
> +    if (is_fpd_set && vtd_is_qualified_fault(err)) {
> +        trace_vtd_fault_disabled();
> +    } else {
> +        vtd_report_dmar_fault(s, source_id, addr, err, is_write);
> +    }
> +}
> +
>  /* Map dev to context-entry then do a paging-structures walk to do a iom=
mu
>   * translation.
>   *

