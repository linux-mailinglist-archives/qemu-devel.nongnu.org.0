Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0C357756
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 00:09:08 +0200 (CEST)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUGMF-0001Mf-CI
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 18:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Xiongzi.Ge@netapp.com>)
 id 1lUCnI-000735-6v
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:20:48 -0400
Received: from mail-dm6nam12on2048.outbound.protection.outlook.com
 ([40.107.243.48]:44011 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Xiongzi.Ge@netapp.com>)
 id 1lUCn9-00068H-45
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:20:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0SrYm7B15OmZZ/MFZ2GaHdzamloDNyxxlRDA4aTR7rBFj8ZOjn3vytvaqWfcjguye7VjOOdXqcoPVJX6vVEr4GfEMSwV8R/GyOCQucspbDZTTz7DiEX1VdJciCCRNl7kTRv5wf85W0yeNKom1syDp2Rrk4+bWl4LJpxzUeqKSX9qbUTT0Bd29tFh7d/HDSrdI/zaSAz5ZnH4AA3zEYNMpDrYwLkV4+DYEuvvKW3qyu77cd++Zp7fxn83lLyjOkH91RW/5RlVtdFGGhKjDe5qfEycC9YAzpfCwA2F8mGpQvkesC4JsPdhTlxYSKWftdffdqnZj2jK2E1daxA9XhEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUzZ3Ev+uFwjs5VD3b5ZKcaknZzQQ6H4PmEjmQ0GoSQ=;
 b=a5fZW8xgwxYlbqMMO579NQlqeyqx1hyhGQRxM5NN1xPEilzIZGQRMGICLodD/uGpqoDdbDL4/s+rm79d9pnBmIQu7+CWhhaGUiM/1JoKCIGb0OJEjvDV6Wg681xIBbLW1HwqtYjVVdnFJtKlIcn6xmBw8HOY2psk7VhmCtnKIG7mKh4e2+3veF0srWMX5BsM7ohPuVtS7J5QDRJz0tOeQwiI9CVgJuWpk99Lax3DyLwqErrBYZDJ2hiCPNDawsUUS8XiTY0gu1vqclR0cWpU+4LEggjKe8LNjLdRv0M50NgqJFm9Vmaji6gretqlwIQ2IxJUpmmVLauV6TQB12xJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netapp.com; dmarc=pass action=none header.from=netapp.com;
 dkim=pass header.d=netapp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUzZ3Ev+uFwjs5VD3b5ZKcaknZzQQ6H4PmEjmQ0GoSQ=;
 b=Yt7rIu/QFkyWhC+V5Xab/i08L9zXWFoQ/Ty7VIgZzLy0tkoYdYaJKk9m+dnXZk0ZUy8oifDUlcsxwK4EHFYFQCq+Ibj2+YgiM5LerQH/j3l80Rr79l/t9GRNHyfKWLS7wt6OvVP7mm8fCzYJhpye/vONL6Ybp+24AppyFbS6G/LM1rwOROIc9Ca7MPA9PXdFumaLG3AC8rjFp0/dU8fSbg66r1sIBfs+4afLMx3oaa/sNUWB8+fwlOgC29k16gMyED7dzevplFCGUHHbbbt4KgWQzDPCI6Kj7DRVdxKFQCr18hZ3D5F3f098+ULTfapl5J9ebe2nZFXuhcD1n2NMgA==
Received: from BLAPR06MB7010.namprd06.prod.outlook.com (2603:10b6:208:287::7)
 by BLAPR06MB6835.namprd06.prod.outlook.com (2603:10b6:208:287::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 18:05:30 +0000
Received: from BLAPR06MB7010.namprd06.prod.outlook.com
 ([fe80::e07d:8e72:e66e:7824]) by BLAPR06MB7010.namprd06.prod.outlook.com
 ([fe80::e07d:8e72:e66e:7824%5]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 18:05:30 +0000
From: "Ge, Xiongzi" <Xiongzi.Ge@netapp.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Vivek Goyal
 <vgoyal@redhat.com>
Subject: Live migration support for virtio-fs
Thread-Topic: Live migration support for virtio-fs
Thread-Index: AQHXH4TfR8MZ6fUMPEa7PJ1kNF3AoqqRX62AgABJxwCAAAIkAIAXg3+A
Date: Wed, 7 Apr 2021 18:05:29 +0000
Message-ID: <40D27E5F-C65A-4441-BA23-ABA6880DAA71@netapp.com>
References: <714BD741-AE3F-4BC5-8DFB-F5C74A8623B1@netapp.com>
 <YFnC9QXo6uP+2zC1@work-vm> <20210323145312.GB483930@redhat.com>
 <YFoCpIh5PCSP6gXB@work-vm>
In-Reply-To: <YFoCpIh5PCSP6gXB@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.47.21031401
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=netapp.com;
x-originating-ip: [76.182.122.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6aae6185-3c4a-4351-6346-08d8f9efbadf
x-ms-traffictypediagnostic: BLAPR06MB6835:
x-microsoft-antispam-prvs: <BLAPR06MB6835F52919CC5A6B1CD7C47AE3759@BLAPR06MB6835.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ByUbSQ8FYv/IUoMojfotldBPfJIX0jKduTgLIkWWAGvpYGHIKBRoawdOjRwQ+MKKVm11v1wWAB/cec9dLUWld/+StfY2LDOO3j79ToUCVHcPh8SZKRAZjpN5hzgY3OA6k02Pe4M5YyU0n6RsYGreDcQj7moYpYTLp1IxPXibm1+/N+zJe+vUcPu4Tekp/14OcgMEYwmvhRFC65Fr1B1uUaKzQz4QIr4Pm6Itcp7xMXpMgphva4Fato8FMLd+4dHQXzxY9OajSAjsClrxsRP1Nf3M8QGafJ0QDARQhgN5XtyCyQl2EmGXNLnV/8sM3B95F0hrqdmTmELNGeCcCndtMsJ7c4BCZx0lfI67YR4A7v1MV17amTkXkPubvPWmKN9fk2m681nnbQjDFAXPKkegQACOF2DZ4AtsPIRvDcDVyHPYOxLn/pslVLhpClSKBAfSD1/lqxsRUGPmQei3a1sCqFdSxrkMWfEXsgZ5zUvXO4anp1AXu13Gg2MeNAhBbI7IC32PjyvRjzKQx3q4uO1Uwc4/Z4TZoPS0UvEpo/DNxPMamRiHfY/YhsQSQgCfdV4Lnsau8mNRI6oDDodqkV5e7zvh3n9aUvRgdgL1o5KLGK0vHPVgmBVcq34lDnYZ+fDJH234iNTMvNtZlQBCFBsMGfSwCZKsBSzt9I69Nr9YvVYmo+N9qT8wObj1LG2qrl8S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR06MB7010.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(5660300002)(66946007)(66556008)(83380400001)(38100700001)(66446008)(76116006)(8676002)(8936002)(26005)(71200400001)(33656002)(4326008)(186003)(110136005)(36756003)(498600001)(64756008)(86362001)(6506007)(54906003)(6512007)(91956017)(2906002)(2616005)(6486002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NlZXZm5CcXJ4WHZwV05qZDA1Y2lETEliOVYrRWl3aDBoMWtsK1JwL2dMR05Z?=
 =?utf-8?B?VytsQnplSytqUno2VTFwU0Exd2lXelBIOWxBSm5uWmhna1N0cWVsTVdLN2ov?=
 =?utf-8?B?a0wvMWFXd2hvREFRY2c1Mk5pZkdXWFBnVGxOUFdZUWc1MzdWeFNPRFhaMUcz?=
 =?utf-8?B?YWtIaTBpNGpDTSs0OCttdW5YNjVZL0lEVGxnYUZxNXl1anJSVzEzTkNMRWta?=
 =?utf-8?B?OU82WmdxMjhuSlQzVkwvVzF3SUtjNjk2MVdFSnpmSS85V3Q2VERIRXcwb0hI?=
 =?utf-8?B?ZnViTUkwd25sZ00xTVhCTEcxQ0JaTzFWcFRDZi9ldzRmT0wxSUI1RW9xVXZG?=
 =?utf-8?B?UWZMOEhvRmR0MlNJNjdtdzJvU0lobmYyVE9IbnRPQkd1a0FHTFU3UU5McEk5?=
 =?utf-8?B?QzlZODRiVDRSVy9ZQTc0MXNwaGh4SytDOXNxaUNqY0ZRYVRoMzBmS1lwbGVY?=
 =?utf-8?B?K01VWGdPemlMTitid2xVUnF3cDhBSmFqYld5MlJ5bm1GSTRMZ3VyN1ovdEQx?=
 =?utf-8?B?Z0tleXBpOFUvczEzajJoMHQyMjhLYnppMk5MWHlrdGtZaTd6aDRVa1hYeFNG?=
 =?utf-8?B?c2pYSG9Cd1NLRjZ3WFIwNTFJWlZ2b2JGMVVZd3BvRGVySGdXMGpacjRqeU9z?=
 =?utf-8?B?dXpnZHgzSGlJNFBZOGxWNUdxa0h3eHhwekVvWFJkSzJyUlVTbTQ3QUhQTUI2?=
 =?utf-8?B?eVFYby9uRG5kbzJ3cUJQVml3UXo1OEJFOGJPMGltUThNOThNOE9yNXZsTUMy?=
 =?utf-8?B?VTBBTVBiYWUrUGhjYUlUSTVmWjA5REY4b1NWT3pvandjRHlLMlpoS0hlalpB?=
 =?utf-8?B?cTRHaUdydDlLaWNnNEt0N2NWVTI5NnJwSnNEN0JOWFByaDNITUE4UGlzZVdl?=
 =?utf-8?B?d3R3MHNyMEdEOWJ1ejdabmxBV1VXOGNUbG5YVWxsZlNtVXZsYzZKL3VYWWpi?=
 =?utf-8?B?YnllNk90b29pVmkwWk5wam5CR1JnNmI4cTFGcm5sekpMczFweUExL3VnSDdx?=
 =?utf-8?B?K2tpSFJzZDNYVFZNWGVhdk0rU1FGYUtJRnkxWXkxejNmSjZic2J5MjRmOVR0?=
 =?utf-8?B?VldyclkzVFUxSlp1bVRzTlQ0cUkyTkd2clp5S1hoT1A5dWF1V0M0MGhTOFVy?=
 =?utf-8?B?ckQyWnBOMzlOL3VyNGdGeGhRMTM4QVJFVUR2UHNoNHE4WWNwWXB5ck84blhD?=
 =?utf-8?B?TlNvNEFvK2k0OG9WZjIrbWhmT21KcndoeGtCSmhkTlZENjg0aUJYS3Y5c2g5?=
 =?utf-8?B?RWhJRjBza09POWdRUUdKNlJqb2JiUG1QTkFEMmRWcGgzT0ZDM3VsQmRFWEJL?=
 =?utf-8?B?alRiUjg3aWdZcmt1aXBXSisxMnlRd3hrMlZzUXJwOWpheG5uQ2hVZ3d4cXdV?=
 =?utf-8?B?VWlvL1BhUWM5RUxMVk95VEpWV2JyVWRGWHYxZDQrUFIxU1Z6U2xReFMwQWNE?=
 =?utf-8?B?Z2tjRjdvcFM2Y0tLTCtxZHJYeG4vbjFOMGUySXd2ZDdKQVNYWlBWMEtDY2V2?=
 =?utf-8?B?ZkgyUHhCbXg0WlFRakw2MytnVXY1R3cxbnYvMHIxc0M0OFowbTlqWnpBSkV4?=
 =?utf-8?B?b01zdmxhbG9HT2JHZ0oyNnBIbC9mYnVCZWdDWmgyNlp2dXJCSE5hZlh5ZDZm?=
 =?utf-8?B?RzJJZHRWdWxTMmtsZ04rNjgrYW5SUmxqTHlUWUxNOTF6NzlQTWZtWXdyTU92?=
 =?utf-8?B?czVWUTBISmxEeXljQ3kzR0pMTXZXWk9uOCtscjRJY2x3WGlPRVA2NCt4NlNB?=
 =?utf-8?Q?2JVmGK8AbURk3yoISmXo5EN3C8sgMRz+WTusklc?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B7403C3819DEB49868644B126CA2BF1@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: netapp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR06MB7010.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aae6185-3c4a-4351-6346-08d8f9efbadf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 18:05:29.9372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b0911a0-929b-4715-944b-c03745165b3a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: akovne4Bs/vGeb3IoV67bMQKZeeiyKSbYWplWzS5ONtjYLbFFyy88f3LsZafi37RjuKX06f8mMvwSwV98ZdUfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR06MB6835
Received-SPF: pass client-ip=40.107.243.48; envelope-from=Xiongzi.Ge@netapp.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 07 Apr 2021 18:07:50 -0400
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhhbmtzIERyIEdpbGJlcnQsIFZpdmVrLCBTdGVmYW4sIEdyZWchDQpJIHB1dCB0b2dldGhlciB0
aGUgZGlzY3Vzc2lvbiBpbnRvIHRoaXMgdGhyZWFkIGFuZCBDQyBxZW11LWRldmVsQG5vbmdudS5v
cmcuIA0KDQpQcm9ibGVtOg0KQ3VycmVudCBWaXJ0aW8tRlMgZG9lcyBub3Qgc3VwcG9ydCBsaXZl
IG1pZ3JhdGlvbi4gIEV2ZW4gd2hlbiB0aGUgdmlydGlvZnMgZGlyZWN0b3J5IGlzIG5vdCBtb3Vu
dGVkIG9uIHRoZSBndWVzdCwgVk0gY2Fubm90IGRvIGxpdmUgbWlncmF0aW9uLiBBbnkgc3VnZ2Vz
dGlvbnMvaW50ZXJlc3QgSWYgd2Ugd2FudCB0byBtYWtlIHRoaXMgd29yayBzbyB3ZSBjYW4gc3Rp
bGwgaGF2ZSB0aGUgbGl2ZSBtaWdyYXRpb24gZmVhdHVyZSBmb3Igb3RoZXIgcHVycG9zZSBvbiB0
aGF0IFZNPyANCg0KSWYgd2UgYWxyZWFkeSBoYXZlIGEgc2hhcmVkIGZpbGUgc3lzdGVtIGxpa2Ug
Q2VwaCwgZG9lcyB0aGlzIG1ha2UgaXQgZGlmZmVyZW50PyANCg0KVGhhbmtzLA0KWGlvbmd6aQ0K
DQotLS0tLS0tLS0NClN0ZWZhbidzIHJlcGx5Og0KVGhlIHZpcnRpby1mcyBkZXZpY2UgaG9sZHMg
YSBidW5jaCBvZiBzdGF0ZSwgbGlrZSB0aGUgaW5vX21hcCwgZGlycF9tYXAsDQphbmQgdGhlIGZk
X21hcCBpbiB0aGUgdmlydGlvZnNkIEMgaW1wbGVtZW50YXRpb24uIFRoYXQgaXMgdGhlIEZVU0UN
CnNlc3Npb24gc3RhdGUgdGhhdCBuZWVkcyB0byBiZSBtaWdyYXRlZCBpbiBvcmRlciB0byByZXN1
bWUgc2VhbWxlc3NseQ0KKHdpdGhvdXQgdW5tb3VudGluZyBhbmQgbW91bnRpbmcgYWdhaW4pLg0K
DQpJZiB0aGUgYmFja2VuZCBpcyBhIGRpc3RyaWJ1dGVkIGZpbGUgc3lzdGVtIHRoZW4gaXQgbXkg
aGF2ZSBBUElzIHRoYXQNCm1ha2UgbWlncmF0aW9uIGVhc2llci4gSWYgaXQncyBwb3NzaWJsZSB0
byByZS1hdHRhY2ggdG8gb3BlbiBmaWxlcyBmcm9tDQphbm90aGVyIGhvc3QgdGhlbiB0aGF0IGlz
IHBlcmZlY3QuIEJ1dCBvbiB0aGUgZmxpcHNpZGUgaWYgdGhlcmUgYXJlIG5vDQpBUElzIGZvciBk
b2luZyB0aGF0IHRoZW4gaXQgbWlnaHQgYmUgaW1wb3NzaWJsZSB0byByZWxpYWJseSBsaXZlDQpt
aWdyYXRpb24gYmVjYXVzZSBzb21lIHN0YXRlIGNhbm5vdCBiZSB0cmFuc2ZlcnJlZCBiZXR3ZWVu
IGhvc3RzLg0KDQpNYXggUmVpdHogaXMgbGF5aW5nIHRoZSBmb3VuZGF0aW9uIGZvciBsaXZlIG1p
Z3JhdGlvbiBieSB3b3JraW5nIG9uDQpvcGVuX2J5X2hhbmRsZV9hdCgyKSBzdXBwb3J0LiBUaGlz
IHdpbGwgcHJvYmFibHkgYmUgbmVlZGVkIGluIG9yZGVyIHRvDQp0cmFuc2ZlciBvcGVuIGZpbGVz
IGZyb20gb25lIGhvc3QgdG8gYW5vdGhlci4NCg0KSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGVu
YWJsZSBsaXZlIG1pZ3JhdGlvbiB3aGVuIHRoZSBmaWxlc3lzdGVtIGlzDQpub3QgbW91bnRlZC4g
VGhhdCBtaWdodCBiZSBhIGdvb2QgZmlyc3Qgc3RlcCB0byBlbmFibGluZyBsaXZlIG1pZ3JhdGlv
bi4NCg0KLS0tLS0tLS0tLS0tDQpGcm9tIEdyZWcgS3VyejoNCkxpdmUgbWlncmF0aW9uIG9mIHZp
cnRpby1mcyBpcyBzdGlsbCBhdCB0aGUgZWFybHkgZGlzY3Vzc2lvbiBzdGFnZSBBRkFJQ1QuDQpJ
dCBtaWdodCB0YWtlIHRpbWUgYmVmb3JlIHdlIGhhdmUgc29tZXRoaW5nIHdvcmtpbmcuIEJ1dCBp
biB0aGUgbWVhbnRpbWUsDQppdCBzZWVtcyBhYnVzaXZlIHRvIGJsb2NrIG1pZ3JhdGlvbiBpZiB3
ZSBoYXZlIGEgZ3VhcmFudGVlIHRoYXQgdGhlIGRldmljZQ0KaXNuJ3Qgc2VydmljaW5nIHJlcXVl
c3RzLiBGV0lXIHZpcnRpby05cCBvbmx5IGJsb2NrcyBtaWdyYXRpb24gd2hlbiB0aGUNCnNoYXJl
ZCBkaXJlY3RvcnkgaXMgbW91bnRlZCBvbiB0aGUgZ3Vlc3QuDQoNCg0K77u/T24gMy8yMy8yMSwg
MTE6MDEgQU0sICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4g
d3JvdGU6DQoNCiAgICAqIFZpdmVrIEdveWFsICh2Z295YWxAcmVkaGF0LmNvbSkgd3JvdGU6DQog
ICAgPiBPbiBUdWUsIE1hciAyMywgMjAyMSBhdCAxMDoyOTowOUFNICswMDAwLCBEci4gRGF2aWQg
QWxhbiBHaWxiZXJ0IHdyb3RlOg0KICAgID4gPiAqIEdlLCBYaW9uZ3ppIChYaW9uZ3ppLkdlQG5l
dGFwcC5jb20pIHdyb3RlOg0KICAgID4gPiA+IEhlbGxvIFZpdmVrLCBEci4gR2lsYmVydCwgYW5k
IHRoZSB2aXJ0aW8tZnMgdGVhbSwNCiAgICA+ID4NCiAgICA+ID4gSGkgWGlvbmd6aSwNCiAgICA+
ID4NCiAgICA+ID4gPiBJdCBzZWVtcyB0aGF0IHZpcnRpby1mcyBkb2VzIG5vdCBzdXBwb3J0IGxp
dmUgbWlncmF0aW9uLiBPbmNlIGEgdm0NCiAgICA+ID4gPiBpcyBjb25maWd1cmVkIHdpdGggdmly
dGlvLWZzLCBsaXZlIG1pZ3JhdGlvbiBjYW5ub3QgYmUgcGVyZm9ybWVkIGV2ZW4NCiAgICA+ID4g
PiBpdCBpcyBub3QgbW91bnRlZCBvbiB0aGUgZ3Vlc3QuDQogICAgPiA+DQogICAgPiA+IFJpZ2h0
Lg0KICAgID4gPg0KICAgID4gPiA+IElzIHRoZXJlIGFueSBwcm9ncmVzcyBmb3IgdGhpcz8NCiAg
ICA+ID4NCiAgICA+ID4gTWF4IFJlaXR6IGlzIGxvb2tpbmcgYXQgc29tZSBwYXJ0cyBvZiBpdDsg
aW4gcGFydGljdWxhciBzdG9yaW5nIGZpbGUNCiAgICA+ID4gaGFuZGxlcyB0aGF0IGNhbiBsYXRl
ciBiZSByZW9wZW5lZC4NCiAgICA+ID4gQnV0IHRoZXJlIGFyZSBhIGJ1bmNoIG9mIG90aGVyIHBh
cnRzIHdlJ3ZlIG5vdCBsb29rZWQgYXQgeWV0IGVpdGhlcg0KICAgID4gPiAobGlrZSB0aGUgZGly
dHkgcGFnZSBtYXJraW5nIGFyb3VuZCBhbGwgc3lzY2FsbHMpLg0KICAgID4gPg0KICAgID4gPiA+
IElmIHRoZQ0KICAgID4gPiA+IHNoYXJlZCBkaXJlY3RvcnkgaXMgZnJvbSBhIGRpc3RyaWJ1dGVk
IGZpbGUgc3lzdGVtIGxpa2UgQ2VwaCwgd291bGQgaXQNCiAgICA+ID4gPiBiZSBlYXNpZXIgdGhh
biB0aGUgZ2VuZXJhbCBjYXNlIHRvIGJlIGltcGxlbWVudGVkPw0KICAgID4gPg0KICAgID4gPiBN
YXliZTsgdGhlcmUgYXJlIHNvbWUgdHJpY2t5IHNlbWFudGljcyBwcm9ibGVtczsgZm9yIGV4YW1w
bGUsIGxldHMNCiAgICA+ID4gaW1hZ2luZSB0aGF0IHlvdSBvcGVuIHRoZSBmaWxlICAgJ2EvYi9j
JyAgb24gdGhlIHNvdXJjZSwgYW5kIHNvbWV0aW1lDQogICAgPiA+IGFmdGVyIHlvdSBvcGVuIGl0
LCAnYicgZ2V0cyByZW5hbWVkIHRvICdkJzsgIHdoZW4geW91IHJlc3VtZSBvbiB0aGUNCiAgICA+
ID4gZGVzdGluYXRpb24geW91IG5lZWQgdG8gbWFrZSBzdXJlIHlvdSBrbm93IGhvdyB0byBnZXQg
dG8gdGhhdCBmaWxlLg0KICAgID4gPiBEZXBlbmRpbmcgb24gdGhlIGZpbGVzeXN0ZW0gc2VtYW50
aWNzIHlvdSBtaWdodCBuZWVkIHRvIG1ha2UgdGhhdCB3b3JrDQogICAgPiA+IGV2ZW4gaWYgJ2Ev
Yi9jJyBoYWQgYmVlbiBkZWxldGVkIGJ1dCB5b3Ugc3RpbGwgaGFkIGl0IG9wZW4uDQogICAgPg0K
ICAgID4gSGkgRGF2ZSwNCiAgICA+DQogICAgPiBJIGFtIGFzc3VtaW5nIHRoYXQgd2l0aCBmaWxl
IGhhbmRsZXMsIHJlbmFtaW5nIG9mIGZpbGUgcHJvYmFibHkgaXMgbm90DQogICAgPiBhIHByb2Js
ZW0uIG9wZW5fYnlfaGFuZGxlX2F0KCkgd2lsbCBzdGlsbCBiZSBhYmxlIHRvIGZpbmQgaXQuDQoN
CiAgICBSaWdodDsgYWx0aG91Z2ggYWdhaW4gd2l0aCBzb2VtdGhpbmcgbGlrZSBDRVBIIHlvdSBt
aWdodCBub3QgZXZlbiBuZWVkDQogICAgdGhhdCBpZiB5b3UgaGFkIGEgdmlydGlvZnMgZGFlbW9u
IHRoYXQgc3Bva2UgZGlyZWN0IHRvIENFUEgsIHlvdSBtaWdodA0KICAgIGJlIGRlYWxpbmcgd2l0
aCBhIENFUEggZmlsZWhhbmRsZS4NCg0KICAgID4gSSB0aGluayByZWFsIHByb2JsZW0gKGFzIHlv
dSBwb2ludGVkIG91dCBsYXRlcikgaXMgdW5saWtlZCBmaWxlIHdoaWNoIGlzDQogICAgPiBzdGls
bCBpbiB1c2UgYnkgdGhlIHZpcnRpb2ZzZC4NCg0KICAgIERhdmUNCg0KICAgID4gVGhhbmtzDQog
ICAgPiBWaXZlaw0KICAgIC0tDQogICAgRHIuIERhdmlkIEFsYW4gR2lsYmVydCAvIGRnaWxiZXJ0
QHJlZGhhdC5jb20gLyBNYW5jaGVzdGVyLCBVSw0KDQoNCg==

