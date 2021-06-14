Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980BA3A5FBE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:10:16 +0200 (CEST)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsjXr-00054s-Bl
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lsjVv-0003tH-GP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:08:15 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:41184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thanos.makatos@nutanix.com>)
 id 1lsjVp-0003J8-M4
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:08:15 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EA2VrB016390; Mon, 14 Jun 2021 03:08:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint20171006;
 bh=xoQ73EFEY8xr8sBkyeseAZgL/0yJ43JO3Ga1YWglXmM=;
 b=kgH4ZnnMwJdfqQoSYfqoR44uXrIgHtiP/l8p28vqem8fD5j8eIDomHHNTgeiRFK8bKnk
 rnc5CMnoDYGXpJHaWbFZxhfyGCVojlCou6+BOSnapJp4j8Avqssm29Wwe/nkbNoYJW+h
 mhjlDt1CHFHT68/lo/7SqK6Xr3DT2fUDJ7jHmTjt0gGqDSyXfOvZlUlaKVnzpof+fRlV
 MFUHLx7xryVmDm+Q22mOmAjH7beC9PIu4W0Bl+/FzHgGlHGHW9M55bZHRFDd+jQ1IQ0F
 88PHJ5vYCqIWy2uWUutJcqjJp92CETEA5ouR6k30kvarvrTOEwJewXv7P2zmNRFKJoYN 2A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3960du0hub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 03:08:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtvV1ORN7CPASsOOtvlTreV0sXfW152DO+dncbJ2w9hK7vcne/qzGql+RJx30ePQWnOScElY+FcJWZvNMYNkKfjns4efGArP3y1ZbmJLLmEejoQMtTtAfBec1oeSYY/PRfuUw8FPsyTyyRLUsR2Xb4aWP9gMNPLPbzIYK5jQR+DKbOSzMOeEvde0qnCxGoc4eaOXzGGJF0TIfiMYLHcTGexfxAoarMbiUg/fDzv1gcruieha+TxJ8sS/W9pgDKqNlIruCAjOVVv0Xt2Kl+c/LpmtxrNaGNSHeWVfdMkDPT7VwGsPWmfDFEjWoObvj/dpcfi5U/hYVqGYP3cghUi2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoQ73EFEY8xr8sBkyeseAZgL/0yJ43JO3Ga1YWglXmM=;
 b=f/1e2EEd4Ot8QDLmu81fO1MAn/xVDx4Zm0wY6ojaes4MOm8gPp/HhVEG9aa9nHmQLbky3aByJgiciZV9hJCcfYklrhhIgnhDVvc0VnVAewzbsPN+0baS+y/nImAkxEkxA84nOskxjopPdPssKFPEC2sKQDKtAGgxxdQ5dYucBQkSXLPXyeWHgidPOYcRvKJWKsFaAi8kqgjLWGG6FuxO+fbkR1q37l6dqg/THDQwXqeCD/dOFW/oT8zC3/gKNt5hE4m68DkptTLEz0A8iy9D6ouqbwgKiM0QuB+S3dQTwamlgcDH5xmoji6guHWD3F17qES3oJtcLMIPYvHAePuYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7898.namprd02.prod.outlook.com (2603:10b6:610:113::5)
 by CH2PR02MB6871.namprd02.prod.outlook.com (2603:10b6:610:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Mon, 14 Jun
 2021 10:07:57 +0000
Received: from CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::a91d:ad88:5b1f:c981]) by CH0PR02MB7898.namprd02.prod.outlook.com
 ([fe80::a91d:ad88:5b1f:c981%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 10:07:57 +0000
From: Thanos Makatos <thanos.makatos@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXMSMjtDp7nXmGRkuiYMGnZrvqnqrTdveAgEAuKZA=
Date: Mon, 14 Jun 2021 10:07:57 +0000
Message-ID: <CH0PR02MB7898A4D88CE7B60EFD8D56D08B319@CH0PR02MB7898.namprd02.prod.outlook.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
In-Reply-To: <YJFRcdvcOlwm2bd7@stefanha-x1.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [78.149.4.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd05a75b-f4b2-448a-dcd1-08d92f1c48d1
x-ms-traffictypediagnostic: CH2PR02MB6871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6871E85EC5CEBE49BD2243A08B319@CH2PR02MB6871.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RZR43gFIXmFXlhdfaN11bzqjEK4JAFIKxB2iQNe5m2AiZY4SoisUc9v07OLnbjFqCqZ/fCBkjwbgXQIzzveQUkEnC9aj+h0IKtM2ue2V878wUPCT8PObBJ8qLl7vs+4r0c3FIXwb/9cD7j+NXsBEJtcmBh2lHBieKmpwqIa6vcL80rQqV8fuz9BisqmyUEa/tAfpnDQSakU9wEXa23ya4YFzEWZ/UrjkCh4VRMOBPklMWeEYISk1Ep5y4rwObn3TXI3cSrBYEapweH7+OXjOUox9r8POUwmP+LjprMKvVngwBil3KU7SdtJ3mHY2f+1z7J0i7Ngt3mCWXwh/Cdx5gRNErgb6F8pMN/etK51a1KHNkLkpLGDDW6Fh4ewODQm1fannPXYRO6IaJ/uupwXqMDuxJNjGMi7S/23JANiHLc6iahce3Ert0qHgIl/+7ZLN0RW5hSLcr++OmfXGG1/urAF3GwnliCrhNkppEEvgPnz3GlLekSaaip6/3X5ouNLC5QTRuRG8kVyBNjJCvpzBhth51yN0LjYeidkdnmrXjJvn5m3wz4zpZ4cwwSV7FRk+75Q12sp+NhtdAJfbni5SIu6lb2WWV0Lx/OegMr6wOHCCywPc9BW7AAB8KticNka/SPuSkGd9gppsMDja41l9hRNKhamEPhOQ5mYu2G0qABmb1LSkNvg17FCqgK3i/I81THmtVAaFVPe7jy5YhH4Cve9mKp4BJzk66wwBtNYKirQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7898.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(366004)(39860400002)(186003)(55236004)(5660300002)(9686003)(6916009)(83380400001)(7416002)(2906002)(8676002)(478600001)(44832011)(6506007)(53546011)(52536014)(71200400001)(7696005)(54906003)(33656002)(8936002)(30864003)(66946007)(38100700002)(66446008)(4326008)(64756008)(66556008)(55016002)(107886003)(66476007)(122000001)(26005)(316002)(86362001)(76116006)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z2bGhptHNzdJUU6aO7ZCLV8CvwDC57nFgLHoEPsh0uy0L+hbkANUKajD3q6/?=
 =?us-ascii?Q?wGtI5R8X1Ye86S/fpmNjSfm+oFpCpwwLJJCXeYeaBVIjTS47w9yD1VtLnV2+?=
 =?us-ascii?Q?4FyI2seYe3iYrTETMXIuOz7A7ieI7F3DuqtkUYAj36NkS6faDCQEdrK+ZpQ9?=
 =?us-ascii?Q?TuWR8lI6Yz1NIBij7LyevzsmxM55eT4/3aCK3MOcRcWTzlSosVX/tXwQYc7S?=
 =?us-ascii?Q?mQxVcHEnT6sojq44MfY7FWAls4s3G10fnI/P++AewyM/RuZ7tiXmcjeRPejQ?=
 =?us-ascii?Q?VarU9Rr/q1wfAD5LQPYu4/77mI7MCiebk79GjhGVNnJozBYdBeRcdSYOqoJd?=
 =?us-ascii?Q?90phFC55euONdk8FWdYsm+AUnHlxa7dtcMs2rrhnTwqEHLaVPLRDB0IKbuKO?=
 =?us-ascii?Q?9TLFWYOXYhUSExGWn1H+WotUi3MV8FEW2nEVBRzW0VGfZcEIlj6aqDdL1OSA?=
 =?us-ascii?Q?a45P9kyBvtpljwR5DnYAVPDfwqOEt5lJxmEKGPJ08f9FEU2p0z04GeoKsx55?=
 =?us-ascii?Q?vIvsLDya7fH2D/qDX2VJlr1gK7WRiBey7LPUMZ0w/h5u15pY/q1Rje0yU/nl?=
 =?us-ascii?Q?ew4hIbtBVOi9ozjMzObR8XsIJaH8ORMKyukfjDIN8ydYdzU/YcXUZO+cQ/tS?=
 =?us-ascii?Q?LvY5T/VV/xLRknet7uPx3MAZiEC2pijdnyTcovXsmb/G85F7D+awDRJM8jGN?=
 =?us-ascii?Q?nTRa4KB26OQCbyEHuYsvpeZ4f7YseLN/rJvNA/RiXZVxDkO1IdgTTVh6mdai?=
 =?us-ascii?Q?SyZo2DpfAZQPLR4XIR6NtZ1GobW6Ji6FC4792PfynJQMvOlnMcl9sh1svp3s?=
 =?us-ascii?Q?LAvhOfPB4uX7dz8waVC73jxSzZJOlgamrYsPlt6hEZxvTFCWXyPIjb5eTWas?=
 =?us-ascii?Q?J3iqErQgMuYliTHiG3U0bo5XN5EXlNTy6T8F2f+9gHkFHGsKK5ob+Z5cwiJ9?=
 =?us-ascii?Q?RZHqAc9YmZ/pWMmeUUE5oMIgrxqrnfOszYgLxn3QqWEGHvhIOmTmYSQ2RAcc?=
 =?us-ascii?Q?JqFgf1pnaWfWiDwhYUYxfetJJOWJ8sYhtgEXRa4F/2y/w8C6Kz7RAhpROUqG?=
 =?us-ascii?Q?QUGPJC13s2sBMZO9pUlga2CENGzcF/SrPNi1y4cVB3pA4mljXpnXE6USyq5H?=
 =?us-ascii?Q?qYGAuCDCOXIYqqcfNMtgcGPEfyS9oYZ8iKOjKCmo2I0hDw92QVnmepg++ZBp?=
 =?us-ascii?Q?5xDSKZ9jR/sNFqRhahe+JB2hEWDwLaKYCBxxBmDDRrEiQB1Q5SiwgHH/lKtw?=
 =?us-ascii?Q?2z8hHCDKQbGGL/5IKqJEAsaeXSNfn8xlQgjvfoQ4AtSkD7WxNb/frWGiKmUp?=
 =?us-ascii?Q?x70=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7898.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd05a75b-f4b2-448a-dcd1-08d92f1c48d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 10:07:57.4937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATWG/RQP6kNcGQNTI63HV9jIFqNQeOFVtDq06p23fB3y7B9TceH3KlveHehIbkCyB2FHvgJQEtNWIsCAAImTUvgz8NvB+SD5//feIcSyijw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6871
X-Proofpoint-GUID: DgB7HNkDN1h8m19EUkLNb6MNdsiV639C
X-Proofpoint-ORIG-GUID: DgB7HNkDN1h8m19EUkLNb6MNdsiV639C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_04:2021-06-11,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=thanos.makatos@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "benjamin.walker@intel.com" <benjamin.walker@intel.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "tina.zhang@intel.com" <tina.zhang@intel.com>,
 "jag.raman@oracle.com" <jag.raman@oracle.com>,
 "james.r.harris@intel.com" <james.r.harris@intel.com>,
 John Levon <john.levon@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Kanth.Ghatraju@oracle.com" <Kanth.Ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "ismael@linux.com" <ismael@linux.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "xiuchun.lu@intel.com" <xiuchun.lu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Stefan Hajnoczi <stefanha@redhat.com>
> Sent: 04 May 2021 14:52
> To: Thanos Makatos <thanos.makatos@nutanix.com>
> Cc: qemu-devel@nongnu.org; John Levon <levon@movementarian.org>;
> John G Johnson <john.g.johnson@oracle.com>;
> benjamin.walker@intel.com; Elena Ufimtseva
> <elena.ufimtseva@oracle.com>; jag.raman@oracle.com;
> james.r.harris@intel.com; Swapnil Ingle <swapnil.ingle@nutanix.com>;
> konrad.wilk@oracle.com; alex.williamson@redhat.com;
> yuvalkashtan@gmail.com; tina.zhang@intel.com;
> marcandre.lureau@redhat.com; ismael@linux.com;
> Kanth.Ghatraju@oracle.com; Felipe Franciosi <felipe@nutanix.com>;
> xiuchun.lu@intel.com; tomassetti.andrea@gmail.com; Raphael Norwitz
> <raphael.norwitz@nutanix.com>; changpeng.liu@intel.com;
> dgilbert@redhat.com; Yan Zhao <yan.y.zhao@intel.com>; Michael S . Tsirkin
> <mst@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; Christophe de
> Dinechin <cdupontd@redhat.com>; Jason Wang <jasowang@redhat.com>;
> Cornelia Huck <cohuck@redhat.com>; Kirti Wankhede
> <kwankhede@nvidia.com>; Paolo Bonzini <pbonzini@redhat.com>;
> mpiszczek@ddn.com; John Levon <john.levon@nutanix.com>
> Subject: Re: [PATCH v8] introduce vfio-user protocol specification
>=20
> On Wed, Apr 14, 2021 at 04:41:22AM -0700, Thanos Makatos wrote:
> > This patch introduces the vfio-user protocol specification (formerly
> > known as VFIO-over-socket), which is designed to allow devices to be
> > emulated outside QEMU, in a separate process. vfio-user reuses the
> > existing VFIO defines, structs and concepts.
> >
> > It has been earlier discussed as an RFC in:
> > "RFC: use VFIO over a UNIX domain socket to implement device offloading=
"
> >
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Thanos Makatos <thanos.makatos@nutanix.com>
> > Signed-off-by: John Levon <john.levon@nutanix.com>
> >
> > ---
> >
> > Changed since v1:
> >   * fix coding style issues
> >   * update MAINTAINERS for VFIO-over-socket
> >   * add vfio-over-socket to ToC
> >
> > Changed since v2:
> >   * fix whitespace
> >
> > Changed since v3:
> >   * rename protocol to vfio-user
> >   * add table of contents
> >   * fix Unicode problems
> >   * fix typos and various reStructuredText issues
> >   * various stylistic improvements
> >   * add backend program conventions
> >   * rewrite part of intro, drop QEMU-specific stuff
> >   * drop QEMU-specific paragraph about implementation
> >   * explain that passing of FDs isn't necessary
> >   * minor improvements in the VFIO section
> >   * various text substitutions for the sake of consistency
> >   * drop paragraph about client and server, already explained in
> >   * intro
> >   * drop device ID
> >   * drop type from version
> >   * elaborate on request concurrency
> >   * convert some inessential paragraphs into notes
> >   * explain why some existing VFIO defines cannot be reused
> >   * explain how to make changes to the protocol
> >   * improve text of DMA map
> >   * reword comment about existing VFIO commands
> >   * add reference to Version section
> >   * reset device on disconnection
> >   * reword live migration section
> >   * replace sys/vfio.h with linux/vfio.h
> >   * drop reference to iovec
> >   * use argz the same way it is used in VFIO
> >   * add type field in header for clarity
> >
> > Changed since v4:
> >   * introduce support for live migration as defined in
> >   * include/uapi/linux/vfio.h
> >   * introduce 'max_fds' and 'migration' capabilities:
> >   * remove 'index' from VFIO_USER_DEVICE_GET_IRQ_INFO
> >   * fix minor typos and reworded some text for clarity
> >
> > Changed since v5:
> >   * fix minor typos
> >   * separate VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP
> >   * clarify meaning of VFIO bitmap size field
> >   * move version major/minor outside JSON
> >   * client proposes version first
> >   * make Errno optional in message header
> >   * clarification about message ID uniqueness
> >   * clarify that server->client request can appear in between
> >     client->server request/reply
> >
> > Changed since v6:
> >   * put JSON strings in double quotes
> >   * clarify reply behavior on error
> >   * introduce max message size capability
> >   * clarify semantics when failing to map multiple DMA regions in a
> >     single command
> >
> > Changed since v7:
> >   * client proposes version instead of server
> >   * support ioeventfd and ioregionfd for unmapped regions
> >   * reword struct vfio_bitmap for clarity
> >   * clarify use of argsz in VFIO device info
> >   * allow individual IRQs to be disabled
> > ---
> >  MAINTAINERS              |    7 +
> >  docs/devel/index.rst     |    1 +
> >  docs/devel/vfio-user.rst | 1854
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1862 insertions(+)
> >  create mode 100644 docs/devel/vfio-user.rst
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index 36055f14c5..bd1194002b
> > 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1849,6 +1849,13 @@ F: hw/vfio/ap.c
> >  F: docs/system/s390x/vfio-ap.rst
> >  L: qemu-s390x@nongnu.org
> >
> > +vfio-user
> > +M: John G Johnson <john.g.johnson@oracle.com>
> > +M: Thanos Makatos <thanos.makatos@nutanix.com>
> > +M: John Levon <john.levon@nutanix.com>
> > +S: Supported
> > +F: docs/devel/vfio-user.rst
> > +
> >  vhost
> >  M: Michael S. Tsirkin <mst@redhat.com>
> >  S: Supported
> > diff --git a/docs/devel/index.rst b/docs/devel/index.rst index
> > 6cf7e2d233..7d1ea63e02 100644
> > --- a/docs/devel/index.rst
> > +++ b/docs/devel/index.rst
> > @@ -42,3 +42,4 @@ Contents:
> >     qom
> >     block-coroutine-wrapper
> >     multi-process
> > +   vfio-user
> > diff --git a/docs/devel/vfio-user.rst b/docs/devel/vfio-user.rst new
> > file mode 100644 index 0000000000..b3498eec02
> > --- /dev/null
> > +++ b/docs/devel/vfio-user.rst
> > @@ -0,0 +1,1854 @@
> > +.. include:: <isonum.txt>
> > +
> > +********************************
> > +vfio-user Protocol Specification
> > +********************************
> > +
> > +------------
> > +Version_ 0.1
> > +------------
> > +
> > +.. contents:: Table of Contents
> > +
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +vfio-user is a protocol that allows a device to be emulated in a
> > +separate process outside of a Virtual Machine Monitor (VMM).
> > +vfio-user devices consist of a generic VFIO device type, living
> > +inside the VMM, which we call the client, and the core device
> > +implementation, living outside the VMM, which we call the server.
> > +
> > +The `Linux VFIO ioctl interface
> > +<https://www.kernel.org/doc/html/latest/driver-api/vfio.html>`_
> > +been chosen as the base for this protocol for the following reasons:
> > +
> > +1) It is a mature and stable API, backed by an extensively used
> framework.
> > +2) The existing VFIO client implementation in QEMU (qemu/hw/vfio/) can
> be
> > +   largely reused.
> > +
> > +.. Note::
> > +   In a proof of concept implementation it has been demonstrated that
> using VFIO
> > +   over a UNIX domain socket is a viable option. vfio-user is designed=
 with
> > +   QEMU in mind, however it could be used by other client applications=
.
> The
> > +   vfio-user protocol does not require that QEMU's VFIO client
> implementation
> > +   is used in QEMU.
> > +
> > +None of the VFIO kernel modules are required for supporting the
> > +protocol, neither in the client nor the server, only the source header=
 files
> are used.
> > +
> > +The main idea is to allow a virtual device to function in a separate
> > +process in the same host over a UNIX domain socket. A UNIX domain
> > +socket (AF_UNIX) is chosen because file descriptors can be trivially
> > +sent over it, which in turn
> > +allows:
> > +
> > +* Sharing of client memory for DMA with the server.
> > +* Sharing of server memory with the client for fast MMIO.
> > +* Efficient sharing of eventfd's for triggering interrupts.
> > +
> > +Other socket types could be used which allow the server to run in a
> > +separate guest in the same host (AF_VSOCK) or remotely (AF_INET).
> > +Theoretically the underlying transport does not necessarily have to
> > +be a socket, however we do not examine such alternatives. In this
> > +protocol version we focus on using a UNIX domain socket and introduce
> > +basic support for the other two types of sockets without considering
> performance implications.
> > +
> > +While passing of file descriptors is desirable for performance
> > +reasons, it is not necessary neither for the client nor for the
> > +server to support it in order
>=20
> Double negative. "not" can be removed.
>=20
> > +to implement the protocol. There is always an in-band,
> > +message-passing fall back mechanism.
> > +
> > +VFIO
> > +=3D=3D=3D=3D
> > +VFIO is a framework that allows a physical device to be securely
> > +passed through to a user space process; the device-specific kernel
> > +driver does not drive the device at all.  Typically, the user space
> > +process is a VMM and the device is passed through to it in order to
> > +achieve high performance. VFIO provides an API and the required
> > +functionality in the kernel. QEMU has adopted VFIO to allow a guest
> > +to directly access physical devices, instead of emulating them in soft=
ware.
> > +
> > +vfio-user reuses the core VFIO concepts defined in its API, but
> > +implements them as messages to be sent over a socket. It does not
> > +change the kernel-based VFIO in any way, in fact none of the VFIO
> > +kernel modules need to be loaded to use vfio-user. It is also
> > +possible for the client to concurrently use the current kernel-based V=
FIO
> for one device, and vfio-user for another device.
> > +
> > +VFIO Device Model
> > +-----------------
> > +A device under VFIO presents a standard interface to the user
> > +process. Many of the VFIO operations in the existing interface use
> > +the ioctl() system call, and references to the existing interface are
> > +called the ioctl() implementation in this document.
> > +
> > +The following sections describe the set of messages that implement
> > +the VFIO interface over a socket. In many cases, the messages are
> > +direct translations of data structures used in the ioctl()
> > +implementation. Messages derived from ioctl()s will have a name
> > +derived from the ioctl() command name.  E.g., the VFIO_GET_INFO
> > +ioctl() command becomes a VFIO_USER_GET_INFO message.  The
> purpose of
> > +this reuse is to share as much code as feasible with the ioctl()
> implementation.
> > +
> > +Connection Initiation
> > +^^^^^^^^^^^^^^^^^^^^^
> > +After the client connects to the server, the initial client message
> > +is VFIO_USER_VERSION to propose a protocol version and set of
> > +capabilities to apply to the session. The server replies with a
> > +compatible version and set of capabilities it supports, or closes the
> > +connection if it cannot support the advertised version.
> > +
> > +DMA Memory Configuration
> > +^^^^^^^^^^^^^^^^^^^^^^^^
> > +The client uses VFIO_USER_DMA_MAP and VFIO_USER_DMA_UNMAP
> messages to
> > +inform the server of the valid DMA ranges that the server can access
> > +on behalf of a device. DMA memory may be accessed by the server via
> > +VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages over
> the socket.
> > +
> > +An optimization for server access to client memory is for the client
> > +to provide file descriptors the server can mmap() to directly access
> > +client memory. Note that mmap() privileges cannot be revoked by the
> > +client, therefore file descriptors should only be exported in
> > +environments where the client trusts the server not to corrupt guest
> memory.
> > +
> > +Device Information
> > +^^^^^^^^^^^^^^^^^^
> > +The client uses a VFIO_USER_DEVICE_GET_INFO message to query the
> > +server for information about the device. This information includes:
> > +
> > +* The device type and whether it supports reset
> > +(``VFIO_DEVICE_FLAGS_``),
> > +* the number of device regions, and
> > +* the device presents to the client the number of interrupt types the
> > +device
> > +  supports.
> > +
> > +Region Information
> > +^^^^^^^^^^^^^^^^^^
> > +The client uses VFIO_USER_DEVICE_GET_REGION_INFO messages to
> query
> > +the server for information about the device's memory regions. This
> information describes:
> > +
> > +* Read and write permissions, whether it can be memory mapped, and
> > +whether it
> > +  supports additional capabilities (``VFIO_REGION_INFO_CAP_``).
> > +* Region index, size, and offset.
> > +
> > +When a region can be mapped by the client, the server provides a file
> > +descriptor which the client can mmap(). The server is responsible for
> > +polling for client updates to memory mapped regions.
> > +
> > +Region Capabilities
> > +"""""""""""""""""""
> > +Some regions have additional capabilities that cannot be described
> > +adequately by the region info data structure. These capabilities are
> > +returned in the region info reply in a list similar to PCI
> > +capabilities in a PCI device's configuration space.
> > +
> > +Sparse Regions
> > +""""""""""""""
> > +A region can be memory-mappable in whole or in part. When only a
> > +subset of a region can be mapped by the client, a
> > +VFIO_REGION_INFO_CAP_SPARSE_MMAP capability is included in the
> region
> > +info reply. This capability describes which portions can be mapped by =
the
> client.
> > +
> > +.. Note::
> > +   For example, in a virtual NVMe controller, sparse regions can be us=
ed so
> > +   that accesses to the NVMe registers (found in the beginning of BAR0=
)
> are
> > +   trapped (an infrequent event), while allowing direct access to the
> doorbells
> > +   (an extremely frequent event as every I/O submission requires a wri=
te
> to
> > +   BAR0), found right after the NVMe registers in BAR0.
> > +
> > +Device-Specific Regions
> > +"""""""""""""""""""""""
> > +
> > +A device can define regions additional to the standard ones (e.g. PCI
> > +indexes 0-8). This is achieved by including a
> > +VFIO_REGION_INFO_CAP_TYPE capability in the region info reply of a
> > +device-specific region. Such regions are reflected in ``struct
> > +vfio_device_info.num_regions``. Thus, for PCI devices this value can b=
e
> equal to, or higher than, VFIO_PCI_NUM_REGIONS.
> > +
> > +Region I/O via file descriptors
> > +-------------------------------
> > +
> > +For unmapped regions, region I/O from the client is done via
> > +VFIO_USER_REGION_READ/WRITE.  As an optimization, ioeventfds or
> > +ioregionfds may be configured for sub-regions of some regions. A
> > +client may request information on these sub-regions via
> > +VFIO_USER_DEVICE_GET_REGION_IO_FDS; by configuring the returned
> file
> > +descriptors as ioeventfds or ioregionfds, the server can be directly
> > +notified of I/O (for example, by KVM) without taking a trip through th=
e
> client.
> > +
> > +Interrupts
> > +^^^^^^^^^^
> > +The client uses VFIO_USER_DEVICE_GET_IRQ_INFO messages to query
> the
> > +server for the device's interrupt types. The interrupt types are
> > +specific to the bus the device is attached to, and the client is
> > +expected to know the capabilities of each interrupt type. The server
> > +can signal an interrupt either with VFIO_USER_VM_INTERRUPT messages
> > +over the socket, or can directly inject interrupts into the guest via
> > +an event file descriptor. The client configures how the server signals=
 an
> interrupt with VFIO_USER_SET_IRQS messages.
> > +
> > +Device Read and Write
> > +^^^^^^^^^^^^^^^^^^^^^
> > +When the guest executes load or store operations to device memory,
> > +the client
>=20
> <linux/vfio.h> calls it "device regions", not "device memory".
> s/device memory/unmapped device regions/?
>=20
> > +forwards these operations to the server with VFIO_USER_REGION_READ
> or
> > +VFIO_USER_REGION_WRITE messages. The server will reply with data
> from
> > +the device on read operations or an acknowledgement on write
> operations.
> > +
> > +DMA
> > +^^^
> > +When a device performs DMA accesses to guest memory, the server will
> > +forward them to the client with VFIO_USER_DMA_READ and
> VFIO_USER_DMA_WRITE messages.
> > +These messages can only be used to access guest memory the client has
> > +configured into the server.
> > +
> > +Protocol Specification
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +To distinguish from the base VFIO symbols, all vfio-user symbols are
> > +prefixed with vfio_user or VFIO_USER. In revision 0.1, all data is in
> > +the little-endian format, although this may be relaxed in future
> > +revision in cases where the client and server are both big-endian.
> > +The messages are formatted for seamless reuse of the native VFIO
> structs.
> > +
> > +Socket
> > +------
> > +
> > +A server can serve:
> > +
> > +1) one or more clients, and/or
> > +2) one or more virtual devices, belonging to one or more clients.
> > +
> > +The current protocol specification requires a dedicated socket per
> > +client/server connection. It is a server-side implementation detail
> > +whether a single server handles multiple virtual devices from the
> > +same or multiple clients. The location of the socket is
> > +implementation-specific. Multiplexing clients, devices, and servers
> > +over the same socket is not supported in this version of the protocol.
> > +
> > +Authentication
> > +--------------
> > +For AF_UNIX, we rely on OS mandatory access controls on the socket
> > +files, therefore it is up to the management layer to set up the socket=
 as
> required.
> > +Socket types than span guests or hosts will require a proper
> > +authentication mechanism. Defining that mechanism is deferred to a
> > +future version of the protocol.
> > +
> > +Command Concurrency
> > +-------------------
> > +A client may pipeline multiple commands without waiting for previous
> > +command replies.  The server will process commands in the order they
> > +are received.  A consequence of this is if a client issues a command
> > +with the *No_reply* bit, then subseqently issues a command without
> > +*No_reply*, the older command will have been processed before the
> > +reply to the younger command is sent by the server.  The client must
> > +be aware of the device's capability to process concurrent commands if
> > +pipelining is used.  For example, pipelining allows multiple client
> > +threads to concurently access device memory; the client must ensure
> these acceses obey device semantics.
>=20
> s/acceses/accesses/
>=20
> > +
> > +An example is a frame buffer device, where the device may allow
> > +concurrent access to different areas of video memory, but may have
> > +indeterminate behavior if concurrent acceses are performed to command
> or status registers.
> > +
> > +Note that unrelated messages sent from the sevrer to the client can
> > +appear in
>=20
> s/sevrer/server/
>=20
> > +between a client to server request/reply and vice versa.
> > +
> > +Socket Disconnection Behavior
> > +-----------------------------
> > +The server and the client can disconnect from each other, either
> > +intentionally or unexpectedly. Both the client and the server need to
> > +know how to handle such events.
> > +
> > +Server Disconnection
> > +^^^^^^^^^^^^^^^^^^^^
> > +A server disconnecting from the client may indicate that:
> > +
> > +1) A virtual device has been restarted, either intentionally (e.g. bec=
ause of
> a
> > +   device update) or unintentionally (e.g. because of a crash).
> > +2) A virtual device has been shut down with no intention to be restart=
ed.
> > +
> > +It is impossible for the client to know whether or not a failure is
> > +intermittent or innocuous and should be retried, therefore the client
> > +should reset the VFIO device when it detects the socket has been
> disconnected.
> > +Error recovery will be driven by the guest's device error handling
> > +behavior.
> > +
> > +Client Disconnection
> > +^^^^^^^^^^^^^^^^^^^^
> > +The client disconnecting from the server primarily means that the
> > +client has exited. Currently, this means that the guest is shut down
> > +so the device is no longer needed therefore the server can
> > +automatically exit. However, there can be cases where a client
> disconnection should not result in a server exit:
> > +
> > +1) A single server serving multiple clients.
> > +2) A multi-process QEMU upgrading itself step by step, which is not ye=
t
> > +   implemented.
> > +
> > +Therefore in order for the protocol to be forward compatible the
> > +server should take no action when the client disconnects. If anything
> > +happens to the client the control stack will know about it and can
> > +clean up resources accordingly.
>=20
> Also, hot unplug?
>=20
> Does anything need to be said about mmaps and file descriptors on
> disconnected? I guess they need to be cleaned up and are not retained for
> future reconnection?
>=20
> > +
> > +Request Retry and Response Timeout
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +A failed command is a command that has been successfully sent and has
> > +been responded to with an error code. Failure to send the command in
> > +the first place (e.g. because the socket is disconnected) is a
> > +different type of error examined earlier in the disconnect section.
> > +
> > +.. Note::
> > +   QEMU's VFIO retries certain operations if they fail. While this mak=
es
> sense
> > +   for real HW, we don't know for sure whether it makes sense for virt=
ual
> > +   devices.
> > +
> > +Defining a retry and timeout scheme is deferred to a future version
> > +of the protocol.
> > +
> > +.. _Commands:
> > +
> > +Commands
> > +--------
> > +The following table lists the VFIO message command IDs, and whether
> > +the message command is sent from the client or the server.
> > +
> > ++------------------------------------+---------+-------------------+
> > +| Name                               | Command | Request Direction |
> >
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| VFIO_USER_VERSION                  | 1       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DMA_MAP                  | 2       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DMA_UNMAP                | 3       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DEVICE_GET_INFO          | 4       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DEVICE_GET_REGION_INFO   | 5       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DEVICE_GET_REGION_IO_FDS | 6       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DEVICE_GET_IRQ_INFO      | 7       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DEVICE_SET_IRQS          | 8       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_REGION_READ              | 9       | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_REGION_WRITE             | 10      | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DMA_READ                 | 11      | server -> client  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DMA_WRITE                | 12      | server -> client  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_VM_INTERRUPT             | 13      | server -> client  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DEVICE_RESET             | 14      | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +| VFIO_USER_DIRTY_PAGES              | 15      | client -> server  |
> > ++------------------------------------+---------+-------------------+
> > +
> > +
> > +.. Note:: Some VFIO defines cannot be reused since their values are
> > +   architecture-specific (e.g. VFIO_IOMMU_MAP_DMA).
>=20
> Are there rules for avoiding deadlock between client->server and
> server->client messages? For example, the client sends
> VFIO_USER_REGION_WRITE and the server sends
> VFIO_USER_VM_INTERRUPT before replying to the write message.
>=20
> Multi-threaded clients and servers could end up deadlocking if messages a=
re
> processed while polling threads handle other device activity (e.g.
> I/O requests that cause DMA messages).
>=20
> Pipelining has the nice effect that the oldest message must complete befo=
re
> the next pipelined message starts. It imposes a maximum issue depth of 1.
> Still, it seems like it would be relatively easy to hit re-entrancy or de=
adlock
> issues since both the client and the server can initiate messages and may
> need to wait for a response.
>=20
> > +
> > +Header
> > +------
> > +All messages, both command messages and reply messages, are
> preceded
> > +by a header that contains basic information about the message. The
> > +header is followed by message-specific data described in the sections
> below.
> > +
> > ++----------------+--------+-------------+
> > +| Name           | Offset | Size        |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Message ID     | 0      | 2           |
> > ++----------------+--------+-------------+
> > +| Command        | 2      | 2           |
> > ++----------------+--------+-------------+
> > +| Message size   | 4      | 4           |
> > ++----------------+--------+-------------+
> > +| Flags          | 8      | 4           |
> > ++----------------+--------+-------------+
> > +|                | +-----+------------+ |
> > +|                | | Bit | Definition | |
> > +|                | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+ |
> > +|                | | 0-3 | Type       | |
> > +|                | +-----+------------+ |
> > +|                | | 4   | No_reply   | |
> > +|                | +-----+------------+ |
> > +|                | | 5   | Error      | |
> > +|                | +-----+------------+ |
> > ++----------------+--------+-------------+
> > +| Error          | 12     | 4           |
> > ++----------------+--------+-------------+
> > +| <message data> | 16     | variable    |
> > ++----------------+--------+-------------+
> > +
> > +* *Message ID* identifies the message, and is echoed in the command's
> > +reply
> > +  message. Message IDs belong entirely to the sender, can be re-used
> > +(even
> > +  concurrently) and the receiver must not make any assumptions about
> > +their
> > +  uniqueness.
> > +* *Command* specifies the command to be executed, listed in
> Commands_.
> > +* *Message size* contains the size of the entire message, including th=
e
> header.
> > +* *Flags* contains attributes of the message:
> > +
> > +  * The *Type* bits indicate the message type.
> > +
> > +    *  *Command* (value 0x0) indicates a command message.
> > +    *  *Reply* (value 0x1) indicates a reply message acknowledging a
> previous
> > +       command with the same message ID.
> > +  * *No_reply* in a command message indicates that no reply is needed
> for this command.
> > +    This is commonly used when multiple commands are sent, and only th=
e
> last needs
> > +    acknowledgement.
> > +  * *Error* in a reply message indicates the command being
> acknowledged had
> > +    an error. In this case, the *Error* field will be valid.
> > +
> > +* *Error* in a reply message is an optional UNIX errno value. It may
> > +be zero
> > +  even if the Error bit is set in Flags. It is reserved in a command m=
essage.
> > +
> > +Each command message in Commands_ must be replied to with a reply
> > +message, unless the message sets the *No_Reply* bit.  The reply
> > +consists of the header with the *Reply* bit set, plus any additional d=
ata.
> > +
> > +If an error occurs, the reply message must only include the reply head=
er.
> > +
> > +VFIO_USER_VERSION
> > +-----------------
> > +
> > +This is the initial message sent by the client after the socket
> > +connection is
> > +established:
> > +
> > +Message format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+-------------------------------------------+
> > +| Name         | Value                                     |
> >
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> =3D=3D+
> > +| Message ID   | <ID>                                      |
> > ++--------------+-------------------------------------------+
> > +| Command      | 1                                         |
> > ++--------------+-------------------------------------------+
> > +| Message size | 16 + version header + version data length |
> > ++--------------+-------------------------------------------+
> > +| Flags        | Reply bit set in reply                    |
> > ++--------------+-------------------------------------------+
> > +| Error        | 0/errno                                   |
> > ++--------------+-------------------------------------------+
> > +| Version      | version header                            |
> > ++--------------+-------------------------------------------+
> > +
> > +Version Header Format
> > +^^^^^^^^^^^^^^^^^^^^^
> > +
> > ++---------------+--------+--------------------------------------------=
----+
> > +| Name          | Offset | Size                                       =
    |
> >
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ++=3D=3D=3D=3D=3D+
> > +| version major | 16     | 2                                          =
    |
> > ++---------------+--------+--------------------------------------------=
----+
> > +| version minor | 18     | 2                                          =
    |
> > ++---------------+--------+--------------------------------------------=
----+
> > +| version data  | 22     | variable (including terminating NUL        =
    |
> > +|               |        | character). Optional.                      =
    |
> > ++---------------+--------+--------------------------------------------=
----+
> > +
> > +Version Data Format
> > +^^^^^^^^^^^^^^^^^^^
> > +
> > +The version data is an optional JSON byte array with the following for=
mat:
>=20
> RFC 7159 The JavaScript Object Notation section 8.1. Character Encoding
> says:
>=20
>   JSON text SHALL be encoded in UTF-8, UTF-16, or UTF-32.
>=20
> Please indicate the character encoding. I guess it is always UTF-8?
>=20
> > +
> > ++--------------------+------------------+-----------------------------=
------+
> > +| Name               | Type             | Description                 =
      |
> >
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ++=3D=3D=3D=3D=3D=3D=3D+
> > +| ``"capabilities"`` | collection of    | Contains common capabilities=
 that |
> > +|                    | name/value pairs | the sender supports. Optiona=
l.    |
> > ++--------------------+------------------+-----------------------------=
------+
> > +
> > +Capabilities:
> > +
> > ++--------------------+------------------+-----------------------------=
--------+
> > +| Name               | Type             | Description                 =
        |
> >
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| ``"max_fds"``      | number           | Maximum number of file descr=
iptors  |
> > +|                    |                  | the can be received by the s=
ender.  |
> > +|                    |                  | Optional. If not specified t=
hen the |
> > +|                    |                  | receiver must assume        =
        |
> > +|                    |                  | ``"max_fds"=3D1``.          =
          |
>=20
> Maximum per message? Please clarify and consider renaming it to
> max_msg_fds (it's also more consistent with max_msg_size).
>=20
> > ++--------------------+------------------+-----------------------------=
--------+
> > +| ``"max_msg_size"`` | number           | Maximum message size in byte=
s
> that  |
> > +|                    |                  | the receiver can handle, inc=
luding  |
> > +|                    |                  | the header. Optional. If not=
        |
> > +|                    |                  | specified then the receiver =
must    |
> > +|                    |                  | assume ``"max_msg_size"=3D40=
96``.     |
> > ++--------------------+------------------+-----------------------------=
--------+
> > +| ``"migration"``    | collection of    | Migration capability paramet=
ers. If |
> > +|                    | name/value pairs | missing then migration is no=
t       |
> > +|                    |                  | supported by the sender.    =
        |
> > ++--------------------+------------------+-----------------------------=
--------+
> > +
> > +The migration capability contains the following name/value pairs:
> > +
> > ++--------------+--------+---------------------------------------------=
--+
> > +| Name         | Type   | Description                                 =
  |
> >
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ++=3D=3D=3D+
> > +| ``"pgsize"`` | number | Page size of dirty pages bitmap. The smalles=
t |
> > +|              |        | between the client and the server is used.  =
  |
> > ++--------------+--------+---------------------------------------------=
--+
>=20
> "in bytes"?
>=20
> > +
> > +
> > +.. _Version:
> > +
> > +Versioning and Feature Support
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +Upon establishing a connection, the client must send a
> > +VFIO_USER_VERSION message proposing a protocol version and a set of
> > +capabilities. The server compares these with the versions and
> > +capabilities it supports and sends a VFIO_USER_VERSION reply according
> to the following rules.
> > +
> > +* The major version in the reply must be the same as proposed. If the
> > +client
> > +  does not support the proposed major, it closes the connection.
> > +* The minor version in the reply must be equal to or less than the
> > +minor
> > +  version proposed.
> > +* The capability list must be a subset of those proposed. If the
> > +server
> > +  requires a capability the client did not include, it closes the conn=
ection.
>=20
> Does the server echo back all capabilities it has accepted so the client =
can still
> close the connection if it sees the server didn't accept a capability?
>=20
> > +
> > +The protocol major version will only change when incompatible
> > +protocol changes are made, such as changing the message format. The
> > +minor version may change when compatible changes are made, such as
> > +adding new messages or capabilities, Both the client and server must
> > +support all minor versions less than the maximum minor version it
> > +supports. E.g., an implementation that supports version 1.3 must also
> support 1.0 through 1.2.
> > +
> > +When making a change to this specification, the protocol version
> > +number must be included in the form "added in version X.Y"
> > +
> > +
> > +VFIO_USER_DMA_MAP
> > +-----------------
> > +
> > +Message Format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+------------------------+
> > +| Name         | Value                  |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Message ID   | <ID>                   |
> > ++--------------+------------------------+
> > +| Command      | 2                      |
> > ++--------------+------------------------+
> > +| Message size | 16 + table size        |
> > ++--------------+------------------------+
> > +| Flags        | Reply bit set in reply |
> > ++--------------+------------------------+
> > +| Error        | 0/errno                |
> > ++--------------+------------------------+
> > +| Table        | array of table entries |
> > ++--------------+------------------------+
> > +
> > +This command message is sent by the client to the server to inform it
> > +of the memory regions the server can access. It must be sent before
> > +the server can perform any DMA to the client. It is normally sent
> > +directly after the version handshake is completed, but may also occur
> > +when memory is added to the client, or if the client uses a vIOMMU.
> > +If the client does not expect the server to perform DMA then it does
> > +not need to send to the server VFIO_USER_DMA_MAP commands. If the
> > +server does not need to perform DMA then it can ignore such commands
> > +but it must still reply to them. The table is an array of the followin=
g
> structure:
> > +
> > +Table entry format
> > +^^^^^^^^^^^^^^^^^^
> > +
> > ++-------------+--------+-------------+
> > +| Name        | Offset | Size        |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Address     | 0      | 8           |
> > ++-------------+--------+-------------+
> > +| Size        | 8      | 8           |
> > ++-------------+--------+-------------+
> > +| Offset      | 16     | 8           |
> > ++-------------+--------+-------------+
> > +| Protections | 24     | 4           |
> > ++-------------+--------+-------------+
> > +| Flags       | 28     | 4           |
> > ++-------------+--------+-------------+
> > +|             | +-----+------------+ |
> > +|             | | Bit | Definition | |
> > +|             | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
 |
> > +|             | | 0   | Mappable   | |
> > +|             | +-----+------------+ |
> > ++-------------+--------+-------------+
> > +
> > +* *Address* is the base DMA address of the region.
> > +* *Size* is the size of the region.
>=20
> "in bytes"?
>=20
> > +* *Offset* is the file offset of the region with respect to the
> > +associated file
> > +  descriptor.
> > +* *Protections* are the region's protection attributes as encoded in
> > +  ``<sys/mman.h>``.
>=20
> Please be more specific. Does it only include PROT_READ and PROT_WRITE?
> What about PROT_EXEC?
>=20
> > +* *Flags* contains the following region attributes:
> > +
> > +  * *Mappable* indicates that the region can be mapped via the mmap()
> system
> > +    call using the file descriptor provided in the message meta-data.
> > +
> > +This structure is 32 bytes in size, so the message size is:
> > +16 + (# of table entries * 32).
> > +
> > +If a DMA region being added can be directly mapped by the server, an
> > +array of file descriptors must be sent as part of the message
> > +meta-data. Each mappable region entry must have a corresponding file
> > +descriptor. On AF_UNIX sockets, the file descriptors must be passed
> > +as SCM_RIGHTS type ancillary data. Otherwise, if a DMA region cannot
> > +be directly mapped by the server, it can be accessed by the server
> > +using VFIO_USER_DMA_READ and VFIO_USER_DMA_WRITE messages,
> explained
> > +in `Read and Write Operations`_. A command to map over an existing
> region must be failed by the server with ``EEXIST`` set in error field in=
 the
> reply.
>=20
> Does this mean a vIOMMU update, like a protections bits change requires a=
n
> unmap command followed by a map command? That is not an atomic
> operation but hopefully guests don't try to update a vIOMMU mapping while
> accessing it.

Correct, it's not an atomic operation. We could consider adding such an ope=
ration
If you think it would be useful?

>=20
> By the way, this DMA mapping design is the eager mapping approach.
> Another approach is the lazy mapping approach where the server requests
> translations as necessary. The advantage is that the client does not have=
 to
> send each mapping to the server. In the case of
> VFIO_USER_DMA_READ/WRITE no mappings need to be sent at all. Only
> mmaps need mapping messages.
>=20
> > +Adding multiple DMA regions can partially fail. The response does not
> > +indicate which regions were added and which were not, therefore it is
> > +a client implementation detail how to recover from the failure.
> > +
> > +.. Note::
> > +   The server can optionally remove succesfully added DMA regions
> > +making this
>=20
> s/succesfully/successfully/
>=20
> > +   operation atomic.
> > +   The client can recover by attempting to unmap one by one all the DM=
A
> regions
> > +   in the VFIO_USER_DMA_MAP command, ignoring failures for regions
> that do not
> > +   exist.
> > +
> > +VFIO_USER_DMA_UNMAP
> > +-------------------
> > +
> > +Message Format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+------------------------+
> > +| Name         | Value                  |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Message ID   | <ID>                   |
> > ++--------------+------------------------+
> > +| Command      | 3                      |
> > ++--------------+------------------------+
> > +| Message size | 16 + table size        |
> > ++--------------+------------------------+
> > +| Flags        | Reply bit set in reply |
> > ++--------------+------------------------+
> > +| Error        | 0/errno                |
> > ++--------------+------------------------+
> > +| Table        | array of table entries |
> > ++--------------+------------------------+
> > +
> > +This command message is sent by the client to the server to inform it
> > +that a DMA region, previously made available via a
> VFIO_USER_DMA_MAP
> > +command message, is no longer available for DMA. It typically occurs
> > +when memory is subtracted from the client or if the client uses a
> > +vIOMMU. If the client does not expect the server to perform DMA then
> > +it does not need to send to the server VFIO_USER_DMA_UNMAP
> commands.
> > +If the server does not need to perform DMA then it can ignore such
> > +commands but it must still reply to them. The table is an
>=20
> I'm a little confused by the last two sentences about not sending or igno=
ring
> VFIO_USER_DMA_UNMAP. Does it mean that VFIO_USER_DMA_MAP does
> not need to be sent either when the device is known never to need DMA?
>=20
> > +array of the following structure:
> > +
> > +Table entry format
> > +^^^^^^^^^^^^^^^^^^
> > +
> > ++--------------+--------+---------------------------------------+
> > +| Name         | Offset | Size                                  |
> >
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D+
> > +| Address      | 0      | 8                                     |
> > ++--------------+--------+---------------------------------------+
> > +| Size         | 8      | 8                                     |
> > ++--------------+--------+---------------------------------------+
> > +| Offset       | 16     | 8                                     |
> > ++--------------+--------+---------------------------------------+
> > +| Protections  | 24     | 4                                     |
> > ++--------------+--------+---------------------------------------+
> > +| Flags        | 28     | 4                                     |
> > ++--------------+--------+---------------------------------------+
> > +|              | +-----+--------------------------------------+ |
> > +|              | | Bit | Definition                           | |
> > +|              | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D+ |
> > +|              | | 0   | VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP | |
> > +|              | +-----+--------------------------------------+ |
> > ++--------------+--------+---------------------------------------+
> > +| VFIO Bitmaps | 32     | variable                              |
> > ++--------------+--------+---------------------------------------+
> > +
> > +* *Address* is the base DMA address of the region.
> > +* *Size* is the size of the region.
> > +* *Offset* is the file offset of the region with respect to the
> > +associated file
> > +  descriptor.
> > +* *Protections* are the region's protection attributes as encoded in
> > +  ``<sys/mman.h>``.
>=20
> Why are offset and protections required for the unmap command?
>=20
> > +* *Flags* contains the following region attributes:
> > +
> > +  * *VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP* indicates that a
> dirty page bitmap
> > +    must be populated before unmapping the DMA region. The client must
> provide
> > +    a ``struct vfio_bitmap`` in the VFIO bitmaps field for each region=
, with
> > +    the ``vfio_bitmap.pgsize`` and ``vfio_bitmap.size`` fields initial=
ized.
> > +
> > +* *VFIO Bitmaps* contains one ``struct vfio_bitmap`` per region
> > +(explained
> > +  below) if ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in
> Flags.
>=20
> I'm confused, it's 1 "VFIO Bitmaps" per "Table entry". Why does it contai=
n
> one struct vfio_bitmap per region? What is a "region" in this context?
>=20
> > +
> > +.. _VFIO bitmap format:
> > +
> > +VFIO bitmap format
> > +^^^^^^^^^^^^^^^^^^
> > +
> > +If the VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP bit is set in the
> > +request, the server must append to the header the ``struct
> > +vfio_bitmap`` received in the command followed by the bitmap, for
> > +each region. ``struct vfio_bitmap`` has the following format:
> > +
> > ++--------+--------+------+
> > +| Name   | Offset | Size |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+
> > +| pgsize | 0      | 8    |
> > ++--------+--------+------+
> > +| size   | 8      | 8    |
> > ++--------+--------+------+
> > +| data   | 16     | 8    |
> > ++--------+--------+------+
> > +
> > +* *pgsize* is the page size for the bitmap, in bytes.
> > +* *size* is the size for the bitmap, in bytes, excluding the VFIO bitm=
ap
> header.
> > +* *data* This field is unused in vfio-user.
> > +
> > +The VFIO bitmap structure is defined in ``<linux/vfio.h>`` (``struct
> > +vfio_bitmap``).
> > +
> > +Each ``struct vfio_bitmap`` entry is followed by the region's bitmap.
> > +Each bit in the bitmap represents one page of size ``struct
> vfio_bitmap.pgsize``.
> > +
> > +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is not set in Flags
> then
> > +the size of the message is: 16 + (# of table entries * 32).
> > +If ``VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP`` is set in Flags then
> the
> > +size of the message is: 16 + (# of table entries * 56) + size of all b=
itmaps.
>=20
>=20
> > +
> > +Upon receiving a VFIO_USER_DMA_UNMAP command, if the file
> descriptor
> > +is mapped then the server must release all references to that DMA
> > +region before replying, which includes potentially in flight DMA
> > +transactions. Removing a portion of a DMA region is possible.
>=20
> "Removing a portion of a DMA region is possible"
> -> doing so splits a larger DMA region into one or two smaller remaining
> regions?
>=20
> How do potentially large messages work around max_msg_size? It is hard fo=
r
> the client/server to anticipate the maximum message size that will be
> required ahead of time, so they can't really know if they will hit a situ=
ation
> where max_msg_size is too low.
>=20
> > +
> > +VFIO_USER_DEVICE_GET_INFO
> > +-------------------------
> > +
> > +Message format
> > +^^^^^^^^^^^^^^
> > +
> > ++--------------+----------------------------+
> > +| Name         | Value                      |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +| Message ID   | <ID>                       |
> > ++--------------+----------------------------+
> > +| Command      | 4                          |
> > ++--------------+----------------------------+
> > +| Message size | 32                         |
> > ++--------------+----------------------------+
> > +| Flags        | Reply bit set in reply     |
> > ++--------------+----------------------------+
> > +| Error        | 0/errno                    |
> > ++--------------+----------------------------+
> > +| Device info  | VFIO device info           |
> > ++--------------+----------------------------+
> > +
> > +This command message is sent by the client to the server to query for
> > +basic information about the device. The VFIO device info structure is
> > +defined in ``<linux/vfio.h>`` (``struct vfio_device_info``).
>=20
> Wait, "VFIO device info format" below is missing the cap_offset field, so=
 it's
> exactly not the same as <linux/vfio.h>?
>=20
> > +
> > +VFIO device info format
> > +^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > ++-------------+--------+--------------------------+
> > +| Name        | Offset | Size                     |
> > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+
> > +| argsz       | 16     | 4                        |
> > ++-------------+--------+--------------------------+
> > +| flags       | 20     | 4                        |
> > ++-------------+--------+--------------------------+
> > +|             | +-----+-------------------------+ |
> > +|             | | Bit | Definition              | |
> > +|             | +=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |
> > +|             | | 0   | VFIO_DEVICE_FLAGS_RESET | |
> > +|             | +-----+-------------------------+ |
> > +|             | | 1   | VFIO_DEVICE_FLAGS_PCI   | |
> > +|             | +-----+-------------------------+ |
> > ++-------------+--------+--------------------------+
> > +| num_regions | 24     | 4                        |
> > ++-------------+--------+--------------------------+
> > +| num_irqs    | 28     | 4                        |
> > ++-------------+--------+--------------------------+
> > +
> > +* *argsz* is the size of the VFIO device info structure. This is the
> > +only field that should be set to non-zero in the request, identifying
> > +the client's expected size. Currently this is a fixed value.
> > +* *flags* contains the following device attributes.
> > +
> > +  * VFIO_DEVICE_FLAGS_RESET indicates that the device supports the
> > +    VFIO_USER_DEVICE_RESET message.
> > +  * VFIO_DEVICE_FLAGS_PCI indicates that the device is a PCI device.
> > +
> > +* *num_regions* is the number of memory regions that the device
> exposes.
> > +* *num_irqs* is the number of distinct interrupt types that the device
> supports.
> > +
> > +This version of the protocol only supports PCI devices. Additional
> > +devices may be supported in future versions.
>=20
> I've reviewed up to here so far.
>=20
> Stefan

