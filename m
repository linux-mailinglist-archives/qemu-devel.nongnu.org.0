Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093BE43561B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:49:03 +0200 (CEST)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKOL-0002aM-Ox
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3h-0002VZ-E1
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:41 -0400
Received: from mail-eopbgr740135.outbound.protection.outlook.com
 ([40.107.74.135]:53168 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3f-0006qY-V6
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxpv6fe98kRzGwtlxDC916BKcl18+gT+rHBNVrEnF/jF5rN9QAQgdU5Xb1MXM8+dtPZy8ggJZJiFkfIJYewdaoAEng1mydzyGSbYT/ebwhLR/hD/zROcNJavXMtUHg+2RSYG1Br0Lad/NFvlcJwiNvGG1uTogFEP591Rof6LLikqz91ObC8OjrilyvIeX85pLU+Ab+mGphPVc7Bu5r56onuh+G2Rku6QTFUwFWNe84C4blC32ne71InHi/F3/q5+Fmp8xiinOjZi13Uam21mjapD6pDw97fPjEmi7V6FNMI81zvQCl13Cbc4+8uENiNxAFbkL6jSr22hGd0UsirSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igorPH7JNHmttvJPQUMn8JiCZbPRta6XWta7JpWGIOw=;
 b=FctzrN2c4yPEPF29tjXEyJFCTUFM8pbDp1IYYT9t/xofya+CqwEm+BQSdNHZGatmakaobbm6WgEKuXafD21vgxZPWrpatxuqkX3KrjGY5CLFNEsNLgxlr/OASAUjLUEBt9LOB+R68yiAhDh+Dc2klAFARt1Ui0MV0TLwwHkEKBRR7LVE4emq7euWh8Wtl9VKEAwXxBr2qadMwA3lNPm2peSN01DUrpoU9z0ZlVytGMKgQvqYWnZdl4R8ScpyAby1K95GkQ+osXt207ogCh/si8WTVZeSp+cgPAbvzuAY7IFR+IMmASQmhRy/BeoBoUH+hXScoachv2Lso9F4zA/CLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igorPH7JNHmttvJPQUMn8JiCZbPRta6XWta7JpWGIOw=;
 b=WZEdGAuToiJpnrXIIOKnzOC1jTSeitlQ1E5+zKhepEBqhdjGAbN6Jw7u4sdLkpTIDUFfMAMwhFqElPeNmmtm1xrxeiYYM7H2qs6x+AO/09MDiPjmMCeAUQZCQh48yQEC2luker7NYRXCLpl/vMtW7/m/nNi5ZVEfH2aKQLzXP3IIuP2ArPQUYF3SjfLk806wkpv1TlXdb+rj7R0iPjROeze7I0ZvZp0/LnbOIuUxu+jN2ndmhgoj2t9rOnITcW2O37/sA8kdjbsuGibGk4TcrV2TWr2sN/qbpPEb0Hdp8rRHVcGYgC8mR9tWe7JPh72SRZTAyP+UGiHcbkjsb72SiA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:22 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:22 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 11/48] tcg/optimize: Return true from tcg_opt_gen_{mov, 
 movi}
Thread-Topic: [PATCH v2 11/48] tcg/optimize: Return true from
 tcg_opt_gen_{mov, movi}
Thread-Index: AQHXu7fk3R8duI+3s0+7yN3iCJcwSavchqcQ
Date: Wed, 20 Oct 2021 22:27:22 +0000
Message-ID: <CPXPR80MB5224753717C3D76AD919AD0EDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-12-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-12-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c6a0736-8d66-4a50-8fdf-08d99418c915
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB44823A57527F7AF97DE0555DDABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:353;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8iTDO/wDH2xxegKYvUJmagvo9ipUhpJ2PjEhaphh9F9he4vwY/fv6anS1iy9KJIPMSYTXfiZ6WZrGLrx9Cc9h5h66nHRpr0o+JbdccTMQ51tJUg56h0nKANzGeKnVN9YcTDpnqFlgvdmCej909TZE3UnMPNUtvcOEJZc0CZ9sAWL11HhZQ7vXp9m2v/UX+usbJfxapieQU7GFzc0b/lUDxAHC7eL0FdbnI8xrj0jBwtIoPsxapKfXGdMZiL8EfwkhE4PodIWFR/Ey0UhFUBD7gBuoinzBAXjTqsbFTNt+jzWgmeyhkMjsECOiVgz59w5RJdepurAPoNa13VvURwjfTSygVg7ZfG2fZj4x5KQ8lAmAEZNk9amx2s6qyDbKy/Vf7MW12lZChmc/68/4uRIeeg1cRy/HhkIHkF4/c462TqYvtEte3PrL/fsxZ0g2AGyE7SvyuO5DhBSZylMm0qt1YEvaE/H2UziWcIozZfvnebB6QQfPONJLwwMRJ8yQisZJkB/Vxmk9JgcwJE5128YcuhC8dxoHCTCvAc1RvL4ZxKJ/w377lqKNQ5QLeVLKuIcKqLkaicL3bw7mAaUn7DZYrV4Cwfs2AtgaD1IFHLK9p844/sAIu/4MIv1kW4um0DMGOUIHyov7BHk5aa9mbjI7Ee9zCoLK5zIurGTJkt2tLrF0eSNV2gyrJQRFJDjuagArycdk1gk/KQVDpc2XgdhmsjQqz4bm0Ba+nomw7BZitXifs7DLmUMz/kEaP5n88YcAwlNwAU7y2L4KktcAkGkjT3uE9DsPTcpbwAL4Vj+QAk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(4326008)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVVpN2x0Qm5aT1hVK3pLMEg2SlRZT3J1NDFJVnpuOVZiSkF4UnpYMjNBVnJ5?=
 =?utf-8?B?c3R3Q1NJbVdRay96S1BUay92SkFKRSs1Z1M1Q3RIWWxJc3hhWG9xRS9mVjAv?=
 =?utf-8?B?cVc0M3dURC9UQkwwYWQyYWkySVRWbS9BUTd1K25mUHlmV1NjMEJHeGZJdnh0?=
 =?utf-8?B?VmxCYVREMksrNklrNHZkSUNkL2pVMWNIWmYrV3NGTXMzTEsyZVo0L0dDSnIy?=
 =?utf-8?B?SVQwS0VaT1RFVEdWWEpGbXNXUzI1RkRHb1ZOWXhOMWcrQTVpRnloTzQxWDVH?=
 =?utf-8?B?ZHJCdnRlNk56SUZ3UVBsV1FnQ0RYSE1SL09xWUYxWnFXN3FvODBOVGc5VmxU?=
 =?utf-8?B?MlZmSUt6d25RSVVCMnVFbUJzUU10dUVpOFIvNkhMcUNIZ3BEZlhWTERKY0p6?=
 =?utf-8?B?YktyOWtldmRpb2hLdmVIVnNHRkUwbFYzcDE5WUE0ejk5bmZOdUVRbkJ0WWo3?=
 =?utf-8?B?NlZtbGREZnowQ2tjWDBibFZ3RU9mRmxabVdDenA5aW1LdVlqVTI0ZXdiTDhV?=
 =?utf-8?B?QkFLd0R2WHd3RTE0NE5kQXZlb3RjZDA3M21WcWx3V0wydVJJb2xIZTl6eklT?=
 =?utf-8?B?S0g2dGp1SWg3ZUlzejZWdHdXZ3NQMmZoTG1LZDJsZ1hmNmpwMm1Sdytaait6?=
 =?utf-8?B?WnpJZ2orMmp4SFhBSEpYKzBnQnE1NHFETWFqRHdEbmlzb1FRTGRLK05qOHkv?=
 =?utf-8?B?bkRKRVp4MmRxdjFtOEIvNTZ4ZXJIVERiZzE3dStxREkzUHIxL3BIZGVJWjlw?=
 =?utf-8?B?WldSVUpGLzU1aCtGRm4rRUMwdGVuNmd5dmdKMnkrS2cxY3dOMUxXV3NRVVRT?=
 =?utf-8?B?anRHU3VzbzBpY3NJSlNRSDZ4bngvbWRJcUIwaXoyaXh1ci9RTzhOMnlYRDRi?=
 =?utf-8?B?RVhjVnd2ZXl4TU01MXVpTnNkRFZtdUlNdGxQNHpqb0MvNmhiNnU2LzJvaEJ5?=
 =?utf-8?B?K2E1eUlEWkxFeTdpSjVwOTNIODZ4QUpWS25MbE5ucXdaR1ZkU3duOExvd2hL?=
 =?utf-8?B?K3VETTBYNnU4M0hRV2NHNUxhVXZIbmVBRStHbGdJeVFuZExmWmZVTXVHcUYw?=
 =?utf-8?B?eFduOURSbXNkc3hsckZMU1BWSERjeUpxNXQxL3ZhTGJvRVVlcGd3bUx6cHFp?=
 =?utf-8?B?Zzg2b0J6RU5tS013NTZkZXFsNW81dCtDU0J6N2pOZ0VtR2g1Mm94b3RCMjZl?=
 =?utf-8?B?L2ZVUnhSdnN2RXVSNjRiNEhROTBmUXNuOE5vcTY3R1BkYlBOTTNwazIyZTFD?=
 =?utf-8?B?NjJMWFY2TFpiWEFEckhSR2JXWFgxQjdvNXo5aDJNVnJrSUoyb1h1RXZXUDBT?=
 =?utf-8?B?aENmbENsaFkxUFM5djJnWUVueWJpZTRGNm9CdzNtbWtGN2pBNXFuc2tFSTZv?=
 =?utf-8?B?K1RFdVBjZkZvTEJOY2p0b2NQRjJwT3hxUUIwOVZiSEUvcWh6OW1Ba2Nmb25X?=
 =?utf-8?B?eEpVRUtxTFhxUlI5VktxTHgxVHZzd08wUDNGMTdSVTlvck5TZVdJMUkzSjJz?=
 =?utf-8?B?a1FoNW4vcUJwaFV3L2VWM0d2OHhGTXRySHpvOE45akpQcmx3NHFBUFFkQnVh?=
 =?utf-8?B?N2gzZkFadVdWRE5MeVQ5ZlJOcFhHZEdHbWJGRmtqOGdlY3R0Vk1BMkNJTWEw?=
 =?utf-8?B?TTJBOFpmc3Z0OE51YjVKZU00b0dWSWNBZTEwUUJ6ejhnbWR6RmhKYVg5VklE?=
 =?utf-8?B?N1lsS09VeEJ0MGhyM3B2Nm1CbVY0Ty9EMWRja283RVZqdVJjYmlnblJIeVlh?=
 =?utf-8?Q?UzLcamwuodiV+hNxqREGGC3Ad8WoAnuqTrYou0P?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6a0736-8d66-4a50-8fdf-08d99418c915
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:22.1566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.135;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
IFRoaXMgd2lsbCBhbGxvdyBjYWxsZXJzIHRvIHRhaWwgY2FsbCB0byB0aGVzZSBmdW5jdGlvbnMg
YW5kIHJldHVybiB0cnVlIGluZGljYXRpbmcNCj4gcHJvY2Vzc2luZyBjb21wbGV0ZS4NCj4gDQo+
IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPg0K
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZz4NCj4gLS0tDQo+ICB0Y2cvb3B0aW1pemUuYyB8IDkgKysrKystLS0tDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpSZXZpZXdlZC1i
eTogTHVpcyBQaXJlcyA8bHVpcy5waXJlc0BlbGRvcmFkby5vcmcuYnI+DQoNCi0tDQpMdWlzIFBp
cmVzDQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPDQpBdmlzbyBMZWdhbCAtIERpc2Ns
YWltZXIgPGh0dHBzOi8vd3d3LmVsZG9yYWRvLm9yZy5ici9kaXNjbGFpbWVyLmh0bWw+DQo=

