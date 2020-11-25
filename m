Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E12C4931
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 21:41:58 +0100 (CET)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki1bw-0001qL-GB
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 15:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilmut@microsoft.com>)
 id 1ki1ac-0001IN-J6
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:40:34 -0500
Received: from mail-dm6nam10on2070f.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::70f]:3937
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilmut@microsoft.com>)
 id 1ki1aa-00068J-Du
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:40:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imdOs8iNyCVCmXn7Oz2WEZMN412rFLoiE6L0mmegcgDL4pxB8Z6SQqwd8DEPkqm6dtcbufRDIs/rumUn4bgGQNPXjebFyx4qxPrWyb2TuXHyD8cfjE4SoBBgSqT1FXPv419ZUkbfb3vVF5yNfEx9sAv/RmyS4lNZrpPhbKjuJ06l2Vh1nC5e7r5BUZr4YNZwwjlQMVgp/WsbCsM2M6xiXo8JuMmxGg6Iwebkx+8Q93p7n9AlJnFft7auiX94VO5RhUEz2CT0vXPr+yHXnNNnwIoRC6yTE2JVwUzJH4w19koom3VKRKLitHSqJddJogCIOOEe7sARFYkFNlE/Gmwiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2oUbSZvzgMFZizMqMCp/tuSHvA7fOD7DsMOR+DaR58=;
 b=SmbbLqmVEhcTvSBeZGcrR+hMRfZ7lRDpxV+XzMg13UbHE3ZEtlN15UhGP3mzlmNctVHR+KDN0qrQcL62jfoI3nVo55pc1Qi7bIeyWVQKj2voULhvMt64PlDx7xB8d6AVOSSYOoKh/TvNNZ2JGVwK9K1EPyCCisTuoqCWx+qoRY9A1XbytF4RbKKPDyhe5mXaNqeGPWncYaHAqY5If24hAzzCCrPpwVg3zoIYimoGJWHC58wUFu5sOaij3WuTChFtf7H6kDgUjKtq29anDIj0qOgdB6vyUvseH8Jbpj5x8dGAEwMaF8QZsLo+GEYkyg9vFf5SHWGOdqkFw2hJnQm0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2oUbSZvzgMFZizMqMCp/tuSHvA7fOD7DsMOR+DaR58=;
 b=frBZmN6gP7XY3dtSzWSNuE3N8xFhbMe6yQkJNWS3z4UTfkwjCVInzIA1usBfxYfAZN19UeYDEEccvBgLet4jfExUcJu1kSxMpG4AMVtJLAQ8xJcebw0M+SYRrg7tmwvc3AXEMBv1HI8Ja0D8Z+tUUS4sfhBve83u0qA2LbDvObw=
Received: from SN4PR2101MB0880.namprd21.prod.outlook.com
 (2603:10b6:803:51::33) by SA0PR21MB1883.namprd21.prod.outlook.com
 (2603:10b6:806:e9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.3; Wed, 25 Nov
 2020 20:35:26 +0000
Received: from SN4PR2101MB0880.namprd21.prod.outlook.com
 ([fe80::4800:bf00:4ee5:fba2]) by SN4PR2101MB0880.namprd21.prod.outlook.com
 ([fe80::4800:bf00:4ee5:fba2%8]) with mapi id 15.20.3611.020; Wed, 25 Nov 2020
 20:35:26 +0000
From: Sunil Muthuswamy <sunilmut@microsoft.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [EXTERNAL] Re: [PATCH] WHPX: support for the kernel-irqchip on/off
Thread-Topic: [EXTERNAL] Re: [PATCH] WHPX: support for the kernel-irqchip
 on/off
Thread-Index: Adas0RxcthvFsJ2WS/aqzKrrPtFLbAAZ93AABYxYC/A=
Date: Wed, 25 Nov 2020 20:35:26 +0000
Message-ID: <SN4PR2101MB08804B299AF5979564CB4CB7C0FA0@SN4PR2101MB0880.namprd21.prod.outlook.com>
References: <SN4PR2101MB0880B13258DA9251F8459F4DC0170@SN4PR2101MB0880.namprd21.prod.outlook.com>
 <167595b8-bf4a-b961-cfaa-593a3f8d1940@redhat.com>
In-Reply-To: <167595b8-bf4a-b961-cfaa-593a3f8d1940@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2601:602:9400:570:a594:9abd:a362:86a0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dc651fc5-021d-4ee6-e92e-08d89181a3fb
x-ms-traffictypediagnostic: SA0PR21MB1883:
x-microsoft-antispam-prvs: <SA0PR21MB1883411B2C42D89134D12918C0FA0@SA0PR21MB1883.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KyCqXT+ti0zaShklRCa2DWwgCXg8C+TkFOJklX4nA/YZ9ncySwCQpgjrVsTlq7urMZCoSUTtKM29MiVF3LfnpyvwiTJ+R11weloJfZz+TRNsnImgXX6OGQjYxtFuqzTniajzELSXBPgcNihcybpCKxsBcAVWdkuu0frMA3OebhlMhRHQMho3Q8hNf8a2jU+ng0Kvy6B8WMsAKif+4TVH/8rqh1JCYaE3qYKPFiV+yKvmAtP2PNHCjKM2eacSJ6yJUvkqQg4iq7PTCMvkWiU6qXCjZmfADViURkEtkH89ggzB4rgaVjC0D8z/navwZZHgVaAO2EU0hp4L5JJl/mj1wQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR2101MB0880.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(66446008)(2906002)(9686003)(186003)(82950400001)(55016002)(8936002)(64756008)(110136005)(558084003)(82960400001)(8676002)(71200400001)(33656002)(66556008)(66476007)(66946007)(316002)(5660300002)(478600001)(10290500003)(86362001)(4326008)(6506007)(8990500004)(52536014)(7696005)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?emVZNkVza1BOQ1oyWkh2OEwyMnpVZ1hRVFBUVk5MUytqYXRoMFB5OUJlU1Fa?=
 =?utf-8?B?WnhaMjdZb3FzM0xDVDBFRU95TzNkWWE3OWRZUDNySWJrUU5DMFZGRlZiWHJt?=
 =?utf-8?B?Z0plT2s3a0pQN3FlRkFHVElINWJKZGc0TVJmNS9rMWpkQ1pseXJ5ajZ0dGUw?=
 =?utf-8?B?ZUo2Wi9XRS9wZ2Y2aFZaS3ArWXY0bHFRcWYwYWlrSVdpak5MQjZURWZTTXBm?=
 =?utf-8?B?ZFc2RC9qZzhTM3lXUG5NUW00UjBtSGFmekFpcXhuMlVGd2Mzajh1dTR3ajdZ?=
 =?utf-8?B?aHMyd0x4UWczR3RNdG11Ymt2cExWQW0yRE5QSmloRitEdHRyVTc0Sm9YMXFa?=
 =?utf-8?B?YnFjWnZqM0F2djZmT0VQTnBZYXFkcERYU3dNNUoxbXhaRkEwWHZ1NlF0b3Jk?=
 =?utf-8?B?OElBemNhRGNJY2VPaXRrMlFjZ296bXFXYUduMWUwUVVnME80aHhrcWlqUUdk?=
 =?utf-8?B?U2pQUlQyZ2tlZ0pwemV1ZkM0WWwvK01lRmFGcldnZVpxZ1pEYlB2L1EzcjQr?=
 =?utf-8?B?SitMUW41ckZZZnBKQlUyU3ljcTdKTjVDVldhRzUrOG5RSjR0bGI0QW1wblZE?=
 =?utf-8?B?RVlTdG4yRHRqVE1HdHVxaUw4T3pPcnU3R2xmcDFiKzJqcm40MGw1UnpsUnNs?=
 =?utf-8?B?ZFpSMERpeGdOeURQaVh6OFFyS0FxL2ZkeGhDWFJaQldyY1lHcjFSRVgyOURU?=
 =?utf-8?B?RXZHMVRodVRFYnNCOWVWTU4wZm0rbE5SWVZkUTJ0c3htMmNJeEUvcVA0QllG?=
 =?utf-8?B?QnQwV1BmR1VKWm9KR2ZlUTdEcDc0eTJSQkJCZk1teXkrNk1EbXNGS2UyV1ZU?=
 =?utf-8?B?dkFjQ2ZueFU3OEZ3L0NWUlpHdTBTM1I4MmZGQTlKR1E3djRZdlRiUS9Pbk03?=
 =?utf-8?B?eE5qU2VlQk4zRFNmTHg1ajVEb0F4L2pibDdWQXZOdWt4Z01VSkM2UWtsVTVs?=
 =?utf-8?B?SjIrVzNmNmkzU2RTbEFiSUZoS0NoVXVpS1BuczRvZkR3cG5QRW1Vc2xSUk9Z?=
 =?utf-8?B?aXNZMW5uT1h3NGxuSWdlODEvWFQ0M1prNThPRFF1YW03ZU4rcnFKaFl0RE9T?=
 =?utf-8?B?S29kclp2QXRkcm9QTjVCT1FTbGxzc2RxeDJPL3huTjdzbUpMaDNxRlFzdk40?=
 =?utf-8?B?U3I5TXdwU2NRd0VSS2hzKzYyR1NlYVFZbWpkQlNmRVNlVndlVkFOMDR0b0RK?=
 =?utf-8?B?ek9FYms3STAyb0NVY3ZPcER1eGRDd250Q05SUHBRRnpqTFVHeFZmVW56M3ZY?=
 =?utf-8?B?YVBrMWNpQmg0RjJId0FQTmNUTzAwQjNKL2lNc1draFZqUGgyZHBPN2wwV2ZG?=
 =?utf-8?B?MjB5N2VReURRWGo2QWVydFBBNk5VU3ptTVFVak5MZlNDQTBBMHpPYnZOc3FV?=
 =?utf-8?Q?C7/lGkRigIYR9zSVMBZJS7gISi8D+fls=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR2101MB0880.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc651fc5-021d-4ee6-e92e-08d89181a3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 20:35:26.0529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMhZTGeP1TMObXPLLm0gtchipWPM3HHoDbl5dQ+2m+Sj6JKh+qlR3/h35gjt+IF8LIcwk69m3O3ku/2B3qCi/Elus8ZLU5nP8ik9GQrdvG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR21MB1883
Received-SPF: pass client-ip=2a01:111:f400:7e88::70f;
 envelope-from=sunilmut@microsoft.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ID4gU29ycnksIHRoaXMgaGFzIG1pc3NlZCB0aGUgNS4yIHNvZnQgZnJlZXplLiAgQ2FuIHlvdSBw
bGVhc2UgcmVzZW5kIGl0IGluDQo+IGFib3V0IGEgbW9udGg/DQo+IA0KPiBUaGFua3MsDQo+IA0K
PiBQYW9sbw0KUGFvbG8sIGlzIHRoZSBicmFuY2ggb3BlbiBub3cgZm9yIHRoaXMga2luZCBvZiBj
aGFuZ2U/IFdoZXJlIGNhbiBJIHRyYWNrDQp0aGUgYnJhbmNoIHN0YXR1cz8NCg0K

