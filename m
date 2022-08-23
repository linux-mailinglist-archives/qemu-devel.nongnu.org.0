Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0159F079
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 02:57:01 +0200 (CEST)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQehY-0006lc-0d
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 20:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Martin.Oliveira@eideticom.com>)
 id 1oQcVE-00089v-Pn; Tue, 23 Aug 2022 18:36:08 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41]:42317 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Martin.Oliveira@eideticom.com>)
 id 1oQcVB-0005Zo-8o; Tue, 23 Aug 2022 18:36:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGSOrsEcDDXJ3PcE3NtK2cNBlXQkRj+thma6sfQwhVPtH7ugfzkGirmTZU6+tXLE+3hegtOtcT0Kv0wgVKoP3tb99VVe119qG+kHm0tMp0NnmVf4mnCOs84zx9/2JCtTA0RnXQmu/7y3wu7pY0yr4wcT9Ule7BQhLD76XpY955RJN249CxvF0s3fOrgkny8pXfo3WZ3S6J/zhsUr3nZWLBi+y8uCGZxFkSd1rrly0ba2pdoM2XX0bgmquyXrv2CF+UJkMPZl9uqFbE8EnrTouXp0RbtFknZKsJ4yQlHoIgS66EXNCKQCZ76uc5+0T14GPFcoMEiDmkDvlcoM8YbMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGHl4wAvV1lnbWvs3QA3P7GVfLEZS7VX2v7V3J5k/CU=;
 b=KJjml6PFEyvc6dkPyn7WKK0Kqnw4J2KeJcsQBg3YjiYOeKi8RxqcY+hjuE0VFvIFNAkqnzKNKMHN4LrGDxRLQnasdvUybi6CiwXK+zMQcpwWufD8aIm3NSC4PiFdCmGCgiQGqfVAI7uQwZftZmyO4WoxmtwzGEsyaDC7VN9+vtg6SdUb4+uspdsJORbhP8uMQNX04oKo1QsqdsWHt1WrOpTlBJyzdxUCcrus/jMm2hNzXILbLO7QeTkumDxOE6GPt9fQVD+jRRZftiSzchevHqxmqkxgsqoSL5Dl3i7wyeQWd3P5WtmfYfIiV+7Mn9b9+fn546q+SyXb2OHTi9IBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eideticom.com; dmarc=pass action=none
 header.from=eideticom.com; dkim=pass header.d=eideticom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eideticcom.onmicrosoft.com; s=selector2-eideticcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGHl4wAvV1lnbWvs3QA3P7GVfLEZS7VX2v7V3J5k/CU=;
 b=wN+rET4J0V52O2UJFjFYEmgBjscqyGlHX1/2qYgTARrqCpFr4FpV4z+ehNYkXeAFcrXr3X2fFaLfM7LJepnwvvJ/wkhrj5+hC1k2Lrj/3ajxlYlh43ZA7IR6dAosD0K5gwNwMscnhGdl/98Q5pPz/w7mKZ498bPSPahB5QLK3gE=
Received: from MW3PR19MB4250.namprd19.prod.outlook.com (2603:10b6:303:46::16)
 by MW4PR19MB5566.namprd19.prod.outlook.com (2603:10b6:303:186::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 22:36:00 +0000
Received: from MW3PR19MB4250.namprd19.prod.outlook.com
 ([fe80::c48d:a252:fd6b:8f7f]) by MW3PR19MB4250.namprd19.prod.outlook.com
 ([fe80::c48d:a252:fd6b:8f7f%3]) with mapi id 15.20.5566.015; Tue, 23 Aug 2022
 22:36:00 +0000
From: Martin Oliveira <Martin.Oliveira@eideticom.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "f4bug@amsat.org" <f4bug@amsat.org>
CC: Stephen Bates <stephen@eideticom.com>, Chaitanya Kulkarni
 <Chaitanyak@nvidia.com>
Subject: EBUSY when using NVMe Block Driver with multiple devices in the same
 IOMMU group
Thread-Topic: EBUSY when using NVMe Block Driver with multiple devices in the
 same IOMMU group
Thread-Index: AQHYtz2bvx1iEuwnEE2WORQNbfNNOQ==
Date: Tue, 23 Aug 2022 22:36:00 +0000
Message-ID: <DM6PR19MB4248C040D8E12FAF3CD9D615E4709@DM6PR19MB4248.namprd19.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eideticom.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16c76caf-9222-413f-4436-08da8557daa1
x-ms-traffictypediagnostic: MW4PR19MB5566:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KvC07u+Tb259tIADqkrWYNDSRGnbs3IuUJB1RFErDT2i4jGwGtaeHbegk+yh8DLxtOaAcSfAlQYGiOKOutP79F+E63EVW1weaovj26IGZRVrOtROSOfB4q5yjGtFZ7xVXXlCpmdYQiuxZL6/jRkjCyNzjm0xu6BUkeW9pwXyrs7Sr7Pg87X9Us2FtwJr6K778z8AD74uE2y8Qz+VE0XMSDBkocTD9o7yAkEP7t7s3iDnrOmGEzxlbo8Vdv7omsHlpzAHR8KPA+GQtETjtTA/W+6Pyj8EgGLSiHI+Vsr+j+YZbPGk39Sk2TMgU8DnW168MOcX6XK8OhlTCdyaiC2wWshSivOv6bZjC8leh1h0ugSmRXYcoike09ZMsBpIY0lBy4CMjEnGMhmdhbKafEjM43WIk3ZJadprO0gCjeURw+/76mx9KGhxdzTifjfhNLA6gZ1VT1SDMTL72SGvUx9vRB1nhpJ/8smFtK4LgHEI+fxbVLdZ9bmPVo1YlIDO2yeCy6d/ST/OxoXhtWNVzo3MtqK9t+fU/1SNSuo5s3VR8PYVcw2UfjUykaVwXlFzDBuWJwsJ/l656TlfOTAvJaR+5ow0Ilqk3j5k4gUhFElwEdvOR7i6+bQxjx5KrQvxg/p59fDZvrgX7SvN15PHEj6aWi1XMc/O2ymZhwI6/4BfRf+CTy8WwXAtuOp7Vmp3zw3q+L3urQHOdzDMXPipCD/i38cIRlM+HFECb1EPo/c9Joa57bR2jzLrYUSrGHSasPWr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR19MB4250.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39830400003)(66946007)(66476007)(66556008)(66446008)(41300700001)(76116006)(26005)(8676002)(4744005)(5660300002)(6486002)(186003)(8936002)(6512007)(478600001)(33656002)(52536014)(38070700005)(9686003)(6506007)(86362001)(38100700002)(316002)(110136005)(2906002)(4326008)(54906003)(122000001)(71200400001)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UGPjrtkS+hJ7SPbf7KqIw2ou9vKbfu8pUUrfFuGj9GhUDZkK3i0RCXUpI/?=
 =?iso-8859-1?Q?2QmCjH7TMNxOpxp2ibE/WmyDV9qLnmd/WSo4kMVyvxJYRALJM2j8rIOhkT?=
 =?iso-8859-1?Q?tfTLkbv7PJ0VuTrNsyvhQkyi7NdygwMcjLMksuh1oAKV9tsPHqd7GerXsE?=
 =?iso-8859-1?Q?v130Pr3HrD6BMZXRTAqLWDn6m1cv5ahN839bTwHr7b4Ue5RAjXi6lM5QDK?=
 =?iso-8859-1?Q?xpCV6tlJsaUnaSz/QLjExVPMb1QBC8Cbtp2Uh8u32Bj33exWGnOsSDV9qF?=
 =?iso-8859-1?Q?/6SOo8mJCHDOlXBvzXOGjJgem9uSxGnLYF6OslhLTDOlQYQzKA+yE2MCJY?=
 =?iso-8859-1?Q?mam/DIHlYiUom5gpyRmyXhxPKouipwmgagljSMGuXy44eOxNn6PQ9egAsk?=
 =?iso-8859-1?Q?Gvqw3MkqwHI12rEJ1EhwBNcT8nbb2yk8ChtuwBcB2YMZD623a7a5y31qsa?=
 =?iso-8859-1?Q?ujgxZoikaGXcTssAdfdrHW9yVrXG8tfLxxbTRnK3QKf0qbN7X/sKrwS/eV?=
 =?iso-8859-1?Q?NaTCZKUZRfmmi8EcqWazXcVGkJ49bS74oC8DS+OCcXOsztWow4RdzwxP5x?=
 =?iso-8859-1?Q?rXKrk8DRhvtNKOzVUzzn71Tdp5q4LEPv3sbhtJEl2zayESOhFKrI6FTe4J?=
 =?iso-8859-1?Q?99UAdg/am3mVLqG7J0pnK86xekIn9xvXJl0EUTmwmJAd8qwBPNlR2Vvuqj?=
 =?iso-8859-1?Q?vbGimnvESKNcsCX/tSPjwMC7qVebrvppwlNd6oGdZof5+huAmbegNDmoI9?=
 =?iso-8859-1?Q?+uxX4rpLjyob3+yknU1+CpSqk+cuFdTBEOgIRHIb3muHZ9xnQCbpc10VYs?=
 =?iso-8859-1?Q?3d5m03e7Ova16QbmMATaLbicTs2YdnTE+dYdyE3pgX7B0gn19S05mEcDB6?=
 =?iso-8859-1?Q?e+GCxQiJnlNVDX7GtPk4iJlFqFwn4fCc3voePHqDiPRnTavL2ifM6g2BHK?=
 =?iso-8859-1?Q?dF0UcSqH9O1UHpjxxaHiTVI/sjNqEFiEK8hkcyybwHor+C8eSlr6zphoLF?=
 =?iso-8859-1?Q?t3wRoSgcLWxGeXrTKIQhGwL7LhwnXVQa2UW4OqEfbAc2qlKJ21k/cPVsw4?=
 =?iso-8859-1?Q?QDpAfEueo1EJC+ELeJ24/hlk55mZfUoCaQFalkOGtPLL8557w7JHIT/iw8?=
 =?iso-8859-1?Q?W4L9+mdDHqhu5/IvlJSBan7rgPkKXl3+KZJKpigmNtWa+GPX/YVakpYJaq?=
 =?iso-8859-1?Q?jgV9yABzshaQM7qBGXlO8MLo63aYOASX7tYYcrASbH6MvzGbbU8h28g2YP?=
 =?iso-8859-1?Q?BBA29FPnSz7bPbCshWZBtCQgBgd6lFYI72FnIy4k+J5cKmMbWKzWnoGHGR?=
 =?iso-8859-1?Q?obzLdtciDU5KnF6IBM47zqceJ8axnWbXQe/EZoWl/HrV/lafAqyogVoKJN?=
 =?iso-8859-1?Q?PgwnDQZSFkZDxteh4Mq2NbuvmNXZsvM4NxgWohQ1FnfFzLixwbGZgljOhc?=
 =?iso-8859-1?Q?5oz4UcnRAYQPRpMv54CBcRucWKUgs9kwfvIMzZlSMCDqshJVFqeodzxQGi?=
 =?iso-8859-1?Q?AQdg3hM/wFIClt3W5LB8rfVU/+qwUXWYdi4AaDIf910NJkLjVFGuhJLk5E?=
 =?iso-8859-1?Q?Xvdlx61+QkeL+1Q8QrV3ZGenYEdQ2D3YgKVImryXJjho7j8MfsV5SVanU1?=
 =?iso-8859-1?Q?kVGZfMPsVDhQFYNKhUp85eg7gOSz3LgGKtfRCsw0bcLDfDfG27WmsOyw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eideticom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR19MB4250.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c76caf-9222-413f-4436-08da8557daa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 22:36:00.2528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3490cd4b-0360-4377-abb1-15f8c5af8fc2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: An4VtwUyHkY6RkCsNz4cZtvWT49PPf6bJ9vE4bo5CpoQY7UDa//d499shywkobFG3H3kObjQSH4i1MAwTX+y8vhDMnEDSr+6RllPOY9w/ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5566
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
X-Mailman-Approved-At: Tue, 23 Aug 2022 20:53:52 -0400
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

Hello,=0A=
=0A=
I'm trying to use the QEMU NVMe userspace driver and I'm hitting an error w=
hen trying to use more than one device from an IOMMU group:=0A=
=0A=
    Failed to open VFIO group file: /dev/vfio/39: Device or resource busy=
=0A=
=0A=
If devices belong to different IOMMU groups, then it works as expected.=0A=
=0A=
For each device, I bind it to vfio-pci and then use something like this:=0A=
=0A=
    -drive file=3Dnvme://0000:26:00.0,if=3Dnone,id=3Ddrive0,format=3Draw=0A=
    -device virtio-blk,drive=3Ddrive0,id=3Dvirtio0,serial=3Dnvme0=0A=
=0A=
Using the file-based protocol (file=3D/dev/nvme0n1) works with multiple dev=
ices from the same group.=0A=
=0A=
My host is running a 5.19 kernel and QEMU is the latest upstream (a8cc5842b=
5cb).=0A=
=0A=
Thanks,=0A=
Martin=

