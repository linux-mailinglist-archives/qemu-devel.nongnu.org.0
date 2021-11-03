Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC7D444905
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 20:34:49 +0100 (CET)
Received: from localhost ([::1]:37080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miM23-0004ur-Tf
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 15:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1miM0L-0002he-1L
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:33:01 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:39023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1miM0I-0008RO-DI
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 15:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635967978; x=1636572778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D7+eDZzFA1YT7W1SrC4DvogPF3ffM214oB+xbkeEFDo=;
 b=M8bRVuZww/D8itXfjWouRFHjLtupjjzMTPcprHpS983em8svMEWRxEDU
 LsOZQghcEImRBbW2dNikT9kRs9TgDwHRcHzeXJtT+qnTG5vRk5BGTOd1O
 h4K0rW29awW1pgHaLPs7ro7B8BeaJyRdWkVgTG2uHNQIUchZ0y4eXZz05 U=;
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 19:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWtJF3+UWYxUjMcZsFnjqnpRgMp7iAtfDCvDz3sGawyewuF5nYR6wU7FgNIg/7F3EmVYknv/GcSHouzbtltR+uXEyddX4dK2NKN9oacS5nOpe+DYy3LOWe+hYh/Pv2fOr8LAglDUva8tUEicT6biNe5TSV00UPL1vgzhGfsqMbERbs4MTsj6FntitU3gjVBACHvpphX8sTFosYb8VC8e72gtPkcca+CNh0ynMK7ckWCoTQBM9Fk8VrK3c71T3yr6X9Bk4URwaUCr9insL326JYVShHf/blJWf3qHMOb+HEaAYY/EHwfHVEym90jzZQhWjUzvU8LF8gtpq9miaRCalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7+eDZzFA1YT7W1SrC4DvogPF3ffM214oB+xbkeEFDo=;
 b=Pz5DiSZEGTt4qfUaT42UkvoVD9huvToCJhKGKRbMD1V/6mv0wOJZCVJf6PNSVNAMPDjCqUHDsB1Jzl4MEVluSSVzsQm++JXg8x2breQ3tnEe1UScyz2BBF1UviepgjNtxMA2RJBlvEYdc30dW2V0B6PfCC4fUNinOb+sGy+/GX02jraFECGa5+NMWavl5DmykJ73eNU0n3xpQV/ezH/O6gz6vlrJ1L+5tQyGHogJguCW+8Mde0e5H5X54OEWVHjeM1cPxV+pnluKXYAms5DHrGN6Vk4/h1T4jMnRHBAI70OabZ48rbLrZXujyZtG+oymu+8BJd1xA93bnK8WiQSPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB3997.namprd02.prod.outlook.com
 (2603:10b6:805:2b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 19:32:50 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4649.018; Wed, 3 Nov 2021
 19:32:50 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: RE: [PULL for 6.2 00/21] testing, plugin and gdbstub updates
Thread-Topic: [PULL for 6.2 00/21] testing, plugin and gdbstub updates
Thread-Index: AQHX0NYM4mt/bpXF2E6mMyLtzVrkwKvyDJUAgAAf/oA=
Date: Wed, 3 Nov 2021 19:32:50 +0000
Message-ID: <SN4PR0201MB88080FAD370D8FFAF244168BDE8C9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
 <87a6iljgsh.fsf@linaro.org>
In-Reply-To: <87a6iljgsh.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96a63f55-9d63-4454-77b4-08d99f00b95e
x-ms-traffictypediagnostic: SN6PR02MB3997:
x-microsoft-antispam-prvs: <SN6PR02MB39978861DBF5CF36B9664AA7DE8C9@SN6PR02MB3997.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RH9JtnW2PuvU17nzaGhqT43w7Ewit5Arx/leZxk2OfMUCNxF3y/yA4dMAfBqrywGylLRocMi7seijyJRQRNTa9x0s3/VnAMRXv66xMsOq/SmrLeHGWOEw/DhizKtAja9yxfiJJJ9XG7/aVaQbCTk20GiyXeLwU3twhdx5y/+pPJvs1FukubBU3CeRg/WLAm4C3d7b/oKeD/rEryrZ4013W73eQFSa6u+OlIxm/ncCfpmd9FNaGQ7Q1L0stVekcL22CkeNi0fxTe20z7K5p6CTARMDHfJ2UJHHDwMA6Xu+92377xC4bY0G2R2x3UQkEKAiKFwOoBRKLr6P09Z/lUHIo40hndEEIvrRn9UUiBTD1oKNkl7hahUu4kifNCU+ytzvdCJytwWR5cnIUn2ytu9Mzzk3t/lIXq5x29I3w/KBO7NJPnysHJiWk5aFx3GpGmGnM40nfcNUkKg374ZowbS/pwHQQs0ToSNtrCzLH60dJl5WA39o5ViMLxwPGaZCaZoEiCe+cFkdnEmtVcJ0CEdwc6iA8Ez5WBzIHqBjntKEJvJdDsgyTsBZlMmfOLPG2gaz27+bi7YHOF5F4cm8dmsRdx2DjlHm9t9YFk6IMfNhEYpfhjPp3I+UeuWj1wDMiwEKDn05BVkyUtnFgk0zCJ8LqBPC/OV/GhJrqAhOT6GXtPVrMDhmI9cSy4SSVoX9fw/L1IZB0hCPPW3hGXUWF6hnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(66556008)(64756008)(76116006)(71200400001)(66946007)(53546011)(5660300002)(66574015)(26005)(83380400001)(86362001)(8676002)(186003)(52536014)(4326008)(15650500001)(7696005)(66476007)(8936002)(6506007)(54906003)(38070700005)(55016002)(2906002)(122000001)(107886003)(9686003)(508600001)(38100700002)(110136005)(316002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGVhcGorem85YTRVWldvZFZ5YjBGNTdWU1IvcHVXeGJCeHRYZkpxNEJveGxz?=
 =?utf-8?B?SmVDNFZUY2J6NkdJY1k3RWFzNlRZMEtPVzhsNVAzSVVXWjREbmlzMDNKVE5K?=
 =?utf-8?B?Zm9MS0xsblh6cFI4eDlsNCtnL3I0c1Rob1h5WXhxQkoyWFBQcnVtSVR1ZGxH?=
 =?utf-8?B?NDkyQk43REY2MFhLNjVaZis3eXErVmRLZ3FoUUY1Z3NGQ1hpbnBVc2M4aTJH?=
 =?utf-8?B?SjZVS3dhM1VDN3BObWJmZUw5cmtnVUQ1VXVaLzIxZTd2NUFsOE5MZVZFNWpB?=
 =?utf-8?B?Wkx4YlZ6SVVJR3pPL1YzaFRHWmNBcFBqdkdvbWdPNzZma3dNR05tU3huUDd4?=
 =?utf-8?B?RHl1eTR6SVUxSFhYU2xpYVQvZ3Y5N3Y0UVkxMHY0bEhwK2IrajEzTDhKbjll?=
 =?utf-8?B?VEVxWGJuTW9PSXRYdnhINTdDV2dxSlczTEJVTXl0SUVJVkRpQmFpRS8rWStk?=
 =?utf-8?B?ZnRiQWNlYUR2M0lTV0tsWERoYUVLODVBYXBDMWt4ZEo2NUlQNFpZZ0d2Yjd4?=
 =?utf-8?B?OGMzVk9uc3R5N3E4Z3g3QzlaQlhuRTJUazBZVEtzK2R2T1JpZnh2eUFreXFx?=
 =?utf-8?B?UitCR2d6TzR6Wk9NcGlDUzk0ZEJjY0M5cmtlakQ2eGd4a3VTMkdrOXNISGJJ?=
 =?utf-8?B?aGdkU3E1QUp3TDJkM2wwcVJLQjRuU3hhaHU4b3k1K1hOZTNlYnVIamFtRGRT?=
 =?utf-8?B?VGo3eHNWOVMyTitBVjU2N1lKVHRkMThkOU13YjJHWmdCMEw3Wk0vWVVEbFpF?=
 =?utf-8?B?anB0amF1ZkQwc1phdmZLTWNXV016cGY5enBQY3NxWHl2YzVqcXBsUllLRk5H?=
 =?utf-8?B?WENXNDEwRmRUSGxwZnB6bENnMXYyaHJPS3NxeldDOUNnMjlYSld5WUo3eEUz?=
 =?utf-8?B?cndmL1c3TE90dkhNWFh2OXVkb1hhN1VkSk5EZ1FUWStzL25WM25KSzQ4cnFX?=
 =?utf-8?B?emFZOWVuSlpEZUpDd2pVd3UwcHc3WUpTaStxOTcxNGdmei9FYmN4OVNqMFlq?=
 =?utf-8?B?NFJzYWZSTmphZVZvVWRscE5EaTdYa1JXcWxNSE55Y1BqVmt2Wms2SUxleE9W?=
 =?utf-8?B?R0JDM2hhb2NNQkYzdy93R0ZCNFZhU05mRkFwWFZlUmRMMjVrMkNON2FMMFIx?=
 =?utf-8?B?VFNxQkFhdUl4dnMrcUl5VkFlK2U2Rlo0TFZnTTgwNi8xa3UzODdCS2lzNHFB?=
 =?utf-8?B?WDQyMXFhWE1Ncm9UbkdEL1A2RkZxZFdhY2dJRWk4V2thQk11ZnFlUXNWV1N6?=
 =?utf-8?B?ZjNyRnlGUWFGQTFRMUFWUmdpV1Rpd2lKckVjVlV4UTkyTFgzRFJ6bEw5dFp4?=
 =?utf-8?B?L3c3eVdnVkxFM2YvMmU0R2ZLR1BtbHFVNXJJbnVtNkExek1wV0J5V2l6Q0Nn?=
 =?utf-8?B?NWhXUW0xcTh5bTRraVcraFlCMFp5N0ZINzdmbzhwU1dDMHhOQVR2Y1U2VHI0?=
 =?utf-8?B?OEhIdzlZbVZhZnhLbzI4OEZjNkhGZVk1eXVYeXhCa2dER2J2UWhNWTIvMGJQ?=
 =?utf-8?B?N1dkWVJFcTY2UHVxb3ZLZmRCOWZtSHBETHB6b3RBVHpsa1I1bjFKUWRPZWgr?=
 =?utf-8?B?UzJJaFBQYzhPTTlFWFlvcUJYTnpzcWI4YmZPREpRS2NNcEJ4aVhtVG9rcmFl?=
 =?utf-8?B?N3FYRFoycTRINExONHpETG0vMVdHKzNkVk5LZ29NalJTTm1ZOFZnbGs1RGU0?=
 =?utf-8?B?ZmxrV2xMSU1nb2RxeEpPeU5lcFowZUFaR1VWQkNDYWpvK2FDeFpybjdja3dy?=
 =?utf-8?B?ejdpQjluelRzWFpQRURTejdLazlwTmo2WTRsZkhNbjRMRW8zaEhvTDV5MEs5?=
 =?utf-8?B?aVpDY3cxUnBxSlM2dzAxQlNITEp6RXRpcjE0MWFvWGNXOUREekMxWkJSVTdp?=
 =?utf-8?B?VHlQMUJiV2doZm5zcWlPQi9kUUhZL2J1dzJxV3dxMzBCQ0RudWpCd3ROV1o4?=
 =?utf-8?B?d0Z5WkowQkVlL0kxdlZ1djFoSEV0UzBTMnVyYlhpb1RJcHl3N0JaZWJLaGpK?=
 =?utf-8?B?S2J1b0dneC9iTVpSazlsOXU0cXRiWGJadmQ3THo4eTRhT1hpSWVSY29XT3NQ?=
 =?utf-8?B?NGVWSXpXTThONFB1aFFTSkdacTdxVWQyYmxkekR1QjR2Sy81T1EzVDRiTXJ4?=
 =?utf-8?B?bGpaVDlHaVgzU2p3cEFmQmxOc05LK0RIZFp5SmhCTnZkeVlTbUIvNnVUUmtB?=
 =?utf-8?Q?NoFZbIaApsdwiMllZkHZ4UI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a63f55-9d63-4454-77b4-08d99f00b95e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 19:32:50.6914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lATVwmj9SXGZH4NYR/bZSKZc8MbsVYiZAQzcn44WUr3/hZixzumie7uKCkyZCVzAnvXUaA4BmwREzhQR/2aRSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3997
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
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
Cc: Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V2UnbGwgaW52ZXN0aWdhdGUgdGhlIHRvb2xjaGFpbiBpc3N1ZS4gIFRoaXMgaXMgY29tcGlsaW5n
IHRlc3RzL3RjZy9tdWx0aWFyY2gvc2lnbmFscy5jLCByaWdodD8NCg0KQWxzbywgSSdsbCBkbyBh
cyBSaWNoYXJkIHN1Z2dlc3RzIGluIGhpcyBlbWFpbCBhbmQgcmVzcGluIHRoZSBwdWxsIHdpdGgg
dGhlIEhWWCB0ZXN0cyBkaXNhYmxlZCBpbiB0aGUgbWFrZWZpbGUuDQoNClRoYW5rcywNClRheWxv
cg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6ll
IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDMs
IDIwMjEgMTI6MjEgUE0NCj4gVG86IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZw0KPiBDYzogcmlj
aGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBBbGV4IEJl
bm7DqWUNCj4gPGFsZXguYmVubmVlQGxpbmFyby5vcmc+OyBUYXlsb3IgU2ltcHNvbiA8dHNpbXBz
b25AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUFVMTCBmb3IgNi4yIDAwLzIxXSB0ZXN0
aW5nLCBwbHVnaW4gYW5kIGdkYnN0dWIgdXBkYXRlcw0KPiANCj4gV0FSTklORzogVGhpcyBlbWFp
bCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkNCj4g
b2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+
IA0KPiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+
ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiBlODZlMDBhMjQ5MzI1NGQw
NzI1ODE5NjBiNDg0NjFlYjk2NDgxZTQ1Og0KPiA+DQo+ID4gICBNZXJnZSByZW1vdGUtdHJhY2tp
bmcgYnJhbmNoICdyZW1vdGVzL2JlcnJhbmdlL3RhZ3MvaG1wLXgtcW1wLTYyMC0NCj4gcHVsbC1y
ZXF1ZXN0JyBpbnRvIHN0YWdpbmcgKDIwMjEtMTEtMDMgMDg6MDQ6MzIgLTA0MDApDQo+ID4NCj4g
PHNuaXA+DQo+ID4gICAgICAgdGVzdHMvZG9ja2VyOiBVcGRhdGUgZGViaWFuLWhleGFnb24tY3Jv
c3MgdG8gYSBuZXdlciB0b29sY2hhaW4NCj4gDQo+IEhtbSBpdCBzZWVtcyBsaWtlIHdlIGNhbiBi
bGFtZSB0aGUgdG9vbGNoYWluOg0KPiANCj4gICBTdWJqZWN0OiBIZXhhZ29uIHRvb2xjaGFpbiB1
cGRhdGUgdnMgbGludXgtdXNlciBzaWduYWxzDQo+ICAgRnJvbTogUmljaGFyZCBIZW5kZXJzb24g
PHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ICAgTWVzc2FnZS1JRDogPDRmNjUzMzdi
LWI5ZWQtZGM0Yy1hYzA5LTAyNWJlZjVlYWE0Y0BsaW5hcm8ub3JnPg0KPiAgIERhdGU6IFdlZCwg
MyBOb3YgMjAyMSAxMToyMjowMyAtMDQwMA0KPiANCj4gTkFDSyB0aGlzIFBSIGFuZCBJJ2xsIHJv
bGwgdjIgdG9tb3Jyb3cuLi4uDQo+IA0KPiAtLQ0KPiBBbGV4IEJlbm7DqWUNCg==

