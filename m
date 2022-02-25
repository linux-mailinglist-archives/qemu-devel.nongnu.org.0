Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1344C3B64
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 03:05:11 +0100 (CET)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNPyo-0007tQ-Ef
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 21:05:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nNPwB-00073y-JZ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 21:02:27 -0500
Received: from mga09.intel.com ([134.134.136.24]:55355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nNPvz-00018I-I8
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 21:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645754535; x=1677290535;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yhsdgHABidUOFrLTExtvFPOI2jYHlgJ7ml1MOGzVVWs=;
 b=lUYGoLboHzU1w57pbj3/syGV2I7hXTiF+b1Wu8QRxZ7VWrVpRXW9QATK
 YIk3Zmk69reZJPiAa6/Wefyxo36ExJiVf8pxPAhXyedvNB+00oPcBOuZL
 V8EZycp3UoEV8YXuixPCPz0onQ1tKGobjFLg+K6NqHo7uSLfrjU0iPhYo
 wrRilVV0gCjZL8MRqSD3kE/UW+elRO5JovKv188cD0A53/smMUp3v0zBl
 0RMn/MQ8i/qFafkTVwJTzaafn/SU6MA4OD04EchupTNKsz6xkRG7/xi8c
 bgzhv53yJ3zDmOEDRpcM/sQpCzf4QtzCR0Zj59e1W9+BonkPnxAkyl15J w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252128853"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252128853"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="509101217"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2022 18:02:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 24 Feb 2022 18:02:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 24 Feb 2022 18:02:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 24 Feb 2022 18:02:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROJQ5nQ9f1kE0ncOGNTjMxTKd6eVKhfLuhwMdL9Q+/AH3eCeOG9yRr7/gwaEdDCL60V5C1e0FiKC+5VUWaAIzkbTNLHDVzzn3Ja9OxPpdDuAloxj9CNuIaGUxx1BDT/ynNQoA6FrSV17GpgWyOSmexSfYWQV08kleB+XoH8lWFBPdUJqW2kru6mZqXkDQubwLQ2u2ATsaf56TwQzvqFVsEJVgfrD51rnhFs3+aclM+8wnri7Oaok6dcfjamv1sA9LNTDR4h9FGx3Dw71GMmlFqGJBZdeQ860Po4UowPE/8kHVdtDdoaIfyYvTyL77VTpx+BfoQmNyEKCLve/F7elxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSimQOEn3VqacY9N//FH93R5EeAlmnURfLixIFV8An4=;
 b=Ga4eeNrEFo83o8RxVEgzQ9Yguz/IwPKdenQrEZwQOIA12jeQCksKMPc0JeYH7VCiwgNRlUg7yQhPSHobzYH50cW6cZgKytFLa9+GLOe5sUUMoKj6jmBm71pG4nPoGkUI2FNuq8fRhVfUfd0N4aKs5pZqt5o4JXGDHPNgzknb+o84U8yt5ewl25pu1rbouWJUOVUVdgs5Ip0MuRXjdziPQs5/wvDy7KEt98NmGyV6Cm9Cal13kh51HmlfYoUTzUs2LOZHRqKs+OWHmUAUQWf7HHRHuFXXbVq1D5Eubj6CspvqyjiPhys9evFXnhMzo8zO5stsRPXaWNWLKufV1iao7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by MN2PR11MB4415.namprd11.prod.outlook.com
 (2603:10b6:208:192::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:02:00 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d0fe:d86c:4200:3d6a]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::d0fe:d86c:4200:3d6a%7]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:02:00 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: RE: [PATCH] vl: transform QemuOpts device to JSON syntax device
Thread-Topic: [PATCH] vl: transform QemuOpts device to JSON syntax device
Thread-Index: AQHYKXILmTCU9di3Nk2hu4XbrU5baqyjgtNw
Date: Fri, 25 Feb 2022 02:02:00 +0000
Message-ID: <MWHPR1101MB2110CA0111D2E09C97C5A722923E9@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220224060653.74229-1-zhenzhong.duan@intel.com>
 <YhdsiSDR60IXSAn/@redhat.com>
In-Reply-To: <YhdsiSDR60IXSAn/@redhat.com>
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
x-ms-office365-filtering-correlation-id: c40c16f4-5233-4655-2956-08d9f802cfa5
x-ms-traffictypediagnostic: MN2PR11MB4415:EE_
x-microsoft-antispam-prvs: <MN2PR11MB441517DBC491DAB0B0D0EBC0923E9@MN2PR11MB4415.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oYsyFtcP9gzLeSmvOc4waLAtCUUT/LX0X2zY/Nwv+GhgtP1DPvQveamxMA5KP2wxkRMBloC0E8yFc8mpA9A0e0dxpMWXHd+YVXOYOsJbIHtDAGCiHBq9oeXRTzP8+zx8hyAPykOq2DsltZi02e8bBKiR+lTofXv21zTsf7kC7GBz3IiiyQydardMGWioWs55hjgtGjIPyLn+ddSMdYKEyMoTjc8VG2hjKp89R1jTDtnObySg9o1evxKWjo02BMjOaBBA4Q9WauwyEoNbw+XuSWjG8tkkXEIZROyRB7yn9INV3dDxhFd3NdBRtEK8ollXAi4xRrLQyz2J/BVQyHl9Mybd48NOlToq6AwcSUfY6cbRoS6Fkn3mnRGeMHU0mHLrgfQzRTZr7KxLNA9Bq7aDKz1PfC7KPuRPwV4Fu4b5Ut7QjrA3lKyyCpy1//SqDN0I8lbTQXIw9/Q/hlx/TZ6w3anQ2YbvibBcoVCy8KXuDug/iTv7rz4QdhQhbIEEgZVHio9ubsxnKs/ePKB4u+/wTfEApiDlQZVbjTCxFoPE7OXiJjRK9wzSRkg2xow75AwOOU+yk8FPCQC3H+OJRzzh+kpPAEvJXUP66RZzI2wUA59PkNj0aUDb6HKNowhS5B5wggv2iez61FsLvdaLUepX3Wa+IKi3Pt/MwsK6bMW9+fLqSWmxEJ3+hfw/5b9aZ4nGBHn+A/ytoeam1bBGfobCmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(8676002)(186003)(4326008)(83380400001)(2906002)(33656002)(7696005)(508600001)(71200400001)(6506007)(38070700005)(9686003)(8936002)(52536014)(54906003)(82960400001)(66556008)(26005)(122000001)(6916009)(66476007)(66446008)(64756008)(66946007)(5660300002)(86362001)(38100700002)(76116006)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jW5D4+J5Vzto3Myx8oR1BQnfJBgUE3oSyp99XvdtR0qymXnpDMumIC1B4sfd?=
 =?us-ascii?Q?Msuw4pFrksW1zy0NHW3YQd+c+UbqwFx0GutUEriGazbKx+ZDqbGxMvBTCj6g?=
 =?us-ascii?Q?dvEhJpCHr0Rx5ztz4Mzp4B4iFxvnhER5pDdg/KrmFajbA/r5g0fFEk7vXygj?=
 =?us-ascii?Q?2jZytE+vtvZZA+R7ntSZ+LzKAjSxuechxddPdOJuHZDpOdLaon4q7qVUPQCN?=
 =?us-ascii?Q?KxQTbIb3VLq2uwGUtSeEb992vVGsrIdiQocGdi5jzjp5ec+eXlYThL66dJlZ?=
 =?us-ascii?Q?OJ5oj/KFnrThgI5lzrAvTsvfzSqvKRJwTOQU6Q/921aZhBnGKp0Yv+kC1+H1?=
 =?us-ascii?Q?vQ/U2DXPVrrhwa/RQtcfNv75IV1IrJchmj04vEBxzxKWFKHzhdApQuWGEIcV?=
 =?us-ascii?Q?y4GzW30+Mpnlv9eKIBOGJLv7Calg2AwUTpkpLtkSwflh5tGFvOSfiW3g0/xF?=
 =?us-ascii?Q?VSeLANp8qQloQpjjy0f0GZb5NaCMf+F1X3opqm4T+sXfbz5IFVs1C8eD2aIp?=
 =?us-ascii?Q?65uOiPliP2mLaIKyg8S62DpGBZ084zBDr0s6IOwO4mcnhTOWAnwWyOsBUhmD?=
 =?us-ascii?Q?rsc2xEncPRaVmvCYkIBOyxoNpfAQ0smk1pcRaXlTioCRzvC/wdPQ2zSKFj53?=
 =?us-ascii?Q?Ba/GrB5XgTB9finMV7wN0PV7ysMLOxzi7cF4fkPWiW57u89wcYcLd/eFRHxb?=
 =?us-ascii?Q?1P5wLuZiMRqBpfH+ymby/fnE20pAy5Ech7ZFYVWk96RLLAOdj/eS0pkqMbFy?=
 =?us-ascii?Q?Ir2GuZ4lgzquX3NmQa6jV8HOAW/OTLsFt5g/eKn/yHtQvf/3xurkEawUVBte?=
 =?us-ascii?Q?DhHxLTwGqxcRU0DjSqRGztfBtp0K3UhWNxQtmGWGB9fDaNq7xdxc6zulswTZ?=
 =?us-ascii?Q?CEWOXJBsEGU2kbi8p+lcvF9Wclkww37ZmCR2ZGUshKCtQ2uqXan7dwZIbNDW?=
 =?us-ascii?Q?0NU6YBIsjgapG3z/qgG+BsjTft8swEAz/e1a5ysbmUGYsNqhcJlL3qdLn0D9?=
 =?us-ascii?Q?i4i/wkSbPK0uqdguTdCPhRB1Sa4bpPcXFDqLBzL7COyK1NyZ7Xw8fIyuAA31?=
 =?us-ascii?Q?dshbGJS++tI/p0FHOMn9/LQxvpcTNuQbHj/txz1V7Ncp5/7M7qQ8r5DolayU?=
 =?us-ascii?Q?9gIRL13eD1NtELlHQCaeD+mP455XEgnJO6KvLk8fNHtWTFc/KDGfeIg4h9YK?=
 =?us-ascii?Q?PMJCC0vxrNBxz2hBCvYY2TeIcTEmy7dKWhSCsI9ybdzcqSvwCQmjL4Hza414?=
 =?us-ascii?Q?rHqw5wDxg6+FfswnBkafnQfxeik+e0SrEg7PhvdJJjwPSQQ2dRDpSjrzDPM/?=
 =?us-ascii?Q?MFYUQZfob+JL9WlrHB1iqezRW0XcsypN8xLcOR+LIzmQSG81V8JxcYqs3Q3X?=
 =?us-ascii?Q?QZ/fgABR/KPqDZUraUCNFRAPRqy3cYevPmQi9JA3vqvToO3mRPJR32I3v4t7?=
 =?us-ascii?Q?PDlcnLtSn1vw4lPoWHEGw3iJF9+z1S1lM1jJB5asc9EFwURcfiib64ty4tLk?=
 =?us-ascii?Q?doObFFgdmEjI2r//vjNqgElIcanFkHO3ltgeeHW8OGnWUJN5GcIk8KY+IRy/?=
 =?us-ascii?Q?vJ+cScLfIuALeQy0IFjPGVdIbE4DrubOrYEImDoYMeT4FGqqDf/tUgmpoHQ0?=
 =?us-ascii?Q?JjqjLROEKLiA2S+zjJYPChLKIwNJMFPNmSHZVPDk5KI14N1MhamIL3wBK9bM?=
 =?us-ascii?Q?oo1GEw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40c16f4-5233-4655-2956-08d9f802cfa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 02:02:00.6341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4rIZWNBnjaEJfV3hjf9VuiRi4c2hlcTcEtRXE+Qpau7JTLUMS58YebMLqV1hyEfwZMQqCUo/eUblx1zn1JwxEcZMZ0hpcnNLsLi9DNY1XMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4415
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=zhenzhong.duan@intel.com; helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "pkrempa@redhat.com" <pkrempa@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "lersek@redhat.com" <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>-----Original Message-----
>From: Kevin Wolf <kwolf@redhat.com>
>Sent: Thursday, February 24, 2022 7:31 PM
>To: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>Cc: qemu-devel@nongnu.org; pbonzini@redhat.com; eblake@redhat.com;
>mst@redhat.com; pkrempa@redhat.com; lersek@redhat.com
>Subject: Re: [PATCH] vl: transform QemuOpts device to JSON syntax device
>
>Am 24.02.2022 um 07:06 hat Zhenzhong Duan geschrieben:
>> While there are mixed use of traditional -device option and JSON
>> syntax option, QEMU reports conflict, e.x:
>>
>> /usr/libexec/qemu-kvm -nodefaults \
>>   -device '{"driver":"virtio-scsi-
>pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}' \
>>   -device virtio-scsi-pci,id=3Dscsi1,bus=3Dpci.0
>>
>> It breaks with:
>>
>> qemu-kvm: -device
>> {"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"
>> }: PCI: slot 2 function 0 not available for virtio-scsi-pci, in use by
>> virtio-scsi-pci
>>
>> But if we reformat first -device same as the second, so only same kind
>> of option for all the devices, it succeeds, vice versa. e.x:
>>
>> /usr/libexec/qemu-kvm -nodefaults \
>>   -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D02.0 \
>>   -device virtio-scsi-pci,id=3Dscsi1,bus=3Dpci.0
>>
>> Succeed!
>>
>> Because both kind of options are inserted into their own list and
>> break the order in QEMU command line during BDF auto assign. Fix it by
>> transform QemuOpts into JSON syntax and insert in JSON device list, so
>> the order in QEMU command line kept.
>>
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>
>This patch is incorrect and breaks several cases, which are the reason why=
 the
>QemuOpts path hasn't been changed yet.
>
>For example, after this patch, help doesn't work any more:
>
>$ build/qemu-system-x86_64 -device help
>qemu-system-x86_64: -device help: 'help' is not a valid device model name
>
>Any non-string property doesn't work any more in non-JSON syntax:
>
>$ $ build/qemu-system-x86_64 -blockdev null-co,node-name=3Ddisk -device
>virtio-blk,drive=3Ddisk,physical_block_size=3D4096
>qemu-system-x86_64: -device virtio-blk,drive=3Ddisk,physical_block_size=3D=
4096:
>Parameter 'physical_block_size' expects uint64
>
>There may be more cases that are broken with this patch.

Ah, yes. Thanks for point out. I should have learned more before writing th=
is patch. Sorry for the noise. And we will try the libvirt maintainer sugge=
sted way on this issue.

Regards
Zhenzhong

