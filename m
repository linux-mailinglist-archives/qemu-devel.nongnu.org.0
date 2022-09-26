Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55205EB5D9
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 01:37:18 +0200 (CEST)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocxf3-0005KW-5z
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 19:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ruili.Ji@amd.com>) id 1ocxck-0003qk-7T
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 19:34:54 -0400
Received: from mail-dm6nam10on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::615]:8295
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ruili.Ji@amd.com>) id 1ocxcg-0004fD-EF
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 19:34:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncPp/VSmrQnpRnhtLPUtCvy3Jwain9Ey8dtNxmoieJWLxmXxKy8pqw+O4hk8ez4RZOmnHW2kYm7nE678sxDFjF1+DEFvB6Oj6FwX9EuRohgOk3Ykl7SbHx7bOrvTxWZp3yJciwmuffS5y7ocs4l7IJkU2xcboBa5FFMlrNN0cTwZRpZk5XeXYeFpfNp041mbQPxVIu9FEm2kFcpyL3PFGx0YP2ev9NdMMHEmaIM0TmD7WRJwoGLdR8jtmXdZAhcj3NCoJdQ5UVNI40KQrp2JQZj8f74RzwDjPGp+sEFb5hziYc0hQIwM2buN0pp1Z73MJuOJF5alnq/mQGXryTmPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lX91nJDqUh04eNuq38bcsQav9Vi8Y0YTnRyLNg1cGCQ=;
 b=lSlhlU/e+Yfnw86pH5p3UqRJ1ERBw809ctNNsywooptMdDXvNpY/dos8oCe0VZU+jUQccR+fyS+wHBqdIltBy6gBdkQ35rF9bShhNADDhmKiUDGXAaJYPbC3Vxx0xkQlFAklbHhF8WF2nZHI2yidoDS29uItZyBaJ7vrRHZJC7yjmMM+hCRlDu0MIqxOzp7SNRXWQDJi0ZuGYsZQElpwxxUulDY1NTFluNvvTTLOUuuOwHcpUSo6jlp2xxwHwquZMlVw5i2KI9O+CunafxRo9kZQX+ftAwD0MvQaGNi8OAqGZZ+UZlCAzsm7UFcfvjJJeW7dokL66Ofns/ANoW62Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lX91nJDqUh04eNuq38bcsQav9Vi8Y0YTnRyLNg1cGCQ=;
 b=l1JXkJCULg2/rWngLRmNnEQcg+vcU85BxyjkzgAwSB05oMTOR/sbaW6lPaHdEe6JkTM6tAQek2IiC3GuMeWmcT7hC+04EBcIaN7o12be2wCW4QpNtfE0ZyyV3ih7WsDI6yq1VqJk6lgYhwLAz+2l1fjmzm26B3+werlQc+mvkbM=
Received: from BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 by DS0PR12MB6487.namprd12.prod.outlook.com (2603:10b6:8:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Mon, 26 Sep
 2022 23:29:43 +0000
Received: from BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::eea4:efd:ad94:b0e7]) by BL1PR12MB5993.namprd12.prod.outlook.com
 ([fe80::eea4:efd:ad94:b0e7%8]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 23:29:43 +0000
From: "Ji, Ruili" <Ruili.Ji@amd.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Liu, Aaron"
 <Aaron.Liu@amd.com>
Subject: RE: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough device
Thread-Topic: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
Thread-Index: AdjBw9S5XjagBB9xT0W01YXm2Fq4yQP9o9QAABE5ABA=
Date: Mon, 26 Sep 2022 23:29:42 +0000
Message-ID: <BL1PR12MB5993B1A9A4898EE0CA7BDF2F9B529@BL1PR12MB5993.namprd12.prod.outlook.com>
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <YzHBXHFkefLkQJMe@perard.uk.xensource.com>
In-Reply-To: <YzHBXHFkefLkQJMe@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=86998a59-2480-43de-9c72-0f3b28e00c44;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-26T23:25:36Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5993:EE_|DS0PR12MB6487:EE_
x-ms-office365-filtering-correlation-id: 3efa8535-21e0-4acf-c0da-08daa016fd89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TJ3A0J9unRVEWrR0g61dUTlf5qoSvf2a4HlKr68FV4Rpn2bzuPkpMzoYrbttCZmEBlr9hF16f/LYD4jgwQGPrPOC3dysWKP0uA2kaRiZRwmi6qaHNvKExQUCi5K7EH/v4hNvN9gKzdsGYQuNhm1Iy9dgBAvidj9Qi+tH3+pqxa3oWqjVqZ2nqDkvTJTfumfTegBWHWFOgZHIUfBqAQfrA9G2zEkLs8p6Zmv5Z82ib/Aoz02H0SPgxrnkhT67GqHzLf3ef3qHiQqwyEa1OcdeIN/FEObuLo6yMMSogHzxIFPRIRztrGr6zQz9uBtO5S5HrcjSUeRsJ/ctdWu3Xfd0tETLKsB8ekh5gUpzyEV0CMVTzTNq/NGnuXEjIS9jhkvfU6YjK4ZPymo7ZOwaOTYXoQUJqXGZ+SJHPLegw5Eh66SGsyRewdpZYYlZJj0PC/UrG7YXogb68TRgsgnbuAmFC4n8EV80KW/elRxpehFTEzMmw1QNNZbd0f3M6AG2FvL55Vbs4WljM32aL0Kcv9I0hHdm7ZLrTwrUl2TWMmQDRg0fYRp7mXojreMdPXXPySlhmKA6VAO9jYpULoFJ0u0xZLUoubVmxKnfKp7ADwIxoKbmqPlAhy/lHZ+8VwtZZWXjy7/NAjE1mq+iORfU5ufODns+dYmNzj00gzyx6zHJauEuEUiiY+/RF38SrA4XMhnkMFlblPl+bCcPkfJSIsYToGnrCJWiOXxd4SGAYyLmmDrs/ybN9+oV1XhON1S9yQqAd9Q6j07a7xiaYBp5saK0xdH5Ps1jLg6mneXRIbm9Lu8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5993.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199015)(38070700005)(71200400001)(45080400002)(6916009)(2906002)(54906003)(478600001)(966005)(76116006)(53546011)(7696005)(316002)(26005)(6506007)(8936002)(8676002)(55016003)(66946007)(66556008)(41300700001)(186003)(5660300002)(66476007)(83380400001)(33656002)(66446008)(64756008)(38100700002)(122000001)(86362001)(4326008)(9686003)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWRtMmh4UDNydDh0aUxyMGM1K094TkhIbklyRXEvTVdIS1BYdzJrN2hJemNE?=
 =?utf-8?B?SWg2UVpiaUpwMlgvVmV0R1FqZFY1aEY5dWtjY2E0cHVhVENLM3RwQUdnYm5k?=
 =?utf-8?B?TDV3MUJqaDBFSkkzREpUNENBektoOXhYeHN3NDdkVDhEelNCWis0Q2RhVENK?=
 =?utf-8?B?QWdIb2ZTdFNzeTRPUGpXNldKU0R5SDFBbng5bkVMYXU2ckc5MytXVTdweHVt?=
 =?utf-8?B?QVpLcUhvc0E4UnBTRGhQbFZmdm9FVSszWUtCLzNBSS83eFp2WWpsVlpyclJq?=
 =?utf-8?B?UGQ3S3h0S0EzWGw3S1NpZ2RwQ09HTjhhZW5PMjZjVCtlM1E4VjZ0Z3hrekJu?=
 =?utf-8?B?Ylg1RVZKM2RNNldTblZqeFQwaUlhdjc3OGNsNnh4cTE5ZmZjYzhEUDhETGJV?=
 =?utf-8?B?UWxyQkRPaWw2bW5WY2JzWDhQUjAxanExbDhuVmZpU2MyUGtRVXEyWnRRUldU?=
 =?utf-8?B?ZHR0QXZad2xxWjZvcVNjbGhJS294Z1hvNEczZXdsbkJXNWIzOGtEVXVrcG8x?=
 =?utf-8?B?U2NEZzVwOXRHa2dhSHRYRW8rUkk0bWxGOEhIaXV3TkdPaXJXSUVUUysrR05l?=
 =?utf-8?B?QkhyZFplSTRTcXhWTGwvVWRXOGVpVFdkN3Z3a1pBMERjdzFIeEFZQ2ZxdENM?=
 =?utf-8?B?REFBSVR6YkxnZ2ZQVW9yWGphN0pOUHgrS3kzNk1lTUdhRU1FQjQwN0h5SHgr?=
 =?utf-8?B?d0RoNnZzdmR0MUN3dWpWQklkN2pBTXFiWVMzTGpyT3hiZnZiOW0xRTRmcTkv?=
 =?utf-8?B?aGxwOHZ4UGJQV2pWL3kybEFxWDN6VlN5SkpPek5ZdGVVeE9UOUgxM3JQY1A0?=
 =?utf-8?B?bW1iVUVmOXhjM1VVd2podU5vQmZxZ1dUb3FqVnJSbXBGTDFtaFhaaWwzZ3Bl?=
 =?utf-8?B?UmhoMEdBbGdkai85andFQjFiaGIzcDF0dzhHK0NobGpiV1VsYkY1NVNWdVVI?=
 =?utf-8?B?QWFpUHkxZjF2WXorM252cm5remQrRjh3c0lRSHJ4U2FHRTQ1bnZ6cWRlejhM?=
 =?utf-8?B?ZU5Ib2M2U3NUQzlwNkRiTkNYNzNQSnA3VitTbUdPS1VSSVhlQzMwK0UrM0dO?=
 =?utf-8?B?dy9pMUhRMFhWYzJEM1J1KzNiTmJxZjE5cGhRbUp0UUNaeWFET0RzamZVMEZV?=
 =?utf-8?B?YjR5WUduUkVBK0I5YXFxa1c3N1htUnFvREhYYzFQdXN5c3ZRMStGVXc5NEN1?=
 =?utf-8?B?eXBTWTJOVXNVYkx5K0k0dmk5ZXhMdkhqRnlJcDN3a2dWWStoUUwrNzhyNGJn?=
 =?utf-8?B?c280RDRLRnpTWCtjOXpzcWZscTdNUWpkT2owemF5WHlyQ2RrNXRFNTEzRnht?=
 =?utf-8?B?TlBTYjJiaHdnMCs4NVZka2IxK2NJVGJnRFFsQUFFY1BGOUQ0dDBKMEl5bHJl?=
 =?utf-8?B?a0o5SU9Nek9kQkJaMzl3akJyQXBNWTN6Nm9RS2NEQ1lKbkZ3VDlNOVBYNlZk?=
 =?utf-8?B?WWRwOUxYVCtEbXBTVEdQMWxxdUlWdElzdkpwTDRlQnJMeWlRdytPL25qT1pP?=
 =?utf-8?B?WmxvT0g5ZVpQSTlLNUtDUW0vb1hmbnlWZUp2Q1pvZm4zcVVSTU42bWR1UWdx?=
 =?utf-8?B?a2pkRnFwTTJQVm1pcUE4NHhjWHZOMk1yZHZWME9PZFZnenZCZ2gwbGxJZEFX?=
 =?utf-8?B?OGFWQnoyb2JuZUt5SnNDdVpFeUd1TS9PTnR6dFB6aXlaZnFiZHB2TlhucTBo?=
 =?utf-8?B?eXZMby92cnp3cE51MG1Ud2lneUhWRUgwRVBRTFFwVllaVDdDdks4VXFmMDNJ?=
 =?utf-8?B?MFEzWnhrWlJSaVhtUmFLRFk4Zkh6K01lV2YyelNLMnRUV1VRRTdFeTUvNG1H?=
 =?utf-8?B?RFVPQjhHN2pnZTgxbjBpQlVpanY3dVB2QXpNN2YzQWJUblpFL2w4VFBTNXhF?=
 =?utf-8?B?NWNuZEpid0lCbHFrcUpDcVI0ckZCYk9ZS3I0ZWlTN291alQxd1QxajZHcFVQ?=
 =?utf-8?B?Nmc0ZVp4VnJ6Mm51TXVkMWU5RWhacjNRcnFPNDlYSm5YWWV4a2NOTlhHbDBl?=
 =?utf-8?B?RzJZbFA3RzBjdjlJcXNIc0lVRXJzYzZXNnlCOGN2b2hPaTZneUI5YmRtWDI4?=
 =?utf-8?B?TTg5cjk1dnlUamlxSndkOVlVTW8yYTc2SFZLSFdsdUtRb1plcE02UUZyK3dX?=
 =?utf-8?Q?LvOM0X94R3wVFWsvVs9BIfHUw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5993.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efa8535-21e0-4acf-c0da-08daa016fd89
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 23:29:42.9416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+j7ExWeVcj37wNOP35UpyfxfI9z5Jk7KQWTHtfGZlKaVMOSEfLAIYSRPntnNYNQnbLuXtOzYQmBCwjxzWtYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6487
Received-SPF: softfail client-ip=2a01:111:f400:7e88::615;
 envelope-from=Ruili.Ji@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIEFudGhvbnksDQoNCllvdSBj
b3VsZCBjaGFuZ2UgdGhlIG1haWwgbmFtZSBhcyBmb2xsb3dpbmc6DQoNClNpZ25lZC1vZmYtYnk6
IEFhcm9uIExpdSA8QWFyb24uTGl1QGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBSdWlsaSBKaSA8
cnVpbGkuamlAYW1kLmNvbT4NCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBoZWxwISDw
n5iKDQpSdWlsaQ0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KU2VudDogMjAyMuW5tDnmnIgyNuaXpSAy
MzoxMg0KVG86IEppLCBSdWlsaSA8UnVpbGkuSmlAYW1kLmNvbT4NCkNjOiBxZW11LWRldmVsQG5v
bmdudS5vcmc7IExpdSwgQWFyb24gPEFhcm9uLkxpdUBhbWQuY29tPg0KU3ViamVjdDogUmU6IFtQ
QVRDSF0gaHcveGVuOiBzZXQgcGNpIEF0b21pYyBPcHMgcmVxdWVzdHMgZm9yIHBhc3N0aHJvdWdo
IGRldmljZQ0KDQpDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVy
bmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywg
Y2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQoNCg0KT24gVHVlLCBTZXAgMDYsIDIwMjIg
YXQgMDc6NDA6MjVBTSArMDAwMCwgSmksIFJ1aWxpIHdyb3RlOg0KPiBGcm9tOiBSdWlsaSBKaSBy
dWlsaS5qaUBhbWQuY29tPG1haWx0bzpydWlsaS5qaUBhbWQuY29tPg0KPiBEYXRlOiBUdWUsIDYg
U2VwIDIwMjIgMTQ6MDk6NDEgKzA4MDANCj4gU3ViamVjdDogW1BBVENIXSBody94ZW46IHNldCBw
Y2kgQXRvbWljIE9wcyByZXF1ZXN0cyBmb3IgcGFzc3Rocm91Z2gNCj4gZGV2aWNlDQo+DQo+IE1h
a2UgZ3Vlc3Qgb3MgYWNjZXNzIHBjaSBkZXZpY2UgY29udHJvbCAyIHJlZyBmb3IgcGFzc3Rocm91
Z2ggZGV2aWNlDQo+IGFzIHN0cnVjdCBYZW5QVFJlZ0luZm8gZGVzY3JpYmVkIGluIHRoZSBmaWxl
IGh3L3hlbi94ZW5fcHQuaC4NCj4gLyogcmVnIHJlYWQgb25seSBmaWVsZCBtYXNrIChPTjpSTy9S
T1MsIE9GRjpvdGhlcikgKi8gdWludDMyX3QNCj4gcm9fbWFzazsNCj4gLyogcmVnIGVtdWxhdGUg
ZmllbGQgbWFzayAoT046ZW11LCBPRkY6cGFzc3Rocm91Z2gpICovIHVpbnQzMl90DQo+IGVtdV9t
YXNrOw0KPg0KPiBSZXNvbHZlczoNCj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0bA0KPiBhYi5jb20lMkZxZW11LXBy
b2plY3QlMkZxZW11JTJGLSUyRmlzc3VlcyUyRjExOTYmYW1wO2RhdGE9MDUlN0MwMSU3Q1J1DQo+
IGlsaS5KaSU0MGFtZC5jb20lN0NlODJiNDA2MjI4MTU0NjVmNzVmMDA4ZGE5ZmQxODk1NyU3QzNk
ZDg5NjFmZTQ4ODRlNjANCj4gOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3OTk4MDE5NTU2
NDE1NjkwJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOA0KPiBleUpXSWpvaU1DNHdMakF3TURBaUxD
SlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzDQo+IDAwMCU3
QyU3QyU3QyZhbXA7c2RhdGE9a3ZJRmk0eURNMiUyQk1Vc0lrdWFOSmVxYzBDNmVQc0lsZnFqMXBT
a3pJWnFNJTMNCj4gRCZhbXA7cmVzZXJ2ZWQ9MA0KPiBTaWduZWQtb2ZmLWJ5OiBBYXJvbi5MaXVA
YW1kLmNvbTxtYWlsdG86QWFyb24uTGl1QGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IHJ1aWxp
LmppQGFtZC5jb208bWFpbHRvOnJ1aWxpLmppQGFtZC5jb20+DQoNCkhpIFJ1aWxpLA0KDQpJIGJl
bGlldmUgYm90aCBzaWduZWQtb2ZmLWJ5IGxpbmUgYXJlbid0IGZvcm1hdHRlZCBhcyBleHBlY3Rl
ZCAoSSB0aGluayBhIG5hbWUgaXMgbmVlZGVkIHdpdGggdGhlIGVtYWlsIGFkZHJlc3MpLCBtYXkg
SSBjaGFuZ2UgdGhlbSB0bzoNCg0KICBTaWduZWQtb2ZmLWJ5OiBBYXJvbiBMdWkgPEFhcm9uLkxp
dUBhbWQuY29tPg0KICBTaWduZWQtb2ZmLWJ5OiBSdWlsaSBKaSA8cnVpbGkuamlAYW1kLmNvbT4N
Cg0KVGhlIHNlY29uZCBsaW5lIHdvdWxkIGJlIHRoZSBzYW1lIGFzIHRoZSBhdXRob3Igb2YgdGhl
IHBhdGNoIChGcm9tOikuDQoNClRoYW5rcywNCg0KLS0NCkFudGhvbnkgUEVSQVJEDQo=

