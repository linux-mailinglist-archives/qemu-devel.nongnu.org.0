Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B958A3715CB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:15:39 +0200 (CEST)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYQE-00048U-Rj
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Xiongzi.Ge@netapp.com>)
 id 1ldYGz-0002ZW-Vc
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:06:06 -0400
Received: from mail-dm6nam08on2081.outbound.protection.outlook.com
 ([40.107.102.81]:28960 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Xiongzi.Ge@netapp.com>)
 id 1ldYGv-0003w5-Hy
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:06:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLY5Z9nTokXG23GCkFyX+D11He67jtpnWxdusPXij7/sQJxpQLFxyG0E0yVCeEKLt+TESV/kSntOTaxuUAC2966Oy+LoHpZrJ4uhhK6KnUUvMS0AzdaX04Bz3Dd/mboEM4CKu/cd3IUXrPdIpKfQbv5zkVaAvO5/zuC251bvXbhIU5xEem0Ll3nTww1dzDXJZQDACcupkJrj3uOEN5Qa804SexgyLW7FgdZKG4JX4SYOnK86aAuljZgmXua7ZpFy3BnLLWwi0Lei2/Hn4FEo1lCWW9rly/PHtcQtvys0nydpScoofOGnCj7KD6bors9bQ2u0uDwzKnZyr+F6gZQylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQwfE6tPkaro5Jgt1LIZZmb59nF3Rof+taUfVoNnOtg=;
 b=EfOkWSorsTRLK0f9/YHr2t3su792uGLe8Z91hvtaYeyooAqLw9fE3jU0jzQkqWi750BKTWkd49qgeUtjQ1DOqIFY0nNHG8/qeOAefz0dzwrnDl8RhO7XiUdSYUEDnSjXaffhs/bY1jdSYFlIhDnxrM8eAZnL59P8rB5N5g8pU80en/xjYa/rLB11dffZLV7VH9nTVK+JmKGRPdh8ehjUNToLtnwQ4KFQb0SPovu/fmb4T+3acYCB3PipkrWQGRq1b2+mQb+VrRYOJu3QOkuaoKyJrIT054XYbBt/KoFnsTdB6gcdgowo+h/VfXeZC2tlJzx7sl28LBlauofdwPfdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQwfE6tPkaro5Jgt1LIZZmb59nF3Rof+taUfVoNnOtg=;
 b=hfox82k25I/sLikGtkJ1f/SKuc76OJDy1UfgqXzLyu/EQhEym1mNcjzZXydW8hzdFWJpwAQ39V3zULCxAs9VoGHlhvk66SAA/3Y5Aww/rP4ZleOeqyGLQUPQEjfb3gXrXSRg97TV7+4ma+aJqOfVOXdjjS7Omwku5pzB5ueprEODfRnOKL0NwvVaM7ZrI54aB2c9A4pIUJO5SbuAdpbOBZLvyMASvXdxFnVQ5I/uebNEFukBhPlQDC3K8i+JyuCWAzDuNm+inNB3nNSzRAiEqzCusPmy6LK1d9nN3v3u5HPILhRxipe2H+tc4YEbnSFPlBuscwc8mKayYW0KvJRRWg==
Received: from BLAPR06MB7010.namprd06.prod.outlook.com (2603:10b6:208:287::7)
 by BLAPR06MB6898.namprd06.prod.outlook.com (2603:10b6:208:295::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.43; Mon, 3 May
 2021 12:50:56 +0000
Received: from BLAPR06MB7010.namprd06.prod.outlook.com
 ([fe80::48ce:27a:eb7e:f868]) by BLAPR06MB7010.namprd06.prod.outlook.com
 ([fe80::48ce:27a:eb7e:f868%4]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 12:50:56 +0000
From: "Ge, Xiongzi" <Xiongzi.Ge@netapp.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] Live migration support for virtio-fs
Thread-Topic: [Virtio-fs] Live migration support for virtio-fs
Thread-Index: AQHXH4TfR8MZ6fUMPEa7PJ1kNF3AoqqRX62AgABJxwCAAAIkAIAXg3+AgAG4IoCAJsyZAA==
Date: Mon, 3 May 2021 12:50:56 +0000
Message-ID: <423DD084-E08F-4402-AD5A-3583117A6B4E@netapp.com>
References: <714BD741-AE3F-4BC5-8DFB-F5C74A8623B1@netapp.com>
 <YFnC9QXo6uP+2zC1@work-vm> <20210323145312.GB483930@redhat.com>
 <YFoCpIh5PCSP6gXB@work-vm> <40D27E5F-C65A-4441-BA23-ABA6880DAA71@netapp.com>
 <YG8tXxdyakzkyI0h@stefanha-x1.localdomain>
In-Reply-To: <YG8tXxdyakzkyI0h@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.48.21041102
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=netapp.com;
x-originating-ip: [76.182.122.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2c9b5e8-1fdc-42f7-1deb-08d90e32183d
x-ms-traffictypediagnostic: BLAPR06MB6898:
x-microsoft-antispam-prvs: <BLAPR06MB6898F6F285070B5786FB0FEBE35B9@BLAPR06MB6898.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YT8nBEoEhWhsXRN4aufOHWeStlfkkOfCQ9YMT7LiArfbRfMxMEAdoXaRO2mkrdz1xgUqqXc0yRbvlt04j0g7zwXWrkds71Pq7kIXrkDhE1wdTOTdYRVK6VNNGJ7ux93Pm/QkN7JHxCY5iqxKxr9xZa/hud0DvW1RUPL9DBabTkgANtX+a+TydJgTq6RzqcWIuKAYkCZguy1GM772FykhkKhVQ7TvqKWZvbdPOCfu8RyU+zIBuWbLfXpY6xNaFSfjBcfN/erpVX/ZFe2w46Rpl+ibK5DHkd3fOENZVo2n9OWo299ktpDsmkZHF8os38HvyzXnPGM55FOyxumdrb+UShyYfsTkQ937Tx9bCi9fckpkEjw/K5tF1KVA5pJl7vC2yKMWrSMEDe/XZ8p0rmXoXnMOgBqIMB1agLEM4vqBqqovv1n7MnCh0QJhPPLIV48mZSHYE16usQFgPs8GZvsfAxcUo1RId3zK+ZSXbQHGlKJF4iak9K7lz6s/OsIVq9nlzbTfOa8q8W37JoPRQY3ooHC+1K6RIObAPB0pwTUPUD4nJsL1K+1epPczxTnKYoF1Rxct4lQX7yPqzm5x8Dh2vt05NwNRy9qZAQiYqfiE94AjQvtx5Vn3oQ+u6+6sdUED9NIhBz8o0KDBIdzU5aqmxtaGPrdJr8aF7CS+nh1mb5t9oNL6sR6OdgY1b4rH5KGP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR06MB7010.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(2906002)(6916009)(8936002)(478600001)(316002)(54906003)(186003)(6486002)(6512007)(122000001)(38100700002)(2616005)(4326008)(66446008)(86362001)(91956017)(66946007)(66556008)(76116006)(64756008)(33656002)(71200400001)(66476007)(36756003)(83380400001)(6506007)(8676002)(26005)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?L05JYnhvVkh3aWpaWC96OXplK3ZEQzRxREdQcktyRnRpc04xMldzcjhnYitF?=
 =?utf-8?B?cGVncld1RDdJNFg4SHJLQUwzS1k0TGZ3NU0rNi91Q1g1NS9MbitlUHFRKzlG?=
 =?utf-8?B?dHNMMkN2aUZyYzk5SkV5TnNWMmpFbko1Ky94VUx6OFFLMWdqZldVSk4wUldi?=
 =?utf-8?B?R3ZKa0p6QUpjNGRFRXB0V2hvRk02UThHeTlyL0dBditsdDNyOS9BMmNjTkRH?=
 =?utf-8?B?R3h3bFROY0FnTENhbEc0MlNSMU5LRFZvZjFVS2VweHppK3EzNFJueE9CUFBz?=
 =?utf-8?B?R1ZGTkdkdVl3Y0pWQzZUUzJiUlRxQXk3VFJBT2EyaEJVTk1qdmhBQTNlc0JC?=
 =?utf-8?B?NFlJTVMrelJCWVIzRy84MW51M09VNnRCLzJITHF6enR3TE12WE5OVHJyOU9C?=
 =?utf-8?B?eFBKMDBPY3MzR0x0bHU5dVg4OEZrT2k3K2hoaUZYSjFZVXBrV2RJMjMxUzV6?=
 =?utf-8?B?ci96dVpFQnNhR2p6eUJvM1JXZlNBaFFMYlpXUTlsRDNTVnJJbDVzOTRwdWxy?=
 =?utf-8?B?VnZrWWxhb1dDaDVoMDZLVXlEMVZmeWpiNFJTYlBSOWxFdk5nMGRRYm9Vd1Nh?=
 =?utf-8?B?UTU1RldtVUhJYUxKSFlLdXNNSE9tcVpTNkRUWDdOYnpja2RMUWFtY3hjaXkv?=
 =?utf-8?B?blVhWXEwdUtyZ3g0MXlXNUdJQm05bzhYWHd0ZEFCQlRTSGVHMEgvU1ZtLzY1?=
 =?utf-8?B?c3dOYzk1NGUvY2h3RDVCcXhwdnJHOUhmQm5pRWlCcGxvZW1FWXRHampVTk5v?=
 =?utf-8?B?MTFvTmxuT1J3YW42Vjg2ZkQvYWZHSEQrOHk2T2ZyN21aUmJSZCthVkcxKyti?=
 =?utf-8?B?blJSU3Q0alRWck5rRzVqNXhvK3dLNHRJSVI4SHhuMEF3eFBsUy9EajBkQmpQ?=
 =?utf-8?B?d2pvcVExU3hvVkpiaDhqOVQrWVRxdHVRUzJkclJmNlR4THpPa3JFN3dlZk5P?=
 =?utf-8?B?OFlQT2tVZ1huRjdHK2VQZDU0QzJzcS8wTmdNT2RIcWpUZU1INTZicFZKQTZz?=
 =?utf-8?B?WlA1NFkvejliSTUyK0hFTXN2MjR6bzRSSnBIMVR4ZEttYUZDWkEwWStFT2lM?=
 =?utf-8?B?UUZnU01lcGNvTEZ6eTJtWW9qN20zOFEwK29QNGpNS1BTVHpaeXFjUmEzTXA0?=
 =?utf-8?B?Vm9PZVRERUw4RFJCWm1MQmFMWURWZ0pkZ0NseTUyOXM5YzQrNkZHRWkybC96?=
 =?utf-8?B?MEI4RzBnaUdYVUVNN3VmeW1Nd3hWdEloTnFKUEhDS1Y0SXVkNUp1cng0akhj?=
 =?utf-8?B?ZHJCSS9aamoxV2pUeEV4LzVtNVU0UzcweFVwblhsaFJBaVFvMDQ0VGoxN0hk?=
 =?utf-8?B?MTNaSERvZWtyZlpwMGdFOFZEcklaQmpOZ21mdGNGYWQ5bDBYbnhzZWp2TEZi?=
 =?utf-8?B?K3BxZmxQdjhFWFliZFVPWUdyS09GY0hKWC9lZ1VsdGcwL3lqeUJldWM5a2xy?=
 =?utf-8?B?cm1ib1d6MEw5QU9KR1JGN3FiSWlQK3pwQ3hvQjQ1TGRNajRjZUNFV1l2RVBk?=
 =?utf-8?B?MHJRN0t1cGlLYmUwNFlzdkFNZ1AwMnZIcmpiVi8rdGhyWkJDZWRZb2pUSFc0?=
 =?utf-8?B?T0VKdlg3c1RVTFdnTE1Cc3Nhc29FSVRFdmtVWkdNY1VSeE1GTkJSNlNVcERX?=
 =?utf-8?B?Ykczamk1elk0elpWVnBVOGFOdndoYkxlQ0taMHNkV3MzOEdzbkh6cFFzdUpE?=
 =?utf-8?B?eGluUHh5aDdnbmZqdlVRMlp5TW1xSjRWaE1uUCtzN3lqR1ZUYTdxWHgyTmhZ?=
 =?utf-8?Q?vO6ti6k3Ba5OvcvuM08DjQQ6+Fx0/xwGw/GA4Tr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B6DDA2802A6574BB25881FF3909092F@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR06MB7010.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c9b5e8-1fdc-42f7-1deb-08d90e32183d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2021 12:50:56.5775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IjYKd8WA4gjLxG2+FHsTcLuh1yjH65hSU+w4tAb1XEGzhh/LXz+LJBcenERuPL/ky4vGlCuhclXTSFZbdgVs2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR06MB6898
Received-SPF: pass client-ip=40.107.102.81; envelope-from=Xiongzi.Ge@netapp.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmtzLCBTdGVmYW4hDQpJdCBzZWVtcyB0aGF0IGxpYnZpcnQgZG9lcyBub3Qgc3VwcG9ydCBk
ZXZpY2UtYXR0YWNoIGZvciBmaWxlc3lzdGVtIHR5cGUgZGV2aWNlLCBsaWtlIHZpcnRpb2ZzLiBB
cmUgdGhlcmUgYW55IG90aGVyIHdheXMgdG8gZG8gdGhpcyBob3QtdW5wbHVnZ2luZz8gDQoNClhp
b25nemkNCg0K77u/T24gNC84LzIxLCAxMjoyMSBQTSwgIlN0ZWZhbiBIYWpub2N6aSIgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KDQogICAgT24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMDY6
MDU6MjlQTSArMDAwMCwgR2UsIFhpb25nemkgd3JvdGU6DQogICAgPiBUaGFua3MgRHIgR2lsYmVy
dCwgVml2ZWssIFN0ZWZhbiwgR3JlZyENCiAgICA+IEkgcHV0IHRvZ2V0aGVyIHRoZSBkaXNjdXNz
aW9uIGludG8gdGhpcyB0aHJlYWQgYW5kIENDIHFlbXUtZGV2ZWxAbm9uZ251Lm9yZy4gDQogICAg
PiANCiAgICA+IFByb2JsZW06DQogICAgPiBDdXJyZW50IFZpcnRpby1GUyBkb2VzIG5vdCBzdXBw
b3J0IGxpdmUgbWlncmF0aW9uLiAgRXZlbiB3aGVuIHRoZSB2aXJ0aW9mcyBkaXJlY3RvcnkgaXMg
bm90IG1vdW50ZWQgb24gdGhlIGd1ZXN0LCBWTSBjYW5ub3QgZG8gbGl2ZSBtaWdyYXRpb24uIEFu
eSBzdWdnZXN0aW9ucy9pbnRlcmVzdCBJZiB3ZSB3YW50IHRvIG1ha2UgdGhpcyB3b3JrIHNvIHdl
IGNhbiBzdGlsbCBoYXZlIHRoZSBsaXZlIG1pZ3JhdGlvbiBmZWF0dXJlIGZvciBvdGhlciBwdXJw
b3NlIG9uIHRoYXQgVk0/IA0KICAgID4gDQogICAgPiBJZiB3ZSBhbHJlYWR5IGhhdmUgYSBzaGFy
ZWQgZmlsZSBzeXN0ZW0gbGlrZSBDZXBoLCBkb2VzIHRoaXMgbWFrZSBpdCBkaWZmZXJlbnQ/IA0K
DQogICAgKE1hcmMtQW5kcsOpOiBJIENDZWQgeW91IHJlZ2FyZGluZyBELUJ1cyBWTVN0YXRlLCBz
ZWUgYmVsb3cuKQ0KDQogICAgRHVyaW5nIHRoZSBsYXN0IHZpcnRpby1mcyBjYWxsIG9uIFdlZG5l
c2RheSB3ZSBkaXNjdXNzZWQgaG93IHRvIGFsbG93DQogICAgbGl2ZSBtaWdyYXRpb24gd2hlbiB0
aGUgZmlsZSBzeXN0ZW0gaXMgbm90IG1vdW50ZWQuIFRoaXMgbWVhbnMgbGl2ZQ0KICAgIG1pZ3Jh
dGlvbiBvZiBhIG1vdW50ZWQgZmlsZSBzeXN0ZW0gc3RpbGwgd291bGRuJ3QgYmUgc3VwcG9ydGVk
LCBidXQgYXQNCiAgICBsZWFzdCBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBtaWdyYXRlIHdoZW4g
dGhlIGZpbGUgc3lzdGVtIGlzIG5vdA0KICAgIG1vdW50ZWQuDQoNCiAgICBUaGUgZWFzaWVzdCB3
YXkgdG8gZG8gdGhhdCBpcyB0byBob3QgdW5wbHVnIHRoZSB2aG9zdC11c2VyLWZzLXBjaSBkZXZp
Y2UNCiAgICBzbyB0aGF0IFFFTVUgY2FuIGxpdmUgbWlncmF0ZSB0aGUgVk0gYW5kIHRoZW4gaG90
IHBsdWcgdGhlDQogICAgdmhvc3QtdXNlci1mcy1wY2kgZGV2aWNlIGFnYWluIGFmdGVyIG1pZ3Jh
dGlvbiBoYXMgY29tcGxldGVkLiBUaGlzDQogICAgcmVxdWlyZXMgZWl0aGVyIG1hbnVhbGx5IHBl
cmZvcm1pbmcgdGhlIGhvdCBwbHVnIG9wZXJhdGlvbnMgb3Igc29tZQ0KICAgIGF1dG9tYXRpb24g
dG8gZG8gdGhpcyBhcm91bmQgbGl2ZSBtaWdyYXRpb24uDQoNCiAgICBBIHNtb290aGVyIGFwcHJv
YWNoIHdvdWxkIGJlIGZvciBRRU1VIHRvIGFsbG93IGxpdmUgbWlncmF0aW9uIHdoZW4gdGhlDQog
ICAgZmlsZSBzeXN0ZW0gaXMgbm90IG1vdW50ZWQuIFVuZm9ydHVuYXRlbHkgaXQgdHVybnMgb3V0
IHRoaXMgaXMgYWN0dWFsbHkNCiAgICByYXRoZXIgaW52b2x2ZWQgYmVjYXVzZSB2aXJ0aW9mc2Qg
cnVucyBhcyBhIHNlcGFyYXRlIHByb2Nlc3MgZnJvbSBRRU1VDQogICAgYW5kIHRoZSBsaXZlIG1p
Z3JhdGlvbiBpbnRlcmZhY2UgZm9yIHZob3N0LXVzZXIgZGV2aWNlcyBpcyBjdXJyZW50bHkNCiAg
ICBwcmV0dHkgYmFzaWMNCiAgICAoaHR0cHM6Ly9xZW11LnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVz
dC9pbnRlcm9wL2RidXMtdm1zdGF0ZS5odG1sKS4gVGhlcmUNCiAgICBpcyBjdXJyZW50bHkgbm8g
d2F5IGZvciB2aXJ0aW9mc2QgdG8gY29tbXVuaWNhdGUgd2l0aCBRRU1VIHRvIGFsbG93L2RlbnkN
CiAgICBsaXZlIG1pZ3JhdGlvbiBkZXBlbmRpbmcgb24gd2hldGhlciB2aXJ0aW9mc2QgY3VycmVu
dGx5IGhhcyBhbiBhY3RpdmUNCiAgICBGVVNFIHNlc3Npb24gKG1vdW50KS4gSXQgbWlnaHQgYmUg
cG9zc2libGUgdG8gZXh0ZW5kIHRoZSBELUJ1cyBWTVN0YXRlDQogICAgaW50ZXJmYWNlIGFuZCBp
bXBsZW1lbnQgc3VwcG9ydCBmb3IgIm1pZ3JhdGlvbiBibG9ja2VycyIgYXMgdGhleSBhcmUNCiAg
ICBrbm93biBpbiBRRU1VLCBidXQgSSB3b25kZXIgd2hldGhlciBpdCdzIG5vdCBiZXR0ZXIgdG8g
anVzdCB3b3JrIG9uDQogICAgZnVsbCB2aXJ0aW8tZnMgbGl2ZSBtaWdyYXRpb24gaW5zdGVhZC4g
RWl0aGVyIHRhc2sgaXMgY29tcGxleCBhbmQgSQ0KICAgIHdvdWxkbid0IHJlY29tbWVuZCBpdCBh
cyBhIGZpcnN0IGNvbnRyaWJ1dGlvbiB0byB2aXJ0aW9mc2Qgb3IgUUVNVS4NCg0KICAgIENhbiB5
b3UgbWFrZSB1c2Ugb2YgdGhlIGhvdHBsdWcgYXBwcm9hY2ggdG8gbGl2ZSBtaWdyYXRpb24/DQoN
CiAgICBTdGVmYW4NCg0K

