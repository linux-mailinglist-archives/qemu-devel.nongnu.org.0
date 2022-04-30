Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D219E515A36
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 05:46:36 +0200 (CEST)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nke43-0003sW-Cn
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 23:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nke2Y-0002dG-VP
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 23:45:02 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:28866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nke2W-0001hk-5p
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 23:45:01 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TH1qSR025251;
 Fri, 29 Apr 2022 20:44:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=u+MV6Am8DgR8pigVQLG0Ul6gKw/BHivoGM1Wgeahks0=;
 b=JOlBZ3RYeH769YYNRCK328imC3/RK0srZZPGhs8dU4v1UFUuVM61+ElDxFC9x/RmZfyO
 LKNb3DdrS9wpv+6zYvPPIKE3OPKRQbxxi9knEhiBJm9F3dUY0f5D4YC3zqYGbskXF9ZA
 qq8dGapGpPpXCrHz9PoECPgnAx4j+F4UmE0r2DSd1+c1lW5bu4tKs+jSs9OkWsv/1Qiw
 J/+GhNrOuZpZe5x3+UA25Cb5rvpomJh2yt/l13PRq3nNJlZPpdNdlhai7y2WxTmHLADS
 GHNYp829MUOuGhgoRn2rETMXccOrHlR7wkBcEjthH7+mIH5ecYGfr7JjefrFIE0lSes9 0g== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3fps5bfk0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 20:44:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYy/+aBGC8qBrNjcMrIMVebuBspZJxJjmilOl1dMvp7pEFrDv5jChHZ3QYs6iO9nK0vtIN/+cuVs4UZncsWKS7y96SgPoOFdW64qg0UDnqPHNtDW9rJvc+AP4XR/xJ7NAloupWrP/ULe4QNAqKYWy/b3Gy3evWF+xjMW6aMb4nhfwA1xnG2GenSgTY83VDESd0pLVpRoIpX2xFJ+FbvMVyRqX13L0uDvwKRCGIUz7qNVYvI4EcRD99CwS6Ggf2wTUQNnrkvj0d2X8/zb0pDF7xEN0+Lb4KzMN7aunjyS2J0N829pulZ35nzYn8lzN5CdZXZEGMMRH93vb0BvP8L+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+MV6Am8DgR8pigVQLG0Ul6gKw/BHivoGM1Wgeahks0=;
 b=GG49lBwEQXgpRwgj83VyeiquRnXvyG0ah/Q+qNlgLAR0N3GCopjcdd9wiqmyALal5VvdEmxckLdU7nMGXxn8ujyOCpeJBePEpNyKggH1Exp5TpVLZgS8QbHUFyKCtCYMK9HMm3uAjqquWyTZB7FO6G8aEOj61Xc3XewfiMq3cN+oZcMxzLxE7hOmskpChfHe/cueqn03Wn5rR5ykt8W9VVRNS/AnXw8/aVwDF44DIzjJ4iF2UYKe9bNNWijBBN50XZKx3Ye4xjlLaszkA3NRtQEFNGu7yphjW/YJG2gruFIxHdTubGzD/QASfe18jTxKnrTJTlKguW4V2ls0nqPSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SJ0PR02MB7839.namprd02.prod.outlook.com (2603:10b6:a03:32d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 30 Apr
 2022 03:44:52 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%7]) with mapi id 15.20.5186.026; Sat, 30 Apr 2022
 03:44:52 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] vhost-user-scsi: avoid unlink(NULL) with fd passing
Thread-Topic: [PATCH] vhost-user-scsi: avoid unlink(NULL) with fd passing
Thread-Index: AQHYWh3NLvG70jCnfUuqrfGA5Xh5Da0H1QkA
Date: Sat, 30 Apr 2022 03:44:52 +0000
Message-ID: <20220430034446.GA12591@raphael-debian-dev>
References: <20220427100116.30453-1-stefanha@redhat.com>
In-Reply-To: <20220427100116.30453-1-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 406bddd3-a130-4ed9-2437-08da2a5bc8dc
x-ms-traffictypediagnostic: SJ0PR02MB7839:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB7839A15B8022FE48E4FBB7CBEAFF9@SJ0PR02MB7839.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WkkXUmxkvN4KHycsGWmt2I8js2N1xMYuWa4w5cQQ5EksEjYX17lTTvGSHcLAiY+rHGrP2uYRkpExr+Jk97UkWQ2ugV6hLzPqCCfKTuc5d9EwIZKOlgpBWVdm9FKdnNm/wqUyS/HK6vyxom1PqdVBGfjEY4D2MVVP1KzIhbzBpWIkcqIeWqgYck2rWlFAWRV7L2UWP+odjYYQ75Qk2x8vNX2Eyo7HbrT2hI3jozVQtHuNKzuo6F9Ori6ORbq2SKLNI+P042UcQqwuk9BMtEDc3/h9wq2P8u4m4ZaH4s6u6QuA7u3Fzi0T9zypOEtnsMtKGkmkI3aWN3iiX8nbxqgksbIBheh8bIDTw4NAqccaAptYEl/kjc7PVSK4vp3AidK1+FIUqME6797vwgwJKlbReqJj00x5tsZAk6sMrMPNtTWTg3HnEWw2If8AYnoj0F8rFpw/OMUEatV+mas+q33oukl3CqN29BM44gO239af6QBpUnA5q0clcT4ql/FtOMbFayjbn8TeXQPr2Yw1UtQxOSnvywq2OYuDLdeWIW8szt+l1xNWkRQZCALmdGptgVpfIWU4XL8oZrvGO/S6UhFWuWMo7UaFg7M3vhzApI7lU+1Fbo0HvtNgtLj/ZjfnJcBhaAZghrmn2SLIDUmGAi1GHuUYBb93J3zVWn4l+26UMazZVEEVbLo3WdRwtJOEqwAJElvnIKnid1bpK43bBTqlEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6916009)(54906003)(316002)(33656002)(33716001)(38100700002)(38070700005)(122000001)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(91956017)(76116006)(66946007)(83380400001)(71200400001)(44832011)(6506007)(9686003)(86362001)(5660300002)(6512007)(508600001)(26005)(6486002)(1076003)(107886003)(2906002)(186003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?51nBXnO0TfPQNK2ZhELvjNJkFmtgBeLPLAAK91nX1HBDFWEUiUtY2m60P0Rb?=
 =?us-ascii?Q?djNLIkFi43Ah8GgCLJg4bAT1krTi2hE6CP44SaPWVFDHPZwPItUQiWCOXo7i?=
 =?us-ascii?Q?EplIubJVM9XG1xveW/bcxP4rGpF1DppvUVbeMF45k21vXyvGSY5+L51k2IPW?=
 =?us-ascii?Q?V9PcTuQ1zKYOFh6KFGiYfGMEZx6ZlwGEbTcFhATpixxrF/oHAf8Z0aPBxZD3?=
 =?us-ascii?Q?bZ6XAGqvtycBYEP1wKglvDx/DjUckm59TIVPw7U5gG2ano4mSDv8JQ2MBp/C?=
 =?us-ascii?Q?L8OrA2znIqDFdYWFBPxN0nRQgmRwZe0Np1HM4gPf9e/40SqrM+D2hOtzu8Dy?=
 =?us-ascii?Q?+oQxktMCB0fC1tQ1A2/UgOOsy1XP96OEPCRpuXao3j3yFWZjv3tJPfuxjcUk?=
 =?us-ascii?Q?Z1nSuJqunvK/xGOapkSLh11uFKwe2b+7sqwbda0Oj3AY0Newu7BUdQ0Ed6C0?=
 =?us-ascii?Q?iTBelRbzqkW5GZcY5D6LIlPwbuMXDma1btdbfnlort3VTX+x+BWtmbcWzbi/?=
 =?us-ascii?Q?bSZsbF5J+3jdTUamVsD50236yK6OBAiEYBBDGKMRA6UHH7BJTFYFMOoiiN9B?=
 =?us-ascii?Q?unzwg1hwTidhWUu9ImRUr98zn84TUjBnipxQRjANSYxwD9TzJpMHX/aBmuQf?=
 =?us-ascii?Q?G6QJXoMLv+lzzoCP6qFpAHCCYP7CXL8SN9n85AsITK2rrJcz6ifYd81xIhnp?=
 =?us-ascii?Q?H8aX9k2soEy9tW1boBj27E6shbvZYrSDO1ppI7yIa5xh0RZjl87NwDNCqaJ5?=
 =?us-ascii?Q?/0++gmv42ENZfx8I4BAXVKnX99lBaHD2ukgL0917DWxXnbdWlDEN2CEA3gjE?=
 =?us-ascii?Q?HbdBV7MEQ9LveJg8g7gmIBamUYhlBQdjUsaBPP7N+pHVAHjQ7mLBr8g1SnpH?=
 =?us-ascii?Q?1RJO7cWdAHBQsma0f7TKAuafQN99ax/57k9Jn2PyboprRrrIOTHe32HWZwGK?=
 =?us-ascii?Q?ZA39nN2uYdYm1m6PYhD2Z51d5TCIB/ErE2PMIdi94G+g9JB/0jRZvhHWb3n9?=
 =?us-ascii?Q?IVVuoB8ONH2bP12fTY1UPrCMhXLYF8mllafhS1ZK99KbJkhMhMJy06/cVCvC?=
 =?us-ascii?Q?BfMLuYUgxmtHewpbM8J4N+/qLgZBjYg+E/bOHykgNlDZhsNf0HHoucvJyRLn?=
 =?us-ascii?Q?OZQlzbwB0yJgT+XF8Su9Yr8JM7WdGBuHjMXNderK7kKYrQykB6qRkcXLivSH?=
 =?us-ascii?Q?nCJLqSyU9O7LmmLN5eWJVedoxKItBQ9Bg3odkxPGQdkOcOrp7x9D7NWVd+yD?=
 =?us-ascii?Q?eSRowKBDpEgC0/fdyxZrGglaeTuYvqjDOeIEVrVa2UffyxAHDGEmHbjxMx7N?=
 =?us-ascii?Q?F/DOkMImkN7noES/MKNBwquDaXLlpWZXteUxY7iMlc7o8/vgFZUxYYKGg9HH?=
 =?us-ascii?Q?g4gh6yqD6oueTmIS9AKd7Xfv9ODluAD2CmExFq8tstRD4t+3NH1lDhi/yARV?=
 =?us-ascii?Q?0kq+/X4/X6ztZXyY0BoOFJDziSy6GgbrB5rlRtzBPxRNahJouOSs8mxcrFr9?=
 =?us-ascii?Q?dvwQPBDHltZaXG9yXpJ83TWM5DKyTRQ011m6hG+iRmDiN9D9okoCSpT483Pg?=
 =?us-ascii?Q?LkCL8X1QnlrIcmrm1JollYn0sq/ooCTzeY8qeEQijdJNRoxSiLrv7pabhdfw?=
 =?us-ascii?Q?AnCGtsfZ6wKQO9ZMK+fGRUrITirb1nXTs7ALPy+91CgDX6KzoWGWKQKsw0NX?=
 =?us-ascii?Q?7rYsgUK6wi58Mr5DgW8CTBb0tuiM44Hvf9JNyv9+C7603KT+m8uHOp12oDta?=
 =?us-ascii?Q?F2sPi3cokDUul1vE3G3sS61klT749mQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C13C27C5A661EF49B0F28CAB58F4FB8A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406bddd3-a130-4ed9-2437-08da2a5bc8dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2022 03:44:52.5982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGEV4lRfuYEgwDM0ZKoI4FeV2XJDbkyzy1MwbJh8VL/S3F0+CYhZHbINd7ew5AdqYUj7U86wZj7P8x9NiIazAtWdv2Lk5pPyyW9wtpiAmb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7839
X-Proofpoint-GUID: rm826eXTC_Qntxri5M8HkcF-GVKAPheO
X-Proofpoint-ORIG-GUID: rm826eXTC_Qntxri5M8HkcF-GVKAPheO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-30_01,2022-04-28_01,2022-02-23_01
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 11:01:16AM +0100, Stefan Hajnoczi wrote:
> Commit 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend
> Program conventions for vhost-user-scsi") introduced fd-passing support
> as part of implementing the vhost-user backend program conventions.
>=20
> When fd passing is used the UNIX domain socket path is NULL and we must
> not call unlink(2).
>=20
> Fixes: Coverity CID 1488353
> Fixes: 747421e949fc1eb3ba66b5fcccdb7ba051918241 ("Implements Backend Prog=
ram conventions for vhost-user-scsi")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-us=
er-scsi/vhost-user-scsi.c
> index b2c0f98253..08335d4b2b 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -433,7 +433,9 @@ out:
>      if (vdev_scsi) {
>          g_main_loop_unref(vdev_scsi->loop);
>          g_free(vdev_scsi);
> -        unlink(opt_socket_path);
> +        if (opt_socket_path) {
> +            unlink(opt_socket_path);
> +        }
>      }
>      if (csock >=3D 0) {
>          close(csock);
> --=20
> 2.35.1
> =

