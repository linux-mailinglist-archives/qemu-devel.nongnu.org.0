Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D15742040F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 23:22:50 +0200 (CEST)
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX8wa-0006WG-R6
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 17:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mX8v8-0005R4-J5
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:21:18 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:46503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mX8v6-00072c-Aj
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1633296076; x=1633900876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z0JuKxFZHy5Zg1CLfTKnEhcR70zFUfovUsnJ03HzoUo=;
 b=zcN2Sc3Qb+1RBIv9xP76F+sAQt1VuW5VNK6z+ap0LcKVt2abSKnvvIh8
 zwOn6YWm3pgq/7lfMe9GpK7MFUU0ZEZcDBijrwIJxTpYuAeclNdMxtH2z
 8HVeinSZkeD6m9aatJRCtLqX3l8WZkzqyvMkGe/9Fr41kOwIH6pIauK16 U=;
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2021 21:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXG7dgbwZlWmVv/UWcvRo9ZUu0voDys9Thl3b9iaC7YpClrrGuY4TOS5hDrgd67kk8jssOJxqp7lJ1flbBYYXxBKDokFqGhuqRSK5R/rRNVkEoTAVxb3xJWBESdeg2EPK9ZkIFdSMrCVI2ZYucA/Or+9x21il81b02NmL62g3wf0y1IWBI8h59nE8b1V3IlBLYyzqYJNraN12Vw8/BJVDi79wUSnb8bb0R+TV3mfdeEFut8nX1b27mKIJMWpAebhdNQzOCTrsz1A3oXhY3hVkHlgnia8wNnu8+k0MWPGMe7qdYqJB95jea/OXXgPBrceVv0fsToz+nURCHgSSFLhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0JuKxFZHy5Zg1CLfTKnEhcR70zFUfovUsnJ03HzoUo=;
 b=k06X0i00isYiL3QIUi+GI+7gKVdA+hmxMEOg49+7uJgxj243++XqJwQGPLczyrSs0sNyVpxDH3labLQtwhoQ+GZOLdhkSEyvipk1MAlcuk82GDHWwdg0A4VF4fFwhg8tyzWVDKQN7/GOE8Q/RgGh44styhLFvC9d4hFPBk44SIEFC1/pN46pV2U7APuVdXtqxnclRVNXdu6U0M/9JLoA7yNpWDsQw4RihH8BXC2C0uA2TON2ixpZOT5GO4eJrve2vCKoq7ZCFzxpaYdnxGZCbEeZE3hSm4oItV87as/WGcJpQ8IkyVLCpMaGOIxNonSOu70yfg9lQk5SYAwOYA2bXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4895.namprd02.prod.outlook.com
 (2603:10b6:805:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sun, 3 Oct
 2021 21:21:12 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7854:5fd7:d358:e0d9]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::7854:5fd7:d358:e0d9%5]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 21:21:12 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 2/2] target/hexagon: Use tcg_constant_*
Thread-Topic: [PATCH 2/2] target/hexagon: Use tcg_constant_*
Thread-Index: AQHXt/CCvEOxm1IddU6yU2/PdmXrXavBx9sQ
Date: Sun, 3 Oct 2021 21:21:12 +0000
Message-ID: <SN4PR0201MB8808C197BF72CEFB91E04620DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211003004750.3608983-1-f4bug@amsat.org>
 <20211003004750.3608983-3-f4bug@amsat.org>
In-Reply-To: <20211003004750.3608983-3-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c82f2e43-f659-4fae-65f8-08d986b3ba06
x-ms-traffictypediagnostic: SN6PR02MB4895:
x-microsoft-antispam-prvs: <SN6PR02MB48953E4F3F2C4632460748AEDEAD9@SN6PR02MB4895.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ohJorzR/ipWosK2xpijKvxkNDIKTBUzG6HND0u8IZGN/A6UTlyqFaM3xTqCo5nxLT33I0YvxAemvwxirph6+t5t+jKJzPS2zT9EJMKH/+iwgYx6/U718+WLfuKAqkscKVC6BGpHnXsSEWzM7H73VidPTHa9MxEvYrLcHfShPZdXIJANU3qqKt8JC7Gu84hSLx6NwoKuTMsNMEURDgypUuFKhJprNCyhgMCdsCHsm4KYh1izGBk69u4h5mWDm4sZTdDAHoPqul2fdpycJT8MPy6ivfIXLvcNUXP+hfNp1YAgt/nxKXFaMeDMSMdA8h4ERdKMG8q/EM2jnt1Ig4rD9UtP6pQ0kEVi9Ub62Lfcfz5g/5FWqEY0CgbYJE0WA9gYEGivh7bROQA/NdcMzXK+jKjOTqr+nMIrbOuTzcGshC8YFzuQC3kUyRWKD+cbVdXFLXiAlyhJXJoa52fYKbXvGfUG94Ag7AiW524pWb1SZrxm7uCtoWVbOQJaVTz98DTG+vzNkd/SDBfsJkQzv+e1l5X8Xg41HnXQLcr8XGlMnbvJDB4y6K0cG7ygZ5iaxJbB9UotZi3lw5I7K1Kj8zPiU9rIda+1xvBW3yx+pf1yHwRUXmM7pKUIXvb9ESlZbuk0QPIkIhHDWsCZg5hldbrbhThzMYuxZsGBjbAGA7oK/rba/HMbrcpyl/fzrEQ7ZYfRw0NnNE6EMB43045oh9mgudQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(64756008)(55016002)(52536014)(76116006)(66946007)(186003)(66446008)(86362001)(26005)(9686003)(66476007)(4326008)(66556008)(71200400001)(83380400001)(122000001)(38100700002)(8676002)(8936002)(33656002)(7696005)(316002)(38070700005)(508600001)(2906002)(5660300002)(110136005)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjdBdmp2NDBJTWYwaEI1MmVydTRaaU0vdzl0d0NBckpYNTUraXluZVd6cTlQ?=
 =?utf-8?B?V2dtbFNUSCs4SmFZK2pSbWllaHJScndFblByc2hFUzUwemtpUXJlVkNVWDlJ?=
 =?utf-8?B?OXdzRlRvci9wSGo4b2t6T2VZOFBPOXRJM2I3aVNOMWEzMUhCM3ZXS3A3RUs1?=
 =?utf-8?B?aWNiL1Q2MUFCbTJpWkRqM1dZeDlvMm0xNFhXNzB0eEt4anNjeHhKbkdlWDFy?=
 =?utf-8?B?aXNRdDZVUDRsbis2YkVLSmNaaHpUQUhkTTZ0ZWh3YWwxY2FSNWgwQjZLSXJF?=
 =?utf-8?B?LzcvcW8rYTZxMUxaOFE1bkFMVVRQL1FCRGMvSDVkN2pveG5TbXJHNlFkRDdh?=
 =?utf-8?B?aXNxNFdzSnBueE9pdHJkdWt6TXQrSmNpVmhCTlkyVzU1UnZHY0crTHBzOEgv?=
 =?utf-8?B?NXdUblkwNEM2WHI3dmdiZlFmN0ZKN1duQnp0M0FUUHFSUGJWdHZhKzlpajU3?=
 =?utf-8?B?ZnBlSmh3SkFGZUp6WGhVUllXRXM0NjFhdi9iRFJPcmMwZWVEcktMYkg3Y01O?=
 =?utf-8?B?M21HdDU1Y0UzaVhQTlJGemxFVExMNU1ZbEx6eHNOUGdrWXJCMVdWREVhZzBi?=
 =?utf-8?B?dk41aWhGeWkrS1ljMDBzaFVvQzEvNDB5NyszT2R2MDYwS2VlTFlUNC9haUM2?=
 =?utf-8?B?aWNUV1pDR0EvNFhVTmhFM0ZsUWppWGJWcUo3Nk5uTm1veE56UlFTQVgzdGR3?=
 =?utf-8?B?ellZNVM3dEJTVUU2bDZnS0MvL1A2aW9IR201ZFl3eDhDRjFTM3RwRkh5WUZF?=
 =?utf-8?B?K0tXeGNiUXA5cXBvVUlJOFJhOStSVjdjTDd2emF3b09TSHZ6M1FKd3BYRk8z?=
 =?utf-8?B?ZVp4M21RcXZuREpJNWxiRlBBb1lCQ05zV0hBVUUrbDZIODFnWjVzR1JKT2Zs?=
 =?utf-8?B?RWxNa3lheW13RjJ2WmFyeTB1TDR5NW5reURNd2tyblZQaC9GbWRoQVE1THpX?=
 =?utf-8?B?S1ViSzExMGE3ZTBWMHNaMVluZkdMZ2tLc0lzSnVnUFhYQ0NSeUJZZ3YrU05y?=
 =?utf-8?B?N2t5VUl3eGdYbUVHcUNTR0RKKy9NWFhVcExhejFwWWlqSEluWEFKNzNENnRj?=
 =?utf-8?B?cXJrdFp6SmFWVVE3YzdQa1MrVVREaDU4Y1Z4WG9TUEZuUVVKR1RYSHJ4Mldr?=
 =?utf-8?B?R0E0Tml3Tk9TUk5nUkhUOG9JRm8xSUdGcWVyVXN3QStqZlh1QjlMSEFUR3Bw?=
 =?utf-8?B?Z054UEJHY0tsd1JkKzJJR2U1Wk1JZUExSnBlUXVGclJ3UkdPdjd4ZlJmRFhl?=
 =?utf-8?B?b3VYRjVVU0N5UGN0ZncyUjdFWHZTMzdtbHp0dDU4MElpTzZOR1F6UkZNdlcw?=
 =?utf-8?B?NTd1ZkRIalNXb1FsdWNsdTJPNlZlUHV4WVRmRHdSWlkwVWRycmFhR0VLajdv?=
 =?utf-8?B?VUk0M3o3d3pLcVB5VUdTMStCV3QvVW9Xak1RSUJrVC9pRHNLVDQ2WWxZN1By?=
 =?utf-8?B?SkNRWDVFcHhYUmUzcFhTVVgzOHlGOG5yT2JtZHI0UmZjelRFY1FxTDBIaDFO?=
 =?utf-8?B?VE5oN1pZM2x1SWd3S2szRWo4RndZMHBpdmNxdVhYWXlXN1ZQUUttK2pEMkxQ?=
 =?utf-8?B?a0NjNVdSYnkvRFVuYVpQRVdqbE5uZENzZGVZMm9qMDBJVVdNTCtZU1pBdmZo?=
 =?utf-8?B?V28waCs2cmVidUlHb2J3TEtYdHcrcXNQb2xDRStmVjA5QXhWZXVCaHdzcnZm?=
 =?utf-8?B?N2NzcXlmQjJFU1lpUUtoRm9Ia21zOGEyZXBkQnJ6UGlCOTFINlFJNHdnT1Vv?=
 =?utf-8?Q?o+ULAPb12//wYSumFFMfUiD0jM0EDXWa3foFMhn?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82f2e43-f659-4fae-65f8-08d986b3ba06
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2021 21:21:12.7148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ZX1f5QoBR+MpJ/8jHspq3VJW8u/Ce954vJyxr4lY5On/rs3L6U8Q8OD1NEfhlF6YBxNP6IOjXMFLaNEPLajLg==
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
YnVnQGFtc2F0Lm9yZz4NCj4gU3ViamVjdDogW1BBVENIIDIvMl0gdGFyZ2V0L2hleGFnb246IFVz
ZSB0Y2dfY29uc3RhbnRfKg0KPiANCj4gUmVwbGFjZSB1c2VzIG9mIHRjZ19jb25zdF8qIHdpdGgg
dGhlIGFsbG9jYXRlIGFuZCBmcmVlIGNsb3NlIHRvZ2V0aGVyLg0KPiANCj4gSW5zcGlyZWQtYnk6
IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0KPiAt
LS0NCj4gIHRhcmdldC9oZXhhZ29uL2dlbl90Y2cuaCAgICAgICAgfCAgNiArKy0tLQ0KPiAgdGFy
Z2V0L2hleGFnb24vbWFjcm9zLmggICAgICAgICB8ICAzICstLQ0KPiAgdGFyZ2V0L2hleGFnb24v
Z2VucHRyLmMgICAgICAgICB8IDM5ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiAgdGFyZ2V0L2hleGFnb24vdHJhbnNsYXRlLmMgICAgICB8IDI2ICsrKysrKystLS0tLS0tLS0t
LS0tLS0NCj4gIHRhcmdldC9oZXhhZ29uL2dlbl90Y2dfZnVuY3MucHkgfCAgNCArLS0tDQo+ICA1
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQ0KDQpSZXZp
ZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0K

