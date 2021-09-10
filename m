Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317364068BE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 10:53:30 +0200 (CEST)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOcHo-0005OK-PH
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 04:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOcGX-0004jT-MX
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:52:09 -0400
Received: from esa16.fujitsucc.c3s2.iphmx.com ([216.71.158.33]:26245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOcGU-0003Wy-Df
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1631263926; x=1662799926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ffwjbqVuI4mExuk+l5BvWaadZ4DOsuTcvogLwHxpSR0=;
 b=EzFj/8nBWoGiCiXZpKD/AYjGEZpR9nqigX2UJGbvxjcd2phXqFT+GoCF
 +OzPCbteVMSbyhFDrcgqeIcmWn8TUKVvgflSJBf/GLytaPUDCQDZoPpb8
 QdJ5rD6FMYitYvaKiUmnYmACcoaGJUeCQPDs5XRw95p5GtW/FI2lO5j5L
 8tGFcQ+sPCuBCxXBxPjNCz9Oi1IFB6bWWTxd9v8BKxDNlhih6L+T35iqF
 aaFWzFtsGibd7OAUolpNtkKAWw2yL7YbGglA2K8sUMWeHfs/3+dzzqfPC
 3mD/fvWZT2ksL+LTxSZhsYOz0O/0NDB31iWSrq0IJMHBYKSXzSIxFg+VY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="38897225"
X-IronPort-AV: E=Sophos;i="5.85,282,1624287600"; d="scan'208";a="38897225"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 17:52:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l57QdtJ0QVs+oi1E6UQ4Y5Ur5QgqfXVmNu2Ust+wssgplygasElmiP4xHgZ7j/Rs/bq4V1DetQ6HNhHHcTVXcnvrwbDoXrPTF6F9eAFFMQykytokadh4NDIcUU5GiDHx8aI3qDouARqGseVxisFHxbOnDAJhgUkg1eWeCduufchaMJwB+c3GtF0fktNuLKO2deilyUeDFUDk8n6brA3teNqi+XBFn8aSiY8Ii2jOxCJ100D2p4uR5aSybWbnqo37on9+cpbXyMWt35TUENWUpTPc6HxGVMfV53V1ZbWV2Fo+hyRaQFVjCgMu4pbMF1qg8dN7yBw378dLUd27RZjGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ffwjbqVuI4mExuk+l5BvWaadZ4DOsuTcvogLwHxpSR0=;
 b=ghD1CJ4YnrGvQiekrc0MqqG77o597siO1uRkjrVRjeX9+yMkHSQnKDEPP9iJxSF1hUKWQ1YLxaFawXnb4YsORFykAAkW12xVG/WG8OJpZ2uoeV+jNbp477uFjN9W5lJCYsHrCSFu3dFoTHtu8Af1ZGO1N1y7hr5mfx/HwKIA8TvnPrStu+6Vt4kMeIjlfmvhDsuUhy2t+KfgCoZbJxL15GiTyPI+Tw8V8H5D2w5r8SJbjXi65nLHe4PCQ9WP2hcfA8z8WQ/wviCPQFLFaQJwrbJzteHcfMR3xwxJpK3nAb3SdiDW5EeckKXAYkCFdDmmW2uSqzPFmnsxjUQ3UnFKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffwjbqVuI4mExuk+l5BvWaadZ4DOsuTcvogLwHxpSR0=;
 b=dCPI9UXHTn24OhiECWTBhcHV/YzUJ1jz7psOttziFQBBATWf00OfX0YHHnceDEMXiu8bVwwiLC7cQtCVp4EVk6Jxh+BKnT9xzcZN8YEllml6KLe4gCl78vomcYLDp+uSqQ0PN7J+JnyGn0FzRvYy9ysrXMbK8QGAlZmaKxTH5Mg=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7429.jpnprd01.prod.outlook.com (2603:1096:604:11f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 08:52:00 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9%5]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:52:00 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "quintela@redhat.com" <quintela@redhat.com>
Subject: Re: [PULL 0/7] Migration.next patches
Thread-Topic: [PULL 0/7] Migration.next patches
Thread-Index: AQHXpWZwLalhDfi+t0aNkcxSWvLZMaubtioAgAASgQCAABdGboAA3FgAgAACAoCAABovuYAAHuQA
Date: Fri, 10 Sep 2021 08:52:00 +0000
Message-ID: <1bdaccb5-c949-c5c4-cc9f-17a416e81dd2@fujitsu.com>
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
 <87fsudn30g.fsf@secure.mitica>
 <14fbe8b5-0212-c0fd-e0fd-4198ab5d217b@fujitsu.com>
 <dc771570-e47d-9926-6a10-11ad3bfa69ae@fujitsu.com>
 <87bl50ncd0.fsf@secure.mitica>
In-Reply-To: <87bl50ncd0.fsf@secure.mitica>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ff93797-ddb1-4c67-0a65-08d9743840c4
x-ms-traffictypediagnostic: OS3PR01MB7429:
x-microsoft-antispam-prvs: <OS3PR01MB74299780231E41F952D54206A5D69@OS3PR01MB7429.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZzEINWGF1yLOzd9WaS0iW27/C/ptTzB3zGJ4m/OyXyAffngOVA4VPZSbfl/cHTg40fAgdRvgFrhl0zuwCmf2swEdNqkAPxG9jzIC/WqyTYZ49t2yIdvV8DfQJ5JaUuMXy1M7qsbHcMgm1x+dBSvKMHH8hSwXoz7m5r+46As0l/TgzAqu8CrLJxqU9t7e8OT18tg3+KAmAqDAqVgdjMpoVSTBCL6+cDuzNCH2a8fcGmGQhMk1gti3ReObb6ZZueqpd1RcgW5qNiUeGUK6oj4etOML7bVc6abQtIJBMRr9CdzjX4odUxvOzVj3Up5l+4tepN/mBsMniIFPBrnC88fsKEDLXohNfwS7WYkIA7elzPxxm1YAqP+aSjcdN5+nMVUz7+LDQ471pyzbjxEwF0avX3z/cL3VqTIwkg890gQGzbG8p8FvjcxYxpZ/VYfTwQkch5sroerY7601AG9FARTmH6hAd4NLzRhhKZG1CPae5VwbN/Y3F/P259rM7tcfAoazPzHsvCjPQt6XShdkmagCxSsI4bb4dA/G8HmGru1j0JqPz1O011Y1SgX0WcbqXjnJYFnUeiADtf+bc00N7fcxOrkSJhNqOGd3ihYyDZltsil4EaCXyCIldFS7/mEC7M4v27aUBJogQow6ahFkxgwYH7rTxTa8FDurx5vK7jVjMDLKtt6JqZuJnQjc5h8BizuUKwL53wyiKhh7o8hKi86mZvfxG9GccSTgS2DV/XLLdymifXucFqj3RY6JckvU2sjTW/uQyPGeB0d+VwAFiqdRFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(54906003)(4326008)(91956017)(186003)(66556008)(19627235002)(8936002)(26005)(64756008)(66476007)(66946007)(66446008)(85182001)(76116006)(31686004)(316002)(71200400001)(8676002)(6486002)(6506007)(53546011)(5660300002)(6916009)(478600001)(6512007)(38100700002)(38070700005)(86362001)(2616005)(36756003)(83380400001)(2906002)(122000001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHpDdGptLzVIMzBJSWg1UkQzTEZrWEI5bzE2SmlyU29SMHdzQktjYUd1anlE?=
 =?utf-8?B?QzVzSStMQW1vd3prN2lsVHZGcDlySWhYZWVTNG1Wc0NjQ0ZXcFZGOUdNZnFp?=
 =?utf-8?B?eDUweWVPVGJqY1hNTnNKWU1hUHJxQzNCdnpwakg0d1JtV2ZaSE0zaGZIdnlC?=
 =?utf-8?B?ZVoydjcvRUhVUzRGVTU1WEorMm55Y2k0NGFDclBOVnM2ZmJGWGp1UHNLS2xh?=
 =?utf-8?B?a2lKM0xZck41TTlNNk9XY2pEWCtaTmxGZHVRYjZrVVVwTDV0SHJTLytSQm1l?=
 =?utf-8?B?SG90cW1BTkltc3NRdld5Ykdvb3cwMDNJRW9oT3NZMHdmUC9ucTZOVGJIbU90?=
 =?utf-8?B?cG1qeEo5U3dpSnNGMk1TUVlhaGVEczFlVEg5T202cXROTk1HQ3BOK0V2djBC?=
 =?utf-8?B?Umd2UE1GYUhDN3crU3cwS3hkeVpvMFJmTm9pV013cHl1OXU5TGZwZkRKYjVT?=
 =?utf-8?B?ZjZaYVNqVnpyclppakZseDhrZ2hXNXZRTUZad0pabXMzR29vaC8wUEE2YU9O?=
 =?utf-8?B?ZlRWUitxVC9vaG1RZFppcTA2UmVjMTNVckt1NmI5Mjg5QWYzMDVrTVd3V3J6?=
 =?utf-8?B?aFRzNDNQWTBIdHRkN1d4Y3NyV2UvVld6Uno5WUhsdXYxU0s3T0diTUd1TW5r?=
 =?utf-8?B?YXU5SXNvV3BZK3NmaUI0cTFyS083RUd3V0RrdDJrUXdFNTR4N3ltSW5DQ2R3?=
 =?utf-8?B?TFZTL2h6Mko3RHREeENOelFYS2ZQN3FscTgwMk5scVQ1M3NQVElRdWFjNEFh?=
 =?utf-8?B?R2kyVEljRVdQQ2hPVVF0a3hDMDgxckd2RWtFVUJjNmFTM2hkSmhSWlBKcDlF?=
 =?utf-8?B?bEhoUlBCTTBUZFcrVDhDaWQ0NS9XOXlUeTNpNW0xblQxbG9yOVgzbEJNOE9H?=
 =?utf-8?B?RHBwZEphTnRPWk9RajAxdWUyTE1TSEQzK1hLeUVaa2JJMzdGbEdxT3FHeStV?=
 =?utf-8?B?L3gxQVdxYVpoV1cwVHk1S1hBZGlCb2tHUG9ucmxBU2hKR3oyaTJWdWQzaitu?=
 =?utf-8?B?djluL1lQWEJFeDJTQU9WWlV5OXRSbVFnUzFTNlUrYkZucXlsQ2svRjNUVDZH?=
 =?utf-8?B?NVJHZEt4TU9pc3R3djdMUllyUnBSQUtncWNHL3AyaG1hS29SejFic2hobzha?=
 =?utf-8?B?TXR2OVhnc3V6eW5lbG0zM0kzV3JKSU8ycUtKRExHMFNibXhmRjN1b2xhNG8y?=
 =?utf-8?B?ZTdzQXl5QXRiMW1jR1Q5cDVlMldmNm84RTd1MUR1OEdqUG9IcHJpMVdOSWdM?=
 =?utf-8?B?UDMrblVKRFZ3VmV3eEYwNlpiS29MbkFhVWhvQVoyUmJrRTRnWW5UOEdZOUVL?=
 =?utf-8?B?WGR3OTIzSU9mQ0hlTEtSaURQNUhYSGdGWkdhNk16MElhSXBTSjZ4ZDh0T3Nv?=
 =?utf-8?B?RnlqbE5aZWhkUTVEOUw0cThRbWROMXVmNWxoOG9YaWI4VXRISFdSL3FDcDRy?=
 =?utf-8?B?dnhrb3k1T2ljQ2lsNFJDNU13b3VpcmNqV0xsdDl2dXUzbE53ZlBsUHo2QTE3?=
 =?utf-8?B?ckFoNVByWVUvTzh6TzJjWHJiTFBORzFXVkdSMnNLU0wrMUwrelQ0cEhBRU9J?=
 =?utf-8?B?cVJtT3AxalRWa3ZKb0lkM2s2MFFrbTY2d3NzWGFVdjd2VTQ5amJNOXhkaG1G?=
 =?utf-8?B?MlFLK1RTR2l6MG5MTTZjVEZScWdJWG5aMlBkSU1uQ0hCRTlpNkpJQUEwaHFx?=
 =?utf-8?B?QTZMTTZuWFdYS01yZ0RNZzBxdGVxNmZiSEt4TUFvT0pjdXhSS0ZyYXJ4RkFm?=
 =?utf-8?B?eUN1Y002ZDJ5b2IxZWxzYWMyRzVqTDg0L1pDTE5DNE5ET2o2WDNGbVNwbytX?=
 =?utf-8?B?cUxXcURnMERIOFJmYXBSdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B2AAB595AAE854BAF5AA382D31743C9@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff93797-ddb1-4c67-0a65-08d9743840c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 08:52:00.2230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bn4Pnbr4NCpQPVCf7q7dQ0r/2bOGR9qx8KoGKDXE2IM9/m6jFDCnkRJwkVdMxRgRQqICT6z7TZnmBaxUhoUBvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7429
Received-SPF: pass client-ip=216.71.158.33; envelope-from=lizhijian@fujitsu.com;
 helo=esa16.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDEwLzA5LzIwMjEgMTU6MDAsIEp1YW4gUXVpbnRlbGEgd3JvdGU6DQo+ICsrIGdpdCBk
aWZmLWluZGV4IC0tcXVpZXQgLS1pZ25vcmUtc3VibW9kdWxlcz1hbGwgSEVBRCAtLQ0KPiArKyBl
Y2hvIEhFQUQNCj4gKyBnaXQgYXJjaGl2ZSAtLWZvcm1hdCB0YXIgLS1wcmVmaXggc2xpcnAvIEhF
QUQNCj4gKyB0ZXN0IDAgLW5lIDANCj4gKyB0YXIgLS1jb25jYXRlbmF0ZSAtLWZpbGUgL3RtcC9r
ay50YXIgL3RtcC9ray5zdWIuV0tqMW82b1Avc3VibW9kdWxlLnRhcg0KPiB0YXI6IFNraXBwaW5n
IHRvIG5leHQgaGVhZGVyDQo+IHRhcjogRXhpdGluZyB3aXRoIGZhaWx1cmUgc3RhdHVzIGR1ZSB0
byBwcmV2aW91cyBlcnJvcnMNCj4gKyB0ZXN0IDIgLW5lIDANCj4gKyBlcnJvciAnZmFpbGVkIGFw
cGVuZCBzdWJtb2R1bGUgc2xpcnAgdG8gL3RtcC9ray50YXInDQo+ICsgcHJpbnRmICclc1xuJyAn
ZmFpbGVkIGFwcGVuZCBzdWJtb2R1bGUgc2xpcnAgdG8gL3RtcC9ray50YXInDQo+IGZhaWxlZCBh
cHBlbmQgc3VibW9kdWxlIHNsaXJwIHRvIC90bXAva2sudGFyDQo+ICsgZXhpdCAxDQo+ICsgY2xl
YW51cA0KPiArIGxvY2FsIHN0YXR1cz0xDQo+ICsgcm0gLXJmIC90bXAva2suc3ViLldLajFvNm9Q
DQo+ICsgdGVzdCAnJyAnIT0nICcnDQo+ICsgZXhpdCAxDQo+IChtYXN0ZXIpJA0KPg0KPiBEb2lu
ZyB0aGUgdGhpbmdzIG9uIHRoZSBjb21tYW5kIGxpbmUsIHRoZQ0KPg0KPiAgICBnaXQgYXJjaGl2
ZSAtLWZvcm1hdCB0YXIgLS1wcmVmaXggc2xpcnAvIEhFQUQNCg0KSXQncyBzbyB3ZWlyZCwgaSBo
YXZlIG5vIGlkZWEgYWJvdXQgaXQuDQpJdCB3b3JrcyBmaW5lIGZvciBtZS4gOikNCg0KDQoNCj4g
Q3JlYXRlcyBhIHRhciBhcmNoaXZlLCBzbyBJIGdldCBjb21wbGV0ZWx5IGxvc3QuDQo+DQo+IEkg
c2hvd2VkIGhlcmUgZmVkb3JhLCBidXQgaXQgZmFpbHMgZXhhY3RseSB0aGUgc2FtZSBmb3IgZnJl
ZWJzZCwNCj4gb3BlbmJzZCwgLi4uIGFuZCBldmVyeXRoaW5nIHRoYXQgSSBkZWNpZGVkIHRvIGJ1
aWxkLiAgSXQgZmFpbHMgaW4gdGhlDQo+IHNtYWUgc3RhZ2UuDQo=

