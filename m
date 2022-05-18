Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C4052C79D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 01:34:48 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrTBm-0001nq-Vu
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 19:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1nrTAp-0000sc-Fz; Wed, 18 May 2022 19:33:47 -0400
Received: from esa1.fujitsucc.c3s2.iphmx.com ([68.232.152.245]:9870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1nrTAm-0000TZ-Ol; Wed, 18 May 2022 19:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1652916825; x=1684452825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gjaP1QgI3XFNQBSSrbD4it72S33MVPzK7zXJB4C/z1Q=;
 b=noOqvryo6J3II5rHqmpjkri/1by6DnckfoVlkWA+Fqa9wrkHNSo5XMSI
 5qWETTdC/LwAB+fct4R9nWUHy3VdetskIm+RKg10u8aJYea44Nm/K+W5I
 93S4YL1rZ1fRLvV6EDorXumeQnVI45ca80IOxNVJxLPO6ftj43LEaTpsV
 iSH2kBOrq5SgwonIqMhfncnWV8fH20KjGDRBZjHTB2BlAXHOoiPl71oik
 KKIJRcRAbuWalN97nLcdoXzNJXECSFVp3FqTAn6ijbTkPIJHbbc/N5lF1
 jtmiEnb5UdgtA0Iib45E5XKKQOQgJLWKQcrV1f1hfk6jUsVWZNSmPCcID A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="64345738"
X-IronPort-AV: E=Sophos;i="5.91,235,1647270000"; d="scan'208";a="64345738"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 08:33:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckG3K3k1fbWq5kIflLdSphI8CAO8wX6ltvJ7tmCsenv5ueWb2GFnGZzxjmcq3KETcSMxBtyQ1QBr8B+jCnVdklc+bIKTllXbZmMXBcc6S3Zs+V3n6zyVf41g9pGon6KsDZ5Xhyk4F6bthc3fw7XoEx6A9T4f3elxB9mBjUxscPyK+NzGP0ulpM8HmGfflbDcBPzXxphcyOUtLC+Z6UrLoTQiqVI1uDtnWbYZE0Ykq6Rhu6S9iU37UoGDT0K7EJpyEppn8/a4M8JXBbbflVlXO6cDxP9PiTbvGY2p1C1TP4nrpd8g9jj5ow80qygHx4TmZ20Hak2yGZiCqiWp+/9Y0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjaP1QgI3XFNQBSSrbD4it72S33MVPzK7zXJB4C/z1Q=;
 b=AGfNhgqd6xRxFRggXTZGTyB7oZwzP+1vtNWDP77FsK5URLaTQYIP8axFa0n/vqfZijR+kgbCzARXXQHCH5DraMU2JsC0Xe1VojDVJVJzJcgsxOJSxG6Y8+wML+E6kANq8kBArGog+zaX84VthQQxqkZnaNS6A34LR/SvsAHfYtiSaf9HVIV0x7nbrlwcBeSEzYmzucgAuoYBqjpQx35xq+YuUxIPOguFQkpWx6CAcvOngk/tdpAYZ3PBnf0aTf1yQyK7eAKTyFjVRUSp6cAgiLSl7eomx1mnz61f2HCf2w2Mr8Mc1GOfRdGS8WSekOcAWFIPSZN4m0uPInEcpexcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjaP1QgI3XFNQBSSrbD4it72S33MVPzK7zXJB4C/z1Q=;
 b=iIriGCLzJEDupA10xgJgpU/LIxBgH1XtnBEBRiMzC09cUk+23s6yC4UVPQEkdXI/n6mAlM+S7+1d1pnr82H9/I+3Ni0dlatjHlw+Sm7prB7nsAVcqQofi3eu00l+UXDns1m98HvAJw/LRencnpyHjKrYjWgjURf6KzF0gPl2VTo=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYWPR01MB7524.jpnprd01.prod.outlook.com (2603:1096:400:ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Wed, 18 May
 2022 23:33:33 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::d13b:e685:9486:a706]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::d13b:e685:9486:a706%5]) with mapi id 15.20.5273.016; Wed, 18 May 2022
 23:33:33 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
CC: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Itaru Kitayama
 <itaru.kitayama@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Subject: RE: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
Thread-Topic: [PATCH] target/arm: Make number of counters in PMCR follow the
 CPU
Thread-Index: AQHYZsUGCh03wSq/FEaOt0gwAcb/X60iydZAgAGtQQCAANbL4A==
Date: Wed, 18 May 2022 23:33:33 +0000
Message-ID: <TYCPR01MB6160894A404FA86BFF41CE3CE9D19@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20220513122852.4063586-1-peter.maydell@linaro.org>
 <TYCPR01MB61604A48D4D67447A373F70CE9CE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA9FvZZjHcSWVVwDE_XxGvFs-rJZgpdkcB7UuSPZj__jUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9FvZZjHcSWVVwDE_XxGvFs-rJZgpdkcB7UuSPZj__jUQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb4bd748-c920-49b8-b0cd-08da3926d2f0
x-ms-traffictypediagnostic: TYWPR01MB7524:EE_
x-microsoft-antispam-prvs: <TYWPR01MB752462312CFCE757F0F7C360E9D19@TYWPR01MB7524.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: myWjbjlIX8aul3PLhvlGcq3LuVHl/iJPqPGgW+/EA4JvVDk9X6kwzhw7JW5bECvc7W4xBhG2moXi24m9W+Y0HIyN8IghZH4vONW8mEAY8HYsGqo2Bld1NWfCAZW6aYxPy0bPM2xX2x5HNFAP8sJvvxtRxcEMCFchFbt/wNXkuQRYeY9pAr7H2rCzYEGFIfzhIOLobFwasv9zIrNH3dWbfRBLFvSDIZeSHXoAlmMCKaIT6bWiSLgwdgKlj1ckfEQ2HuqVnpsVnHqTESEdQVavQwU7jBSuk/UrRPE94+aKX411st/IDu4S/Mh0rWzz3jenWko8uW2F8Wd5H9whBdgQFYKGP4sUFWhQzNCZVDbtx7/sI8L/pwxsX6OcEt98GaLF/oQ3ig7Pbd1O+1/WqvERj9+LqTrmjDVnbkTq6JW5fRwvDIa5jf702FhETS+N8kyMxPSCEjBS+xaDQl7r7Yi9e765O05fiK/Wfh4n4m7AqsxG+GDDwYFBubiT8P1OcDYfVCUojj+/6YVTyGLPlc4Pkrb1mKQfgEEkbuIdNti6cGh9LteR1ITa5Hu9534Y/GVz+zgVCSGqUNaHyTCBWp0Zlr6Zb/fasmwFsHY4WoZMJNbOXw0soEKa57PbANfICewvNnm84D97T1pnq0snJ2zs6XjFblntMr/30VkJ6Z6FwhljbjKTslDf+WrEy3XwHDorCgtAwTRfJ1NG9OqHylAXLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(4326008)(8676002)(66446008)(2906002)(508600001)(66556008)(55016003)(71200400001)(66476007)(6916009)(54906003)(86362001)(33656002)(85182001)(7696005)(53546011)(6506007)(26005)(9686003)(66946007)(76116006)(316002)(186003)(52536014)(107886003)(82960400001)(66574015)(83380400001)(5660300002)(122000001)(8936002)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2J4cWlheGhqTzFLSU0zRjlwbHVXSkNxcFdxL2VFK2RsNTUwa1lITDVJWXVR?=
 =?utf-8?B?YldPQXVEeGRhWjBud05SZmxxd1F4U1FhdkhRcThnVW9lQk1OVUJwQTZydWxV?=
 =?utf-8?B?MkFCd0VYcXpXNzdjbjkrSXFZZW9nd3NSSnhFT3VzRHpNK2RDTlhsbVJFUG1U?=
 =?utf-8?B?V2hwMmJWRmJyek9GWjNLNFdSWGR3YmFGQ0VlTlMrSG1STTJiSExCVytBbmNl?=
 =?utf-8?B?cXFCOUJUT1ZkWjZkOXBndE0xOGI5b0o0NTkwWXhpcXlLU2FZTnNDY3lmWFl6?=
 =?utf-8?B?eTQwRjZsUHVuNUU0MDNKZmJ6Q1Babjhtc3NaQkR0eUVzdTZiK3p0YlBEemJh?=
 =?utf-8?B?aGFuS0dIRkdHSEdWbzltU29lU1JzVzk4TlREcTNmS3BGVUhJbWFVSkU5QnFC?=
 =?utf-8?B?bmhBSUhpZnRkQmJ5dlBtTWUvQmkxeTVYeVdodmpNREVLM3JwVTRtVkI0ME1r?=
 =?utf-8?B?T2oySHc5RkxQTkI4MXpyU05zQ3BpL0lyemJ5SUM4a3VFS2h1UnRNNjl1bTFp?=
 =?utf-8?B?UnlOUi9iZ1JmcFA3N1ZuQ2t1Kzh6N3QxZ05LcGJFdkVFQnlmRlZZdmdURzVn?=
 =?utf-8?B?V2k5UkhtTFZKblJ5TlNmUUVsMnh0WXBSc2xIa242Q2hzSzQ4Z0hTaURGZEc2?=
 =?utf-8?B?UzBPR2UvMDkwOUpzMlJmeHZCLzZQcG5KdlI0NFd1L2tUYlkxaWZvbWlveTNE?=
 =?utf-8?B?OVkrOE9YK25kdUhNRHJlVzVwbUlYS3BOZy83SDg3Qys1MGZlb0ZkL3ZMSnow?=
 =?utf-8?B?ZGpKYUpIdzdqYjZVYnlXWWtvSndjU0R4elo3VHArZmRqZkk1dXVRbXdJR3Fz?=
 =?utf-8?B?a1FmVjIwR09sbzhiMGNvY3h5WElXb3M3c3lpTk5laVZ5cGcwaVdESitYenkw?=
 =?utf-8?B?bEF3cjVYVFNYeUZZSlZyOWN5a3JtTDJzemlQYkpjb3VBNGVkM3BVTnJ2Tm1o?=
 =?utf-8?B?amdWelVWMnRJS0tKL0JjUXJUTFZKaUYzd2xONnZGLzVqWnpwTmZoS3hVZmo4?=
 =?utf-8?B?bEt2Q1NadVd6ZlVmNzYwVFVGUGorNUZ2eXVMbnQ1SUVlcTRkZDFyaVBJZTB3?=
 =?utf-8?B?WkpQUDBNWVdTbm1YNEppQVlZVThlMTJidnZSQzdxTEpPMEgreHk0ZXRTV3ZG?=
 =?utf-8?B?VS9sdHdFRzVqK1diUDdLQjBpWG13NXpxTVQ4RU15TnN1d1FlMEdNMVowVkVP?=
 =?utf-8?B?S0xDTHpUUkRsZlBNNDZPQW4vZVdvWmplajhFM2JqaXoxQ3hTdHJnblpKVU9t?=
 =?utf-8?B?RnduQmZXRVIwcTVZZ21KcHpIaC8vMGRpR0xIWmwwcGxkaDcwa3plTXdKb1ht?=
 =?utf-8?B?eHU1VWJURlNYT2hqOGZrc0N2SGJzRE93WGtjTjVuZG8xWm4xN0MxRGlqS21h?=
 =?utf-8?B?MFR5N2ZuN0QwV0RzNXpsenZBcVAzS3kreGtWVGtVNHlRUHhPM3A5Zm9BM1JI?=
 =?utf-8?B?N2tMazluaGFCSlFoS3o0d0ZURFR1bnRSUmpJT3NQNDB6SjIvNXNrNk82ZTBQ?=
 =?utf-8?B?VkUwZFNrMXVxSElHOENFUVc2ckJIY21qRElhT1ZyKzJtQ01wNzVtbDJCdUxz?=
 =?utf-8?B?dTRFNmxQK3RHNkZ1NURGaXJuWkJVMGwrUEtCRDlGOVlYOEEwYTVGRmtPeGx6?=
 =?utf-8?B?d3VWSmM4UDZNUmV0aWg4OWQzZUpwVTZ4Sm0vMjlwV1Bjc21nVkdqNUluNC9Z?=
 =?utf-8?B?T3hVcnZicnRYZUlIWDVORExscXRrMUUyNjRwZGRWbFMwd0t3c0dvcGN2NG43?=
 =?utf-8?B?U0VRWmlpa042dCtjcW9MY3l4MHMzMjNKZEFkYU01bGdEem9odURhUzJBNG5S?=
 =?utf-8?B?MWRQUEJJaW9UTTNZVnBLTnJHenhCN0d1bmxNbzRhSll6K29TMjBPWloxbUpo?=
 =?utf-8?B?N3FqKzVkd3M1R2pDSnpsZzhCMlluTUl6QitXeHRqaEZZeTlONWJaNWVydU5O?=
 =?utf-8?B?SXliZWltdzJhL0h1YWpCQ0gxdjRjZHp0bFBKUVAraFFzOFNFNSthbGZuSE9J?=
 =?utf-8?B?L3N4d1JlZ1BoQlY5bi9DTVl2dGU5bmZwZktpbXhjZ0Mycks4bkFLbUdOeTk4?=
 =?utf-8?B?clFLTlBDYjZIZUJaVkVNemp0QjFJYk92ZDRSY3E1WjlKS2dkS1NScjJKMGNp?=
 =?utf-8?B?QWVsNnc2Z252cUNrY1p1L1FnSC9SNnhFbkRydVNyYW84aW9VOTJEVFNFYmh3?=
 =?utf-8?B?cHpSenB5Y05lakRYeGE4SmhEOGJjV2JVOEEzRE9hcDdoQ0dwSkluVWpmc3FU?=
 =?utf-8?B?dkwvSjJ2Z05VT1BLM3A4ZER1VjkvbTF2ZE5rNC9LOVFjaTV6MThla3p4Znhr?=
 =?utf-8?B?ekJFeDNpQ1piU3F0Y3NySHVlMTFodkJqeXR6bEdNREVmVEpKdlpZbkVOMEx2?=
 =?utf-8?Q?901QCcEljHTwjACo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4bd748-c920-49b8-b0cd-08da3926d2f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 23:33:33.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sgSn7jperAYID2gKMVZTnp+w4BLoXASBD45lAC4vQYDZUVB4JgEETV0vdaFFoumlXpxPAXpb8XTeGjf1oL268FMvSRo20DehHP/yjtav4sU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7524
Received-SPF: pass client-ip=68.232.152.245;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa1.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

PiBUaGFua3MgZm9yIGxvb2tpbmcgdXAgdGhlIGE2NGZ4IHJlZ2lzdGVyIHZhbHVlLiBZb3UgZG9u
J3QgbmVlZCB0bw0KPiBkbyBhbnl0aGluZyBtb3JlIC0tIEknbGwgZml4IHVwIHRoZSBUT0RPIGNv
bW1lbnQgYW5kIHB1dCB0aGUgcmlnaHQNCj4gdmFsdWUgaW50byB0aGlzIHBhdGNoLCBlaXRoZXIg
d2hlbiBJIHBvc3QgYSB2MiBvZiBpdCBvciBlbHNlIHdoZW4NCj4gSSBhcHBseSBpdCB0byB0YXJn
ZXQtYXJtLm5leHQuDQoNCkkgdW5kZXJzdGFuZC4NClRoYW5rIHlvdSBpbiBhZHZhbmNlLg0KDQpT
aHV1aWNoaXJvdS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRl
ciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
TWF5IDE4LCAyMDIyIDc6MzEgUE0NCj4gVG86IElzaGlpLCBTaHV1aWNoaXJvdS/nn7PkupUg5ZGo
5LiA6YOOIDxpc2hpaS5zaHV1aWNoaXJAZnVqaXRzdS5jb20+DQo+IENjOiBBbGV4IEJlbm7DqWUg
PGFsZXguYmVubmVlQGxpbmFyby5vcmc+OyBJdGFydSBLaXRheWFtYQ0KPiA8aXRhcnUua2l0YXlh
bWFAZ21haWwuY29tPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHRhcmdldC9hcm06IE1ha2UgbnVtYmVyIG9mIGNvdW50
ZXJzIGluIFBNQ1IgZm9sbG93IHRoZQ0KPiBDUFUNCj4gDQo+IE9uIFdlZCwgMTggTWF5IDIwMjIg
YXQgMDA6MjQsIGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNvbQ0KPiA8aXNoaWkuc2h1dWljaGly
QGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpLCBQZXRlci4NCj4gPg0KPiA+ID4gU2h1
dWljaGlyb3UsIEl0YXJ1OiB0aGlzIGlzIGFub3RoZXIgcGF0Y2ggd2hlcmUgd2UgbmVlZCB0byBr
bm93DQo+ID4gPiBhbiBBNjRGWCByZWdpc3RlciB2YWx1ZS4uLg0KPiA+DQo+ID4gU29ycnkgZm9y
IHRoZSBsYXRlIHJlcGx5Lg0KPiA+DQo+ID4gVGhlIGluaXRpYWwgdmFsdWUgb2YgdGhlIHBtY3Jf
ZWwwIHJlZ2lzdGVyIGluIEE2NEZYIGlzIDB4NDYwMTQwNDAuDQo+ID4NCj4gPiBBZnRlciBhcHBs
eWluZyB0aGlzIFBldGVyJ3MgcGF0Y2gsIHNob3VsZCB3ZSBzdWJtaXQgYSBuZXcgcGF0Y2ggYXMg
YTY0ZnggcGF0Y2gNCj4gZnJvbSB1cz8NCj4gPiBvciBkbyB5b3Ugd2FudCB0byBmaXggeW91ciBv
d24gbW9kaWZpY2F0aW9ucyB0byB0aGUgcGF0Y2ggdGhhdCBwZXRlciBoYXMgcG9zdGVkPw0KPiA+
IFdoaWNoIGlzIHRoZSBiZXN0IHByb2NlZHVyZT8NCj4gDQo+IFRoYW5rcyBmb3IgbG9va2luZyB1
cCB0aGUgYTY0ZnggcmVnaXN0ZXIgdmFsdWUuIFlvdSBkb24ndCBuZWVkIHRvDQo+IGRvIGFueXRo
aW5nIG1vcmUgLS0gSSdsbCBmaXggdXAgdGhlIFRPRE8gY29tbWVudCBhbmQgcHV0IHRoZSByaWdo
dA0KPiB2YWx1ZSBpbnRvIHRoaXMgcGF0Y2gsIGVpdGhlciB3aGVuIEkgcG9zdCBhIHYyIG9mIGl0
IG9yIGVsc2Ugd2hlbg0KPiBJIGFwcGx5IGl0IHRvIHRhcmdldC1hcm0ubmV4dC4NCj4gDQo+IC0t
IFBNTQ0K

