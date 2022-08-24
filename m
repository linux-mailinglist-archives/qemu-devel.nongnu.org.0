Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0A59FF62
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:22:18 +0200 (CEST)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQt8v-00063f-TV
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Martin.Oliveira@eideticom.com>)
 id 1oQt41-0002kE-Jv; Wed, 24 Aug 2022 12:17:09 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41]:17505 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Martin.Oliveira@eideticom.com>)
 id 1oQt3z-0007Uo-TP; Wed, 24 Aug 2022 12:17:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCtHD6yMxnXEH04XYO+eVp086BjUY8bf5GaU50I2zZeApvvULt8TIcDC+qmt9gBm9EuvSKXi2UrRIFvGmusEZ8lBGcrTJjbJVSoT8nEmhtzsYyozZfqB7++GcbePbKO/NNe9TAlYbb1wBNzqCJS7yHqkDpuLj2TuRvOGmT3AWYP+jsdwlwSDu5SJCkj+7FfW6v9B4zDm7lpa+cqPbpaMYDtvkawcpdfPzC2Cn+9qAMO/A3LPmVk1tq2PR2PeFQjiWJcJPvrHQNmUBcVSKKCsW2m3OzZ5wiKpQzGl41dboSsgLM2pDdA6Uz6iSt2wQlmOCqoAEBTiIMPPx3WB2lMv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxdzUI1t01H9WVEerP5CJiJBN6H/LU1KWHj+BEK+2eA=;
 b=XDqIptAh9Ru9ywoEdI/D0BninvqLfjiUp6f8xcY2YsVznmvS/g+9cr1dJUzKsF9T5bOe3Ypnp3EW5uPQhXAyp+mjPlBWw2PEcmm8c4xqVXxnkmG07yVX0W/w9pwVabbAf8uHNAX0DN9uNtIFzKRL/MHRvpu/vYxwLdjhFWM+VQnV59DJ6X4l2GJ5euiRsfzg5DklWGIneNveTcB5icFqNKPBK6H0Sh2PbOENCOaOqBgoTMSC/euDvVrbvoc5A5Wn1sMuReajZ/gyiq17OvV/R68VeTcUp4KdFRcQVT7RBEE1RqvCrzCvVbldFeMPojh22y+/q0CkJAlCRN2JyV9z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eideticom.com; dmarc=pass action=none
 header.from=eideticom.com; dkim=pass header.d=eideticom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eideticcom.onmicrosoft.com; s=selector2-eideticcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxdzUI1t01H9WVEerP5CJiJBN6H/LU1KWHj+BEK+2eA=;
 b=rWThoKhkxHmjMDrHwfZp0oyAZpR1ARtkj5VPBdNs+t+d5nt9uvA2WnV8stCCi/Hw47DQq1st/BjRiXIqAdAuGClBtHQhkEOpK7fow2UV/seViqk/5r1eT/If0QkIV5lsjxorFykj0QLnTZLshOLOuhyzZ7993O8JqmYSRfTsFSo=
Received: from MW3PR19MB4250.namprd19.prod.outlook.com (2603:10b6:303:46::16)
 by SA0PR19MB4176.namprd19.prod.outlook.com (2603:10b6:806:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 16:17:03 +0000
Received: from MW3PR19MB4250.namprd19.prod.outlook.com
 ([fe80::c48d:a252:fd6b:8f7f]) by MW3PR19MB4250.namprd19.prod.outlook.com
 ([fe80::c48d:a252:fd6b:8f7f%3]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 16:17:03 +0000
From: Martin Oliveira <Martin.Oliveira@eideticom.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "f4bug@amsat.org" <f4bug@amsat.org>
CC: Stephen Bates <stephen@eideticom.com>, Chaitanya Kulkarni
 <Chaitanyak@nvidia.com>
Subject: Re: EBUSY when using NVMe Block Driver with multiple devices in the
 same IOMMU group
Thread-Topic: EBUSY when using NVMe Block Driver with multiple devices in the
 same IOMMU group
Thread-Index: AQHYtz2bvx1iEuwnEE2WORQNbfNNOa2+Ok4H
Date: Wed, 24 Aug 2022 16:17:03 +0000
Message-ID: <MW3PR19MB42509D9BDF4D1D11306D2475E4739@MW3PR19MB4250.namprd19.prod.outlook.com>
References: <DM6PR19MB4248C040D8E12FAF3CD9D615E4709@DM6PR19MB4248.namprd19.prod.outlook.com>
In-Reply-To: <DM6PR19MB4248C040D8E12FAF3CD9D615E4709@DM6PR19MB4248.namprd19.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eideticom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 195bbc83-e2bb-42b8-7830-08da85ec14c4
x-ms-traffictypediagnostic: SA0PR19MB4176:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ve4VExiwmzhYXlBLuhZBXodo/w+36fkR7AcEjreAMukQQc6v/WrOtatjlR/LC45PVJc4fFV+AK2x9WfMVLjBVHi+JrXj+PItzmAqoFCRmfFVrM5ZDt1RzbIliFIxCvZmoVgGQvgGQZa+L/naVjEInIgVxDeSfS6Bps4CaPyOP4vZ1hN17IrKtgS/vTvfOTs2Q6Db/oWPE6LHWSSmLZDZgKIda5SnYyvrQYF1bwGO9NTb4uWsvi9rH9Xgs3MiitXbl3kdHSAf2ii8MUzkmRCSF0h4EiJ9QM36H91cXmckxu24CGx4r+rP61w16H8RKAXeVDH0FMKr5D2AtLY6m8ESWlrSUJ4MFRsVReLhaoN2tbcsGSgWXhWRAsAgqRZijFY5R77PeemyxwAHTAR3cbVgj5PUqsRcYNXDP7aBosrpiyth9wQ18R0LaW4pV++gxqjd86H0Xb26S9dqyrII3AkqcOEyMR911pyeCO6OqgBWBtFtMrTZ2hr4dPBljrjI7706BW0M6iVgKCsjBwH8uSZDn53SfeyyhKk1uv4rppM2RAgSn11YtW7R+3Olyz6dH+ZATNrTCRIaIYHShk5IsXl2uQLjlppy71OweWLTR/POQV6TqJF42ZMjNiMMZPCHwP+m3EsvlN3GLlR2autoHTQEyfPu0FBwCYJAeZjRQHKcz325E8Rthzy4RpOLtY+xU+dlFU530eOGg1LyYHyr500uv8neGJj2DhQgK5uF7GH2kYgP5Om9eURxrfELHzatK7XsS3WMiPLSq8YcIm2Y64RQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR19MB4250.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(136003)(346002)(39830400003)(396003)(186003)(122000001)(38070700005)(316002)(110136005)(54906003)(71200400001)(5660300002)(26005)(33656002)(66446008)(66476007)(76116006)(64756008)(7696005)(53546011)(8676002)(66556008)(9686003)(66946007)(91956017)(38100700002)(4326008)(4744005)(478600001)(86362001)(2906002)(6506007)(41300700001)(8936002)(55016003)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tPA6t1/AEzQ4/vvrwHEnTJ0EW5S3fcnJysbhZeFWjyItXsxtZeZC3x7rC2?=
 =?iso-8859-1?Q?vzTmLYLuJfg+ASY5Z4fCwBqiGzIaorB3e9iWH1GBK2GiHJqwfTnC9uNiQK?=
 =?iso-8859-1?Q?+QKhEoFitAotgvTwT0AodVA++IbXtRVMvfQiZXxKce0wu2pE78b/sy4FEO?=
 =?iso-8859-1?Q?CjEluJHuYMBUdsbM9vF7ojg9Hg8AqWrlkgMm1DUfKqXSUWhBQBIcGpmr00?=
 =?iso-8859-1?Q?03/fV4TuW4cDwQY/xsn497CQjvp/AhFpo8TaJP/SD2qlNtHiEI8c6ILExU?=
 =?iso-8859-1?Q?vu64N7DQad+G0LMb2mGotkOiYfH5/srmCDdlSG0JVVzfZa78i/quEmWwvW?=
 =?iso-8859-1?Q?L8sISpWfJGumad37h7e0DY7iYzs5KR+sOjbqWCJR8v3GEMlOWF+yv1cD9a?=
 =?iso-8859-1?Q?uP82Z/uooDDsJI+rxVNT9bnWsH8fySy5DDOnOcfJTvlGjkWRq1L3SBGI2w?=
 =?iso-8859-1?Q?iHI3d+JGi+lZTATLR6ef1djhM6pxD8rO8oo7y9BdaKIY8VoFdnCoVzNltT?=
 =?iso-8859-1?Q?5RtBJ4cmdqJeRsU3upbzmp5y5AUd96armBEWqqFDh3Y03zkL8nUg+3iC1l?=
 =?iso-8859-1?Q?WFgmr3i2s/Tg64EQtz2ETCXhqdi2cjEDTfrLUGWmBm5L+7TUFMoWU48ua+?=
 =?iso-8859-1?Q?KbqxuHlZoRIu8fjp5yml6yTTHNg9hoQOFZErcdPDvqqo6LLuDNFgsUTIeY?=
 =?iso-8859-1?Q?hf3ap13nPYTZRmGd/6k216AFHC85MgmQQUcN4Ghmn9zOGKuKE06Zu+dymc?=
 =?iso-8859-1?Q?RS6590YZ8oVFwmgTUmnOARJQ2lHoYYgFER63Ac7vlmsO+pwyaEXEaLbtJz?=
 =?iso-8859-1?Q?EK3OjH8IfOhsJCgrJVceFsmk9A9wTx2QdX3foP3SJYugvxz6WqSEZbAHFp?=
 =?iso-8859-1?Q?/DWRtw1W/HMGeHzymiFmN70UQpwG5pvc5/nK0QtbdkGcdI/26JK9Jas+V3?=
 =?iso-8859-1?Q?5NHrbxXiGpnpQdFHm/1qF8qpxnbFxeghnFL/q3LA7kQA+ufmnN1atlXDh3?=
 =?iso-8859-1?Q?TNF73/OjaqPn3IWN6Ni8/U4FU1Rbg34rKb/Apuyjiy5fRWdfBomU+JbJC4?=
 =?iso-8859-1?Q?ddDaCAwGvaOgNsRHrFxj2mqdQAN9zL/w7Iw8zrf+YVZ6XjNGfiAfXyOGb8?=
 =?iso-8859-1?Q?IdFqsB9IJCPC9Wjegn3eGx4wKwfe/4V9PaMRjMjyNefF6it67YtXqpZogd?=
 =?iso-8859-1?Q?Jz82ctfol4EP/GJhnc1DIRaMsFvFx/Dl78RxRFK8m50iri+tIvx4gijSRb?=
 =?iso-8859-1?Q?NbuvmF4a0CWy4QPSatwf1a36DaFZuRdSeTrfEbw/XTvbgmwAz2NCkUne0j?=
 =?iso-8859-1?Q?e0uxAMZODdWfHsoZZEgy+DWyRDzrc2tYWReaMoJt7uPuevU0gO3F2GCVgn?=
 =?iso-8859-1?Q?mQpDZCh6gwzHopnNXnvecCYyLQjJXzByMFLF/O25pJoCcjoyy3gu3DXMFY?=
 =?iso-8859-1?Q?IEnBhpiUb/P0bV31ce/vklvdnXicmzs/b8LtWePkWyvuP0htAW/S3pnN+b?=
 =?iso-8859-1?Q?8P4jPmQfJHXx2BlaHpQjJSx7PVwg11TwE27MZFyU4tyHU5kfFp1FyCEfif?=
 =?iso-8859-1?Q?L7kSeZcZhtIYT+CmyH/+V8LCLFpIauF/r6lgZDJiM3M7Nf3nEMIgD4THbN?=
 =?iso-8859-1?Q?aMyAnJkwJE1qf1M4hBD92qK84s+9je2F8h47IzK2nDSdMBZafnuIu2Kg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eideticom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR19MB4250.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 195bbc83-e2bb-42b8-7830-08da85ec14c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 16:17:03.2917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3490cd4b-0360-4377-abb1-15f8c5af8fc2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4uzVB1uws6HO8NNYdnUG2Dk8EYfRAvjVFhsdZr57FeE5uzE6NTkTmWPcOh0vu/O6oozZGPc5H8XwadCWi+oV3V1kZ57UvRlR+YYtXrIxpJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4176
Received-SPF: pass client-ip=40.107.236.41;
 envelope-from=Martin.Oliveira@eideticom.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

> On Aug 24, 2022, at 4:36 PM, Martin Oliveira <martin.oliveira@eideticom.c=
om> wrote:=0A=
>    -drive file=3Dnvme://0000:26:00.0,if=3Dnone,id=3Ddrive0,format=3Draw=
=0A=
>    -device virtio-blk,drive=3Ddrive0,id=3Dvirtio0,serial=3Dnvme0=0A=
=0A=
Small typo above, I missed the /1, it should read:=0A=
=0A=
    -drive file=3Dnvme://0000:26:00.0/1,if=3Dnone,id=3Ddrive0,format=3Draw=
=0A=
    -device virtio-blk,drive=3Ddrive0,id=3Dvirtio0,serial=3Dnvme0=0A=
=0A=
Martin=

