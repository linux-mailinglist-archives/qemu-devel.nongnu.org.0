Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDD4C5D70
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 17:33:37 +0100 (CET)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOMUI-0006ch-7R
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 11:33:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nOMSk-0005or-8H
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 11:31:58 -0500
Received: from [2a01:111:f400:7e1a::721] (port=62305
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nOMSh-0007zt-N3
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 11:31:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEIMMtu4IszjR++V4oBg6c9IGGz/4vNcmBkLHkHvHF0fR5Eo23VroxFbj0t7PKGxfNZN43qat6hkYL2YArK5nv4h0j3MAPRN05OB4r37mcl5rA5/lcP7b6o9uTUB1YCTTMHvV24yxsoEWqM3iiYeuX7tgpJyXcvPWJwCNEOpCBylN7HZ89HpbH3D7vjSalTU502YdHYQ+iICt/chCLi45c+890Lr+qzcvdXVFD1jZTuOpEempKTMB0xmChhJvB45U+xGSv1VyZGiXpwK1mNilrR9JyiWaONMub5U8YxyLHZLkSk7pco4356SjKe69ceTV0Djf6ZOziceRGWxF65JlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxL2FJ5CCBA4Hs6MLwC1roHa+zkU+uDyQMCdIq8v5HA=;
 b=SeeGE3RM3B8c5u+Zunhyfsg2+UdfhqmqcRwLnEOm6nFZODFfAymZ1C4vCiYDZQsCUzQpIwiBIpkJfdkrrgzD+iLkNhQcqs/PMPD3/5J3lmsxE5EmY75sAreduHHSXxCPoMIdRl30XEK4hhP3rfNMVtD1EQTb1ood/ZH8PxMZBYq4UysvRDIVTYMF968ztQCFSF0QDOTCG8TUs8clijYVoVrUgZprH+8n3Ob2XR9F6mg/MUtMExr4XDAeVgXGuqrFIH63gAixowFXJDcd2HCAthogGti/0vUtfryTof1btbq3wYHHa0cUuRbjDPsStAJzd9nS/jeZ7hWcR7HLOVC6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxL2FJ5CCBA4Hs6MLwC1roHa+zkU+uDyQMCdIq8v5HA=;
 b=PoGnM6a/VX+oY6yH3UGTc31rzOlp2LPHcCNa5S3pls01bs1IqwYOiJDb5qnE0dpQiQBld4PgSpHC1GNdOaSQPeyOV8N04NnlXLbzG49LypqO/SulCRhC7NLY1t0hwQCHzHHa2xkRpCejh6y5Nke8Z2ryhEl3+4KbpJkLGa21Sao=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by HE1PR0902MB1850.eurprd09.prod.outlook.com (2603:10a6:3:f5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Sun, 27 Feb
 2022 16:16:48 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::4c3d:dc4c:6ad0:6e5e]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::4c3d:dc4c:6ad0:6e5e%6]) with mapi id 15.20.5017.026; Sun, 27 Feb 2022
 16:16:48 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 1/4] target/nios2: Shadow register set
Thread-Topic: [PATCH v2 1/4] target/nios2: Shadow register set
Thread-Index: AQHYKYVljEg93zJw+UavI3lZc/0csqyjTcOAgAREgiA=
Date: Sun, 27 Feb 2022 16:16:48 +0000
Message-ID: <PA4PR09MB48804DD783E42A73B9F59AB1EB009@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-2-amir.gonnen@neuroblade.ai>
 <60ce1408-c219-7a02-e993-442bb254fe7c@linaro.org>
In-Reply-To: <60ce1408-c219-7a02-e993-442bb254fe7c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 051a1590-5c37-4f95-4c45-08d9fa0c8e3f
x-ms-traffictypediagnostic: HE1PR0902MB1850:EE_
x-microsoft-antispam-prvs: <HE1PR0902MB1850F87E422E14F565972862EB009@HE1PR0902MB1850.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KM5ISkSF41BajLhWDaBquKx3v0O5CE68C4Ctu20STskPZRllNLbsBIcID6tZihvIxqJ3mdKNjIqIPiH0r+WTGjQrWsIZN18+mRLt3UXwCyJeDUkJ1He5wkz8M/gE/RFVygiWFovgnmdky74g6zQSWlUbaMRcAzhT6WOheJDjKWr+6q+6k0bewju1MFzTsIfLhv5Q3rRU66JlZH1QkljiKcaEp+DJPUIzzVYSuQeNMr3DL84Z2JuNuigKmtXgP+hYaD+3mJToQbjcUBU5SYHeHXEZFRuEWmnkM525qBjc5Cqrszk1H5gbkDgz8RKtqEcjeoFcuKq2AvRhLMRmlf2ksroDyUnRJEv19t0YeRgeYwmGGc58Vm0HnrAbex3Ak6PQWLSw+5Jo8fXeo7/jo86p70DWNZ+rT5lADbdNVtLtthoIKgXvjpcyVs1TgKyaPbkQYkQhHsdY+fRpVHQmRnUM6ngea2SmXYQ8Jpk/v/HPF6nhVr6qpIdf/MAASoWwOB0Rnt7PwX6P+Rq3XPFoggGELanKQusMyDjEeJmoyv+SNYHne0/41VLrRF2X5dBG4W5Nj3R0O2EyUT1au1go4jzvDhv9gbxgtAPg0LXiY3z2DTkNtMLpO4LWI9BSl0V5KhCZ5HDnvHEhZ3v3s1gwej542dj3ailzPO2TP0cCkjOEZciHZODvSi0BdCAOJqXQ8ygkrIxSww5H60MDfgckUDIe9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(346002)(366004)(136003)(39840400004)(396003)(376002)(55016003)(44832011)(86362001)(64756008)(71200400001)(76116006)(4326008)(2906002)(66446008)(5660300002)(122000001)(8936002)(52536014)(66946007)(186003)(26005)(9686003)(33656002)(66556008)(4744005)(54906003)(316002)(110136005)(508600001)(107886003)(38070700005)(6506007)(7696005)(38100700002)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGpyc2ZCVlBUd3FtWTVXdzRXSWRaYWkzaVhad0U5Rzh0NnZsNzNmNkN4YTJ2?=
 =?utf-8?B?aE5IYmpqenp4SnlFRnErUjh2WlJFeDNwWjRQOFU3ajBrK3FnWGkybCt2Y0p6?=
 =?utf-8?B?eVVDZ3FjWlhkSW1DMUNmTDFrMDRUTU55WkdpaHdaZTQ5U3Exb0Nkam82eHVQ?=
 =?utf-8?B?cHhqcVUyUlVTakhndFJ4aUd5RjdsVGVPUnhrQjgzbXJxWkhTQ1N2YUphWHVG?=
 =?utf-8?B?VUF4SGNQQWZJLzZibXdVaVRINGZDUmMyWXFhL04vUWN5cmpzS0U5aWd4U05T?=
 =?utf-8?B?TWVlOW5PZitDVk1UeTdPa3NEUS9Ec0phOEFQUTYxaHV4c3QwM25TZDY1eXAz?=
 =?utf-8?B?M3lSaVZiY3BrUUxtOHJreHA4WlJLUFVINjhXUnhOQzA4aHBKU3V2cFJQZTdZ?=
 =?utf-8?B?WlFwa0QzUzJIQkJQK3hYbis3OUJTampTZ2FDZHk2bGFVeVpmVFdaYlJqSzNy?=
 =?utf-8?B?RkhseFFHVUY0S0ZVRnZ1ZGQ0S1lHOGtKVThDN0ZxaEFQQXVRa2pWamhIbUNE?=
 =?utf-8?B?K2ExS3FKZ2F0cUZaTWREMTVPS0FTTm04R1lSeDNBYXkvRVc2VmUrNE5TUDI1?=
 =?utf-8?B?NGgyN3o2b0NKa09wS09VSkVvMlJudlUzZ2RkMEg2K0ZGQmFVQ1lJMDBaaE1M?=
 =?utf-8?B?Slk2TWgrUGZGdUFTbDZhVGRQNGkrTzJkOVRNanA4RHVVL0cxUi90MCtMZW1u?=
 =?utf-8?B?dzF3czhHVFh6THBkMzVITFlzbkxnMUMrQW1Zbk9WekNEVFJTZTFHWFVmMTlS?=
 =?utf-8?B?cHV4alpSc3JOcHNHbEVPRENUdGEvWk5EdzlwdWpwNjRyeFdrRmROaDlLTyto?=
 =?utf-8?B?VzBsekZrVlNJQUJ2K3RHMWR1M0N2YjNnS0Fod2dibUN0Wm9vK29MUWthaHBv?=
 =?utf-8?B?TFNyemdlaWZEbG5sK2FaZHBSdWVtWnUwM2FEaHdSUzRBaXdrQ2hnYjVQbmFq?=
 =?utf-8?B?aHpsNTI1YXZDQkFLK2xhbXBhQXZUUjFqSk9WNGtoNjkwN2FQeDQ1ak1EM0JN?=
 =?utf-8?B?SFBiYjFqWjZSWFVEdG1sSWw1QnBhVDc5TGVzV1dIOVI1c0VlaXFGcCtINXlN?=
 =?utf-8?B?S2I5WVBvRERoYVRxbzZNNGJvc3JiWGluN24vMTdmV0VpVnJhbFUwazJnWG84?=
 =?utf-8?B?ZjNXZkozT2NRSFpRZGd0Qk05VlREMUV6c3ZrdFA2Z2ZuUnBtcHBrS1pGUjBs?=
 =?utf-8?B?SGJkTlJHM2dBd1V1ZlVKa2FMVytoOHFnYjVEblcyNzEvZThuc3JsWUliZjZw?=
 =?utf-8?B?Uk5SblUyenV4NitsK09mbkNDb3B1RDZmMWlaYWhUaWQ2aUVZaDZuOWNvTGEz?=
 =?utf-8?B?Q2tOUElOcStmclVFZWJlUDBWdEhnVnVMS2hOSkhFOS9Rd3RjakZtS2lraVZC?=
 =?utf-8?B?ckVHbUwrelRvampVLzBsK2JLNGxabmEwV2tPWEdtcjJGTytqUEh6b1BoUG1I?=
 =?utf-8?B?ZEZ0SkRlbkgyeHJucnhIb2ViZWRQYmppMHJmeCsxZjNpMVNiKzFkd0FyRUJt?=
 =?utf-8?B?NklLMTlEeVZVZzFKWU5xNUlNanNvWUVxSnI0SmR3SHFkYjJyTEowRUVOYWVz?=
 =?utf-8?B?Z1dXMElJdGo0cWg0anhqNkoxVkhieGRNOFRiTW0wQ09MWDZ3N3U3dVg5dEY1?=
 =?utf-8?B?VWdEeUVabmFWWkUyaC9waitFNEFwdnRIQjdRRG5EaEhkVUNnU2NpeWN4Tk5I?=
 =?utf-8?B?bWRmRzErMW4wRXFudUhNTWkzcm5HbjFtQzRvS3d0cFQ0ekhDWVc2aEc5elJL?=
 =?utf-8?B?ZFF2czRJdzBab2h4dk5wU3d4UWNJZkYza2hvakE4WG4rTXNTNW8vRU1xT25H?=
 =?utf-8?B?bnA4ODZpOVFiMjF3K3FVR2hQQ0hHdGZEVmxZUXJlaGNvTXNOUXBxV0VOa2FW?=
 =?utf-8?B?dkc1ZGovNkt3c0dwVWRRbDRISVppZFpLVmJOb3ZHUGdJMTVvRlBQQnFLM1dv?=
 =?utf-8?B?RHBVWXVacEJaSGoxRnd6UjVPeDJsSE03c2svRXIycmhyTmpETzdzT2hIN0Rk?=
 =?utf-8?B?dS9EVU92SkJNL2RibGxPSzlKVEFkdzdBaTFKdnpPcTlxemxOczlIVGlIWmNu?=
 =?utf-8?B?WXBEdWVCYjc5ZDg1QTFBUS9lSTdPbVJ3Zmx2aU5HanRqd0JjVXVRN3lkM2pM?=
 =?utf-8?B?YjU0bkI5SUtxL0hNcWpwaVJHNFN6Y09qQUdzb3JWMTNUd0drd3lTR2pQYWpz?=
 =?utf-8?B?eVFqb1lEWU54dm50c2QwVWs5QU5yQm5XSjcvd0Y4dURwQ01FTkpkMzdObStn?=
 =?utf-8?B?ZWIwK21lUkFUdUhCK0h6RE93MEJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051a1590-5c37-4f95-4c45-08d9fa0c8e3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2022 16:16:48.1762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 06N2VkQk1qrVCSo+Y1AN3V2mAa8NCmCIiTV67/4vzjdDof+1nVp2eTndqUgGgXJfZ2RTUHyIWajmM+g8TIbIqrvRcr+jbF9UWkz4lFJMWhs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0902MB1850
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::721
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::721;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgUmljaGFyZCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBhbmQgY29tbWVudHMhDQoN
Cj4gWW91J3JlIG1pc3NpbmcgYSBnZW5fY2hlY2tfc3VwZXJ2aXNvciBoZXJlIGFuZCBpbiB3cnBy
cy4NCg0KVGhlcmUncyBzb21ldGhpbmcgSSBkb24ndCB1bmRlcnN0YW5kIGFib3V0IGdlbl9jaGVj
a19zdXBlcnZpc29yIC0gaXQgbG9va3MgbGlrZSBpdCBjaGVja3MgQ1JfU1RBVFVTX1Ugd2hlbiBn
ZW5lcmF0aW5nIGNvZGUgaW5zdGVhZCBvZiBnZW5lcmF0aW5nIGNvZGUgdGhhdCBjaGVja3MgQ1Jf
U1RBVFVTX1UuDQpJcyB0aGF0IGNvcnJlY3QgdG8gYXNzdW1lIHRoYXQgQ1JfU1RBVFVTX1Ugd291
bGQgcmVtYWluIHRoZSBzYW1lIGJldHdlZW4gZ2VuZXJhdGlvbiBhbmQgcnVudGltZT8NCg0KPiBB
cyBhbiBleGlzdGluZyBidWcgdG8gYmUgZml4ZWQgYnkgYSBzZXBhcmF0ZSBwYXRjaCwgZXJldCBz
aG91bGQgYWxzbyBjaGVjayBmb3Igc3VwZXJ2aXNvci4NCg0KRG8geW91IHN1Z2dlc3QgSSBzaG91
bGRuJ3QgZml4IHRoaXMgaGVyZT8gV2h5IG5vdCBmaXggdGhpcyBhbnl3YXk/DQoNCj4gWW91IHJl
YWxseSBuZWVkIHRvIHN1cHByZXNzIHRoZXNlIGZvb3RlcnMgd2hlbiBwb3N0aW5nIHRvIGEgcHVi
bGljIG1haWxpbmcgbGlzdC4NCg0KSSdtIHNvcnJ5IGFib3V0IHRoYXQuDQpJJ3ZlIHdvcmtlZCB3
aXRoIElUIHRlYW0gdG8gZGlzYWJsZSB0aGlzIGF1dG9tYXRpYyBmb290ZXIgd2hlbiBzZW5kaW5n
IHRvIHRoZSBtYWlsaW5nIGxpc3Qgc28gaXQgc2hvdWxkbid0IGFwcGVhciBhbnkgbW9yZSBpbiB0
aGUgbGlzdCwgYnV0IGl0IG1heSBzdGlsbCBhcHBlYXIgZm9yIGluZGl2aWR1YWwgcmVjaXBpZW50
cy4NClNvLCBpZiB0aGlzIHN0aWxsIGFubm95cyBhbnlvbmUgcGxlYXNlIGxldCBtZSBrbm93IGFu
ZCBJJ2xsIGNvbnRhY3QgdGhlbSBhZ2FpbiBmb3IgYSBkaWZmZXJlbnQgc29sdXRpb24uDQo=

