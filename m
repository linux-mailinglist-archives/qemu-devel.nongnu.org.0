Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72C14432CD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:36:12 +0100 (CET)
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwlg-0003HX-35
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mhwJ6-0000D9-T2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:40 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:18119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mhwIp-00050p-3a
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635869182; x=1636473982;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=26bqxHaZ+i7jucdUxw9qiTqgT6QE7DBHEE1kNKahYgg=;
 b=WgEUy1Sv/l1KmERjUHErO9Q27fw2AngJocNW1uJQC9HDhsbdak4OHQTg
 KsbtlEAErEy6dbK30yE7/RFDlWqcfUitv7GB94xKlBmTwNSK41SZsYYID
 CwAyioxZwJykCPwME6uMvdhSX/shbi1c2wq1EQerCO0Xl0yiaI5Qj6Yt4 o=;
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 16:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqyX3pJ1Uz0FpfUWIDTFywFmdWUQ1XjI46ph6Yyc6Kzv2sYW5z6DMkyN9wOjq3QvTOCiK3Wms/Oh4F5/6zupROmJWySUXF12wPbOXYCIm7kwsU2fE7D/HDfLcicj+cQU5LSL1nJ2eikVyoOvPZHfXX/RB4Tb6CK76wthN7lXyU7GWNDvqwJ1Z5BFvsYC/Rs5zCLplpE9fNNuQ1PP+snrsNgdGGZtEaA2z8nY8qPh9q6m3M+xi856zNOc1rPwuupacTpd6yy3Lmr9LtJLRzEyvhCVMdOTjeR+ifgHZe8WOZKbU+6omeaOuSjYrKlkG799l0GKim2Rv39UJ6BEWs7dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26bqxHaZ+i7jucdUxw9qiTqgT6QE7DBHEE1kNKahYgg=;
 b=n47RIq+SF2QrP7DfAf48A9PDSwfsyppff8dhrs60evOMf6mw4k94F+iQ29lPvUjrL4EsQZgS1WsMdfK/4qcexmc4NUGMpePcoZdQmiNSdPJXKldM+x/JfZWyyxZjJb55fQHxUTgZgnCrgygCleUmP9ix8mE3ed+zfqOmlP+quPBbhFE6sdT8zP+Z2EZS+afWMluboj6UvVYpZVeplXS46jlEf9aXMJJoG73KSESqnVBihv9iYKslIzg/KXL1K1vQ8lOZbGI0Xy25k4p31Ka3S2Z8o5/l5luIb/dNuQxizdKrQzqS1zEHasLjS/gKNLoB6EeI5ziRq5URktHH8v3PNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4670.namprd02.prod.outlook.com
 (2603:10b6:805:98::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Tue, 2 Nov
 2021 16:05:23 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::b858:f47d:4ad1:1a04%5]) with mapi id 15.20.4649.018; Tue, 2 Nov 2021
 16:05:23 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
 <alex.bennee@linaro.org>
Subject: RE: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Thread-Topic: [PULL 28/30] Hexagon HVX (tests/tcg/hexagon) hvx_misc test
Thread-Index: AQHXznZ17I9Od8eOSkWYgK05UEqDb6vuet4AgAA1MoCAAAbMIIAAApEAgAAMooCAAZ7voA==
Date: Tue, 2 Nov 2021 16:05:23 +0000
Message-ID: <SN4PR0201MB8808870B218F0DFCE1AE4B20DE8B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <1635698589-31849-1-git-send-email-tsimpson@quicinc.com>
 <1635698589-31849-29-git-send-email-tsimpson@quicinc.com>
 <e1d3d003-f287-7f82-d604-6f43b0d9c55c@amsat.org>
 <2f35d0c6-0ba7-b911-56db-c1ed9ae4afbc@linaro.org>
 <SN4PR0201MB8808814113CBE84889CD5234DE8A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <3e93e507-da92-0a1c-346b-ebfde27168fc@amsat.org>
 <d2395c92-4ece-31a3-8bd6-24345c946780@linaro.org>
In-Reply-To: <d2395c92-4ece-31a3-8bd6-24345c946780@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f11097db-2517-4a7a-cc12-08d99e1a93fd
x-ms-traffictypediagnostic: SN6PR02MB4670:
x-microsoft-antispam-prvs: <SN6PR02MB46703901FBCBFEE597F9FC83DE8B9@SN6PR02MB4670.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S0cZD6l2JG3gOhWTFfmlmeZ07EU/fTGrrzQUWUpLuDrD2vMpktxiMtPcvRWzpYHpufunYElN+KCAgvLYA2tQDUWUD6A+dCv9rlk3KmBxbaXtnwa7+gDUeckVVAQm9NcksGQ9SGhpwuAxfnZ75OyyQ9G6WrpLJfGoqSHT9z8WnBX+Gz6ArCeT9x3o/6OYMBHh97e3hekzmkLQSevYIe8M1cCvXFU/UOk/+vM6p6Py9xz2PyoKFbhudTFzZAEqu/x4p6RCV0GYXwzH81x6z9VumExN91Q/JciuLI25diMvZMtXIZBZlutaF+22ypirG+J4N59iOwERuDEvVs/khx5Ao/9nJDjFdvNzJZ87jdRsESbPfmOWO8lmbI8igH/R+gwjWk6fp0c/aReWIFjOI+i3NeC9MX/m5JoolHJoe9/m1lSLGr6iIHQw+/GlibeDUA1pw2Nfso28QMupGnBD9nPicTTeq4KXxfKZwDQmZeZyetFi5+R6mRCCmXvkt24tbj5yhs14uCYif6Az3kmBDLl+m+rYc6Mc5vdVo9RpCBGdGTorjW8JcgYKemqT/K3D3TmKNk5UWb10+PAvVTCETTFW0Kb6e4G70vYxsXtkNZsPasCJoX6GRRPo1/pR8i+wOA2gDsJiYz0rTGOVXa47/V9YxbB5uwWqd4dZyqf23WdamEsCKOiHvoSg5KpNOjX7hMo6Z37TuySEbzrhLF3fjFZjEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(186003)(26005)(38100700002)(86362001)(38070700005)(4744005)(52536014)(316002)(110136005)(122000001)(33656002)(64756008)(66446008)(8676002)(76116006)(66574015)(8936002)(2906002)(66476007)(66556008)(4326008)(53546011)(508600001)(6506007)(7696005)(66946007)(55016002)(5660300002)(71200400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STNkMjBjR3hFSU9UN3R0RzBwall1SlM5MjNCdUFianY0OEJkWlppUTRxd2Zh?=
 =?utf-8?B?TnhQejlTd21FdDNOenppNjczaXplYldsM2dpMkZYc1JBcTlJWkpzeGxWUERx?=
 =?utf-8?B?MUY2L09NM1RPMC9JSWFZVlVJT3NrUW9FNElUelF0Y29zTnJ5dmJlN2R0YitC?=
 =?utf-8?B?ZHptU0FpeSt1eGFQS0haRHFOeHFUUDBHZ3BPd1R1aDJiVFBNQzB0WVJaMVlo?=
 =?utf-8?B?VWRLWDJDa0Jzd0cwd0NkRmhlOW9GcENKTkx1MHpCZXBVQU9MdlFDWENrVHRE?=
 =?utf-8?B?dTdPYUUrTmNMQXRTWWF2V09Za2YzaUVsSWw2ZGord082WGFvWkVMQ1NseThF?=
 =?utf-8?B?YmNUTWJyU0xDWXZlYloyQXdDNE1TNkxzTEFxOGovRkRkVk9Xd3FJM0RHcXRk?=
 =?utf-8?B?UjMxekNxNVhHeFg4WUFCd3Q3ZGFVeXFuMFQvQmdXdXBPaXBwd2UreFN5azhM?=
 =?utf-8?B?a1JIMnlzVytyaEtKaDRCcWVYMlZRbi9RUDNKMm5BemtqdGFOQ2tZZFBOazUy?=
 =?utf-8?B?Umx4Z2dUR3VKaUlycTQxSW1Nbml5VlVKTm13a0hrWnpydmlZOHVHQ24yUFdv?=
 =?utf-8?B?V244QWZGZUxBZTI4QUZ3Ti9lTzZRRVNkai9UY1Z6azUwVkVEU0tDcjAzNEFV?=
 =?utf-8?B?ZUxlK0MvZklPNGx2Y2JlMnArZStvZ2NVejhNN0V3bzlMeXpreGczemlCWk10?=
 =?utf-8?B?U3R6UmszRVlFbldDcUpob09kbkpjYVppdXZDdTRTdzhHVWx3L25lNjBmbkx2?=
 =?utf-8?B?MitJOHVXNGV4U0ZjSElJYTMwYmUwNFJiaVZMZGg0N1ArK2tNeUhuZk5TSTVo?=
 =?utf-8?B?STlNQnBxRUdxMWhkVXlSd0lqY1JjYjdLMWIzaXI1bUYrZDkxeng3K3NhbmM4?=
 =?utf-8?B?YmFjWDQxMGg1U09WU0gyMFBhT2haRUF4bm93ZDZWZ25pakM0QkppWTlzdE9S?=
 =?utf-8?B?ZTNWM1dQREVnN3Nhd3h5cjBWQUN5OTNxTjhjYi9HT0dVQXNPallFT2cxazdY?=
 =?utf-8?B?Sys5SG9lYm56YnVkZVRJb0x2UEhVbTQrcDhCajVQbDl5NmMxdE8zQ3VMd2xN?=
 =?utf-8?B?YXQ5L2lZTEZzb29Za3ZSQ3g0b3h5OHcrUGg5YXA1U1RkeVQrZ2szc2NWZ0F2?=
 =?utf-8?B?QnQvY1I2c2pCSlhiSzlEM29hUUgwc2dNZERycDJEcmlNdlROY3Qzbks4YzRu?=
 =?utf-8?B?ZkdlNVJNditVb0d0K3lKUVZLTU9rMHg2cUFyM093Tk54VWl0RFBFTWljYTFx?=
 =?utf-8?B?bWt0WW5ocHo0WmsxS3liaHViUlBIdzV0Y2JSeXhDd2FKdHRGMEJMVHRhdHVB?=
 =?utf-8?B?UVhUOVJpK1QweUhiVmhvWE1vOXVKaEkwNWNEbnlMaVhVNXpZaUMrL3kvRldW?=
 =?utf-8?B?UCtrN1dNR3VJU1E3QmpEYnZTeVFOcXVKdW0wNWtvY0FRMlN1YytUbmFaT3h0?=
 =?utf-8?B?MjNNN0pJdUFvZWE5TnlGWDVoRVFlT0VmRVRaelVxbDdSK2NmT01vU2F5d3Vk?=
 =?utf-8?B?empaYmsyVnZSdDRtdC93ekxVM0FUUkZOdG82aVRIR3Fiblg2SkFrL3BlS0ZG?=
 =?utf-8?B?L2Zoc0pSRWx6dWI4MnhhN2o4c0xNKzR3eWJOOG15S1BKaTZSUkpVVnpGRXc0?=
 =?utf-8?B?UkZBOC8yNG9aTk9zU014VUpFNGhXMUlxVDVlV0FWdHZXSVNwSkJpOVNLL1dq?=
 =?utf-8?B?SmZqVFlLeTJtNU9YMjljN1poVHMxU3pJdWxoWjByYVdtU1hTUmpKdDNZTnB1?=
 =?utf-8?B?c0lrNVlvNFBxSVB3a2pySGhveFNmdVNFOG4vcWxJVzdHQkZLbW4vODlicW4r?=
 =?utf-8?B?bmVNYzB6WURxbjd4SU8yY09oTmdoMTczYk9nZTlVeFRIdytZb05HK2dHT0h0?=
 =?utf-8?B?N1BsRDFGMVNwdkxMTForWnpWT1ZXd3hkTlFEVFdSVSs3YmRSR2M0WnJveE5G?=
 =?utf-8?B?bEJKZ0wvdkVQVUhEOS9ISEZvTVNtR3c4ejJxVWRudVZLOFQ1eThzNFBTOHE1?=
 =?utf-8?B?OFJxWjBYY0tIMTliNll4MjdqelIxeEVjZVcreUxsbTl2Z0ViVkNKZlFWSTRz?=
 =?utf-8?B?dm5VRzd2TGxEMkoyZ1lDV293NXNIN2Q1eW5FcGZicldqZThUZC9yWkxTQ3I0?=
 =?utf-8?B?RCs5MlhtY0o4am5FUlgwdnRZVGVXa29uY29aODNVVDh5Uzd6U001REhkL01C?=
 =?utf-8?Q?REtINmOJehDXU42ORKJLXdw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11097db-2517-4a7a-cc12-08d99e1a93fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 16:05:23.8160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YsLcV1b3EJGchhhcroFaMiU34nxyv/VZxMNMccABsfRlnX1D89rTWJwNDZ1a7bkQVYsswSpTxPmbJHi1qgu4Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4670
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1i
ZXIgMSwgMjAyMSAxMDowMyBBTQ0KPiBUbzogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVn
QGFtc2F0Lm9yZz47IFRheWxvciBTaW1wc29uDQo+IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgQWxleCBCZW5uw6llDQo+IDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPg0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnDQo+IFN1YmplY3Q6IFJlOiBbUFVM
TCAyOC8zMF0gSGV4YWdvbiBIVlggKHRlc3RzL3RjZy9oZXhhZ29uKSBodnhfbWlzYyB0ZXN0DQo+
IA0KPiBPbiAxMS8xLzIxIDEwOjE3IEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToN
Cj4gPiBPbiAxMS8xLzIxIDE1OjA5LCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPj4gUGxhbi1B
IHNob3VsZCBiZSB0byB1cGRhdGUgdGhlIGNvbnRhaW5lciB3aXRoIHRoZSBuZXcgdG9vbGNoYWlu
Lg0KPiA+DQo+ID4gSUlVQyBSaWNoYXJkIGlzIGdvaW5nIHdpdGggUGxhbi1BOiB3YWl0IEFsZXgg
cXVldWUgZ2V0IG1lcmdlZCwgdGhlbg0KPiA+IHJldHJ5IG1lcmdpbmcgdGhpcyBwdWxsIHJlcXVl
c3QuDQo+IA0KPiBDb3JyZWN0Lg0KDQpBZ3JlZWQuICBKdXN0IGxldCBtZSBrbm93IGlmIEFsZXgg
aXNuJ3QgZ29pbmcgdG8gZ2V0IHRoZSBuZXcgdG9vbGNoYWluIG1lcmdlZCBpbiB0aW1lLCBhbmQg
SSBjYW4gZ28gdG8gcGxhbiBCLg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

