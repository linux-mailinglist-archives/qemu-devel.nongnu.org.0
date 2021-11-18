Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48498455488
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:04:40 +0100 (CET)
Received: from localhost ([::1]:37208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnaXG-00042Y-UK
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnaUg-00033j-3O; Thu, 18 Nov 2021 01:01:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:17106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnaUc-0007v2-Sx; Thu, 18 Nov 2021 01:01:57 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="214152425"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="214152425"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 22:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="593659520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2021 22:01:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 22:01:51 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 22:01:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 22:01:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 17 Nov 2021 22:01:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdNj1t15WLeMfHtA6BvzJN8ebnRCSz8uJXfGLaNjpPGTuoYHJNVY5M1G7mH1gGON5dvGo4ctP/FkQWLZi1Y6w9X7GxUwKydxbJ0VdFBDRr+2hpulhoMjiIRMDV5Az0vi0uPsYvAwS1SsivmvPWRRdG314fUhomvLmZ5gOdcenYfO1F/Jwa2NjVisvvGHwt1EpW2tbxOdleZM4Tg96JMM+OF04M4LkADe6hCFvRhexKVDZ2bJFS+U/7bQxWZdyeS9xybgOP7peulNQryMX2JTHAkmsliQQvzzEDCo2nV1u7NrtrDPtMe60wKqym8sVs0ay4J9mZ4NIIy9lbvsXQDY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RCMFj33iHGbkTV5TWbcqzC3BtiWemyFYqlMW+ShPGw=;
 b=TZ/R/FHYrUwm2c9sR5jYqtBQ9ZKXj/czAGuGA3oRx1vgBw+cTxWCehtygGszxv4M1OdsMq/d4q90XaM42tCG3Sq7s6mBjdMqJd4d5IsoyzNuzS1ryrWtQJLh6Y90Yk2l0k7Fj8fO2saacggr9jJo8u+bY0tNOWNa22uQPbiyi5BpadsKq4lLCeGrR0tr7fXAtwlGJ3wiAWxA0ryZfvjI+VoOYnsF5aGXjav1vhHESV5q7WrIvc5/nJOHqPb9rE1GGEHX7pb8B7Gy7O2oGhO27bSfJoHlp0QNJHlEnjJuPPdpYjuGzUMkSmqEReXX+Vf+IuCtxhIj3Jivg8TZ9sK62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RCMFj33iHGbkTV5TWbcqzC3BtiWemyFYqlMW+ShPGw=;
 b=N5k/hBmW29VyS8y16CaumWU7363w9MyP7gZZnp05UuFbXeI1Jcqxj2baQtVqssT/gV8k4PBKpwLBKbGl1tWk5j1ThHhRVMJ2k0jrZm81OFAGhyZcEBqdNQRAsxU+WPPO40p+3s1QZ58rEA1zvYUa2z0y2JS9vd2LGUK1WkSTb5k=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MWHPR1101MB2128.namprd11.prod.outlook.com (2603:10b6:301:55::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 06:01:48 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 06:01:48 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Xie Changlong <xiechanglong.d@gmail.com>, Wen Congyang
 <wencongyang2@huawei.com>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, "jsnow@redhat.com" <jsnow@redhat.com>
Subject: RE: [PATCH] docs/block-replication.txt: Fix replication top-id
 command demo
Thread-Topic: [PATCH] docs/block-replication.txt: Fix replication top-id
 command demo
Thread-Index: AQHXw/6GdjZhz7YqxEaleRG4K98H2KwI+jIQ
Date: Thu, 18 Nov 2021 06:01:48 +0000
Message-ID: <MWHPR11MB00318ECBD5545AAB10676A3E9B9B9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211018085044.2788276-1-chen.zhang@intel.com>
In-Reply-To: <20211018085044.2788276-1-chen.zhang@intel.com>
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
x-ms-office365-filtering-correlation-id: fba51e4f-452e-46d5-0125-08d9aa58e86e
x-ms-traffictypediagnostic: MWHPR1101MB2128:
x-microsoft-antispam-prvs: <MWHPR1101MB2128E0756422145048C0008C9B9B9@MWHPR1101MB2128.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bdfT/loTaaqUafgSEj7eTMZuV6gsBoRNMXf2Ab9nvbjLHvleB32qnIYUhtJ0Gyqk8bbH826+NjnbrRN2wUvrI8CxX5+eonEQ3g3jxpv8AtVthKHO9kXQs1YTVGWH/Z5FKSW1Y3lgMzPZQTjo0X5+Nt/fcWRQsHqunX8fwYXp26Vktsxb/ErPmWaVOGo5wkFeU0H/8c9iBgp/0PksB+6ScLPJawFa7kYuaBE0uAM9fzq/e7U9SwCHpCJoXY4XmdZD2CWXQ3T3X1T5uoVTAj52SEM3ZYhairNp4lpgW1MVuzo/cqOOuoVSsm/2Z6FKU/P0SOjNhfZ0ZgjbdOsCvlfw8H8c4yViVXITpy8acq2CHHaRcFOUG633cYusxya1PTS4it4JE70aUtDMPdxb39fsPjHeTIbOKu+se8dyU0x8GIbQYUHAm2RAVS+lgTYj8S0fe1wPVkVYJG24BLI0sjP7GEP1Y2rVwW0CYp2Hv9E1JOkdQsJ2Xdp7Dvack2sHE9R3Ng6pJvwOfVmD94idFYCrLXrzM2W4H+sixJVrWevW/7/6/5CNp6NQuWSgaiw0wPq0NW5tbYZNwuW/7tg/ZBqWb8u2+MIvYYC2mNsAa+63kB8hrSNYATV3bMvAPPvmLfS4T8pD5mfqgLN73I9HqQleYeiTk9VwJCC6sdrNzNxoBllTioWxc0513xvG0ruadhoExtj4dQL8agN30qhAk5JJjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(83380400001)(110136005)(4326008)(86362001)(5660300002)(6506007)(54906003)(7696005)(8936002)(55016002)(53546011)(71200400001)(76116006)(66446008)(82960400001)(9686003)(2906002)(38070700005)(52536014)(66946007)(64756008)(38100700002)(122000001)(8676002)(186003)(33656002)(66476007)(508600001)(66556008)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yOFdBRwzntQTstrVcLpWgPNPQZX7nPkvCFd4cu1f08rm1pTxHCC1B7NN0fU4?=
 =?us-ascii?Q?2WLkgOTDgCW4EyRLNIIpMplN7h+8eiYOrIYtP57fwsZsVSX+erHQGtQpoPre?=
 =?us-ascii?Q?6rjJyqDB4rBHZdAor32uFZv8MLpnPOf5XR2xp0J51SYYzgdVkvHR/ZSQS2yf?=
 =?us-ascii?Q?h2DhDIiRxPJRueuJxnfTdboSrbwgpN0YNRiE95RvEluiqtCvS0m3krXgFDwF?=
 =?us-ascii?Q?vb2NblqOmu+qFh3hlPF5ngrC3foH9OSD1nxsH7osBviWEdS01mcL1DVCR3nL?=
 =?us-ascii?Q?QQw1+bRpWMzhTa5fB8kHQwcsrK03O/6c20XHvMVnxWqkpc0Lb4MQAsDFqVtr?=
 =?us-ascii?Q?4EZ9YcAeVzg2svt/lymlp7KvNeqGueEmUJoOlrLiUxdL2UGZ7x7zqLPrvIte?=
 =?us-ascii?Q?Wb8fiL9G3iy1qNMcnH0/PJuPdxCDA3EuwEs8s+Z77sY4uu0o+McRJOJlPFf6?=
 =?us-ascii?Q?k467Y0M6UrT399wwVjM7P+93OoLCD3D6lChuI8ZCdq+vMX1oX6i280Pdo5OL?=
 =?us-ascii?Q?0BIPzvJSvRElJLjmvxfDhABmhFcm4tSNNi5gIzcpzjy28VbbvMZpC7aTkwKg?=
 =?us-ascii?Q?jkLqTu7djLPjOPZsYqPrOYeAVHfGE7Q6NgFlLsC/s8vgdDDs9bjZGaPMoWrD?=
 =?us-ascii?Q?fMiCHN/1vNC/nk5QMBXvlKKVr1ZZImTMK9xL9gdBoZ3n8j3K98kTPOWJ4Ndd?=
 =?us-ascii?Q?u6tITfRleaaVOPxvYNvdPbVq/OIdHhe8JM5keAzprA48QHLWqCbAe18fESc0?=
 =?us-ascii?Q?mVEYR4FF9XQGQJtVv2Pnr4EpIdzujDl26TLo/+BUtBEmTLTI6v58QZfn/eiZ?=
 =?us-ascii?Q?hecjWFYuk/Yall57N9q6foBa/LNikvIamhWQY5ctmb0nHyzSQcvcOud1jbvf?=
 =?us-ascii?Q?R2xGNFr2W8r5dppV6XMQZYrxi5whQY7ZfE7KCC91b/y25VNWDUfTPTGXFRfU?=
 =?us-ascii?Q?Sai4JkSXiyL1+k5dnRzaDwcs15cQtZuzZTBW2qioxS2f5NupZqzm10K5IWve?=
 =?us-ascii?Q?4QXRf84n7QIAaNWX6fZxZVvbBOPMvDWfiUld6QA7fqyXMApSi9qNpNSUDtRv?=
 =?us-ascii?Q?ztuVpFdgWcllvn141AZmH2Ub9Rq+Qzim1c2CUWWoerK6+hROBKamonA/Iq/F?=
 =?us-ascii?Q?FvIcZZlswdhuobr/DNFNPfLVp73DGNAUnoNhzxt4N9ViI/jEJDefr5jitfTi?=
 =?us-ascii?Q?t00o1ERKPXmKl+xLZTa10HVitCsWOfEte6KSq9N9nbgNHGFBQ7q6kLtDG1Mv?=
 =?us-ascii?Q?KXKe1+CvWq6iiIwTLYa2m0U8ymFf/kNsJjjp09gHXjmGCwm7AYVYK9PToRGW?=
 =?us-ascii?Q?0nMhN/Ns1jqUy3je7599+IOOIpegVCSg2zyOZnAhw3yb3v0TCc999MbHnAVA?=
 =?us-ascii?Q?3bWgKELQXqxZ6dy4ooA7rJE/0+SXQgbFPnu238xMPoJpQllx4H+4Y67VlgPr?=
 =?us-ascii?Q?TUuWT3EjflCN6F7LT5zRXU4J1Bcnu2Nbd26rCGE3px3ZLz9/rE2lMayz7Wf+?=
 =?us-ascii?Q?gbmdqBvwFHAeP5MC/gZG7cbpwXTgIQctZeXM+WHnIV2O81a2lCwpfX+8E8Jw?=
 =?us-ascii?Q?Nziqcr9R77h2JtpNQiQbt3TMieLUxZQLPvQPS6N1AxIq0kHtNWow1XJp2V7h?=
 =?us-ascii?Q?WagF7jAHtpniXHGLOoLXxi0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba51e4f-452e-46d5-0125-08d9aa58e86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 06:01:48.2183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18vouf7e5l64B3Y57k5fwSVYG3WNbifb8H60jK7FzgVQrzZekG5c9Z447xCN5aUIGAvA186dwfaBngcpsA2mbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2128
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, qemu-dev <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping... and add more people.
The original demo can't boot block-replication with COLO.

Thanks
Chen

> -----Original Message-----
> From: Zhang, Chen <chen.zhang@intel.com>
> Sent: Monday, October 18, 2021 4:51 PM
> To: Xie Changlong <xiechanglong.d@gmail.com>; Wen Congyang
> <wencongyang2@huawei.com>; qemu-trivial@nongnu.org
> Cc: Zhang, Chen <chen.zhang@intel.com>; qemu-dev <qemu-
> devel@nongnu.org>; Laurent Vivier <laurent@vivier.eu>; Lukas Straub
> <lukasstraub2@web.de>
> Subject: [PATCH] docs/block-replication.txt: Fix replication top-id comma=
nd
> demo
>=20
> This demo not correct, the original childs1 can't pass the the
> bdrv_is_root_node check in replcation_start().
> Keep consistent with docs/COLO-FT.txt
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  docs/block-replication.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/block-replication.txt b/docs/block-replication.txt inde=
x
> 108e9166a8..66ad540676 100644
> --- a/docs/block-replication.txt
> +++ b/docs/block-replication.txt
> @@ -179,7 +179,7 @@ Primary:
>=20
>  Secondary:
>    -drive if=3Dnone,driver=3Draw,file.filename=3D1.raw,id=3Dcolo1 \
> -  -drive if=3Dnone,id=3Dchilds1,driver=3Dreplication,mode=3Dsecondary,to=
p-
> id=3Dchilds1
> +  -drive
> + if=3Dnone,id=3Dchilds1,driver=3Dreplication,mode=3Dsecondary,top-id=3Dt=
op-disk1
>           file.file.filename=3Dactive_disk.qcow2,\
>           file.driver=3Dqcow2,\
>           file.backing.file.filename=3Dhidden_disk.qcow2,\
> --
> 2.25.1


