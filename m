Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D6F52BB50
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:06:28 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJNh-0007Vn-NA
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1nrJ9g-00057P-Te
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:52:00 -0400
Received: from mail-mw2nam12on2062a.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::62a]:12673
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1nrJ9d-0003z5-EE
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:51:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFmL9h2Va0EOFHQh/cFr5JxIZJ2xMlWrBIcl/jiwvwale3k3I9tR1iHDtFpAavX09W8I+86cEoCUeZueKsUTw/34XtZm0vlduZtAzOcsmGupODbJUdhNwru3aiT44/FXYh7VufAVLji3hg8oCyVv88JJ0woKvuwv+yEQ7Xfhks66iWAuIw6fyIU1q0hy/3gDkaSxrV6k4iwyXpvP+c247EHeZwl2eiqsrk9F6vUpVcprlpP41VecdQKKZhBMlm7VXvtpSJrcQE9FhEREkKs6h+X3T9OiPVl/CM/95TEkeLOKtbYv+/G2WouarQcuiyv0si16ygAPsk+t61Q+dCS+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJAuN1fSL1fhIl3K3eWQBuWSorIPXeKcEkdlScbScPg=;
 b=hib2vEW/CgeS/iu5jOa6T+7xKV0IeH+wyIurp7AQozFKiad8ruryVTmy1Nm1xoL5kKM6w2kOIjLTr978H3eBjvJsZOC4lVD/RkLqPavTJv00u4E0X2ZJup1YmYWvtttlR4Wmcn0eY1JvVtEjnLJ+7U2IcRBIgCgBub8CRWODUCJOAPUi7Kh1D4bKjkGk4Ak0V3tewHT1pKAxyaQL1xP9NFJW8lfDqf4r94iu8dI+Wm/J0AwQn1EtlfQLlybOHRCVibtcV6+EZAae9NVCeD/2lja1gCCd2tLKujoErd5iSznWl6JCyXNzLoPN4z8M/NzqaPZaGP6XIa9fdtH6kvYqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJAuN1fSL1fhIl3K3eWQBuWSorIPXeKcEkdlScbScPg=;
 b=bhAjTyU90Ch6UU4sBq7MDm1dw/FL4/7PCeFXLR8jPd3aT7JmAiaz8ICqov7znaI5QMq17aBJJn+FPIMsfYuC4bh/1hWZgqt1D0m3cA5wnwU1m0GTzXeU69u5L1vovRvvFwh4H8Do8/FeSmb0GAfjuTUh/TEwnhCdqNwNAJ9ecV1EhzXHIg7HUFTeI+qrGG5xMUaly7QDm8C7DlxoAZuxjwHqHfQBOpRSlymVOeRMQpzaaDGFnPSUOFMIZ1mrQsYwenwaXB+yo5O30uYWNMJxH2wXYqyVwHnWXi66zTKJ/p49VH2lJBZcVIFe3Ud6z8eSVtY+jNxljClZ+PxbZwBxZA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 12:51:48 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854%3]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 12:51:47 +0000
From: Parav Pandit <parav@nvidia.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
CC: Gautam Dawar <gdawar@xilinx.com>, virtualization
 <virtualization@lists.linux-foundation.org>, qemu-level
 <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, Cindy Lu
 <lulu@redhat.com>, "virtio-networking@redhat.com"
 <virtio-networking@redhat.com>, Eli Cohen <elic@nvidia.com>, Laurent Vivier
 <lvivier@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: RE: About restoring the state in vhost-vdpa device
Thread-Topic: About restoring the state in vhost-vdpa device
Thread-Index: AQHYZW+JxbBQ1h+RIkS7iyhFOVHKbK0c5lPggAAyGwCAAAYJcIAEGq4AgAC/8WCAAMebAIAB37MQ
Date: Wed, 18 May 2022 12:51:47 +0000
Message-ID: <PH0PR12MB5481846910A230F6F8F58DA9DCD19@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
 <PH0PR12MB5481AF0B02B0FB00885FF2AEDCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWe2dQx1s7wQr8OLp-0eAQZJcCBuFwdxBA=sgeNm_u4N6A@mail.gmail.com>
 <PH0PR12MB54812F8306F5B9650BA10783DCCF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWfqugjApohFBejiFQTLhkuLFEfgFjKhmGGc5-yMDmM6Hg@mail.gmail.com>
In-Reply-To: <CAJaqyWfqugjApohFBejiFQTLhkuLFEfgFjKhmGGc5-yMDmM6Hg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77bcc225-796c-4b34-d46c-08da38cd2bb8
x-ms-traffictypediagnostic: CH2PR12MB4326:EE_
x-microsoft-antispam-prvs: <CH2PR12MB4326B4A8A03DD3D347B5A875DCD19@CH2PR12MB4326.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IuR+qlFy4KVOZEgLuQLKMOeDcc9woKKBMgRzzYQksnigbp6v1UfASyGn+a+0GVnk9xyT0RQfFuI3y9+e8WQR29ncHmVzv+6H/kdDypxGhwOpuXuX8vWYfA35Iq/U6bdD2pbvoLWVTyr4C79ssbUrCs4FoULj32txMSiBvSk2Ru3QdmTUPQPlzXlyPAtnDwOJYkZoTi0oj4LDjo1aXBuvLbaLh2w/UyAUIxV+BFBFPjhiOUZ0m/9JEvrVtfvV5/eZiFbEzNxnv+T2SQGQEiR6MAJs9muqL2jtI9esuQR1uyOSb0w3rXQpXYrLdmObPYv4wTf8v9HI6MypC3kGl98kaUGoPtr5kw3l5MDVv41bT+u/yzepzVs9De24uZC6XNA+IqnwK/i6lw7eUW71gKF9hpkK3wz5gPs3LUalZw1n2pZEBpXxtaDGQre/nlkHQwhpjEwRF/9kgEc272hBWoyDZl/g8fCSwzSuWJ+LIvR8A9rDzmOfbZdghF0TWE7hPC9H5l8o1YhpX1+NgJ7Nr1NizXDkdikAOebTwDdmuSt24TZLOiaoc1iu/SQ0k4bRyZg4KNqIt4NpCmR/MIaWstO80Sysb1PH9QLsil9MviVBdLYbrekOnNhbUmuCewoyPG1w9OZrGwBC+3DiyhZvHtB6IIY9G+us5HW3DIGOOs/w6lh5v7CUoZeKJ9G4H3Yi5c1QGYLXyTt7CalsD1KizWEnvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(8936002)(38070700005)(508600001)(38100700002)(33656002)(5660300002)(55016003)(71200400001)(122000001)(186003)(9686003)(86362001)(83380400001)(7696005)(66476007)(2906002)(6506007)(66556008)(66446008)(76116006)(66946007)(64756008)(316002)(6916009)(54906003)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjRhWG9KQkFpOGR3UWtHT25lMlVhUzBTZUZmOTYwUitNN29aQ3NUb3RxQ1l6?=
 =?utf-8?B?ZlVCbEJiV3p1TXlSZ3N6Mmd4Tkg2NHVqZFh2R014RldyNVhSVktRTHZBSm0x?=
 =?utf-8?B?Tk90WlVPeVFhNEdIUkR1ZGhWNCtxNmhhQ1BTQmllSFZQNXA0YXhKdlJ0ZThL?=
 =?utf-8?B?am9uc1YyaWtpelBXNUYzUlVxcktSR3l4TzkwL3VjVithRnU5Y3YvNzUvOTh0?=
 =?utf-8?B?a2tTYVREUHAxcnMyQWFVbjNseUxtbVVzcC80WU9YdHdsT3JIRTBxK3BOdGRt?=
 =?utf-8?B?dGxkR3pIRWFVa0lLNm5PaTRhUHJaSTYvY1hoQ0dIU3VQVDRDRGhFK0JaNXJZ?=
 =?utf-8?B?aWZiYldXT0p1T2huQ2x3TFU2QmNhWDRhZUpDQ3FmMTFuTnZYYWlQbzJoL0Nq?=
 =?utf-8?B?RDR0N3NVOW0vWjNSSE1Femw3bWVSNCtuVUFYRklXT2dSaWR6K2hMenZNYkRx?=
 =?utf-8?B?RkJ1MnVLRG1XdTBjNUxSbE5DdnoybythNGhzb0d3VGhJaE56bFdlTE1sdHh2?=
 =?utf-8?B?UlVwU0RnOGdsTEpqdThtRWhBU3h0SWNpSmM1TU5OdWNrbE9YNUJZZ0Nua0NN?=
 =?utf-8?B?aXdxMnRUTGFLMnlUdVc0NUJBcm1NZ1N4bUVBVXBoYjdmbmI3djlEMGgrNnZD?=
 =?utf-8?B?UmMyUmhnNzBaUzVoUUFpcnpBSXBIT3RqNDlxbTJad2tubzJTNm0xM1NLSXRT?=
 =?utf-8?B?KzNkWnJjRnMzcFRmUHJ0bm91Y1RiQkFucGlqUzB6VFVXRkFnSURoSjkxUjBO?=
 =?utf-8?B?bUIxbzI0L2ZCNVdobEo4QUgxSThvQ0Z5dXFJTUdMeWlPOCs1aHNGNlorS1ZZ?=
 =?utf-8?B?bU94SWhHZTlwMHFXcEs4UHdldFNUWjMrcmtKeUc5RldqS0NoeFViRWpiWi9J?=
 =?utf-8?B?alNmdnhFL0pZUTI3ZHNXcDBlWHhIaE1SamNJNnE0cU5zWk1KanFGN25wR0o4?=
 =?utf-8?B?b0hHclZZV1NJaTJydm9PK0dtTlNEckNOZTVzTE5EOW5iZmE5TnRUamwrbDh5?=
 =?utf-8?B?dW8xTlR4NW02TEdtSUphTTBiNTVBSFo5cmtVTDNSelJFVXBJQ2dBeDZXaGxX?=
 =?utf-8?B?cmg5M3dZdlJrdHB4SzZoYi9vK3RJUlhqTlNaNGlxVTdQSVdwOThIV25xblpk?=
 =?utf-8?B?NXFDb01ad1Q2QlZzVCs3bHQ3TzN5RE1BbjRSWTVFWWtqMU1PT3c1SUpKUnlX?=
 =?utf-8?B?MVJpZkw5RFZJcnJhSjZQYjNtcU5mbVAvZnJzclVPQytpem1nUSs1SWVMcUNJ?=
 =?utf-8?B?ZFpwcmdGaDVxSlUveWFrUHZyRVNEM3JvVks2Z3AwOERiWmsxc1daaVlZUlhE?=
 =?utf-8?B?UkxwT0ZnMURDSjZ0eHJtUFNJSW9UN3dGRnlGYjd1VUlpTjhKUGV4aVRLdlJ2?=
 =?utf-8?B?Y3VBbnNEeDY2amtnREpnQ205RUVocVJVbVBicmVKd2RDdlpZcHdtbDJ1R3B5?=
 =?utf-8?B?UnIzenpLWlZNQkkzclZ6OXBrcXVlWjBCTFFCNURIbWxEbVl4eXYxL3Y0NmZs?=
 =?utf-8?B?MzNQTGplWEpvL0ZxbFZDWFJoOFhYdncybGZjdlZCcnVFUDY4WFBRWjFJWHFT?=
 =?utf-8?B?TEd4UUNYejQwN0p3ZUNFbitSeWowNzNRbUhwaXk3d3Jyd1p1d283c1BIeVRW?=
 =?utf-8?B?dzdkY3pqUmtIUnplODJNcDg3dUwxQmkvUWJreTl1SHdrOEp4TE1CRmJXSExr?=
 =?utf-8?B?MzJUSWtpTmpCRUtxck8xU0xMNWtRQ2xtMEJUL2xWZDVoWG15dkFGVWRpQzhq?=
 =?utf-8?B?WjZRWkcwRVVFbVRHK0FCWGNVRDQzdmdDUUpUSzZKWjEzaGJnd21GbkllQ2JN?=
 =?utf-8?B?Z0Q3NDBVbmhpZzllc201dDZWYklkNHhjRzhjeTNmWU9WWnNIY28vdkI1Zldp?=
 =?utf-8?B?S2k0RnhqQzhuZi9yQ3c1dW56QWtLR3ZYSVYrY0R5RVdTenlSZEJ5VDhUTzh6?=
 =?utf-8?B?RHM5b0FRNFdrR2lnK09Va2xzZXl0STZLbjMxMmJvdXJ2L1hUR1paUXBYYjVL?=
 =?utf-8?B?RUlvSnVud3FDTkwrV2t4QVVsdlRaRDJ0RnM3dFlLWjVDNWNVdUt4UWo4dXE1?=
 =?utf-8?B?YTMvYjJZbml1Y1hZSVZYNFZsSEk0RVR5RGtjRVUyeWs2anR6NnFpVHRmMW5y?=
 =?utf-8?B?WUZoS1pMRFRCdmQzWkg2b1lVQTBBdTc1dlJsVStmQlhSRlJBbkFFUW1BaWg2?=
 =?utf-8?B?NDBTY0F2NXU2WisxODlrbXMvZnhsRTlCYVRWVXUzTGkvdlF2YlFGUWpXaFpy?=
 =?utf-8?B?aVZIbnVJQWdDK0R5SldscmZjVmRSSHA5Q1psNHBkemdRVGpXY0hLREdMdmpW?=
 =?utf-8?B?MUxLYldkWnJ1TWVjeTFsOHhqZXhZOWNkbzF0Vk1WSUorWHJuZUpmUnBWK2NO?=
 =?utf-8?Q?65GJM2SrQFLzghu/1sLY900GmWNdPenInWsl8GV/5DRUF?=
x-ms-exchange-antispam-messagedata-1: THUI981TVlV4gg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bcc225-796c-4b34-d46c-08da38cd2bb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 12:51:47.9174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwSf5/l9SMyBvzm75o1pGJjWovr7s0OHpuV3zEpeFPrp85MWVaEnrJygQBnx3ZRy97r2h86TjNLdtZbj6028QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::62a;
 envelope-from=parav@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

DQo+IEZyb206IEV1Z2VuaW8gUGVyZXogTWFydGluIDxlcGVyZXptYUByZWRoYXQuY29tPg0KPiBT
ZW50OiBUdWVzZGF5LCBNYXkgMTcsIDIwMjIgNDoxMiBBTQ0KIA0KPiA+IDIuIEVhY2ggVlEgZW5h
YmxlbWVudCBvbmUgYXQgYSB0aW1lLCByZXF1aXJlcyBjb25zdGFudCBzdGVlcmluZyB1cGRhdGUN
Cj4gPiBmb3IgdGhlIFZRIFdoaWxlIHRoaXMgaW5mb3JtYXRpb24gaXMgc29tZXRoaW5nIGFscmVh
ZHkga25vd24uIFRyeWluZyB0bw0KPiByZXVzZSBicmluZ3MgYSBjYWxsYmFjayByZXN1bHQgaW4g
dGhpcyBpbi1lZmZpY2llbmN5Lg0KPiA+IFNvIGJldHRlciB0byBzdGFydCB3aXRoIG1vcmUgcmV1
c2FibGUgQVBJcyB0aGF0IGZpdHMgdGhlIExNIGZsb3cuDQo+IA0KPiBXZSBjYW4gY2hhbmdlIHRv
IHRoYXQgbW9kZWwgbGF0ZXIuIFNpbmNlIHRoZSBtb2RlbCBwcm9wb3NlZCBieSB1cyBkb2VzIG5v
dA0KPiBhZGQgYW55IGJ1cmRlbiwgd2UgY2FuIGRpc2NhcmQgaXQgZG93biB0aGUgcm9hZCBpZiBz
b21ldGhpbmcgYmV0dGVyIGFyaXNlcy4NCj4gVGhlIHByb3Bvc2VkIGJlaGF2aW9yIHNob3VsZCBh
bHJlYWR5IHdvcmsgZm9yIGFsbA0KPiBkZXZpY2VzOiBJdCBjb21lcyBmb3IgZnJlZSByZWdhcmRp
bmcga2VybmVsIC8gdmRwYSBjb2RlLg0KSXQgaXMgbm90IGZvciBmcmVlLg0KSXQgY29tZXMgd2l0
aCBoaWdoZXIgTE0gZG93bnRpbWUuDQpBbmQgdGhhdCBtYWtlcyBpdCB1bnVzYWJsZSBhcyB0aGUg
cXVldWVzIHNjYWxlLg0KDQo+IA0KPiBJIHRoaW5rIHRoYXQgZG9pbmcgYXQgdmhvc3QvdkRQQSBs
ZXZlbCBpcyBnb2luZyB0byBjYXVzZSB0aGUgc2FtZSBwcm9ibGVtIGFzDQo+IFZSSU5HX1NFVF9C
QVNFOiBXZSB3aWxsIG5lZWQgdG8gbWFpbnRhaW4gdHdvIHdheXMgb2YgcGVyZm9ybWluZyB0aGUN
Cj4gc2FtZSwgYW5kIHRoZSBjb2RlIHdpbGwgbmVlZCB0byBzeW5jaHJvbml6ZSB0aGVtLiBJJ20g
bm90ICphZ2FpbnN0KiBhZGRpbmcNCj4gaXQgYnkgaXRzZWxmLCBJJ20ganVzdCBjb25zaWRlcmlu
ZyBpdCBhbiBvcHRpbWl6YXRpb24gdGhhdCBuZWVkcyB0byBiZSBiYWxhbmNlZA0KPiBhZ2FpbnN0
IHdoYXQgYWxyZWFkeSBlbmFibGVzIHRoZSBkZXZpY2UgdG8gcGVyZm9ybSBzdGF0ZSByZXN0b3Jp
bmcuDQoNCldlIG9ubHkgbmVlZCB0byBjaGFuZ2UgdGhlIHNlcXVlbmNpbmcgb2YgaG93IHdlIHJl
c3RvcmUgYW5kIGFic3RyYWN0IGl0IG91dCBob3cgdG8gcmVzdG9yZSBpbiB0aGUgdmRwYSBsYXll
ci4NCkNWUSBvciBzb21ldGhpbmcgZWxzZSBpdCB0aGUgY2hvaWNlIGludGVybmFsIGluc2lkZSB0
aGUgdnBkYSB2ZW5kb3IgZHJpdmVyLg0K

