Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3136652EC
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 05:47:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFSzu-0007L5-6L; Tue, 10 Jan 2023 23:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1pFSzr-0007Kb-Ff
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 23:45:55 -0500
Received: from mail-dm6nam11on2060a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::60a]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1pFSzp-0002C8-Cn
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 23:45:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCXYUiTd9xucsGw0618tmJnU0jQ3Ey/y/XNHz9yUd0MW9nHw3RhqiMe/95yogdxAwkZ1TB9CYFBqxzKngY2ehEo/EoFs3vpjm2ZsNCUnJJ3lkgj22oHXNlOyU8bTUFoAw4gbvabdPTzCiDwI98w0n/e+ImKqlgeBZxYXd4i3qfSCM36XakMJFWkNKNLUxdFBkaZqj7AOWor9wI8NHe8W83rXtjVX/p74ekexQLXrrolp0IAnMdVgqzljazTpDzVLN3gm2Tpg/qHUW8NODGHszONllEyr660XllBoW2FOfY8GsS6K+XNTa2aqWtJpdXZGWhDtARF3FUQpihsAjvkaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuRSLBl7n/S4EMoRRWxjZQrMj9+Y5hQG00C47BWt17Y=;
 b=IMMIp/sLKDUFnxsx9c7ixSXP0RjuE6pKM72VPUJPUI9OuLKxFJf8CWXMWNMdlo/S5hhRdQNo5YsVh2qLcs4f8OF7APOV44E+GHUacnxK3SJjhMeDeqilAvPXVJiqnRj3Z4zArQF1Okxz1cB1TAJ3YTAOBVIujEJSTwkoOk634IJNvNg9OYkx57UeZyQOmT2hqRKLQK1c27Eu8Iwkvi+YZaCcBII606b9KlYdiwoVKUa+UtAKZj5hfdncUFlZzgolAJ3ywYo0X8/B7HJYj703pC0MISLLmpP0xJQq8QNk4vphVE9CoS4eMz11qsYRMWOCMlMT0K9z27DT6rTj8IwDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuRSLBl7n/S4EMoRRWxjZQrMj9+Y5hQG00C47BWt17Y=;
 b=hS6f0mmL/v2n13Bdf6oWbKE7so9UZZU24LNXtks9gUTpE8e9kJlawSSPP775tkAWeEiWeYwYCUogZdKZ7OxVgVDGV82le5OcxaT3W1ADMXE3wpH4yhIv3FkC4CnPWNBF0eRsO2uArcdo4j7hPHznbzuy/U63K2EX6ioL7vNL4t1j5LiGcRTCeBxlmlVtljsIZhaQheHbGgbSy55/rOQh1x6J8lZXh/okfE5zGg00j25neWCN8VS/Jo1IPTB1bnlfxGx24ZicgOkIEhZyKG7HuXovWb75FvvbCQ3NN95PsQKHTbb3EXtNtsZ7vpFdg9gKHPx6raiZ/zrhbV0Xwtt7Dg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA1PR12MB8222.namprd12.prod.outlook.com (2603:10b6:208:3f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 04:40:45 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0%4]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 04:40:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Liuxiangdong
 <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>, Harpreet
 Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, Zhu
 Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>, Si-Wei Liu
 <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Eli
 Cohen <elic@nvidia.com>, Stefano Garzarella <sgarzare@redhat.com>, Juan
 Quintela <quintela@redhat.com>
Subject: RE: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
Thread-Topic: [RFC PATCH for 8.0 10/13] virtio-net: Migrate vhost inflight
 descriptors
Thread-Index: AQHZCMvCocomO4wJGEu6CYOEXtA/lK5gMvUAgDb0UJCAAbMxAIAAAETA
Date: Wed, 11 Jan 2023 04:40:44 +0000
Message-ID: <PH0PR12MB548141C98FA3C7593E4B3C40DCFC9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
 <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthSYTw9JEHT_CM2FdV88eDqan+Ckj7McwTBRK92ziyUg@mail.gmail.com>
In-Reply-To: <CACGkMEthSYTw9JEHT_CM2FdV88eDqan+Ckj7McwTBRK92ziyUg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8222:EE_
x-ms-office365-filtering-correlation-id: 71cb53b7-74e8-4e71-69ea-08daf38e00bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kSSsCuEhwqAIpWqje4zYQ9Q8GMhwT2uqJREI2MUwu6Bf7YDv7YK0ALz1VNWwWXybfh5gmYsmg6Qau7v0ZphQpO2cEI5saJ9hs3ivzOyr5E0sEUybr84njYW5YaYx5InfD6SM7NgKPoFLJvPPTxusn76H1frTI0v+4YHQ9/dgWf69DVgdL33k56qkNF5lSgsk/y9m62HvzIObi/9r+o1UdM1N3ARgOVAGuVFvVJIQ1uNwsl95qieatZ+OLm83WX7DRJi0CXUdcv5xCSJaJ+CVRmnfD1O78Fx4z5sPdueYvJMCwThmjf+MqjJrQ2WkjWnv2+BP+OLCNlxRn+YR6Ty9s6ZMrk3gndAbW6Q6e6MZU3F6ySszmK5lhkBZXR48yLoZ2EKaACXjtDElie1xVgWR9OSJ3D3kvaioR5vt9pTemy5zS8uKSXLKT1JIYz6m6wPtbmcv2fFtesv+LHxmMy0sQKAWCYgTfW7TmhSV3BKxfAXamy5KWiIP4BD7MmZx6SjuMQk6rgDDNHpMCiEmQydCfzGmdtSWij+NP9K1iVieHZHkHhp5erJX+3EkPFFd1KBOi+tsnFn+KaABhzPYvdwnDIYkY1sCuJxVfdBo52KN1tKYZ7i49/9s9BaY2sHkoruWLybUl19/Yeoo/yiImy4xID3xNKSEKmO2/XNRqtnUYGTlsDhov3sNlRl635I1sVqAMnOgQSbR3bZLSl89o1oIwfEznD29jgozOTSOHzM5WOA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(2906002)(66899015)(7696005)(8676002)(4326008)(66446008)(6916009)(41300700001)(66476007)(33656002)(76116006)(66946007)(8936002)(5660300002)(54906003)(7416002)(66556008)(316002)(53546011)(6506007)(55016003)(52536014)(478600001)(64756008)(38070700005)(71200400001)(186003)(26005)(9686003)(966005)(86362001)(122000001)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHEyNEsydFc5czdMTjZiT3R3MHJvdlRKZmJYMDZKVVN6d3lwcUQvRDJ5TlA2?=
 =?utf-8?B?T0Y5eUUyZWFhQWRzQUl0dTFZN2hzN0RsMmRkZE9KMEg0RlRKS1RNYW9Ud0tS?=
 =?utf-8?B?QmhXUjBaazlGaDJiN0ZUTU1NbitqWTZvM0lIeVBvSXZIWTZ4aEVxckw1K0wv?=
 =?utf-8?B?VktEYjQ4bmVNMzlwUktEdCtlZ0daMXJHWEs3Y0d1L0ZsYjBYbGltSnJzZkhh?=
 =?utf-8?B?UjgzRmJtUjlwZG5iRDFLOCszTk1VcjVGNjFwSVZvNFgxM0NqVkkzTkVMa0RB?=
 =?utf-8?B?Qm9VTngxUC9rOEZKKzNIR1V1VmxQSXpYenBOR0FhV1gzaUhPSnN1NEt2VFdk?=
 =?utf-8?B?dkxJbXhUUTZhdWUzQ2laU2pWdFV0ckZacGZna1F1WXJyQ0ZSbXBjN3Fmd3kx?=
 =?utf-8?B?RkxTbEVMODU2Zm5XL1granMyMUZqRDE5MElES21TUWxkSVN1Qi83aUE4OS9R?=
 =?utf-8?B?cjZINjdaTk1ocEo1VmtxelRoV3c4VU9lTTc5b0IvU1dwZEl3empjS0ZHdGN1?=
 =?utf-8?B?WVp3UlBiV3Y1S0lJRkVuV3ZoditHM3BjaVZJb0FVendEelVoNWdQdTBvMVB4?=
 =?utf-8?B?R3EzcWNObEVtM091eFBqVXZZdk1STHZwODIrSG1EeUk4QmxHQ2M3Mk5oZHR6?=
 =?utf-8?B?U3pMQi9uVWtYUEppNzlhOXpFdll4ekpPakxGblp0NzdEMWZkd1BjUmFEbk5m?=
 =?utf-8?B?dTNBVnkyZEtxWFU5MzdzT3lCcFQ3dENSbGNTWDZFamNPZE9YUUlBZ2NEdmVJ?=
 =?utf-8?B?ZGdFSEcrc2pMdU9SUENMN2FwY2dDanVTZVlsbmM1RmgyV1NQU1BySndkU2Yw?=
 =?utf-8?B?QnZHa1lPbm1TZnJwc0lVTWN1cHdwazlHRzVBSnl2UTJzSzFTUjFTazlVd3My?=
 =?utf-8?B?VHlKRFh3d0hEbUZnbEFldDc4cDBBZHRQQzc5cmtNdnBpWE5uaWZmQ1BMSC9Y?=
 =?utf-8?B?T2xod1RmSlRNaFE3K0tjaE93bnB6Q0h3b01OZlJGQWZWeVc0QU05UGxOZVVG?=
 =?utf-8?B?Nm5FM1EzLzJkbEhNSGVjLzdQMUcwOWJaaUo2UzhHMzZlNEJDdjI2emVIaWow?=
 =?utf-8?B?ZUs1YkxZTW9ZWUVZN0hRR0UvakhUdEhNRkZLb0I5cXhMWTQ5Z25EWmZvWEli?=
 =?utf-8?B?T0JuVmlUdk01Z0dCNkh6QmhtdWtDR0FRamJLNlZ5a1h2Rmw0cEJ4ZDdEeE5p?=
 =?utf-8?B?bUFPWXFNQjk4ZWdrZXNPWlV1T2swTk8rZk94MDkzdU5BVUxGOUlhU1daZGVO?=
 =?utf-8?B?R0pXckNpT3lNaXIvcmgxdXhqQ2g1WmpXajdJcm9MejFqQ3ZDRzNRcGFYZjN6?=
 =?utf-8?B?TEJYcVpwWWpTdUgrS3M2QTh5alpBaGxyclppWmhjRitwdnlqa0RjODdnUk5q?=
 =?utf-8?B?RGZVeW5FczM3Z200YmNQM0lYczBvS0pFWDdVZEpENGxuR1JQbVFPWWhYbHBp?=
 =?utf-8?B?dnRCd2MvV1hjbWdTa0hoVmNZNFZETC9vS2xSUS9tS1ZhS1BjK05BVEhVVlQw?=
 =?utf-8?B?WmxHbFczcHNVYkxXV09uL2dhV0owd1lTNVNrK1JPbHVyci94WThHSXRwN1FE?=
 =?utf-8?B?UXpFc1pCOUhTY0FIZXlqQnpPYmI4ZWx3cVVBczFyRHc2MjNqQjFMajd3WW1i?=
 =?utf-8?B?aVEwVFA1Wit4YldNWjVZakx3YW5vVEdkWHU2alRoWEEyUGZUc0w3THBkazQx?=
 =?utf-8?B?OHZlQlFjWHgxSVBCS09RWkUrNUpFV0hXWDA3c0I3clRsTEJuZnhpbDFSYkcx?=
 =?utf-8?B?Ym5ZRVhxZ2lGd1lRbHlXOWdQV25UU3EzenEyaHFpVUZUK2FPL01GMjBUUE1K?=
 =?utf-8?B?ajNnb01mNnppeUVIcEpPTC8xdktPRHRXZ3FnTnpLRVgzSzZDSTAyeXdOd0xK?=
 =?utf-8?B?RURET1NOckVwc1BacXhuU3pKWlZpa2ViYlpJclVnZWJsbmJJaTV2MEUyUXhi?=
 =?utf-8?B?M3R5bkZaOWNOQ25LVTREMitHdTRBTmg5QWoyaDRBM3ozV2wwUDIyUVdSYTYw?=
 =?utf-8?B?Mm9Tcy9iMkdxekQrSVIya2cweUpRM3BlUjU4Q2FLYldHUTFEVDNGbWhPdG0z?=
 =?utf-8?B?MXFCY0tBTHFZYUhJcVlweGRnOFBMRkJSbWYvV3Q2SHN3dmdGR0pOWkxhMmc3?=
 =?utf-8?Q?42mg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cb53b7-74e8-4e71-69ea-08daf38e00bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 04:40:44.9484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4V9loB++c03TwSeb+cIA6OG/VZmUF6a18zJxi6U40tWzs6KhpxrFS711CLMsHOZkKL3tfEvCDySOZ/Rm9Ecg0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8222
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::60a;
 envelope-from=parav@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEphbnVhcnkgMTAsIDIwMjMgMTE6MzUgUE0NCj4gDQo+IE9uIFR1ZSwgSmFuIDEwLCAyMDIz
IGF0IDExOjAyIEFNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBIaSBKYXNvbiwNCj4gPg0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVk
aGF0LmNvbT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgNSwgMjAyMiAxMDoyNSBQTQ0K
PiA+DQo+ID4gPg0KPiA+ID4gQSBkdW1iIHF1ZXN0aW9uLCBhbnkgcmVhc29uIHdlIG5lZWQgYm90
aGVyIHdpdGggdmlydGlvLW5ldD8gSXQgbG9va3MNCj4gPiA+IHRvIG1lIGl0J3Mgbm90IGEgbXVz
dCBhbmQgd291bGQgY29tcGxpY2F0ZSBtaWdyYXRpb24gY29tcGF0aWJpbGl0eS4NCj4gPg0KPiA+
IFZpcnRpbyBuZXQgdmRwYSBkZXZpY2UgaXMgcHJvY2Vzc2luZyB0aGUgZGVzY3JpcHRvcnMgb3V0
IG9mIG9yZGVyLg0KPiA+IFRoaXMgdmRwYSBkZXZpY2UgZG9lc27igJl0IG9mZmVyIElOX09SREVS
IGZsYWcuDQo+ID4NCj4gPiBBbmQgd2hlbiBhIFZRIGlzIHN1c3BlbmRlZCBpdCBjYW5ub3QgY29t
cGxldGUgdGhlc2UgZGVzY3JpcHRvcnMgYXMgc29tZQ0KPiBkdW1teSB6ZXJvIGxlbmd0aCBjb21w
bGV0aW9ucy4NCj4gPiBUaGUgZ3Vlc3QgVk0gaXMgZmxvb2RlZCB3aXRoIFsxXS4NCj4gDQo+IFll
cywgYnV0IGFueSByZWFzb24gZm9yIHRoZSBkZXZpY2UgdG8gZG8gb3V0LW9mLW9yZGVyIGZvciBS
WD8NCj4NCkZvciBzb21lIGRldmljZXMgaXQgaXMgbW9yZSBvcHRpbWFsIHRvIHByb2Nlc3MgdGhl
bSBvdXQgb2Ygb3JkZXIuDQpBbmQgaXRzIG5vdCBsaW1pdGVkIHRvIFJYLg0KIA0KPiA+DQo+ID4g
U28gaXQgaXMgbmVlZGVkIGZvciB0aGUgZGV2aWNlcyB0aGF0IGRvZXNu4oCZdCBvZmZlciBJTl9P
UkRFUiBmZWF0dXJlLg0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZQ0KPiA+IGUvZHJp
dmVycy9uZXQvdmlydGlvX25ldC5jP2g9djYuMi1yYzMjbjEyNTINCj4gDQo+IEl0IGlzIG9ubHkg
ZW5hYmxlZCBpbiBhIGRlYnVnIGtlcm5lbCB3aGljaCBzaG91bGQgYmUgaGFybWxlc3M/DQppdCBp
cyBLRVJOX0RFQlVHIGxvZyBsZXZlbC4gSXRzIGlzIG5vdCBkZWJ1ZyBrZXJuZWwsIGp1c3QgdGhl
IGRlYnVnIGxvZyBsZXZlbC4NCkFuZCByZWdhcmRsZXNzLCBnZW5lcmF0aW5nIHplcm8gbGVuZ3Ro
IHBhY2tldHMgZm9yIGRlYnVnIGtlcm5lbCBpcyBldmVuIG1vcmUgY29uZnVzaW5nLiANCg==

