Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4691B452692
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 03:05:23 +0100 (CET)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmnqc-0001Jr-5W
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 21:05:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnoh-0000V5-Df; Mon, 15 Nov 2021 21:03:23 -0500
Received: from mga17.intel.com ([192.55.52.151]:29503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmnoe-0001Ou-SW; Mon, 15 Nov 2021 21:03:22 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214324910"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="214324910"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 18:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="735275221"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2021 18:03:17 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 18:03:17 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 18:03:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 18:03:17 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 18:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gG//vSMdKanCWK0LbZQni7oJcBmbNhE45SlEU4LRuIJCeof4xE1UuarLCn9GWPAp7deMyScdWy35fuBAKiXoKzjiUxpLwvEMMWOXzn1CT6lTAZwx1a1Vtsyrl3jTqHDCe6PID4OyYzdVE2Ztz5K2AqTNNe8oClMiPYb+ujBb1sBUp2jlDI2GyRQzhO90yrCsgoZiEPs98Q8FgABQ5CalDhzKaZhldmWbZk/yLW3jCKjmQHxN5IsiphWxiCmUDc4sQqJDx6on3wAQ/lTUoV3YQR4TChMIgTK+5jqR6SZFbCoBPnAZXRX/kqYEUoJxTTvizNtXz44oS8HuSnFtQy3zeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWuEmIokuY985z/9gQNnC8XEO0Wt2qXv9kQt2EmCJcg=;
 b=Ko2grtSRuhshGuHOznStZUq3dhk0HRIiHrmih+X39dDHl0gcytqVieAWZn6Pkn4O6rqsyG5qDZGHRrtLlV5zkx6p4QzutQEqoxYHqVOrrlVMA44XP9CXPDTjtR0Hvi4iw1PL3jeOxKCMWHWR6tOhQYEW6fTutCEQtxsNO2aWENNOoGfimbLWn2M+1CGfTofc86ctclQHYEQoYOBwL0skSWKcMFyGv8vRhk99N88tBvvi9ZGkaC5cxkNEYh9sEXKbjoMVQwc6hdNc6keFgZf3dSt6uMAMK0PcMjT7FMxZFPUskDuQ6ALmweiOj0f/6js7/21QcRN2CWZcW+7rOkdQXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWuEmIokuY985z/9gQNnC8XEO0Wt2qXv9kQt2EmCJcg=;
 b=jJiqXO5SE0Djqh3vYPyZVFoDa3o9LeNr0k9j2CRZaXUbK2Zmwj7B92Q8wqzSKqmfJukKbUw+xVLKUWCaTc3ATfc7Isjy76wUUwx0ZHke6nhxUrO/YGN58WnV7w2bOels5dEXgY7WXtymIlZOyAcAmfdih7awbbU8/uN1ros9oyA=
Received: from BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18)
 by MN2PR11MB3693.namprd11.prod.outlook.com (2603:10b6:208:f3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 02:03:15 +0000
Received: from BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3]) by BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 02:03:15 +0000
From: "Qi, Yadong" <yadong.qi@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Thread-Topic: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Thread-Index: AQHX2dzamYXy/ElsOUmIuyd+uNaIiKwEogIAgADECoA=
Date: Tue, 16 Nov 2021 02:03:15 +0000
Message-ID: <BL1PR11MB547976F230BB9EAE2E7C458BE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com>
 <YZJq4E92zYQeqMy7@stefanha-x1.localdomain>
In-Reply-To: <YZJq4E92zYQeqMy7@stefanha-x1.localdomain>
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
x-ms-office365-filtering-correlation-id: d0d2c163-932d-4d25-51c3-08d9a8a540a1
x-ms-traffictypediagnostic: MN2PR11MB3693:
x-microsoft-antispam-prvs: <MN2PR11MB36938FA433A7EC8D3228EB86E3999@MN2PR11MB3693.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1egjkxVhAvETlCft38EsUcJCMt6Vk+BOiAoMqrrY9xPrsPRQGLu/7gRvHA4BteRuJiG9VwlXUGz+SwaQbPXTwOIu/UMLJwuf3YSkHv18XPB24b5R1D65A3+BNq0eWwTfMqe3IG2N6PdqUsPOpIZA5h2iFvS2YVGrPfF8qwljC1EVu2ubXYxG/g3mQj07N4V0tcA19xzXEsD+Ir1iSJPkRC588kGTjnck/dLh8ATMSpyITr3dMy25G9gBBkqLwrtKoJ+Y+cUl+gSSeqF0JM9yNSuBm9lhJ5iXCyAMAICQymWoOxiYt/HKhBWFTMb0OkmAuAOksVHQKFf7kn1xN2ApOihY8ejkE6KYeyAQA+RmFxGcsp+jKolpbptXGYd9OqvUc2osoPh+SzeSWgEexcExEAOXY9TJoboxjMSNe8kOh4sZSNhqBIQG0bvd5IYaWloYuzF5/eu05lc3ng9X9FvYp2gKSA6bSlQDoxSlxtBP5iVKNu7RsWhE2k3b761MYjevW7zlv+XE1DMTERFlqoV5k2/xY9++mRLhgIfJdb7mncNUhoQWRcck1iMXvr418x5uctf4f7k4DxSDZY3U2Uxc9cGkS87OogcUv9jgnK6kB+BAQ1kGT1PgPdVeSWkObhtAYcrWk9GjgbpANB5mud/BISYwiMVYeGtSA1VNt9aObtkKCwJfp0JisV5aUSvuhUQy3cYI2w+qapA4zCs+V6RxpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5479.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(82960400001)(4326008)(8936002)(83380400001)(55016002)(6506007)(8676002)(7696005)(508600001)(2906002)(9686003)(107886003)(66476007)(38070700005)(6916009)(71200400001)(316002)(38100700002)(76116006)(66946007)(66556008)(122000001)(5660300002)(52536014)(86362001)(54906003)(26005)(66446008)(64756008)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eTW1Z8S8V/+/k3LcdlUzdvRxr80yUTEHnp+sSdq8cV0Z1rtdsvAYLqWS61i+?=
 =?us-ascii?Q?6pj4sF7fNeNwrLRxdH5dluO7mMP8bs6oHeGGvQy0vyZ8NqJd9gRR0XF3f9uo?=
 =?us-ascii?Q?1Wot4qi8wCwFcmGDdwX6W08C554T6x+y9qIirlGoUxNnMiK6gsl26o3Q1HeN?=
 =?us-ascii?Q?oamsImbq+4RHXEMYVbSoH9pE5fUP3MIHwCvNKDztvlg7yzgp5Ou8UsW+zlH9?=
 =?us-ascii?Q?LVygBqj8oorRKW7bq4SaY4zpDPfEY18zGZMeIegrrp2nzodlgQPa0MyBO8cS?=
 =?us-ascii?Q?LAwsG4qiEpl3ROqoV404k2WbEBFKGfp2dazFjgQ1uT94aiL+G9OhphJm+KnR?=
 =?us-ascii?Q?n8JdYopAiqBz8AAnRTBwhCGzAeUgKAQWauze+WLDkFNCj90m8aAef4iHqch9?=
 =?us-ascii?Q?o4QDaPquQaeB/uU/UAAS2e1N51U3HjRDgstrfueE0cH60n6VP9GAKoyafEGm?=
 =?us-ascii?Q?zB0nOCpbxT/Q7o8sut6vSeqxfWLO5S0PP2jmVyQX1/ovZIJ/+2ybXgY/Lf8h?=
 =?us-ascii?Q?ga+cZAoFTCiklRtVcMabV0FcevEvnIlVdff7RR1kWVHnE9ZSus6GE/f2T60n?=
 =?us-ascii?Q?/85UtX6QC2GLN09SOCzQK8srXxHLqvijm0a4EM8GNKZfGaQ0EXEZhzNcBwur?=
 =?us-ascii?Q?ceYLEYoPOLJpvD+AM7QNum2p6uHjv5jidjsIO99ysg70Vbu2ZdUJ0wCICOT2?=
 =?us-ascii?Q?D0/SjWF3J+KK90O8YCUxQ7T6U4M0Zu52A+Ve6J6cz32BwSXtYUkuGqKRI7wr?=
 =?us-ascii?Q?ZVu9Sjg/tz7v3+0HfiDlTKWBR4hhdChXUmgfgrkJs2Qvn/55nknBEsQvBql/?=
 =?us-ascii?Q?9/M386c5D7WMaUCDs7saoNQCJSWqDowp3njK18CrVgZ8eeBMQwg7MtF9UKIh?=
 =?us-ascii?Q?Nv7fwsLLwFcTwIm8XamVn1B4J0B2ETFSEwlmlmLtMZ4Lvu2GWZBeJHqBYjsK?=
 =?us-ascii?Q?RQXUwxY4mK+jVtRN8ZuvI9efu8Hw+dEjoiEYwvv0rcmdx1HYW28GDeHAlq/Y?=
 =?us-ascii?Q?vwPEX+khgkNVPSOzKeqA9I1qXRwwk0bWRO3/JAOnh3f13prtkz7ndqsGAILR?=
 =?us-ascii?Q?LQhJLeHx5wnyPx9DOV2InhADq7HnHXeVtYsrdTTnzowi1bhjmRJTL1P1Tkaq?=
 =?us-ascii?Q?JQ6rYcn+17NVpVfbj7vBZYNj1C9BJ5kskZUHF+KhOSfU3MXjX6Srkgc+tiYJ?=
 =?us-ascii?Q?kZ53colVDint7TGSecfDpwj+E8XEi5LPxZjAGW/Qp2aeN27YGjR9d7mxyYI3?=
 =?us-ascii?Q?dhY7u5ZJiwP6vKXIg6tYmMd5d1MPYYH3Nja7NQskvMG2xkkzLXb8qYB86hnl?=
 =?us-ascii?Q?IlGsA4kvEbfFyVX92OSBPt20aCHEQqMG9gARHP0mMn4lzrRmp9ibQAXkrz6h?=
 =?us-ascii?Q?dk2U2Hn9ai1unmKfDhroat1LVqtuT4p4oqZy9nxDiqiJe6XGjKtOnnnXz5qX?=
 =?us-ascii?Q?TqwZBUf6HED1vUrDTQ/DvH4v/5CXutvn8pWLfcWhug06I7oVFTrCcu+Lxmb4?=
 =?us-ascii?Q?XZf+Qtxqd5jhnrLaoWIWrtoLOwpCDo4oWBZHZnUbbUsqcVgKoS89w77prO/I?=
 =?us-ascii?Q?YrkADnNQkSZOpoDO7QISZLXyypreeNKYFrzS9MRkoq2KhMeUuKjUDx4KQrnn?=
 =?us-ascii?Q?wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d2c163-932d-4d25-51c3-08d9a8a540a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 02:03:15.6243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVRJiMV7qkgJgsAUdmodrPsNXwZK7z8N1sqoPnc/GNpoKkIEzF8uFgK2NfEGUEVlCSXlEyeQ4s/N7+ntLgyXbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3693
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yadong.qi@intel.com;
 helo=mga17.intel.com
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
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Kai Z" <kai.z.wang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Add a new option "secdiscard" for block drive. Parse it and record it
> > in bs->open_flags as bit(BDRV_O_SECDISCARD).
> >
> > Add a new BDRV_REQ_SECDISCARD bit for secure discard request from
> > virtual device.
> >
> > For host_device backend: implement by ioctl(BLKSECDISCARD) on real
> > host block device.
> > For other backend, no implementation.
> >
> > E.g.:
> >     qemu-system-x86_64 \
> >     ... \
> >     -drive
> file=3D/dev/mmcblk0p2,if=3Dnone,format=3Draw,discard=3Don,secdiscard=3Don=
,id=3Dsd0 \
> >     -device virtio-blk-pci,drive=3Dsd0,id=3Dsd0_vblk \
> >     ...
>=20
> I'm curious why there is explicit control over this feature (-drive
> secdiscard=3Don|off). For example, is there a reason why users would want=
 to
> disable secdiscard on a drive that supports it? I guess there is no way t=
o emulate
> it correctly so secdiscard=3Don on a drive that doesn't support it produc=
es an error?

Yes. AFAIK, there is no way to emulate a "secure" discard. But it seems als=
o hard to
detect whether a host drive support secdiscard unless it really perform a r=
eal
secdiscard. So I choose to add an option for user to enable it for virtual =
block.
There is an assumption that user knows whether host support secdiscard.


Best Regard
Yadong

