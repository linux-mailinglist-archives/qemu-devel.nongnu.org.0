Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C5554C81A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 14:05:30 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Rm4-0003Yy-Rp
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 08:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o1RjT-0002pf-PI
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 08:02:48 -0400
Received: from mail-bn1nam07on2098.outbound.protection.outlook.com
 ([40.107.212.98]:19099 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o1RjR-000181-EB
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 08:02:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCbjXBkhRtNFtif58+edu33gHGXAnzcqLkw0B57PWSvwnJGDWl/fTd8CrPvyIbNb2vi//A2EHHdmHLiEXgY6WH3u2xeHksEhWOHjQKAzABNkfL64eip5OUTpQ2gFt4SG8kcnwLsve2oFy/leoK3Ve0FXe0hwnpKw2IbsGo2Ocwacll1d4Ql2IFouS6tyGdjOQ59DbSH/PAJKsQFh6FwYfXY5BoFK2FkcImaEIAFIOVQSLD29MahZRwZ60vfIjijnB8B5gD9QYa3x54gXD+CDkbR7pDKFHiLelPsRVzXlwrKiD9u92lxx0JBArJxSbV9m53twJvjsHT357J6coUQsaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLw1Fj7ux+ItZ4bzYTMuqgYBV9+cjWmInNVWz7/k2a8=;
 b=BUlny9xpDF2c44Vv8CuFgtfGmlZkCXU0VZvmETl4ECGH0+BH/SafB7L23KVrUu960rZR+vBm4/BrYBlq783VxDrNoxRa77wiE87qQ6+jtw0y74WNOVSfTs40MUUqjIOOBeWKNHLtJvW6FQgKHYK6DmvZXKLAxVUxfIUUX2oFtUEaJN+dvZyrWdQb+/aB6dqYraiqMpN5FWyaRihXAhY2TJKYmqhQ+SKUZCgA5vkFegFDz5bFjKo2sIZSg5la0U3pQ39Ay/ZNcm+fvpsUfh3dcf5vCa1pDsUoada1sJiKzOvBjesxP+R4nYjeIkvpUZhxYgLYSNfxYH3vNyFUIHWtSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLw1Fj7ux+ItZ4bzYTMuqgYBV9+cjWmInNVWz7/k2a8=;
 b=BWh0f4+OoElAyLMmqnkIxK39sOYoT+INuS/iFH036QqYVEt/oDmUrOh+6QCpYb3czYyU3jo2sgLNqNaQjVFcrqniWWPupNfHLsCUxeOJxCc2L0YzFqVBklrXlnaFUpKfIJJf2jjBO49Hvy6RzscrGF495j+gJJD9fMAcyrl/1ss4NbN4XMtgexl4ofVt2jrYARyiwatg6vTOoZNhBG7oPX4JjW79gwjb5RpFswpBAxeTES55SuBcESRTLsFLu1AAumsy5243lfK44PuuQhrTqraoqQ7990hjsy9jIUd/E555+iXdgqNGgxpPLhcXXcHU0+T13p10v8RSnvquhvcn/A==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by SC1PR80MB4639.lamprd80.prod.outlook.com (2603:10d6:300::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12; Wed, 15 Jun 2022 11:57:37 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07%4]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 11:57:36 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Thread-Topic: [PULL 20/33] configure: handle host compiler in
 probe_target_compiler
Thread-Index: AQHYdegdsR2e7ivWeUqr7kvGWi7Gl61Qck6A
Date: Wed, 15 Jun 2022 11:57:36 +0000
Message-ID: <c655723a-95df-82e4-2105-678cdea9e702@eldorado.org.br>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
 <20220601180537.2329566-21-alex.bennee@linaro.org>
In-Reply-To: <20220601180537.2329566-21-alex.bennee@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7da0d47e-19f2-490e-d4bd-08da4ec63d13
x-ms-traffictypediagnostic: SC1PR80MB4639:EE_
x-microsoft-antispam-prvs: <SC1PR80MB4639C5E8656DC7A73D5B5B1DA1AD9@SC1PR80MB4639.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b//h6fdTUe7uX55NnfugaM0iRHbunLbzvSRG2/bRtIvyszDAVSLUzf2zM+aihdjPJh+2fq5ztsti9PCDIb6PuzksgYFPqBRCs115KLDi/w41QUw35Rbw7TMJk3xV1Ug+1Lr16E4L1Cf9eg5EmkAeBvCGRFHMQi2031OsfdKDS0HQINBCzL/usAeG4JJNMkNb72o/zWJzZkqtMMQ1Z0nGupkxm0VZkFaO/n2jKXijRBJcP+VAVLOEEI4WbiUiE4j024VVZTOoOSh7e17jhTACI0sS8KYZMVTXCK8eJxGLRDu65I/61Tv7m1fGNPmjZn0vDNHmO7hS6/SelaT7PMMAaAeA9qf2wVFZY/J6zqRwwYjp06aHSq5Ss0L5FcDoF8zVIvQYRpq3X7ftHxggMX1jLzVLvx2l/se2mtOg/XJ5UQZdJAM3VEN/J98nIQGZ0noZ9Lscq9ChmR9q3rZdlPwYqyUpfIEYb6E/ttx9e+gx971v4bPBAn5IpqY/r2KCiODHxJPDbwxaL1OUqHyec2rlmWC4tPrcDEwB8EV7LBTXf8gSe5toIh18QaZWVo+2PhoNzg8WOJvNqmgh7cyX9vBxQbURHgTKrU1E6jVM7N24iiW/X/AzmMv9/q1JULHUl1DqL048LUtnY5bkq9OHbDe0UwbTinQ34WarYoJEYAVjWDjfa6/SVmZm5LC3jCuqAhKMf+ntjShODZw3lgZgfNlrBJi0GhyyT3pgGjU5tJ9QvkKrxmkSVFR5YNFsXVI6RHQg3SaDaml5RLirU46bWQP8R4nwrR1XeTQ6FtpnQmIVLKRCMYZKl3vCeGfXzhVfqTU8y5pBVPDWk99Sx8HHd8uvAdSabsJO/+82HJH6UUD00o24/broOkQQ5BOVNKC0dEmc/y+hxfRccBWhtgkUW5FwVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(508600001)(5660300002)(2616005)(122000001)(316002)(31686004)(8936002)(107886003)(83380400001)(186003)(36756003)(966005)(4326008)(71200400001)(8676002)(26005)(66476007)(53546011)(6506007)(31696002)(6512007)(66946007)(66556008)(66446008)(64756008)(76116006)(86362001)(2906002)(110136005)(54906003)(38100700002)(38070700005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjJBNzFGaFRGUVZESlNCTkNNeDV3UXJjY2Vwb1pldElqajdEM2JhL0xTQ3BP?=
 =?utf-8?B?VmYweUlhSzFoV0hnYkF3UVVlL1RMcVp4aWIvSUJzMldLelJ0bjE2UzRtQnA0?=
 =?utf-8?B?SnRxU2diZkxuZjd6SWpxM0RTaHNibklaWkxhRzEyeDR3RzIvVGpqTFVEL0Yr?=
 =?utf-8?B?VzJpc0dkUWV3M3JVQnRrUnc5QWcrN1dCQXdlOG5YbVVTSkVxZkFUNlVOTzc5?=
 =?utf-8?B?UDI2Wk4wdkZMUGlHOXp2dWsvZnNzSUlSbWFaRFRhdVlMZTFVQWRiWXlDbXI3?=
 =?utf-8?B?SmhiS2pPOVphYlNJa0pyS0ZyWDViUkYxb01ucE10NmR5cHRRMGtzc0dzUGkz?=
 =?utf-8?B?cERnQ3RNQVlGK3lPU2JzWDV1MCtSZnp4R0lRQU5uZm9jR3pEZENvM0dndGsv?=
 =?utf-8?B?dFNOdnV3RzI5U0Rnb1pFQXp3K2pqZy8yZTFMTW1iZzZZbHlrZGtoRFJFRWNq?=
 =?utf-8?B?RHZUNS94cTlyNUgwTHVkZ0NnYjl1bVg3ZFJsOFE1aERhd1pKMUR0MVlKcVpa?=
 =?utf-8?B?SVdORVFHUUlodEZvRTNiZFVNWnRmOFR5bXVodEd4ZTR1dnpodGRCZ0Q0SExQ?=
 =?utf-8?B?dnFrMnBnQ01ZK1hhQ2pYR3RaWWlOU2RFT3ZaVVFrUEFINDUyelhtNnNNbC9q?=
 =?utf-8?B?UUdKRWNHZTY0VGZ2U2dweFF0MHI0Mmt2c1A3OXBOKzdwd1RrSGFUUVM1REdX?=
 =?utf-8?B?VnAzVnpscU1tQXBaSy92VEF2eXZ4RUJpMGVlR0NRSFZRT0xEK2VHQ1QzaUxl?=
 =?utf-8?B?ZkxRYXBPdUxkajBYL0ZwWUxBR0EvU0hVZFN5K1dZNWtpSVlIMVN6dWlwZFlk?=
 =?utf-8?B?Yk9EbktKS3FZK3lkeUhXWk54Q1ZuN0JBN0ZZUGk5SFBnTmNFSW4wWTFKR3Iw?=
 =?utf-8?B?S21mN1QzM0tGbk5RRmRlSVI4TytCNGhDeHVVVVFYSUVPUUswQXQrNlA2ZmN3?=
 =?utf-8?B?OFVtODd1WFk3RmIwNGFvWXdaSDNBL1pOc1VBTlFnZE1XRi9DUlRxbWR3OCtF?=
 =?utf-8?B?ZFBneHBScFFuZ0pBdU5tbmdNdjBTM0xRS1hvSWZOQWc3eDRYZGdwcHVkcEpa?=
 =?utf-8?B?U1NMSnplVFNybjhVL2k5bUVuYm1LR1Q3a3VGWjB4RmxMbnZNU21hMmR4bysx?=
 =?utf-8?B?bFdmY0wyTXB2L3ZKNVFGZ2dWVmNiS0t0Q042YXI2bGNtcEM1VGt2U2dVVUti?=
 =?utf-8?B?bi9PLzJtQTBVODYzcjlEYWJ4SXE5NUlnbUZBTWFJc05PeEI1VUhrc202SGVs?=
 =?utf-8?B?aWZ4bS9rRUdFZFVvN1JnUHFnbjRYMGRKZFowY1pDd21TKy9ONHhmN3RVV29o?=
 =?utf-8?B?MXkrTHl0ZEpVSnVKTkswQk9UcmFJNTVwVS9FMExDS3c3UVVCU0hUNmNqVDRx?=
 =?utf-8?B?aGVsUGFhZ1ZLUlk5NTZzY09iUS9QZER4WlZ2R3ZYa3RZaDJaRmVmaGh0TWxw?=
 =?utf-8?B?eVVuRGVhOUhyVGRHb3lqMHpwYVRJQXZ4ajc5VGJTZkJ3TmhUKzJ6Z25HekRr?=
 =?utf-8?B?ZnBtS0hNWmNyb1ZISjVXZUpyTExORTZsRmZLVXlUWWtKUTlQNGpTV2xpLzR3?=
 =?utf-8?B?T3REWElkSDVOQko0VUQrUzBjeFZkeDVsU2FLRmVYWGRLWmdoOHhKamxTUlY3?=
 =?utf-8?B?L0RFdlg1MWJIU2J0NEZjMHR3TDIvc1JIRW41Ymk0NFJXdjJNSFNjMWVDWlJX?=
 =?utf-8?B?SnIvcHRSYlIzV255M2RGYmdzOElmdkxzc0dESWlOM0hHaGd0L2FKNWhuTEJN?=
 =?utf-8?B?TU5zKzYyYmlWL1FtamFzQnQwOVFnNkJxYnBGZldKWTlac1ZBdktmMGJTR3E0?=
 =?utf-8?B?NjA2Z3lWQjloMXAxQjlsei9HRVNEdGNUZVV2eVZiRzRNeDhEMkY1c2RqdGhy?=
 =?utf-8?B?L0hUM0ZUb3Y0YW4vcDBPUVl0NGlIMGpPUEN5Y2M5WXE3ZkJ0UFpEVWd4ckc1?=
 =?utf-8?B?SWhjbWk5TS9TS2NmOFNqWFVjZHVEOHZpVk1VK1Y4QUNFU2ErYUZSOTFtM3BE?=
 =?utf-8?B?S3FYanh5VmJxUVlPcXdLYjIxY2FyZzQ3Z3JXWnZ3MW8rKzcwZ2hQdFgza1h3?=
 =?utf-8?B?ak9uYXVaMkczWitLR2pyZWh4eEFmaERYajZTUmdZT3FOVmVCeTIwYllSYUJv?=
 =?utf-8?B?U0lFcWRhN1FWSmZObmpkZnVpaEU4WFRod3lTWmtSV3BKMWVNd2d3empsdGpU?=
 =?utf-8?B?eWtualgzL2l3bjlTbkphUUN6S1pVeXdvSmlSZnJaK3lTMkltUkhQSkFzOU5l?=
 =?utf-8?B?NytZdWZxQ2NIVHBJc0dFalpsaVM1LzdiY25CSW9ENzkyaXVIN2owTHRBcDd0?=
 =?utf-8?B?QTJDcmdmMEp2bU9pNVk5eGQxQjRuMkJSanRZd3ptZ2wvSCtsaExvSHFrWjVv?=
 =?utf-8?Q?qPT/fYTesTYGPuVFfJG1FRBlCU4PQxZvsfT2D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6A7622BBF7A3C4FB46A66B064195620@lamprd80.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da0d47e-19f2-490e-d4bd-08da4ec63d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 11:57:36.1234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cruj5U4SgsKEftkKZXDj+GrM6aEdecrhCYO9RG5Hdcb6wTwMJCxzsqcNiMlcO7epFrSHls5ofYnaTgnpUGHDCIutM04vcRoFcxuAH3VI3UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SC1PR80MB4639
Received-SPF: pass client-ip=40.107.212.98;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gMDEvMDYvMjAyMiAxNTowNSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBGcm9tOiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPiANCj4gSW4gcHJlcGFyYXRpb24gZm9yIGhh
bmRsaW5nIG1vcmUgYmluYXJpZXMgdGhhbiBqdXN0IGNjLCBoYW5kbGUNCj4gdGhlIGNhc2Ugb2Yg
InByb2JlX3RhcmdldF9jb21waWxlciAkY3B1IiBkaXJlY3RseSBpbiB0aGUgZnVuY3Rpb24sDQo+
IHNldHRpbmcgdGhlIHRhcmdldF8qIHZhcmlhYmxlcyBiYXNlZCBvbiB0aGUgb25lcyB0aGF0IGFy
ZSB1c2VkIHRvDQo+IGJ1aWxkIFFFTVUuICBUaGUgY2xhbmcgY2hlY2sgYWxzbyBuZWVkcyB0byBi
ZSBtb3ZlZCBhZnRlciB0aGlzDQo+IGZhbGxiYWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGFv
bG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFJpY2hhcmQg
SGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBNZXNzYWdlLUlkOiA8
MjAyMjA1MTcwOTI2MTYuMTI3MjIzOC0xMC1wYm9uemluaUByZWRoYXQuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IE1lc3NhZ2Ut
SWQ6IDwyMDIyMDUyNzE1MzYwMy44ODc5MjktMjEtYWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCg0K
SGksDQoNCkFmdGVyIHRoaXMgcGF0Y2gsIGEgY2xlYW4gYnVpbGQgaW4gcHBjNjRsZSBob3N0cyB3
aWxsIG5vdCBidWlsZCANCnBwYzY0eyxsZX0tbGludXgtdXNlciB0ZXN0cyB3aXRoICJtYWtlIGNo
ZWNrLXRjZyINCg0KPiANCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQ0KPiBp
bmRleCBmYmY2ZDM5Zjk2Li4yMTdjOGIzY2FjIDEwMDc1NQ0KPiAtLS0gYS9jb25maWd1cmUNCj4g
KysrIGIvY29uZmlndXJlDQo+IEBAIC05NTQsMTAgKzk1NCw2IEBAIGNhc2UgJGdpdF9zdWJtb2R1
bGVzX2FjdGlvbiBpbg0KPiAgICAgICA7Ow0KPiAgIGVzYWMNCj4gDQo+IC1pZiBldmFsIHRlc3Qg
LXogIlwke2Nyb3NzX2NjXyRjcHV9IjsgdGhlbg0KPiAtICAgIGV2YWwgImNyb3NzX2NjXyR7Y3B1
fT1cJGNjIg0KPiAtZmkNCj4gLQ0KPiAgIGRlZmF1bHRfdGFyZ2V0X2xpc3Q9IiINCj4gICBtYWtf
d2lsZHM9IiINCj4gDQo+IEBAIC0yMDA4LDEzICsyMDA0LDYgQEAgcHJvYmVfdGFyZ2V0X2NvbXBp
bGVyKCkgew0KPiAgICAgaWYgZXZhbCB0ZXN0IC1uICJcIlwke2Nyb3NzX2NjXyQxfVwiIjsgdGhl
bg0KPiAgICAgICBpZiBldmFsIGhhcyAiXCJcJHtjcm9zc19jY18kMX1cIiI7IHRoZW4NCj4gICAg
ICAgICBldmFsICJ0YXJnZXRfY2M9XCJcJHtjcm9zc19jY18kMX1cIiINCj4gLSAgICAgIGNhc2Ug
JDEgaW4NCj4gLSAgICAgICAgaTM4Nnx4ODZfNjQpDQo+IC0gICAgICAgICAgaWYgJHRhcmdldF9j
YyAtLXZlcnNpb24gfCBncmVwIC1xaSAiY2xhbmciOyB0aGVuDQo+IC0gICAgICAgICAgICB1bnNl
dCB0YXJnZXRfY2MNCj4gLSAgICAgICAgICBmaQ0KPiAtICAgICAgICAgIDs7DQo+IC0gICAgICBl
c2FjDQo+ICAgICAgIGZpDQo+ICAgICBmaQ0KPiAgICAgaWYgZXZhbCB0ZXN0IC1uICJcIlwke2Ny
b3NzX2FzXyQxfVwiIjsgdGhlbg0KPiBAQCAtMjAyNyw2ICsyMDE2LDIwIEBAIHByb2JlX3Rhcmdl
dF9jb21waWxlcigpIHsNCj4gICAgICAgICBldmFsICJ0YXJnZXRfbGQ9XCJcJHtjcm9zc19sZF8k
MX1cIiINCj4gICAgICAgZmkNCj4gICAgIGZpDQo+ICsgIGlmIHRlc3QgIiQxIiA9ICRjcHU7IHRo
ZW4gPiArICAgIDogJHt0YXJnZXRfY2M6PSRjY30NCj4gKyAgICA6ICR7dGFyZ2V0X2FzOj0kYXN9
DQo+ICsgICAgOiAke3RhcmdldF9sZDo9JGxkfQ0KPiArICBmaQ0KDQokY3B1IGlzIG5vcm1hbGl6
ZWRbMV0gdG8gcHBjNjQgb24gbGl0dGxlLWVuZGlhbiBob3N0cywgc28gDQpwcGM2NGxlLWxpbnV4
LXVzZXIgd2lsbCBub3QgaGF2ZSAkdGFyZ2V0X3tjYyxhcyxsZH0gc2V0LCBhbmQgDQpwcGM2NC1s
aW51eC11c2VyIHdpbGwgaGF2ZSB0aGVtIHNldCB0byBhIHRvb2xjaGFpbiB0aGF0IG1heSBub3Qg
c3VwcG9ydCANCi1tYmlnLWVuZGlhbi4gSSBzdXBwb3NlIHdlIGhhdmUgYSBzaW1pbGFyIHByb2Js
ZW0gd2l0aCBNSVBTIHRhcmdldHMgb24gDQpNSVBTIGhvc3RzLg0KDQpbMV0gDQpodHRwczovL2dp
dGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9ibG9iLzJhZDYwZjZmOGMxMmNhMGFjZDg4MzRm
ZGQ3MGUwODgzNjFiODc5MWYvY29uZmlndXJlI0w2MTENCg0KLS0gDQpNYXRoZXVzIEsuIEZlcnN0
DQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxodHRwOi8vd3d3LmVsZG9yYWRvLm9y
Zy5ici8+DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZpc28gTGVnYWwgLSBEaXNjbGFpbWVyIDxo
dHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K

