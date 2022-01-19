Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E8493D61
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 16:40:55 +0100 (CET)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAD4w-0004Cg-2N
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 10:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nACDo-0008DZ-Gj
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:46:00 -0500
Received: from mga02.intel.com ([134.134.136.20]:10168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nACDl-0002sk-KY
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642603557; x=1674139557;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A1lOVIXnv0Kian+ARL8i746s5i/64S4cPsWXdnhkCxo=;
 b=DgXybSVZ1vxCmGD9QvR9kBYmQ2sEOjZ2HlIPZmHQKrSubyis9NxF97R1
 gxbF0Ud/Hf2RkcI4YcdPSjYA9AGTzREphccKhfZplmTdEQue4iIg0/iSQ
 HFquNO+5UsFD4/bUcMCPqD6/Z1ebRXEt0+YGXkQeTymbxKMEaepYqJQJW
 S2YbKpJAx8h2dwbfmuRvnpa4pmmQeEKgSJGFB6HzrNv4IiACJLv3r6HK0
 gliX5tVLvaOIp8mA8sLxR/msQU/G64LomT9rDclXEjxooPv7D9OOR6EOf
 Sq9ddUqby0Ny6ETQVh9DBn2TtR1mehcinEVh/wcVGbgkvbrZxfc8bRCwH Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232444781"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="232444781"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 06:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="625907981"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2022 06:45:50 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 06:45:49 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 06:45:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 19 Jan 2022 06:45:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 19 Jan 2022 06:45:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpDzxpuvEytWayMW0mWXvLfYYm8dMPeaKLwSqxaiJBMtP7ZPhUZD0qfIOE/t7fNB6jjOG0WvUKVFUbWjL0eWDKv94yw1zlWkBI8grC8xioT/XGvS5WG7K4SymMTo+avy8d6rb2Oy3+yTzypnXBy1VaJNZvDPj6CgVv8uwiUZCs9PAJbPVo6fEHhkBTdscBUOh1y+aiwuOl/wjNy/OCjb/j2EM3s7u9kGhFmMeqxg4cNM1qA0/IgpUvlpJSqFF9tzMZwXM4DYi7kv5/RgElnjfM0JL1O+XomVX4eE9g7ux8hbvzdidz4X1vWZFQd5Msmye+I2M9DCvNnQy/Tymo/Jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxVtvfsFWtAWq94OJdCCTBfYibxwDO2dtto6GbZQZMQ=;
 b=jsnTRTPeg7GWSiXTkAAaEnjAMV2Pw9DnXFMVDBXzs1GRrgLeC3sbDq3nRlAWBXBo1mi/WRLmVWZYGJbtJf9SzKaJPolQ8vgEjLaQvI5bG2ukYg48DoNIHpXlyfBzrupyBk1Fb8KgC7LDQDQES784HLsQKfsIeTtwnY4ZpUUp0ezFK+KUKY+tgaUcn3ES1wuu1bRPEcq68/GcXKLOr5uUj8OTlKjbsvO2IyEQ6VN9ccQN/weqvUeeMdmmdx4S38oIj1/Pog3Ny4VbJiLT1eeTgQUywVazzwwi/ZPZ/FdePWmyuXaUQ/JtPagjG9wWqduewsmgcfUNEM0wyRiF43pSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 14:45:47 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::b5fb:a48b:9a19:5f4b%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 14:45:47 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH 0/3] Some minor fixes for migration states
Thread-Topic: [PATCH 0/3] Some minor fixes for migration states
Thread-Index: AQHX/g0cWNh0tYTyxEmH1fQcvFuh7KxqiheQ
Date: Wed, 19 Jan 2022 14:45:47 +0000
Message-ID: <MWHPR11MB00312186C547F2650D2D36979B599@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211231055935.1878503-1-chen.zhang@intel.com>
In-Reply-To: <20211231055935.1878503-1-chen.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d73ce0da-d24e-43ac-bc74-08d9db5a6125
x-ms-traffictypediagnostic: PH7PR11MB5888:EE_
x-microsoft-antispam-prvs: <PH7PR11MB58885B9FED73F880ADEAD1499B599@PH7PR11MB5888.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6qlBpWUseRSsD0JtaywqzXSpLobE89/tXHJ/iSowWAYERI3DTH6LVKkP55nO/qS09XUyTA0IKufangf8eU+CBeU1M1/kFPRGgxc4Lt26wiCYTvWKZFPZXfHwTkHOaRnGkBOnZd8mmsbpH3VevUfuBN1cEBxafNZTo/t5xJ16HTLTCMblqohVQBkxCSSpj4ALMUTD+xdBVz2/lMiasG2l60WShnH92CB/EJcCiMRi1K8MrNlP7rccCDNU+Z32KdFn3lb7+JM115/tAk8egBMVotreC+P0XuoiIMF9rvY9n2+8iuca3npI0zbf0gH5oxZagxtZiXaPnKmsW81izAe/9rwYD5isYZb/iRS/f34Dl0FSzUyjaeBsUNgCZxIRllXO+8KjUuIsZ9n+rbudnyIGwZ8hyuM9gKlDM4MCO7T/DFoevnXwnecLE7dGOxlu+iojdMj/U2EGHneXsUC4EcEDtmgazYhGuezwfIu4+A2+mZT/U2aoxiMQkr3Rkrx4TITKHAOmE1ZMgBlS/GQnC8E3vcFeGBzG1sXbtDA9cn7elc6AqW8L7DbuVi9fk3Q3PmOk2x94OLxCXt5q110Jn0fDbU3z7en5wBtEIHHOLrjQygvV9S62Tcx9cDcK513+nzypz6lEDxOe61xhPBl52NTZZoBQELnA4u0goIG0p/phh2ilUOaIaVTHGdE80g6R6ttciX3h94GB6RTOO4r2s7gc4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(186003)(38070700005)(4744005)(82960400001)(2906002)(86362001)(33656002)(110136005)(316002)(38100700002)(64756008)(52536014)(122000001)(66446008)(8936002)(55016003)(66556008)(8676002)(7696005)(6506007)(53546011)(66946007)(76116006)(26005)(9686003)(66476007)(508600001)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Jdz4ABHVK3/kGLQiryY0ZILkZecKvfzblMgrMP5AlngyBTKviQMdR2w6Z5LD?=
 =?us-ascii?Q?qWYV8zSHYUaNeHYbB3bnU4d3YPAFYvlxueNsTjmiDDYq1vMH0RpNVk6Z+ofk?=
 =?us-ascii?Q?WzfZcpeyNElKrX3EJTZ0aOXu37q/sXtvEeeLxaZ+aTpoWYQbGt8I4XH8Y4R7?=
 =?us-ascii?Q?K60Qj0VxN3nkgsv7eEamKs+TTbXdyuTB8hSSTDqUQyOaCOKvOPGS4Z1Is+10?=
 =?us-ascii?Q?G7/A+eHXAgXoZybXfr4hrONq19+BkONY5E0F+cbFNSbAu59qAHv/iwgtSzyw?=
 =?us-ascii?Q?W2qGl3cJPUYg9oPPcE+iw2M7cMRaa+AiZQLtHdcSlsLPpMN3nmCIgD2b/MSX?=
 =?us-ascii?Q?UcUuZ+4SJ4XlyYv3JKra7gqsgcJkOeXUdHMQN9eZwDvThQ9aSQASiQAGiomV?=
 =?us-ascii?Q?AFlQ3qNLicM6TKuccePd64lmG41TAgAGY1p/W3PH5h0nIil8tB4+YRXGeTHX?=
 =?us-ascii?Q?gtUEyVsHLYzdO1XaKl+HTvIC/6O2QjCO3H9qTqkXpOswtZq//Nu9oqoeK/Uf?=
 =?us-ascii?Q?GvERbaryHdVZOelIigm0Kd0ZpVubwTEs4qolgVNDQ1S8w1erpiRwN8FZqpkm?=
 =?us-ascii?Q?Dmf+/yKV0A386fk7TXWMscie7bLM1uxHzJXiQ5OZhxGL90TobthjpdBuklZ2?=
 =?us-ascii?Q?U7zHWVKHjV84Kvn7zd8TuwlP8iUQ6FE2mHAlc3mTFg7oB0OWRhF+by1P3YfG?=
 =?us-ascii?Q?PD15LZ7jghaBR2rP83yEC2dtLS27p1mCeXV6WFGyh30LFaEWjezzk2Ug3hnP?=
 =?us-ascii?Q?ntlj28auPbQcVIEf9jDGxx/vUjb80Yny1mLVYW2YTOr0rq9Cn6TwPucS0dn+?=
 =?us-ascii?Q?aHCW4ng+5nM8mML7g++PX3lD72U0iwtPfRvZ/gcSAfdzkVjQE96vWeDgeZHP?=
 =?us-ascii?Q?is/E8G3lKxtGZySx2Sd33UsGoq0SuZWrGZEsmFj4ksx4UvpvEZRh9kBTtGZE?=
 =?us-ascii?Q?hPsoNcm0xWGvvVKTydMn6hf+2J3Fr8d9WfbO5MEjZ+hLwVM1m+K4deZUcOg5?=
 =?us-ascii?Q?9rjqnSYn7E2Xu42p/L1cvth38uMA6npKF1twAV6k5GbQiiok4VGROBnX3GPS?=
 =?us-ascii?Q?+dRbcHfVvj2B6crsw2l+Eoh+is9DrDtIZi1T+WTKjA8o67kx96JdGYwTDqkc?=
 =?us-ascii?Q?mQnpQvU9NEZDoWMz+5XRrYhb2wq+aX1bJ+uKNX+52DDpuJSkB1Ebj/H9oaHB?=
 =?us-ascii?Q?AFilxKPYbbhJ7BTD2V02KpjwkSgnxaaTnvBqlNY82wF39cxdiQMqx8OmPspS?=
 =?us-ascii?Q?hXyuVYxTY3JI2BAnw93Aeiyq4278yaVy4e7P5xyZWLXauSIGpSS7CIHKcC+P?=
 =?us-ascii?Q?2/muzR0l3Xfjnn5PCnq0U9s9gp4uvoVhoFNG5AHzong7gg9Fz6NRMBV6Op8K?=
 =?us-ascii?Q?cX3JvJf2a7BJfXlvyL4Nm8L9D1+yJNfdW7B83OMwxsanoeWILlnd1U5rQSA4?=
 =?us-ascii?Q?F3HcRwwCcLrs5fYlSgUOx85njT4GNN5r6yoM+7DH2zjk6qmTLjd+QjFP1BRT?=
 =?us-ascii?Q?p9trTF9O8jbI34aWAwih22Ee5IbFbjOPMqA/pxAD8w+1GQ/GSrHfnoYCaQTk?=
 =?us-ascii?Q?LJjUv0SN4LUQY5CYWHqXx60+t0ocVpRHPHx4BB2JMjqd1WCZIuRW/o2zr+QR?=
 =?us-ascii?Q?Og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73ce0da-d24e-43ac-bc74-08d9db5a6125
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2022 14:45:47.2725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnzMNDlbEAwRZJiabHkwzJCJlERhpSFiKxMwaOgqBfrTpcYD4eoBmadCiLUBz6bxSWg0gL5UyZt5h0QuZwrUSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Any comments? Ping...

Thanks
Chen

> -----Original Message-----
> From: Zhang, Chen <chen.zhang@intel.com>
> Sent: Friday, December 31, 2021 2:00 PM
> To: Dr. David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
> <quintela@redhat.com>; qemu-dev <qemu-devel@nongnu.org>
> Cc: Zhang, Chen <chen.zhang@intel.com>
> Subject: [PATCH 0/3] Some minor fixes for migration states
>=20
> This series solved some fixme and comments in code.
> Please see the details in each patch commit message.
>=20
> Zhang Chen (3):
>   migration/migration.c: Add missed default error handler for migration
>     state
>   migration/migration.c: Avoid COLO boot in postcopy migration
>   migration/migration.c: Remove the MIGRATION_STATUS_ACTIVE when
>     migration finished
>=20
>  migration/migration.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>=20
> --
> 2.25.1


