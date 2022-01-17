Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E52490346
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:58:27 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9MuI-00086C-Ct
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:58:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1n9Moh-0006aJ-12; Mon, 17 Jan 2022 02:52:39 -0500
Received: from esa17.fujitsucc.c3s2.iphmx.com ([216.71.158.34]:27963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1n9Moe-0005zk-HN; Mon, 17 Jan 2022 02:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1642405956; x=1673941956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AA9PW0QmPr/JuhvfxAKisaraP/keol8ln3/NxD3KqZc=;
 b=j8bvI/0QuKdCFAlQF9VLeHdpaxdoY7eBvVeqZgZelpgJcF/Jn1JdFiR2
 QOurty79WXJPIQicGtTIRrqsIHj9krdF06EoMC/hEMsqqr9D5pBdGBTVf
 +jYpgx+mOYOnE3k5EPxAQDEiXuk3bjEqN4ibYEb0tZ3K55EiLFft2ieNz
 qb8DUvsdPPTXhGMDMVFhwyKlLIEJqHl4hDereZ+6Q6MMwSOZhSaS1H8pe
 7BSx3M/XltCKjvBsReHA8RQ1xeVMDjzSptBObphPavMz6NzniHiqnhd9L
 vBd0bUA0vX4C9jSXHLxAJLDfroB/ukSR5lxAVAmB1nXjXJWWWnN3TCf53 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="47735934"
X-IronPort-AV: E=Sophos;i="5.88,295,1635174000"; d="scan'208";a="47735934"
Received: from mail-os0jpn01lp2107.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.107])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 16:52:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+0TajRg2uHvGEV8rGSFG+oYAC6el6dJRUMmpAa2mKsmU04rS/dz9X5IoyUo04QxOkbDmZk9AwukwNWc20yhI7MHWZuq8kwFk38yMowQEMeRQSof7d7posebcNxLiF2lVLmcNoKNJsjyE6m34PrWFkcqkFjOe/qLUtgHbsWEBxiS5nPt88x2vvV2ElcasQR2XyXcKD+xlenwUGBuNxQkcgG6C/DRM3yvO3ahtc6+FgDYSmRTx7o5RRR4PGTPA27crKMZ2VoEytQKfmlBgSobwpahMvc5vJNYJFmadb1VCrTB63RBBrfLxUpmAYKDJf8xMxruO7sksWs1i5PuOcoBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEb/XDMv0eIHNd6hxkuCC+H0CSOsn1kPfGbwBTRX+0c=;
 b=K1ByB6Ki1luz6q3fMphEaR6zEAc41CCyLam6jkb1YnAzdJrdKDUNMnU4ao+EEJ+AS17nrW3TdWLElPkLnVQ7+3Nv3n5iasBf6aqAjnnkZC0e+PSMtcqvlaEM2STfBYEodUeC7qBfkHEBPPQJDIwjnGosNTw0xxB+LL2PoxgNnqPWAaPhg4qeeHH7c85lK8SDSg6lOu4uS6d37XH2Do5m+MZWA0OR1gEZuVTWmtYRoH/NAd9FqkH1nEYAkN57cIg4D/3VYTvs7OU7SalA95mh/LXvUW/y9/5uh3BulIv3xWUjs2okd38nlT0CSF56xcg3Q/Mxk2UOY8draiwiLo1kFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEb/XDMv0eIHNd6hxkuCC+H0CSOsn1kPfGbwBTRX+0c=;
 b=ittoq3/inw9h08o7WWdpKenprT/tL9uhHGL+6bDzVZ2MvUw22gDiJwzYZSVSqx9zDR90SsYVzor129FMvS3z7PeMMMNqNu10E3gSO527Ts4qy8vnwambKtVBc37eXGJLa9cwvRdaCqtc6l6TtPcDA/VwjJAimycK01G/taWbMvo=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TY2PR01MB3785.jpnprd01.prod.outlook.com (2603:1096:404:d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 07:52:12 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::fc9c:e17f:c48d:5d06]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::fc9c:e17f:c48d:5d06%5]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 07:52:12 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>
Subject: RE: [PATCH] hw/arm/virt: Default enable the virtualization
 option(VHE) on A64FX
Thread-Topic: [PATCH] hw/arm/virt: Default enable the virtualization
 option(VHE) on A64FX
Thread-Index: AQHYCRe1pZCYX3poo0e/8Mr6nGDOs6xiNBKAgASL/pA=
Date: Mon, 17 Jan 2022 07:52:12 +0000
Message-ID: <TYCPR01MB6160AB4FDF80D5E27D45BC7DE9579@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20220114072438.3085054-1-ishii.shuuichir@fujitsu.com>
 <20220114084549.5lkdhqushaxivpew@gator>
In-Reply-To: <20220114084549.5lkdhqushaxivpew@gator>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eb385af-127d-42e5-d052-08d9d98e4582
x-ms-traffictypediagnostic: TY2PR01MB3785:EE_
x-microsoft-antispam-prvs: <TY2PR01MB37857E4C1A7524B77E47E850E9579@TY2PR01MB3785.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I3v6i7KjFM6pn33rHbj+0gpSOwT68HqGZqBx41BLnbQ4MekLBrlq4e+KmifRj8gzZydvp4e1vTUkkdrExWf/N7A/pnc83kihToF46NTpzng1XuWsA9uaASwObRdXEYjoJbkuKzkh+k5ig3PuzSlQgfrcnYu8sQIomhLxU5BIXPEfhaY7551LsJUmzHX0pu6TnuTPt2F77FU2w5lp2rqUpH+zkt1eoe33lba7KpHF4ltSFCsHokDEwdLnRaGgw/p6XuqdBW6MQ/W8X2RGah1VpoYlRmBDWdzgrkCAHQUGinUSIIZhhtn5Ednb4pqLQwq/GWgKmRcqqXRhrn9U5cFx5b/YhWvwky54/ZuT1a5jTMuBVgIaFpfS4dlpl4sutCO78DfB6iD8VMExHu/IYdaDrRmIETAGfNpbRyS8wyVY9DKCC7XWsq0H0LG2DApT6CLzbqSKAcB+iVjZXIrT8GHeo8D+Ke40e3c0HB5TfWBuyFpoNL3aa21GzwBvM3CJVT5yZr2BRjM9TleHZjF2CZPwXhg86QThmU1vmuhTEGVghauo7zRfV+ykCMC8SZ92lauYftFi2w/VbGKE+9t5WN0FBOOSdQY/1I8GuxwhamFyEpU8QYvjcpSDR7FltsD17Hsg2wcspt0klsrEaovQJetHLEN/0wY3nTypRapxCtxcHRoCxpitI7xekCCBvs1IVbP+m3znH02rB5PtvbgoKxa0Ww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(8676002)(52536014)(8936002)(508600001)(6506007)(53546011)(9686003)(38070700005)(316002)(7696005)(86362001)(66446008)(64756008)(66556008)(66476007)(83380400001)(82960400001)(5660300002)(54906003)(33656002)(55016003)(26005)(186003)(76116006)(66946007)(4326008)(85182001)(6916009)(2906002)(122000001)(38100700002)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?S05HRStIOWtCNkh0OUlvcUN1aFRocmJ1OXVGRUN3QmQxMm1FVzU3UEw4?=
 =?iso-2022-jp?B?aW1tMkxyNjRsd3AzWEhyR3VSSklhZHJyWk5kYklyekVMeHpzSTl4cUIy?=
 =?iso-2022-jp?B?Y0ptWlVmNitHN0cxK1BMRTdvaU9NNDRIdlVLV1lhVHpveHJ4QlNyNUNY?=
 =?iso-2022-jp?B?SHVSOGplekNxY0tRaERMVVpXcjVBVkJ5K2FZQ2FYOW04NDVCZGl4RGtn?=
 =?iso-2022-jp?B?STE1M1RVNUd4U1A5US9RWk5PWVhPSi9HM1pnQUJXbEVIc2ZTbXNibWdu?=
 =?iso-2022-jp?B?SGxDeTBiNFFva09MVlV5ZkRPcy9rZE9nVm5KeU9pZXhUSTN3akF1aWNj?=
 =?iso-2022-jp?B?QzBzZk1aS1VadkkyYWNicFExdkMvZktYd0Y0UnZYak1IUWcvOXdXRFBZ?=
 =?iso-2022-jp?B?QkppaS9nYkRjSEJnTE82YkFEZG9lTkpDcEhlak1GWVgyNlFlVXpFRGxx?=
 =?iso-2022-jp?B?KzI1aGRoRTJqaVRpZ2Z5ajdXem5Cb2dIK2xrdUtqRmhWM2lFaVQrZGh0?=
 =?iso-2022-jp?B?S3dNeUxxTDBMNG14VndSaXNOcTVLSTJTNEt0K1NMaS9oc0NPN2lOY1pT?=
 =?iso-2022-jp?B?RVgyRU4xNXM1OVFUVFlMM0daamljRjJrRkFCWWNqWjZsbFdTbnhXajI3?=
 =?iso-2022-jp?B?eGFtRTlzdEpLVzQxSFJWbnB0dEJvN0I2ZVBFWVptNEk2V0tpWmJoWWI1?=
 =?iso-2022-jp?B?VmVPdTJKMWZBcVE4dUFJWUZ2ejd2ZkNEak9XQkF0bVU3citvWDNIbDZW?=
 =?iso-2022-jp?B?TUp6YS9lczd6bDB0aVE0OUgvVnd4K1hLZDAvY0ZHdVpBcWZKeE43di9x?=
 =?iso-2022-jp?B?elVYcVhxcHVNM3RUa2JYNDNHUU5nY0lCdTdwYVFVN09MRDl0QVNockhu?=
 =?iso-2022-jp?B?YjU5bGs1YXFLL3JPRkdWRUNqa1Z1Tkwyam5oMHUyK2RvS2ljaDVtamVP?=
 =?iso-2022-jp?B?Rm84SytWM3RhckZvL29lUk94TWlUQUJ0ZFZ4TzIzZmJYU2RjK1JmL2lI?=
 =?iso-2022-jp?B?R1I0bTNFYmthSWdtd1VoVUJ3N1ZJM0dSNHFRMGRlUWc1SEFFYlN0U3Ir?=
 =?iso-2022-jp?B?aUpsUm9IeHM5Y3FPWGVOYWhtbWcxaGdXdmt5bW1kd29MR1lXNHBYQlZT?=
 =?iso-2022-jp?B?VWNZdGc2T0Y4aCtubmpBTEpNbmtYVUJCVlpEaUFwb3lYQ1ZWQ0pVTi9x?=
 =?iso-2022-jp?B?NUF1elBrOHdPTkN1QjA3QjBJR2Q0OGdZVC8xeW1xMmhrR0JJYjNYNDBN?=
 =?iso-2022-jp?B?M08yR0FQYkxjYTR0Ylc3OGk4cTJORmdtVTJPQ0hvNUZqbk90N1ZmTXh1?=
 =?iso-2022-jp?B?YkNNdnI2SHJDSm5UNTE5cHd2MHB0dGhyRzFoc05hVjEvTGJ4dW95QXlL?=
 =?iso-2022-jp?B?UHBxYWtGZ0dEcmVqdzdQeUhSZFA2QmNCSGhTT0xOWTcxVkY0Y2hMNkUz?=
 =?iso-2022-jp?B?a29zKzJOZTBuUmFoNGRtbEF2d3NVMFFjbWFuTENUbktva1dIcy95MnZB?=
 =?iso-2022-jp?B?TXF0Z0dPTHEwczVGMjExeEU0dmFiLzhoeEhabk85WDQ4VWVleExxeTMr?=
 =?iso-2022-jp?B?b1lWUVRnV1pqWTUzS3NFRUg0K3lqOEEva2p4QThSQ0hCUTY4UnJoa3ZB?=
 =?iso-2022-jp?B?eWhadTM2dk1icWUrMU9qNG5meWNqWTArMU80Q2IwbVk5VEtuZTZaU0tG?=
 =?iso-2022-jp?B?MzdJcGJNSU1nT0txU24rR3FDcXNrVG9IN2E0STUrUFpDbVJWdHRqY0VN?=
 =?iso-2022-jp?B?ZGV4bWMwd2RlRmJuVVdoVHRibUJzMk9OT25GTlJTb1EzVERablhjMkZM?=
 =?iso-2022-jp?B?SXZ2dU1NY3dFZ1dVTno4cyt2NkRrTFhKN2JnRHl5cHowTnJuNmloQ3dL?=
 =?iso-2022-jp?B?Wm5MTmFIY01nYzZZeG13UCtOTUZkRlF3c25WRGk2cm0vUjMrR0ppWmpD?=
 =?iso-2022-jp?B?bDhORmVyL1ArRlNrK25XbHphQ1BJWS95S3RxWWRvWXNYR3BvbzJnY2kz?=
 =?iso-2022-jp?B?cmU4eC9pdDV1SkdYR1RYY2FKdURuWHBTWDdiZ1NRZHVsUUYwMzBrS1k1?=
 =?iso-2022-jp?B?dDhoODlGK0VBM3gzWEtNc3dyMkFXSnUwTGxIVjFlalA4bXNQUFRuZlRZ?=
 =?iso-2022-jp?B?Q1dHam1IellZLzQ5S0t6LzhBRjc5Z0RjQWZFOTg2MmprMkszVEo5QmJj?=
 =?iso-2022-jp?B?NGpuSzZJU0RlMk9XTnN5UmhHcWRZL3ZnUnY1U2NvK3YxMXZWamRZUVpB?=
 =?iso-2022-jp?B?d2NhdnU4M2w0KzF1a2daSE1tNi8yeGRTV2FOUWFDYktveUZqQVowK3Z6?=
 =?iso-2022-jp?B?WVI0RkRaOTJaWHFBVk9XT1NZRlFYRysxTnVsVCtGcHpSTmkxeTY4NWha?=
 =?iso-2022-jp?B?cXdNeXFKWkF2cGhaTzFiUmlVUitFZjk0elBvL2RxbHFmeG1wNFpKeGlz?=
 =?iso-2022-jp?B?T08vaktnPT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb385af-127d-42e5-d052-08d9d98e4582
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 07:52:12.3951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sk3ohi3GaTVO2VqTrteGv45YfF97I1nvTiNOwORUnchCdmJ+O+8W1i3zwq5O3H61dOkJrEcUrNS+pL+8kETT3mpvJAu5yNhLfJ3gNkbejgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3785
Received-SPF: pass client-ip=216.71.158.34;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa17.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> a64fx isn't the only CPU type the virt machine type supports which has
> EL2 support. In fact, all the CPU types supported by mach-virt do, unless
> KVM is enabled. So, while I understand the sentiment of this patch, it
> doesn't fit the current model. And, since we don't want to start
> accumulating hacks like this one in mach-virt, then the options are eithe=
r
> a) push the problem up the stack to whatever constructs the QEMU command
> line or b) consider/propose a different machine type.

Hi, Andrew,
Thank you for your comments.
Also, thank you for the suggested revisions.
We would like to review how to fix this again.

Best regards,
Shuuichirou.

> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Friday, January 14, 2022 5:46 PM
> To: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>
> Cc: peter.maydell@linaro.org; mst@redhat.com; richard.henderson@linaro.or=
g;
> f4bug@amsat.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH] hw/arm/virt: Default enable the virtualization optio=
n(VHE)
> on A64FX
>=20
> On Fri, Jan 14, 2022 at 04:24:37PM +0900, Shuuichirou Ishii wrote:
> > At A64FX specification, VHE is enabled by default, so the
> > virtualization option should be enabled when -cpu a64fx is specified.
> >
> > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > ---
> >  hw/arm/virt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c index
> > b45b52c90e..56acf5cc7e 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1932,6 +1932,12 @@ static void machvirt_init(MachineState *machine)
> >      firmware_loaded =3D virt_firmware_init(vms, sysmem,
> >                                           secure_sysmem ?: sysmem);
> >
> > +    /* A64FX proceesor is supported the ARMv8.1-VHE */
> > +    if (!vms->virt &&
> > +            !strncmp(machine->cpu_type,
> ARM_CPU_TYPE_NAME("a64fx"), 13)) {
> > +        vms->virt =3D true;
> > +    }
> > +
> >      /* If we have an EL3 boot ROM then the assumption is that it will
> >       * implement PSCI itself, so disable QEMU's internal implementatio=
n
> >       * so it doesn't get in the way. Instead of starting secondary
> > --
> > 2.27.0
> >
>=20
> a64fx isn't the only CPU type the virt machine type supports which has
> EL2 support. In fact, all the CPU types supported by mach-virt do, unless
> KVM is enabled. So, while I understand the sentiment of this patch, it
> doesn't fit the current model. And, since we don't want to start
> accumulating hacks like this one in mach-virt, then the options are eithe=
r
> a) push the problem up the stack to whatever constructs the QEMU command
> line or b) consider/propose a different machine type.
>=20
> Thanks,
> drew


