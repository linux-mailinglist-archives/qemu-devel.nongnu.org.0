Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DE9432F4B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:23:59 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjTa-0003iV-IX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcjRG-0000qc-JD; Tue, 19 Oct 2021 03:21:34 -0400
Received: from mail-dm6nam11on2047.outbound.protection.outlook.com
 ([40.107.223.47]:43105 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mcjR9-00013V-Rd; Tue, 19 Oct 2021 03:21:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zq6RiDmbHNIjpyuYP8jMnOzCRq+ziHl38KrPG6E4S+IZMlvwjukQgY7iO4wF/Ym8fX5ghNcNb9tWw56SEf+2QgFmVen9jf9HEdrMs6E9eSGWjppIEHVIjgFVHsz+lGQuYGiWJGzHQ9bLWVicY/bzl+FWyr0iH9frP+9709FIOw4xmlZ4zhyjj0bvIcIH+yT5ff1DjpRTXQDg9chBJrOnTd1AcFcr6gZ2ltIJ6aj3gasevXTdueAzlhrh4Y2M9oz/v6jIXupOcMQLqWtHC54fbtTLK37TdIUnnEWbAZehf7sQBwB6dA871GA2sUyXh/TW1UgZpbgQjaPK6z792MFDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jicZZ5Vm7ZHOGGDvSbXw4JnPmobC2+36gvF5vZAU44k=;
 b=cIYHhsl2LM6bZe1u0X29ffEzT+HiYaLfTRPy3uyWbal2EOc9OzB0A6QURKwlxW37tTFUOA351nRSAmF5nGK/pJn+bnLx4TcEac4SluSUC7iFg1lxXRpej6bmmLQVvKOVxWb3gL2XHkfNnyRLeVjSJ3ZG8OkMeFbQGhcb4Ttv9EOHPwzYLH7wtwifPVj5ufUNtSVTk2c3Jnlw5DJHPdun9N6QOAYROalG3ke0yj+toEALB8GwHw0nLaaTv+w4KE5MF7U67YJ3Z+Qm9TaoLBvCysag7kbmtuANOwCCrbAmdUYfVMHq78RvQAAeqhoEVk3hSh6DA+xcrhvbPKo5xpO/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jicZZ5Vm7ZHOGGDvSbXw4JnPmobC2+36gvF5vZAU44k=;
 b=jvKLh1F/QXOBCiwj1NrD7YbN9yGeeqnGXjWNkaCCEW3okAiV/QFHuBYdntIfAuM05yl4VUjsmqMgmeNowp0nuUoie3r3ClyIMZhugCVF4mjsb+eJUg9+H+rUi98oP5WpxILf2FgrIj5BXYkqiOnovcASJ1PXXUmLIm7NGM6z3+J6yqja2VjM7oKfUoWn6M68JDO0ZZ3fd3kYaQPYJe+NobeLygWjjVnAtqNzHmHa4XOQeEhyQ3XVHYK206NqwjJ2rM8aExqXLrMA8EPAcpFlPSB2DMmHsZzKiNvED79/j7n1T/Hp27bIPqMqp2WOcVA44X6UKo2rrDfGumE5rIbXnQ==
Received: from DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39a::17)
 by DM8PR12MB5464.namprd12.prod.outlook.com (2603:10b6:8:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 07:21:24 +0000
Received: from DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25]) by DM4PR12MB5373.namprd12.prod.outlook.com
 ([fe80::584f:672a:653f:fe25%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 07:21:24 +0000
From: "Xueming(Steven) Li" <xuemingl@nvidia.com>
To: "mst@redhat.com" <mst@redhat.com>
CC: "zhangyuwei.9149@bytedance.com" <zhangyuwei.9149@bytedance.com>,
 "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-stable@nongnu.org"
 <qemu-stable@nongnu.org>, "tiwei.bie@intel.com" <tiwei.bie@intel.com>
Subject: Re: [PATCH v3 2/2] vhost-user: remove VirtQ notifier restore
Thread-Topic: [PATCH v3 2/2] vhost-user: remove VirtQ notifier restore
Thread-Index: AQHXvBpUsD17GzANq0yCE2CwBSg326vZ720AgAAMOoA=
Date: Tue, 19 Oct 2021 07:21:24 +0000
Message-ID: <1e58a3d2b8cfd9b802e5e9422598a9217f306ee9.camel@nvidia.com>
References: <20211008075805.589644-1-xuemingl@nvidia.com>
 <20211008075805.589644-3-xuemingl@nvidia.com>
 <20211019022100-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019022100-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 773a472a-e876-4b93-8727-08d992d10ec9
x-ms-traffictypediagnostic: DM8PR12MB5464:
x-microsoft-antispam-prvs: <DM8PR12MB546495577A697C00822C663CA1BD9@DM8PR12MB5464.namprd12.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CPpxxQcpCyYBB2C3+i+RJWMV8p8LPZAspvqUamEby+fUAKbYzIQjX8sZfisca+c5dnxdyXIPv5PNuU/qWbtQ+eaPe68GPxOnxUAW8ykZvMo0v5oUZ064ibXOrGyVQSnUAf3sgDNAqP1nBIOhVmsH7GX6AlNaLozt02mA4uau/YcAxCOTXJeFYNW+Tw1Z45QandxMrxsMnTerM4NQ88KSwlwW1VmOkZJpianu9991emxc+IuMyQzw9+JMOuCXcMX46WHbOnBSgmNTYxmJJ232YwG9HATSUxzpsrIuf/VXaEgY2lUbsk/hLPLaccloS9M/xQtfihFf+tCrXfADjWuCeNJSjxrwMofoCzXlTFEU2NhhkzVWGXcAhsma1DKvjn0zJ0h/VRiFd7BV9G/QF1lf1y/il5rDjFOXGEV2ChO/nwzMBGsmPqJiV5dI3LdN3HQYEqFdgW6rt1BTVIEPNhgWhi8Sov3/pa6WbdIxED/cd7C8gNj4CqpB4G5I1m1+N+drQ6hBXKEmUFJnWIRirTCRfh2iM00N9G0YWureUdzWL7lGYDjj8HIsSsVsfxnQ2KuPchbOMmgOxqoQavI4qjPKu8v8W2ZqdIgm/QcMCmuPITssrqFDw9lzj+1bVhPJ0x1M9WdiyQiFBV+wfT0yrzqQRStoMDl1ySjf3A1nrdixqnL047w8etZ4TD38ceRfmhecdQjbMeM+Hw9SGQ9idMb53A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5373.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(8676002)(508600001)(6506007)(122000001)(66476007)(66556008)(66446008)(4001150100001)(5660300002)(186003)(6486002)(6916009)(38100700002)(6512007)(64756008)(71200400001)(86362001)(36756003)(2616005)(76116006)(54906003)(316002)(91956017)(83380400001)(2906002)(38070700005)(66946007)(4326008)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlJuUEFhcHoxdjhwTHppYkxiY0JqSFRrRHRQUXduTGc0NGI5aFVqaG9yWjBs?=
 =?utf-8?B?S2pTYXYySHBTS082alVrSTk0OVF4V1lXTmRJa0JWMVR2WWRGMFBzUHpaZEVh?=
 =?utf-8?B?dWJtUWtOZjZMVEhjczhXd05hcXZJcXIrUXRESERlaUNMNG1IeFRNRmN3d0FK?=
 =?utf-8?B?WFd0REhNNWZkdTFkMHo3aXA4YnQ5Q2plUXQzTm9jWWh2dkd0ZXhzcWEwTVBN?=
 =?utf-8?B?L1U2MGdTZDE0YytyR2JqbDltanRDbngwTTV3L0VpangvY2xCWm1UbTBnV0tR?=
 =?utf-8?B?RElsMTVEc3ZOSk52ME9DR1htQXRyQkFvRmorTG9NNmZuYUIzeHVZOXJJbnFZ?=
 =?utf-8?B?SmhUanBwZmYyaGNwTFlXYTBkMitDS0padE5JRGZ3QkxhaW9sTWFYNUdmdldp?=
 =?utf-8?B?S0hpdU8wNmRiMUoyZVZvMEFqZVRTZGFzMTlnaitYdVVuNmVvdXRoK2FBUzU1?=
 =?utf-8?B?OWUvc2J4dWRVZE5BYTF6LzdPc1pHT3FSMllFMTlkYUpWeVMyZEcrMnU1ZkpM?=
 =?utf-8?B?RnI4RVNVSE9NS21aQjJLNFNzQlBoQTZ0N0d5blVYQzlkOWdHUzRoSnk2dmcv?=
 =?utf-8?B?amEwL3h3bVFVMXJQU0p3dmliNHhhRnV6STBwOU13MTIrcEhWSGw4aWVqSnNx?=
 =?utf-8?B?QnBMY3pjUEpaL05wSUkya3hmOStNRlpBWGo5WkRIQ3dqMEhzd1U4eEhMMVAw?=
 =?utf-8?B?d2hFZ01GUXNkay9hU3RFY0N3eEtvcndoYnpLUit6RCtMMEtZQXN2Znlwc1VK?=
 =?utf-8?B?Sk4yeXNHNXJYS2drMXlibGJuWXNzVzVLRnlTVGdqWlc1K1pEM2JUbGl2YlJ6?=
 =?utf-8?B?Vjd4d0NJWEFGVjBzU3BvZWlLcE0zZFMzZlFPUlZWOVJCcU9MeStBVUxsV0JD?=
 =?utf-8?B?SEUyOG1Pb0xrLy9VNDJRZ2cxak5DTVJSaEExRmRwNkpHL1JOR0hPTElubWFY?=
 =?utf-8?B?NXA2YkZWcktIMjJLWE1iZ09JM003T3diSm9NdUJ6QUFwVGxhSFh4dEdodld2?=
 =?utf-8?B?OUZYSnhPdElkSGJLc09SWWJ5dHJQUEQ5REs1Q2k1Umk5VUQwSzdzc3JucURw?=
 =?utf-8?B?anN1dnRyVGREWVRtc0U4ZDR0UytzTE91WjFGYStXZTdzalVieFZ3Zm9SaFdn?=
 =?utf-8?B?Qzg0SllPcjNRMkQ5M3JEZjBaakQyREZvRThTKzRUKzVUQ2kvLzFtaTVZVFE4?=
 =?utf-8?B?blRDZGRMTVRiYXlISlViSWNxYTFESjMxSnlvZTRhOVk1UVUwWXVEcmFISjk1?=
 =?utf-8?B?WWpWckdnTCswUWRLRG1Lejl1VnhucnQvYS9aQ2lVc2NNbkl6STAxV2ppbWty?=
 =?utf-8?B?Y3gxVElZeGU2cCthdzhMejR3YkRFTjF3YkZDQjlxNE5sSjZWS3dkbnU0Zkp5?=
 =?utf-8?B?T09uaHlUejlIbloxdTVGenBMTUVSQWlJNWxSRUh6T2RONDZQckhLbXk2YjBu?=
 =?utf-8?B?MzRLQW5nUVdadFFRVDYxQ1paYXl6cWY2OW91SDhJVVJoU3oxNTVqTm84NGhK?=
 =?utf-8?B?OUh3TFBlL3B2TTdsUHB3bUF2R1JnaFNhN3RnRG5QT3hqZEhsaElNME9pdGl2?=
 =?utf-8?B?ck40cUkwbWp6bnI3czU2L1I3cEtXVFZmdXBjWlI3aE1JQlVRSlNiQ1FIWk10?=
 =?utf-8?B?WmRPUlpWd1BDL0hFalRjUXZwTWt1WHlTWXZyRnVkUzNlSzRocHVIUzkxVkh5?=
 =?utf-8?B?bEtUL21NS2M4Vjl6VjFMeC9MUUUzdlRyNS9EWU5PWWUxYllCMm5aMm0reEFI?=
 =?utf-8?B?VmVBcFNRY3NpakFlbVJoUmswSXJSaVZnMWpoY2hXeVJrcG0xYWgydTNnSW9t?=
 =?utf-8?B?eDZEQnFCRnR3NUgwaHFDUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFD8CAC949D41D4EB22199DBA50108D8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773a472a-e876-4b93-8727-08d992d10ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 07:21:24.2389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KhjbP3ZlsG3b2JWvHyarvSXdju03n2OIv2w7SQ3UzwjuVyt4pUA1UmyUbwL9JWAsJ7AOsz3n9A6Pp7YlYEGK6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5464
Received-SPF: softfail client-ip=40.107.223.47;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCAyMDIxLTEwLTE5IGF0IDAyOjM3IC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6DQo+IE9uIEZyaSwgT2N0IDA4LCAyMDIxIGF0IDAzOjU4OjA1UE0gKzA4MDAsIFh1ZW1pbmcg
TGkgd3JvdGU6DQo+ID4gV2hlbiB2aG9zdC11c2VyIHZkcGEgY2xpZW50IHJlc3RhcnQsIFZRIG5v
dGlmaWVyIHJlc291cmNlcyBiZWNvbWUNCj4gPiBpbnZhbGlkLCBubyBuZWVkIHRvIGtlZXAgbW1h
cCwgdmRwYSBjbGllbnQgd2lsbCBzZXQgVlEgbm90aWZpZXIgYWZ0ZXINCj4gPiByZWNvbm5lY3Qu
DQo+ID4gDQo+ID4gUmVtb3ZlcyBWUSBub3RpZmllciByZXN0b3JlIGFuZCByZWxhdGVkIGZsYWdz
Lg0KPiA+IA0KPiA+IEZpeGVzOiA0NDg2NjUyMWJkNmUgKCJ2aG9zdC11c2VyOiBzdXBwb3J0IHJl
Z2lzdGVyaW5nIGV4dGVybmFsIGhvc3Qgbm90aWZpZXJzIikNCj4gPiBDYzogdGl3ZWkuYmllQGlu
dGVsLmNvbQ0KPiA+IENjOiBxZW11LXN0YWJsZUBub25nbnUub3JnDQo+ID4gQ2M6IFl1d2VpIFpo
YW5nIDx6aGFuZ3l1d2VpLjkxNDlAYnl0ZWRhbmNlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBY
dWVtaW5nIExpIDx4dWVtaW5nbEBudmlkaWEuY29tPg0KPiANCj4gUGxzIGZpeCB1cCBiaXNlY3Qg
YW5kIHJlcG9zdC4NCj4gQWxzbywgY2FuIHlvdSBwbGVhc2UgY2xhcmlmeSB3aGF0IGRvZXMgIm5v
IG5lZWQiIG1lYW4/DQoNCm1tYXAgYmVjb21lcyBpbnZhbGlkLCBuZWVkIHRvIHVubWFwIGl0Lg0K
DQo+IFlvdSBpbmNsdWRlIGEgRml4ZXMgdGFnIGJ1dCBpcyB0aGVyZSBhIGJ1Zz8gV2hhdCBiZWhh
dmlvdXINCj4gYXJlIHlvdSB0cnlpbmcgdG8gZml4PyBBIHJlc291cmNlIGxlYWs/DQo+IE9yIGFy
ZSB5b3UganVzdCBzaW1wbGlmeWluZyBjb2RlPw0KPiBJZiB0aGUgbGF0ZXIgdGhlbiBubyBuZWVk
IGZvciBhIEZpeGVzIHRhZy4NCg0KWWVzLCBqdXN0IHNpbXBsaWZ5aW5nIGNvZGUsIHdpbGwgcmVt
b3ZlIGl0Lg0KDQo+IA0KPiANCj4gDQo+IA0KPiA+IC0tLQ0KPiA+ICBody92aXJ0aW8vdmhvc3Qt
dXNlci5jICAgICAgICAgfCAyMCArKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICBpbmNsdWRlL2h3
L3ZpcnRpby92aG9zdC11c2VyLmggfCAgMSAtDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaHcvdmly
dGlvL3Zob3N0LXVzZXIuYyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gPiBpbmRleCBiMmU5
NDhiZGM3Li5kMTI3YWE0NzhhIDEwMDY0NA0KPiA+IC0tLSBhL2h3L3ZpcnRpby92aG9zdC11c2Vy
LmMNCj4gPiArKysgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jDQo+ID4gQEAgLTIyLDYgKzIyLDcg
QEANCj4gPiAgI2luY2x1ZGUgInFlbXUvbWFpbi1sb29wLmgiDQo+ID4gICNpbmNsdWRlICJxZW11
L3NvY2tldHMuaCINCj4gPiAgI2luY2x1ZGUgInN5c2VtdS9jcnlwdG9kZXYuaCINCj4gPiArI2lu
Y2x1ZGUgInN5c2VtdS9jcHVzLmgiDQo+ID4gICNpbmNsdWRlICJtaWdyYXRpb24vbWlncmF0aW9u
LmgiDQo+ID4gICNpbmNsdWRlICJtaWdyYXRpb24vcG9zdGNvcHktcmFtLmgiDQo+ID4gICNpbmNs
dWRlICJ0cmFjZS5oIg0KPiA+IEBAIC0xMTQzLDE5ICsxMTQ0LDYgQEAgc3RhdGljIGludCB2aG9z
dF91c2VyX3NldF92cmluZ19udW0oc3RydWN0IHZob3N0X2RldiAqZGV2LA0KPiA+ICAgICAgcmV0
dXJuIHZob3N0X3NldF92cmluZyhkZXYsIFZIT1NUX1VTRVJfU0VUX1ZSSU5HX05VTSwgcmluZyk7
DQo+ID4gIH0NCj4gPiAgDQo+ID4gLXN0YXRpYyB2b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmll
cl9yZXN0b3JlKHN0cnVjdCB2aG9zdF9kZXYgKmRldiwNCj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHF1ZXVlX2lkeCkNCj4gPiAtew0KPiA+IC0g
ICAgc3RydWN0IHZob3N0X3VzZXIgKnUgPSBkZXYtPm9wYXF1ZTsNCj4gPiAtICAgIFZob3N0VXNl
ckhvc3ROb3RpZmllciAqbiA9ICZ1LT51c2VyLT5ub3RpZmllcltxdWV1ZV9pZHhdOw0KPiA+IC0g
ICAgVmlydElPRGV2aWNlICp2ZGV2ID0gZGV2LT52ZGV2Ow0KPiA+IC0NCj4gPiAtICAgIGlmIChu
LT5hZGRyICYmICFuLT5zZXQpIHsNCj4gPiAtICAgICAgICB2aXJ0aW9fcXVldWVfc2V0X2hvc3Rf
bm90aWZpZXJfbXIodmRldiwgcXVldWVfaWR4LCAmbi0+bXIsIHRydWUpOw0KPiA+IC0gICAgICAg
IG4tPnNldCA9IHRydWU7DQo+ID4gLSAgICB9DQo+ID4gLX0NCj4gPiAtDQo+ID4gIHN0YXRpYyB2
b2lkIHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUoc3RydWN0IHZob3N0X2RldiAqZGV2
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBx
dWV1ZV9pZHgpDQo+ID4gIHsNCj4gPiBAQCAtMTE2Myw3ICsxMTUxLDcgQEAgc3RhdGljIHZvaWQg
dmhvc3RfdXNlcl9ob3N0X25vdGlmaWVyX3JlbW92ZShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsDQo+
ID4gICAgICBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgKm4gPSAmdS0+dXNlci0+bm90aWZpZXJbcXVl
dWVfaWR4XTsNCj4gPiAgICAgIFZpcnRJT0RldmljZSAqdmRldiA9IGRldi0+dmRldjsNCj4gPiAg
DQo+ID4gLSAgICBpZiAobi0+YWRkciAmJiBuLT5zZXQpIHsNCj4gPiArICAgIGlmIChuLT5hZGRy
KSB7DQo+ID4gICAgICAgICAgdmlydGlvX3F1ZXVlX3NldF9ob3N0X25vdGlmaWVyX21yKHZkZXYs
IHF1ZXVlX2lkeCwgJm4tPm1yLCBmYWxzZSk7DQo+ID4gICAgICAgICAgaWYgKCFxZW11X2luX3Zj
cHVfdGhyZWFkKCkpIHsgLyogQXZvaWQgdkNQVSBkZWFkIGxvY2suICovDQo+ID4gICAgICAgICAg
ICAgIC8qIFdhaXQgZm9yIFZNIHRocmVhZHMgYWNjZXNzaW5nIG9sZCBmbGF0dmlldyB3aGljaCBj
b250YWlucyBub3RpZmllci4gKi8NCj4gPiBAQCAtMTE3MSwxNSArMTE1OSwxMiBAQCBzdGF0aWMg
dm9pZCB2aG9zdF91c2VyX2hvc3Rfbm90aWZpZXJfcmVtb3ZlKHN0cnVjdCB2aG9zdF9kZXYgKmRl
diwNCj4gPiAgICAgICAgICB9DQo+ID4gICAgICAgICAgbXVubWFwKG4tPmFkZHIsIHFlbXVfcmVh
bF9ob3N0X3BhZ2Vfc2l6ZSk7DQo+ID4gICAgICAgICAgbi0+YWRkciA9IE5VTEw7DQo+ID4gLSAg
ICAgICAgbi0+c2V0ID0gZmFsc2U7DQo+ID4gICAgICB9DQo+ID4gIH0NCj4gPiAgDQo+ID4gIHN0
YXRpYyBpbnQgdmhvc3RfdXNlcl9zZXRfdnJpbmdfYmFzZShzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdmhvc3Rf
dnJpbmdfc3RhdGUgKnJpbmcpDQo+ID4gIHsNCj4gPiAtICAgIHZob3N0X3VzZXJfaG9zdF9ub3Rp
Zmllcl9yZXN0b3JlKGRldiwgcmluZy0+aW5kZXgpOw0KPiA+IC0NCj4gPiAgICAgIHJldHVybiB2
aG9zdF9zZXRfdnJpbmcoZGV2LCBWSE9TVF9VU0VSX1NFVF9WUklOR19CQVNFLCByaW5nKTsNCj4g
PiAgfQ0KPiA+ICANCj4gPiBAQCAtMTUzOSw3ICsxNTI0LDYgQEAgc3RhdGljIGludCB2aG9zdF91
c2VyX3NsYXZlX2hhbmRsZV92cmluZ19ob3N0X25vdGlmaWVyKHN0cnVjdCB2aG9zdF9kZXYgKmRl
diwNCj4gPiAgICAgIH0NCj4gPiAgDQo+ID4gICAgICBuLT5hZGRyID0gYWRkcjsNCj4gPiAtICAg
IG4tPnNldCA9IHRydWU7DQo+ID4gIA0KPiA+ICAgICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92aXJ0aW8vdmhvc3QtdXNlci5oIGIvaW5jbHVkZS9ody92
aXJ0aW8vdmhvc3QtdXNlci5oDQo+ID4gaW5kZXggYTlhYmNhMzI4OC4uZjYwMTJiMjA3OCAxMDA2
NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLmgNCj4gPiArKysgYi9p
bmNsdWRlL2h3L3ZpcnRpby92aG9zdC11c2VyLmgNCj4gPiBAQCAtMTQsNyArMTQsNiBAQA0KPiA+
ICB0eXBlZGVmIHN0cnVjdCBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgew0KPiA+ICAgICAgTWVtb3J5
UmVnaW9uIG1yOw0KPiA+ICAgICAgdm9pZCAqYWRkcjsNCj4gPiAtICAgIGJvb2wgc2V0Ow0KPiA+
ICB9IFZob3N0VXNlckhvc3ROb3RpZmllcjsNCj4gPiAgDQo+ID4gIHR5cGVkZWYgc3RydWN0IFZo
b3N0VXNlclN0YXRlIHsNCj4gPiAtLSANCj4gPiAyLjMzLjANCj4gDQoNCg==

