Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CBF51B3AE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 01:46:20 +0200 (CEST)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmOhG-0004A5-Oc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 19:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nmOg6-0003TP-E7; Wed, 04 May 2022 19:45:07 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:25090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nmOg3-0001sY-Fn; Wed, 04 May 2022 19:45:05 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244M8Up7005990;
 Wed, 4 May 2022 16:44:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=6j3dyE55eEx1bluZbP0J0M/BJrnvNEB1E7Hueas5ltI=;
 b=kkqdjL1gwBF7KCzqprplh1K+rkVgTinvm5y7DwbFlHSEm29BF1MgJd1ULXt/+QLIaFKn
 JC7MDwkN6+9tWFScJCTkl0mcua+iVhCqDTHB1iSzlK3x29NPJtOZptnNyeAZXkx3/uX/
 AdS05Qpbgh7u2zmSeNW/jhqFsPfIyE0p+uZSOPywlykXYBxm8YzccOFS/NNv9aPNBFWF
 7fQydCqNyGc4LspqKXtYo98/GIzzqkPpuVMZR4gafTrrXjlxwN1bchwlUv7o7t2mGym1
 UVOuKddim/qGTPEH1Yvl2vQsDDoM6o3njqXlXbwNkS64UiRff4lLLTYSAXBjcEko5hS5 CQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3fs4ny11ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 16:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKg+lLTdyRf+PN437T7UYNXzdhj1lCTDXgYRiTIhkIx9gYmMpcFxJg2HE7rubfMTc2XqiQMH3+Mw2cNcGwUVCfM5nbXOtpTytdGn0FG5J74tg5UIVft5G6qOg4ocnkY2iDd0pgcBckBwllgocdSjSQsM4KGt6hZES/A8jXDh0jpehKMchBY6zFx7Xy94AL89EYR5loWNmvXQDzLLt3bY79wzGUU7dAJ9bpXPFVD57kSS4i+KQVre26r2AS8mipfkeRwD6NfgXodnaqJhVCuh48hlqcje2bkAmXxy5G9TJmv3XO7KoGHxdn1HQPFHQKU6Bhn/EWPmQNcbNmA7JXk4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j3dyE55eEx1bluZbP0J0M/BJrnvNEB1E7Hueas5ltI=;
 b=i32QR8v/uHvNz7Ypwt0PM2t397KFn1MLiUZMOF8mpZQQI9A6/KgpLNaZ41CrzFxEJUpyr7XKEpS/AqGUuzGUDyyPlmV0/TBjNi089xlzsL4T//DqHiBAw6xsHe0eZWDxO+rKcDhENhOBcJ9hQ4Ou39NMbv6cujQ1qvJl8Yx05LQgrSHHJES5PH8IyXhhu6ZxeUOuRE18iG7cbxyvGvr04El3xQsDgr0eQNj3IgDXSB3AY4ODC6DlthBx4cVyrU8GsnbTUi2YrKQuy6Xv4Dla9U3D3CX7uMAqKa0n5QqXwYE1pE2dL6tZpRgocJ2YKxgwmJEPRqneFhA0p739ZlhIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by DM5PR02MB3338.namprd02.prod.outlook.com (2603:10b6:4:6c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Wed, 4 May
 2022 23:44:52 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%8]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 23:44:52 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "mopsfelder@gmail.com" <mopsfelder@gmail.com>, Fabiano Rosas
 <farosas@linux.ibm.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>
Subject: Re: [PATCH] vhost-user: Use correct macro name TARGET_PPC64g
Thread-Topic: [PATCH] vhost-user: Use correct macro name TARGET_PPC64g
Thread-Index: AQHYYBDzvVsemVfSkkuz01tiSiD8nA==
Date: Wed, 4 May 2022 23:44:52 +0000
Message-ID: <20220430035943.GA12685@raphael-debian-dev>
References: <20220503180108.34506-1-muriloo@linux.ibm.com>
In-Reply-To: <20220503180108.34506-1-muriloo@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd4a9610-9485-47cd-8b25-08da2e2815b2
x-ms-traffictypediagnostic: DM5PR02MB3338:EE_
x-microsoft-antispam-prvs: <DM5PR02MB3338E065B034D4FB65147258EAC39@DM5PR02MB3338.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rDlYpBHpe3sXpLkW8CfIzpyH8zuP3MG9T9YvEOxrcwTdmDbzz9U7EWJKNcwfzbDRSyfqHgO2IbpS3I2HRJCz/HphJjk3mnd2+E8ZkLanFkmFNgU5z62vLr+TzAIQpkJ1FXclDb09jL/hw68KYwRzUG22ruHEIZbg969GNwWGyb6ngbJ7hVDdZH5V1twaq9XM/ylIqrnENAI5fyG0IGflhDGgGE+/THfa41siv6lZXnd0+C2KDJAOGrgTwqG5gR4VKtVWhdf2cFVX51/bPh+nXzrEu4YbLo3f2PqlgIhRkpG1NxzljypyMUiU0IF6gsoV9nrHiSv2kZWD+s3Q8uO/2lFwEThJMof1JszdBxRFgBSCRGmKKYSvtm2U0v5VVgBhQaUtCFA5zJci5qZptrULAOJE28aV9H9C+o5v6D0WegIp5epsDnq1rJRBSlVNNcE7zYjh9+FDggME2oVZdgVk38PPOxlwMNwhOUCez0u6dhiZbHwwTRtGf8sMMQ2e+042HJVUYlSpBvnW4n36pABB3uUhbBr6/LHgVevShyYuYZFZHnaUQNIHzKnLMKxcWWOA0kMUQ+3Zty2y1xCmrTCzkmoIPAyjcbS/hJGdtlpOIsbyIP0YdeTx/mhilXl6G1eyCHdyeIIGTcLfs7lpcKjIImy2hRsqAq9xSylVSRHcnLGdsmuEQfWqyNjP0w81/9Y9EA7QWBAVxHft3yy9BZ92zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(186003)(86362001)(8936002)(5660300002)(508600001)(6512007)(107886003)(83380400001)(26005)(6506007)(9686003)(33656002)(1076003)(4744005)(316002)(44832011)(2906002)(76116006)(6486002)(66946007)(4326008)(66476007)(64756008)(66556008)(66446008)(8676002)(71200400001)(122000001)(91956017)(6916009)(33716001)(54906003)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xWc5b5M8h7NgPciqdnoo1tdsdjX+IWzkE9UBO7NjFm/95EA1P2fELzYw0oHf?=
 =?us-ascii?Q?jEVctpp8aFikEmpgjOR3HXAegATQ34e+6qCAlOmIjTm8ce1X0ywHYxJ0l2Z8?=
 =?us-ascii?Q?VgPDiIk1AjWRESrD3pbqMIUn21eX9QXpMyAiggwjm1rsZ2ZrYK9wnuIN6zQb?=
 =?us-ascii?Q?X+Z3OortSyLOrNdOgKWe5eOwgmNLPP0pXEsm7qg36bJnWvae/dT/arA0Ge8H?=
 =?us-ascii?Q?cr3PRRU5zsX5ynicMzxu9x5dSFQJ/yexDQx1Yvy8CVxreq5iqV6/sfNILgZk?=
 =?us-ascii?Q?4KG05Hpk6riyodfLQIw2aXvEMfyeLk041ipohVLQUfJ6G5d6VUpj3OxOfQgI?=
 =?us-ascii?Q?p2+eghe2CN8ScdYw015kzcqv1fTImDvANoBJIk5+nOe+PX0SJsDKbFV3+O1m?=
 =?us-ascii?Q?P3ed2RMnDWygJo+UcO/zScHUozzgeA7S4PEN3otTG+dDSbMrw03TduomOyR2?=
 =?us-ascii?Q?3/NHFuTbE1rWGYCtB5160ABbp6byG5XqP+z++N3zUTPsAJvRiqNWaS174Yem?=
 =?us-ascii?Q?KzOz+FLjN5V3JDT3HLsbk0YeU/VIZ1BH7LgE7QZFThVDzXffglmhpvyb5f20?=
 =?us-ascii?Q?dNrJ7JPO6FgTTn+4tJFEU79ijZab4aKlhJyprvXlTrU3aXCWMDGpVsBL+jvu?=
 =?us-ascii?Q?kL5VlLnA73I+mSNg2IzYG8B2YO85Iy2XCusvCfsWfTJWQdDpXCX9/TC17CVG?=
 =?us-ascii?Q?W8oMcGt7Od2DbQhr1eva4j41mY968h9ZEtEBuxWJLLshKP6d1ZsEwrboejpy?=
 =?us-ascii?Q?H3Qr0H69SBdeCOFt3OQd0g6sQF9obBmKWLdH5By6/PQbiz/G/7i/8wHXQvhF?=
 =?us-ascii?Q?QnHvOL4eRM9oyC6Vp7EnM5ttDwY+60pa6hlXuV9+uEFL6Cy7cjknVVZ6JKws?=
 =?us-ascii?Q?ggn9/Bsm33dETcNSOEnM5bczIe+bUsY5r/T1atauXUS/OIy9eJO/vEyw87Y0?=
 =?us-ascii?Q?NTFpnUn4m1rH3RvuQW+U5p5U1jQuh10LKGHMBQvojCS/c79BgBHBfM8mCm77?=
 =?us-ascii?Q?8vKBKXiOlumMDTw220Gww/Jjxx6dnfwxCsxUaOpWGyi9YdZLX9N1UC5e7nzL?=
 =?us-ascii?Q?QEgOmGlOY3dmAumX8Ip23291R3Sgh1C7YAeMN7w0O73PFkv+OROjFT/oUvpC?=
 =?us-ascii?Q?mDLJ0zznGAGw/C94EeYfz6upRzt8akqsnwWh0/P/s3VIMs/Wvlgy6OsjJ5QX?=
 =?us-ascii?Q?fhcqlpg2zRjL4Qta9UBnsuX9EmOWhQTrThJ2BXGYrvhq2LnYnWVDqxwyRhRY?=
 =?us-ascii?Q?qtN11QSAEhv/fzUHTz7Qxj3RPCXir8lb1lfU7T23S9GxtjdH6P2AroCjnXpw?=
 =?us-ascii?Q?atqJt9kMvxS5aO7MhAgnP2QlFrKKiAO6Hd8t7749V1Yzog4/ek0LV4yQILT+?=
 =?us-ascii?Q?CqOpbokT4idO3SFKH7AbDbkLwhZe+V0ncFtVfFmbvhU4cGsuVU4Xoybj0p9D?=
 =?us-ascii?Q?oX5js27OzGih3JUb7HAT/h2WCmJmCzalTSipO8FRe8btiLKewTb1c0ahIaT2?=
 =?us-ascii?Q?/phqY83X5kq4ETN1Cxh+XTeWA4nrZ4BAV40mWougaWw+VzXPioelB0gSlspF?=
 =?us-ascii?Q?jKp6JfKlRFHk8ZOYi3AdCup8GRHUG1kZyOlaUtWCJ00cFYdKdFH6P8Dc7GVz?=
 =?us-ascii?Q?Fx8zVdt87FS3RtRbTkdsyWwq0zoqSv1x8UEr/BHTf3Ztmv2ZBRSOQgynaAGI?=
 =?us-ascii?Q?Twpem9FjEcuT/4bABlkGI+YkZtS2tBPR1FEzWNKgzGWBzDjsAzQu/BTOFhNL?=
 =?us-ascii?Q?2iAjdoc85XfhyS7eIi6rV18YTOG9fr4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F958149033F285459CCC931C37AC5675@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4a9610-9485-47cd-8b25-08da2e2815b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 23:44:52.3469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o2YN2c3MX8dScIPkkfxMqVkWt9np+a820/DpRoEViDh5+cxEcJZXRjnHbqQuerh9mCV7fY1ulrc1IisGOVhY7S3z9AuIa8s2yGclbUEHkWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3338
X-Proofpoint-GUID: zVtVnn880BdQPHu6egmvuhxRXHPtlXHY
X-Proofpoint-ORIG-GUID: zVtVnn880BdQPHu6egmvuhxRXHPtlXHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_06,2022-05-04_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 03, 2022 at 03:01:08PM -0300, Murilo Opsfelder Araujo wrote:
> The correct name of the macro is TARGET_PPC64.
>=20
> Fixes: 27598393a232 ("Lift max memory slots limit imposed by vhost-user")
> Reported-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: Peter Turschmid <peter.turschm@nutanix.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/virtio/vhost-user.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 9c4f84f35f..e356c72c81 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -51,7 +51,7 @@
>  #include "hw/acpi/acpi.h"
>  #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
> =20
> -#elif defined(TARGET_PPC) || defined(TARGET_PPC_64)
> +#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
>  #include "hw/ppc/spapr.h"
>  #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
> =20
> --=20
> 2.35.1
> =

