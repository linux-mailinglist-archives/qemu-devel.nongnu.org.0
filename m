Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3E6B88A0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 03:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbuOn-0005HD-LC; Mon, 13 Mar 2023 22:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=430b82a1d=Dmitry.Fomichev@wdc.com>)
 id 1pbuOl-0005Gl-IN; Mon, 13 Mar 2023 22:28:23 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=430b82a1d=Dmitry.Fomichev@wdc.com>)
 id 1pbuOj-00032Q-Qc; Mon, 13 Mar 2023 22:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678760901; x=1710296901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Wo6tHJhSnPCVeMkQqRX3bjwvOMV0rugzLjY5qCQSWKk=;
 b=LpOMsh1YjnxeIjId0CdWYd/QEpOlXsoS3KVdTfHIoAq/indXSwuUssHx
 WkzWNf3bt/BfTMllXbrU3WVjMYnxBoFfbBwnZcHd11jNYuGa4XdHJ0VGy
 Q4wVRR4TA9mhSKq5jhu3lKqVCxZisZBIgcOr8wYu8yCrJa7rVb32/RQxd
 Dn+TfxwsInd9JVJKSqS5c0RhbqoP3Mwy+BH1sKytWoXMPPIKcHXA5Fqwm
 oAqafjSZK7b352a0xuKPFsCdmOkFBsn97SYOMaRaN9ol6r9eVjYg1Nu/L
 BfXkcFMO9nKO4nKUezhk15DM5q8TJK3nov0y8+xOjxeb2aOqTVLYrJYB8 g==;
X-IronPort-AV: E=Sophos;i="5.98,258,1673884800"; d="scan'208";a="225560938"
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 10:28:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa4LR3pAbrtinBwwECD9LnXQ0s9p8v+qrMpMf59KmDNZe5y+cKdruNr4Q1CKos8r2nQbZ/t4mwDOH60ab14aAxxAS3ZkdZVCvPwaFJLgwHAVh/diN4Z4rHSKj8+zIX/YB088lgAjJRqdllL7VFhToOTnELVecqM7UsAppCyvenRUQR5x8WwrerZ/XcOu+a9fPbXzSkQmwFYVWu7ots+34E+AVjlz+qWIgF1DGKNtr3mcYk63b/u6OI/9ho2eYwO35/JvAebpgmAkkNtnnKVWsgUwwENQUh8rFVkki2rJKpzSQfEg6mlVrvYxJQsBJ6JGmdHNemYqHRzH8UgZ3Yu2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo6tHJhSnPCVeMkQqRX3bjwvOMV0rugzLjY5qCQSWKk=;
 b=fYS4yrAWsWFJS/bZs6WfL4KYDf8j+DXIwqSpN2fovf7uaNbCjDhSwKBJaTcfaYQTmUK3R5y5PgnYd89IHRjLlwOErT6Z/2QH4BNUHWu8u4DNkAJUtbEnuTKrLmnaPprneEhPGX7EEKY/PEA5rk2j9fBJIeUg3Mic8o7oVfEyFtR4OHhLHdj9i8Vw29dX+ovkrmecyzjkMAflqVxEu6klop+qvnwmeCsBDerePLjY1qyCtm6GpEoFNMT81eJwCdDTzO+oGGFWl8dSo2skea2voqeAS95GwbAqFCMkun+SWskDRSOEGiD/HMnUGm++dhbNxiZPyAEHvxcjGAkug7wkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wo6tHJhSnPCVeMkQqRX3bjwvOMV0rugzLjY5qCQSWKk=;
 b=khclKt8Zd+iau/z1fSxDpgdzwfNLbty4ZRoZ8oBJAZQ9ajSYKCM6J5+vR1SKMwcn9YWOG7Zw7vUtJeDmlae/rSw+ImBeI+Eqz2Xb9EbSE9YrY5vCdMJZPhvmVAgxFTjrpd83cSdBs6NjNf8nctrSYACGwAVASaKVpTC7FXavRcA=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by DM6PR04MB4444.namprd04.prod.outlook.com (2603:10b6:5:9b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 02:28:14 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::9171:c66e:ce90:6c24]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::9171:c66e:ce90:6c24%7]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 02:28:14 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>, "mehta.aaru20@gmail.com"
 <mehta.aaru20@gmail.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "jusual@redhat.com" <jusual@redhat.com>, "damien.lemoal@opensource.wdc.com"
 <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v6 4/4] block: add some trace events for zone append
Thread-Topic: [PATCH v6 4/4] block: add some trace events for zone append
Thread-Index: AQHZUzt9fIdo5ohcSUeQCrYRF9lDi675ksmA
Date: Tue, 14 Mar 2023 02:28:14 +0000
Message-ID: <1333118a18d1d518139b2f96c77651d49818646f.camel@wdc.com>
References: <20230310103106.62124-1-faithilikerun@gmail.com>
 <20230310103106.62124-5-faithilikerun@gmail.com>
In-Reply-To: <20230310103106.62124-5-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|DM6PR04MB4444:EE_
x-ms-office365-filtering-correlation-id: 6d66c399-c37a-4845-aea5-08db2433c341
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 29v1DSZwk9HZuVDyY/9JP+DM6UdQAUqqdQJHlw5pj03XKPYgBYrnfARHg0rE7hbUoPpudQwl8Kb+zRsCOqDQwzmt0QtrtQy9mhvMxrQiTkj28SgOrYfVZ4y4RAaWOIZ/Mb07kIpvubwxnCcsblJFdt+tGw3lfNM5+cfF6gPwhb1zy1RTHDt+710ECOFZHFkXcFB6OC2Gtzq+LGP0DMxH+602MFhuXc2mpEFRpTAwlwY1p+p45bPpLJKXVWhBjkN1vEkzug7GxepUxZIbEjmSag/gyEicjq+Ab8eYAWFTBJNQPTS67CmJsuo4TzBpmkk9uigxZE/q6JT7yCzQdpu/aRlAFSjI8Mq3/8IUyW0i60cd8DzyadtC0MMyMWoZvmVqU3F0BnHeRAyVlXjrFKGvDEdh0ZPjj2CJPwNAhJ1othSH74zXC6Z0V2bLxe4VzkysqjWetQkth8sw4cJDLq+ozitoWZQX7KxwaRl8blVDEXnWicetzNnV8z5i7GvzvTXs9TWx5Nk0rxfUBRBaUc+BEYy7fmHFJf2lpkPuI8HPAAuqEKXpnwf73hnP/3z1Oq22WTt0PS1uOxSSv/A9Ul8q5IPJyXOD3VEpj0EbB4yy3X3egKzGloSu8i60lljP0NXsfX/FBlX4HcR4W9ZYbzaj9KB2YOhLWxyvNa0MadSwL9Db1ly0LkwW/4HdDl7JePydhEhHXqmhmCtWPC9Cz+Y4bA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199018)(186003)(2616005)(6506007)(6512007)(26005)(38070700005)(6486002)(71200400001)(110136005)(83380400001)(54906003)(316002)(478600001)(66946007)(38100700002)(66556008)(64756008)(66476007)(76116006)(122000001)(82960400001)(4326008)(41300700001)(8676002)(86362001)(36756003)(5660300002)(66446008)(7416002)(2906002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDdzYXNEQlo1S3FYVXQ5bGNOSXJ1NnpoQ2hIR21pNmsrUEo3a1lnbjhqdGJW?=
 =?utf-8?B?T3BGcnovZW5NamFKY0xMSStqTjhFWVhMODRuVWNLUW5US2hjVnQ2N0pMNmdL?=
 =?utf-8?B?UkFqNElMdWt2c2ZBQzZmTTZPeHpYais2VGRxZk1EK2xQUzB1cEdMWmYrVEdl?=
 =?utf-8?B?NjJ3dURKVXVoaGhpUlh5RmpkZTFvL1I1eUFZVDcyWHZqdmQ4ZjJMSFM2UHo0?=
 =?utf-8?B?Q0lWbzhyVy9sMnpDbCs0VGVlcHVqS0hwYVBwT1hZOEF0TVNNVkZVaWlMSE93?=
 =?utf-8?B?ZFowazV1RUUwY2Roa3ZETGxaOWhKUHkzTC9Ga1hsVHAxekZYVGNkS0tnM1Fl?=
 =?utf-8?B?U1grdFFpSXdMNmhWK0hsYzI4VyttM0pPNmtQK3B2YXhSeGdFWDdGQzcxem54?=
 =?utf-8?B?L0RzOG56VWpYaDgzajRVdUJiVStvRXNEZEFlWjByc3dBSWJrSkh2RFlLSyt1?=
 =?utf-8?B?SE5rZ29ldFpONEozK3lVV05sUnJmc0ZrSlBCMmNtTVRTUXY3Z2o2NnRtREcw?=
 =?utf-8?B?aTFjblRldlFFSGYrd3VDbEx1bEZXSWpEdnQ2bCtZd1NoaUh4N2ZNSEFDc2FK?=
 =?utf-8?B?NnRRdUtzbGI1NlhPaHFJazVsaElSRHZ5TGsxL3RZWGMrWXR4K0t4bVc3VjIx?=
 =?utf-8?B?UVRmSzU5RERsam1rS1FvY2h4cWZGRS9SVGFicjR1dEwyU3NORXRDd1JvWmdj?=
 =?utf-8?B?a0FmV214cXdmV3RKaWQ2MGsxUm5zajVWaGFtS1Z4YnpGUENLZnNiR1N2WE9O?=
 =?utf-8?B?bFJ4UFBUVU9IY2xJSmhJaEpyQmh5L2k1RmorbXQ1aVJFY3luWFR2cDhRWXhG?=
 =?utf-8?B?SXZyaU95T0lwK2RYS3o5R0RPS1lScVpuZGY2emlmVnI1SGx0V2hlYUJMUEh5?=
 =?utf-8?B?Z3l0TXJKYi83ZEx6OTVoWEMxRE02bjBJM3NVV1JvRmh4VmlRZjFGcTQ5bE1m?=
 =?utf-8?B?MWpXaktKTktIWHdhbldHMWNZbHM3aXFsWDZkbEZkZmxxL1lSYVVYZXE4M1Fy?=
 =?utf-8?B?bnhyMDZUSGkyUmRQcHZDRUNjZUhYUkt5emdxb21FdXdyeXZKd05oL1hWa3dV?=
 =?utf-8?B?UmZ4czduOTRQZkpsOEVJNGlWaWtpeG8yMUxNL29RQWtVWUFNbmRCSk1Tb2hU?=
 =?utf-8?B?SkR6aTdXeXdLRURINlhKTlk0czZNOGs3dm1yR05uSkJvSXhvZ1VWWXEwRURq?=
 =?utf-8?B?U2hLaURPZE10MDN6VC9rZkhua01BREVzR1pEUHJ1ZU8yT1p2TGNWNzBEaXVV?=
 =?utf-8?B?aUUwVkZMNG9HSE9tVE52WFkzODBXQzdHSUZNSU5PZHdyT2REMnVwNmZjdkcr?=
 =?utf-8?B?ZHZtR0ltQVlCb3RJclB2WG0ydnczZ213cjMxdTlIQnlqK1doN3piYncwazhR?=
 =?utf-8?B?TmZtSCsrNFpxN3JyaWN1WkdJcjQvUWxTS2xaYzhIMWpyUzFyeFhNeFRIcExV?=
 =?utf-8?B?OGFCMGtWR0NlYm54UE5MNDZaTjZsRkw1cDJvR0FneWhZRGxRMjlqekxVR2dk?=
 =?utf-8?B?SEtEalJNOGQ1TFZhRW9Rb0oySkhWZjJ6UWZiN0ZtRHloTHJVanlKOWxLbmlk?=
 =?utf-8?B?YXh6OHlCK0xNalpZS1J1bm0zNkZJQUs1c3pFRkhmZzdwMkNkTHNseFdtYldr?=
 =?utf-8?B?eGMxZ1lNb2RCT1dweGxJK2pqV28vN3I4MENJK1U1VFFOYXRybVR3d0JYMUNn?=
 =?utf-8?B?M3VvNUZFc3JmTmt0S0pIWWkrUmVEc1hpVjJ2aHlDQk1peXVIZk1PZlErV203?=
 =?utf-8?B?czFEVk9LRHVXc2NVMVR5S0c2dkZJN3VIOTFiSUMrazlWOXZTTXlzOElFVGlv?=
 =?utf-8?B?bHZHMDJwc0djWGRIY1JqUXcrRVF3SUI0SnZNdzNaTkNUbkFmY2RCMEFWVnRR?=
 =?utf-8?B?RVM4eDdkdk5qN2dCL1kvL2dnd1RFeFN6U1Y2ODFtZWZlMFdNMGdXUnFvUFZH?=
 =?utf-8?B?TGc3b2lnV0pVQTE2YWtiTW93MG1mV3R3TlNrZHdlUFpRQ2ZOTzNod3NuN2lm?=
 =?utf-8?B?U3g1a3VYdmU1V1htRDhoLzFmTFdDMndBMWtBZmxidW8xR0RhWWYxZWxNdjFy?=
 =?utf-8?B?bHRqRVZUN2hPK25uTVNEUVpkTW5FNmVMdWpXdDVwRjR0MzVPb2pCL2drVkdC?=
 =?utf-8?B?SmNwT0ZWWTVDUlNES0x0YVdiMUhKNW1XbHl6QmRsWFhJS3hxMW9xY2tuQ1Fn?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <862959E57F864241872BFF12F7CB4E73@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qQp799zxEDoBV3TrlnR/WYwGP+fZ2feRlXDRLgrxBpxWXktnKTP6ZlrREKmtAeelJsxDekGGpZyczwNtOW00CcvZsYa2FOVXAkL9i73Bn1y+8YW8mrHDfqOidglJW4/cThCmEFV3eIZFRW8lo9vsx1dLShhpYf7hSlUII9B+w/fBz67iSeiOaVb4ai0LLteOcRDAwMxagflQsAPnIFqGJ/MXioyp+61HDlWMnI3qOc9oYzapDPhkFpxL9bHkTdThgNQHwKgeiKgXtf75HlDCkP3qwafRRxlVMRVHnwftFC8MRwojW612Uin85xH/dQMYA7MKtq6/moKwtNeLyMUVec7sOFc4M9Ri6DVT2sarh015aZzGQ+ZAvqjiF8rvQ3WkeE3Y2u/lTkfQqBPok2iLy3dBc6xVQS0rLefRL2N1cBL/cuKZtZvSRTMyAqgyYeCSxPX8/AkAmZTJDwNXQBZjcBz+IT7GSi6NWlKTnJj5JJpd8Uvk9Ri0jbJ2ODROvp2H//tEp9wct2GfnOO35PvNNaJn97G205c075GYyzScxatzgY6GF2vf6Mas5Gyksi0BJKBBcEGXmDS5V4g607UWucbUzs8ErED+hKVAwH+aSoKd4GllcTcH4ioMlm9uF0+Cfz5KdMZ/5U2HK3zq/T/S6jPi9PtinJ/4wVxep9kHuLBlOUC9G0tSM4Z7az97VA2RjNm78yBPkd5yLzVmpvdgNUmMfYyeqOZnir/4faQF0f/oZdz6Y3cojUba6gch7DS/EVJU02y3Wgcmwa/4AoPCiWJ3f8MkI/zhJN9XAMUrB+1f4Km4bw6hav3YXUEJOD8QQzA1WfVGmUtXt2RenFH6ddzthN5EI8s78K4Ig3tOGe4vi8zTdfSuEDlEDJSBlCPh
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d66c399-c37a-4845-aea5-08db2433c341
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 02:28:14.0694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbeyD5/7Qco9qKLfZgutz8ncnGjaASidzqovbXMDq1yHR8xaw6ZWYioqpmuzhkBWwdPnlI3YfyDLNVL9knpi1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4444
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=430b82a1d=Dmitry.Fomichev@wdc.com; helo=esa6.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

T24gRnJpLCAyMDIzLTAzLTEwIGF0IDE4OjMxICswODAwLCBTYW0gTGkgd3JvdGU6DQo+IFNpZ25l
ZC1vZmYtYnk6IFNhbSBMaSA8ZmFpdGhpbGlrZXJ1bkBnbWFpbC5jb20+DQoNCkxvb2tzIGdvb2Qs
DQoNClJldmlld2VkLWJ5OiBEbWl0cnkgRm9taWNoZXYgPGRtaXRyeS5mb21pY2hldkB3ZGMuY29t
Pg0KDQo+IMKgYmxvY2svZmlsZS1wb3NpeC5jIHwgMyArKysNCj4gwqBibG9jay90cmFjZS1ldmVu
dHMgfCAyICsrDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9ibG9jay9maWxlLXBvc2l4LmMgYi9ibG9jay9maWxlLXBvc2l4LmMNCj4gaW5k
ZXggMmJhOTE3NDc3OC4uNTE4N2Y4MTBlNSAxMDA2NDQNCj4gLS0tIGEvYmxvY2svZmlsZS1wb3Np
eC5jDQo+ICsrKyBiL2Jsb2NrL2ZpbGUtcG9zaXguYw0KPiBAQCAtMjQ4OSw2ICsyNDg5LDggQEAg
b3V0Og0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFCRFJWX1pUX0lTX0NPTlYod3Bz
LT53cFtpbmRleF0pKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0
eXBlICYgUUVNVV9BSU9fWk9ORV9BUFBFTkQpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqcy0+b2Zmc2V0ID0gd3BzLT53cFtpbmRleF07DQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cmFjZV96YmRfem9uZV9hcHBlbmRfY29t
cGxldGUoYnMsICpzLT5vZmZzZXQNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgPj4gQkRSVl9TRUNUT1JfQklUUyk7DQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIH0NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
QWR2YW5jZSB0aGUgd3AgaWYgbmVlZGVkICovDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIChvZmZzZXQgKyBieXRlcyA+IHdwcy0+d3BbaW5kZXhdKSB7DQo+IEBAIC0zNTM3
LDYgKzM1MzksNyBAQCBzdGF0aWMgaW50IGNvcm91dGluZV9mbg0KPiByYXdfY29fem9uZV9hcHBl
bmQoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsDQo+IMKgwqDCoMKgwqDCoMKgwqAgbGVuICs9IGlvdl9s
ZW47DQo+IMKgwqDCoMKgIH0NCj4gwqANCj4gK8KgwqDCoCB0cmFjZV96YmRfem9uZV9hcHBlbmQo
YnMsICpvZmZzZXQgPj4gQkRSVl9TRUNUT1JfQklUUyk7DQo+IMKgwqDCoMKgIHJldHVybiByYXdf
Y29fcHJ3KGJzLCAqb2Zmc2V0LCBsZW4sIHFpb3YsIFFFTVVfQUlPX1pPTkVfQVBQRU5EKTsNCj4g
wqB9DQo+IMKgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9ibG9jay90cmFjZS1ldmVudHMgYi9ibG9j
ay90cmFjZS1ldmVudHMNCj4gaW5kZXggM2Y0ZTFkMDg4YS4uMzI2NjUxNThkNiAxMDA2NDQNCj4g
LS0tIGEvYmxvY2svdHJhY2UtZXZlbnRzDQo+ICsrKyBiL2Jsb2NrL3RyYWNlLWV2ZW50cw0KPiBA
QCAtMjExLDYgKzIxMSw4IEBAIGZpbGVfaGRldl9pc19zZyhpbnQgdHlwZSwgaW50IHZlcnNpb24p
ICJTRyBkZXZpY2UgZm91bmQ6DQo+IHR5cGU9JWQsIHZlcnNpb249JWQiDQo+IMKgZmlsZV9mbHVz
aF9mZGF0YXN5bmNfZmFpbGVkKGludCBlcnIpICJlcnJubyAlZCINCj4gwqB6YmRfem9uZV9yZXBv
cnQodm9pZCAqYnMsIHVuc2lnbmVkIGludCBucl96b25lcywgaW50NjRfdCBzZWN0b3IpICJicyAl
cCByZXBvcnQNCj4gJWQgem9uZXMgc3RhcnRpbmcgYXQgc2VjdG9yIG9mZnNldCAweCUiIFBSSXg2
NCAiIg0KPiDCoHpiZF96b25lX21nbXQodm9pZCAqYnMsIGNvbnN0IGNoYXIgKm9wX25hbWUsIGlu
dDY0X3Qgc2VjdG9yLCBpbnQ2NF90IGxlbikgImJzDQo+ICVwICVzIHN0YXJ0cyBhdCBzZWN0b3Ig
b2Zmc2V0IDB4JSIgUFJJeDY0ICIgb3ZlciBhIHJhbmdlIG9mIDB4JSIgUFJJeDY0ICINCj4gc2Vj
dG9ycyINCj4gK3piZF96b25lX2FwcGVuZCh2b2lkICpicywgaW50NjRfdCBzZWN0b3IpICJicyAl
cCBhcHBlbmQgYXQgc2VjdG9yIG9mZnNldCAweCUiDQo+IFBSSXg2NCAiIg0KPiAremJkX3pvbmVf
YXBwZW5kX2NvbXBsZXRlKHZvaWQgKmJzLCBpbnQ2NF90IHNlY3RvcikgImJzICVwIHJldHVybnMg
YXBwZW5kDQo+IHNlY3RvciAweCUiIFBSSXg2NCAiIg0KPiDCoA0KPiDCoCMgc3NoLmMNCj4gwqBz
ZnRwX2Vycm9yKGNvbnN0IGNoYXIgKm9wLCBjb25zdCBjaGFyICpzc2hfZXJyLCBpbnQgc3NoX2Vy
cl9jb2RlLCBpbnQNCj4gc2Z0cF9lcnJfY29kZSkgIiVzIGZhaWxlZDogJXMgKGxpYnNzaCBlcnJv
ciBjb2RlOiAlZCwgc2Z0cCBlcnJvciBjb2RlOiAlZCkiDQoNCg==

