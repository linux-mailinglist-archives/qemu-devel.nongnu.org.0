Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CAE5B5EC5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 19:06:10 +0200 (CEST)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXmsq-0007kq-Ui
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 13:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oXmq7-0005am-DG; Mon, 12 Sep 2022 13:03:19 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:9050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oXmq4-0001kO-IW; Mon, 12 Sep 2022 13:03:18 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CH07Rg007978;
 Mon, 12 Sep 2022 10:03:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=DLBjc75jRkIzReUgfBxvunArbM6mQWxWmDPNVqGjvWQ=;
 b=lrAmsJNRwhYDq9jKREih6w/sVuEfnjC5MmiQul1rZU6v7unjz2FPFv0KM9hu7m5/Io8v
 LH3gvBneHzdDoDZ9qz1xU9S9Qw+VrENdNutmftP4Bjxyi4qMQvYJKJAf4EaLr5qN/1xk
 /4wHiC7+6SlYr0ygoucNxrZ4h66JPpm95Sa/+kjPB1xWookbRT+lTEKg/ZVoJs3Vu+Uu
 czCiYygJrGEejlz48rGTdp4qJd8LC9B47zkE0oBnD1wRiFWUGTjgBDfqRnP3jc4yJ5AS
 wdpPZf/zqZFfZVITPtD+CTMsDOEHH1PaR/iXhbSe5RLU1PXVAzsD+An2wLFuSWWZN6Mp Kw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3jgswfv6mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR7aPiOWcIASe+rawMiMphNCMBP3L6Q2+ctK8h1tMwXlbYoX8al68z59reH+nAdRs1kWs0SjW/16TeYzzSlLHzvfJkYPYjaELr7b68jVNyBtMrIUR+EuRYHPt8pC5LPn/p6T0RUyhlgP7vENS8CzzXKm5ZLEelkFE3U3/Ec5DLrPd92vVSr9NohWK7iGKoAdME//4BpcVQFheBzlbQJmk1+V6sHICaNJzkXp/evBqjCECVd233iXUdPW8NeQirSvfuXeZ54SvGssRzn9RB+GURsEE6VJHhHRlyH7CiPsAFWl5BWsPjOYC9tapTsUI3qvWuLjbore2dBEsacy80mq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLBjc75jRkIzReUgfBxvunArbM6mQWxWmDPNVqGjvWQ=;
 b=alAgQ5oOl4deNlrr7dpAH0BmaDEnl2aCsUKKkEsW5Re1hk9dWn37qGDVfDOE7EFTCghvOrFzu0lc+aope/Uk2vcmdc6it/nUUGCJdjQH4BV2bmpb4Uw7gxUKyzg4f8M6xRHFncfrh0vaurc+8zfGgyAyOSBP9e6a/UrGPkjnZNrv8yx9+nMr7ADzEOiVDCTYk29bF9VlPIBglFLBqA0mewdqDfWYT5DMzW0JEj0xmEhQ2kdXMeDau9R9XSYikMp40CXCUod7c3vNCkn0rLooRmUWgMCaNngv9seo369ViPWIwEoTufqBl1p4WUy9ardO2vUUbSjQJSJK6HibIoAeYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by CO6PR02MB7828.namprd02.prod.outlook.com (2603:10b6:303:a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Mon, 12 Sep
 2022 17:03:09 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%3]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 17:03:09 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: [PATCH v3 0/5] vhost-user-blk: dynamically resize config space
 based on features
Thread-Topic: [PATCH v3 0/5] vhost-user-blk: dynamically resize config space
 based on features
Thread-Index: AQHYwcKvP8gUp4hBlkmx4MOh0GqH4a3TWZaAgAiR+gD//+DrgA==
Date: Mon, 12 Sep 2022 17:03:09 +0000
Message-ID: <33F94439-31C8-4160-9D50-F04A1515F5E9@nutanix.com>
References: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
 <20220907040149.GA6661@raphael-debian-dev>
 <e4b1a094-9674-1242-b479-911983f4039f@yandex-team.ru>
In-Reply-To: <e4b1a094-9674-1242-b479-911983f4039f@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.64.22081401
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|CO6PR02MB7828:EE_
x-ms-office365-filtering-correlation-id: 5256cf21-3e1a-4380-c8f1-08da94e0ab1c
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5eeU2Z5/HDMbdtQSjPh7X9tpbCFLRTgft9oHrom6iDbCEumFKv1S2tNKMYuDC2JSjJYKy2vBtw6vWg5Rtasw6pz59wt0ZHe9q4aWUBlWY1aF8c5VEYOdsdLsv6Zq83goIdkIPi1KShqJc6FYQguleXglFznWPidR4j5TR3ewmpLyyDeUXDaUpTwDakTkx7Sbf5HfLnRW6b+zCc8QhpmwR3Wjl2HHC7JQzfBbVY5RWoDiu3v0LSYNdyL2ONeqRGxDH4RHgWI04IY0aqkouNOn9O2Opwi5A+XGnHXPryW7Y52YYgqsZiCBSMMDoczYBmGgIHQKUvzaj8e27GzbuCILYSlNBULrmapYg0VPFz1vW6W10Jll4G38iGaUVlsB3WM+3Rbwpu0AzxuaX4QTxxAivZ1Wl1zLxgfjtkBnlJaOTMLqZ4G8UM34HtdIRUvw4pXSBp80DoQsAbfSwZ+hvlJOHlHZ0hUGVvHCrkGpWuuNr5uDZscCzNQlJSmVJQTMci6yoKvrD2oiC49QOH46ztv6cKwFwwq6RD/6dWGIQUKqTbjtQsMi2HTKi3kCW6dK3NlPrg5JZVg9ophGcVFO822u8AzDK3D222bD7w62HYKgQxYy7cZVSTCsPn6pZ3P6+yZed/Hbt/C8IrBooAkkKnsymQzeZtMnQX3KI83IApCP+zKxlNJucRoMXEQ+hTm/Xpf2l8WMR7pk8MDg9tqzUInSRvvjQh2KrVJWyoP8peCTt5mz8M7njS8fhRvbXNmcehTMTGBQ9im3VuHwJs8//XKO1up8yU0abXvO+mW0oxhQvdU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230019)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199012)(38070700005)(186003)(6512007)(6506007)(6486002)(36756003)(86362001)(2906002)(76116006)(33656002)(64756008)(66556008)(66446008)(83380400001)(2616005)(122000001)(8676002)(91956017)(44832011)(6916009)(54906003)(316002)(8936002)(4744005)(38100700002)(5660300002)(4326008)(66476007)(66946007)(478600001)(71200400001)(26005)(41300700001)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXB6a2h3L09Db0dzZVJ5a202V3dDRUxFRnFHUVZOUkUwbFFGZysxK1Q0YVZ1?=
 =?utf-8?B?MVpSOFlUNDBhaU92N2dFekNhbzZiOGZXd2VZenVoOHBaQzdWNlVZQmZwbStF?=
 =?utf-8?B?S0lKZzl4clBqTjlnK2s2QmVPS0VLVkI1UzFWZGJnWitzM0VFTGY2TGxGQ2M4?=
 =?utf-8?B?bDFRRHJ0WEZGTG5RWUpoa3dLNEYrNTZmMjl1VUdMQlJVU3JKa2ZIZ0VlMSty?=
 =?utf-8?B?SnBGeGd3dHZOcldva3AwRWVkMUY4d0dhdzd2QjdUNmFjRC9KUnUxTi9hUFFl?=
 =?utf-8?B?S1V1a05aQ0wwWnRyWDFjWFBLd2xYLzdtc1BkZnVydXpQeEpUUnh2akpVZWR6?=
 =?utf-8?B?SWJRMS9IZVNjMXBZdTV5dW5qTjl0R2pya0RXclZrOUpmR2RrL3hiYWZLQkVC?=
 =?utf-8?B?MTFWeG11NXdpWWl2cU5nRGxNbVprWVBuV1Z0ZkZua09SMStNUFZISmhMSG53?=
 =?utf-8?B?TnFpbDB6ZWlBb2JzY2V2OU9BS0ZEVGNkT2F0aEdOVWN0NjAzMXUyMHpXYXZS?=
 =?utf-8?B?OFM0Z1JTTnJ4Zjh3anJGZDF3ZjlzSFNpdVYyd1lVM1cvY3BGaGlZMnJJYXNt?=
 =?utf-8?B?eGVadTh1cnFyUS9PcE53aEdFSWhLTzhkS2Y5djVyNndMY2twckpkTS9yelJF?=
 =?utf-8?B?T1o2WlNqN0ZPREgxR3ZXUmFCYXlwd09CelNIcTc0Y2duemFsOG5sZkplMUZs?=
 =?utf-8?B?dU44N1VjQkh1YVVkMjZhMnlGdVVvTStMZVp5ODVFb2NyRkI2Y2dvbFhMY2Q0?=
 =?utf-8?B?SjJHNS8veHltMWIyOVZKRUVTSElRc0dvNkRaR1FjYU1Nb2N1cVh4eUNVL0xv?=
 =?utf-8?B?emdxaVZQZG14SURBZkFtY3RpMCthdzZwM0l0QlRaVmFOVTlTRWQwdXBKTTBz?=
 =?utf-8?B?K2ZQVm42SnZnNU1XSzIwTVVpWDI5Z3lNQjZhcjJ6ZDZWeDd5eXRBSCtwTGVp?=
 =?utf-8?B?YWlGWHNPWHhkcFE1eHFydzZONnY4cSt5bDI5ZUVpK3Q3V2huZm5yOU12YnZm?=
 =?utf-8?B?UTJmVHdabm9WNVp0VW51U0hqMHNEVE9QczFlc1hpemRyYzRVS1BBdFFNMlZH?=
 =?utf-8?B?K0V2NERRblZ0dnFMaEJTTzgrWHh5UHFEcFNVSGIwNllma0NTNXY0SGl3c2hm?=
 =?utf-8?B?aEk1MHdpZCtQWklRM1pHcUJxNzJ4ZFhONGVjaDh5dTV5M1N1VGx4OGtyd0M3?=
 =?utf-8?B?dGt6aHdvSTU4SE12Q2JLcTFPTk9NNmt2YW9ydTNiclBHck5YRGorTnlNM2hD?=
 =?utf-8?B?YzdhcVZQL2lyRVkzVFZ4dFN3b0l1emNlcUpnQlpENTJicDNyV3lmWThnYlFF?=
 =?utf-8?B?d3NkNE5nMmYvV0k1cEF5YmRMOE1tU3ZmTG12QkxHMFptNFlma1VZS0ZFaDBW?=
 =?utf-8?B?TUVveVNFQW5ONUFtM1JNaXZiRjRJT2R3eENQY0xrKzlFSStVaVhDN3NpRi92?=
 =?utf-8?B?cGpSNlFJL0Q0bEp0QnZLbXZ3ZUQyQTYyM1kvTU9JS3J5Nkl0amw2MzVENEF6?=
 =?utf-8?B?QmtBeTFLWm9yQW5lYTRrUVRYWDgxbWQybmZyZVg4NFFmOERRM0EyUVJlSnpU?=
 =?utf-8?B?RzA3czcyUVU4ZUJIeVVKUnVERkpPSUQ4cjNhTkFVenJVL1ZieUNjZTBEY2FE?=
 =?utf-8?B?ek15TjZzNjFCVWlhLzZ1Q2pJTTE0K1laOHh5Y1ZVMjFndUlpblRpcStZRjVI?=
 =?utf-8?B?MW5hZUp4VWIxTDduSWdUOW9tR1NPTE52cHg1VWlFYkNWVzNTc0lRR09pZFk1?=
 =?utf-8?B?QUppWHNBank5YUJVNTBBdVR6M3pxTEtqNUdQZGgwR1A4Ump0eE52aWZMZmJC?=
 =?utf-8?B?TzZuMTZqMWR0cVJLM2plK3NzQndFVjhyNjNySGxBbTN5bFpoQUtscTVmYzFj?=
 =?utf-8?B?aFpNd1NNSlB4UWd4Nms0SXFoR0Nvdm1rc0x5aCtzRGl5NXpJRloyYm53WCt1?=
 =?utf-8?B?VG9UblJDNmZGRHV4MUpuMC85am5xTjdiOXdiUmQwUkRGYWQyZXJRb0J3SzBL?=
 =?utf-8?B?emdUdWZFTmdnSFFGYTg0ell3RUZmTjh6ck9yanZQaHF0eXFmbVFzdzEvNU10?=
 =?utf-8?B?czZ1NnhOUXRVaHFvNTRUb3FaU1dua1FuWEdVWnBjR011R293ZnNDQTBlSkJt?=
 =?utf-8?B?N1RmVWZVeDJUS3AvOUVMbUIvQmdRcVJjRUpzMnppaXFMd212dlJ3S0JTaFcr?=
 =?utf-8?Q?EggZc6Chqd/Sq4HhNhvYBwo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60F5C8D6CED5584399432183566C07AA@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5256cf21-3e1a-4380-c8f1-08da94e0ab1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 17:03:09.0409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YM6HR+Jlqs52TrcdiehXiCKMIj5Iz+51Zi6lrqwJygDB3alVUWVfBOoGBAP/sjetRTKm79Bactjdw0RKrVmO52MY4FUOgWf3FxG0mTEXJok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7828
X-Proofpoint-GUID: HwlclpDGR71DAlxQzUBTD2BZ67nWizp4
X-Proofpoint-ORIG-GUID: HwlclpDGR71DAlxQzUBTD2BZ67nWizp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_12,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

PiBUaGFua3MgZm9yIHJldmlld2luZyEgQ291bGQgeW91IHNlbmQgYSBQdWxsIHJlcXVlc3Q/IE9y
IGRvIHdlIG5lZWQgYW4gDQo+IGFjayBmcm9tIHNvbWVvbmUgZWxzZT8NCg0KbXN0IHR5cGljYWxs
eSBpbmNsdWRlcyB0aGUgdmhvc3QtdXNlci1ibGsgcGF0Y2hlcyBpbiBoaXMgUFJzLiBVc3VhbGx5
IGEgZmV3DQpvdGhlciBwZW9wbGUgcmV2aWV3IGJ1dCBJJ20gbm90IHN1cmUgaXQncyByZXF1aXJl
ZC4NCg0KQSBsb3Qgb2YgZm9sa3MgaGF2ZSBiZWVuIGJ1c3kgcHJlcHBpbmcgZm9yIEtWTSBGb3J1
bSB0aGUgbGFzdCBmZXcgd2Vla3MNCnNvIEkgd291bGQgZXhwZWN0IGRlbGF5ZWQgcmVzcG9uc2Vz
L3Jldmlld3MuDQoNCg==

