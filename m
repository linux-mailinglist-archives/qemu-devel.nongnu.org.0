Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D865E092
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 00:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCgN-00083k-21; Wed, 04 Jan 2023 17:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36184fce2=wilfred.mallawa@wdc.com>)
 id 1pDCfo-0007mh-2S
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:55:52 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=36184fce2=wilfred.mallawa@wdc.com>)
 id 1pDCfh-00051A-PE
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:55:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672872945; x=1704408945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iGpzAmf0TLAEqoUMthMbulJZrkAuB5woUQvlKaKi7Pk=;
 b=ozan3YDJCntIOxvwPByW2rIS3FgqKwnSbeV7VxZ765mL2iHxTLF2uTCy
 EEGoI9PpUURfI7nIY+eowtn59OXXrbj/02Y/PV6CHB2dIo6WWrIMIfr6m
 1IVHirdNRGs2yxM28vwSb9rATGPe+KqvDe8Tv+6iGALNUeDFlCwa0Z9CS
 aoUX+BFHHMJ/dT5FTMs8UPE0umI1FYJEymRdM4cmRoCWMH/RNZcD6dhTa
 Lwt+Czb8xLjZdnt9r9LCgt0P4grINsmHM6fJO3AkYvzDeiNDKmpAAa0sY
 jCasb7bL0BLcMk9InDZjFU/oQd5T6TQvzpNnPHn2MQTJKBbOclfsdSIF+ w==;
X-IronPort-AV: E=Sophos;i="5.96,301,1665417600"; d="scan'208";a="220152749"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hgst.iphmx.com with ESMTP; 05 Jan 2023 06:55:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/QHR79ZStUDnrJhN2gCOJhhJJYNfK0lYYN7Q3QcbZVaEs8ijQuEfxWG82h6Frc81O1wHvlwJW5u+mmzwIsfNMy/NtVsUJ3hALiVdkASMicSSJfbx03Qwf3YbciDejtr8JwutFJBkLV7UPmq4mn3Izzu3bCt8FhrAqm9XYJvAfay+Jfhs04DanqY3LTtc+x3Y+dkEpxmombUM6AtXhQrmnRtQSAtTJ7K1247YzOzZ83qPstmGyycblEUs6LG/BJBz/mJV1tJuNNyzrjXbonKScA43hyHxnUDVeC3mk9VkxptNdTIbgW2eFn0q/AgpWBXzIPcaFPORi1NY6PEMi3juw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGpzAmf0TLAEqoUMthMbulJZrkAuB5woUQvlKaKi7Pk=;
 b=UvEm3W7KRpT9D9+LDGXiIrDzz4qqt62RAU+Tr+Ct4xOpjsSw4ux8xlrFttZccXdqTNLeGTtQF4FZ5kotZ/EdGCOPS3Jr10qAE4+syi3S0+K6IhrlXJdBG38IlSPUWFhu1TG/hY8myKitBpzKootZvZe5tfaWBfiUGPLgASokDXf/HnG6cp2ymHTN1TwELFEcAbVQQg+DvInB/zSh6Ik4e6pd7/948QGr5Ut+g9Tlri+zcEWhhxZKmLpuQCZIqsi6upcHbqsYZx+EAp9UvmOgJmtrG8uiNW3+N90VVcrMvibSVMm4C1Hy4/O7V1ukdfQcwvV9fI1TRKAteUg22bd79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGpzAmf0TLAEqoUMthMbulJZrkAuB5woUQvlKaKi7Pk=;
 b=OKBR3DvXmTVAmDUIZXudHeJdQm8YUYpYgkd6IXi4otMmjrcj5wDYEIgb9ab03up99OTO8UYf2mRMMwckBOWxC5pvzq77ISG1z9GWWyT9sUco8LhXkPqmbe6cAIlJQEpv9qD4WCA7BNKtodXj94EkHybuER+7lfZmlOLzj0SEKIw=
Received: from BN6PR04MB0963.namprd04.prod.outlook.com (2603:10b6:405:43::35)
 by DM6PR04MB4618.namprd04.prod.outlook.com (2603:10b6:5:27::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 22:55:38 +0000
Received: from BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::d26a:42b:479e:4e8e]) by BN6PR04MB0963.namprd04.prod.outlook.com
 ([fe80::d26a:42b:479e:4e8e%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 22:55:37 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "alistair23@gmail.com" <alistair23@gmail.com>,
 "alistair.francis@opensource.wdc.com" <alistair.francis@opensource.wdc.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PULL v2 03/45] hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
Thread-Topic: [PULL v2 03/45] hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
Thread-Index: AQHZFY1A9T5sCoK7Kk6plV4hNap+166ORakAgACujQA=
Date: Wed, 4 Jan 2023 22:55:37 +0000
Message-ID: <cfdfb62d27069f9ebde3feb89e29b53c4d30b624.camel@wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
 <20221221224022.425831-4-alistair.francis@opensource.wdc.com>
 <CAKmqyKM-TArauueK=o7kLu9mM75RndarvK8e3nMLeRHidKLyBg@mail.gmail.com>
In-Reply-To: <CAKmqyKM-TArauueK=o7kLu9mM75RndarvK8e3nMLeRHidKLyBg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR04MB0963:EE_|DM6PR04MB4618:EE_
x-ms-office365-filtering-correlation-id: f0e1857a-4950-450e-6fdb-08daeea6cbce
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Oy6HfR6jp3CmbABfZLqrLM0XrMC73ySAkMLlyKPDXEKLsFaInGG5g3BxMIL1nxDsHj59H61zvobsUIeqc6/lQFfXb0NTj+MBSudJfTffyHyi/akWCgkq8ZiKIU01IHkK2XH+9NObofLgj2grJ9j4SA1RjcBr4bpBKv7N44/lgItivw9rPRaZuBTzuwkdtwMhCHL6Ad50h9SnNRkJOikyJFNX0mDiEW5qVI4/n7uWUE5VmZdap2CE81uSCl0Rtv3edpzySfCO6WY412ujue1qOYg8TTfQmVUG9CPFItcWW0iCRtpXjgfbTlbTaP5LjGd2XFtcmwWWZ1DH+UVvnCGqCyvk9SMgwqF+9ILCJZzy5YjIxoVHaF2WCbGiqzJ8WTqvSZB9thBkMNP/QOX9nGjBYPZWBcWK4V0B9qQOdA+CkRprfl5mgzajKyd++iO9AaFbEpf0vL0DSQMHyJlTKuwkjaf7J8pqonFGm+kDGKxyLJLzF3wx95xrfzOjW9bdBPjdug+2UJUA/28Ye7W8BlmzjjcHccZYyaLaOY65deVzSg6S7XhlykqAPBmgJeZW9JzMMDXp7h3g1IslpFRLIbciF7JPNww0Z+6tsgOHA1GUurJwXxOn70taTZz3iH+WAsTmTLPXpOMHwAgNb0mg6gKPjur1ehYNS4uD+r1ucOzkQE5sbTqL+eNfJiOBc6OUTI3nMKQW2R7QfubvAi15an0k2u9Mc3Euh1mo76v8vYU4ECxLExTxdS8Wznv0/pSjZRQqzf8cSxo3eMJY+KygRT2ThA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR04MB0963.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199015)(122000001)(82960400001)(38100700002)(38070700005)(36756003)(86362001)(6506007)(53546011)(316002)(66946007)(2616005)(66556008)(478600001)(64756008)(66476007)(6512007)(91956017)(76116006)(6486002)(110136005)(186003)(71200400001)(26005)(5660300002)(54906003)(8676002)(2906002)(66446008)(8936002)(4326008)(44832011)(41300700001)(83380400001)(81973001)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGFjTlZmdHZJQ2czTkQ0Mi9McGJMcnB4Z2w1Q3JVZk03VGgySjVNOFNqc2Q0?=
 =?utf-8?B?YldQMkY0WXBYNmlmTDNHNnNMQ3BOUGh1ak1Hd0luelRrNXBJaWxKODBOMlVj?=
 =?utf-8?B?Rm03YUh6UVFaRVZQRnRwN2ZkV0M1MnB5SFJVbFdPWkhsR2JsVnFsd2hRZUw1?=
 =?utf-8?B?R052UTd2c05hejRlQmpzSG80dXNVVnk4ZlNneTNNeXpJcTVGNzFRcU1MMEF3?=
 =?utf-8?B?NVpWdm10dFZVam9DSis5OFdlOHBPTy9vbmhZSklQRTA1WUt3MVNKRGxGcE5i?=
 =?utf-8?B?Q3VWOHZMcHEvVnJqdURKS2dFcDZXNHpMa0p0OFRQck1zNFlNczJBUXN4ZHZy?=
 =?utf-8?B?ajZ4RERkUGxIRFo3YzVXdFQ0ZE9Dd05BcFhzQ3pQMkJFRlZSSkErZEUxUkMy?=
 =?utf-8?B?YlVvb1BDeHp0dUI1Y3lFaEZTZGswdkMvMkdvV3E2M09OSzF2MXhHS3RoNklY?=
 =?utf-8?B?eitHRmRGNkhvQ1g2NVlnc2h2ZVVGT0g4ek1QR3hpdi9SYUJZeCttUGI4cVdv?=
 =?utf-8?B?UldnN2hseFRBWi9YRW9OMmhPNW5yaXJwSE9jOW9NRHdianpGNjhuUENEWWNo?=
 =?utf-8?B?NnhrSC9PckphbHpJcmlFdjFqSzFxOEJVSzl3N0J6L2FkY1JJZUF5UnFEdGJT?=
 =?utf-8?B?WUpFejZEd0pldWdra09zSjdRbm44ditoUi94aXFlc29WMlFkMXpaRWI0WXZD?=
 =?utf-8?B?aXNua0pLV1FIdzZRZUdoWURtTWUwL1htekZJaEpJT2JGOGNFdVZ6WVVGYkph?=
 =?utf-8?B?VzlqSURlMXdsdndZcFQrSDFtTGlsUzRQZXZ0Mi9qTVhzUVZEQWxnaE9jUmVt?=
 =?utf-8?B?ay9sN3VWbmU4Z1c1SUIxa20rcUoyTXRPT2VUMitsQzZ0NXdaN2ZXSFJLMW5H?=
 =?utf-8?B?MGpZdUJSdVk3cXBuYUxzTEdqOVpOWDJleWNrSldjRUg0UkRVdU4rbEZ0YzlQ?=
 =?utf-8?B?SU5PNXkzWUF3WFlWZ0tleFZWZGNrMDI3REtBYUgycHpCSEFaeitjTjU5ME1M?=
 =?utf-8?B?aS9PemtGRDNBTTlRTGZFQmxmMW80SGQvMnlQZ3RhTktsMFdQeG1iYmF1QkZv?=
 =?utf-8?B?RW4xWFNzdWp6YWZWWjRpTjJ2Tm9ubmJIbWtrT2tnR0ZTL0VLaG1ERzBmUDZm?=
 =?utf-8?B?cnlvL01SL2pkK0JRZFhQNFltWGZkRzJwdE85NmRzSHFtNkF1amQ5QUNrRC90?=
 =?utf-8?B?NnBXODBIbzhjSktDUlhEbjdhYmtBSHRzMm9KQjk4N1VOM2x1MVQ1Y2lkR3pN?=
 =?utf-8?B?dHJLdGN0VC9zZTMveHF3cDMreVNtNTJDRVd4dzJVRXVGOW01emNsSGlWdmFr?=
 =?utf-8?B?aG1YTUZCdTVOZlFHemk5UVFxVmRyOUVUNk9yd1NKRkJVNWhjUnhpRG1PaCtC?=
 =?utf-8?B?ckFGeU5oOUJDb0FmRTRNQ1BkOGIyZ1cwZS91TXNoQWtxR1JPQ0FtdDdsdXRa?=
 =?utf-8?B?VHVIcW5VdWE1bnFjeEw4S3k1VWVYdEFBK1g4ekdYaFRoMnpnUG1PeGtUQTJ0?=
 =?utf-8?B?TEVQblhyODVCZXo4US9qa09oZFIvNUxRYm4rQ0JFcnB2Qy9Ucm5lMXNRMFpp?=
 =?utf-8?B?NkxmZFNVaHpFODdqeTEyUWtVTXg0NWpVOWVsRCttWE5qcEpNemdFNkpmL1p0?=
 =?utf-8?B?UmFZaVRlaC9jY2EvL0p2Um94Y1FPaW92cVI2aDh3ZWpUZTJXczV4TiszcGFj?=
 =?utf-8?B?bllxcVVxUDRFU1BxNUJNWDdjbXRabTBaWEdWT3hjTi9RRzU0MkhJOVZTQ1RP?=
 =?utf-8?B?Z2RPcGFjZmY3Sm1Za1MyME1DVk5nV1gyTWwzbDJPNFdvZnZmYnA1YWNKcE1q?=
 =?utf-8?B?TzBhVS9Jcy9aNjAxcGg0UTRFTW5pZFRGNWI5U0FISitzUFkxcy90UkFXOVlM?=
 =?utf-8?B?Ym1jS1ZQUUxkQkMzRTQ4OGdRMDMzRDY1ZjAwQTJJcVlLZG9kTFhpRXl6RzNl?=
 =?utf-8?B?RXhvcUFRVEJ0OGpSTFp1RTVLVWpqY3JJcnY2MXhKckZtaXVNVDZUYnVwSno0?=
 =?utf-8?B?a2JzeFUvV3Z0bnhQSlBrektGT1llUmZiZld4VithQ2Y2SHd6a2dHeXVUVTYv?=
 =?utf-8?B?Y3podkxwZ1A4NDd5ZS9CNDhibUQxZmhkbk83MzQ2SnVHbjk0M251cTdNQTBS?=
 =?utf-8?B?dUJOcWo4dGw5RC9UcTh0bGExMjhyODNzWXVRamFsbTVtaGRyRXd6YlF5SWdj?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDF4329F36E7C04F90B0B0DBF7CE8C21@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: WaebkwUkiIZKp9ZiNDNFZwqsuGXFIg+Hifb5/10VLMwWSDCfgpxYD4uW3z8gW0DIAo5qWh/JGo/YwkzR1rPYQqPcq2Ws9tkeo8v54523xZxyTEFafiE8XvQc6zDUtO4KGGbekD0ibjiXo7c/GxWTJfIo1Rz6CRcM8pJr0EO4pEc9UDECJ6MJB0pko9AFFFS1zFYnJ8YY7QmTbOs7oLUMVrUJS4sUO2lrAqrZdwnFxnPxADLk9c2J34QgC+Utvvpm90U6B/r5Xmh2YiKtHHL4bmrwdf+S0Z71Cd6pYjtkmh3+Xbt8Jy4SqFUHLSv6WT5hqqHb0kpqj1tYmqFuLC84gtzulU7WghHRuNBAiLZbBRC6z05vH2zbYh+WO38fv4ur0PWcT/SNIhA9Aq+Q1wV3fxLP8CvmdhY6dFBLiCD2RpRk1eD6ONuKCf6HAXR5ykG+Q7hs1d38c11fG6OTMCc3YBDaDz8oTR2aLMRLJGyMyrd822glb/U91tGyZw6SEmM49Gq0jhHzg12s5xT5PiK3IC/5lUS167yDxPPHg2GvV/lfrxZF704GZkBRZEBEiW90+9B5CtrzpftZtKWgdMXZHANBc6DnuttfL+2+IEMVVglYrfNzfJh4zqNqkqrNKtHv2/u+6XXNk1kxT9f7UEODW1v2u3uqGxJG/Qb57NZO6H1guY/VF69P7Y0HMWGam5jbVCS5DkKHYXQFvYDSY7r4XeHtuROiAMpjclXYPbIu4mJ2V8pfbcv7YRtnimk7qMKx2c7wSlefWxAB0c2mwTo9ibLN6BiZjXFeMrf/qQXrQ+4=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR04MB0963.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e1857a-4950-450e-6fdb-08daeea6cbce
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 22:55:37.7319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Rl1yuEP81ZJ7YeDXnd8WK61HpDNgenNEFjqBqCdpuBvxqZmwJUWhXzweK1bgMvTzZNC9GFa5NvCQE/1DXOiTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4618
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=36184fce2=wilfred.mallawa@wdc.com; helo=esa6.hgst.iphmx.com
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

T24gV2VkLCAyMDIzLTAxLTA0IGF0IDIyOjMwICsxMDAwLCBBbGlzdGFpciBGcmFuY2lzIHdyb3Rl
Ogo+IE9uIFRodSwgRGVjIDIyLCAyMDIyIGF0IDg6NDAgQU0gQWxpc3RhaXIgRnJhbmNpcwo+IDxh
bGlzdGFpci5mcmFuY2lzQG9wZW5zb3VyY2Uud2RjLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IEZyb206
IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+Cj4gPiAKPiA+IHVzZSB0
aGUgYEZJRUxEMzJfMUNMRUFSYCBtYWNybyB0byBpbXBsZW1lbnQgcmVnaXN0ZXIKPiA+IGBydzFj
YCBmdW5jdGlvbmFsaXR5IHRvIGBpYmV4X3NwaWAuCj4gPiAKPiA+IFRoaXMgY2hhbmdlIHdhcyB0
ZXN0ZWQgYnkgcnVubmluZyB0aGUgYFNQSV9IT1NUYCBmcm9tIFRvY2tPUy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogV2lsZnJlZCBNYWxsYXdhIDx3aWxmcmVkLm1hbGxhd2FAd2RjLmNvbT4KPiA+
IFJldmlld2VkLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+
Cj4gPiBNZXNzYWdlLUlkOgo+ID4gPDIwMjIxMDE3MDU0OTUwLjMxNzU4NC0zLXdpbGZyZWQubWFs
bGF3YUBvcGVuc291cmNlLndkYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGlzdGFpciBGcmFu
Y2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+Cj4gPiAtLS0KPiA+IMKgaHcvc3NpL2liZXhf
c3BpX2hvc3QuYyB8IDIxICsrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L2h3L3NzaS9pYmV4X3NwaV9ob3N0LmMgYi9ody9zc2kvaWJleF9zcGlfaG9zdC5jCj4gPiBpbmRl
eCA1N2RmNDYyZTNjLi4wYTQ1NmNkMWVkIDEwMDY0NAo+ID4gLS0tIGEvaHcvc3NpL2liZXhfc3Bp
X2hvc3QuYwo+ID4gKysrIGIvaHcvc3NpL2liZXhfc3BpX2hvc3QuYwo+ID4gQEAgLTM0Miw3ICsz
NDIsNyBAQCBzdGF0aWMgdm9pZCBpYmV4X3NwaV9ob3N0X3dyaXRlKHZvaWQgKm9wYXF1ZSwKPiA+
IGh3YWRkciBhZGRyLAo+ID4gwqB7Cj4gPiDCoMKgwqDCoCBJYmV4U1BJSG9zdFN0YXRlICpzID0g
b3BhcXVlOwo+ID4gwqDCoMKgwqAgdWludDMyX3QgdmFsMzIgPSB2YWw2NDsKPiA+IC3CoMKgwqAg
dWludDMyX3Qgc2hpZnRfbWFzayA9IDB4ZmYsIHN0YXR1cyA9IDAsIGRhdGEgPSAwOwo+ID4gK8Kg
wqDCoCB1aW50MzJfdCBzaGlmdF9tYXNrID0gMHhmZiwgc3RhdHVzID0gMDsKPiA+IMKgwqDCoMKg
IHVpbnQ4X3QgdHhxZF9sZW47Cj4gPiAKPiA+IMKgwqDCoMKgIHRyYWNlX2liZXhfc3BpX2hvc3Rf
d3JpdGUoYWRkciwgc2l6ZSwgdmFsNjQpOwo+ID4gQEAgLTM1NSwxMiArMzU1LDExIEBAIHN0YXRp
YyB2b2lkIGliZXhfc3BpX2hvc3Rfd3JpdGUodm9pZCAqb3BhcXVlLAo+ID4gaHdhZGRyIGFkZHIs
Cj4gPiDCoMKgwqDCoCBjYXNlIElCRVhfU1BJX0hPU1RfSU5UUl9TVEFURToKPiA+IMKgwqDCoMKg
wqDCoMKgwqAgLyogcncxYyBzdGF0dXMgcmVnaXN0ZXIgKi8KPiA+IMKgwqDCoMKgwqDCoMKgwqAg
aWYgKEZJRUxEX0VYMzIodmFsMzIsIElOVFJfU1RBVEUsIEVSUk9SKSkgewo+ID4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZGF0YSA9IEZJRUxEX0RQMzIoZGF0YSwgSU5UUl9TVEFURSwgRVJST1Is
IDApOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcy0+cmVnc1thZGRyXSA9IEZJRUxEMzJf
MUNMRUFSKHMtPnJlZ3NbYWRkcl0sCj4gPiBJTlRSX1NUQVRFLCBFUlJPUik7Cj4gCj4gSXQgc2Vl
bXMgdGhhdCB0aGlzIGNoYW5nZSBkb2Vzbid0IGJ1aWxkIG9uIFdpbmRvd3MKPiAoaHR0cHM6Ly9j
aXJydXMtY2kuY29tL3Rhc2svNjQ0NDQ5NzgzMjI0NzI5Nj9sb2dzPW1haW4jTDIxNjMpCj4gCj4g
TWF5YmUgRVJST1IgaXMgcmVzZXJ2ZWQ/IEVpdGhlciB3YXkgSSdsbCBoYXZlIHRvIGRyb3AgdGhp
cyBjb21taXQuCj4gTWF5YmUganVzdCBkcm9wIHRoaXMgY2hhbmdlIGFuZCBrZWVwIHRoZSByZXN0
Pwo+IAo+IEFsaXN0YWlyCk9kZCEgeWVhIEknbGwgZG8gdGhhdCBhbmQgc2VuZCBhIG5ldyBwYXRj
aC4KCldpbGZyZWQKPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gwqDCoMKgwqDCoMKgwqDC
oCBpZiAoRklFTERfRVgzMih2YWwzMiwgSU5UUl9TVEFURSwgU1BJX0VWRU5UKSkgewo+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGF0YSA9IEZJRUxEX0RQMzIoZGF0YSwgSU5UUl9TVEFURSwg
U1BJX0VWRU5ULCAwKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMtPnJlZ3NbYWRkcl0g
PSBGSUVMRDMyXzFDTEVBUihzLT5yZWdzW2FkZHJdLAo+ID4gSU5UUl9TVEFURSwgU1BJX0VWRU5U
KTsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gLcKgwqDCoMKgwqDCoMKgIHMtPnJlZ3NbYWRk
cl0gPSBkYXRhOwo+ID4gwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+IMKgwqDCoMKgIGNhc2Ug
SUJFWF9TUElfSE9TVF9JTlRSX0VOQUJMRToKPiA+IMKgwqDCoMKgwqDCoMKgwqAgcy0+cmVnc1th
ZGRyXSA9IHZhbDMyOwo+ID4gQEAgLTUwNSwyNyArNTA0LDI1IEBAIHN0YXRpYyB2b2lkIGliZXhf
c3BpX2hvc3Rfd3JpdGUodm9pZCAqb3BhcXVlLAo+ID4gaHdhZGRyIGFkZHIsCj4gPiDCoMKgwqDC
oMKgICrCoCBXaGVuIGFuIGVycm9yIG9jY3VycywgdGhlIGNvcnJlc3BvbmRpbmcgYml0IG11c3Qg
YmUKPiA+IGNsZWFyZWQKPiA+IMKgwqDCoMKgwqAgKsKgIGhlcmUgYmVmb3JlIGlzc3VpbmcgYW55
IGZ1cnRoZXIgY29tbWFuZHMKPiA+IMKgwqDCoMKgwqAgKi8KPiA+IC3CoMKgwqDCoMKgwqDCoCBz
dGF0dXMgPSBzLT5yZWdzW2FkZHJdOwo+ID4gwqDCoMKgwqDCoMKgwqDCoCAvKiBydzFjIHN0YXR1
cyByZWdpc3RlciAqLwo+ID4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoRklFTERfRVgzMih2YWwzMiwg
RVJST1JfU1RBVFVTLCBDTURCVVNZKSkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Rh
dHVzID0gRklFTERfRFAzMihzdGF0dXMsIEVSUk9SX1NUQVRVUywgQ01EQlVTWSwgMCk7Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLT5yZWdzW2FkZHJdID0gRklFTEQzMl8xQ0xFQVIocy0+
cmVnc1thZGRyXSwKPiA+IEVSUk9SX1NUQVRVUywgQ01EQlVTWSk7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgIH0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKEZJRUxEX0VYMzIodmFsMzIsIEVSUk9SX1NU
QVRVUywgT1ZFUkZMT1cpKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSBG
SUVMRF9EUDMyKHN0YXR1cywgRVJST1JfU1RBVFVTLCBPVkVSRkxPVywKPiA+IDApOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcy0+cmVnc1thZGRyXSA9IEZJRUxEMzJfMUNMRUFSKHMtPnJl
Z3NbYWRkcl0sCj4gPiBFUlJPUl9TVEFUVVMsIE9WRVJGTE9XKTsKPiA+IMKgwqDCoMKgwqDCoMKg
wqAgfQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoRklFTERfRVgzMih2YWwzMiwgRVJST1JfU1RB
VFVTLCBVTkRFUkZMT1cpKSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSBG
SUVMRF9EUDMyKHN0YXR1cywgRVJST1JfU1RBVFVTLCBVTkRFUkZMT1csCj4gPiAwKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMtPnJlZ3NbYWRkcl0gPSBGSUVMRDMyXzFDTEVBUihzLT5y
ZWdzW2FkZHJdLAo+ID4gRVJST1JfU1RBVFVTLCBVTkRFUkZMT1cpOwo+ID4gwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIGlmIChGSUVMRF9FWDMyKHZhbDMyLCBFUlJPUl9T
VEFUVVMsIENNRElOVkFMKSkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0g
RklFTERfRFAzMihzdGF0dXMsIEVSUk9SX1NUQVRVUywgQ01ESU5WQUwsCj4gPiAwKTsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMtPnJlZ3NbYWRkcl0gPSBGSUVMRDMyXzFDTEVBUihzLT5y
ZWdzW2FkZHJdLAo+ID4gRVJST1JfU1RBVFVTLCBDTURJTlZBTCk7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgIH0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKEZJRUxEX0VYMzIodmFsMzIsIEVSUk9SX1NU
QVRVUywgQ1NJRElOVkFMKSkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0g
RklFTERfRFAzMihzdGF0dXMsIEVSUk9SX1NUQVRVUywgQ1NJRElOVkFMLAo+ID4gMCk7Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLT5yZWdzW2FkZHJdID0gRklFTEQzMl8xQ0xFQVIocy0+
cmVnc1thZGRyXSwKPiA+IEVSUk9SX1NUQVRVUywgQ1NJRElOVkFMKTsKPiA+IMKgwqDCoMKgwqDC
oMKgwqAgfQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoRklFTERfRVgzMih2YWwzMiwgRVJST1Jf
U1RBVFVTLCBBQ0NFU1NJTlZBTCkpIHsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1
cyA9IEZJRUxEX0RQMzIoc3RhdHVzLCBFUlJPUl9TVEFUVVMsIEFDQ0VTU0lOVkFMLAo+ID4gMCk7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLT5yZWdzW2FkZHJdID0gRklFTEQzMl8xQ0xF
QVIocy0+cmVnc1thZGRyXSwKPiA+IEVSUk9SX1NUQVRVUywgQUNDRVNTSU5WQUwpOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoCB9Cj4gPiAtwqDCoMKgwqDCoMKgwqAgcy0+cmVnc1thZGRyXSA9IHN0YXR1
czsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiDCoMKgwqDCoCBjYXNlIElCRVhfU1BJ
X0hPU1RfRVZFTlRfRU5BQkxFOgo+ID4gwqDCoMKgwqAgLyogQ29udHJvbHMgd2hpY2ggY2xhc3Nl
cyBvZiBTUEkgZXZlbnRzIHJhaXNlIGFuIGludGVycnVwdC4gKi8KPiA+IC0tCj4gPiAyLjM4LjEK
PiA+IAoK

