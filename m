Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20616B6CBB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 01:02:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbVdm-0006YT-2h; Sun, 12 Mar 2023 20:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbVdk-0006Xn-6A; Sun, 12 Mar 2023 20:02:12 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbVdi-0006Ib-H9; Sun, 12 Mar 2023 20:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678665730; x=1710201730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2Mm/rWBpW6r3wiMSPVZnfkeDWqrJhMAV9Yi8uyfxVCs=;
 b=IQ0JpoY1C2uzCmDidJdK4yE+ZAjIOxNCFgOxj+y0nzXCZ1RjfRoMz0Qc
 6VtddEL0Ffkz5xUHh25vCRnIkQ1byXsyvXFp5pYlkVgt4QCnSNWKdHqJc
 KTdEAPV2qemJ4dAKD9+SEvA8ej9kkMmKmpiJjG3SYmsPqppZkRo7Y9c3F
 JfXikJTE7BCkv95iAhBb3LUF1rj85t6G8oh/81p61yS/6/ddyQVhiqIse
 kK1XUI0r9nAMvX0/lMgE5cMFjuX9uQvsXeCk90W/JvMUvGlsHvy+/rfBC
 /B3mn7hzf6Ethr3H3pNmmZHG8pYd2ayOeQFhAsz1smzFYyxWL0PEUX9SM A==;
X-IronPort-AV: E=Sophos;i="5.98,254,1673884800"; d="scan'208";a="223742066"
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2023 08:02:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJiHhwoHRBVDIy3+l06CgxeIu2s8V4CvUwu1QsO7sBH+YhICUZDS5m4z1K6A7c0H5Kadf4j/cfZ1mRNl5a+1vY64KUy2/PUpPmXDAyUKYZgu9ct14H4+Zw/2BnYGX4lptV4eE05IXnLvNyuEakS6bofXNDfJIn8wZzaZQ6M2Oz/6LpFX5KO5jq2Dy+B5OgLLKu43qlFaWZXbI+YszIJBNa9HhjRyhwoc7dtq7s7wgIn1/FHwn5uGnpKVLIIuQmslH1L8l+WP9RLTLi+hHqJZWMBboAkGeYK8xaKRAYPWviK7Wf7NoNmCzeKYGjiPQcOPzKhdYpibxE3KhClCU9JJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Mm/rWBpW6r3wiMSPVZnfkeDWqrJhMAV9Yi8uyfxVCs=;
 b=LGHZlB6k7C1qiQkEasdSO0PvxpJkzN/rrpWgP5KK3z6MlKfYay+h9bpguwZm2/X5uP/clxnY1322YdEPvo7BIBGpBKpHnpmX9R78QU7wMJqrEYKw/u2qml9KNbKnheyWngNhwbmQjMs4rJQbSOTdxf9/0+++de97KHbA2GBrbD2FpMgLbiYZKlxak19oqRX1Ue9U+qjax4MhQx6J7BQwiw5852/Rw7LvgWYOwNIbvIjHWdnqJ/xKPEcx9HHIyeMxAJkv+0U2irm8yUwTL/BSxkfy9am8Ua37/vIPrLrY3QEN1PUQHkvRhVb3Dw8QoGtm+FZXVgxSZaaha6yPWdsr+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Mm/rWBpW6r3wiMSPVZnfkeDWqrJhMAV9Yi8uyfxVCs=;
 b=gWDDlIWGrLgQ3NSD90JgggEsSBPZYORzXr9jc8TYO2J7JKsl7ofYb3UGYVmTbn31DKYJGmiLuyOIOPeY97qEiox0q3eBKQ0k102WsQ4kkQDKxym+J3TyF3VOs/DQRN8v5kph3iuX/3+twQFF2knh9QBCME7JEQx9GhCMp2ZRtwY=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by CH0PR04MB8083.namprd04.prod.outlook.com (2603:10b6:610:fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 00:02:05 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 00:02:05 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "eesposit@redhat.com"
 <eesposit@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 5/6] hmp: convert handle_hmp_command() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Topic: [PATCH v2 5/6] hmp: convert handle_hmp_command() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Index: AQHZUrrfhwt9Eqks10W9suQH2goUlq732KAA
Date: Mon, 13 Mar 2023 00:02:05 +0000
Message-ID: <49e802339658113367ca70e6cf67dc508b4d9ff8.camel@wdc.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
 <20230309190855.414275-6-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-6-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|CH0PR04MB8083:EE_
x-ms-office365-filtering-correlation-id: 63216f19-8e23-4988-d23a-08db23562e5e
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vmKXUBmlHOeGRG9rGHHGsPxL9uNz5T1gtPQNA3RklDek6kbOBr8zmIYQMW1z55XikkgIVx54M/e12kTRsI3oZUJV2thnVNk78VW1oFo59uSVknVi0beo9L+H10w2sZMHn/rcBkkE8HkCbptfc6A6bES2nvujH2yiw43xcBRuSP6yxYmc1PFpEopPc34Zxeq1kNqeVZ6tv4sByxMUa4mwI8wws/aqQzWrrsHxhhxaCvILcLbJAQiHs3afehpDrhqfv33SFY2O0V1Rs0fJsotpbqI7yUluUXcul4Ksdg0+Bw9/wmQxLECy/KkY9iZlclG6BW8x5sIm5IOqpg3FSOoDttLtg4la3v55g0WI4wCjAM51ZihpHvwaLcgWouIH7VHAJWSklBwIh4xHTA//PlQMpuBdj7dY2Wg7I2vrK0+oF8PAp/rZnIvQujDKmolhAdBMsedvZ9QOL4rlRa74fKbDbAXzBLFsj1NRAqfIB0W8Th9chxtLC+QskUZSJceAkBy3S7QlrshbqjByrXVbDTkHAjdhcjVp0v45gyrLuscixm5z/KpCXR3RzAITyWBv5cPFCc+/v7Q2pfCWSRZTUfCu+5Vbd8csilV2XipB3podP/zE6hYr8B2WuSQ3VBJm3e+nQjPswIarNcAYv9yVXg9Dme+rZWbNRNkV2vKzUhOU0VA+yCe9HbnGlpXxX5TeK99geotENH0AAfTlcseW3P4DQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199018)(2906002)(82960400001)(122000001)(83380400001)(36756003)(44832011)(5660300002)(7416002)(64756008)(66476007)(66556008)(66946007)(76116006)(8676002)(8936002)(38070700005)(4326008)(41300700001)(91956017)(38100700002)(86362001)(54906003)(316002)(110136005)(186003)(66446008)(478600001)(2616005)(6512007)(6506007)(71200400001)(26005)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFJLL3pLbGZpSFhadGNsMlpDUU5FY05SUUNKTDNEMjVEMGc0VzJsbWZyeUtH?=
 =?utf-8?B?WkJoUXJqZW94QUlXcXo4enROM0l4SXRORzRoQlFrUnRlajBZWVo5Qm1KR2RN?=
 =?utf-8?B?U3hLS1BrcFArWkFvaFpINDVSVzZ5T1FMRE1WZjViMml0SC9ZSGFIYTlXSkZF?=
 =?utf-8?B?Sy9GYUlINlBwb3ZPSkwyRWRUYVlnNFc3YVgrRkdoaG1NUDJtaGhBZEhqdElU?=
 =?utf-8?B?bm04Y05iUW92NWQrUm9iVlZXOGlBb1poTndackFKWW5JL3hUMFNuQU40N3RM?=
 =?utf-8?B?dzQzTVlWbFNGYVB2SkxoTU5Ka1ArV0wxT0RTZXdKVjlZV3N5M2NYNnRaTjFI?=
 =?utf-8?B?NmhuSkFvWTluWEdhbFBWRWZBSzZsK09iTlk2R0VFbkdIRWZaSVdzT3JpYkJp?=
 =?utf-8?B?NUZ2dkpNeXlHM3RwNm5vN0hHMUVCYnNobXlhRlFOUFJqU0ZtZmJXVmRUZ1ow?=
 =?utf-8?B?WWladUduSlcxSGVSRnQ4OWoyZU5MK3JWYUR2NTZ5aFhKaTNPN054dEtzM2Na?=
 =?utf-8?B?aWJpdzRyZWhXM0tReFFjWW5xak1WWWc4b0l2UVQydE5WQUhyRi9lbVJKSzVl?=
 =?utf-8?B?MndrRnRrWWFXY0c5Ui9ocWtIak1jTit3ekI4M2hsWllHaHFBdUtXZlV2OTBi?=
 =?utf-8?B?ZXg4YjdFZCthZExpeExvZVI3SXN3c2p3aXZvK1JISmdETWx4RUNMS29EeFdp?=
 =?utf-8?B?Uy8wVHU4WUtZVTJ0OXRneERIR3R4N0ZacjVhYUx2MHVvKzFlRGVCNy9Jbmhr?=
 =?utf-8?B?RGtrOXdvVGFHTFFNR2dqdTEyaTl1SENlQ21zQTllN21yRVhURjdkREl5Mlpx?=
 =?utf-8?B?bHN3OGRiMUlxVEJSRVpuU0xqNzJUOWpTSnB4YWRPVXA1c2U3QjFUajQ0dmVS?=
 =?utf-8?B?WHNLbWY4dUxwL0QzWnBlMkxvZUtHMXF4U0g2cUIrNWNBb0ZIZVNJclM2b2JW?=
 =?utf-8?B?dnMzUzh4MkdjZ0tjUm5OMGk2U2lsT3N5dW9UOHowcXR2VXlncUxuN3BHbkFC?=
 =?utf-8?B?Z2lpL3ExeDBwQW9rREQ5dzArZzJ5SENBbFlUeG9zdnVUVXFMcDBnOXJzRmZC?=
 =?utf-8?B?MFh1akdjSW5ndXZBWHZXRWtOM3ZFOWRrZEtQYzdNK2JKSUNZWnBZekMrQlhN?=
 =?utf-8?B?YnFER2I1REZ6TE9NMEREU0VFd0F1L1MxTUV2ZXBDdENSYnJmaTFrTmVPeHox?=
 =?utf-8?B?YU1SS0ZDbFJGRnpuMWtYS2RQMngxWmtrY0IyeU9yN2NjcE5qRTRQWjRmWFh5?=
 =?utf-8?B?TkRoVjJRc0czV1FDYlZMekN2ZXp0aTJOdFdMVFJVNVQ2UWxmTVJWOElHaTdB?=
 =?utf-8?B?VFM3YnZJd1F2bDBYVEV5dU01WVdrT1I3eXFXd2ZPaWNLYmJ0NjZiZDNqTDdT?=
 =?utf-8?B?UlcyT21TZWFiQ05lY09uOVVYL3h1bEdKV3hQOUk4TGJTRHVqWHFNQldINUNr?=
 =?utf-8?B?MzFjbmFUVVNBOE90U1VyZUxVMklWdjErU0QvRWpQUDlOMEtYQUY2SDlaV3cr?=
 =?utf-8?B?bVFrblNqWWc4Rk8rNnRKT2NYNUF4b3dWRTlMNGhpNlMxeGtLUHlWOThiK1d1?=
 =?utf-8?B?d1FNWWx4NW93NHBXbFlpZWltUHA3R1VIL3BRRTdaeHJzdFN5bjBRWFppUVFZ?=
 =?utf-8?B?dUVvOXhPQlh0TSsrWlpEajZzU1JWRUppYmFlTFJJRStqOTFXNzZjOERVZnBU?=
 =?utf-8?B?VFljYVByL2l5N0lUUjgwSlJYSWR1WUlEMnEveDVKTHBWZE04Z0ZmZmpnVWpy?=
 =?utf-8?B?WEhySlF2eS9lYUdjTzl0TWVLbEJDOWw5Z2dHV3BVcDZGYnAwVDRUV0VrN1hv?=
 =?utf-8?B?dGNuQ29PMERzbGVtQmFaRVJqZ2IvT21naG4xaWl4cVFGTTVqRjlUZkhHanha?=
 =?utf-8?B?N0Z4RUd0WXZrbC9wN2hzR1RoQ0lZZEF4UXJtakRlenRYb2twT3lBZjFBaDdm?=
 =?utf-8?B?M0hHa1lwOGVMTmsvbGtRRmtRVnlQSUM5dHE2Um85K3dlaURIR2hsc3BkL0Vk?=
 =?utf-8?B?d05tYy9NbGhheWdhZk5PS3h1RzNnNVNON0p6c1ZSM2ZaT0lTcHBnVG1naXdk?=
 =?utf-8?B?dTBWdlZDQXVDZG9idDNFTG53VUxVMFFQRnZ3TXFtUkFEUmxpenozODUyTlQ2?=
 =?utf-8?B?ZXhDM1ZVRzZzakFoWEtLL09WTjhKcEFGV1BxTys5V0pEMy9iRVhYWjVRZzNt?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E487644CEE4C1C43971F04D3638F78D3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rk3/mu+3b1qxs/h4+3cJ3DSr0CDrhkI48ZcigXEs+l7US6NwrxrVydAhKBbAJLRcppFFvdjkSxFEWMl6KMCJdJbAKEqezO1xVOFzwMae8rvKBTlwRfbPdRBXDvOwOn6OKc7W/VkQ4gpuAKJmVcXb3UJ8OgFIXROhQyDu98OSNX5AQr1+udtVZNTwQfokocyg26ne3MqZpBE7DocsJ1wRHZzc/xC6C5CdHViWzSgTK4jKjHqq77FQ2A+h7e/cR1SJ1C97qJ6M4LOuDMd9HcBeCV3cvz8NC0FiwgSSlZ4tMLg+K5qFzhoEhuqQcmR/ioo3JjeO4CcYe/FzF5DFTOjonDY6zPPvKd6AwVhWL43GMC/ZEC6uOQCyDQwz/2SKFHWXBkOCAfpqJtzzveLXonk8HiMFuHgylBFPOjB+nCNu7mUneanDdPYxMLKpFFIbEVUTbtofU3HkTTBEhBF2XllP/uxmKFFdkMcHsf5Sj36CaFZVw3PdcnKn3LT9oc1rR3ZNRTsl74ltSkYJMRI2xO71wdrhfE5Qg/YdENKcZEIqz0OW9f7ZhzJ1yHHPa5UXLimVGIs6FyuEdIJMip2vVyYqnYWtAHwyJKBuE8S+/hI8m5j25QCoQjf9XBdC6GP2GDGko/T8fmD7XgGfHzxlcm8uTU3h1PxiiVGE2HIDJALRkD0NFRkyyzsbUZBtQBsYzLRHmOoSPUEuZVlBRGqrVyF2Jw1E/JBNtLzRb3MpQIykdQ+Dw6vHwfDjMbZK43EYj2uhutQTpBKgbjy90K2meyJ9Ll59rbzd/orbewdhLSctrpu1EzgEfrBARFQ9BBWK73Uj4HxnbZp1d7WSVArDTfv40F8GDvLpmyKDsoW4E0b+jNw=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63216f19-8e23-4988-d23a-08db23562e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 00:02:05.4870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHHxTBW0GE5cDwinI4s+5C4CZdszvet/83uqBaAkP+EW/+HErBgdDJOf1tDG7jwkLhhsfJaGhQenfUME2Jztbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8083
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=42906d642=wilfred.mallawa@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gVGh1LCAyMDIzLTAzLTA5IGF0IDE0OjA4IC0wNTAwLCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6
DQo+IFRoZSBITVAgbW9uaXRvciBydW5zIGluIHRoZSBtYWluIGxvb3AgdGhyZWFkLiBDYWxsaW5n
DQo+IEFJT19XQUlUX1dISUxFKHFlbXVfZ2V0X2Fpb19jb250ZXh0KCksIC4uLikgZnJvbSB0aGUg
bWFpbiBsb29wIHRocmVhZA0KPiBpcw0KPiBlcXVpdmFsZW50IHRvIEFJT19XQUlUX1dISUxFX1VO
TE9DS0VEKE5VTEwsIC4uLikgYmVjYXVzZSBuZWl0aGVyDQo+IHVubG9ja3MNCj4gdGhlIEFpb0Nv
bnRleHQgYW5kIHRoZSBsYXR0ZXIncyBhc3NlcnRpb24gdGhhdCB3ZSdyZSBpbiB0aGUgbWFpbiBs
b29wDQo+IHN1Y2NlZWRzLg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gVGVzdGVkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFJldmlld2VkLWJ5OiBNYXJrdXMgQXJtYnJ1c3Rl
ciA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBLZXZpbiBXb2xmIDxrd29sZkBy
ZWRoYXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJl
ZGhhdC5jb20+DQo+IC0tLQ0KPiDCoG1vbml0b3IvaG1wLmMgfCAyICstDQo+IMKgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQpSZXZpZXdlZC1ieTogV2lsZnJl
ZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4NCj4gDQo+IGRpZmYgLS1naXQgYS9t
b25pdG9yL2htcC5jIGIvbW9uaXRvci9obXAuYw0KPiBpbmRleCBmZWU0MTAzNjJmLi41Y2FiNTZk
MzU1IDEwMDY0NA0KPiAtLS0gYS9tb25pdG9yL2htcC5jDQo+ICsrKyBiL21vbml0b3IvaG1wLmMN
Cj4gQEAgLTExNjcsNyArMTE2Nyw3IEBAIHZvaWQgaGFuZGxlX2htcF9jb21tYW5kKE1vbml0b3JI
TVAgKm1vbiwgY29uc3QNCj4gY2hhciAqY21kbGluZSkNCj4gwqDCoMKgwqDCoMKgwqDCoCBDb3Jv
dXRpbmUgKmNvID0gcWVtdV9jb3JvdXRpbmVfY3JlYXRlKGhhbmRsZV9obXBfY29tbWFuZF9jbywN
Cj4gJmRhdGEpOw0KPiDCoMKgwqDCoMKgwqDCoMKgIG1vbml0b3Jfc2V0X2N1cihjbywgJm1vbi0+
Y29tbW9uKTsNCj4gwqDCoMKgwqDCoMKgwqDCoCBhaW9fY29fZW50ZXIocWVtdV9nZXRfYWlvX2Nv
bnRleHQoKSwgY28pOw0KPiAtwqDCoMKgwqDCoMKgwqAgQUlPX1dBSVRfV0hJTEUocWVtdV9nZXRf
YWlvX2NvbnRleHQoKSwgIWRhdGEuZG9uZSk7DQo+ICvCoMKgwqDCoMKgwqDCoCBBSU9fV0FJVF9X
SElMRV9VTkxPQ0tFRChOVUxMLCAhZGF0YS5kb25lKTsNCj4gwqDCoMKgwqAgfQ0KPiDCoA0KPiDC
oMKgwqDCoCBxb2JqZWN0X3VucmVmKHFkaWN0KTsNCg0K

