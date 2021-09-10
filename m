Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72E4066AE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 07:21:58 +0200 (CEST)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOYz6-0005MI-Mb
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 01:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOYxr-0004bL-6i
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:20:39 -0400
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90]:29665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOYxo-00051d-Jr
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 01:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1631251236; x=1662787236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Od1EZvrcvCTlJVEMlQhe25llkrwQU+hEvzDakG9vFvM=;
 b=yqQwpxy4aGlchY8i7M3yE1gmFWu5irZugSYsgrHRV+Ank/x4zzg1cx2c
 pZdExTjQ4WiLuUOJbXne3/sTfwCprHoVE/2lbydnm8SxJyBwZCIYVcnQz
 avCuuQgcSd3muV573BEHOPy1CicR0IrxENbVfZCLXgaIg5p3ZBWCbyEeX
 XaewYM5bMmCogDX2wTH60fzlpHRXw61iTnzL1xlYckFhSQTZ8AnQALkvw
 Nyy/Rfzq+ONw7B1AmczSQI2kitnl0xLEfqmt2bpu2nM3KmAZ6otVIUZhb
 GO2mq3DHYJ8TMfG3vATHsv4kneNV10qKE5CfUHJsm4zcugdmgckIHxVLR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="38977261"
X-IronPort-AV: E=Sophos;i="5.85,282,1624287600"; d="scan'208";a="38977261"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 14:20:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7hAMUAQLN4OUJfitRMz+W6OmhrHqlFyvGZ5g3LfPwi1E45Gr7rTqtpi4nxAP1/OXdO8yEirfM+TxTCvnvc30u4oudGWrLsr8oZMLmPHg3PIpthDURUn34RXTj8RPIStcg7DsTOnOjN4Tg58D2mbQS8s17wZuCx4h5RrO4+YcQ5xRdPEYmofZxNXshfPRtG8pF7R5iJMxSTRn1y1sdTGCrd6sEz8mwR5+cQWqnSesBBF7eeRLGbz7fdTD8gGQf06OJAthAEuggKHZ5bsM/K0hJAZcrs3oYUUpxQKx/DynG76K7+ojW094Dr0SoZIe7hyAcw1LMjs+IVvUNEoiKvPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Od1EZvrcvCTlJVEMlQhe25llkrwQU+hEvzDakG9vFvM=;
 b=EGU1Xt/3UWiSxdOXj9td3hihrklaWK2S9Wa1rYmrdtHrF9/foiTeTh5FsEG/k+aMBRVCu9OjlLB68u3GasIl5D6HziOsZ4NXpC7fgL1wUreL6hwV9Svnmz1kffNUrFojfIHRl/VVPjPMOom1akt7oMrO5S8UTR6wMAelAHPFnfbji9Fmxu9Z5EEiDbIxpzDvdjw6EYAcM6p24ZiVPJ3JSN2wGmxz1T4on3hD8rHrUclOa7gMlCZoJGECK7mj1DhH8a8+40kdWmvZutEF/NDUa9r7fKH8a2lbKFJpKDBiQfJXQ7VgZrgYvNU5Kkd5aW2dnJ4QYMZNyvcO5BsqGMi9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od1EZvrcvCTlJVEMlQhe25llkrwQU+hEvzDakG9vFvM=;
 b=bf0h09IVmctwSjafoKfEnT29oeBW1v26Zl+4nb/ZPhH2ZSWdWBfcQNQQpE0Coz5SVujLN/6C/JlddS7ZBM4AO8uS4+PJNV2l25yChXu32xGTRv+SeZCgq9nffBBaLdDzNwcx/tNoysqsEJx5dG2HCYBj5k8sZfTpKs4BzPaNf8U=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7754.jpnprd01.prod.outlook.com (2603:1096:604:17b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Fri, 10 Sep
 2021 05:20:30 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::7407:c85b:2ea4:2ba9%5]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 05:20:30 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "quintela@redhat.com" <quintela@redhat.com>, "lizhijian@fujitsu.com"
 <lizhijian@fujitsu.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/7] Migration.next patches
Thread-Topic: [PULL 0/7] Migration.next patches
Thread-Index: AQHXpWZwLalhDfi+t0aNkcxSWvLZMaubtioAgAASgQCAABdGboAA3FgA
Date: Fri, 10 Sep 2021 05:20:29 +0000
Message-ID: <14fbe8b5-0212-c0fd-e0fd-4198ab5d217b@fujitsu.com>
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
 <87fsudn30g.fsf@secure.mitica>
In-Reply-To: <87fsudn30g.fsf@secure.mitica>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afc94dec-e46f-47fc-bced-08d9741ab4d2
x-ms-traffictypediagnostic: OS3PR01MB7754:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB7754DBB8F8137544343FF5F9A5D69@OS3PR01MB7754.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PbLTGV9cDMprwXaKyFaDu7I9IpPTUuoq0BzaHLtAGwgNLVHIGB2/c09PJx/s2h/3YOTSzKgrXGmt3zh1baR5Rjrm4luXJPJP9FpYkNjLiiJIA+NQjAJVYdT+6wBiJXxVMGx09v1ARw9UrkdhdxfZ0N0AbgGXkVrz9W2l8RFHZvGGyBjY0JLpeCwSyhuRZb3VIBeBmyDKIcTN5sjdXw5+rh3dDqKTKHBX9X9OeTdtza1aN+XHE6VpHMy5rEhPA5hA7+CCz65aVI3DMum8EOAz9e4tZs5ZdNjB5wr/JBXy0WkWihTnmHIF/hphGJ4hA8BkzyZ8QQfiVec6u1j6iQrTLhTiJfKXs3O/7YTpTnUlsMqcgSy++CQTDSBaxSqWY5PpCfWl/LD7FTZVwUSTT81NZpk/ETjpwP89734NW17rVxxqM5xIpGCij8A2GPg9CcjLps4P31s747RKQ4Qr0k9z2jBbeJ9zkzV9z1aFrRE8MePgZCvQ4TIyxrb/tqFSqbavTXEgao6Z/GtNisfRV1r9v3DdtFdLGjjCaQPJV6zKuOH1BAEkPZ50o+blswNqkiCJ2Q/e343Uyfnbjd9c/86uCucGe/FAdWNpbHYkQ+Sny46kVjou/KSLgRmZzT7U94uWdbqNkGFJKWItq6zAS80u06/JjWFFAdiscb5QEz7U6FvkBwCF8dEKWkq+QarZ+949DE2ruStOb5GzidqZut+wo4SKJp6PsQMWshlso+FYqDlSCjKiohoNfRinO6dH3wQMxCaEqoUymt0/TQQL7GWnIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(8676002)(2616005)(64756008)(66446008)(76116006)(478600001)(26005)(53546011)(8936002)(91956017)(5660300002)(66476007)(71200400001)(186003)(85182001)(4326008)(38070700005)(31696002)(122000001)(6506007)(316002)(66556008)(6512007)(38100700002)(66946007)(54906003)(36756003)(31686004)(86362001)(83380400001)(2906002)(6486002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU95T0xISjNDaHdOd3FITnZlT0lhbEdCcGo4eWdVM3lvQmZFbDUydTRZQ2pv?=
 =?utf-8?B?UHRXZFdwZHJzVVdES2p0N3pqeHlFbzBxbHdQcERRNmoxUTNzV1c5SUsxNHNT?=
 =?utf-8?B?KzFxemViYU5mSVMwYnhiT09LTHpFUytETkpDRm5lL2sreUF2QUx6dm5LcTI3?=
 =?utf-8?B?em1Ua0hLemVFN0JxbkdWQ2xjZ1IzN040OC90WEJNL2pyRFZLWng3SldNK2E2?=
 =?utf-8?B?aWkwY3NGTFh3Z3JrSXdYQndkMWRndTdDY256NkpoQ05mdTNnU0kreWRsRHEw?=
 =?utf-8?B?emxSblB5WGdNZ2k3TnZUckFWajUwckcyQVJ4amZJUUhyb2RMMG5mVHN5ZVNQ?=
 =?utf-8?B?ODc5ZjhXNC81R3FoVk8wbHF3YUtYV21zRkdGS3J5YjlDQnk0N0pSL0J5cy9R?=
 =?utf-8?B?UzZOOERnTXI0RXhvNkkzNEU0NlBpOGkvTEhxcjlVUHFTRnNrN2tnTVh3eXlj?=
 =?utf-8?B?ODdUVjBmZEV3UWVpZ1ZLeDE3ZklQMFU1bE5la0R0ZXhXOGVsZHhGdVJib3Fp?=
 =?utf-8?B?bFVGWGRaVTNMa3pFRlVEY2l2VmllQ0UzTnlaTG1udmVyZk1GaU9MSGU1dTE4?=
 =?utf-8?B?ZEJLbEIyL2JiMGFCeEFFblJiQ2g4VFl2emZkSlZ5dG9MbGg5WXdsd2ZURUhq?=
 =?utf-8?B?a3lBOTVnQmpjblpnU1BBUm9obUNDLzBiOGIwZ3dhbjRxN0hrcjVKOEVSc3Fo?=
 =?utf-8?B?K2lsTXc4MHoxTVVUbkpmTUpGT014T2NYYVNlY3I1M1JxcXFWNi9hQ1h2a1BH?=
 =?utf-8?B?K09kRGk5d1FJcktEbGVzc0xQaUIrZjY2TGk3ZUN3R0xaakZmMzBQZG5ZYkFv?=
 =?utf-8?B?bXdDRHJyRGEyV09MbG1NR2Z5bHdnRjY5aXA0OVA5cWFxdlNLNVFBTmNKRVpy?=
 =?utf-8?B?dTdGRG9mcEo3cWZ0STRVL0JSb2RTTEpXNXI0U1Z1dEdlVzJHM3FGSXA1bnZP?=
 =?utf-8?B?aWhsWVlBTzRGZEFBamdnRGVVK0VrcEVHYzRRUkJnYTEwSXl2SkIxa1p1dDc1?=
 =?utf-8?B?L0xPb1RIMGE3YkVMTHl6R0UxQmxlRFp3a0RhRnhaWTVEWlg0YjVwNnZwSUZ6?=
 =?utf-8?B?ZE1UQ2x1Y0lxOFVwWFJwMW9qaVpTcm51UlV4OG5Ud2dqZlAvVFMwZGc2WGIz?=
 =?utf-8?B?R2dUaFF3L2xIL2FLYlRBYnNYaDNxR1BwMDVDTEp4SnN0TWs2cGRuWk9GMnhp?=
 =?utf-8?B?NGJoaHdoTndVeHN4aE1uZTcyUm9WVndLd3V2MW40MlEvVWh2YWllOEozSVpE?=
 =?utf-8?B?ZkZoZlRrbkI5Z1EzbzlUTDBKbm1Gbk5OSnlGUEh0WGJ1ckdndEplNE9YRXRK?=
 =?utf-8?B?QmdPYkdzRGJVQ2t3YzN4QVdQTjkvbi91ZTZVV2RZTUlNRjg1UTRQQVVlaDI5?=
 =?utf-8?B?MHhQd1FYRXoxVm9Ua0s4ZlJFZ3JCK0kxM3RxTkVtVDNBM0M2MDdROEM2Ymx2?=
 =?utf-8?B?bGN3RVVlWE94RVNKbUFkeEZsVFBPTEM5d3Mvc0pDOVFtV0FKM1lWaWVyZFlo?=
 =?utf-8?B?anp5bkxtQ0ZMQnhSekMrT0JTSDA1TmdUOWRIVjFjWHdFV0liYlFETDBDdzNZ?=
 =?utf-8?B?WUZna3o1S0szb3NESm9WNTR6SmZkYmRYZHd4ajF1SEM0TjdvQ1JOSm5iYWZL?=
 =?utf-8?B?Q2Z6VVJ1aWp3Q2VLZjFnVkRIUHR3ZGNWWmVqMlRqV21CdmUrcXFGclAxZVFt?=
 =?utf-8?B?bUdrdUp4OFd3a2NjcWsveURQR015STVGUWMrMWNoTmJ0QlR2UHQ1K0dqUEhv?=
 =?utf-8?B?N0x1NmhtOTMvUGJLNWord1cwTnFuUzVocHRxeHpQT0szbGNNT0dxTmt2NUY0?=
 =?utf-8?B?K3Q1VXFWZ3JHNnlyQTZxdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDA2B84073CDAE45B9881D0050675722@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc94dec-e46f-47fc-bced-08d9741ab4d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 05:20:30.0381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZn0dbD+sbzbqqzFlst4Ize/Wv0p+MiXT0DJa2An4V7J+0ZuBoyr2pPKIMOU2AtCKbRiBFN0Eowro31KHRxlGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7754
Received-SPF: pass client-ip=68.232.159.90; envelope-from=lizhijian@fujitsu.com;
 helo=esa9.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDEwLzA5LzIwMjEgMDA6MTAsIEp1YW4gUXVpbnRlbGEgd3JvdGU6DQo+ICJMaSwgWmhp
amlhbiIgPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4gd3JvdGU6DQo+PiBvbiAyMDIxLzkvOSAy
MTo0MiwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4+PiBPbiBUaHUsIDkgU2VwdCAyMDIxIGF0IDEx
OjM2LCBKdWFuIFF1aW50ZWxhIDxxdWludGVsYUByZWRoYXQuY29tPiB3cm90ZToNCj4+PiBGYWls
cyB0byBidWlsZCwgRnJlZUJTRDoNCj4+Pg0KPj4+IC4uL3NyYy9taWdyYXRpb24vcmRtYS5jOjEx
NDY6MjM6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyDQo+Pj4gJ0lCVl9BRFZJ
U0VfTVJfQURWSUNFX1BSRUZFVENIX1dSSVRFJw0KPj4+ICAgICAgIGludCBhZHZpY2UgPSB3ciA/
IElCVl9BRFZJU0VfTVJfQURWSUNFX1BSRUZFVENIX1dSSVRFIDoNCj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICBeDQo+Pj4gLi4vc3JjL21pZ3JhdGlvbi9yZG1hLmM6MTE0NzoxODogZXJyb3I6
IHVzZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXINCj4+PiAnSUJWX0FEVklTRV9NUl9BRFZJQ0Vf
UFJFRkVUQ0gnDQo+Pj4gICAgICAgICAgICAgICAgICAgIElCVl9BRFZJU0VfTVJfQURWSUNFX1BS
RUZFVENIOw0KPj4+ICAgICAgICAgICAgICAgICAgICBeDQo+Pj4gLi4vc3JjL21pZ3JhdGlvbi9y
ZG1hLmM6MTE1MDoxMTogd2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YNCj4+PiBmdW5j
dGlvbiAnaWJ2X2FkdmlzZV9tcicgaXMgaW52YWxpZCBpbiBDOTkNCj4+PiBbLVdpbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+PiAgICAgICByZXQgPSBpYnZfYWR2aXNlX21yKHBkLCBh
ZHZpY2UsDQo+Pj4gICAgICAgICAgICAgXg0KPj4+IC4uL3NyYy9taWdyYXRpb24vcmRtYS5jOjEx
NTE6MjU6IGVycm9yOiB1c2Ugb2YgdW5kZWNsYXJlZCBpZGVudGlmaWVyDQo+Pj4gJ0lCVl9BRFZJ
U0VfTVJfRkxBR19GTFVTSCcNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIElCVl9BRFZJ
U0VfTVJfRkxBR19GTFVTSCwgJnNnX2xpc3QsIDEpOw0KPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXg0KPj4+DQo+PiBpdCdzIGludHJvZHVjZWQgYnkgW1BVTEwgNC83XSBtaWdyYXRpb24v
cmRtYTogYWR2aXNlIHByZWZldGNoIHdyaXRlIGZvciBPRFAgcmVnaW9uDQo+PiB3aGVyZSBpdCBj
YWxscyBhIGlidl9hZHZpc2VfbXIoKS4gaSBoYXZlIGNoZWNrZWQgdGhlIGxhdGVzdCBGcmVlQlNE
LCBpdCBkaWRuJ3Qgc2hpcCB3aXRoIHRoaXMgQVBJDQo+PiBNYXkgaSBrbm93IGlmIGp1c3QgRnJl
c3NCU0QgcmVwb3J0cyB0aGlzIGZhaWx1cmU/IGlmIHNvLCBpIGp1c3QgbmVlZCBmaWx0ZXJpbmcg
b3V0IEZyZWVCU0Qgb25seQ0KPiBTZWNvbmQgdHJ5LiAgSSBjYW4ndCBzZWUgYW4gZXhhbXBsZSB3
aGVyZSB0aGV5IHNlYXJjaCBmb3I6DQo+IGEgc3ltYm9sIG9uIHRoZSBoZWFkZXIgZmlsZQ0KPiAg
ICBhbmQNCj4gYSBmdW5jdGlvbiBpbiBhIGxpYnJhcnkNCj4NCj4gc28gSSBhc3N1bWUgdGhhdCBp
ZiB5b3UgaGF2ZSB0aGUgc3ltYm9scywgeW91IGhhdmUgdGhlIGZ1bmN0aW9uLg0KPg0KPiBIb3cg
ZG8geW91IHNlZSBpdD8NCj4NCj4gVHJ5aW5nIHRvIGNvbXBpbGUgaXQgb24gdm0tYnVpbGQtZnJl
ZWJzZCwgYnV0IG5vdCBiZWluZyB2ZXJ5IHN1Y2Vzc2Z1bGwNCj4gc28gZmFyLg0KDQpZb3VyIHBh
dGNoIGRvZXMgd29yayEgQnV0IGkgc3RpbGwgZm9sbG93ZWQgUE1NJ3Mgc3VnZ2VzdGlvbiwgY29u
dmVydGVkIGl0IHRvIGhhc19mdW5jdGlvbg0KYXMgYW5vdGhlciBvcHRpb24uDQpJIGhhdmUgdmVy
aWZpZWQgaXQgb24gRnJlZUJTRCBhbmQgTGludXguDQoNCiBGcm9tIDY3ZjM4NmFjYzIwOTJlY2Y2
ZTcxYjg5NTFiNmFmNWQ1YjgzNjZmODAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpGcm9tOiBK
dWFuIFF1aW50ZWxhIDxxdWludGVsYUByZWRoYXQuY29tPg0KRGF0ZTogVGh1LCA5IFNlcCAyMDIx
IDE3OjA3OjE3ICswMjAwDQpTdWJqZWN0OiBbUEFUQ0hdIHJkbWE6IHRlc3QgZm9yIGlidl9hZHZp
c2VfbXIgQVBJDQoNClNpZ25lZC1vZmYtYnk6IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhh
dC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5j
b20+DQotLS0NCiAgbWVzb24uYnVpbGQgICAgICB8IDYgKysrKysrDQogIG1pZ3JhdGlvbi9yZG1h
LmMgfCAyICsrDQogIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1n
aXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkDQppbmRleCA2ZTRkMmQ4MDM0My4uOTc0MDZk
MWI3OWIgMTAwNjQ0DQotLS0gYS9tZXNvbi5idWlsZA0KKysrIGIvbWVzb24uYnVpbGQNCkBAIC0x
MzI4LDYgKzEzMjgsMTIgQEAgY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0hBVkVfQ09QWV9GSUxFX1JB
TkdFJywgY2MuaGFzX2Z1bmN0aW9uKCdjb3B5X2ZpbGVfcmFuZ2UnKSkNCiAgY29uZmlnX2hvc3Rf
ZGF0YS5zZXQoJ0hBVkVfT1BFTlBUWScsIGNjLmhhc19mdW5jdGlvbignb3BlbnB0eScsIGRlcGVu
ZGVuY2llczogdXRpbCkpDQogIGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdIQVZFX1NUUkNIUk5VTCcs
IGNjLmhhc19mdW5jdGlvbignc3RyY2hybnVsJykpDQogIGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdI
QVZFX1NZU1RFTV9GVU5DVElPTicsIGNjLmhhc19mdW5jdGlvbignc3lzdGVtJywgcHJlZml4OiAn
I2luY2x1ZGUgPHN0ZGxpYi5oPicpKQ0KK2lmIHJkbWEuZm91bmQoKQ0KKyAgY29uZmlnX2hvc3Rf
ZGF0YS5zZXQoJ0hBVkVfSUJWX0FEVklTRV9NUicsDQorICAgICAgICAgICAgICAgICAgICAgICBj
Yy5oYXNfZnVuY3Rpb24oJ2lidl9hZHZpc2VfbXInLA0KKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGFyZ3M6IGNvbmZpZ19ob3N0WydSRE1BX0xJQlMnXS5zcGxpdCgpLA0K
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByZWZpeDogJyNpbmNsdWRl
IDxpbmZpbmliYW5kL3ZlcmJzLmg+JykpDQorZW5kaWYNCiAgDQogICMgaGFzX2hlYWRlcl9zeW1i
b2wNCiAgY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19CWVRFU1dBUF9IJywNCmRpZmYgLS1n
aXQgYS9taWdyYXRpb24vcmRtYS5jIGIvbWlncmF0aW9uL3JkbWEuYw0KaW5kZXggNmMyY2MzZjYx
N2MuLjJhM2M3ODg5YjlmIDEwMDY0NA0KLS0tIGEvbWlncmF0aW9uL3JkbWEuYw0KKysrIGIvbWln
cmF0aW9uL3JkbWEuYw0KQEAgLTExNDIsNiArMTE0Miw3IEBAIHN0YXRpYyB2b2lkIHFlbXVfcmRt
YV9hZHZpc2VfcHJlZmV0Y2hfbXIoc3RydWN0IGlidl9wZCAqcGQsIHVpbnQ2NF90IGFkZHIsDQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgbGVuLCAg
dWludDMyX3QgbGtleSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpuYW1lLCBib29sIHdyKQ0KICB7DQorI2lmZGVmIEhBVkVfSUJWX0FEVklT
RV9NUg0KICAgICAgaW50IHJldDsNCiAgICAgIGludCBhZHZpY2UgPSB3ciA/IElCVl9BRFZJU0Vf
TVJfQURWSUNFX1BSRUZFVENIX1dSSVRFIDoNCiAgICAgICAgICAgICAgICAgICBJQlZfQURWSVNF
X01SX0FEVklDRV9QUkVGRVRDSDsNCkBAIC0xMTU1LDYgKzExNTYsNyBAQCBzdGF0aWMgdm9pZCBx
ZW11X3JkbWFfYWR2aXNlX3ByZWZldGNoX21yKHN0cnVjdCBpYnZfcGQgKnBkLCB1aW50NjRfdCBh
ZGRyLA0KICAgICAgfSBlbHNlIHsNCiAgICAgICAgICB0cmFjZV9xZW11X3JkbWFfYWR2aXNlX21y
KG5hbWUsIGxlbiwgYWRkciwgInN1Y2Nlc3NlZCIpOw0KICAgICAgfQ0KKyNlbmRpZg0KICB9DQog
IA0KICBzdGF0aWMgaW50IHFlbXVfcmRtYV9yZWdfd2hvbGVfcmFtX2Jsb2NrcyhSRE1BQ29udGV4
dCAqcmRtYSkNCi0tIA0KMi4zMS4xDQoNCg0KDQoNCj4gTGF0ZXIsIEp1YW4uDQo+DQo+ICBGcm9t
IGU5NTRjMWUwYWZjNzg1YTk4ZDQ3MjIwMWRhZmU3NWE3ZTcxMjZiMWQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxDQo+IEZyb206IEp1YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+DQo+
IERhdGU6IFRodSwgOSBTZXAgMjAyMSAxNzowNzoxNyArMDIwMA0KPiBTdWJqZWN0OiBbUEFUQ0hd
IHJkbWE6IHRlc3QgZm9yIGlidl9hZHZpc2VfbXIgQVBJDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEp1
YW4gUXVpbnRlbGEgPHF1aW50ZWxhQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgIG1lc29uLmJ1aWxk
ICAgICAgfCAzICsrKw0KPiAgIG1pZ3JhdGlvbi9yZG1hLmMgfCAyICsrDQo+ICAgMiBmaWxlcyBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQNCj4gaW5kZXggN2U1OGU2Mjc5Yi4uYzJlYjQzN2RmNCAxMDA2NDQNCj4gLS0t
IGEvbWVzb24uYnVpbGQNCj4gKysrIGIvbWVzb24uYnVpbGQNCj4gQEAgLTEzNzUsNiArMTM3NSw5
IEBAIGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdIQVZFX1NJR0VWX05PVElGWV9USFJFQURfSUQnLA0K
PiAgIGNvbmZpZ19ob3N0X2RhdGEuc2V0KCdIQVZFX1NUUlVDVF9TVEFUX1NUX0FUSU0nLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgIGNjLmhhc19tZW1iZXIoJ3N0cnVjdCBzdGF0JywgJ3N0X2F0
aW0nLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJlZml4OiAnI2lu
Y2x1ZGUgPHN5cy9zdGF0Lmg+JykpDQo+ICtjb25maWdfaG9zdF9kYXRhLnNldCgnQ09ORklHX1JE
TUFfSUJWX0FEVklTRV9NUicsDQo+ICsgICAgICAgICAgICAgICAgICAgICBjYy5oYXNfaGVhZGVy
X3N5bWJvbCgnaW5maW5pYmFuZC92ZXJicy5oJywgJ0lCVl9BRFZJU0VfTVJfQURWSUNFX1BSRUZF
VENIJykgYW5kDQo+ICsgICAgICAgICAgICAgICAgICAgICBjYy5oYXNfaGVhZGVyX3N5bWJvbCgn
aW5maW5pYmFuZC92ZXJicy5oJywgJ0lCVl9BRFZJU0VfTVJfQURWSUNFX1BSRUZFVENIX1dSSVRF
JykpDQo+ICAgDQo+ICAgY29uZmlnX2hvc3RfZGF0YS5zZXQoJ0NPTkZJR19FVkVOVEZEJywgY2Mu
bGlua3MoJycnDQo+ICAgICAjaW5jbHVkZSA8c3lzL2V2ZW50ZmQuaD4NCj4gZGlmZiAtLWdpdCBh
L21pZ3JhdGlvbi9yZG1hLmMgYi9taWdyYXRpb24vcmRtYS5jDQo+IGluZGV4IDZjMmNjM2Y2MTcu
LmYwZDc4NTk3ZmIgMTAwNjQ0DQo+IC0tLSBhL21pZ3JhdGlvbi9yZG1hLmMNCj4gKysrIGIvbWln
cmF0aW9uL3JkbWEuYw0KPiBAQCAtMTE0Miw2ICsxMTQyLDcgQEAgc3RhdGljIHZvaWQgcWVtdV9y
ZG1hX2FkdmlzZV9wcmVmZXRjaF9tcihzdHJ1Y3QgaWJ2X3BkICpwZCwgdWludDY0X3QgYWRkciwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGxl
biwgIHVpbnQzMl90IGxrZXksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpuYW1lLCBib29sIHdyKQ0KPiAgIHsNCj4gKyNpZmRlZiBDT05G
SUdfUkRNQV9JQlZfQURWSVNFX01SDQo+ICAgICAgIGludCByZXQ7DQo+ICAgICAgIGludCBhZHZp
Y2UgPSB3ciA/IElCVl9BRFZJU0VfTVJfQURWSUNFX1BSRUZFVENIX1dSSVRFIDoNCj4gICAgICAg
ICAgICAgICAgICAgIElCVl9BRFZJU0VfTVJfQURWSUNFX1BSRUZFVENIOw0KPiBAQCAtMTE1NSw2
ICsxMTU2LDcgQEAgc3RhdGljIHZvaWQgcWVtdV9yZG1hX2FkdmlzZV9wcmVmZXRjaF9tcihzdHJ1
Y3QgaWJ2X3BkICpwZCwgdWludDY0X3QgYWRkciwNCj4gICAgICAgfSBlbHNlIHsNCj4gICAgICAg
ICAgIHRyYWNlX3FlbXVfcmRtYV9hZHZpc2VfbXIobmFtZSwgbGVuLCBhZGRyLCAic3VjY2Vzc2Vk
Iik7DQo+ICAgICAgIH0NCj4gKyNlbmRpZg0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW50IHFl
bXVfcmRtYV9yZWdfd2hvbGVfcmFtX2Jsb2NrcyhSRE1BQ29udGV4dCAqcmRtYSkNCg==

