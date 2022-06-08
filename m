Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1092543A2E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 19:23:21 +0200 (CEST)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyzOq-0006sr-Rv
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 13:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyzLh-0004v4-AK
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:20:05 -0400
Received: from mail-dm3nam02on20700.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::700]:2496
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nyzLe-0004bz-Ra
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 13:20:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY7jrHG/USNMyb7KIlNa1QegQh33qqcNxN3UZrp90DNIQCjAdqvBupvrusdqzyLHpBWRqVZQ2OVYEAWI0GFPDl8VyDs5430lbQerI6Gzv+ILOiBkiSevZAN19Is8FK18npHH2dTfejyPN6YSKNjYQR8P4xXd4nwJ6dNCoG4Kqqk1BuuKi/b4Uck03geCK7qSRIhJYofsjZBTp6lhdsgobuF/owXGs44kr5bN0So+CU91aEluF7GvNPViAAwQowQqCJkP/zn3ZH8TTQX+rn7HONMvBOhXK01YHyFRO/WfLGk3BLvm/gCi2aCKlRWl91/oTJAUYJ/+tb4/KWfrZPEoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVAAxAQ4Xj13aT8ZaaYu8sgCwrNtwNFTmncWxi9IuwM=;
 b=DQ1cJbgv1/iF4qxaGguUovBNdnMLAgPVYz1YvXGG/4LOW6p3VVWij6m237hHgE9SfaB7YwT9QUv5r7Hk9jalf2TMHlRgfXPyOUOQysrgV3EoaX5RlmnHk2k9Q4fKETUqtPxZsrlcxkNsU79TrqBYoui6qUFcl8Kfs4RhA+fU89PIUriKWJIDXDwIo7XXca+SGEeParSkYA5qVEdJjIYZ+GaySe9KICxAG38u0x24gAzUMZcoWYCj+soexlknoMTyPuBrxfHRm+pilxPdTI3VCaHPyG0eaNVsQ12zTu0+0QovyeSGC9kDdjpPrKZU9Bc+BWwPKBhWf7+In9A0x54idQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVAAxAQ4Xj13aT8ZaaYu8sgCwrNtwNFTmncWxi9IuwM=;
 b=1C++xcHjOJCbjEC9ec8FLdvKWYq49ML6sgLzbAFnwlXh6tYDEl9Q66NQtL47zENULx5ePwK4kpi55o17sb9/dSD06d6REf8bM2DktLyr+rJntTOhlZKaYaCDVdQcN4ksU34oyzRxpL+dbHtJLejzbNwKIl3lA4Va70j5P5NDys2Omv3jUhVxtaI4Z5gbcEMNzb+1uon7rtczR5e+RQPj+QOJ866p8w3pqJEiK1p9WGWltauHC8ZDPvl+S+7lqurtqW5at752X25aViIC6CE4cZhVmbqWXYZMGOMpL0oNbybajT2EswePsNrIlrqAionynCkwsQryOd0JW8p/I+mRYw==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by SC1PR80MB5902.lamprd80.prod.outlook.com (2603:10d6:4:44::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Wed, 8 Jun
 2022 17:19:58 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07%4]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 17:19:58 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] configure: ignore --make
Thread-Topic: [PATCH] configure: ignore --make
Thread-Index: AQHYemDoeqvj+Mu6QkWunvRCs2N9T61FkWCAgAAaBACAABfNgA==
Date: Wed, 8 Jun 2022 17:19:58 +0000
Message-ID: <57ca1102-4195-b843-ad1c-e1dfc6337efb@eldorado.org.br>
References: <20220607104908.1263321-2-pbonzini@redhat.com>
 <75ed39ec-ed5c-a9b6-c51e-94e26a333316@eldorado.org.br>
 <2f19b91a-e641-9d20-0158-c7bb71693ad5@redhat.com>
In-Reply-To: <2f19b91a-e641-9d20-0158-c7bb71693ad5@redhat.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b3ab1e8-4dbe-4a1f-e9fe-08da49731cf7
x-ms-traffictypediagnostic: SC1PR80MB5902:EE_
x-microsoft-antispam-prvs: <SC1PR80MB5902FBD7E876B88DA31D40B7A1A49@SC1PR80MB5902.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LR457FHOfN2GcFMlDSSd3JMdauVdYM8WMMvpSVdh5FJwM+4nYlOlvR14R1PWNuhn/wyqzljozFv+Sa4vGmlTSdQUOWkpJWGUryoEBXaqEzO/mFCxsEqQqbNvDZOeo6F4lNNp8KAXlX7Xl8IWRjwNmAX92ZubHZZ8zUz4zMta4VIEWTQXS0tdJzAfepY1biTUBcotZS1RNDuOjPn2z5n8slf2fvKikK3AxXv0Zk2wYQYpEnspBikpMpeKCgyCVc7hyjL5TW8tzBdpPx0E5IhnSZb2A2b22NwekueVNecRd/CBpLhQPI7B1wqYcW9PUHcRKbQzd2OH2hzykLHlQarkUDPxjA6GCqGcYdFM5HjBcwNxrvB2wKm+asb5OFCf9MOSs34U+9BrQiwCIj8xsq2zrxVbeDlUkNpCnbhzNexhrvglvOPK6h6IN5vxUy+7gaXoXkE8vIwfhHvz88ba/JNBG1NPvvCB2TNCAyRap2bhjCt8V0u8L2kjmDqkRyYYhueqiMj3OH551WtN38teVlHw2O+jK7aJCuRCBAmaA/Un37bbHSVEoogPFQwxNlDVG2BVlQ9udv2LV5GumYilSwgE0ZK6pZSTkTDW5wSWVrG0Ycyi8VymSIIzJ9iSTQgxe6tAClzx0zdhXohjDJEaFn8fI3e/nGGR9PHORjrB1/OAHq5Ms+sGCxpboG/Y1xhBQ+D2BAeHxMHdONTxsmciKFOgcBKY2rQ6vwSy2pjmlm2sdBKPxvQT9EUqLEBfd6MB9K5vzTlb7UIrpLvKAms1BhMXSEQ8tNeZR8f57SJruMHTmimZ4Wt2NFW5FNQ+RvI7j8O2bfZiG6M3sTO+5TUzqo6ld9hlsBOzmMgAqZkN4kztXgJ/62IgJgm3URZQ1zo6HRds/rOYQMXsoqaxF9a560R8xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66446008)(66556008)(31696002)(186003)(8676002)(2906002)(2616005)(64756008)(66946007)(31686004)(38100700002)(26005)(6506007)(38070700005)(316002)(36756003)(76116006)(4744005)(66476007)(53546011)(110136005)(6486002)(6512007)(86362001)(83380400001)(122000001)(71200400001)(508600001)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWZRbGkzM3g5RFh6ckJTdlBqK2pVeUZLVlEvUUt0aGxHWTNRcHV3ZW5CZGZo?=
 =?utf-8?B?OUtkN2xHZng1eVl0SGk1T0ZyREw5a0RPWHVKQnEzd1RscVdRbHY4eWdmd0d3?=
 =?utf-8?B?cXh5OGJBNEF6QkFldE1iVmZQeFhQNklyMndSdmZKT08vNnBGY2YvcTF6RkZk?=
 =?utf-8?B?S29ORDFOcitPVGwvZDFMczl1eW5vcVJLbDBiVzhEM2U2V2FLMFI1UG1RSi9z?=
 =?utf-8?B?RmF5c0VTckwvTk5hQzdERTVVVGhCd0p5Zm1VaTYzd3M0WUpReXVCU3FNZk5Q?=
 =?utf-8?B?MnFCVDEvN1FJZkpDZ0NuQ0psVWE0R0YybkxjdGFzbHQraksrb1ROMTFvcTQ1?=
 =?utf-8?B?czJSYXBLY2NKeWtqenc3eXNYZ2xCdzdSM2ZxbjNubWxFb3JKWDhDdklmdXZr?=
 =?utf-8?B?Qmg5elRzaXM4VUFHY0YxMi9nR3JjODlaMEQ5OHlYVXRvWkhCSlJkSTRNUnZt?=
 =?utf-8?B?WkNhSGdwS2FhSitCQ1N4RVZDbmhPeTY4MG5XMGQxNTMyK1NkOForelR2Zmdx?=
 =?utf-8?B?QTlaM2JRM0ZJckNYZGJWNVFyNGl3cExiYzk0MUpIVmptL2UwN3EwWitNbk1n?=
 =?utf-8?B?Y3NZd0hZZGVKdDFNdUhmSC9USFNXOUt5RHZDTFVxcFpjTUtkV1Q2NTZkUkg1?=
 =?utf-8?B?N3plcjlzVGRlQ0QzYkhJTGpreElZOVd5UTYvclJXdEx6U09ENVI3ZCtxaXFC?=
 =?utf-8?B?ZTFRalllMjlNcktiTzRLcXBhMWh6Ym5yZGJnSDI0S3R6SitDRURlZU5objR1?=
 =?utf-8?B?cWJQcStvNFg0UWtMSGpsbVdyZENKOXNTU0ZEeFlBSURzL0VwSnpSZUh1QjEx?=
 =?utf-8?B?aEQya1FTWkRrdkFmUUZLMDd1VG5GRkd4dnJOa0pxVFNXVG9wM3laMEx1NlVB?=
 =?utf-8?B?aXdNTEtmeHN1QmdrYnBhK2J5RlhzZk1Cb1dlR1BaYldGc1FHOExmczJBMFdw?=
 =?utf-8?B?dzdsbnFvZ3l2cTlqMjZiNjY1QTlSckNLRzBVZTM1K2pkSXFFMitreEZTcWo4?=
 =?utf-8?B?dWlzMCswakhkNGlmMElNQ0N6UTNqTDdGR0h1MXV1ajhOaDhEVXpzcTBraFJV?=
 =?utf-8?B?bk5haU1wdTFsN1pER2haa2YrY1ZpL3U2TFBRM2hxNmkySkx3eVNrRGJ0NnpW?=
 =?utf-8?B?NnY4a002dlJUYXJPSTBKWVhvanpzcXM5RER0QnZWZ1RzeUluK094eEYxMDVu?=
 =?utf-8?B?elNtSnJwRE5tL1RURkhSekphVU4zV0V1dzlUZlhobWpiMXErUnVBWE84eFNF?=
 =?utf-8?B?bjR4U2lYeUhsZ2FUdnVzdnJONWZkSWFzWHhuME53aTBUSU5PdnpRWmdxQU1L?=
 =?utf-8?B?ZkxWSGR2ZWdlak42MG1vbmVnVmhNbEx3VXBsSjhlcVpha2dHWjUvQmJRTkhk?=
 =?utf-8?B?RjBCblEwSDNMNXpjUmdEWmhQMUJYK2VvOEpTYkNmSVJoR212YXllOEhYd05O?=
 =?utf-8?B?MHBiQ2c0cklXRnhtTkJhMEtCK1NBcWJFbmRnS3IvL2RtbXBQbzk5dW8yM0s3?=
 =?utf-8?B?YlFkT3RDQ0NmWjg3clZqZW1DUjI4dGJheWlrTFNpQ2hwTWJua0UvT2JlaE9R?=
 =?utf-8?B?WUpHZ0wyZVI1VHRnTnpuaXZ2dDE3WmJWQnlWdXpzME5ZVHhpSHFJTHQ1b3lv?=
 =?utf-8?B?N0ZwbFVHeTNpQTNNWnhUOGJNZTVxRTRDV0Jxc0pURVZ0dVN0NEQvY25tbStY?=
 =?utf-8?B?WHJPTjkzYWFTMGdPV2g2RG5GWENOUTFTZ0dCSndGOXZyVURoWXJUR2hCOFFz?=
 =?utf-8?B?dEp3WkZuNWpEOVhydnI4TkhwaER4QjE1VDk5d3FNdXZxRDcrbkNWcU1BNmEx?=
 =?utf-8?B?ZW04TzZiaWt0ekN4V1BvZWZKZC9OSFNVWjFQcXRYQ0V1eGtQYlRST1JnWUla?=
 =?utf-8?B?U2IyTlBmWUlyWWVkWVhUVTc2bkY1dUtZL012Y2pSTnEyV3M5MjRvamlROWw3?=
 =?utf-8?B?TnNLVnI0OGU3MkVOR01XRzBnR2NTbkNpNDdZanpsS3dPakNZRGJTOE54NTJ1?=
 =?utf-8?B?QktDa0pyTjlGdkZ4Yzg2QmlJWk5FbTlEQTAyVG9JTFNSTlFGY2YxUTluVk9w?=
 =?utf-8?B?KzJITWV5TzF3QVBScW4wUXdwUlNKSVV6WWVtTGgwaDFFWUlLY2FiSGt1TjRn?=
 =?utf-8?B?cS9adU1TaklFUSttbmNIZ1R6cElrdTlPZW5CU0xSa1Z2ZDR4TnJuUTBkRjNG?=
 =?utf-8?B?UUdqbXlKaVFtOVFSdmJVRUU0eUYzVWM1enJTaU5BSTZSL0hMRWk4dmlMN1p6?=
 =?utf-8?B?MmhRVGhxcU4xdjE2ZE8wa2ZWSnQvQjVnTGJTK3lFaDVYZGdsQzNVZFRzV3Fo?=
 =?utf-8?B?ZUo0TTM2NDJTeklLbmFFbEwvSmdNRUpaWHh1TGtzc1E1L1dkbFBoRVNXS2JC?=
 =?utf-8?Q?9OvSUEYpRR5EC2BWNs6a5Ej/ff0qENARXMqkr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65419B3EE98E414984C226691069AC06@lamprd80.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3ab1e8-4dbe-4a1f-e9fe-08da49731cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 17:19:58.1797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQyJh4FYjDorKS8K4jc23gAbnvWjp12fAwPjgdzqWu90vFuWInAJqJrqcqaqKpORCCVizPOeu89GaXVip16M/8Lln87t/vurxPq3bqYwPG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SC1PR80MB5902
Received-SPF: pass client-ip=2a01:111:f400:7e83::700;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

T24gMDgvMDYvMjAyMiAxMjo1NCwgUGFvbG8gQm9uemluaSB3cm90ZToNCj4gT24gNi84LzIyIDE2
OjIxLCBNYXRoZXVzIEtvd2FsY3p1ayBGZXJzdCB3cm90ZToNCj4+IEFsc28sIHdlIHdpbGwgbm90
IGhhdmUgdGhpcyBlcnJvciBhdCBjb25maWd1cmUtdGltZSBhbnltb3JlLCBidXQgSQ0KPj4gc3Vw
cG9zZSB0aGF0ICpCU0QgdXNlcnMgd2lsbCBpZGVudGlmeSB0aGUgcHJvYmxlbSBpZiB0aGV5IHRy
eSB0byBidWlsZA0KPj4gd2l0aCBub24tZ251IG1ha2UuDQo+IA0KPiBZZWFoLCBteSBndWVzcyB3
YXMgdGhhdCAidHJ5IC4vY29uZmlndXJlICYmIG1ha2UiIHdpdGggR05VIE1ha2UNCj4gaW5zdGFs
bGVkIGlzIHRoZSBtb3JlIGNvbW1vbiBmYWlsdXJlIG1vZGUsIHNpbmNlIFFFTVUgaXMgY2VydGFp
bmx5IG5vdA0KPiB0aGUgb25seSBwYWNrYWdlIHRoYXQgcmVxdWlyZXMgR05VIE1ha2UuDQo+IA0K
PiBBbHRlcm5hdGl2ZWx5LCBJIGNhbiBsZWF2ZSBpbiB0aGUgY2hlY2sgZm9yIEdOVSBNYWtlLCBv
ciBtb3ZlIGl0IHRvDQo+IG1lc29uIGFzIGEgIm5vdyB0eXBlICJtYWtlIiB0byBidWlsZCBRRU1V
IiBraW5kIG9mIG1lc3NhZ2UsIGFuZCBzdGlsbA0KPiByZW1vdmUgdGhlIHVudXNlZCAtLW1ha2Ug
b3B0aW9uLg0KDQpCb3RoIG9wdGlvbnMgc2VlbSBmaW5lLiBJdCBtaWdodCBiZSBiZXR0ZXIgaWYg
d2UgY2FuIGtlZXAgdGhlIGNvbmZpZ3VyZSANCnNjcmlwdCByZXR1cm5pbmcgYW4gZXJyb3Igd2hl
biBnbWFrZSBpcyBub3QgYXZhaWxhYmxlLCBidXQgSSBndWVzcyBpdCdzIA0Kbm90IGEgYmlnIGRl
YWwuDQoNCi0tIA0KTWF0aGV1cyBLLiBGZXJzdA0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERP
UkFETyA8aHR0cDovL3d3dy5lbGRvcmFkby5vcmcuYnIvPg0KQW5hbGlzdGEgZGUgU29mdHdhcmUN
CkF2aXNvIExlZ2FsIC0gRGlzY2xhaW1lciA8aHR0cHM6Ly93d3cuZWxkb3JhZG8ub3JnLmJyL2Rp
c2NsYWltZXIuaHRtbD4=

