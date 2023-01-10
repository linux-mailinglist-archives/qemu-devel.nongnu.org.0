Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291876637B0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 04:09:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF4zS-0002yH-JZ; Mon, 09 Jan 2023 22:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1pF4zO-0002xn-HJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 22:07:50 -0500
Received: from mail-dm6nam11on2062a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::62a]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1pF4zM-0006EF-AS
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 22:07:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcu7IabtqqCM4IFzf9M2Pui8HFKsXmC5e0xgK6VzuUEBMBl5G66hAUf42Szl76m1/0yXm2zCe+dQgLCBqYyZ61NDR89/3Fl3v7/pavB/kafYB8uOWSB4N6ZQ8VyNLOc+q74x3O6mI2Vm0Pi1pUbhmR5Cl3V4mQ6HzhyCGKujtSSZF/17EZxCNoubIyDJ6+oC6ZsBc2tTos7rPi78jUCXhv8Tq7lc4Qp5hw112GpPaY/WEJntGNREhhZYG6CO6YSfLYnB/EohPeD7SLrq1OX+p7oNZ/mCS5a/shKufo8pTmHcejgR7IKevushs+LqVJ7AgANHE6BrVXwibwqGK4zqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIloM9v6S5mrrDveXHDbepbVndORS1ocmaDy51FuqPI=;
 b=cCLA0e4mLQOfyBIaqeCHQYz20dbqeOdeZ3rQBW+BHFnKGJTcSemA3bk3POLLnZRLm9e4rqaDfryrZIn6ejRNr3t5s1y2Fs9YkNROaFyrPyxV+u428vsC29Nk+j/lrRnmOz/G1yJuT8quy7rfMCux075s2qUuzY66Nm4zlOjDDGoCt7pXkkX3w1vDPEYIANe4UCXANFb89fRTxUe2I4PccjbtV7VJGcJhbcdDa+eRFsID6HqOI6Em5+Bwc5/HWfwHiIjE4KtQa5U6dIW1lErNXgQWDPzBZj2DbrIQCUkDdCgWIsXOt143WnOBL7qpZXW5icv+sTy3Gk8XObWTI1T4JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIloM9v6S5mrrDveXHDbepbVndORS1ocmaDy51FuqPI=;
 b=Z74Etg/thcJUTbYUhoUMmalHodzygwhaudGZ3VvMpQEbIw1t7/7Bzu8E9Jej+OYV4ZFQpFQ7pyuV0VA/x9R03+sOe/2ZEJjh2phE/ZLJxs+LhqVNgz8qz0mw63xGmwdg5dG2ekTQjIBeYk0WCTrcJZGHCmZOCTg1pb8SuKSln+p36s2qMQepB6Y4fmSsTvaC7wFJHF9ycuTjHHD4n8o/heQ0UvxgzcD3BPqbpTX2bQGNS/i8gJhoi3Qh9fMjuerMWtgQ/mJ6v23QnGS0341hvCl6GdNq0oFVdJtyg1JThStgnUv5UtirjRvPbFgTXGUx6uOA4l8ArtvkxtoRUPYIoA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 03:02:41 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::a891:beb7:5440:3f0%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 03:02:41 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
 <eperezma@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Liuxiangdong
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
Thread-Index: AQHZCMvCocomO4wJGEu6CYOEXtA/lK5gMvUAgDb0UJA=
Date: Tue, 10 Jan 2023 03:02:41 +0000
Message-ID: <PH0PR12MB5481EB05212DD70C97AC5729DCFF9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20221205170436.2977336-1-eperezma@redhat.com>
 <20221205170436.2977336-11-eperezma@redhat.com>
 <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
In-Reply-To: <CACGkMEtcQztTdRbX3xyFvNYSRsu58tRppoyTUh94vXwSGLPH=A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8059:EE_
x-ms-office365-filtering-correlation-id: e5e4c16b-f75e-4063-0bc7-08daf2b7238f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qYWoV2Gf9y/FNr9VnjIObpG6EAdB+twvPRwwpnJUzyqnRR9egfFRxQ5kffSNZas5fvv3MSV91ZLcgma/wvczSkje0dd8rI0l8rQnqGRZGTunxVei/3f6ObX0zTCct3o6pU4b0eiAJ4G6DD2wZDdGIHgHoDaTfu7SzIWCKwQEEaNFEqYqBccD5ol7tW4LO76//Wp/iD1EZAdRj5+jYXxn6OE6Reid/2T991vV1ynfRl8GPJD+uaEFFTTNZK5MznTITsEezgRgxEdCM4C296g9Xp869geiLFtrzPEBEzgaRCShXv2ZX8bYhzBLlmBL8ZWGUeGeVE0nnQLA4IqHMifAGakOfldWtN+n6HlCv6TkAdrhGVerEcccns1Nym9mP9FSWJ5TfGpv+jgRaAeaq2KDHetPvYYjQgK2CmPs2GYUgCQ4KfxF14tAxEGOG+CM91yvME6cX5yJCZD2hnt1pMyZhS1ReXDZd1k3lNwEobBp/V85Ck8J2S/Rcn0VEdBGiyfhvJ8fqy/AKwsMTczb1rKN/qao7kdX8es9NcmbKs6fFpGMVTxOtNimroRegOUQ/uCMTIMeFEx1gSTNhYaSy+DToo+m3FyW3Uz4cgoJD4+8irASkcnBbkqI41alsksA6sDqzsZrFaBgieBRuD6vrqJriuKuUzYQO6lull80Pm4+goOXbK283oXZ0vbYyGX2S/JDi12lfSGFdy32U3CNKm19G9KAQW+znYFFQpriiZ1HUs8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199015)(41300700001)(110136005)(4326008)(316002)(55016003)(54906003)(66446008)(76116006)(8676002)(64756008)(66476007)(66556008)(66946007)(86362001)(38070700005)(38100700002)(8936002)(4744005)(122000001)(7416002)(83380400001)(33656002)(52536014)(5660300002)(2906002)(66899015)(71200400001)(6506007)(966005)(186003)(478600001)(7696005)(26005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkNTSWdqbURuL0pMT3U5VTlDZ2FDRHB3NU10RzRaYW5PMVoxamFjb01pL1FT?=
 =?utf-8?B?RWJFc1hCbDJXYUtWN2NzU2Y2TXRIUU9veW0xVFU3R2ZtOWVGZm1zc05KN2tN?=
 =?utf-8?B?aWRGQWJiNE81VUFmRHV2RmI1TDRlbVo5aEFkemFzZHNxS01pZDZpNlUrMEMv?=
 =?utf-8?B?TWVlYTQ2L0QwWmhkemsrTERhdjhXbXJvQkVCc2R3bGxRTGJ3ZG4wc3l2MDZ3?=
 =?utf-8?B?OE1Fdk5RUWoxVkJodGZLVllhWFVJODdTRmt6b1BESWdoSWk2SkUvNzRWYTNY?=
 =?utf-8?B?cXhMMFFZeXI5cDVTTk1OTFgvWkZQdGJkekRZcjN1OFUwVndRclIvVGh5enJp?=
 =?utf-8?B?ZGRMY3lVN2pyd1ZMWmcvdERmc0RPNllaOTNaTWdDRFVFaEZPK1FHcHZzRzNj?=
 =?utf-8?B?SHhLYXZ4bGRZSi8zemxDWUpEMHJqd28yQUMwOU5UMjlIcjM1UVgvTGd0N2xH?=
 =?utf-8?B?WlAxV0pQdVBLMW9NcTJRdTBJamRZTndzYWNJR0hLWVM1bUwzYjk0dHY2bUVx?=
 =?utf-8?B?Zy9aRHhqR2RWR3NnRUI3VUZKTmxESFNOTnB5V0dBMnpLOGdpNlFaSk4zdmN2?=
 =?utf-8?B?QjdRQUw2RXBBcE5XT3AvN3FjeVdCeTNtUy9DWkJwSE1XU2MzY29IYmpTbG1W?=
 =?utf-8?B?SlQvL2NWV2dkdjJWWk9yQlRIYVZGQXdoRHJqNGZDZUg2Mk9UeUM1UUtCVk5K?=
 =?utf-8?B?aGk1OEpnMWdwNGN6Z3Fhc3lXUUl4bHVFV2xUUE1PcDZlTnVpazROYVF4eUMx?=
 =?utf-8?B?d3c4a2c3L2w2bHIwN0xjazNBcFVyNkh3VXFCUCt6QmpXOEM5TE5zNUdERW00?=
 =?utf-8?B?ZFdJQk81QlhCdis3MURKbFoybFJNWE9kbmtZRE1TVDU4amZtYk1BekNFL3J1?=
 =?utf-8?B?anlraTE4OEhTUjRKTFkyczB6VDhWcVk0OVpESHRVVnFDSUUrd0l3WGdRYS82?=
 =?utf-8?B?TlJVeDIybklHSDc2bVYvY2FPOWk5a1daRGtHcHJScGpHd0NoOTlVaEhVTlF0?=
 =?utf-8?B?Y0tRMGdteVVsMTROb1MrdDR5NzBLWlNKdEV4dnUwV3pKdTZHbk1KUytDNGY5?=
 =?utf-8?B?SW1iQ256YVJKL2Y3WlN4ODNTZ3d2THM1SUdkendWdEd6bGR2K282b01wM1hZ?=
 =?utf-8?B?OVpZTU1kS2kzaTRkUlVFM056Ri9DQzROODN3N3puMENHK2pwOGlwSGdTTnMx?=
 =?utf-8?B?bjJWVjR5Vms0bFBTYzdsbFhiZmdtOFplMWg3R3h3UWk1V0syaUEzR1U2bjNM?=
 =?utf-8?B?Y096WTN1eTYwcWFpQUUrOW1Fb1NndVo3NTZKazBqZ1dOVWo1WmhaMkhPSEt0?=
 =?utf-8?B?S2RsQXJqam9LY011RjlQbVFzNHpPb1JnOFN2aUJURkZVZ2I1azl3Q3Jzblh4?=
 =?utf-8?B?NGFlaWNJWjBCYjgweExEZHZ5RDR4WWdiWUx5ZUU5RzYvRmhsdHBOT2prTVR3?=
 =?utf-8?B?OUhJbS9keGpDM0s2dzJkMkUrM3B6SnR2ZFRsRElLQzFZU1d0M3F5V1Y0emJN?=
 =?utf-8?B?aklHY3FRVFJCVy9XNUgvMVRPaXV4czVSOTZweVM0QVZ3eXBmZUNPMTB4Sy9q?=
 =?utf-8?B?cVFMb1BFMzNhRWZDVjZ4WWRIcWNSaFpKejUwTmQzZUlESHBvb0lRYXZpVC9Q?=
 =?utf-8?B?eTZ3cmlXSk9EaWJZQ09OMWIrUFhIRGxkc3NLTlp0M1UzcTlMemhVc3o4VGda?=
 =?utf-8?B?NnFTbWpGVWVOSWlzNDVaelRhY3VLQ2h2VUt6NExnRTVIOGR2L092Z2xJWWtL?=
 =?utf-8?B?Snc0MVRwc2pyV0xPQjJDdUUxb2JTQ1FKZlp3U1RkNFZxZ2FUdWV0Sk52RDNR?=
 =?utf-8?B?RlI0UlA1ZEdTb3RKRU55b2drczlvWFhrMGxxK1hrZnZ5dUU1eXA3S05xS3ZM?=
 =?utf-8?B?Zll5czE0bnNhOUVNUnNlbDExOStOcGxhOTcxanFmOVZFTGFpTEptUmtLVThC?=
 =?utf-8?B?bjRzRjJBU0lDNmNkM3cwK3djYWF3UjZjbDFOYkNPWTd6RUdZY0xCRXdubjRh?=
 =?utf-8?B?R2JHdVp0YjA0WE4vQzUzQ01FekpHcFVSZTFzMUlMcGxZZkU1NEYvOGp4ckRB?=
 =?utf-8?B?d3BKcWoremtvTXZXMVBrdlViSERtY1B1MWhPRUt0VHpGeUNNdy9yc1dmRDhh?=
 =?utf-8?Q?qsh8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e4c16b-f75e-4063-0bc7-08daf2b7238f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 03:02:41.5235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAE7qmcQRY0LpR2fiq5WWS+pVP+X0nlXH/ZdPQYl+v+pg209eXxiLzjlUszrfMfuMW2asBwE/fTSp37L9DEYYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059
Received-SPF: permerror client-ip=2a01:111:f400:7eaa::62a;
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

SGkgSmFzb24sDQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4g
U2VudDogTW9uZGF5LCBEZWNlbWJlciA1LCAyMDIyIDEwOjI1IFBNDQoNCj4gDQo+IEEgZHVtYiBx
dWVzdGlvbiwgYW55IHJlYXNvbiB3ZSBuZWVkIGJvdGhlciB3aXRoIHZpcnRpby1uZXQ/IEl0IGxv
b2tzIHRvIG1lIGl0J3MNCj4gbm90IGEgbXVzdCBhbmQgd291bGQgY29tcGxpY2F0ZSBtaWdyYXRp
b24gY29tcGF0aWJpbGl0eS4NCg0KVmlydGlvIG5ldCB2ZHBhIGRldmljZSBpcyBwcm9jZXNzaW5n
IHRoZSBkZXNjcmlwdG9ycyBvdXQgb2Ygb3JkZXIuDQpUaGlzIHZkcGEgZGV2aWNlIGRvZXNu4oCZ
dCBvZmZlciBJTl9PUkRFUiBmbGFnLg0KDQpBbmQgd2hlbiBhIFZRIGlzIHN1c3BlbmRlZCBpdCBj
YW5ub3QgY29tcGxldGUgdGhlc2UgZGVzY3JpcHRvcnMgYXMgc29tZSBkdW1teSB6ZXJvIGxlbmd0
aCBjb21wbGV0aW9ucy4NClRoZSBndWVzdCBWTSBpcyBmbG9vZGVkIHdpdGggWzFdLg0KDQpTbyBp
dCBpcyBuZWVkZWQgZm9yIHRoZSBkZXZpY2VzIHRoYXQgZG9lc27igJl0IG9mZmVyIElOX09SREVS
IGZlYXR1cmUuDQoNClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL25ldC92aXJ0aW9fbmV0LmM/
aD12Ni4yLXJjMyNuMTI1Mg0KDQo=

