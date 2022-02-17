Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B384B9BC6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:12:14 +0100 (CET)
Received: from localhost ([::1]:34248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcph-0002Q1-VS
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:12:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nKcTl-0004I5-Lm
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:49:33 -0500
Received: from mail-bn7nam10on2084.outbound.protection.outlook.com
 ([40.107.92.84]:55248 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nKcTg-0004lF-QZ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:49:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJPqYTqrmAcxtiBOVRIMWJqLGWh6141onC7QURTxtffgm/PqmmnGe6ZVp53/XaYF9tt/6jdDfp9hQFoisfCcyCJCj/rj1yfveXT5et9Z0hasK6AArF4p9ReKl36dMZAhJEO9hM4jiW65kiPgYCfR/AkJ44lzWolYPaEEKR+BnUuSlqOc3bYf5xiW8OiJ4e++fUhlSzdJtm4rbW3KhrJahdf6/kmHeTmc6QwQqXWIuLlw94OTu2ABbX0i16sfMtWqy1iL/UOa1AScMqORlX6fyVBsDaLXfrdI0LHE0kxgbuPnut4Mbc3ird8Zk59XQ5AZVoSW6lerGpZqBJpRfLIsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xtvs2Ary64v0NUYRf2bQkqYuEQobuCZWIpvpPkl4E8E=;
 b=kyEaR0QMzTKP7WJ0laHlNQhy0jsuJ+RTB+cuvXoABwO4okLSoiQopvPonuaBqEXCSFnw4nVAK9ljiytcMZH5EpQXorVsj6yNJN8/VF4JjGRXZYK7bLa8zoCxNYyRBy0zcIZRqsischN9Y5s9k4Zpfo18se0x1EkOAABWRI9NG2QKe9EtFCPJGIgj2TaMu1MXVLBshwy0S2WXyG63olv7F2UKBF14DpPTXkHplM0RNWQCDNS/GfdpkRaYaOgXxjT0GwuzjoXpKBi4Q/YOTxd/DU6/v1OT7WLf4QUOw4TNS13LuzVL0XhUHbe0DcJcwFAES+T5Lkh4LAAPuTyxFP9kOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xtvs2Ary64v0NUYRf2bQkqYuEQobuCZWIpvpPkl4E8E=;
 b=nRtIZPp/q0PttMkhwuUP42WhyJPUiHMsjk/VK8wJTYzA/0i3NcVuAwaNyL0OBXivMXxh9TnmUOazmHbiM6/jND+qa6m8EeVPQ3SzsNVn7hR+Zp5KlSokl9wg/UY46HUYx/1cf5Pmulkt6bkKXaGThwTSmd7JCpLHbJSn03o770A=
Received: from BY5PR02MB6980.namprd02.prod.outlook.com (2603:10b6:a03:235::19)
 by BN0PR02MB8112.namprd02.prod.outlook.com (2603:10b6:408:164::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 08:27:15 +0000
Received: from BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::ed57:1b66:1f0e:54bc]) by BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::ed57:1b66:1f0e:54bc%6]) with mapi id 15.20.4995.015; Thu, 17 Feb 2022
 08:27:14 +0000
From: Gautam Dawar <gdawar@xilinx.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Thread-Topic: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Thread-Index: AQHYIjze5QKnQIvus0a+SfJURbUaY6yXWBUAgAAR3dA=
Date: Thu, 17 Feb 2022 08:27:14 +0000
Message-ID: <BY5PR02MB698031726B87245DAD482982B1369@BY5PR02MB6980.namprd02.prod.outlook.com>
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <CACGkMEt8UN8vd4KNKM7=Kcx28J2ANvLYN62NNzg9d5pHKhK4sQ@mail.gmail.com>
In-Reply-To: <CACGkMEt8UN8vd4KNKM7=Kcx28J2ANvLYN62NNzg9d5pHKhK4sQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 412db50e-4ed9-43f4-b69f-08d9f1ef4d73
x-ms-traffictypediagnostic: BN0PR02MB8112:EE_
x-microsoft-antispam-prvs: <BN0PR02MB8112D9D88C6F38F3EE6B06DAB1369@BN0PR02MB8112.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fd62LTy+t4lo69mkzYy7Id+jeo7WMLAqjdsY+BqaoXuLnNpot+YT33e7oUlQxqIUOoE8XlSdmi+TL+2oR4mtTqcFfuSudwyMa1zNfDCapZB0BIE3Mx8zJ9lGpMAxIY5V726BHhNS3WQyjbeHCk3M31olusIDcGMe3Uz9TPnGosP56lggd8Pt1Z8kq96BV5haJwnukkZPcgiFm6fIh9zuIk9W7xHtOCeHP9Pd77uwnyF8n0Bz9KDGp7ldhoIapwf0SGrjmeMefDkEM+QxbXDGOuQtl7txCbvNMDZG8BOVCjFXnTmO/bZNYbZgsz4lvv7aha2piKHftDKV4uUKfuQ6HmUlw0zhbKx67h5nUAI45uHoZqNjabh5U91KQ2gMqVytzTZdRgO0OK3anNSlAYfPi+Ph9JOqHWcbOpHsufos/zx+IJQu4xKJb1CZCznD7Ay6Pk4ilUgiWVubRt+CQejmMAUVjZtVJ8poCurIDub74DZ9w9i+rIZXRneAGUwS4kcZ8yUqU3bE4CHSPH+GMIMJGKGetEvcywWQQyz5IlO9TQ/5dPu94xNL4gHjHAVV51lXWYII1IRBTk2sDGhvclZSJJWtygO+9noKA39Udb4YJMJmE4FsibaHyQ1SSRodzWKH9pOcRS1iVyzgqG1RNACViU4jhnseRleAtLMBPvUuwZ8bLkbevAbgtX1uDdir9oOFR8XQv55DBmusZ6iXDqyXVvsj2UxRj+2kBr1PEL2/gfKSSBEf76xzmxY+gbn04roYVv1CJXBYB5JUBta+Kd0nHNCFLZowsl+ywPPKENSEvvU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6980.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(186003)(26005)(5660300002)(8936002)(52536014)(2906002)(55016003)(107886003)(33656002)(83380400001)(4326008)(9686003)(64756008)(66446008)(8676002)(38070700005)(53546011)(66476007)(316002)(86362001)(6916009)(54906003)(6506007)(66556008)(76116006)(7696005)(66946007)(122000001)(508600001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWZ2cWd1K3RyNlV1emh6TXMvNEdsSUdIV01SWWMwdy9aSU02Y0FadWN0VndU?=
 =?utf-8?B?TUxPazhFbVZUUmNDQ081cW1IMnFabDIyRzZ2MlFQbjdWdFg4bGI1NVFVTGNp?=
 =?utf-8?B?NlcvdFFGRUxHalZTNEJURm9QcmVmUXFRNUlDYjkzNzdhalFpTFdVT2EyaFlr?=
 =?utf-8?B?SmVTUWJ5WG1kdkVoY1BLZ3g3WVdPc1puSlhTZkNYLzRyTlVLZlBidEJYS0kz?=
 =?utf-8?B?aHJFVTBHcXhWNU1HNFdzNFEyU0daenlOdi9PUkxMTXl4STdnVTByMmc2eHpr?=
 =?utf-8?B?eUJvY2RsbUwyMkpxQWQ1NnAwRUtPcC93OVVjQytXWVJmWjJMYkZtcmZ0K3J6?=
 =?utf-8?B?b09xNm1HZ2NlTmVqSlpDNktyRmVGTVB1WWZVdGNtRE5WRlV4S2J6SDJXMjdL?=
 =?utf-8?B?dU00VzNxRkl2VjFaSGRJUjArWVVKcmM4UG1SY3RxbzFwdFIyWE5WYU5BNmVP?=
 =?utf-8?B?bGtxamVwVExuUW5oZjNJcExKcHl6WStvM0ZnSUZQYmQ0ZVJ5enJleWp6dVVh?=
 =?utf-8?B?Zll1OHhNTjliakZVZDJJK1BtQjdyM3k0OXFmY3VkRi9UL09LTG1xTEY1ZzJJ?=
 =?utf-8?B?R0VOODBBVmQ5N2tmd2NrTnUzc3FKZlIwMmJHSjlsNlVQb3ZDRkdra201allp?=
 =?utf-8?B?VGoreG9LNWVzT0ZMQ0gzUlRQekhXWldtcXlYZjFwVUhDRkdtMEhXcnNGU00w?=
 =?utf-8?B?bk01dm82MjZ3UUNiU245TVpSaGJ5dXArK01Wc1JoZG05MFppVWtmOThaUE9i?=
 =?utf-8?B?dWp0QnFKYWg3UDJjcnl4YXdZVEFyL0N1dXV6di9TS1NGWTBnRzd1SEQ2aE1p?=
 =?utf-8?B?RktwQnlzQ095OW92YU9WVW9oWFhQTkRoZzI3Qy9zeVg5SXFXTWxtaktGYmlC?=
 =?utf-8?B?MVFxNGdtM0EvaU9tQ1lCWlV0SndZLzc1dzJ6MFNWUHVLdzFzRVNYcFFNNXVl?=
 =?utf-8?B?N3k5T21Cbm55TEVHSllKWTdBS3VRbExhTHVFZkxIS0RkTmZCOUFRRWw5M1dX?=
 =?utf-8?B?MG1LazIzYTY5YWhUN09XQVVvV1B1ajBLNndocW5RNmVLdmJRVk9BdjcreEhr?=
 =?utf-8?B?ZFFKV1A4eE1RR0JwQlcvM1NqY1VHVWI0UzdRT2hpcUwxM1hSMmlJdFcwU3NT?=
 =?utf-8?B?VDV4TXNUVUhrWXRtbkV1S24rS2NyKzF6c1FwcllCZGtKTlhxb2p4ZHE3ZnBS?=
 =?utf-8?B?TkNUekNSeVJSdzRhcE5sRnlDbFBFdVhvU3VWZDZ1QjNQOWlPRXFYbnhPZkdw?=
 =?utf-8?B?aHlHQmxlVnZtMU52eWV3U1dMWEFENjlpQWljbmZEaFlWL1dMN0FwNHkyQXpl?=
 =?utf-8?B?NWdzWTZJTndHTEl4WENsa2EwOEJ4bmxpT09RQXl5dTVvNEVGWnpQcEJITlNt?=
 =?utf-8?B?Lzk1Uk82ekljQ1MxcysreWgxWnFZeldMRGtnVG1GVG9HdGpLRTRHdFhUVVUy?=
 =?utf-8?B?UEVibVdnaXBnOFdGUGNncUM1NFhFdml1V1MwYm92cklYb3dTejdrbEREM3BE?=
 =?utf-8?B?eHU0djdOY3FoMVJmNTI5dTBUUDMzRTBiYlNCQWFSVnVKU21yMVNWUGZMcDZB?=
 =?utf-8?B?MHpjQ0pyVlEvVTZ2L1Y0STl0allxd0JNeW9USklCM3NudSs4ZVFVbVVLa0Fm?=
 =?utf-8?B?YTFuL0xPUEMybWV3RGp5eHoxcVZFQ3FiNWg4YnlKSm1yYlBQdW9yZ0UzdlpM?=
 =?utf-8?B?RUJITU1zZkV2YkphRmtFYlJKbm9VRERoNTZ4UFpZelMreWJRbGJKeVBRTWts?=
 =?utf-8?B?MzZxSHRUcDgwQ3RKcUN5SnlIUkF0d3FRVTlwWnRDVXE5Z3BWV0hXckZsTDlH?=
 =?utf-8?B?L3lvUWUxYTZVVVdBNUNtSC9oOHlod29HUWdwQzYyb2hxVWcvaXVxbldpRlRo?=
 =?utf-8?B?OWdmeXUrMmJhUHhUVTFtUFdBT25vV0loRXNVdjl5YTl6ZHVZYUJFVDRFVWsy?=
 =?utf-8?B?WmNRYVRoWktTY2N4RUYyZmYwVXJxam9KdTZTVnMwZElybFBncUY1TUFONWNZ?=
 =?utf-8?B?S2JwbHdXdVhNemp3MFUwenVyaVEwY09QUXg1SzNzZXEwbjZOZnlCelFIem1E?=
 =?utf-8?B?MFVGK2k0TWtlRkVzdUhhSm9LTGRaUEM2ZzV0bUlpUmllbWdiN2hBV3VPeTdo?=
 =?utf-8?B?R0Nha1BJVU82WTJ0d2p2L1FuZytiQXVFYlFVZHY0bWpSbXE5Z1RKUzNHc3FO?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6980.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412db50e-4ed9-43f4-b69f-08d9f1ef4d73
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 08:27:14.7122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPKDZZMLV9B+AxmakEgaTyx+4gnYtLFFMWZH63YdbxjFzGwxif0XDnlQ7ZLDiDFrNwWO9fc+nuP0nUqP05W06Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8112
X-OriginatorOrg: xilinx.com
Received-SPF: pass client-ip=40.107.92.84; envelope-from=gdawar@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 eperezma <eperezma@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Tanuj Murlidhar Kamde <tanujk@xilinx.com>, Pablo Cascon <pabloc@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+IA0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDE3LCAyMDIyIDEyOjQ2IFBNDQpU
bzogR2F1dGFtIERhd2FyIDxnZGF3YXJAeGlsaW54LmNvbT4NCkNjOiBtc3QgPG1zdEByZWRoYXQu
Y29tPjsgcWVtdS1kZXZlbCA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgZXBlcmV6bWEgPGVwZXJl
em1hQHJlZGhhdC5jb20+OyBNYXJ0aW4gUGV0cnVzIEh1YmVydHVzIEhhYmV0cyA8bWFydGluaEB4
aWxpbnguY29tPjsgSGFycHJlZXQgU2luZ2ggQW5hbmQgPGhhbmFuZEB4aWxpbnguY29tPjsgR2F1
dGFtIERhd2FyIDxnZGF3YXJAeGlsaW54LmNvbT47IFRhbnVqIE11cmxpZGhhciBLYW1kZSA8dGFu
dWprQHhpbGlueC5jb20+OyBQYWJsbyBDYXNjb24gPHBhYmxvY0B4aWxpbnguY29tPg0KU3ViamVj
dDogUmU6IFtQQVRDSCAyLzJdIEFsbG93IFZJUlRJT19GX0lOX09SREVSIHRvIGJlIG5lZ290aWF0
ZWQgZm9yIHZkcGEgZGV2aWNlcw0KDQpPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAzOjIzIFBNIEdh
dXRhbSBEYXdhciA8Z2F1dGFtLmRhd2FyQHhpbGlueC5jb20+IHdyb3RlOg0KPg0KPiBUaGlzIHBh
dGNoIGFkZHMgdGhlIGFiaWxpdHkgdG8gbmVnb3RpYXRlIFZJUlRJT19GX0lOX09SREVSIGJpdCBm
b3IgDQo+IHZob3N0LXZkcGEgYmFja2VuZCB3aGVuIHRoZSB1bmRlcmx5aW5nIGRldmljZSBzdXBw
b3J0cyB0aGlzIGZlYXR1cmUuDQo+IFRoaXMgd291bGQgYWlkIGluIHJlYXBpbmcgcGVyZm9ybWFu
Y2UgYmVuZWZpdHMgd2l0aCBIVyBkZXZpY2VzIHRoYXQgDQo+IGltcGxlbWVudCB0aGlzIGZlYXR1
cmUuIEF0IHRoZSBzYW1lIHRpbWUsIGl0IHNob3VsZG4ndCBoYXZlIGFueSANCj4gbmVnYXRpdmUg
aW1wYWN0IGFzIHZob3N0LXZkcGEgYmFja2VuZCBkb2Vzbid0IGludm9sdmUgYW55IHVzZXJzcGFj
ZSANCj4gdmlydHF1ZXVlIG9wZXJhdGlvbnMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEdhdXRhbSBE
YXdhciA8Z2Rhd2FyQHhpbGlueC5jb20+DQo+IC0tLQ0KPiAgaHcvbmV0L3ZpcnRpby1uZXQuYyB8
IDEwICsrKysrKysrKysNCj4gIG5ldC92aG9zdC12ZHBhLmMgICAgfCAgMSArDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2h3L25ldC92aXJ0
aW8tbmV0LmMgYi9ody9uZXQvdmlydGlvLW5ldC5jIGluZGV4IA0KPiBjZjhhYjBmOGFmLi5hMTA4
OWQwNmY2IDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvdmlydGlvLW5ldC5jDQo+ICsrKyBiL2h3L25l
dC92aXJ0aW8tbmV0LmMNCj4gQEAgLTM1MDcsMTEgKzM1MDcsMjEgQEAgc3RhdGljIHZvaWQgdmly
dGlvX25ldF9kZXZpY2VfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+
ICAgICAgbmMtPnJ4ZmlsdGVyX25vdGlmeV9lbmFibGVkID0gMTsNCj4NCj4gICAgIGlmIChuYy0+
cGVlciAmJiBuYy0+cGVlci0+aW5mby0+dHlwZSA9PSANCj4gTkVUX0NMSUVOVF9EUklWRVJfVkhP
U1RfVkRQQSkgew0KPiArICAgICAgICB1aW50NjRfdCBmZWF0dXJlcyA9IEJJVF9VTEwoVklSVElP
X0ZfSU5fT1JERVIpOw0KPiAgICAgICAgICBzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcgbmV0Y2Zn
ID0ge307DQo+ICsNCj4gICAgICAgICAgbWVtY3B5KCZuZXRjZmcubWFjLCAmbi0+bmljX2NvbmYu
bWFjYWRkciwgRVRIX0FMRU4pOw0KPiAgICAgICAgICB2aG9zdF9uZXRfc2V0X2NvbmZpZyhnZXRf
dmhvc3RfbmV0KG5jLT5wZWVyKSwNCj4gICAgICAgICAgICAgICh1aW50OF90ICopJm5ldGNmZywg
MCwgRVRIX0FMRU4sIA0KPiBWSE9TVF9TRVRfQ09ORklHX1RZUEVfTUFTVEVSKTsNCj4gKw0KPiAr
ICAgICAgIC8qDQo+ICsgICAgICAgICAqIEZvciB2aG9zdC12ZHBhLCBpZiB1bmRlcmx5aW5nIGRl
dmljZSBzdXBwb3J0cyBJTl9PUkRFUiBmZWF0dXJlLA0KPiArICAgICAgICAgKiBtYWtlIGl0IGF2
YWlsYWJsZSBmb3IgbmVnb3RpYXRpb24uDQo+ICsgICAgICAgICAqLw0KPiArICAgICAgIGZlYXR1
cmVzID0gdmhvc3RfbmV0X2dldF9mZWF0dXJlcyhnZXRfdmhvc3RfbmV0KG5jLT5wZWVyKSwgZmVh
dHVyZXMpOw0KPiArICAgICAgIG4tPmhvc3RfZmVhdHVyZXMgfD0gZmVhdHVyZXM7DQoNClRoaXMg
bG9va3MgbGlrZSBhIGhhY2ssIGNvbnNpZGVyaW5nIHdlIHdpbGwgZmluYWxseSBzdXBwb3J0IGlu
X29yZGVyLg0KW0dEPj5dIFllcyAsIEkgYWdyZWUgYSBjb21wbGV0ZSBzb2x1dGlvbiB0aGF0IHdp
bGwgc3VwcG9ydCB0aGUgZW11bGF0ZWQgdmlydGlvIGRldmljZSB3aXRoIGluX29yZGVyIHJ4L3R4
IHZpcnRxdWV1ZSBmdW5jdGlvbnMgd2lsbCBkZWZpbml0ZWx5IGJlIGJldHRlciBidXQgYXQgdGhl
IHNhbWUgdGltZSBpdCB3aWxsIHRha2UgY29uc2lkZXJhYmxlIGFtb3VudCBvZiB0aW1lIGFuZCBl
ZmZvcnQuIEkgYWxzbyBub3RpY2VkIHRoYXQgc29tZXRoaW5nIHNpbWlsYXIgKGh0dHBzOi8vcGF0
Y2hldy5vcmcvUUVNVS8xNTMzODMzNjc3LTI3NTEyLTEtZ2l0LXNlbmQtZW1haWwtaS5tYXhpbWV0
c0BzYW1zdW5nLmNvbS8pICB3YXMgcHJvcG9zZWQgeWVhcnMgYWdvIHdoaWNoIGdvdCBkcm9wcGVk
IGZvciBzaW1pbGFyIHJlYXNvbnMgYW5kIGl0IGhhcyBiZWVuIHN0YXR1cyBxdW8gc2luY2UgdGhl
bi4NClNvLCB1bmxlc3Mgd2Uga25vdyB0aGF0IHRoaXMgd29yayBpcyBhbHJlYWR5IGluIHByb2dy
ZXNzICYgd2lsbCBiZSB1cC1zdHJlYW1lZCBzb29uIGFuZCBpZiB5b3UgZG9u4oCZdCBzZWUgYW55
IHNpZGUtZWZmZWN0cyBvZiB0aGlzIHBhdGNoLCB3ZSBjYW4gZ2V0IGl0IGludGVncmF0ZWQgZmly
c3QgYW5kIHRoZW4gdGhpcyBjYW4gYmUgcmV2ZXJ0ZWQgd2hlbiB0aGUgY29tcGxldGUgc29sdXRp
b24gaXMgYXZhaWxhYmxlLiBUaGlzIHdvdWxkIGhlbHAgaW4gYmVuY2htYXJraW5nIHBlcmZvcm1h
bmNlIGJvb3N0cyBhY2hpZXZlZCB3aXRoIElOX09SREVSIGZlYXR1cmUuDQoNCkkgd29uZGVyIGlm
IGl0J3MgYmV0dGVyIHRvDQoNCjEpIGludHJvZHVjZSBjb21tYW5kIGxpbmUgcGFyYW1ldGVycyAi
aW5fb3JkZXIiDQoyKSBmYWlsIHdpdGhvdXQgdmhvc3QtdmRwYQ0KDQo/DQpbR0Q+Pl0gSSB0aGlu
ayB0aGlzIHBhdGNoIGlzIHRha2luZyBjYXJlIG9mIGJvdGggY29uZGl0aW9ucyBhYm92ZSB3aXRo
IHRoZSAgaWYgKG5jLT5wZWVyLT5pbmZvLT50eXBlID09IE5FVF9DTElFTlRfRFJJVkVSX1ZIT1NU
X1ZEUEEpIGNoZWNrLiBXaXRoIHRoaXMsIHRoZSBWSVJUSU9fRl9JTl9PUkRFUiBmZWF0dXJlIGJp
dCB3aWxsIGJlIGV4cG9zZWQgYnkgUUVNVSBvbmx5IHdoZW4gdGhlIHVuZGVybHlpbmcgZGV2aWNl
IHN1cHBvcnRzIGl0LiBIb3dldmVyLCBpdCB3aWxsIGJlIG5lZ290aWF0ZWQgYW5kIGFja2VkIG9u
bHkgd2hlbiB0aGUgdmlydGlvX25ldCBkcml2ZXIgYWxzbyBzdXBwb3J0cy4gQWNjb3JkaW5nbHks
IGluIG15IHRlc3RpbmcsIExpbnV4IGtlcm5lbCdzIHZpcnRpb19uZXQgZHJpdmVyIGRvZXNuJ3Qg
c2VuZCBpdCBiYWNrIHRvIHRoZSBzdXBwb3J0aW5nIGRldmljZSB3aGlsZSBEUERLIHZpcnRpb19u
ZXQgZHJpdmVyIGRvZXMuDQoNClRoYW5rcw0KDQo+ICAgICAgfQ0KPiArDQo+ICAgICAgUVRBSUxR
X0lOSVQoJm4tPnJzY19jaGFpbnMpOw0KPiAgICAgIG4tPnFkZXYgPSBkZXY7DQo+DQo+IGRpZmYg
LS1naXQgYS9uZXQvdmhvc3QtdmRwYS5jIGIvbmV0L3Zob3N0LXZkcGEuYyBpbmRleCANCj4gMjVk
ZDZkZDk3NS4uMjg4NmNiYTVlYyAxMDA2NDQNCj4gLS0tIGEvbmV0L3Zob3N0LXZkcGEuYw0KPiAr
KysgYi9uZXQvdmhvc3QtdmRwYS5jDQo+IEBAIC02Miw2ICs2Miw3IEBAIGNvbnN0IGludCB2ZHBh
X2ZlYXR1cmVfYml0c1tdID0gew0KPiAgICAgIFZJUlRJT19ORVRfRl9DVFJMX1ZRLA0KPiAgICAg
IFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNLA0KPiAgICAgIFZJUlRJT19GX1JJTkdfUEFDS0VELA0K
PiArICAgIFZJUlRJT19GX0lOX09SREVSLA0KPiAgICAgIFZJUlRJT19ORVRfRl9SU1MsDQo+ICAg
ICAgVklSVElPX05FVF9GX0hBU0hfUkVQT1JULA0KPiAgICAgIFZJUlRJT19ORVRfRl9HVUVTVF9B
Tk5PVU5DRSwNCj4gLS0NCj4gMi4zMC4xDQo+DQoNCg==

