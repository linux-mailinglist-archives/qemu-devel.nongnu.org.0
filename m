Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D10420410
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 23:24:25 +0200 (CEST)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX8y9-0000he-1Y
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 17:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mX8wJ-00071b-Tw
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:22:31 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:30921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mX8wI-0007uG-CP
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1633296150; x=1633900950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lJDVWOAhBbr6doac6uJNibuxZuT3AjaeE+wRFNuSrKg=;
 b=hCLeu5buaDsIzYNZanhmzDx5SIMBn/KLh9iyFqBiOTmoDsZY3ls2+jZa
 zOVBCnKdlRS9hQDTgqlZHdqq0Msl6o2RP+TAay/EhFAVCadFnl8mMztrr
 26JcHgT0GEz/SE/NwUQMiKzC3IoEB5kb36VwasdZFhY0RdgLV3b7VZwef Q=;
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2021 21:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ankIg+sRkclTmq56gSpzO58TVuV0Xn+QDXn6q3RxWrGw0j/wLrGYXl/tLqobRGCVgq4cUDb1xIUUYIUnqTYl4TVnl/BnLgsEqj9ZWTw835sJYAu4Q3dXfMtNh15uGYgAJNCKtqNVvLJTtonj96eZRPAj4LgLTN4AtDT/tYCIW/6F3XMhSmL0yA5htr2jCLM6NOimEs4ZDXOW6kfYK9EdxndSzU9XXIc98K6RuqpVtn467STX/tOl+QtnAoKT+gK1hBfHMbzVp2BbPyS6fOQ9YcDxmKPTVSPDgl0qIPEKxZFpN22CD1goEUnmlfE5XpwSD2zg4+LWWUpen6RB8NTE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJDVWOAhBbr6doac6uJNibuxZuT3AjaeE+wRFNuSrKg=;
 b=jlegFRE4LmgwsORTsv9iYGHog5a7yht6e3dDxZPMpwhsXEKY8REsNf7Ri5C18/cONUd17/oBnX+RskhNFLn1ZgiU4T5GHrGtvLeB1Nv8xpEFqbGvCNJjXBC7tWv/Y2fVTZJrBKyPNRL3EhcXbrordEaRF3vCyMVkdDw+YDrfUZGSXEIRrOJPdqBnLJvC6bS3F91FSD1d6XAE2jVU72+OKtiFFUxl4UjgPoO843CUhJTA/IFtzM4ag1T2I764EEG4Rrys0kb9Tim2PQpBN2hHdreucjSW1Ix1+pJQwGjyUXiBb0l27TH9QvxJUtUw3VFFloa9IWR2P4mtuIUx7zWLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4895.namprd02.prod.outlook.com
 (2603:10b6:805:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sun, 3 Oct
 2021 21:22:25 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7854:5fd7:d358:e0d9]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7854:5fd7:d358:e0d9%5]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 21:22:24 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 0/2] target/hexagon: Use tcg_constant_*
Thread-Topic: [PATCH 0/2] target/hexagon: Use tcg_constant_*
Thread-Index: AQHXt/By0hxx2G/3E0SlCssZkqDxdqvByV1Q
Date: Sun, 3 Oct 2021 21:22:24 +0000
Message-ID: <SN4PR0201MB8808D4BB26736509440524B3DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211003004750.3608983-1-f4bug@amsat.org>
In-Reply-To: <20211003004750.3608983-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40d45c96-2295-4591-f94c-08d986b3e502
x-ms-traffictypediagnostic: SN6PR02MB4895:
x-microsoft-antispam-prvs: <SN6PR02MB4895586E1B9BB48C716973FADEAD9@SN6PR02MB4895.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WHs+1VvPStWF8IPeLG5Swk70FALZv6FrjwpNn3g0bnT8HNke5pSOsMzlsQ134UT7Vh6af0FvJ0oxXT9BvcxdpOzJ6DEq/doEfgCkWXzIw1gmuE6u9qP1I+l2/bsz0SnKQmZbqjkrv7scFAaRPUVX0tjs6efig8XAwVh38IVp1b1vaf9QPDOX0dlJ58GiX8vsbncPhuK90jbp7cJ0HGu/lOQTogPj8eOO4S5qPqz2PYlVYFlNkrCI4UrrzRlsXh3gBHERWli/MLWnWeDzqjKWtfn9k7AJTf7GSoyS0SufsFdEUaAtUxKpwCKsJk2OGCvuWUWF9DflBmCh93tT/mD8AcGrn9GE8REiPs8GHII8GyVUk3DF+KurZN9Ap4vNu21x0PT9oO0vClcMGMcIDmx+9CW/v0Ro3obdBrwUj1PbWrHoE9Y5hrGl4TZuYsW2aiYQTUaCDMq5tgLOVh5lBE4hYUpvz8YdP18wdlJ3rNyNlaHymA+Fukxk3dAPotl/RnSe9aYQur1jQsW5dLMLwzC9j5GR+POavhuU0VgcvOUZVzYZWtvFOZDuYxkgIM1XXmrbdKeUztLfSaLXwN42lxjlWBR/StTDxZ2iIQ94NdUG7km24RLCeeDR0wKQf0c35vRt1y6VbSWj2Ue5BKvlTvOQDG3U4tooJsQnAKw4FK/z4rvk3KTxuDRV6UOkhg957lHN/X4d7HBRTGpsw9it5ehr7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(64756008)(55016002)(52536014)(76116006)(66946007)(186003)(66446008)(86362001)(26005)(9686003)(66476007)(4326008)(66556008)(71200400001)(83380400001)(122000001)(38100700002)(8676002)(8936002)(33656002)(7696005)(316002)(38070700005)(508600001)(2906002)(5660300002)(110136005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWU0ZzltY1FURW9Uc3l5Q3RHc1ZUcDc4WGZpU2F4MldyTytqb0ttRkxLUVVu?=
 =?utf-8?B?ZThCeGNmVG5uVVEwRktCV3ozRFcxVU1ldUtreEZSM25TVXhXVkx5eXFvZHJP?=
 =?utf-8?B?UVFOY2VyL251RzF2Y0NuV2RPdjcrT3M1Mk1BOStiWWZBU3llenYxQVlZbnBD?=
 =?utf-8?B?enVhMkxGN29rMkJuTVZ3S2tyRHYzQS9jeEhRVUwxeERTdDNsKzJBL2VPMFVE?=
 =?utf-8?B?L3ZBSTM3cEpObmJmNmtGS2Z4VEEyRGVGSUZTeUxLTmQ1SDN1TG1hR3M0NThl?=
 =?utf-8?B?Mk1Ld1d6TTF0bGZ0TlU0cklNUWFGQ0lVeHp3WXkzWmhuWC91dEVaY1pZMDZr?=
 =?utf-8?B?Y3VZalkrSG9STmR1K0pvOEpiVHlkSTBzUkZwdG1BaDFhKzZrVW1YaFBFcnhZ?=
 =?utf-8?B?dXFrb1BydnB2eWRFY2t2S3lTMU1iK1RRUUQ2L1JRSzcyV3ZMNWdUN1RQbjh1?=
 =?utf-8?B?RUd6aytXL3IzZ0JYY1E1cTI2ZE0xc0lBaE9POFRFVUhJaVpYQ0Fwc2RtWE0y?=
 =?utf-8?B?UVRrNVYvWWhSR1JRaS92MGxLdHBMZEZrUmlTc3MvRExzT0hLaFlZZjVQZCtT?=
 =?utf-8?B?QzkwdVBsR3pIcmtocUloTFJRNkcvQ2ppN3pVV3lVYVV2bk94eGxWQk1pMXVC?=
 =?utf-8?B?YUVLd3FYSHlMQkI4OXRNcTZoemFCM2tOWTg1T3FoZTBNaGZNYStGOUFyczdZ?=
 =?utf-8?B?VGQvRHFud2l1djdHTmRDb05tb1hMSVlNUlVmNmtqUXFKOElrK3cwVnFFUTQ5?=
 =?utf-8?B?UncwZ3VWSU02bU9OL3dGNWVGYUdsbjJCdHVxK2V6MEN6bys1M1h1Z2NTTUYw?=
 =?utf-8?B?RXhQUndnVTltR0Evbm1Lcklnd3V2MnowVXVBMkMybituV2E3ZG5YTDRReGJ5?=
 =?utf-8?B?ZnBmMTJqaU9vdzNGUHRhOC93TDBsbThsRFpwZkFHSktEU2t0ZkJsczhiMGVk?=
 =?utf-8?B?Mmg5ZFpBbXFTVERGem56NW5NUUVWVjloMklOMlBZSGl3THNnYjhHekk2SzJW?=
 =?utf-8?B?YVdtUk9IU0hxakdTM1A1QnFvM1RFWk5JRW9XVjVCKzMwaU5rcVdjYmFuVXJT?=
 =?utf-8?B?TTlaMm9nS3hEbmJFa2h3b09aUEIvWDg5SnJucmZSS0oyWGgyMHhjVk9LU3hE?=
 =?utf-8?B?aE9XdE1jUnBYRFRQSVorN3puWmhXWWVoWnJYcURyeWlrOE05ck9Qai9LS1FV?=
 =?utf-8?B?UWpkMHRTM3g0a0lHc3Bnd1N6TGpFREY3M0tiUDhQOVV4U252Z1kvdXMrVWwv?=
 =?utf-8?B?Z2pIWCtxbnVUTDZscDlHeFlub1p3eG1DSjdZcHZMUEhyR1ljaHB0bnVzMm82?=
 =?utf-8?B?TXgzeFFOUkdOYVo0VnVTOGtxZ0V2SVBwcmxMOHRMaXR4NEo0d3IvV3JpM2VP?=
 =?utf-8?B?ZWY4dFlkRURMdlc2NnhrMXo5dVhoNzI1OVE1cy9FZmtoY3E1QzhYNlpjUlIv?=
 =?utf-8?B?YlN1bUwvOUtuYldWdUtESzVocVVVbUl4RXFaTWR5Wm43dk1Ca2FxNjRvVkNU?=
 =?utf-8?B?M0dHNkVKeHlPMUk5SFhqbk43U2d4V0R4bWRMZm1PVFZXU2l2dDB2NXNUYUR6?=
 =?utf-8?B?cHBNM2xOWFk2Y29JY2xOZHRXcEZXUC9VOWNYQWx2SEVQVWF1OUl5ZXAyRGJj?=
 =?utf-8?B?bStsRE1Za0VDRnRnZU80Skd2bUZMenhnaGliTmxVakl2Z0VIdG5UM1lrbVdn?=
 =?utf-8?B?WmVCSEdDTGlQcjZpdTA3Znc1dzdtakIxUHZjS0ZXeDJQYW9pS3ZBYUFrcGZa?=
 =?utf-8?Q?XOZyEtkhI4D37msUaDgA2dRDMeAFr7CLnqz41GZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d45c96-2295-4591-f94c-08d986b3e502
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2021 21:22:24.8623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3g9okmP8DJfZ6LUE10IHiSf5mEQUa+bFd/CKERwdgJqviQWRVETPz64fFbKDLWq3I/tvlip0HPJ0m4qWAKT37Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4895
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogU2F0dXJkYXksIE9jdG9iZXIgMiwg
MjAyMSA3OjQ4IFBNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFJpY2hhcmQgSGVuZGVyc29uDQo+IDxyaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gPGY0
YnVnQGFtc2F0Lm9yZz4NCj4gU3ViamVjdDogW1BBVENIIDAvMl0gdGFyZ2V0L2hleGFnb246IFVz
ZSB0Y2dfY29uc3RhbnRfKg0KPiANCj4gUmVwbGFjZSB0ZW1wb3JhcnkgVENHIHJlZ2lzdGVycyBi
eSB0Y2dfY29uc3RhbnRfKigpIHdoZW4gcG9zc2libGUuDQo+IA0KPiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSAoMik6DQo+IA0KPiAgIHRhcmdldC9oZXhhZ29uOiBSZW1vdmUgdW51c2VkIFRDRyB0
ZW1wb3JhcnkgZnJvbSBwcmVkaWNhdGVkIGxvYWRzDQo+ICAgdGFyZ2V0L2hleGFnb246IFVzZSB0
Y2dfY29uc3RhbnRfKg0KDQoNClRoYW5rcyBQaGlsaXBwZSENCg0KSSdsbCBpbmNsdWRlIHRoZXNl
IGluIG15IG5leHQgSGV4YWdvbiBwdWxsIHJlcXVlc3QuDQoNClRheWxvcg0KDQo=

