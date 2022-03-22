Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B5E4E3E88
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:32:19 +0100 (CET)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdgP-0000Bp-9T
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:32:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nWdXH-0000Ro-9Q
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:22:51 -0400
Received: from mail-eopbgr40119.outbound.protection.outlook.com
 ([40.107.4.119]:60552 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nWdXE-0001vU-Pl
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:22:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auLU+bzTKCNE7FVH6xiR0w8OSfpK5EUbQC+ToONj7u+DgIAzt4TeQrQtpvGoAx/xtD4sE1FYO5NRnUVRZ/kF2reNTmhr+IYu7//vnDGd7hcknJhNrkkMELCJmWNQlzHfBaQ4vz5Rsl9NH7z6eIXHBnJkZ3uZfOjWsRtjj3bKAPemBjzD5cGtdHbL4xR6Qg8dNDrJTuxuTUfbjb7cNsHsNL7SE0DHLyN6zKsSg/bxJcU4LSFzpYn+zakE53r9nPeKVl8fO02747fHGpoth1YTntW0Yn/+I4UMrvnVNa9kZoR/BV7CabQJ01unzurloBHIVRP9BGzuoj3dlgq0ztePaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwLPial0oQZYufipXxpjHMRA0BR7qmNwcxjYyKZyid4=;
 b=GcjUIh9yXyxNVoyyjZlRRQk++mxb42+/fnFk99w5L38B5kE4bFKVLrjgHVPhq4su/RmgMSVovIeIq93oP9PFas4yVFVkqukO/Qyw8aDI+a4Sei/0Z7bCy6CfWbvXgblJNpBSdhvVaa0dBqegJzVaqqpXXIppX1mvgDoV2eyVI2ufCEC5HHRTeQzZtxh+/kG0mKUYczQKOvAHurOCzdasP9/sQxjFtvgyvmeVVHDG3Uj9+qmTuBmCvbvu6wgU4TwHzUFX8UKPsh4/134WPZMkRaZoKHc44iLjdCe1FQGYMwrGf9qgloj43YDlvIFyMcFoMXCVvbdfgXGYHy3lr2I3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwLPial0oQZYufipXxpjHMRA0BR7qmNwcxjYyKZyid4=;
 b=VdOm/ezMQZJJJOhxgjmL5KpkawKUPwpg+RZNdzUa3f5GHklGaunksiL41pRm1C9FIGHOoS08EILTpSGZztxp9i1mjCyBoJE7FSU9CfFt+0vaF4W4tsQnLbdGuxtnccxhg/7g7+Wx2tDmX+PxPd1VCdl/WFhndvaocFZsuqdbX7c=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by DB8PR09MB3244.eurprd09.prod.outlook.com (2603:10a6:10:10d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Tue, 22 Mar
 2022 12:17:43 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b%8]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 12:17:43 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH for-7.1 v6 00/51] target/nios2: Shadow register set, EIC
 and VIC
Thread-Topic: [PATCH for-7.1 v6 00/51] target/nios2: Shadow register set, EIC
 and VIC
Thread-Index: AQHYOby3RCLnfYUhdE67AYjigxLVk6zLU5YA
Date: Tue, 22 Mar 2022 12:17:42 +0000
Message-ID: <PA4PR09MB48805FB6DB1CDA023787683EEB179@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1a592d2-cb45-4122-36ed-08da0bfdf75e
x-ms-traffictypediagnostic: DB8PR09MB3244:EE_
x-microsoft-antispam-prvs: <DB8PR09MB324403F5BC7AEA86E045D275EB179@DB8PR09MB3244.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Vigvt7Eq0TPRJ3c/dxF2LASaGeDh80eChNmF7fnuPUDoJRXupCe4wyz5PGnhSjAIb9oH6K1KXTMpTVZlqkByPC6uUptNGMQPb0RqaoeI2COn2fFnK72UIEoaI6pJ7Dg21kHENf6Hp1WjBWxgPL9fY+me1mPF8HPjO5phDSHMDm0rNbjLTSc4Ld6pzHRoPGH5QkE/cGl4b4m9ACzohWSTP/3mhUH8LqJAtFAs4skGREkl+eE6eRX8TxnK3GmxmrW+j6hnjAEPGiPKZ1kRvJ4xWiZwrjsWsTsULTXJK1knrys6S0//6RuOneWbSCfcny65RSxZSxFUdYbBgQh41BVdRUGE6vpdQyEZ6F9WlcmqM0UIBttJDRBOLZaaMYsoaH5DqI6g3qSgsB86FfRxkG5eOYPLzI4W9A+NqrOAqCLJg2aVhyPZdaiX0SZbSg6HUHWzTrvLyg3oUr6FSYTehLd/+3TeyY2GzNKbTps2BrMJxWYcTQ0+p3PIZGqzLBwNPQRblPBtIEab8WuZAVvRb69QeB3ndptJigIpRo42uyUW1zagWiwe/eof4of/5DgYKccYvjG+ANzsmIT9nR5uqBfoRLx1aT4zgcJ+IByu3RbXj58eQcyFoQNdHO8mYYcAOWm1jyxeYTpBqbM59MiHNtXhh8snXZQ7gzkBv2HigMmMYG2gFu6pC5SeW357JppjifKxndb2Uo3wlsIbjgcbtOWQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(376002)(366004)(136003)(396003)(39840400004)(346002)(66476007)(44832011)(5660300002)(66446008)(33656002)(52536014)(110136005)(76116006)(66946007)(66556008)(38070700005)(122000001)(7696005)(6506007)(316002)(55016003)(9686003)(8936002)(508600001)(38100700002)(2906002)(558084003)(64756008)(71200400001)(8676002)(107886003)(86362001)(186003)(4326008)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEdOUmdkSEFjSVJ6YW5GOGhVSDlIZXpVNHpidFFSbFhmRjkzV2dHZWhyMzRm?=
 =?utf-8?B?NitRM3dJb25HUFhvNlF1dW5GQThSM05mcU4ySEJvekk0cVc2d0dwWUtNVWth?=
 =?utf-8?B?dkh2NGsxTjhsZldkM1gwdVJmQ3k1VjZFNE1vOEpaR3Y4bTZBVk83U1VtWVBS?=
 =?utf-8?B?ejNacTlOM1QrRmR2V09uVlpWem1URWY1b0FteUJxbFNDeVc4SzNEeEp5bDc2?=
 =?utf-8?B?My9sQy9zMTBSNStsVUZmejBGUjNwWFNwUzQwVlQyaC9GRllldHRBOURyeHhN?=
 =?utf-8?B?c2hKbFY1NTRudEFHVzcxb1hrWk5SY0FoTEdMeWEyK00waE1taFlkZ29hSnZF?=
 =?utf-8?B?WEdTS3BHMDIxaVVEN0hkZHpCdGlZVVpNdVhLQjlRWnNzV09WcVhOb1BrVDhl?=
 =?utf-8?B?OElKYWJza0hidklGc3M3d002UHQ2SFkzbUx3NEI1cHVIdWVhY0Z0RlFVMUlB?=
 =?utf-8?B?MlJMZVZnbkF0L1NWYmttMFFLcXVoYW1nR0gwK3ZPRUhMditqSmhqZEx5emFh?=
 =?utf-8?B?OThNR0V4V3VDSldjemlRMitXZnhiM0ZWaVJxSDFPYTNNOHV4dnpUTHJjSWtn?=
 =?utf-8?B?RFBkSVFUc1ZWYWc5dG10cU9uUmMvSU11RE5acDFKd3hNTFJXMDhmUlhhMFNT?=
 =?utf-8?B?U0xZR2VzMXpsVmJSQ3RhbHhhbkp3VEdZYlJtczBQTUI3WkJuK2tDTkl3OFVJ?=
 =?utf-8?B?R05ONVg1eE5zTjJ4MGNLakRBNW1jL3dTTFF5a3g0M0l4QUNKV2FXeHUzRjZx?=
 =?utf-8?B?YmM3TjFsUHB6cG80L0VMY3BzMkZKME96WmtzcElUV2VOdUtIaGVTR3Y1Qk14?=
 =?utf-8?B?TWJWcE13Y3VkQnRlYU5rQ3ZRWExMSlRmUHorT3hmMkZQV3I4ZkdLQVFNMXA2?=
 =?utf-8?B?NkVJSVVNcFFhV0V6N2I5VUErSS96WkdQdE1hVFZQVmZOb0hWSndlMXUxc216?=
 =?utf-8?B?NnRlaDdpUUdjRklpRVZxbnJxcWdVMnFGaWM5ZGlJdkI3cUNrWVJLK2NEUDhZ?=
 =?utf-8?B?blhuaTdGVmZWNVRTKzNaUzJTRC9Gb2MwT3Z0WGh6RDZhRWh2S3puWEZNcis2?=
 =?utf-8?B?YmxiQmVyNGlCZW9MTEdWdzhEdm9vNnpWdmdzVzdSdDVLTDNWaGMxbElWTFZ0?=
 =?utf-8?B?Y0ZvUTh1WER5NExrQmFDekhSWkp6a0FZZXh5SWg0bW1qWGNKSHdEcnpESWZ5?=
 =?utf-8?B?RndhTGxUbGNGdHU4N0p2K1pEUUFkaGZWdGZlSTRIL0JucWI4L1pBdlhyWGpI?=
 =?utf-8?B?emlFOXlpaFl4bUg5a0VOaHlFNTl5MTBiK2Z5N2o3blluQTdYYkFqY0haeXVs?=
 =?utf-8?B?T0Z4Wi9YZ2RxQTZRNkhsUDd6TVJCbHZUVm1PSHZpNXpXYmZ3VnZmUnBmQUxT?=
 =?utf-8?B?eDZ1U2lXazZFank3WGozeDJwbDRWU09EaUJ6WkUwQ1dDNnZkbXUwRWhUZnBr?=
 =?utf-8?B?S2NmRGVDeE1kaDAxQnExT0c4Z2pXSW1uSTFUZzQyanhkU2tJR3pLYm9tRk5n?=
 =?utf-8?B?SmdzYitSc2tod1QwRzU3VThlUW4ybHN2dXlrcWlnRGFKZkVYcWYrZ3NuSWlj?=
 =?utf-8?B?WEVQcW5DaWx0aWlZRWV0THZtR2RHYTRETS9SRzA2bitnR3FJbU93emRmT3Rw?=
 =?utf-8?B?eVI5a09ma3pFdWJjZjFNdHpiRzFNVEVhc1hTeCtZc0o2NzlQbmRiYVBHT3hU?=
 =?utf-8?B?MG01MzFaOExoTFNJRlBrZzgyZDM4N3lINTY4bklDTEZPRTNRUU9MeHo1SDdY?=
 =?utf-8?B?d2tqbElWRGxOeEVzN2FBb2Q4bTA2KzlPVVhZQTlRbDJxdi9TcGUrMjFoTWh3?=
 =?utf-8?B?WU8vRld1OUY1aTUxMnp3aytjU2pYUWVXMEN3UmtSZ2xqK1R5TmhMN2FoS2NF?=
 =?utf-8?B?ZmJYbVFrVlAwblZEb04vcG10a0lmc2ZDOUlFandwTldtTVNEcjRxempXdWJ0?=
 =?utf-8?B?Zjk4MGVMTXhIOSs3bjYxVzQvT3l4aStnN1FPMEJDc1NaUmZqZWhnV1plbG1N?=
 =?utf-8?B?V2xzYnJpZ1l3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a592d2-cb45-4122-36ed-08da0bfdf75e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 12:17:43.0031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AgB+S6/ItrawMsSzfADsTz68O4K6s3GHlyiqirjvLuavKCZWy7rOO0BvevNTcxXxykyBNYi2flcbFBe22hokxxXn9JNZ+1YElVQJRA8tsE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3244
Received-SPF: pass client-ip=40.107.4.119;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "marex@denx.de" <marex@denx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSB0ZXN0ZWQgdGhpcyB3aXRoIEludGVsIHRvb2xpbmcgKFF1YXJ0dXMgUHJpbWUgRURTKSB0byBi
dWlsZCB0aGUgbmlvczIgZmlybXdhcmUuDQpTaGFkb3cgcmVnaXN0ZXIgc2V0LCBFSUMsIFZJQyB3
b3JrIGFzIGV4cGVjdGVkLg0KDQpMb29raW5nIGZvcndhcmQgdG8gc2VlaW5nIHRoaXMgbWVyZ2Vk
IQ0KDQpUaGFua3MsDQpBbWlyDQo=

