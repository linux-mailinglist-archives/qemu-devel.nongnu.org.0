Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4FA4D1D4D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:35:04 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRcnf-0006Mx-Au
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nRclw-0005J8-Ef
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:33:16 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:6538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nRclu-0001LN-8U
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1646757194; x=1647361994;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LFvn0ricMcx2URqAlkQYyvDRtyMKCsBbtK3Eenspg/Y=;
 b=GLfjQ79wwIk/17xSnIx9Z7ebsIDo0wHCCCzz1wKNOhYoJG98YtOP2MqM
 cka1qlmg5CMxDMI8071j4iMoQr2F0XASV7IP9ppWfPLXrtF4KYxD5K/Z2
 0c1lTPuRo1ZeR0ip/A22uyVjxYhxKe2h4EHh0o2RPAhxD8LOkfJmfv1Sf 4=;
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 16:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0xKJnQpNVhWs8AEyvQ4M7vSYKzALSGGY3El5B3LDD7yz62gplvZ5Pgv1EPgtxIsvuTmwj2rM7qKe5Ucq4CFkIxKnAut1OJCnICQCe+AE8nMGwHIg15qrpce+PSgdr4V+7QvXEg4MaC3hUhLMzKNRrfU8F2Kunh/k/Y5dp52oUku7f9scBPRoBEq/TS6zA+l4mtKhipn8NgpQTvhxWJVnG+WC77Nu3ASdb8bU8FTAdTs3h8wIa5yZktBfJT+NJtLXdfCoPub2HGobt1BrLRCxJEh30LEyE//CzLGvY1npzTuEo336hMW89JhmQNjbvEY6EgoT789iOYUeRRZ1w1RkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFvn0ricMcx2URqAlkQYyvDRtyMKCsBbtK3Eenspg/Y=;
 b=i2YnOdzPVHtVsA5NtGGb3bk0OB61vhcog/jmQDyDG8rL2A77czy4QhLtML6p7t93ata7jkPJtjroQJIwgDxvCYSbNFpc4d8iN89UyeELV9gkOy8LGXsS3fZBB5K/Lk6Hucvxz3GHKNaf/mClDN9zJ+i2BVp/JHTDVbKiMS3AFWwwBPzGarj+3koMpO1kHN+Gfc8GegBST63sFBJXGhI0y7a/MP6RZFC0AYjD7q1vXwRHAzIzbFcoXU6B9jKZXTXkCaKlOf0dCyAXTKHNj4nYFWhq64Ja24eLRwa/YP7WPAsIO3uMrtM7oEtfiG5XeEEKpwtso6o9Bfev9hJzq0Q3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6376.namprd02.prod.outlook.com
 (2603:10b6:610:12::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 16:33:05 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::a55a:64a8:cac:4a39%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 16:33:05 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3] Hexagon (target/hexagon) properly handle NaN in
 dfmin/dfmax/sfmin/sfmax
Thread-Topic: [PATCH v3] Hexagon (target/hexagon) properly handle NaN in
 dfmin/dfmax/sfmin/sfmax
Thread-Index: AQHYIu9Hbr/s+xJ7r0iSUghu8W8ANKyWygSAgB8DK1A=
Date: Tue, 8 Mar 2022 16:33:05 +0000
Message-ID: <SN4PR0201MB8808BD14B6268F90256A8F2BDE099@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220216043939.25339-1-tsimpson@quicinc.com>
 <9d21dc04-0010-2ab9-9bc5-d42fa2f06fc0@linaro.org>
In-Reply-To: <9d21dc04-0010-2ab9-9bc5-d42fa2f06fc0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4ecf0e7-a589-42da-1c96-08da01215252
x-ms-traffictypediagnostic: CH2PR02MB6376:EE_
x-microsoft-antispam-prvs: <CH2PR02MB637672EA5ADEA1526136BD5EDE099@CH2PR02MB6376.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YjkjYGAKPAxuB7EjG7F4n7BLqrzt7oskZjZYGL3HvmBVxJFfSFPryrW3gZGohoH7JfONlNYI3HOSVHquU9F559kUFnRLrTgJbsH0QRhcX30499QmIuhvx2JiZoO51PQ+wHfEAkUGeWdnlG+236K+GFyvHF2gJuMGsGhun760FGqTwmg22pkXmmBPDoADnYJTMxTJddAjfnN3ligd9Lnop2tQovq8EDT7n2FppplClkpD+e5BhtcLc05lgNU9pfqBrDzK32P1cIfifyWOZhFdHrgfwtVsp6l7ejmnJkXpG+K1ljNbqP2FBk03E71T82NgyJG8ywFi70J2MUcDs6e19vVmo8sthsKLc59UpAowpdo35YqXeK/fv2w7sQISI0s1sAUIG6E8V6JKgxFwjlt1CYpmHi5Lb7WcfSF2uBDMLOtJYXDZqmihilBn1d/SYGFHVA6GNT/h1zJfILTGXJnG1A4tPp3XQPlKSL5Ni8t1Bw8scV4bKAaSk44MHvAkBvdVBDU8iGaraWjWp9/xGwKaNNlhz4U0HLK0FuSoERr34q7tMQ+g6EB6kprKV1o/aD9j4Xtxmx1rLzKet4Tu+YOVoE0PEIMZb+jt0c+geZk5e5rDJsn610nIN3hjNsmW+WzWDwWLAeQ0T1aOLnSFQ+OgHKYa0f3W062pbcjSIh8jleHnTDOn3OEwO+rHkLfBquX5KW3q4OJcsiRzuDJrN/Ur7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(38070700005)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(107886003)(5660300002)(71200400001)(8676002)(8936002)(83380400001)(52536014)(508600001)(186003)(122000001)(26005)(9686003)(38100700002)(33656002)(2906002)(55016003)(110136005)(86362001)(7696005)(6506007)(54906003)(316002)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NER1djhlMmZKVUxjbk1HNUtMWDFXbWZzK2d3NTc4citQL3FDMGdQMHBrN2VF?=
 =?utf-8?B?Rmo0dmdRaEl1bytmMmNqV3VQYmZNKzdKczY1RDdlcXNERXBPRmNSZWVVendq?=
 =?utf-8?B?T0Q1ckxUWVVlREhRRS9TUnJlY0tDN2EvSkZuWldoVGNIcEc4ZnFaOFFIb0Jx?=
 =?utf-8?B?VnlTckNxVWpwd1pPL0w2WVBrWWhFMUw5cng0UkxFT1B0b2RicUk1aEJudS9z?=
 =?utf-8?B?SXpWWE1nL2dnNnBGdHJhUWE0Qm8ySVVOTDhNRE15TThYRTBvNEwvVW9iZXc0?=
 =?utf-8?B?MnJzbHNlTVpWU1RXY2ZpdUtabm9mdkgwWXl1NWVzbHEzYUI2cmxKVk9BMTN2?=
 =?utf-8?B?TTNpV2RQQ0pER3BpWG1JZUNBVm9qWWMyeGtjbjhCLzFqTnF4R3JMK3F4QVp3?=
 =?utf-8?B?YUxNSnp4aFhuMFBObms3YjdXRVlXWTFFRktiNjBYZnJ1Rk1yR1M4alJPVjVa?=
 =?utf-8?B?WFVQcVFOeUtZanZ4RS9IOEltUjFQYk4xbVd3bS9jUStqTVZZTSt1TXF6VDZy?=
 =?utf-8?B?ZldPTzBQVGRsZldUcmN2NzY2bUFTdWxzbXlNNWMwUW5nZHl1MlZYeEQrVHBX?=
 =?utf-8?B?a3Q1L0ZuWG9YeU9TVEV2eTJZRUNDWTBRSjhWTzdHcERrYW9SSGhFditlb3Ez?=
 =?utf-8?B?RXZrVjJ2OFRVU2o3ZkJpMXZEV2NraXBJNXpCNS9iSUJIOXptenh4SVpuYlNC?=
 =?utf-8?B?OVpCc1poVzdJazNCL1BBZ3RmeGQxRTU1bk1mZjRNaFg3eDNaTXpvSG5hRDMr?=
 =?utf-8?B?NGxiZWgzczNNNGJqRXdBa1E5Zi9ocHBuemg2dkVwNTBjZGtVaWMrOTc0YnBy?=
 =?utf-8?B?U1MrNkZxZ2RFdUFGS08xNWs1VHpudGFqdVppdTFxZHBOWE1NVVZmVG94Tm0x?=
 =?utf-8?B?REhxeEhCSlozZmtJRUNvSmlwSjRuYXZ3dzBnV0htQk9IWGJid2phWWVHcC9z?=
 =?utf-8?B?SzRjRzh1Y1J4NkNzWDdmREdvRDR3cjlvc2E3U2hyV3ByWHlsbk40SDJEMnFw?=
 =?utf-8?B?NWY5cXhsNG91d3ZQR2lsOFI1RmgvcUJkWFVWcHYvOWhKSS90Z2xBeTE4UlZY?=
 =?utf-8?B?T2JqTWNIUzVrUVZzdTVhQndlY0JmeW9RZ3NjRnFpeExqa3NIdDd6MTdtbzB5?=
 =?utf-8?B?NGRLUm1vUVVCRTRNVzdnUnhVRWhPeDNpbW8xU2txekRZUjNlQzc4QTN3SzBJ?=
 =?utf-8?B?eHZ4U2c3U3dGNDJRSVBWK2RSNXNUNHZCYXJmQTJWM253Kzk0cEtZazdJbU1n?=
 =?utf-8?B?emhCUi9XSWZ1VmJ4bXlDNTN2WVFEeE9BdmU5ZVRLWHZMaDd3RDBpNEVMd2tK?=
 =?utf-8?B?aXJrVmE4V2lvdFBTTTBHRTZoak12aFU1bDhPcEpCQ21VQTR6UGxDZTNYZlhz?=
 =?utf-8?B?K0cvbU00d2QrYmNkUHNMb3ZUM3NrbXQyaWNzVldBbUs0Z055OEd3azd3enZ0?=
 =?utf-8?B?ZW5adnpKUWdGWVF3Tit2MFRrWExpT0ZLUnhndDNBdm0vL1JxNElqVkpIWWtt?=
 =?utf-8?B?blZrc3I5RW5vYWc2VkY0MnNNc21BTm54dUhHVStnaElaWnlvUnkyWkVUcW5G?=
 =?utf-8?B?aVpaN3BJVFcyY0w4NlgvcnpKNERYSEJNQXFBaGtRT0VvcmJMZm5OYnZ5Z0NX?=
 =?utf-8?B?Wi9ydHZDLy9TS1Vha2NQNnVuVTlHZUVCWGhFc0hiSjB2ZnUxRTBnU2dRWkRV?=
 =?utf-8?B?QkNVb0d0SkJTcmFITElqZXN6a0tCUjlpZkxBdnloVy9MVVdHcjRqSlcya0Zw?=
 =?utf-8?B?SkJDRU45TE5sVEQrOHJjaHZzK0tvMjhEVDlDdWMxRHZ0OEF4RFRWL2cybXU3?=
 =?utf-8?B?em82YWpLdnF0K1g3Zk1VT1d1UnI3VnFYOGNlRHQrQ3cxTUJtSTl4UnA5RXBh?=
 =?utf-8?B?eFJKanFDM2Q2ZHhtQnBBaHQrSmozY0dIUWdEZW5qVEh6UHMrekNoZzZDMHRy?=
 =?utf-8?B?ckVMM1hPRm9TaUwvTlpseDNFaUJ5Uks4YTVtcE5IRVpBbWZJR1Q5dWUxeWVR?=
 =?utf-8?B?dEpsb1ZwcjhtYVNSbU5nSmFpS3RldTI4QzV3MzZyWFpOc1l3LzB4dTNjUzVi?=
 =?utf-8?B?TDEwT2tHeWJvay9YM1RYSDRYR2hyQkx1ZUNrU3M2bm9XKzhjN0tUbTAxb1Jj?=
 =?utf-8?B?S3Q3aDVadzJsZjF6aWhPRGNlMXdQdFh6TzZRTG1tV3FGYWVHYzQwSTh1akFp?=
 =?utf-8?Q?1yft4YoquTTmqfAixzbQocg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ecf0e7-a589-42da-1c96-08da01215252
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:33:05.2226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHkm84+ffPn2sucyEmRQJX6XDDx4zS14yfxsHwI58g4OSlST4sAJQMKWJ7Vjbms8Kn4wlN8DSKBdIPcO9DrdVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6376
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>, "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVi
cnVhcnkgMTYsIDIwMjIgNDo1MyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1
aWNpbmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBmNGJ1Z0BhbXNhdC5vcmc7
IGFsZUByZXYubmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPjsgTWljaGFlbA0KPiBM
YW1iZXJ0IDxtbGFtYmVydEBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10g
SGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHByb3Blcmx5IGhhbmRsZSBOYU4gaW4NCj4gZGZtaW4v
ZGZtYXgvc2ZtaW4vc2ZtYXgNCj4gDQo+IE9uIDIvMTYvMjIgMTU6MzksIFRheWxvciBTaW1wc29u
IHdyb3RlOg0KPiA+IFRoZSBmbG9hdD8/X21pbm51bSBpbXBsZW1lbnRhdGlvbiBkaWZmZXJzIGZy
b20gSGV4YWdvbiBmb3IgU05hTiwgaXQNCj4gPiByZXR1cm5zIE5hTiwgYnV0IEhleGFnb24gcmV0
dXJucyB0aGUgb3RoZXIgaW5wdXQuICBTbywgd2UgdXNlDQo+ID4gZmxvYXQ/P19taW5pbXVtX251
bWJlci4gIEZvciBkb3VibGUgcHJlY2lzaW9uLCB3ZSBjaGVjayBmb3IgUU5hTiBhbmQNCj4gPiBy
YWlzZSB0aGUgaW52YWxpZCBmbGFnLg0KPiANCj4gSSdtIHN1cnByaXNlZCB0aGF0IHRoZSBiZWhh
dmlvdXIgZm9yIGRvdWJsZSBkaWZmZXJzIGZyb20gc2luZ2xlLCBidXQgdGhlIGRvY3MNCj4gYXJl
IGxpZ2h0IG9uIHRoZSBzdWJqZWN0LiAgQW55d2F5LA0KPiANCj4gUmV2aWV3ZWQtYnk6IFJpY2hh
cmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KDQpUaGUgZGZtaW4v
ZGZtYXggd2VyZSBhZGRlZCBpbiBhIGxhdGVyIHZlcnNpb24gb2YgdGhlIGhhcmR3YXJlIHRoYW4g
c2ZtaW4vc2ZtYXguICBJIHdhcyBzZWVpbmcgdGhlIGRpZmZlcmVudCBiZWhhdmlvciBvbiB0aGUg
cmVmZXJlbmNlIHNpbXVsYXRvci4gIEkgd2FzIGFibGUgdG8gZ2V0IG15IGhhbmRzIG9uIHRoZSBu
ZXdlciBoYXJkd2FyZSB0byBydW4gdGhlIHRlc3QgYW5kIGZvdW5kIHRoYXQgdGhlIHJlZmVyZW5j
ZSBzaW11bGF0b3IgYmVoYXZlcyBkaWZmZXJlbnRseS4gIEknbGwgcmVzcGluIHRoaXMgcGF0Y2gg
dG8gbWF0Y2ggdGhlIGJlaGF2aW9yIG9mIHRoZSBoYXJkd2FyZS4NCg0KVGhhbmtzLA0KVGF5bG9y
DQoNCg==

