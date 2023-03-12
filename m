Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F26B6CAB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 00:53:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbVU5-0002G9-M9; Sun, 12 Mar 2023 19:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4282d8238=wilfred.mallawa@wdc.com>)
 id 1pbVU3-0002Fr-Ty; Sun, 12 Mar 2023 19:52:11 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4282d8238=wilfred.mallawa@wdc.com>)
 id 1pbVU1-0004uW-4P; Sun, 12 Mar 2023 19:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678665128; x=1710201128;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6yT2z4rjCCKdd7x+VqGtMN7/L9SQrKja+d9ZrKCB+bg=;
 b=ib5CyyadzEcQZWRV1KyEqIMcCKTTDXbOLU88hMLE5TK57mKH+qnVA7W8
 D9lkFuC5bV0vcjzV3vfG7VyEuYbbd6NyM3htjXvDldMzYjfHN4jgmAdg3
 13hS29SiKw3lZFbQ7AJlIlaNllKp0M67wRp7jv8QC1rndxRHd+LgeXYJv
 B5A5kdVHrmkCxJzNkrTXc8YTBlKyiMGLioMdx+KBH4NxjBgcInruiY6WT
 J0wGp4d8mfFjrMl+BTZVE4XEjVgQBnANaClZMvl3StQZcKqBmX+WgJpKb
 xfO9D2fi9oDB0XPU0gPqC4zGri9+SVCNaVFXsP+8Ho3Hto+nBqpdckw6c g==;
X-IronPort-AV: E=Sophos;i="5.98,254,1673884800"; d="scan'208";a="230405738"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2023 07:52:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faCddtvR9J1EymQijvmRS8nyV0vo0NIn7zTxGLVOsENE6XMGfYrpNU4OMco931g1P30HfiTm42Tmp90DkuxUVpe3ZwRIwLgTfzL6ZYQxgP4IGFqDS01rirtp9ZJN/jdCuFuk0wOAFW4N2MLKqQARg1enbGvfQyzC36U9uwkGZQz44ftJpjepOFrdlZ0af0Rl96gzGKWmT4YXKLFNzZn5hYdQWPo6+mb9/hdgnDkstyUilql9M3X048LbfqjfBf+yCgbUlKL0GxtHOL4Ocy6IRG48nD32D+XH5f5CML2PIBAnlstzmrww9XvrGA03q4mydHWKROJbgBMQQM1gNZQ/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yT2z4rjCCKdd7x+VqGtMN7/L9SQrKja+d9ZrKCB+bg=;
 b=fBy/tiQ1zNbbUAkAsYs3cnr8goEDY0shX+R3LnM+258r54FDUKxz+Rx+fue4U6tqRM0pJqMcJQea9W1+SHU41VtroZZoeDrSap8MpKp5mkWcx7zWMn27DfvZQMIf62p+gwa6PQV4FIgZAUWNarrrWgLptl3nv4q/7whxmIXr/kR6jIuI6La0Ly5yW3YGQRQNHcTJ51AlblacFEpm8PQU/UwvWRFsaGFeB9BmaPGwL/wt63MGrUYNi6ds2kA5xkI3dimp5C7yTOczxg0SYucnS0yzrJyFIKQWXAyUh4pjI4Z4H+Ybc2AZAkR0jnZ/9rwBgK/L8cogIemez0fLKgbfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yT2z4rjCCKdd7x+VqGtMN7/L9SQrKja+d9ZrKCB+bg=;
 b=w029J4vu1Uve+E/4eCcnj/TIXE9jDfM0nGeWREa1K7EFsQPrYE8f04rrVtln1pDW1CSGiPY1ms45uci6egOJR413jUo9CeVwaJaTDrk3Q29h/lNcRj5k9aJKH2PYihAGvQYmODKONAskn7TBCrp20A4dQhtNpjvIWUr+CyNWyE8=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by BN0PR04MB7999.namprd04.prod.outlook.com (2603:10b6:408:15a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 23:51:57 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::6253:849d:e55e:17bb%7]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 23:51:57 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "eesposit@redhat.com"
 <eesposit@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Thread-Topic: [PATCH v2 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Thread-Index: AQHZUrreRZHcemViyEKVf8nHIuh//K731csA
Date: Sun, 12 Mar 2023 23:51:57 +0000
Message-ID: <d53ebd339df6fc0cce67d5714727b5056552cb4c.camel@wdc.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
 <20230309190855.414275-2-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-2-stefanha@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|BN0PR04MB7999:EE_
x-ms-office365-filtering-correlation-id: 67bba0f3-1949-4d77-d75c-08db2354c3c7
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LJ2wwdLwZpKrcxZj5m+/2y7hryjwlH/Suzv1gc0bv+/jVbPKTpjvpDU4qUomWgo/C3t1QPT54+kRG8qy2z/BqKpks/5vmE1Os25efa8p/F29vMvATWpDvmsFwPRILz6KSfsX072tGfm03sPG2iu9gKJ2sKePBNLdh+rcYFW7Rq9SSiMNOh/7vPZ1s07lAFkh6ZufmYerlU3g5Q7fytZox7NfUGtncSOOyJJ+RrxDKbvz2/HUvYceZBmPEO5TQpbRVbQEEVMP8CPgkGXNBh1A/ppnLMX1s/WHEePTrJhETAO7lqf12scd2kqfyCK395QNMldof52QiWeC59oBRzoo4HHB1Ehbjnc+Kqgtm7P5SJKcNCPd25etIAMSJB/k+8i3iPqrI4TrfIovRBhMgLX8VyKzsdef02XwPexCAMumyLlwvvG7B5v8lkYVWdGotEF15gZ5qlA8+zUH70chkTLmWpgwNCJwBbXTyl35eR9J8Yvu/INmypvua3kt8ItJUhrWDvzChYzrGv48KzdVe16x06BTsJ/bg9F8d/8qi/DDe9ZCqPq1Ex2gA6J6Tytj8XljFRoSzZyH5p1APrMEZDnt00VMoeiJf+0W6nRrYpcq5yuGImv9jy8CVXIZDuqVYRXaQpAgba0yplUVlRhKcIiMfHTleQ4d0rOLizm7OUstfdreOzA3ck3fJVaa7tGWZNs906AJds20hQsK6S+Bq+5ztg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(36756003)(86362001)(186003)(41300700001)(26005)(6506007)(6512007)(5660300002)(7416002)(4326008)(2616005)(8936002)(316002)(71200400001)(110136005)(478600001)(54906003)(76116006)(8676002)(91956017)(66946007)(64756008)(66556008)(66476007)(6486002)(66446008)(122000001)(82960400001)(38100700002)(38070700005)(2906002)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHVyZWpCbnZ1TGhzYUN5OU1vVUFZVHcvL1RQMGoveFIvdDlCVktvM0RJWDc2?=
 =?utf-8?B?WE90L1MzeGxUMGRteURaSjJjaVhJNGtsMm01WUZudVhnWk1lcmJJUzFWeFJB?=
 =?utf-8?B?SXc3aW44blUycVN1aDJIT0lSd0NOVkZjN280dCs5RnFyY2p4aDBmV1lpSHpC?=
 =?utf-8?B?ZWRsSWhPeHNzeGI1L0xtMlZOR3dpWWhBMnhNNHBQOW5DbmlLcndTc0RHbjhI?=
 =?utf-8?B?SFBIaWpFOHZDZktId054bWpTcnZrQ0lPYXY0YXE0UnEwWUExdEZlUVJuSUZi?=
 =?utf-8?B?RnJHdlpYV0V5azArODIyTDVXUCt6d3NYbStxNFlkSVJoZ2ZBSG9EVjVRQXhD?=
 =?utf-8?B?MXlnRHk1amVhUUl3THMzS1Y4TnFIR2w2eWdYalFJWDRiQlBzbjl0aTY1czYx?=
 =?utf-8?B?VVFFRlFiTUYvcUtnN2ZraFNyN0ZKOVlwbzQ3OGgvTzNLS29OSUt5Z05aWE9X?=
 =?utf-8?B?MFVCMEV5Sy8rSWlCbU02Tm11M2VUK0k4NHBiRlFnZ2gyMXdiWTFuU2JzOGpr?=
 =?utf-8?B?aUVIcmJwTS9TVTF5TmR6VWo2dTVaZXlvQzVBbnc3K0JzVExhSnBlV2IvUUk4?=
 =?utf-8?B?bUZsM3U0cnZ4dHE5ZkJYSHVQY2ZQM2hvd0xnZmhjbzNXOHdiVXBxQ3AyMjlz?=
 =?utf-8?B?MHZzVUpsQ2ZkOENWTS9QTy9KeTBDTEw5QUgrWWN6aGdpS096YWZJRjl5aVpJ?=
 =?utf-8?B?SmhMQU9ic3lpbHBKeG91Q1A3Y0hCWEk4T0JaT0xkRjRMVzFQVjdROWpvakRR?=
 =?utf-8?B?ZGVqY1g0eFR2TkluVy9pUkJhOWpiRzlrSjUxM2JVaE5RSWVhdTRSRG14VXpp?=
 =?utf-8?B?ajNUaDJkMUJZeEVqTUJNZFRZK0NFeDFLaVBsdnVkWWVGUjNEUXJaMlJBL1h1?=
 =?utf-8?B?a1hwUmFmc2VUMitCeVFCMUhrY2xaMzRuTFZoWE11NVN4cTZITFJTTGF4WnZu?=
 =?utf-8?B?MUFrSWIxb0xSZWpWUG1uaDEycU5MNjAzN3lBMnlYei9yREpBNlpsV2JFZy9Z?=
 =?utf-8?B?NUhmUkdndjUrdHA0NElJMzRaQVM4TE5RWk9UcTFjb1ZQYlZ5UjhOOVFtUTRu?=
 =?utf-8?B?bm9RZzZWSm5ObXJ4SGMrQmRIK1FSR3ZTK3ZCQWM1elBRRGw3MXlKMG9rTWo3?=
 =?utf-8?B?WFl0ai8rRjNFT0NoU3NHN0ZrU0FnNUNwRXN5ZDMxRXZDQS9kOStTOFpWYW1u?=
 =?utf-8?B?Y2FLc2E0amwzQUxNcTdWYmJqajd5THcrbE1MTzJDS05pZGN6MGdqN2o2UndK?=
 =?utf-8?B?bFRZKzNZN29VOTc5VXBPWXlnQW54VlNwdnI2V1NWSkZ3RzQwM2hRVnVPWlAr?=
 =?utf-8?B?OTNRci9PYXJ5OHc4WUxyNUpWOEFUckRmcHhkR0dHeXdWN3hIbkVGSmRmRTNI?=
 =?utf-8?B?ZUFJdDBUSXZ0ZndsSzhKT0JZcTd3MHhZUW1RSXJZMUJ0MXc3SFpSU0dzZHFL?=
 =?utf-8?B?OHNyVGtlbHhIcGNDSGtodzVRWWdQSStxUDc1VFZ3MHdiT29UMzR1VFVEc2ZX?=
 =?utf-8?B?V1FtbGJCek9BZDBiYzk0aGIxS2p2Yk5Ldkc3blI2YkhxN0hzeVVhekpTZEdC?=
 =?utf-8?B?djB4U1d5YmtyY2lsOXBzbkhJVllseEZzSThWNERGL0N6QXY1S2tIUUt2ejBw?=
 =?utf-8?B?bUNVSW1LbW9IYTRVQkhIaVpiZ3pma01YNmRlSXFuYVVic2ppN3p0T0dtMUd2?=
 =?utf-8?B?MHdGYXNHWTkvREFxRk5vak1uc1NKZDREd3c2THBIb24vNEczWldac1NmUTJi?=
 =?utf-8?B?VnplRDlFNW5iQytuRVlQY0ZJT1pHakp4WnAyTFczakdFcUQyRUdzVkxyUElB?=
 =?utf-8?B?ZE1VMFJoMGE0RnJoVXRGdTdZRGZTRHRXZkhuNHJNVnJkOU1PVUt4b2g1bUxT?=
 =?utf-8?B?SGFZVmUvekhFMVlmcktnV0E2Qy9GQUtZWWd5Ym15cjR4NkZjYVAzK1JMT1RQ?=
 =?utf-8?B?bVp2YmJ4ZFhaVUpTWTBUSlp4K241NmxsZmVYb0xSMTVIYVUxUWdmdWFrUXpu?=
 =?utf-8?B?azA0MjFaejE4ejF1QVlTT2J2aFp1eHp0VWhvMDZLNXhmamhZU3RwakY0SFhx?=
 =?utf-8?B?dFEwby90Yk1yK2QrZDlsVjBWRGRTYmVqalJqWnRSRlZ3NW03YU1YcS9ORUky?=
 =?utf-8?B?VzVwUjBCY1p6MWtyRTNHSC9IdkFNS0REQ0hzSmlqakg1Zk9yWHhNQUViNEUx?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A52E277E2C1FC949B2C3BDE296342D41@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uAnvSUMl4Ne+3T26g+u3hVEy70+T3sdzkXIoThg8TOMv0ffchr7FbVNq6eeWjDum4Oy/yVTkQplWVv5ENoPgkc1xkIUKFlCz/Uh4wkWAOA+PZ0ZJzRFXWYE0iOgA6TtGNZZTg7bRX3C1Li+DG1WMeh0QqutDRbyuwcYh5tJ8G8MOhaL3n7xwjsYCRmm8kpcOdCpvuIaQ8yCPxvWyH0XkaS2HgcUQavA0KLRuNPzWh2sIgQ5ZFHWQjNyk2cRMCTVnNffCO+eKEkOPHsrqcXl7fBShEgf/kXFoZR6+qQ4bsXbxBS1yoFdk9ZH2pNi66lGcNAjyC8X8UnzJvc4J6LQr5HHP69kuibhknog0LvID/8m6mhUO65SEzvz3PkvNiTV6GCEP5laI1AepvzrgSGAsi+ZyubXz3ZCSSh0mzs32X0oBthDX/0dRZDk6SxFMbg6EvaaqVhJHACg+SXT6kxiJnbuLUpsFfbhkJ7QU6+MgGJIVjVk068ZYY4Dp5Vgr5AnbXgVL+0FtocG73/bVfwrkWNyYLX4DIkTPfDZ7nhTvVcmlPyxG5oWqkJ5AMhpVqFwvU7OPeiBxjaA4R3ltTWm8z8x3xPLZAXgpJnWQdJUqDnyvCfChZlb+NIBDfaw6eFcDmjCsLfkvumld0e8hwU4z3uUFJ7op03XXXL0rauzld//rGU6nC7naZaw3ARBh8PkAPBNrrtPjVvqsH/bdKlFoSYEPS5tXHBuZlhsw25YAji3tJ0ooi5sblaEDawO9qaFQscZ3H7dMiOI4cG3ytMWk2hjzwdnIdsXijqHMl6wIi/rdM0k8hm8vv7Jy7hIl4HO3zoJnUuNJYLNap+LG5+KC0pH8TsaJod8ZgCYJaujUuPk=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bba0f3-1949-4d77-d75c-08db2354c3c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2023 23:51:57.1623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQmz5EnFyWbPKPZOje1vQobohqdYa1reqIKQw4LL84GFgT8GPsXrvsbIeXv0kidcDpjVeyC9LcJ3J/6l5wmbmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB7999
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4282d8238=wilfred.mallawa@wdc.com; helo=esa3.hgst.iphmx.com
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
DQo+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoZSBBaW9Db250ZXh0IGxvY2sgaW4gYmRydl9kcmFp
bl9hbGwoKSBiZWNhdXNlDQo+IG5vdGhpbmcgaW4gQUlPX1dBSVRfV0hJTEUoKSBuZWVkcyB0aGUg
bG9jayBhbmQgdGhlIGNvbmRpdGlvbiBpcw0KPiBhdG9taWMuDQo+IA0KPiBBSU9fV0FJVF9XSElM
RV9VTkxPQ0tFRCgpIGhhcyBubyB1c2UgZm9yIHRoZSBBaW9Db250ZXh0IHBhcmFtZXRlcg0KPiBv
dGhlcg0KPiB0aGFuIHBlcmZvcm1pbmcgYSBjaGVjayB0aGF0IGlzIG5vd2FkYXlzIGFscmVhZHkg
ZG9uZSBieSB0aGUNCj4gR0xPQkFMX1NUQVRFX0NPREUoKS9JT19DT0RFKCkgbWFjcm9zLiBTZXQg
dGhlIGN0eCBhcmd1bWVudCB0byBOVUxMDQo+IGhlcmUNCj4gdG8gaGVscCB1cyBrZWVwIHRyYWNr
IG9mIGFsbCBjb252ZXJ0ZWQgY2FsbGVycy4gRXZlbnR1YWxseSBhbGwNCj4gY2FsbGVycw0KPiB3
aWxsIGhhdmUgYmVlbiBjb252ZXJ0ZWQgYW5kIHRoZW4gdGhlIGFyZ3VtZW50IGNhbiBiZSBkcm9w
cGVkDQo+IGVudGlyZWx5Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IEtldmluIFdvbGYgPGt3b2xmQHJl
ZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVk
aGF0LmNvbT4NCj4gLS0tDQo+IMKgYmxvY2svYmxvY2stYmFja2VuZC5jIHwgOCArLS0tLS0tLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkNClJldmll
d2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29tPg0KPiANCj4g
ZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsb2NrLWJhY2tlbmQuYyBiL2Jsb2NrL2Jsb2NrLWJhY2tlbmQu
Yw0KPiBpbmRleCAyNzhiMDRjZTY5Li5kMmI2YjM2NTJkIDEwMDY0NA0KPiAtLS0gYS9ibG9jay9i
bG9jay1iYWNrZW5kLmMNCj4gKysrIGIvYmxvY2svYmxvY2stYmFja2VuZC5jDQo+IEBAIC0xODM1
LDE0ICsxODM1LDggQEAgdm9pZCBibGtfZHJhaW5fYWxsKHZvaWQpDQo+IMKgwqDCoMKgIGJkcnZf
ZHJhaW5fYWxsX2JlZ2luKCk7DQo+IMKgDQo+IMKgwqDCoMKgIHdoaWxlICgoYmxrID0gYmxrX2Fs
bF9uZXh0KGJsaykpICE9IE5VTEwpIHsNCj4gLcKgwqDCoMKgwqDCoMKgIEFpb0NvbnRleHQgKmN0
eCA9IGJsa19nZXRfYWlvX2NvbnRleHQoYmxrKTsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKgwqAgYWlv
X2NvbnRleHRfYWNxdWlyZShjdHgpOw0KPiAtDQo+IMKgwqDCoMKgwqDCoMKgwqAgLyogV2UgbWF5
IGhhdmUgLUVOT01FRElVTSBjb21wbGV0aW9ucyBpbiBmbGlnaHQgKi8NCj4gLcKgwqDCoMKgwqDC
oMKgIEFJT19XQUlUX1dISUxFKGN0eCwgcWF0b21pY19tYl9yZWFkKCZibGstPmluX2ZsaWdodCkg
PiAwKTsNCj4gLQ0KPiAtwqDCoMKgwqDCoMKgwqAgYWlvX2NvbnRleHRfcmVsZWFzZShjdHgpOw0K
PiArwqDCoMKgwqDCoMKgwqAgQUlPX1dBSVRfV0hJTEVfVU5MT0NLRUQoTlVMTCwgcWF0b21pY19t
Yl9yZWFkKCZibGstDQo+ID5pbl9mbGlnaHQpID4gMCk7DQo+IMKgwqDCoMKgIH0NCj4gwqANCj4g
wqDCoMKgwqAgYmRydl9kcmFpbl9hbGxfZW5kKCk7DQoNCg==

