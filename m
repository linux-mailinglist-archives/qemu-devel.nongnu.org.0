Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ED8526940
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:28:22 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npa1V-0007af-Jc
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1npZz9-0004sw-67
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:25:55 -0400
Received: from mail-mw2nam10on20625.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::625]:43553
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1npZz5-0001gG-0Z
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:25:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7BWKEvdI9omtZiXBWch6+QU7ccRkl2Xc7NNvo0XXCU6EVcsSG45hjd4mC3U/TYya8oWzglvB1XZ2EQWT4f/9VgJidwTBTOcyRKSGVkMtV3cC4GrIp5QktTk7SmdYHCaweKP93UtIxARnGwTmlgPswGArSA8UeZ2pPFjD1eG0epgP7wINHXsnukBQqnkkJuAQDk4BqcUsvJn1myPPldVOPeeoZQAe2pRmy17Tmjg4VxnFfsOQGeBkqR6/6F13/niYQdfC4OeOvNXZVEDhdhUHENasZ24cDaWSVMskhRHQN+l3Csvj+4GzyNJwJ9jXUrrOtYzdziGrEyAhtKHzpuTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGyMBFkWpaQunby1CfFNDkXXg3Kh3XocyctvmC6Iwo4=;
 b=MFdDRDI7ucXlXw9q2w5208MJDefGCPlheplULEDOYYq1rtpiZNySZqvOTd0GOeqi4VEZXE4a69Pq071wIoxeU++uav5qNOulpqp0mj0aYGnChijkbAGAz3F22dE/IDhulhWbyo9oB7sHJZDiJqBWFEbnV5tq/IZv0gEpWlY+P8r8gPKUyfviOVQaTF2xLuqACggYlCtohFxRWXItqRsXqckhBmn/0Bw+VynSAzcf9z2RSXtVRKMEK0nISaW/Wp+S976sNm+SocEIdfyNF1rLe/rI+x+byYCKxC6jF4YZz/OhY2AZP7rFlkED3d7RndxvS/8KHwzC2FquTWe6mFm2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGyMBFkWpaQunby1CfFNDkXXg3Kh3XocyctvmC6Iwo4=;
 b=n8bL3/LbMpzXp7QyYUONnzT4JdBdVDL8GT0yGBvoSEflhb8Y/r1AEpEVEz1QsrZppgOKhoO1bg0PsZGMPq+IwNKnmqSQd8MSVVnofejLm0C4RW+kEUHNGjaIFmMleeI9p7XmKb5lt2aWW2eoHELMIKXSk8KBBIi4oE+Li6/skwQ7zyI6nU/8uOgvjX4iU1bCjIuYyByoUElZx3v9nmn5OgU8gKTfYwWpkD8AjojSSAvyV7789t1QZ53bF8A0NcuuO2AH2cxht9as2LBXA37pOZeCgnZrZ9v8wRQcxguEMwUERMbj9TYhikHP67+UjX8TrOGCmfgaiK0s71iCtQbqcw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by MN2PR12MB3117.namprd12.prod.outlook.com (2603:10b6:208:d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 18:25:45 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854%3]) with mapi id 15.20.5250.016; Fri, 13 May 2022
 18:25:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: Gautam Dawar <gdawar@xilinx.com>, Eugenio Perez Martin
 <eperezma@redhat.com>, virtualization
 <virtualization@lists.linux-foundation.org>, qemu-level
 <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, Cindy Lu
 <lulu@redhat.com>, "virtio-networking@redhat.com"
 <virtio-networking@redhat.com>, Eli Cohen <elic@nvidia.com>, Laurent Vivier
 <lvivier@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: RE: About restoring the state in vhost-vdpa device
Thread-Topic: About restoring the state in vhost-vdpa device
Thread-Index: AQHYZW+JxbBQ1h+RIkS7iyhFOVHKbK0c5lPggAAyGwCAAAYJcA==
Date: Fri, 13 May 2022 18:25:45 +0000
Message-ID: <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
 <PH0PR12MB5481AF0B02B0FB00885FF2AEDCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75dd7c0d-e6c8-452c-f3ff-08da350dfef4
x-ms-traffictypediagnostic: MN2PR12MB3117:EE_
x-microsoft-antispam-prvs: <MN2PR12MB3117F12683898413B5D8EEEFDCCA9@MN2PR12MB3117.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n7bG59kjT9B7qcaEUsfO1MaqgY8coYY6aVni47DY+WDEW3obHI/VekHRWP+x2Ke7oQp/rgnFdyNfvD3QzPWVxWvrlfjDDIwvYI4dvrAOBCXhKm9Jj7nDY83nG+WOdkqWk+Oj7k3CSG2SCJxnP6VdrPboDs4iyAD77im5PKqnb4VmKA70oC5JYtVG2St7K/6abRKlE9Evxm5XRXgOJdFZzkW1LZROVeBvpbrFWOrfVV92DdNNlFeyOnRaxl9se0guDq8OHPrUy87sPHrfzZzN36XiyuCBr7z++rG/wDDspm/Ctx2q0U/91trSGMGtmM91R55f75MPWS0n8+2itQ5VBw4iaJhyDu94uPpzPEuZ3SMuEVMOeZwmDWvxxDfWkzWA3NSfZ1mYwNhMDFsGV4tl5vUNVWE6k6y9NoFbFw7Ce3rg4RqjV3cEGY9x2BXu/tz85vAKzOn/ZaGXqoCtiovaasGg7lIuzKIBNpAZEhu9cONGsX1g+l3/XVNbxyl+gBk9dMWBoQ5rN7Dphslu0Sw+dOF4qu2g73IAXy/n6mHkuDzH2WLJlLbHmuqjQlFC3IVibFUQnKqY1PMvfh5HZYjt+5XX8eu8R+pc/fzIQOuEd0RjxyvU7Dw6MwBnXXpL9Mjh2YK1BOeB7g+CjOewne8TiNL2zD/MlXfHruULag3MKomLe4JRPSYOEJ675npAFq4Cl1/3y7gnxnYLnRhz+uY4vzHaPc1IKm4+EF0LGI/O+M0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(8676002)(76116006)(66946007)(5660300002)(66556008)(66446008)(66476007)(64756008)(83380400001)(316002)(52536014)(8936002)(71200400001)(110136005)(508600001)(55016003)(2906002)(9686003)(6506007)(122000001)(38100700002)(7696005)(38070700005)(86362001)(186003)(921005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVhLWGNxM2xMSklXN0QzeTJxMHVZTUtYcEJFdUw2VVVzZlN6QkRSVm93ZnFw?=
 =?utf-8?B?d01iOFA4QUo2WUlCWFFoV09UVHJ3dVY2NTZRRnpFL0xCamNUTkZxQm1hNkl2?=
 =?utf-8?B?YktMYVgvTWpYMWozdFI1UnRJSjlwRHZwc05OcEt6OXJXK2Y1dy9PVUx6VU0w?=
 =?utf-8?B?SzJyNXNHbW9yYi90ZDhpWWZsYjIvVjNEb1ZLVHBRVjZVVFllVGJXNXJERjVj?=
 =?utf-8?B?SktkZnQ1TENTUk5IN0JsSXo2bTUxMHBaVFNjNVBGbEI0UGN3K2haUW1iQ3Zi?=
 =?utf-8?B?eENCOUduMDdEdUkxbWVmWkFSYzBLRkhYcWNPVk9OTjFQNmdBL0JvNWhSTXRj?=
 =?utf-8?B?eFdJNm9kME1JblBvditXVnpiY2NOd0FHZy9yaGx3SE44OW9FQ1hrZFIxU2JF?=
 =?utf-8?B?Zk1TdWdRY0ZoVVJUNmg1WkF6NnNjU3FsZGtIL3BiT3htSFd3S3M1V2h5d3Bv?=
 =?utf-8?B?czhjdHB4ZURoWkVIU3QyRUpEdWhidWtLeVBzM2RLR1ZJQWFBV0c0L2NJRFB2?=
 =?utf-8?B?OXpCck9ReUJ4NU5JcGp4a09NbWxrNVRmL1BvZVZjVVY1MkVZMXdMWUtyOG1J?=
 =?utf-8?B?ZW14SEViOGpyMDh6dHozRENzYmltVlpLaDBWQ1BLVmFST0xlVExuS200R1kr?=
 =?utf-8?B?TEs1cktCUFNDSVlPY0xPcVh0WXFlemtESFhocEJRejAyL3RPaERXY0ZocFln?=
 =?utf-8?B?aTdlTUFXM2cvcDFNaTBsck9ZbjMwMDdUb0JTQ3BNM2tzZHRYZ2g0S242aHBs?=
 =?utf-8?B?WWRCVDVvUGIvVDlIUG56ZExWQXpLcGRyMmh1TUlOeHRnbVJScEErNTlEZEZK?=
 =?utf-8?B?Um5Mb3VYd2QzNUovNkRtVitMSHQ3d2N4bzd5ZE5jaXJDL1BTcGY2RWkxUDkv?=
 =?utf-8?B?N0Vwa09ob1N6SytPbFFFTnlENnM3ZW1kTFdndlJpdHJPOVMzb2F2cjRZckE2?=
 =?utf-8?B?UmZtUG5HbXJ3QXNaUjFmWml4Z0lDdHFtb0t4YnhtcHBIVnI2cGhmTC9DbGVF?=
 =?utf-8?B?eG9qaFBVOVB1djVKUThoWEZKNU10NDlmOG1xZmd2WXRnUW44VHRtdy93MVV0?=
 =?utf-8?B?WjBrM2xGdDd5N2NZY3A0TzkwczZ0c3RFblUyek04SEZ3dEJVbzZJSXBtZERY?=
 =?utf-8?B?RUZhUzc1SThNbUI4NzdNMUdvTjBNa2NIMS9Fa3FaSWIrc3pkeWVHTUI4TXZ3?=
 =?utf-8?B?aFo2NmpSaWU1eEJJakZia0ZqbCswSHlyMWhMd1FvZGRFZDRjOGdESCtVajNB?=
 =?utf-8?B?M0VBL2V0aTR6NEI1OVZJZVp4bTgvVjkxNlozei8vNjdSOHVPZzF2ZGRDTlBq?=
 =?utf-8?B?cFJGTStMeFNZd1ZYem9ERUUyWDdiYjNDMDFoSE5XTDExUjNOZ2drWEJEaG04?=
 =?utf-8?B?anFHRHJPWDlWZFR3NkdSZ1BjZit1aDJ6MHlNZC9EVGJYMXhsWnBHMk01YVBm?=
 =?utf-8?B?UVlpTzVURFJsdDlnc1JaREUrUXI1TVNpTEpxNEFxcVZIOEt6SUllaEdWaCtO?=
 =?utf-8?B?VFdhcFJoSWFOYlNOWXFTYTBhT2lCeDJlQ3d3UDBXc20xU012OTdKT2pKOStX?=
 =?utf-8?B?cFQ5QUlrakJHbllyQ1Q0eXdVaG9tREtXNE92U0lpSVBrZllDeDZoTVhiNjdq?=
 =?utf-8?B?cHBCT0ZodW1ibDVha1lZZmhwcVQ1c3k2dWdWalI3Yms0aWhIUklQVXdtbmx3?=
 =?utf-8?B?TzNxcENIOTRhcXdZY3RWZU9KbDUya2JJQ1NPSkNCdE9kYUNVd3dERGF1R3dp?=
 =?utf-8?B?UGZVSHRIRVZ5OEtITENhdTl0dmY0NEsyU1V4c3FSR1dwaCtwY1ZVTVllU0hC?=
 =?utf-8?B?N0kyK29xWEl5YThNYy9Cc1VLL2hHQkdnYUR2SkRWY0VlS1ZaZEJVOW1abU1q?=
 =?utf-8?B?WTdXTCs4VWdPeTg1dEF3eHdPQTA2ZGVUbXNXdEh0MDB0RkRheGhUczJYWVAw?=
 =?utf-8?B?c3YwdVRjVjZPRW8vVmJaZFdDSW1ndkc1ZTlFTmtpazRGYUlFZlA3ekYxSks1?=
 =?utf-8?B?Q0RybTJ3dnI2V1dtQWxOUXZ1a1RjM1ArNi9TNkNpclZ5V2Fuamtzb3ZFc0hm?=
 =?utf-8?B?T1A1VDI0V1VmbitpZHdmZTBQb201dm9LRm5BYnZUYm13ZmR4TVBZaGl2UjRZ?=
 =?utf-8?B?SXdwMjkzb0NlR08vSTJ2MlJvUDY4NUpRUVJMT1pDa3BlVGRoMytPYWFsZTB1?=
 =?utf-8?B?VzAwM2hqY2hyeThmYW4xemFJNWhPWXhkZjM0ejNVcGtZU3VNaWV6Qm9GTWg0?=
 =?utf-8?B?UFJsY0JTYVNTd1FjTGdScVp3ejZHL0ZpRXFhUFhrTmg1ZFVhSEtvbStGMmR3?=
 =?utf-8?B?UTY4VHdjUDIzaUwvTmJURWR3RzRwWlIzSVNJa1l6emhyNHlqaGh2WmhCRUlQ?=
 =?utf-8?Q?fNUtk0jywSt4Q3dtaa28S8ZSCHmLcYKaHmRoC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dd7c0d-e6c8-452c-f3ff-08da350dfef4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 18:25:45.4035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFbBzS3hHffmPxGzUDnb8WvY9aWMMJv/igeRDp1n3eV88i9pj2HKtKyAzVnjerxdAwmCl656XdQPNJ6XCdW4ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3117
Received-SPF: softfail client-ip=2a01:111:f400:7e89::625;
 envelope-from=parav@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgR2F1dGFtLA0KDQpQbGVhc2UgZml4IHlvdXIgZW1haWwgY2xpZW50IHRvIGhhdmUgcmlnaHQg
cmVzcG9uc2UgZm9ybWF0Lg0KT3RoZXJ3aXNlLCBpdCB3aWxsIGJlIGNvbmZ1c2luZyBmb3IgdGhl
IHJlc3QgYW5kIHVzIHRvIGZvbGxvdyB0aGUgY29udmVyc2F0aW9uLg0KDQpNb3JlIGJlbG93Lg0K
DQo+IEZyb206IEdhdXRhbSBEYXdhciA8Z2Rhd2FyQHhpbGlueC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgTWF5IDEzLCAyMDIyIDE6NDggUE0NCg0KPiA+IE91ciBwcm9wb3NhbCBkaXZlcmdlIGluIHN0
ZXAgNzogSW5zdGVhZCBvZiBlbmFibGluZyAqYWxsKiB0aGUNCj4gPiB2aXJ0cXVldWVzLCBvbmx5
IGVuYWJsZSB0aGUgQ1ZRLg0KPiBKdXN0IHRvIGRvdWJsZSBjaGVjaywgVlEgMCBhbmQgMSBvZiB0
aGUgbmV0IGFyZSBhbHNvIG5vdCBlbmFibGVkLCBjb3JyZWN0Pw0KPiBbR0Q+Pl0gWWVzLCB0aGF0
J3MgbXkgdW5kZXJzdGFuZGluZyBhcyB3ZWxsLg0KPiANCj4gPiBBZnRlciB0aGF0LCBzZW5kIHRo
ZSBEUklWRVJfT0sgYW5kIHF1ZXVlIGFsbCB0aGUgY29udHJvbCBjb21tYW5kcyB0bw0KPiA+IHJl
c3RvcmUgdGhlIGRldmljZSBzdGF0dXMgKE1RLCBSU1MsIC4uLikuIE9uY2UgYWxsIG9mIHRoZW0g
aGF2ZSBiZWVuDQo+ID4gYWNrbm93bGVkZ2VkICgiZGV2aWNlIiwgb3IgZW11bGF0ZWQgY3ZxIGlu
IGhvc3QgdmRwYSBiYWNrZW5kIGRyaXZlciwNCj4gPiBoYXMgdXNlZCBhbGwgY3ZxIGJ1ZmZlcnMs
IGVuYWJsZSAoU0VUX1ZSSU5HX0VOQUJMRSwgc2V0X3ZxX3JlYWR5KSBhbGwNCj4gPiBvdGhlciBx
dWV1ZXMuDQo+ID4NCj4gV2hhdCBpcyBzcGVjaWFsIGFib3V0IGRvaW5nIERSSVZFUl9PSyBhbmQg
ZW5xdWV1aW5nIHRoZSBjb250cm9sDQo+IGNvbW1hbmRzPw0KPiBXaHkgb3RoZXIgY29uZmlndXJh
dGlvbiBjYW5ub3QgYmUgYXBwbGllZCBiZWZvcmUgRFJJVkVSX09LPw0KPiBbR0Q+Pl0gRm9yIHRo
ZSBkZXZpY2UgdG8gYmUgbGl2ZSAoYW5kIGFueSBxdWV1ZSB0byBiZSBhYmxlIHRvIHBhc3MgdHJh
ZmZpYyksDQo+IERSSVZFUl9PSyBpcyBhIG11c3QuIA0KVGhpcyBhcHBsaWVzIG9ubHkgdG8gdGhl
IHZkcGEgZGV2aWNlIGltcGxlbWVudGVkIG92ZXIgdmlydGlvIGRldmljZS4NCkZvciBzdWNoIHVz
ZSBjYXNlL2ltcGxlbWVudGF0aW9uIGFueXdheSBhIHByb3BlciB2aXJ0aW8gc3BlYyBleHRlbnNp
b24gaXMgbmVlZGVkIGZvciBpdCBiZSBlZmZpY2llbnQuDQpBbmQgd2hhdCB0aGF0IGhhcHBlbnMg
dGhpcyBzY2hlbWUgd2lsbCBzdGlsbCB3b3JrLg0KDQpPdGhlciB2ZHBhIGRldmljZXMgZG9lc27i
gJl0IGhhdmUgdG8gbGl2ZSB3aXRoIHRoaXMgbGltaXRhdGlvbiBhdCB0aGlzIG1vbWVudC4NCg0K
PiBTbywgYW55IGNvbmZpZ3VyYXRpb24gY2FuIGJlIHBhc3NlZCBvdmVyIHRoZSBDVlEgb25seQ0K
PiBhZnRlciBpdCBpcyBzdGFydGVkICh2cmluZyBjb25maWd1cmF0aW9uICsgRFJJVkVSX09LKS4g
Rm9yIGFuIGVtdWxhdGVkIHF1ZXVlLA0KPiBpZiB0aGUgb3JkZXIgaXMgcmV2ZXJzZWQsIEkgdGhp
bmsgdGhlIGVucXVldWVkIGNvbW1hbmRzIHdpbGwgcmVtYWluDQo+IGJ1ZmZlcmVkIGFuZCBkZXZp
Y2Ugc2hvdWxkIGJlIGFibGUgdG8gc2VydmljZSB0aGVtIHdoZW4gaXQgZ29lcyBsaXZlLg0KSSBs
aWtlbHkgZGlkbuKAmXQgdW5kZXJzdGFuZCB3aGF0IHlvdSBkZXNjcmliZSBhYm92ZS4NCg0KVnEg
YXZhaWwgaW5kZXggZXRjIGlzIHByb2dyYW1tZWQgYmVmb3JlIGRvaW5nIERSSVZFUl9PSyBhbnl3
YXkuDQoNClNlcXVlbmNlIGlzIHZlcnkgc3RyYWlnaHQgZm9yd2FyZCBhdCBkZXN0aW5hdGlvbiBm
cm9tIHVzZXIgdG8ga2VybmVsLg0KMS4gU2V0IGNvbmZpZyBzcGFjZSBmaWVsZHMgKHN1Y2ggYXMg
dmlydGlvX25ldF9jb25maWcvdmlydGlvX2Jsa19jb25maWcpLg0KMi4gU2V0IG90aGVyIGRldmlj
ZSBhdHRyaWJ1dGVzIChtYXggdnFzLCBjdXJyZW50IG51bSB2cXMpDQozLiBTZXQgbmV0IHNwZWNp
ZmljIGNvbmZpZyAoUlNTLCB2bGFuLCBtYWMgYW5kIG1vcmUgZmlsdGVycykNCjQuIFNldCBWUSBm
aWVsZHMgKGVuYWJsZSwgbXNpeCwgYWRkciwgYXZhaWwgaW5keCkNCjUuIFNldCBEUklWRVJfT0ss
IGRldmljZSByZXN1bWVzIGZyb20gd2hlcmUgaXQgbGVmdCBvZmYNCg0KU3RlcHMgIzEgdG8gIzQg
Y2FuIGJlIGRvbmUgbXVsdGlwbGUgdGltZXMgaW4gcHJlLXdhcm0gZGV2aWNlIHVwIGNhc2UgaW4g
ZnV0dXJlLg0KRm9yIG5vdywgdGhleSBjYW4gYmUgZG9uZSBvbmNlIHRvIGdldCB0aGluZ3Mgc3Rh
cnRlZC4NCg==

