Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A254E1F4C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 04:21:06 +0100 (CET)
Received: from localhost ([::1]:46492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW8bQ-0008Th-Tr
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 23:21:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1nW8Wl-00057w-7J
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:16:15 -0400
Received: from esa8.fujitsucc.c3s2.iphmx.com ([68.232.159.88]:44491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1nW8Wi-00052j-Mo
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1647832574; x=1679368574;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/QlHxZ9N/NU0IXroiQTLnpXM8y72uVFV8RiIQAPxd14=;
 b=PHJK6xecgnUf3MkkHFXdtCSQTqy0tqm9J9S4BNwVa7ZmzBgUAOd24+yQ
 E4wWdc9znCfWBWWn/xyiLv0X1Sc7WBjk8s0X7jzOhQKhGMxit0O/l2yA1
 zkT5WwpGsLBR2OgLUn2KO1UVGOW0J66U/MTQ9JqH2a/bQv5rmsU5QujYf
 fhj0OfvmrmkkI/lsRMGT0GrjqJs488c8Vc44eDOWYF59UX/AFy5Njiri9
 3EwiNSpFulGYehO79POo5AjmCTPcA5G0ziCtT3an0XXYiMbxs6sbNLTAf
 YJK3vWnr31fE4Rjd9H4zUs1QdwNUOoaWdbMleKKW0m7itHyqM8AQ2zlkk A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="52100927"
X-IronPort-AV: E=Sophos;i="5.90,197,1643641200"; d="scan'208";a="52100927"
Received: from mail-tycjpn01lp2171.outbound.protection.outlook.com (HELO
 JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.171])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:16:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgcRWlbYvp8vUkwYgSwYVbkHqQPvNG9aL8AzdobmI2g9URGuuYSShCeR46ddNrousQSYl0pGoB3nmHaexKsdsvykrwnUYkseKHnbqhYTvrRWZGd14CmqTGETQfoKZmo/SagrRwxaS37229tfcop6z7RKJNGlWMoWrPLwMTXysMJ1FhlIq39u2pKkAO4kabBw7pbXirr2dGDlJ+tAzki//zOseMUwNI9ilhYdIuWJ9huURiObNjmo5llkr3k7GrDxiPxh+R5ZhY9QelNVNdgb793QVc1YbTriwSLJGs9Rgkjr+Xh+uy5eynK4z9glBpOTlRydZrGNOaFEpmKMnhQp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QlHxZ9N/NU0IXroiQTLnpXM8y72uVFV8RiIQAPxd14=;
 b=T6yWGiLD60VPtGNlIQ2UJ9F7rZexabmBpuvhx8pZURXv7juPNT6bD5u2f7Aq+6BXN0ra4jy1FYArY49x13P6zhP74+xEPXHjuXp+VAwooc2gCxj9LVg+0vHLOli4RSS4cPbW5RqJUkr9XMNRbLJb9H7gSY8BMBrX0iDYJvm61tpprC9KPl9AY8jxrIst23Dy2q+yio+76XxK7ezjKczMCxJp9PNCoF8Sb8r3ibkMFlGrugSopiu7fva9QDFsLp2B68YMwDNKhCY2m5SLuiqWEk/NpuZQy7DFMpck6Dn2+s7MFVZJcRu/AZZHpPpP1rfp6fVztxEjh+zStViHly1CFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QlHxZ9N/NU0IXroiQTLnpXM8y72uVFV8RiIQAPxd14=;
 b=LN2sEqRxAagU90keBJe9nmT2S0q9sGIE8fKcUSqNvgFaIce4+BtaRHp7Q2SVfQA2KAanDcJXG8saShPHDDXTaLBl9Le0S4enHoaZWCDNtu9RjiJq0Q/E/faWnHSs7azkyeo2gr9hK6Jg24Ju3ZOtXSCDW5BxAbGIjgz2JBabQXc=
Received: from TYCPR01MB9305.jpnprd01.prod.outlook.com (2603:1096:400:196::10)
 by OSBPR01MB4439.jpnprd01.prod.outlook.com (2603:1096:604:75::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 03:16:05 +0000
Received: from TYCPR01MB9305.jpnprd01.prod.outlook.com
 ([fe80::d598:aa14:b8f2:1546]) by TYCPR01MB9305.jpnprd01.prod.outlook.com
 ([fe80::d598:aa14:b8f2:1546%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 03:16:05 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: Re: [PATCH 3/4] net/colo.c: No need to track conn_list for
 filter-rewriter
Thread-Topic: [PATCH 3/4] net/colo.c: No need to track conn_list for
 filter-rewriter
Thread-Index: AQHYM5LawZEx94bpdEW91AaKaD2W4KzJPNOA
Date: Mon, 21 Mar 2022 03:16:05 +0000
Message-ID: <e20383fd-9b16-267f-48a4-5942a1b0b273@fujitsu.com>
References: <20220309083858.58117-1-chen.zhang@intel.com>
 <20220309083858.58117-4-chen.zhang@intel.com>
In-Reply-To: <20220309083858.58117-4-chen.zhang@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c398fb4-0544-4f29-9e21-08da0ae9231c
x-ms-traffictypediagnostic: OSBPR01MB4439:EE_
x-microsoft-antispam-prvs: <OSBPR01MB44392AFC9C924984D78C4315A5169@OSBPR01MB4439.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E/QO2TdppvhZFHpl6nV35IMqUJHA4/zX7fuQMBr6iHSyy56fX/bq5HiT7Sf5fXv9hDCmoqN6GV2a+Tk9i3s7GGRxiO8OMAaKtAgsJNIv/x2sJTziatwFTEnVkL3b+3ciAJ9xZS614ZwVhRyMP87IUBdrpCjMp+k1htuIXNaJ3HwwLXeki9YSh5gh3XtV0Wbe44GiT5XErwg2fqIBsZaDc899Y8x0LnfC1t+VkzApxunGBfnDIoGbloHpfBjdzcvFCUOx42FepUNfoKzDHyTmjzyTc//3MW9/e61aQBtIB2b1z8/4a2CqPhF1zhRnuvI5SCFkTpcJUWjFUY+8Q2ZhQf9L/ZGRMpX2l/9t1ZsO6d3nj+nqbrrum2Z9sjtoRlsmRdtqkz9s1Bj1LUhPx2BZEYzMWCDAZBfCUH3Za4F26TcVLQe4JSo8YUGBGyG/fljdriyumZGFSeI0yn0tFFrur+RvwyMptPllAFrqI05s/M5a9Ni0JgsO/GnU+i2ab07fhPPXoAZq++U1yCi6YV4IzL1SwpkVaCKL5P8pkXw5V/aR1RgSQ1OGLETrT6e+F5nu9faC4BSPYfa+0LCo0afsyhkSVEeUj146uuMgbxPtbVDMCfiqw2/k9oZNIQ3aNU+7cykudNmUNy9QZPDojPgUKEVxjPR+rw8PLPJ7C6Itaoik/Ki8M2DLw+M+hzzPpcTu9LP6vWzazTNvafLzo2KaVYdR4qfWSW4m7Gm6acSI76K7XkfTpP2YQML1nzjkz4eEISYckgLF+UvIvkRpixBr3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB9305.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(8936002)(110136005)(85182001)(5660300002)(316002)(86362001)(31686004)(36756003)(38070700005)(2616005)(38100700002)(4744005)(31696002)(91956017)(122000001)(53546011)(6486002)(71200400001)(6512007)(83380400001)(4326008)(64756008)(66946007)(8676002)(66556008)(66476007)(66446008)(82960400001)(2906002)(508600001)(6506007)(76116006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2dyYURybFR0dnVhallZdFNtdEFqU1k0Skg4Q0ZDK3hwYmZWMWFiNitSL2hZ?=
 =?utf-8?B?QkJLUEdUOXRqZkR6SkFrZVVXOXhRbVliWnQwV0tqTExDUVdMMmVqLy9FbDlV?=
 =?utf-8?B?OXVJck1vSE56TkNqZXJEWVJna2FLM2ZveU9QVjhjZTZKbVlEMEozcU1CUytM?=
 =?utf-8?B?ZGV4YUlQYUplOS91Wk5YQm1QZ2lQUkpEMUFEY1NkYU5vRmY4ZlByQmk0b0Ny?=
 =?utf-8?B?aE9xREpTUGhacDVXVEtKZHlKTEFrbjY1eTVKdVdRM3pQWWlpUENuZTlFemcv?=
 =?utf-8?B?QVc3VUE1eG5jYmVCODMrOXFuSVV6U0hrTklXU25mVWg3Y2JUQjVmdjI5bEZN?=
 =?utf-8?B?MTlmeTQ4MUJRUEV6bmJNM1NQOFlQT29WOGRvSWFUWU5iNm5BNHhhamlEb0hP?=
 =?utf-8?B?cjVzNzlkY1BILzFhMFdsbk41bXdrSVRSRDJ5bjBUem9SQi9wcUdzdERpTHZX?=
 =?utf-8?B?QjM0VUNCVnpHV3JiMmxsOXltT0cyTGlVb1ZzV3hkYU0zRFRrbytsRFdQZkI4?=
 =?utf-8?B?QVBrbkxRVDlvbXJ0Zm1hb1MyLzhjb0JkV3FxNHZYa1pxa0hrNkVDUHVYbXVu?=
 =?utf-8?B?bWE4VzZjMnlhZEduVld5NTRoMGxaRzRla0QyNDlSankraU5VODk2WGUrUkJB?=
 =?utf-8?B?TVJyWUpuM3U3T09GTUNWY0xTOVVjaXUxQXBQNVVRS0ZMTzBLVVZRZFZ5Ky9m?=
 =?utf-8?B?R2ZmWEVCM3gvNjgzbEFSa3FBWW5BbGZZNEVIYS8wK3FDVkNwaVM2QXhQbk1x?=
 =?utf-8?B?YzgrYlc3T1Yrbkdxck1CSUl6K0JGUkhpYllFYytwQlJNSEZoSGlpUU5PRVhB?=
 =?utf-8?B?N1NTMTNDZjR6ZjJnZkp2c2g3bTJZbGQ2cTB4dEkvb2VSVzRzd25kZ1d4TUpo?=
 =?utf-8?B?SnIrMmxOUm5yNjNPRjhsVDNnaEh4SkV2SlBNSnZidDQ1MXhPaG1GOHRBV2Ri?=
 =?utf-8?B?eG9UMGczdWZpbjcxV2lZWDA0WnduMlBKRVo2U1lXUmxUR3djR0ozRHRxeDg5?=
 =?utf-8?B?dmN6Q1lhVHZQcCtmSTQ2VlFhOVAydCt3R2JuRU8rOGduZFQzalBHMU4zcXJK?=
 =?utf-8?B?Sm5uWWNNcnRYQnF5bERIQTI5VWIzcFlISkNTS091d3NpaXMxZHh2UmUyTWhB?=
 =?utf-8?B?MWlzbVVXanNpZjZrbjFZN3NmSXRCVnRHank4SnJ0YU1oazJ5ajRtSnF6T3Q3?=
 =?utf-8?B?OHpybVRBWVVKdTRWY2l5YjJBbXgzdmROVEo0bXNVbzQyS0cxdnpQOEZXbnR2?=
 =?utf-8?B?Q043ZjBFQkdVRUVza0pqU0ExbHVOc0hTUXN2Z0VTWnRDWW84bVU4SldQWmsw?=
 =?utf-8?B?UitlQVpxb3FHbktoSHVRNU9QN2hQcUpVNnkzbGhFdHVOWXB3YmZRdjR4TGhm?=
 =?utf-8?B?TVpyWktFMUFwRnhJblViUmVRblFyUnI4dFlDcDQxWW53U2VZVXpRTW8wUHRw?=
 =?utf-8?B?Rkg2a21FRFBmalU3ZXR4SmZoNUNmQ25ubkJ6SFdBWlFra1g0Zk1aOWxPZFVJ?=
 =?utf-8?B?Z09DQys4emt0U0RqWmo4VzBTNW1SMFJFL2F0ZEo0L0FVUkdYcUZUQ1FuSGZi?=
 =?utf-8?B?THB3bE1LcC9rMk16MDdKbUN1c3BYV0EzdFBuVGdVWHJHMkhlcU9OVWtnUDIx?=
 =?utf-8?B?Mk1teEk3MllCLzJwY3Z3MzE5Y09OV0grSXp4UGxLQkttUXdMbE5kK0RLdnFa?=
 =?utf-8?B?NnM5QkR1UUdONTdjSkdvakhESEYrcVhUNG01Ri9nT2M2QUgvaGpaR3FIeGtP?=
 =?utf-8?B?aFpJSjJndTNpSFFSUzluNnpYVTc1c2VIK09BSmZoZS9FUEZQaW9STXU1cjJv?=
 =?utf-8?B?VVJXVTl2UUFtTi90a0UxQ1QyUmdLMUNoTGJ6WmhGWDQ2Q2wvZTA0Rk1oR2Iz?=
 =?utf-8?B?Rkt5NXc1OGVZRFZxbTNSVlpaZW1jLy9zS2JIUXJlTldPNFN2ejVVNGNYUlZj?=
 =?utf-8?B?UHowaU1vWjZrSEMrVllaS0Qzc3Y2NnZHRy9kNVcyNlhMaTlVOXBQV21HK0Vm?=
 =?utf-8?B?ZDVwQzNGNVhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E93EA0D25263AD4A96B5181124A8F71C@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB9305.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c398fb4-0544-4f29-9e21-08da0ae9231c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 03:16:05.6271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqtAPWlxYwP+m4b50xv4cPE0VEO/bu9RoxQOouy5n/ZCTrcWvst5E/m/y7YrfXBimJZaShAPU6kV4uKQGixZdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4439
Received-SPF: pass client-ip=68.232.159.88; envelope-from=lizhijian@fujitsu.com;
 helo=esa8.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDA5LzAzLzIwMjIgMTY6MzgsIFpoYW5nIENoZW4gd3JvdGU6DQo+IEZpbHRlci1yZXdy
aXRlciBubyBuZWVkIHRvIHRyYWNrIGNvbm5lY3Rpb24gaW4gY29ubl9saXN0Lg0KPiBUaGlzIHBh
dGNoIGZpeCB0aGUgZ2xpYiBnX3F1ZXVlX2lzX2VtcHR5IGFzc2VydGlvbiB3aGVuIENPTE8gZ3Vl
c3QNCj4ga2VlcCBhIGxvdCBvZiBuZXR3b3JrIGNvbm5lY3Rpb24uDQo+DQo+IFNpZ25lZC1vZmYt
Ynk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KTEdUTS4NCg0KUmV2aWV3ZWQt
Ynk6IExpIFpoaWppYW4gPGxpemhpamlhbkBmdWppdHN1LmNvbT4NCg0KDQo+IC0tLQ0KPiAgIG5l
dC9jb2xvLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9uZXQvY29sby5jIGIvbmV0L2NvbG8uYw0KPiBp
bmRleCAxZjgxNjJmNTlmLi42OTRmM2M5M2VmIDEwMDY0NA0KPiAtLS0gYS9uZXQvY29sby5jDQo+
ICsrKyBiL25ldC9jb2xvLmMNCj4gQEAgLTIxOCw3ICsyMTgsNyBAQCBDb25uZWN0aW9uICpjb25u
ZWN0aW9uX2dldChHSGFzaFRhYmxlICpjb25uZWN0aW9uX3RyYWNrX3RhYmxlLA0KPiAgICAgICAg
ICAgICAgIC8qDQo+ICAgICAgICAgICAgICAgICogY2xlYXIgdGhlIGNvbm5fbGlzdA0KPiAgICAg
ICAgICAgICAgICAqLw0KPiAtICAgICAgICAgICAgd2hpbGUgKCFnX3F1ZXVlX2lzX2VtcHR5KGNv
bm5fbGlzdCkpIHsNCj4gKyAgICAgICAgICAgIHdoaWxlIChjb25uX2xpc3QgJiYgIWdfcXVldWVf
aXNfZW1wdHkoY29ubl9saXN0KSkgew0KPiAgICAgICAgICAgICAgICAgICBjb25uZWN0aW9uX2Rl
c3Ryb3koZ19xdWV1ZV9wb3BfaGVhZChjb25uX2xpc3QpKTsNCj4gICAgICAgICAgICAgICB9DQo+
ICAgICAgICAgICB9DQo=

