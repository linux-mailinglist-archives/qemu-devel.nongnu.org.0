Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D76B6CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 01:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbVch-0005rE-7P; Sun, 12 Mar 2023 20:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbVcf-0005ps-5V; Sun, 12 Mar 2023 20:01:05 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=42906d642=wilfred.mallawa@wdc.com>)
 id 1pbVcc-00069u-WF; Sun, 12 Mar 2023 20:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678665662; x=1710201662;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VB/FfN0EtG8EzjkeF7gU3RQ3OiXlF+6sCx5oZWhBAz8=;
 b=P4ShME/zMsVat5nPviXdzvOV1TR3TgqevObaewf7U76/xIPlOAJYU/zE
 FyvyRYHqnKz/w/Um/LTe2kEAKtNAqxdlEVHG0IYMLTJBKMRFmn5YL2hKT
 oxGnERwDd1gcUA+IhAWR63drgWXspYFd7JkCRKihVt/IW7UgyxhxXEQYS
 0kq/VbOAIrWBT41xJ5foZbcnqpi5LZb0FGwPFEKsgrP1PUZ+S4OnKu3xc
 NA8J/j4NiK2Z721S7zVIAMD81bOX8pN+hIaVP5AVAtjkmWbc4B+zQLy52
 6UZadKwQLJqjwhBlt79cssIoeHC9gicG6+LwDehV14p0mbLjEJX5ALNaX Q==;
X-IronPort-AV: E=Sophos;i="5.98,254,1673884800"; d="scan'208";a="223741880"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2023 08:00:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+timYJW8lLtriXf6nHNKsG/U8SJqRtTdnAg9RJnNrMGg02mK/+IdLM16JSDDLvh0Y4/3ggp0cjHWQRRceb7UeJ3YzNfxB9SgfRRIsP1GIRgSwdcZavdUEC470CXtyzKjcSpzXzRb5GhTe6ZvLTPBx1nwofprCRKoZ/Ri9m5LycJ8vfwlSyhVA+yHUP+wXBzyMFOtVeeXgcVWv6qzMgh3BswqjoodHGQBShmV34LVlUpNrtFsSWxtPDe/IGFGPshI9c2Dt5TtEnuCcfOgRzH0QlYSyxsiGa627ValK3itf8Ew7oIlejvZfqLx1UFtj99zym9/iznxPz5cz25tyZL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB/FfN0EtG8EzjkeF7gU3RQ3OiXlF+6sCx5oZWhBAz8=;
 b=ObIQvN8/QQsPum5X5UwtzW4aqqYKoSUl2/0eDAcRlymoDZTEyNP9J92K83cp64uI6YpFHIXCgd+uqslBWjLxkZ/2E8fwnRi0F1dWw7Tb8K7wdljIBy/gjxlitD0YVf0K3H+PMsthgP01r0ceBZFKtQaDf6fC4yVJTiTWfEeEdGMFABL0yTXjVRFruVVAxa/ctygWvM9SAfSFaiOF+1/ASWaz9uiaMMYkJN/SSbCI2Sw7Ym5TcvxjTRT4FlWSH9aHe/O0y5knbvAkDImui5ILxJuXKzqYmer64qsxF5EUQ9MDY1bYV76qqOBPIJMiUUD1SlbXgByBKoY/9VIOKASjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB/FfN0EtG8EzjkeF7gU3RQ3OiXlF+6sCx5oZWhBAz8=;
 b=GFefJwOF2TdQyz2MpDnoKlf7Nl82NAOIu7D9Hwe2e01c5sEWN8QqPHtD0NZ75O4+9Ip6PD6UYcvEPls9+dAY6HonI3jN87C+FTxRWScj5MvvHdgGrLzGPm6KK3NnoKWcw1ZZHF2IihRrkF3YnBB9tqygVQwJxUWSiUZl+/mAaf8=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BN0PR04MB7999.namprd04.prod.outlook.com (2603:10b6:408:15a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 00:00:20 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 00:00:20 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "eesposit@redhat.com"
 <eesposit@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 4/6] block: convert bdrv_drain_all_begin() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Topic: [PATCH v2 4/6] block: convert bdrv_drain_all_begin() to
 AIO_WAIT_WHILE_UNLOCKED()
Thread-Index: AQHZUrrZnZgCqskSN0S8lKpLcPthjq732COA
Date: Mon, 13 Mar 2023 00:00:20 +0000
Message-ID: <50c8103ed12dba6cec13fef7acf5b364930ef159.camel@wdc.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
 <20230309190855.414275-5-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-5-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BN0PR04MB7999:EE_
x-ms-office365-filtering-correlation-id: 415b01cd-81ef-49d5-65d3-08db2355efca
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6BvONz8a2MTyguBAabifaRPNx6Gi8ZbbSnde/Ur3bamFZ/D88J33Stnljez9iONPr0qXcoGA61Px5sYx7oEHVJij7DyhtiIAc6vziYQixaHVq9trxHQ7IG27QwsWEs/G8bbAaLyTbvZqI5XLg/xYzoxPTxf83MZqBgfAEVB/UOrCLp82jne8wtBEbjbWffkd81qyridhDRVmgMuBMqAj0RipBYQsTGct6GCnUqX2iTX+vh9+UmNu7GP2VCDksJus3Y/cIQqFtiZbFXSGrLuT7fFOGYTFeS6Uqvr7mHbZkj0uB9EeD73hpAtWtT8s7ZbmOlRq3HLCxBZZAfhZ6pXHYIBC36szOU713L+3JYzbXKMmSPcAe1j1LMkRA6pLdeXMNSYbzwFPu7obEVoQBHY2tyHxxbIlQZ+t9WETnTWVRXcbKaF6rq/8TnbFOs9iY11ppX7gJLX3qne7R+ckfGSKpuaI8vNuVQBCb8sb5b6u5d0uisH/j4PYtX8NGfKJ6xyre5uTKqWrFFq48Wu7NZW/UG1LX3pgkl7Bp7/fL7PatKuRLnIezaVtLECeukyNwZMMaBe18UQZPVJIk6a+y43YbgAr3bdMhN4tq92XX5gYZ2HJ0ZvB6LQU3Jf1jiXvBLzkH2U65zBjn2607K3ZSikj/6tIPxBG542gTknF63eGxLC4j+anFqSCWqrRUG0YqgjAq2gj7kGx52EUWLwRiDbnBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(36756003)(86362001)(186003)(41300700001)(26005)(6506007)(6512007)(5660300002)(7416002)(4326008)(2616005)(8936002)(316002)(71200400001)(110136005)(478600001)(54906003)(76116006)(8676002)(91956017)(66946007)(64756008)(66556008)(66476007)(6486002)(66446008)(122000001)(82960400001)(38100700002)(38070700005)(2906002)(44832011)(83380400001)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2c3WFJIdVNyMXlQWWVOdEYvbkpLL0RGWWhUUVJFTjgrNm9Ja0J1NHVWWXAx?=
 =?utf-8?B?M29jKzRlMk4xZ2xtOU40dC85OC84TUtGUUlSdVQ4cXJJM2E1MU91TkVVVjJO?=
 =?utf-8?B?RFJONHl5RDJxKzhWSGliWEZKVUUzWWtaL0FhV3U0NnRQT2xRdC81VzY3dUx3?=
 =?utf-8?B?QytrMFVNQzJoZGU5OC9lamlnbWpEQWk5SE8vT1JKYndraU5hN2pMWkpUY3RO?=
 =?utf-8?B?aUZIVmtqTHczSEUzR0tMeU8wYUdCbGFMcVQ3N2ZzVEpIcVRjVFdhM2o0Z2xX?=
 =?utf-8?B?RysyWWdXZWxjMmRYTFVyc1VDNHozQ0NCclNRaUpKVkcyYnozeEpudHdUTlJu?=
 =?utf-8?B?SVd5VmJxN3NONGduMm9naDZpTlE0azFiRjRuTk81djc0bktUN3ZQMXJER3R2?=
 =?utf-8?B?Wk5sbyttcFBrRXFTM2lQWTdzMWJKNU56WVFiNXZ4T3M0ZXpDQzArMkJSaUsw?=
 =?utf-8?B?d1VEK2daak8ybkVKdE9zMnk4SU1Wdk1Ccjh4OFhWMWNIbTNKY1pLaUdJYzAw?=
 =?utf-8?B?eEdKRzZOZ2UzTlhMOTBmY2s4Z1FnS2plR3ZBd0lCenhOSWc1U2dBWEJKYnpp?=
 =?utf-8?B?ZGI4VHpZTE5TcnBnVk9rejRoOU50Uk9WYkp5b2t3MVlaOE1ndTVXRjlmanY4?=
 =?utf-8?B?RFRvTWY3N1N1YTd0eWVpTklJYXlCNWc0cGVoY0hoeklrQ2Rjck1UeXhqazBI?=
 =?utf-8?B?Tk05UmtaTW1GTFJhTy8zTWNRSlE3azdqZUhmRzlOZ3d1QUZSUnF0b2pHV3NE?=
 =?utf-8?B?VGhzUWUvQm1vVTdVajVhTW9hdEpIci85cURnSjh1cDNlYWZSc2Y3Z1FPRG1q?=
 =?utf-8?B?eGRhNi9iSTR4VTJWRUZSRFZYTm50NkcwRHZKVlFpR0w1Q1FRUkxBQ2xhWGcy?=
 =?utf-8?B?TTBYNGI0U2c0Z2J3ZUdnemxROCtCNlNUSm10MzFoMHIwMlJ6RzEzOElIQ2VK?=
 =?utf-8?B?MUs4VDBuc2RPVk5mb3U1ZFRUczRib2MybWFNcTdHNFhCM2FKNnl2UHE2ZUZx?=
 =?utf-8?B?MFBzZWdmTlpqMnRQQi9YK0VlTU9WcEdtUjRUM2c0dEpNQUVtYnczV1Q5NjdU?=
 =?utf-8?B?M0EyM3RjaVhSMTNuQkRPRiswNHl3ZDZ5VVFXUnJ1Z2ovZEx0dmZPc0ZmNmEr?=
 =?utf-8?B?K1c1YlRnUW9yQ1I4RjQ4WVFvc1ZLZmpVVGNzMmlXMlBTYzNvTWFOdGQ4UFNF?=
 =?utf-8?B?Umc3Ti9PWnptSDF5VWVVc3luYWZWcDIwWkJ3UTJoWXExVlhzUjJpUU9neEI0?=
 =?utf-8?B?UjBaUDRrV2ZwSDRIUVdvTHczZkFFQjYvOHUzaFlYZjcrZnFGeFZ3ZmhYMW96?=
 =?utf-8?B?Ry9WM0thcjV0R1h2bGxrVHMxVVU3NW1TUkFCS0pkamNiS0FVL1QreG1HMTUz?=
 =?utf-8?B?YWRYN1MwbjdwZERFUG9wT3R4OWUxa1JqcmlXN2REeXpSbjh0cXZqSjQyM1Ey?=
 =?utf-8?B?TjZYTnl6QnZqVEQrQlY5Wk56dUVCRG1lekdaUWtDNXZjUlllbi9pTWJ5cHJy?=
 =?utf-8?B?MmE0bSthNTFwd2hGcmFIK21mRHU5SVZPdDBFN010Qkkyd1ExZVRCekMyVDZI?=
 =?utf-8?B?S1lYbDlQYTVZYmlRenBMeWJ5ZWZVNGlQZFk3UmsrZFRtelIzaVd6b0wvd3Bh?=
 =?utf-8?B?ZlRjSFA0bHo3MmhFNW5ZNDhWSGQwMVBmWHdGdWVuOGRKVXUrM04wK3FISGN3?=
 =?utf-8?B?NDBjeW94UjJ4Nzk3aUs4Y0s3bGlUWU5BdTNZcHE2eHJ2MDhNRTIrUlRZS1N0?=
 =?utf-8?B?d1B0VjdRejl4Zmk5K0FkOVVONDRoNlZEemZ2VlhhNG1BRkkvTnJXOHRJSnJw?=
 =?utf-8?B?SjdxZUxITVo5VGRac0lmMzZsbWlGTzU0OWRoZEQ5d2J3ZHJKdG5rTEU0R0lS?=
 =?utf-8?B?SFV0ZWRBbXYxdHk3TjNnZFpiT2JPUU0ySkJrd09Oai9COEk3QUhKK1dySFhC?=
 =?utf-8?B?VERhelFVWXJsQnc0d2VKNzRSeUVtdmY5K0twaHYvOTY2NkwyeXFyTkdRL25r?=
 =?utf-8?B?WWRiSk1Ba09qRXNvMzZXQjVCZE1NandZaEdVVUZUeE1YTFBaZkV0c2J4dGVn?=
 =?utf-8?B?RWlrNjF5ODFDdGRJRGJSOW5ReUNMbFdnY2dndjBvak1YNThmL0E0MmRocUFP?=
 =?utf-8?B?ZWpYdjZheEhWcWxhZXN3MDV6WDQrVnJKNllCTUk4Rnc4V0tVVC9EWnluQTFx?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C49E560283C6A4419A1E59E24C93D55D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Pw06pFNPuFlWMDw3TewaHBMHd4vw2uqAQvN3jMJb6kso2G1Ymtsfh+7FRoxa26fKPfsARRwCOTuCGlYmuqb+gxi7BN3DyBUUaA+q0sZCARiu+rVHCEiq1o6bbQcnoi/T3R22qaMSGW+gI84J7zH/JaHaKYuSO+Wq+0Fbo6gO7dupD4MoykzdxLkQfMImA6Z5O+NL9FjrV6yR5A0/L7keRM/X2I6BZ1FFGX6co4TQrCeIg+z2gSzmcN0uNPyNM5gYO8u1lm8q15+yNYUu849v+FC97VzP4S/ITmZxmNOMfDLCK7ihl7Dp6UqAw04Dp6rqjeQ/emJLAgl8XwRMDhLlmVA6SWUES9SDjKxmYfd+PtyKB58aupWgUU2hGr+sgbkfuMvrMigG6Rqp9t/0erSSQe/B2DFiEN/FfqdHwokgueVcjg0Np2wMmNwM/FITnBOAfq8efhFy46Nn4OEE+2+LfASjhFyP7au/6USSIIXejos4OH86TjlGgnxYVh5cq5mJqHQRnmbLxI6/MlPbYf34OI2QcU+E5SC1dPavy8DA8TxgI5A/Tr3Kn3voZERti+n57+t53WdcjhbI/FCWo0PVmJiyc6ErOxunw7eoUXRqju3oDg3jdDohTL7x3Bfp4J8KQRDaYDHfnht3gLV/YsLNZf64NcCJT7FYAZEa6dZ4S1gFo7SR+vQ5AkVuxZzBijRHTZk2VdfKwx10HPle20Jd4FS0X0+qzTNtpRvk9G/+SMXRSgYbb6TCIGXNDhJN1QZmA5RLzLs/59AeHTssNsZusOhf8M85IAhajyB2tCFqPIqWK96+LgLf9HRyx2M0HI5VGjh0M5XUeP7VY49YUqu27b/vw7SqfPE1Ba2CTRE/Zpc=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415b01cd-81ef-49d5-65d3-08db2355efca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 00:00:20.4799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OyHahYC96CtqRK0vznT9m+8oQApMCi4W65X9HArUQihuoQ5AHscze2EFB9MeYnCFmjlindV/r+9mf//iUBUCPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7999
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
DQo+IFNpbmNlIHRoZSBBaW9Db250ZXh0IGFyZ3VtZW50IHdhcyBhbHJlYWR5IE5VTEwsIEFJT19X
QUlUX1dISUxFKCkgd2FzDQo+IG5ldmVyIGdvaW5nIHRvIHVubG9jayB0aGUgQWlvQ29udGV4dC4g
VGhlcmVmb3JlIGl0IGlzIHBvc3NpYmxlIHRvDQo+IHJlcGxhY2UgQUlPX1dBSVRfV0hJTEUoKSB3
aXRoIEFJT19XQUlUX1dISUxFX1VOTE9DS0VEKCkuDQo+IA0KPiBSZXZpZXdlZC1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBUZXN0ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IEtl
dmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpu
b2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gLS0tDQo+IMKgYmxvY2svaW8uYyB8IDIgKy0N
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNClJldmll
d2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiANCj4g
ZGlmZiAtLWdpdCBhL2Jsb2NrL2lvLmMgYi9ibG9jay9pby5jDQo+IGluZGV4IDg5NzRkNDY5NDEu
LmRiNDM4Yzc2NTcgMTAwNjQ0DQo+IC0tLSBhL2Jsb2NrL2lvLmMNCj4gKysrIGIvYmxvY2svaW8u
Yw0KPiBAQCAtNTIwLDcgKzUyMCw3IEBAIHZvaWQgYmRydl9kcmFpbl9hbGxfYmVnaW4odm9pZCkN
Cj4gwqDCoMKgwqAgYmRydl9kcmFpbl9hbGxfYmVnaW5fbm9wb2xsKCk7DQo+IMKgDQo+IMKgwqDC
oMKgIC8qIE5vdyBwb2xsIHRoZSBpbi1mbGlnaHQgcmVxdWVzdHMgKi8NCj4gLcKgwqDCoCBBSU9f
V0FJVF9XSElMRShOVUxMLCBiZHJ2X2RyYWluX2FsbF9wb2xsKCkpOw0KPiArwqDCoMKgIEFJT19X
QUlUX1dISUxFX1VOTE9DS0VEKE5VTEwsIGJkcnZfZHJhaW5fYWxsX3BvbGwoKSk7DQo+IMKgDQo+
IMKgwqDCoMKgIHdoaWxlICgoYnMgPSBiZHJ2X25leHRfYWxsX3N0YXRlcyhicykpKSB7DQo+IMKg
wqDCoMKgwqDCoMKgwqAgYmRydl9kcmFpbl9hc3NlcnRfaWRsZShicyk7DQoNCg==

