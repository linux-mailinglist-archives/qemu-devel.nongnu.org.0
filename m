Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D744E1F3D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 04:07:20 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW8O7-0003Jt-BF
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 23:07:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1nW8MZ-0002ea-6B
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:05:43 -0400
Received: from esa3.fujitsucc.c3s2.iphmx.com ([68.232.151.212]:38967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1nW8MV-0003Lu-Vi
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1647831939; x=1679367939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yR3UY8cDmJ26XkAEdOjINza72pu3ZZMpL5DqIezQnho=;
 b=l0FOaXDn+pFOPVaK7u/nBVxvj6pTvwTVVqQkxawkFwK/ENEO0q1GNc1W
 rMR5QRWASEv6oDhwMraAWJUGIB0YfIk2odYJDD5JYSDm1uiZYqUb1VeXA
 9za2pUdHqOzkjwrTtAnuFw5MRt5FyEtGgyxrtKGVk2Yr7W7oX8CZ+e+cu
 O1AaO93DrpeXuTc0cAzU5hFcUaDjDIEg00/ii8BTpccl89sbACrijxO9M
 u234RDnTfTNV8PxipQgitJ/017Pcs5fCoATypsvTNSaMLtdaw7xsfoXnn
 pz0t+fsI7dmLr7cXxVQ/rlWQl/jDzvaeGlFIR7r1Brc+f0P4EiE+nbaMy w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="60198136"
X-IronPort-AV: E=Sophos;i="5.90,197,1643641200"; d="scan'208";a="60198136"
Received: from mail-os0jpn01lp2104.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.104])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 12:05:34 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaRSe60NDnUpmIe+DPWiEDGo8GsuFU6J7pZ7k1XCmpuHUf23EHkNbqciL/DrIZdXpvHNAobao/XNgIYIsWsRC629QjYmygoTzhXmFNCJzUFQ7l8IZeNgYk+7Y73rXZnzPIGzoShO2qU1AgWloaalOkqc0p2te1DVvGa3SO+g/CZx5VkM4ZBoId7j/DPgOxW/ZOQLWcHzY67wl1SjAC3I6dWHIDE7hKXUYczQZmLxcEE6ETf8oP2H21YAY6aasyR5kA8ar0rGdY8il+qaaLaUW3EG7d6ANftn0AorhwjPWyV/2+o7Wc8XZjhKb1HGbk7fKCN3gLlOqMGSwMgJ3JrgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yR3UY8cDmJ26XkAEdOjINza72pu3ZZMpL5DqIezQnho=;
 b=WdSPPjmbumDwc//h0MG7fno/MXoTkgjWHOKUEOF4cxSyGwUDLlyLLQ3wnP7h/1rfmpH1vgWzzIBqhmMd7a+uH4QFGv6fUqrufoB4YeHWS6QJj7xwTAFjKhQFLfoyH9bhb9VuvTxD12fVz2LARsBkW1SyeXu2EMmh2I/lowlgW0wx3ALypCWQ4R1i0Arji1w2iiOzfIIwpbD+tX42FMTX5FnOiQMV1vDmtXhU1Bg5kAF6k9RWIQ7CP2FH2OWLoBiqjBD/Tv4MNWomJe9n2Og9YZiqH/bhwN/CgoNYAvFSW6lofC5sKdaHNp8p6jG1C4GufyWr+7U+NY2zWkODfgHj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR3UY8cDmJ26XkAEdOjINza72pu3ZZMpL5DqIezQnho=;
 b=EqYjuOPuFpXnRKE1eKNRiURrf/z3PQ+iJHsWJiz/U3yf+JnIfUYZdetVvL8BAp4A4hol7YJSOvKoqF5kvgEp9NVPPKTCIPkec1/e7bpQTiwUZeH2AheupLZ4LvOK7i7Uk/uidU44oTyjGoSKNdvzEcqdOWjwQoXol6rnJ3/363o=
Received: from TYCPR01MB9305.jpnprd01.prod.outlook.com (2603:1096:400:196::10)
 by TYYPR01MB6763.jpnprd01.prod.outlook.com (2603:1096:400:ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Mon, 21 Mar
 2022 03:05:31 +0000
Received: from TYCPR01MB9305.jpnprd01.prod.outlook.com
 ([fe80::d598:aa14:b8f2:1546]) by TYCPR01MB9305.jpnprd01.prod.outlook.com
 ([fe80::d598:aa14:b8f2:1546%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 03:05:31 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: Re: [PATCH 2/4] net/colo: Fix a "double free" crash to clear the
 conn_list
Thread-Topic: [PATCH 2/4] net/colo: Fix a "double free" crash to clear the
 conn_list
Thread-Index: AQHYM5Lbm+cxr7w85ECq2tH+LXAn5KzJOd4A
Date: Mon, 21 Mar 2022 03:05:30 +0000
Message-ID: <7c2e8f9f-6718-90bb-da83-4360e9de91b6@fujitsu.com>
References: <20220309083858.58117-1-chen.zhang@intel.com>
 <20220309083858.58117-3-chen.zhang@intel.com>
In-Reply-To: <20220309083858.58117-3-chen.zhang@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c8c5cec-7f37-40a9-2297-08da0ae7a8c0
x-ms-traffictypediagnostic: TYYPR01MB6763:EE_
x-microsoft-antispam-prvs: <TYYPR01MB67632E2AD13FA9DC72061FB2A5169@TYYPR01MB6763.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AtgPUF0wt9g0PeFMVaCRESNeic/sTqc/qkGZiq7A71i5vQPztIXnY2j4E6fTOKXrGQy/k1MMqYgzN/dGKQX0mQol74NEM0ve9z6Ye9NTnukgE/5j2P6RS3G8zM75wD3CsSEtCABGYxO/n/cWBDwKYQ590cnWWDexFdk2rJgrY47aUQIlMMxj9Y4jddqrPN0/cEcrfZM4FbPa9MiqTKJIZhmIoDs1HvID9ftMI0+R6iMkcYRrJc7MtB88MpdJFAOY1G9PaSPZrlTDckZR+XPQgdBtTa21IFSk8grDvrqkoh+onM7vVTNB12KyVggKBCYyBeZ351ZvzWUm5SnSwe4zHEG0ZUSkDUtZyZw3IulJJoMReETcQL72mZlWoINWvTcgQqUphbeNm0jQc0PLqElDNpR/9wCvpr7FazsFLaTf6p6l1H7PiwrEMwj9zNf8/F9cnHcV/NQzZ4Fye9XCQqn6EGh/ZmA8HzDxPr350xRbHKy9q1e2wiU3FL5dHiRcZsFukVR7zmKmRGMKuxznywF2YG1xIkJIQ6pyNTHwKQvEhtdLW/bDjZteDRJk00czC0ytH5LlBbh6/ocQlVCy1ItnH18urSzAhDEmHyQNe+e1AAuYVp+lAQNgVnOOaYwsiDOVLtaa7KtWywIArHghubBcupJzhU3/Udn5hTEuszxOzvpVKtfRq0S/AgllUr/yxhTusjuhcifio1RIN83Q2vL8MtY3EHrvIdNEX2y6sw8zO/Z5gOb7C+9iVtTh1Cm3hYdaaaWNoIuCHvNNq5kOCVrAJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB9305.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(86362001)(31696002)(6486002)(85182001)(36756003)(8936002)(316002)(508600001)(83380400001)(38070700005)(110136005)(54906003)(38100700002)(2616005)(64756008)(186003)(66446008)(91956017)(53546011)(66946007)(66556008)(6506007)(76116006)(6512007)(66476007)(31686004)(8676002)(4326008)(82960400001)(122000001)(2906002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3RSU3JlOHNYSnpJQnZKa1BabkkySVpMemZwSUkzL2t3clRRbThJYTBxTFdo?=
 =?utf-8?B?VnJ6OHJldjFIYnk2SDRMbFFtOS9pbDdaWks5dm1FdHdJVjNCMkMxQStzUUJv?=
 =?utf-8?B?M09UYWdCQngzc0ZMbHFjODBYQ2dCSkMzYUtIUURnMlBzTW1mbEVxdEprbmxr?=
 =?utf-8?B?cTRIQVBYUXJiR2pYVERXNjRLUnpETmM3ODFhWmxiU0lYNFZORS9SWmhlcVlR?=
 =?utf-8?B?aGhabnppSWNJamNHTlkvZ1QzWlhPeEFmQ25RRER1YkRMRDdHbXU0MzE1a0VD?=
 =?utf-8?B?L3BUUVZZWHRzMlliL0QwMlBFdVBhZFpKTWRRNXdjYnFsSlVWS2ptZTMxTy9x?=
 =?utf-8?B?VEVsc1I0Ung1TnQwNWU5eXZ2ZENmTjhGc1ZNc2x4dlJ3TU9pRUUzWHFlVGN4?=
 =?utf-8?B?R2FuL29XZ1dhc280YXNFVVJRUGVXWmEzTUkxc04rbVlMVkY5SS82U3JEdWxR?=
 =?utf-8?B?WG41ZkNzUzZwUkQ4YlBkS3FZMXVkT3AyZmk2VXozV1ZXSEZxb21FbEpCS1hr?=
 =?utf-8?B?aitLZmpVT1lxb3JBU2gyN2RYN3pIaGhGUExnT0tzSnVJNXFvL1VmMk5yNzJN?=
 =?utf-8?B?QkhXUWFMK016TGlsakYvZEdmZ1VicjZOaENtRGd3QXQ0MGM0VmxtS3NpcEE4?=
 =?utf-8?B?ZnBjRGFUSUpYUmFuRFJPdVZlMDNOK1craDNrdnZXSUJ0clEwam01NjYzVzZB?=
 =?utf-8?B?MDg2SkZvSmR3Y2ZmbTFvaGlTaEorVjZqNEJmNFZ1T0xzZXhKMmZWRStkSERN?=
 =?utf-8?B?RjY2Y3VOUWFsRE12Q0J6NE51N3JKbWtuZTNHUTlEd0gyKzJZNkh0WHZ6ZTBN?=
 =?utf-8?B?RFpQYnZybFE1VExGVHFrWXJhQzcwa3c2T0JoVGl1bTlIVjVlak1WRTNuMG84?=
 =?utf-8?B?TTFXRFZwV1YvOHpMbmZ4R0ZIM2pFY1ZFRlFrNnFYZWdMV21xM0pHdzltSnBl?=
 =?utf-8?B?d3JRUWlGV3RBcnVadGhTTkhRMVI2dVBqWHVGUzNUUW5qK2JHRVJaVXBIQStX?=
 =?utf-8?B?Uzlzem8rRlI1anNWOTJmK25LWksrU1g1TE1hVy9TWDZwVDNIaEdrK2JDMisr?=
 =?utf-8?B?SlRsUWRpaTN3Z2VsVDVDbFNVMW1QTkZNaEoxUGFaZkh0SXFYRHluUUhaT2xt?=
 =?utf-8?B?Y3JRYmxmUjhscUg2bEhQbHRub0MzdktNZHBIRGRka1p1OHdySnk4cGRFQzFZ?=
 =?utf-8?B?L24yRWt0NXhORGl2ZE5adWp1bEZEcGJ0T2phNmE3Y3lTSysxNVE5ZXJ5WWdG?=
 =?utf-8?B?bUoreVovWGNnSUt0SXNCd3psZ1ZiajVLRDVzVE5oM1ZkUlVwR3VMRVVMN29L?=
 =?utf-8?B?YlUxdGRVb1dnTnNRaU5FWStQZHN2eFIrM2g1eWFCOGVabEQzWkdXNkpsZnRT?=
 =?utf-8?B?d0kwV1QvT3RYbmVWWXpBdFp0RHN1M1VpeGh5bzhUejFpdmdJd0JzNlUxUUFZ?=
 =?utf-8?B?aXQrU3NFSXlhY0pTTjBLRkV3dVl4eE9HSEVYVWNLREpaU1FpVFJ4S05kMDRw?=
 =?utf-8?B?ajlFV2ZzZFUzVW1GSEV2TFY5WUxSMWV4dlBPY051TFE5MnhHLzI5SlNBZERU?=
 =?utf-8?B?dk0vQUJmWitTYUhCRGVWeHMrNm9RY2JMQWhOVHdNczBqejNmTHJ2MkQ3UUlP?=
 =?utf-8?B?UUZlS3c0Z0ZLdVloT29WODVLaWdNSWh1Q0FsS0Z0MmpyaUU1bmYrZjd1RG0y?=
 =?utf-8?B?UnJ1WTFBQXNxblJTL1hOeHFtTHpjaGpVYmRWNHRhTWVSTFJRREtrTG9zM3Uz?=
 =?utf-8?B?d1JxUldSY1BDb2pZZXc1bXZuR1RtMjFMbWlSRXV4d1hXaEI4QUliNU1tYkhB?=
 =?utf-8?B?SHlkOXJBL3kwTTR2bzJqVkdFWDBlVnRxbjJqdGQvSW5qTjUvaloxWGFHNzNp?=
 =?utf-8?B?ZktRNm5kaHlrRjVmR1EwWmhqTWpHaWswbUFvMkZ0U0VHd3VqMDFuS0pXMmN6?=
 =?utf-8?B?NVdOeW5sS040MDNUQVBDZXNGMnhUYlBCaXFHSHZXdUtld0M4RC9YRVZsOVA4?=
 =?utf-8?B?Vmk5aDM2OGhRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46EEFEB718E14E4AA8FC0B48B12A5D7C@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB9305.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c8c5cec-7f37-40a9-2297-08da0ae7a8c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 03:05:30.8109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +USvl6fL0fKdYaW8TYUhpwkXOxWKkHGuPDn+5whrqnFIjgl1Y3Th70MJejYhq2WutU+uwYspLcourLPyqjd4rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6763
Received-SPF: pass client-ip=68.232.151.212;
 envelope-from=lizhijian@fujitsu.com; helo=esa3.fujitsucc.c3s2.iphmx.com
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDA5LzAzLzIwMjIgMTY6MzgsIFpoYW5nIENoZW4gd3JvdGU6DQo+IFdlIG5vdGljZSB0
aGUgUUVNVSBtYXkgY3Jhc2ggd2hlbiB0aGUgZ3Vlc3QgaGFzIHRvbyBtYW55DQo+IGluY29taW5n
IG5ldHdvcmsgY29ubmVjdGlvbnMgd2l0aCB0aGUgZm9sbG93aW5nIGxvZzoNCj4NCj4gMTUxOTdA
MTU5MzU3ODYyMi42Njg1NzM6Y29sb19wcm94eV9tYWluIDogY29sbyBwcm94eSBjb25uZWN0aW9u
IGhhc2h0YWJsZSBmdWxsLCBjbGVhciBpdA0KPiBmcmVlKCk6IGludmFsaWQgcG9pbnRlcg0KPiBb
MV0gICAgMTUxOTUgYWJvcnQgKGNvcmUgZHVtcGVkKSAgcWVtdS1zeXN0ZW0teDg2XzY0IC4uLi4N
Cj4NCj4gVGhpcyBpcyBiZWNhdXNlIHdlIGNyZWF0ZSB0aGUgcy0+Y29ubmVjdGlvbl90cmFja190
YWJsZSB3aXRoDQo+IGdfaGFzaF90YWJsZV9uZXdfZnVsbCgpIHdoaWNoIGlzIGRlZmluZWQgYXM6
DQo+DQo+IEdIYXNoVGFibGUgKiBnX2hhc2hfdGFibGVfbmV3X2Z1bGwgKEdIYXNoRnVuYyBoYXNo
X2Z1bmMsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdFcXVhbEZ1bmMga2V5X2VxdWFsX2Z1
bmMsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdEZXN0cm95Tm90aWZ5IGtleV9kZXN0cm95
X2Z1bmMsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdEZXN0cm95Tm90aWZ5IHZhbHVlX2Rl
c3Ryb3lfZnVuYyk7DQo+DQo+IFRoZSBmb3VydGggcGFyYW1ldGVyIGNvbm5lY3Rpb25fZGVzdHJv
eSgpIHdpbGwgYmUgY2FsbGVkIHRvIGZyZWUgdGhlDQo+IG1lbW9yeSBhbGxvY2F0ZWQgZm9yIGFs
bCAnQ29ubmVjdGlvbicgdmFsdWVzIGluIHRoZSBoYXNodGFibGUgd2hlbg0KPiB3ZSBjYWxsIGdf
aGFzaF90YWJsZV9yZW1vdmVfYWxsKCkgaW4gdGhlIGNvbm5lY3Rpb25faGFzaHRhYmxlX3Jlc2V0
KCkuDQo+DQo+IEl0J3MgdW5uZWNlc3NhcnkgYmVjYXVzZSB3ZSBjbGVhciB0aGUgY29ubl9saXN0
IGV4cGxpY2l0bHkgbGF0ZXIsDQo+IGFuZCBpdCdzIGJ1Z2d5IHdoZW4gb3RoZXIgYWdlbnRzIHRy
eSB0byBjYWxsIGNvbm5lY3Rpb25fZ2V0KCkNCj4gd2l0aCB0aGUgc2FtZSBjb25uZWN0aW9uX3Ry
YWNrX3RhYmxlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaWtlIFh1IDxsaWtlLnh1QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5j
b20+DQo+IC0tLQ0KPiAgIG5ldC9jb2xvLWNvbXBhcmUuYyAgICB8IDIgKy0NCj4gICBuZXQvZmls
dGVyLXJld3JpdGVyLmMgfCAyICstDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9uZXQvY29sby1jb21wYXJlLmMg
Yi9uZXQvY29sby1jb21wYXJlLmMNCj4gaW5kZXggNjI1NTRiNWIzYy4uYWIwNTRjZmQyMSAxMDA2
NDQNCj4gLS0tIGEvbmV0L2NvbG8tY29tcGFyZS5jDQo+ICsrKyBiL25ldC9jb2xvLWNvbXBhcmUu
Yw0KPiBAQCAtMTMyNCw3ICsxMzI0LDcgQEAgc3RhdGljIHZvaWQgY29sb19jb21wYXJlX2NvbXBs
ZXRlKFVzZXJDcmVhdGFibGUgKnVjLCBFcnJvciAqKmVycnApDQo+ICAgICAgIHMtPmNvbm5lY3Rp
b25fdHJhY2tfdGFibGUgPSBnX2hhc2hfdGFibGVfbmV3X2Z1bGwoY29ubmVjdGlvbl9rZXlfaGFz
aCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25uZWN0aW9uX2tleV9lcXVhbCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnX2ZyZWUsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0aW9uX2Rlc3Ryb3kp
Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTlVMTCk7DQoNCg0KMjAyIC8qIGlmIG5vdCBmb3VuZCwgY3JlYXRlIGEgbmV3IGNvbm5lY3Rp
b24gYW5kIGFkZCB0byBoYXNoIHRhYmxlICovDQoyMDMgQ29ubmVjdGlvbiAqY29ubmVjdGlvbl9n
ZXQoR0hhc2hUYWJsZSAqY29ubmVjdGlvbl90cmFja190YWJsZSwNCjIwNMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBDb25uZWN0aW9uS2V5ICpr
ZXksDQoyMDXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgR1F1ZXVlICpjb25uX2xpc3QpDQoyMDYgew0KMjA3wqDCoMKgwqAgQ29ubmVjdGlvbiAq
Y29ubiA9IGdfaGFzaF90YWJsZV9sb29rdXAoY29ubmVjdGlvbl90cmFja190YWJsZSwga2V5KTsN
CjIwOA0KMjA5wqDCoMKgwqAgaWYgKGNvbm4gPT0gTlVMTCkgew0KMjEwwqDCoMKgwqDCoMKgwqDC
oCBDb25uZWN0aW9uS2V5ICpuZXdfa2V5ID0gZ19tZW1kdXAoa2V5LCBzaXplb2YoKmtleSkpOw0K
MjExDQoyMTLCoMKgwqDCoMKgwqDCoMKgIGNvbm4gPSBjb25uZWN0aW9uX25ldyhrZXkpOw0KMjEz
DQoyMTTCoMKgwqDCoMKgwqDCoMKgIGlmIChnX2hhc2hfdGFibGVfc2l6ZShjb25uZWN0aW9uX3Ry
YWNrX3RhYmxlKSA+IEhBU0hUQUJMRV9NQVhfU0laRSkgew0KMjE1wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHRyYWNlX2NvbG9fcHJveHlfbWFpbigiY29sbyBwcm94eSBjb25uZWN0aW9uIGhhc2h0
YWJsZSBmdWxsLCINCjIxNsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIgY2xlYXIgaXQiKTsNCjIxNyBjb25uZWN0aW9u
X2hhc2h0YWJsZV9yZXNldChjb25uZWN0aW9uX3RyYWNrX3RhYmxlKTsNCg0KMTk3IHZvaWQgY29u
bmVjdGlvbl9oYXNodGFibGVfcmVzZXQoR0hhc2hUYWJsZSAqY29ubmVjdGlvbl90cmFja190YWJs
ZSkNCjE5OCB7DQoxOTkgZ19oYXNoX3RhYmxlX3JlbW92ZV9hbGwoY29ubmVjdGlvbl90cmFja190
YWJsZSk7DQoyMDAgfQ0KDQpJSVVDLMKgIGFib3ZlIHN1YnJvdXRpbmUgd2lsbCBkbyBzb21lIGNs
ZWFudXAgZXhwbGljaXRseS4gQW5kIGJlZm9yZSB5b3VyIHBhdGNoLCBjb25uZWN0aW9uX2hhc2h0
YWJsZV9yZXNldCgpDQp3aWxsIHJlbGVhc2UgYWxsIGtleXMgYW5kIHRoZWlyIHZhbHVlcyBpbiB0
aGlzIGhhc2h0YWJsZS4gQnV0IG5vdywgeW91IHJlbW92ZSBhbGwga2V5cyBhbmQganVzdA0Kb25l
IHZhbHVlKGNvbm5fbGlzdCkgaW5zdGVhZC4gRG9lcyBpdCBtZWFucyBvdGhlciB2YWx1ZXMgd2ls
bCBiZSBsZWFrZWQgPw0KDQoNCjIxOCAvKg0KMjE5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBjbGVhciB0aGUgY29ubl9saXN0DQoyMjAgKi8NCjIyMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB3aGlsZSAoIWdfcXVldWVfaXNfZW1wdHkoY29ubl9saXN0KSkgew0KMjIyIGNvbm5lY3Rpb25f
ZGVzdHJveShnX3F1ZXVlX3BvcF9oZWFkKGNvbm5fbGlzdCkpOw0KMjIzIH0NCjIyNCB9DQoyMjUN
CjIyNsKgwqDCoMKgwqDCoMKgwqAgZ19oYXNoX3RhYmxlX2luc2VydChjb25uZWN0aW9uX3RyYWNr
X3RhYmxlLCBuZXdfa2V5LCBjb25uKTsNCjIyNyB9DQoyMjgNCjIyOcKgwqDCoMKgIHJldHVybiBj
b25uOw0KMjMwIH0NCg0KDQpUaGFua3MNClpoaWppYW4NCg0KPiAgIA0KPiAgICAgICBjb2xvX2Nv
bXBhcmVfaW90aHJlYWQocyk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9uZXQvZmlsdGVyLXJld3Jp
dGVyLmMgYi9uZXQvZmlsdGVyLXJld3JpdGVyLmMNCj4gaW5kZXggYmYwNTAyM2RjMy4uYzE4YzRj
MjAxOSAxMDA2NDQNCj4gLS0tIGEvbmV0L2ZpbHRlci1yZXdyaXRlci5jDQo+ICsrKyBiL25ldC9m
aWx0ZXItcmV3cml0ZXIuYw0KPiBAQCAtMzgzLDcgKzM4Myw3IEBAIHN0YXRpYyB2b2lkIGNvbG9f
cmV3cml0ZXJfc2V0dXAoTmV0RmlsdGVyU3RhdGUgKm5mLCBFcnJvciAqKmVycnApDQo+ICAgICAg
IHMtPmNvbm5lY3Rpb25fdHJhY2tfdGFibGUgPSBnX2hhc2hfdGFibGVfbmV3X2Z1bGwoY29ubmVj
dGlvbl9rZXlfaGFzaCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25uZWN0aW9uX2tleV9lcXVhbCwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnX2ZyZWUsDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0
aW9uX2Rlc3Ryb3kpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCk7DQo+ICAgICAgIHMtPmluY29taW5nX3F1ZXVlID0gcWVtdV9u
ZXdfbmV0X3F1ZXVlKHFlbXVfbmV0ZmlsdGVyX3Bhc3NfdG9fbmV4dCwgbmYpOw0KPiAgIH0NCj4g
ICANCg==

