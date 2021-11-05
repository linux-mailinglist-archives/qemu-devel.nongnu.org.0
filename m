Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF046446615
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:44:20 +0100 (CET)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1O7-0005YS-CF
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mj1L9-00038c-L5
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:41:15 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:13941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mj1L6-0008S9-6d
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1636126871; x=1636731671;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o4brAz0m0b5MwJAU8cj4g4k76DbHJK5jrHaDTN90DM0=;
 b=lgZSDW1hNRF2505BEw1R56E0UDNt7WBjaPHllScafbDWDdXPBJMB5Fh6
 Yi0Xbm50mdSh+Fma66IwCZNnyBdt4I5VHk6j0iN1c8uHCf/L5YORxOKEl
 guui6nqqkAL2d6ZFD3WWjsJXEJT4IH8OVlO0oX3NhAem3YbY4dTwP0ZD+ g=;
Received: from mail-dm3nam07lp2040.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.40])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 15:41:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM5EOSEzGeXS01vvoHnr3R48tNcDWdCVje+Ddc8u16ke96lA6M1WfVaqEcABC4Fk7Dhizjk0CRt+3pe70Xs1Z6TqxUwU+SH4IsmyzRsEbhAFjcszROKG6QHpqzqKrqAO2pDi40BXpwfmTrKNewB0DKuzP/6n6d0XHOJN7g12+VdbzzW5h+H4n2vmwSkFoT0qMIBrA3owhE7tL0xA1SEnx/DvpIq5smwf9kYQ6U20xk0IQwfOTer2eI88OXfqpYKAz3VFYiXkZiPh38OqImJjstTx6wgfYmiJ785rFD01+FiZeqhIC5K6FWL1QCLggxelxHZp8NEH3h00Inl9+DpeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4brAz0m0b5MwJAU8cj4g4k76DbHJK5jrHaDTN90DM0=;
 b=AHL4PDtFTaSHbSxnrgGwgj6cPEjzNJsX4onLk6evphZdPTMedOcDElDEHLNpTM5VoqqhLX/ynf/b5MGeOe9pjJxPjZSKqdE6vTtjBhFgHvNZhxVQF1JzCfUM/q+SQFyjFs/79+ftEuLnekXyXlVGHzfxAlrd5L0GbbNHzI3FUYmxeAXkGUNnbXN6h89C0zqx9mDPF2Mse5deUkPDPM5Lo2cE1e0obhonQYMEP1LBXaTbEFGpILctejK8R8w/pr+eRhrExINLN0jWOKt571p+x566pfOXrdxqq93BhQWVbKciad68j0rDMALhO6FEdOuG4tSOGBlI0nJuJSfEy+VVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN1PR02MB3647.namprd02.prod.outlook.com
 (2603:10b6:802:23::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 15:41:07 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 15:41:07 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: FW: New Defects reported by Coverity Scan for QEMU
Thread-Topic: FW: New Defects reported by Coverity Scan for QEMU
Thread-Index: AQHX0cAWbMVPCCcpC0y2OB7zGEg5CKvz8p6ggAEeMgCAAAJfsA==
Date: Fri, 5 Nov 2021 15:41:07 +0000
Message-ID: <SN4PR0201MB8808374EFC1A203292FE0A01DE8E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <61844bb6ced54_21aa5f2b09742af98856497@prd-scan-dashboard-0.mail>
 <SN4PR0201MB880836A27E0A0E93CDF7308CDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <CAFEAcA9Tp0t+x+AcfJUJgqJxPMYmH7dTibYHGf0ipvPp71yGhg@mail.gmail.com>
In-Reply-To: <CAFEAcA9Tp0t+x+AcfJUJgqJxPMYmH7dTibYHGf0ipvPp71yGhg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a6cf56e-4ae0-4397-1f90-08d9a072af63
x-ms-traffictypediagnostic: SN1PR02MB3647:
x-microsoft-antispam-prvs: <SN1PR02MB3647D81C9C82935E93E26BA8DE8E9@SN1PR02MB3647.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IYmqTaPh5wL/Ms5G+PkJx4Un3q7SRoHWtiHp7vk4r8EUcxt3rMr20HIpXO3Y9N1fxoPvQYkwbhZNEfwhhRfhHpRitw3w9ndRL+FI/suT/Aqt48FZgi2mIj5bhBn9z/FzIewP0+3mx/Kan3c1D1TaDaMPLghAtxdszcwfNlP/emHfE0VRskQ/Ur8PBGQHrj1pRGckUgNi+MelC3Uvom3u8uaad6uSbvXpty6iNrl4ETRazYB8Fva1dz7xSRZh80UuOcUsMyM84+GDXKw5msz1IxmJWJX/ZtjbuZ5uHdZVxBlo1VsnQX8TxzACJnl6qksD1Ny7UcnpfikZo+7Q9eXLfrbNcrcSLUrhoZ3Yc3Sxxy6syBMbnLVPY2N8fJR/Db3/0GHTuyAdgWTToGwAaCGUBRG7IhrUjeQ1l4MW0ISB23nn5LfF9G2OUBTvcyXeOD5b9LKehk09QG9PEMW1tnPsLPidoaYHroBb97rUYj8qxw6TOb5VSf4sg4n0bNi22/sPC5A+KkBxOSaK2SFO0xgtbl8bXa3JrQNXNJcBlCTqu2pOpY8st/T2wmjkkiRSxkGvM90c301nhpP72jVs6Nfa4wMY7HR2+UCM5uSsuR7bZS+KzJ7GNUyaQiE3xCbFJECkaGuk0AKrnTEdShF/gs0WZovHBGIOfAK7HJEkf4SNqJNggVE70aZX82QTfbq5sP1nN+z19Y1q6KL4xJmc+N+zUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(55016002)(52536014)(83380400001)(5660300002)(9686003)(33656002)(8676002)(66946007)(186003)(6916009)(26005)(38100700002)(53546011)(8936002)(66476007)(54906003)(66446008)(6506007)(122000001)(76116006)(2906002)(7696005)(71200400001)(508600001)(316002)(38070700005)(66556008)(64756008)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVNqM3JrRlpkNFBqcWFxb1VRbXFCczlqeFBqTXBtNlFNMGlrV0xPN3JGelBE?=
 =?utf-8?B?UXovSjNVcWZjaEJJbW1IV0VjTkUydDNySEZQRjBIcXpYUzF4UUNhSXVEeDJD?=
 =?utf-8?B?NjhrWU1oWGpWcmYwZFdJenZZQURCOGkrOGhXU1IwdFg5dTJPQ1VVMjREdGlo?=
 =?utf-8?B?NE5UYWtvS2ZTeDhpQ1VibUZabGRzd0xYVE9aQ29nL1RhdE5nL0I4eVBhVThS?=
 =?utf-8?B?UWRQTWhxeWptd29vdnU5SlF3T2Mya3dHV2VnTk9Nc05qd3J6NWluWmt0TWNW?=
 =?utf-8?B?elc2a2E1NG5JcGhCZnZ1ei9QQW5rdDYyMlFId3AyRWlTWE8wbUlKem1zR0pi?=
 =?utf-8?B?VXNaRDJjdk52MVFHK3diQWVZUkYvV1pVQ2cxZWhIdWNUaTNlMjMwcGZyRlQ5?=
 =?utf-8?B?VFVrS2h6Ymp2SnpJWGtUU0dkZXZlQ0VlRjc4TU5HTFFLbWtRUlZZUWovYndT?=
 =?utf-8?B?VVFKUEFxV2hpQ1lObDBvQ3pOdm9PcWlJbTV0bEVsK3JIUHE3TWxablFFbnA4?=
 =?utf-8?B?ZGc1N2ZXZ0ppY0hMMCszTEtELzMzdkJqN0ZBRDhPeGhwMk1kRXA5TUNCZWho?=
 =?utf-8?B?T0RQQnU4ZjR3aEhIM08wSklsUFlsM3pFYmdUbDdsMjZPUGpBeERtVVBKbWtx?=
 =?utf-8?B?azAwUFdScm1ZUU1zOHZRRndBL3M1TU5qYmx0dU9GdXNsUjhJZTBQdW55VU82?=
 =?utf-8?B?K1daRmo1WHhYOWJXZW5jZURBWFYxL0R5OTFtZS9jNjZGZXl5cEJnaGprbE5Y?=
 =?utf-8?B?bjR2ZWI2UEU2a09Wcm5jZ2F6NGg0TFJKdnhCTjNKbjkxOFUwSTc5RnY4ejVN?=
 =?utf-8?B?eHZDWDh6UU1QOE5IZFBjL3hqVGJZM3BCNjBUZ2RRNGJscTdBcFB1OTNBc2lS?=
 =?utf-8?B?NzRpREJaQ1NDQi9XeTZPOGNxTkxGZmZRNDlCZFEvSWZqSW5RTzA2WVRNRzYw?=
 =?utf-8?B?b3RveGU1UG9nRll2QlFoTThOc1lIN1BFZHpNMHZvR05TUERnekQvVlpZcVIx?=
 =?utf-8?B?ZmtvOS8wWFhzMyt4S0FKZ2htYUVpdERHekJrVnBINXlTcC9CSnBDMFk4Zmxl?=
 =?utf-8?B?QWh1NjR5ZlZtN1Z0R0tvSVF2Qkk0QmRtVytvUC9kSmlZZVc4SWEvenFhWDI0?=
 =?utf-8?B?a2V2VmtUYmk2OGJMOEE1bFU0b2s0dVZzYitDK3NPbmVFWDNjdS9xaktkMDda?=
 =?utf-8?B?cGMwWlJqWjJ5aUk5WXpydUgva1FVU2NDdkVnWGt6bkZGMUlOQ3EyMU5vNTA3?=
 =?utf-8?B?T3VNUzd6aE1CcTNLQ1ZLZE01REFCSTU5aDJmNk1Sc3phK2hpbmZscGdSeWRl?=
 =?utf-8?B?bXcvbW5rRjdrVUxQVVZkVmlGWGt3MElNclZjRldVREUzN2EvWlhnR3VqTXFh?=
 =?utf-8?B?c3JFMHNUUGpmOGQyR0dLRURyQUVkS2ZQdmhPUnRSK0V6NzdDclM4Y2pMeDdv?=
 =?utf-8?B?bi9ncFRaeFd2VjJOY1ZWSmU4bEJmKzhQemgybjkwdk5iMVZ6Qms1RUsvK0FH?=
 =?utf-8?B?d1JCZDZUM0JJYkp6ci9pSWhYN0lnY25FdjNYWW00ZzRvRjZRZE1zT2tjbUhJ?=
 =?utf-8?B?Qm8rNzNFRWRpZDJsSng3S0NmdDh5elVUNmw5VUFPV3ZXWHdGRUJocHljTjlB?=
 =?utf-8?B?QmEySzBxT1RLQTNsVGRVK01HcXVzZ3RHNnFVbUNjNVRwcFlJOWxiNmhkRkVn?=
 =?utf-8?B?bG5tZUc1a1ZtL0pXd2k2NExpb2NBVmptQmQ2Qi82WUJiOG1EempWdVViZ1d4?=
 =?utf-8?B?em9zOXlPZFRYS0p5T0VNakhqTHYya3JZU1BQUFIwVERia08zb0lCaWlpV2ow?=
 =?utf-8?B?cWtDTERtS2hOU055ZXhYcnBjOVQyQlFoZEFyZ3UxSHJwT3gzQUJWbEtkWmtH?=
 =?utf-8?B?Q0pOTzZMVUN6NG9ueDQ3K1BtUy9pcXd4UCtHUTNsV21HelpTZFNmMVVjT3Vo?=
 =?utf-8?B?MUxidkFSL2I4Wks4c1pvMndvS0ZSRVRVKzRKZExpV1g4RVZpZiswM2tzMkY1?=
 =?utf-8?B?ckRZZWZTOGk2OG5Sd01VWm5yQzFVSVRWUnFxRVpzWlYyeTI4M05QaHNXYTc4?=
 =?utf-8?B?bERtbjlEOXFLNWlUa3ZUcnlYaE1jV09HNzE4UElHWkVmMTREcXZXdUx0cml5?=
 =?utf-8?B?VmhWT2Y5bzh2eFZDWGdMUkVtbTAvVWl4YVRBZk1XQ3lDdXAyR1FPTEsvK1Fo?=
 =?utf-8?Q?4TS39JO3aMst8p/ZsNJ8ltU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6cf56e-4ae0-4397-1f90-08d9a072af63
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 15:41:07.7446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCs3SBxOQuBgZee5ZqKvinzGPWFMIX/YJITHt92u1mognLlUDcABfInhfKQchoKZBNaDP6NcEitcoNK0pb+FBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3647
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgNSwgMjAyMSAx
MDozMSBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiBD
YzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBSaWNoYXJkIEhlbmRlcnNvbg0KPiA8cmljaGFyZC5o
ZW5kZXJzb25AbGluYXJvLm9yZz47IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpDQo+IDxmNGJ1Z0Bh
bXNhdC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBGVzogTmV3IERlZmVjdHMgcmVwb3J0ZWQgYnkgQ292
ZXJpdHkgU2NhbiBmb3IgUUVNVQ0KPiANCj4gT24gVGh1LCA0IE5vdiAyMDIxIGF0IDIyOjM0LCBU
YXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQ292
ZXJpdHkgaXMgZ2V0dGluZyBjb25mdXNlZCBoZXJlLiAgVGhlIGluZGV4IGNhbiBuZXZlciBhY3R1
YWxseSBvdmVyZmxvdy4NCj4gPiAgRG9lcyBDb3Zlcml0eSBoYXZlIGEgcHJhZ21hIG9yIHNvbWV0
aGluZyB0byB0ZWxsIGl0IGl0J3MgT0s/DQo+ID4NCj4gPiBUaGUgbG9vcCBuZXN0IGluIHF1ZXN0
aW9uIGlzICh0aGUgaW5kZXggbXVzdCBiZSA8IDEyOCkNCj4gPiAgICAgZm9yIChpbnQgb2Zmc2V0
ID0gMTsgb2Zmc2V0IDwgMTI4OyBvZmZzZXQgPDw9IDEpIHsNCj4gPiAgICAgICAgIGZvciAoaW50
IGsgPSAwOyBrIDwgMTI4OyBrKyspIHsNCj4gPiAgICAgICAgICAgICBpZiAoIShrICYgb2Zmc2V0
KSkgew0KPiA+ICAgICAgICAgICAgICAgICBzd2FwKHZlY3RvcjEudWJba10sIHZlY3RvcjAudWJb
ayArIG9mZnNldF0pOw0KPiA+ICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgIH0NCj4gPiAgICAg
fQ0KPiA+IEJhc2ljYWxseSwgaXQncyBsb29raW5nIGZvciBlbGVtZW50cyB0byBzd2FwLCBhbmQg
dGhlICJpZiAoIShrICYNCj4gPiBvZmZzZXQpKSIgcHJldmVudHMgImsgKyBvZmZzZXQiIGZyb20g
b3ZlcmZsb3dpbmcuDQo+IA0KPiBZZXMsIEkgYWdyZWUgdGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZl
LiBJJ3ZlIG1hcmtlZCBpdCBhcyBhbiBGUCBpbiB0aGUgQ292ZXJpdHkgd2ViDQo+IFVJLg0KPiAN
Cj4gSSBzdXNwZWN0IHRoYXQgY2hhbmdpbmcgImsgKyBvZmZzZXQiIHRvICJrIHwgb2Zmc2V0IiB3
b3VsZCBwcm9iYWJseSBzdG9wDQo+IENvdmVyaXR5IGNvbXBsYWluaW5nLCBidXQgd2Ugc2hvdWxk
IG9ubHkgZG8gdGhhdCBpZiB5b3UgdGhpbmsgaXQncyBtb3JlDQo+IHJlYWRhYmxlIHRoYXQgd2F5
LiAoQXMgSSByZWFkIHRoZSBjb2RlIHdlIGFyZSBkb2luZyBiaXQgb3BlcmF0aW9ucyBoZXJlDQo+
IHJhdGhlciB0aGFuIGFkZGl0aW9uLCBzbyBpdCBzZWVtcyBzbGlnaHRseSBiZXR0ZXIgdG8gYmUg
dXNpbmcgdGhlIE9SOyBidXQNCj4gdGhlcmUncyBub3QgYSBsb3QgaW4gaXQuKQ0KDQpUaGFua3Mg
UGV0ZXIhDQoNCkkgcHJlZmVyIHRvIGxlYXZlIHRoZSBjb2RlIGFzLWlzLg0KDQpUYXlsb3INCg0K

