Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0347D7D2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:36:48 +0100 (CET)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07Pq-0006xj-Qd
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:36:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n07Ih-0002yf-4D
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:29:23 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:21283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n07Ie-0006Sw-BP
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640201360; x=1640806160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kYIKpmgmPLF9yX12aomTIIXGScug7DVT4WbdV/A+fgI=;
 b=NRxaM5om2yHNF15fVS2g27xGSBq2viAxPDDYOEMilLLFCnQRezHfAoRw
 JaudhqnsnUKEND7eYOvfTdBokNjxBtXC+Ny/YYErhg9NQ0fJYwKqYDh9s
 P5YI8JwFmfYChcdweccd4iUlwZn+0YsD4KqjoO09Kg9R1qO7YV7WKVE3o Q=;
Received: from mail-dm6nam08lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 19:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8EMWyWxahNcQ5wUen5IDPc+zCYfRI+TTOusxj7cvTLbRQ8jmrxfv2fBjMFxSb8T1ffga86FEt7QGbq7hCOor+qJejlhqJdtc+0RZEHjJBy7lXBJeTXtUnHVBJbo4jzaVpQ6xFPenYITQ7Wi7e5X0iBTSVALQmcMadwAzX3RPbW2HKn0Q+SbGxDxsJTEJai6QEDzZmhQJO9IqhUmltGjzNVFjAZtWQarl0Bflg6cMU97Z4duIDfSbaKnVGFfKwhMmeDymNVg/wgGrYj+ytmHTl3HsZ+kVfwMF4Fj4Cf6FY5WHVk6lIgCUDrQSuMLB49+cG0yKD1KRKa1fcS8DLW16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYIKpmgmPLF9yX12aomTIIXGScug7DVT4WbdV/A+fgI=;
 b=XU711Sz/585SOqCSzlytzl2jX8q7XXATHiRLOH33n4koFVY7QxSUhiuiFbFE+osBDdeviSEAfGwM9Sih3lIn9ccH4slHZj6MeMlx+cDOoQfZctiAEUy/JB/UjJ82hvsBGuU6YeUM2s3irZ6M3JNKsIb3NSdnaFHD4kU+NWy+U1rCtu6qQW/kozWvLn8Zo11erk6Oexva4+tTM6QJC0NBXhpwfLcWJu7EpW/eaEZW9eF+GG897b32Qb3LIj+a9uNmPs+dVSk6xKAsBp6liqWv7CLb5XOEnf9md5luGclvb6hiua4P/L0dJ3x5oJRyFC0sVDpHc6mPRBh0NjqkrQojCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SA2PR02MB7625.namprd02.prod.outlook.com
 (2603:10b6:806:143::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:29:09 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:29:09 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 05/13] target/hexagon: introduce new helper functions
Thread-Topic: [PATCH v7 05/13] target/hexagon: introduce new helper functions
Thread-Index: AQHX8yS8d+0zBDNHnk+YfXywBOdpBqw+36Uw
Date: Wed, 22 Dec 2021 19:29:09 +0000
Message-ID: <SN4PR0201MB880814522737BC97CD21ED29DE7D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-6-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-6-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f034baaa-9fea-4f9b-98d5-08d9c58153c0
x-ms-traffictypediagnostic: SA2PR02MB7625:EE_
x-microsoft-antispam-prvs: <SA2PR02MB7625BC8807AC048E57769BDADE7D9@SA2PR02MB7625.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8+cBs+N4q71m4KlxnAEJs8siDv2sQchZjFJW918eropF6HxCsYtwd8Wk66v1YMD5MoKDKoBzP1dahEksBWfbAo9D2HmoQlsE+2001M9DhDD7l7w3fMso1gkOKq3qqg8QpT8GY8ZATVk2LyFpsUZpcgP9grM18COL8e6YB+Hg/jG8cZrdiHrS+r1wGuwMlplX7+25wn6Tge+k1NJc6u98zlciiD4eradTi1F2RqA2k1vspTZw/vxqgcleLZEqCbDvt/L16dy9/60slJL7TvDXs4Cqu3f3uIHsZB+fgWz221QPvRYSMrmWLz5bRcLxAg59+abygdBFAWHDtxIFIjqJu4tuiqZX7Tx4kIrJp4Bi4DLpH9Ze466N+YBNeAbXwnD0aw80I6K3CdDqk2A/SQ5PLHErJd752wA2Jwhz+bs0txHAV74pbO3UfB5CwcUX+GCq0T3UvuaREuFOkjTl8ecv8bY0KViBlvWeh6KTXcTON1YWKh2y4hFXPWf09HoPSIgKmuHNUlPeRzMm2wDoAoDC9EtzQrcBQV195mRsCW9SIb03wmoJuwDnyoVl8Kl9NjGWmxsZRWUe7kOfodKemSmQFjGkOGCsenWe3i1yWWHQmHjRH9qKqg0b6A61zpgCKfFmsntFqm+ar1cXqyLT4LIwS7oQDeVRNiGUdcTf6KZwYm9JdEpJOc91P8yBSWV3FQHT+EhQ91HEKI74EN8ZE4cu8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6506007)(26005)(52536014)(110136005)(76116006)(66946007)(186003)(122000001)(53546011)(9686003)(2906002)(71200400001)(33656002)(66556008)(8676002)(83380400001)(8936002)(316002)(86362001)(7696005)(54906003)(38100700002)(64756008)(66446008)(508600001)(4326008)(5660300002)(38070700005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzcwM1lkMkMrYzJ5ZDdRWXpaeDJCVVhlTTJTNkxkaGMxSG9ncjlkbVVkNTJS?=
 =?utf-8?B?SFFRa29JK2lLN1pTUmRVTGpCSmtCMDY0bWUrVStDKzZYNTk1aHNCUnNnUVNI?=
 =?utf-8?B?ZzlnbTVZb3dOeDlWNUg2RFdtVHcwVkdnMkJYaHJmQWxJa1ViWklzRUlqWi9H?=
 =?utf-8?B?enBWejJsWDFRMG1sSE1rTFZoWlNiK1RjQVB2aEhFNnBtUVZXTkJmOGc1MzB2?=
 =?utf-8?B?SkNiWlVpSkI4TGR6QjlkS2o3T3NRSi9vdFlQbnFUR2RaY09IR3ZNem5PbXdn?=
 =?utf-8?B?Q25ENHlKVmhVQW5tTEVHOXJCc3hER05uVy96VWIrY3RNdjRPYythdC9QdXpa?=
 =?utf-8?B?bUpRaHFDWDlhc1BDQm1iOUo5Q3dxNC9RSTBlbHVDODZlajkwTFcwdGNVNFBI?=
 =?utf-8?B?Z1NHNXB5QzZYR0h3WUxSOHJSSXhhQjFiR29XWmRrVzBGR2lQR0JZbjlXV3Js?=
 =?utf-8?B?OVBkWlVaUS9kSlFCVGZlU1g0bmhVck1zb1p0QWc1UFFlSkpFMWJyZFZSVHZl?=
 =?utf-8?B?QTVUZWR2VXkxSFZzS0tTZHJxZXVWK3Nqb2k2SytQZTlRaEZaMzZBY0lTVTZj?=
 =?utf-8?B?S0luaktqcVhJYkJOL0t3dTFVN1VZNzEwWEFIVE0xM1YxTlloUWlwSHd5bEhN?=
 =?utf-8?B?Q1pLKy95N3FCTmpCMnl0ZE1QZnU2dkJlMk91WFBRZVlXY3liV3NGeWVoZ3Ri?=
 =?utf-8?B?MXVYaHUwODR4UHRVakVpaDdOdFZwVkdBU0x2aWZNazUrbFNLNFhLczNvTllv?=
 =?utf-8?B?TzNjbEZxM0d4WU5yUVBwdmlsTFBMUVJ1eUhvRTg3ZGswUjBzbTdac2dLUEpR?=
 =?utf-8?B?bGRNMFJIcjdadVhUT3o4ckRwZkoxKzltQ2MrMldQV2g5WVF1SGQycmVKYVZr?=
 =?utf-8?B?TEc3RkVUTCtKZkxzNGlibTZqeG5QWERDOTFKc2pXMEsvNTZqYlQ2c2toU2o5?=
 =?utf-8?B?SzZlcVdRZ3hBOUN3WHA5L25GVVZxNXZ3ZTFyb0hlSXJPSFRmbXV2eUd1Z2w3?=
 =?utf-8?B?SHhRYzhaZG1RZGROdjBaajEyRmRIZHU3TU9kWVRtTGxPTVRPVE1ITkdTcnI4?=
 =?utf-8?B?OWxBTU1xQ0hrb25Eb0duZmtDUkxmckx4dUlYcm42SllOcDB3cTJVV2NpU3pF?=
 =?utf-8?B?b0hRWUREN3VkSnlnT3lYMXc0UnUrVzJEMHh3WVRxNUZXRnpiVGVPbFZJOWZs?=
 =?utf-8?B?WnhZdjVTcFJKUnM2ZmJmRldrVU1uRldrc0lvUWM5SU03Zy9XM2ljQmJGcVRi?=
 =?utf-8?B?VkhpK0tFZnZwMFlIRXlQU3BCVE9DVURpekxDMDZ3ZjFOek1ML1g4WUxjRStH?=
 =?utf-8?B?WVQyWTJBRHZ3Z3RDZW1VSm1XNUtERnh1WHovOEFtL1dJNC9yL1NwcGtKcnVs?=
 =?utf-8?B?Sk5JQ2xZRHdMOE9adEFTSExhclliaDlKazZYMmYzS3hGaVYxei8yNTRlQ3NH?=
 =?utf-8?B?aGd0Ukp6SWFPTXVnZUhmQjlTcnFzUThSZDJ6QWcySUdJRlROWEN4YzdEOHM2?=
 =?utf-8?B?eVRVaFViVTFtSG40UWx0UGMyYnI5b2ZmU05BVFZ4RUhGMkdYMk1SNE1kTGI5?=
 =?utf-8?B?dTF3TXVrZnpFbHdyWHZ3dVBrblVEK25sQ0YrQllIUGhSaXlhUHlLc3BwUTJx?=
 =?utf-8?B?K2tWZC9UQUpLRHd5TGpTTVE2QjJ5Slh5ODV4OUlSanRWV0NHNkZmSXVIRUx3?=
 =?utf-8?B?YlEva1pqeVR5NzZyZ1hqb1QyaVJXVlBBVTgvUlhFT3RpOWNXbUFEVDE2LzJp?=
 =?utf-8?B?bDV0aG51eW1iZUJkWDU1V25PeW5BZ2pVZUJIMjdsZDdHN3h6SURUL2c3Vld2?=
 =?utf-8?B?Q1dQK1NQUWE4dzNXM0lvaW9qOGVGb0FIb1JWM1cwV24rMXRaUkxIemFMN3li?=
 =?utf-8?B?MEUreThGWG9MVHFMdE43VTFjL0M5WW9RaHZ2OCtkS0gwVDh5YnYvK3V5U3ox?=
 =?utf-8?B?QWNTSlg3dnNrOG9XSkpBcDY3VXdsZWVzTk9Xb2w4YzVvOWEwUHlxMDM2aGxl?=
 =?utf-8?B?WmZob1RnZjYwSGRoNEFpSDY2R2RKcTExSkEvMmhiQWJnUG5DUzZZWHgrSDB0?=
 =?utf-8?B?UHNXYjZuU0kwbEV1cmIySlIvazRZb1ZQd0JLak1pMVg3TlZDOTRTbS93QUZU?=
 =?utf-8?B?NHZZdXJxdnpOa1F6L3NOcG96Q0Rwc3RjNUdlbkt1Y1h4aER6S1gwQkMyT1NN?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f034baaa-9fea-4f9b-98d5-08d9c58153c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 19:29:09.4970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nG9x4I9F2XC+c4HL9GYjE1b2DzjaSqFm5XBxS5kzJMlZ6e7lwMKjUb0GGhJLhLv67syh7f+OA2VZlMaqJjYe7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7625
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxNywgMjAyMSAyOjAxIEFN
DQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsZUByZXYubmc7IFRheWxvciBT
aW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNp
bmMuY29tPjsgYmFidXNoQHJldi5uZzsgbml6em9AcmV2Lm5nOw0KPiByaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCB2NyAwNS8xM10gdGFyZ2V0L2hleGFnb246
IGludHJvZHVjZSBuZXcgaGVscGVyIGZ1bmN0aW9ucw0KPiANCj4gRnJvbTogTmljY29sw7IgSXp6
byA8bml6em9AcmV2Lm5nPg0KPiANCj4gVGhlc2UgaGVscGVycyB3aWxsIGJlIGVtcGxveWVkIGJ5
IHRoZSBpZGVmLXBhcnNlciBnZW5lcmF0ZWQgY29kZS4NCj4gIkhlbHBlciIgY2FuIGhlcmUgbWVh
biB0d28gdGhpbmdzLCBhIGhlbHBlciBpbiB0aGUgUUVNVSBzZW5zZSBhZGRlZCB0bw0KPiBgaGVs
cGVyLmhgIGFuZCBgb3BfaGVscGVyLmNgLCBidXQgYWxzbyBoZWxwZXIgZnVuY3Rpb25zIHByb3Zp
ZGluZyBhIG1hbnVhbA0KPiBUQ0cgaW1wbGVtZW50YXRpb24gb2YgYSBjZXJ0YWluIGZlYXR1cmVz
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxlc3NhbmRybyBEaSBGZWRlcmljbyA8YWxlQHJldi5u
Zz4NCj4gU2lnbmVkLW9mZi1ieTogTmljY29sw7IgSXp6byA8bml6em9AcmV2Lm5nPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRvbiBKb2hhbnNzb24gPGFuam9AcmV2Lm5nPg0KPiAtLS0NCj4gIHRhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jICAgIHwgMTY2DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4gIHRhcmdldC9oZXhhZ29uL2dlbnB0ci5oICAgIHwgIDE2ICsrKy0NCj4g
IHRhcmdldC9oZXhhZ29uL2hlbHBlci5oICAgIHwgICAyICsNCj4gIHRhcmdldC9oZXhhZ29uL21h
Y3Jvcy5oICAgIHwgICA5ICsrDQo+ICB0YXJnZXQvaGV4YWdvbi9vcF9oZWxwZXIuYyB8ICAxMCAr
KysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTk1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgYi90YXJnZXQvaGV4
YWdvbi9nZW5wdHIuYyBpbmRleA0KPiANCj4gK3ZvaWQgZ2VuX3NhdF9pNjQoVENHdl9pNjQgZGVz
dCwgVENHdl9pNjQgc291cmNlLCBpbnQgd2lkdGgpIHsNCj4gKyAgICBUQ0d2X2k2NCBtYXhfdmFs
ID0gdGNnX2NvbnN0X2k2NCgoMSA8PCAod2lkdGggLSAxKSkgLSAxKTsNCj4gKyAgICBUQ0d2X2k2
NCBtaW5fdmFsID0gdGNnX2NvbnN0X2k2NCgtKDEgPDwgKHdpZHRoIC0gMSkpKTsNCg0KRG9pbmcg
dGhvc2UgY2FsY3VsYXRpb25zIGFzIDMyLWJpdCBudW1iZXJzIGNvdWxkIGJlIHJpc2t5LiAgRWl0
aGVyIGRvIHRoZSBjYWxjdWxhdGlvbnMgaW4gNjQtYml0cyAoMUxMIDw8ICh3aWR0aCAtMSkgLTFM
TCkgb3IgYXNzZXJ0IHRoYXQgd2lkdGggPD0gMzIuDQoNCkFsc28sIGNvbnNpZGVyIGNoYW5naW5n
IGFsbCB0aGUgdGNnX2NvbnN0XyogdG8gdGNnX2NvbnN0YW50XyouICBUaGlzIGlzIG5ldyBpbiBU
Q0cgYW5kIGxldHMgeW91IGF2b2lkIHRoZSB0Y2dfdGVtcF9mcmVlIGF0IHRoZSBlbmQuDQoNCj4g
KyAgICB0Y2dfZ2VuX3NtaW5faTY0KGRlc3QsIHNvdXJjZSwgbWF4X3ZhbCk7DQo+ICsgICAgdGNn
X2dlbl9zbWF4X2k2NChkZXN0LCBkZXN0LCBtaW5fdmFsKTsNCj4gKyAgICB0Y2dfdGVtcF9mcmVl
X2k2NChtYXhfdmFsKTsNCj4gKyAgICB0Y2dfdGVtcF9mcmVlX2k2NChtaW5fdmFsKTsNCj4gK30N
Cj4gKw0KPiArdm9pZCBnZW5fc2F0dV9pNjQoVENHdl9pNjQgZGVzdCwgVENHdl9pNjQgc291cmNl
LCBpbnQgd2lkdGgpIHsNCj4gKyAgICBUQ0d2X2k2NCBtYXhfdmFsID0gdGNnX2NvbnN0X2k2NCgo
MSA8PCB3aWR0aCkgLSAxKTsNCg0KU2FtZSBjb21tZW50IGFib3V0IHRoaXMgY29uc3RhbnQuDQoN
Cj4gKyAgICB0Y2dfZ2VuX21vdmNvbmRfaTY0KFRDR19DT05EX0dUVSwgZGVzdCwgc291cmNlLCBt
YXhfdmFsLA0KPiBtYXhfdmFsLCBzb3VyY2UpOw0KPiArICAgIFRDR3ZfaTY0IHplcm8gPSB0Y2df
Y29uc3RfaTY0KDApOw0KDQpRRU1VIGNvZGluZyBjb252ZW50aW9ucyBjYWxsIGZvciBkZWNsYXJh
dGlvbnMgdG8gYmUgYXQgdGhlIHRvcCBvZiB0aGUgZnVuY3Rpb24sIG5vdCBpbiB0aGUgbWlkZGxl
Lg0KDQo+ICsgICAgdGNnX2dlbl9tb3Zjb25kX2k2NChUQ0dfQ09ORF9MVCwgZGVzdCwgc291cmNl
LCB6ZXJvLCB6ZXJvLCBkZXN0KTsNCj4gKyAgICB0Y2dfdGVtcF9mcmVlX2k2NChtYXhfdmFsKTsN
Cj4gKyAgICB0Y2dfdGVtcF9mcmVlX2k2NCh6ZXJvKTsNCj4gK30NCj4gKw0KPiArdm9pZCBnZW5f
c2F0dV9pNjRfb3ZmbChUQ0d2IG92ZmwsIFRDR3ZfaTY0IGRlc3QsIFRDR3ZfaTY0IHNvdXJjZSwg
aW50DQo+ICt3aWR0aCkgew0KPiArICAgIGdlbl9zYXRfaTY0KGRlc3QsIHNvdXJjZSwgd2lkdGgp
Ow0KDQpnZW5fc2F0dV9pNjQNCg0KPiArICAgIFRDR3ZfaTY0IG92ZmxfNjQgPSB0Y2dfdGVtcF9u
ZXdfaTY0KCk7DQo+ICsgICAgdGNnX2dlbl9zZXRjb25kX2k2NChUQ0dfQ09ORF9ORSwgb3ZmbF82
NCwgZGVzdCwgc291cmNlKTsNCj4gKyAgICB0Y2dfZ2VuX3RydW5jX2k2NF90bChvdmZsLCBvdmZs
XzY0KTsNCj4gKyAgICB0Y2dfdGVtcF9mcmVlX2k2NChvdmZsXzY0KTsNCj4gK30NCj4gKw0KPiAr
LyogSW1wbGVtZW50cyB0aGUgZkFERFNBVDY0IG1hY3JvIGluIFRDRyAqLyB2b2lkDQo+ICtnZW5f
YWRkX3NhdF9pNjQoVENHdl9pNjQgcmV0LCBUQ0d2X2k2NCBhLCBUQ0d2X2k2NCBiKSB7DQo+ICsg
ICAgVENHdl9pNjQgc3VtID0gdGNnX3RlbXBfbG9jYWxfbmV3X2k2NCgpOw0KPiArICAgIHRjZ19n
ZW5fYWRkX2k2NChzdW0sIGEsIGIpOw0KPiArDQo+ICsgICAgVENHdl9pNjQgeG9yID0gdGNnX3Rl
bXBfbmV3X2k2NCgpOw0KPiArICAgIHRjZ19nZW5feG9yX2k2NCh4b3IsIGEsIGIpOw0KPiArDQo+
ICsgICAgVENHdl9pNjQgbWFzayA9IHRjZ19jb25zdGFudF9pNjQoMHg4MDAwMDAwMDAwMDAwMDAw
VUxMKTsNCj4gKw0KPiArICAgIFRDR3ZfaTY0IGNvbmQxID0gdGNnX3RlbXBfbG9jYWxfbmV3X2k2
NCgpOw0KDQpUaGlzIGNhbiBiZSBqdXN0IHRjZ190ZW1wX25ld19pNjQuDQoNCj4gKyAgICB0Y2df
Z2VuX2FuZF9pNjQoY29uZDEsIHhvciwgbWFzayk7DQo+ICsgICAgdGNnX3RlbXBfZnJlZV9pNjQo
eG9yKTsNCj4gKw0KPiArICAgIFRDR3ZfaTY0IGNvbmQyID0gdGNnX3RlbXBfbG9jYWxfbmV3X2k2
NCgpOw0KPiArICAgIHRjZ19nZW5feG9yX2k2NChjb25kMiwgYSwgc3VtKTsNCj4gKyAgICB0Y2df
Z2VuX2FuZF9pNjQoY29uZDIsIGNvbmQyLCBtYXNrKTsNCj4gKw0KPiArICAgIFRDR0xhYmVsICpu
b19vdmZsX2xhYmVsID0gZ2VuX25ld19sYWJlbCgpOw0KPiArICAgIFRDR0xhYmVsICpvdmZsX2xh
YmVsID0gZ2VuX25ld19sYWJlbCgpOw0KPiArICAgIFRDR0xhYmVsICpyZXRfbGFiZWwgPSBnZW5f
bmV3X2xhYmVsKCk7DQo+ICsNCj4gKyAgICB0Y2dfZ2VuX2JyY29uZGlfaTY0KFRDR19DT05EX05F
LCBjb25kMSwgMCwgbm9fb3ZmbF9sYWJlbCk7DQo+ICsgICAgdGNnX3RlbXBfZnJlZV9pNjQoY29u
ZDEpOw0KPiArICAgIHRjZ19nZW5fYnJjb25kaV9pNjQoVENHX0NPTkRfTkUsIGNvbmQyLCAwLCBv
dmZsX2xhYmVsKTsNCj4gKyAgICB0Y2dfdGVtcF9mcmVlX2k2NChjb25kMik7DQo+ICsgICAgdGNn
X2dlbl9icihub19vdmZsX2xhYmVsKTsNCg0KVGhpcyBpcyByZWR1bmRhbnQgc2luY2UgdGhlIGxh
YmVsIGlzIGp1c3QgYWZ0ZXIgdGhlIGp1bXAuDQoNCj4gKw0KPiArICAgIGdlbl9zZXRfbGFiZWwo
bm9fb3ZmbF9sYWJlbCk7DQo+ICsgICAgdGNnX2dlbl9tb3ZfaTY0KHJldCwgc3VtKTsNCj4gKyAg
ICB0Y2dfZ2VuX2JyKHJldF9sYWJlbCk7DQo+ICsNCj4gKyAgICBnZW5fc2V0X2xhYmVsKG92Zmxf
bGFiZWwpOw0KPiArICAgIFRDR3ZfaTY0IGNvbmQzID0gdGNnX3RlbXBfbmV3X2k2NCgpOw0KPiAr
ICAgIHRjZ19nZW5fYW5kX2k2NChjb25kMywgc3VtLCBtYXNrKTsNCj4gKyAgICB0Y2dfdGVtcF9m
cmVlX2k2NChtYXNrKTsNCj4gKyAgICB0Y2dfdGVtcF9mcmVlX2k2NChzdW0pOw0KPiArICAgIFRD
R3ZfaTY0IG1heF9wb3MgPSB0Y2dfY29uc3RhbnRfaTY0KDB4N0ZGRkZGRkZGRkZGRkZGRkxMKTsN
Cj4gKyAgICBUQ0d2X2k2NCBtYXhfbmVnID0gdGNnX2NvbnN0YW50X2k2NCgweDgwMDAwMDAwMDAw
MDAwMDBMTCk7DQo+ICsgICAgVENHdl9pNjQgemVybyA9IHRjZ19jb25zdGFudF9pNjQoMCk7DQo+
ICsgICAgdGNnX2dlbl9tb3Zjb25kX2k2NChUQ0dfQ09ORF9ORSwgcmV0LCBjb25kMywgemVybywg
bWF4X3BvcywNCj4gbWF4X25lZyk7DQo+ICsgICAgdGNnX3RlbXBfZnJlZV9pNjQobWF4X3Bvcyk7
DQo+ICsgICAgdGNnX3RlbXBfZnJlZV9pNjQobWF4X25lZyk7DQo+ICsgICAgdGNnX3RlbXBfZnJl
ZV9pNjQoemVybyk7DQo+ICsgICAgdGNnX3RlbXBfZnJlZV9pNjQoY29uZDMpOw0KPiArICAgIFNF
VF9VU1JfRklFTEQoVVNSX09WRiwgMSk7DQo+ICsgICAgdGNnX2dlbl9icihyZXRfbGFiZWwpOw0K
DQpUaGlzIGlzIGFsc28gcmVkdW5kYW50Lg0KDQo+ICsNCj4gKyAgICBnZW5fc2V0X2xhYmVsKHJl
dF9sYWJlbCk7DQo+ICt9DQo+ICsNCg0KDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvaGV4YWdvbi9v
cF9oZWxwZXIuYyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jDQo+IGluZGV4IDcyMmExMTUw
MDcuLmZjMzg0NGM4ZDEgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5j
DQo+ICsrKyBiL3RhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jDQo+IEBAIC0zNDEsNiArMzQxLDE2
IEBAIHVpbnQzMl90IEhFTFBFUihmYnJldikodWludDMyX3QgYWRkcikNCj4gICAgICByZXR1cm4g
ZGVwb3NpdDMyKGFkZHIsIDAsIDE2LCByZXZiaXQxNihhZGRyKSk7ICB9DQo+IA0KPiArdWludDMy
X3QgSEVMUEVSKGZicmV2XzMyKSh1aW50MzJfdCBhZGRyKSB7DQo+ICsgICAgcmV0dXJuIHJldmJp
dDMyKGFkZHIpOw0KPiArfQ0KPiArDQo+ICt1aW50NjRfdCBIRUxQRVIoZmJyZXZfNjQpKHVpbnQ2
NF90IGFkZHIpIHsNCj4gKyAgICByZXR1cm4gcmV2Yml0NjQoYWRkcik7DQo+ICt9DQo+ICsNCg0K
VGhlc2UgYXJlIG9ubHkgdXNlZCBpbiBhIGhhbmRmdWwgb2YgaW5zdHJ1Y3Rpb25zLiAgSXQgd291
bGQgYmUgYmV0dGVyIHRvIGxldCB0aG9zZSB1c2UgdGhlIGV4aXN0aW5nIGdlbmVyYXRvciB0byBj
cmVhdGUgaGVscGVycyBmb3IgdGhlIGZ1bGwgaW5zdHJ1Y3Rpb24uDQoNCkhlcmUgYXJlIHRoZSBp
bnN0cnVjdGlvbnMgaW4gcXVlc3Rpb246DQpRNklOU04oUzJfYnJldiwJIlJkMzI9YnJldihSczMy
KSIsICAgQVRUUklCUyhBX0FSQ0hWMiksICJCaXQgUmV2ZXJzZSIse1JkViA9IGZCUkVWXzQoUnNW
KTt9KQ0KUTZJTlNOKFMyX2JyZXZwLCJSZGQzMj1icmV2KFJzczMyKSIsIEFUVFJJQlMoKSwgIkJp
dCBSZXZlcnNlIix7UmRkViA9IGZCUkVWXzgoUnNzVik7fSkNClE2SU5TTihTMl9jdDAsICAiUmQz
Mj1jdDAoUnMzMikiLCAgICBBVFRSSUJTKEFfQVJDSFYyKSwgIkNvdW50IFRyYWlsaW5nIix7UmRW
ID0gZkNMMV80KH5mQlJFVl80KFJzVikpO30pDQpRNklOU04oUzJfY3QxLCAgIlJkMzI9Y3QxKFJz
MzIpIiwgICAgQVRUUklCUyhBX0FSQ0hWMiksICJDb3VudCBUcmFpbGluZyIse1JkViA9IGZDTDFf
NChmQlJFVl80KFJzVikpO30pDQpRNklOU04oUzJfY3QwcCwgIlJkMzI9Y3QwKFJzczMyKSIsICAg
QVRUUklCUygpLCAiQ291bnQgVHJhaWxpbmciLHtSZFYgPSBmQ0wxXzgofmZCUkVWXzgoUnNzVikp
O30pDQpRNklOU04oUzJfY3QxcCwgIlJkMzI9Y3QxKFJzczMyKSIsICAgQVRUUklCUygpLCAiQ291
bnQgVHJhaWxpbmciLHtSZFYgPSBmQ0wxXzgoZkJSRVZfOChSc3NWKSk7fSkNClE2SU5TTihBNF90
bGJtYXRjaCwiUGQ0PXRsYm1hdGNoKFJzczMyLFJ0MzIpIixBVFRSSUJTKEFfTk9URV9MQVRFUFJF
RCxBX1JFU1RSSUNUX0xBVEVQUkVEKSwNCiJEZXRlY3QgaWYgYSBWQS9BU0lEIG1hdGNoZXMgYSBU
TEIgZW50cnkiLA0Kew0KICAgIGZISURFKHNpemU0dV90IFRMQkhJOyBzaXplNHVfdCBUTEJMTzsg
c2l6ZTR1X3QgTUFTSzsgc2l6ZTR1X3QgU0laRTspDQogICAgTUFTSyA9IDB4MDdmZmZmZmY7DQog
ICAgVExCTE8gPSBmR0VUVVdPUkQoMCxSc3NWKTsNCiAgICBUTEJISSA9IGZHRVRVV09SRCgxLFJz
c1YpOw0KICAgIFNJWkUgPSBmTUlOKDYsZkNMMV80KH5mQlJFVl80KFRMQkxPKSkpOw0KICAgIE1B
U0sgJj0gKDB4ZmZmZmZmZmYgPDwgMipTSVpFKTsNCiAgICBQZFYgPSBmOEJJVFNPRihmR0VUQklU
KDMxLFRMQkhJKSAmJiAoKFRMQkhJICYgTUFTSykgPT0gKFJ0ViAmIE1BU0spKSk7DQoJZkhJREUo
TUFSS19MQVRFX1BSRURfV1JJVEUoUGROKSkNCn0pDQoNCg==

