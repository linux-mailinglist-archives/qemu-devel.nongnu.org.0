Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ADB2C967C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 05:27:40 +0100 (CET)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjxGN-0003kB-DB
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 23:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilmut@microsoft.com>)
 id 1kjxFH-0003Az-73
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 23:26:31 -0500
Received: from mail-bn8nam08on20722.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::722]:4897
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilmut@microsoft.com>)
 id 1kjxFE-0002RJ-HM
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 23:26:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIo5iKlneM8yoGSNnbMkJkaJQ8zP2ZxCfJQFcSwbw/GGIrwqUxR7JotBVdjxBXkrGPzSuxB5N62kFDMWGh/kwYtyC09P6XTiHQ4r+2hUXSXX1rX+P6aLD8PHsTZuZua45REDGLrVRTQJNQg3MUbEs8oY6f3QCRcDOA8g87RngJI0DhyW4WCnt4ShNgbnrGH4YgmD2O0Idv7pXmtGj4YeSe17r5sB3kwkNdJ3o/1wzq+0VTdozc5lZEYBx6nZhdzZVMDlvsucnx9qJ+LT9nHe8uak+ZjS6jmFCOji5of9XuBmzuNra1MAQwQAnDISbqsgrwFxlD/yK30i8WHvIS6H6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq4OL3Aw7PjSSFIbsnF6upFE+fuZ89YPmFOGaGOzDog=;
 b=FVdsigaFoR3V2zWTF+FJ7yMraq+wwi2590steoQI/iDPreS3TiligSI3VJ7nWAApn7RC4hsjwtzm0Dj91a2ySOFRDbKcatzIMdWXbAaUcTRqT4EKXZ4udKkRfAHFmkp6v7xrB0BhmWhe/KfG8X5bKRocHNU/2HHRqgnb+HHJpemccDU/I2DeeMX2t2znr7Tt5EB7Q/6wnxAPBYNpFZHK1gEQco6wE8RT/TrCN5PZeWkPPNM+CsmDPrmj1P5KoK172u5LHJB4buMFyhY6wmPHXOlC1ZtMAhbZ7DXUkhxjJgtFurQqx/EvDdZ4WsGQoXXNAupDk0w+lryamTRfZpkObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq4OL3Aw7PjSSFIbsnF6upFE+fuZ89YPmFOGaGOzDog=;
 b=BU3uUSszCFOL3KeZAvNwEFBH0AjsVMp+mLqc0abmBsnDB4LMxNtGZIV4sblERSIAikr1oze0PGGr8WGrtqLuw1FYaO48dn6Gqijcbmr7RtsbJruJfoLLluV7Rlazdi2mbCrtGIGeCPw0zzgiufuPWts8Aml7UYCrIkZktmjbDI0=
Received: from (2603:10b6:803:51::33) by
 SN6PR2101MB1662.namprd21.prod.outlook.com (2603:10b6:805:5f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.2; Tue, 1 Dec
 2020 04:21:22 +0000
Received: from SN4PR2101MB0880.namprd21.prod.outlook.com
 ([fe80::e18e:f8c0:3ce9:4467]) by SN4PR2101MB0880.namprd21.prod.outlook.com
 ([fe80::e18e:f8c0:3ce9:4467%7]) with mapi id 15.20.3654.003; Tue, 1 Dec 2020
 04:21:22 +0000
From: Sunil Muthuswamy <sunilmut@microsoft.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [EXTERNAL] Re: [PATCH] WHPX: support for the kernel-irqchip on/off
Thread-Topic: [EXTERNAL] Re: [PATCH] WHPX: support for the kernel-irqchip
 on/off
Thread-Index: Adas0RxcthvFsJ2WS/aqzKrrPtFLbAAZ93AABYxYC/AAAxhBgAEIm/Wg
Date: Tue, 1 Dec 2020 04:21:21 +0000
Message-ID: <SN4PR2101MB08808315D017124D795824A0C0F41@SN4PR2101MB0880.namprd21.prod.outlook.com>
References: <SN4PR2101MB0880B13258DA9251F8459F4DC0170@SN4PR2101MB0880.namprd21.prod.outlook.com>
 <167595b8-bf4a-b961-cfaa-593a3f8d1940@redhat.com>
 <SN4PR2101MB08804B299AF5979564CB4CB7C0FA0@SN4PR2101MB0880.namprd21.prod.outlook.com>
 <dea94346-0f74-54db-f541-dd749e5608cf@redhat.com>
In-Reply-To: <dea94346-0f74-54db-f541-dd749e5608cf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2601:602:9400:570:20eb:40ac:c2a6:31db]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5555899-1824-4baf-cfeb-08d895b08f1d
x-ms-traffictypediagnostic: SN6PR2101MB1662:
x-microsoft-antispam-prvs: <SN6PR2101MB166268834AFF5194F59F1234C0F41@SN6PR2101MB1662.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fk35vHZcGVPgO0s5yVpYSuoflZs20oUncm15Ae9nSw7To9WqTiNJjFUriqNZEEcNf06YHVgLkRvSTPM9UMGMpkm/3PnCH9gNgMZ98m0J+d7s1WavWyGYMX2lXtA9AFSyzbB2SCiFnXmkcNwrsxtgR5UEWquJk/H2RBrGVTNEYdVO8RC0feZbKBnSwxi2vYaJKMrK3xOjxLWer9bBfdMxcbBvyJIYvFzh5GjUwRX04T7eHfggt4n1fQXID9CtxNCamYqmT+mSz3EJVUQ2wOA9Sgme5zP7NPR/Yd0xdA6IWN4R75rxNmV3R4GEbxyBLcDBaixmJ9NezwFpThcXxL8CRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR2101MB0880.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(66476007)(33656002)(55016002)(9686003)(558084003)(86362001)(8990500004)(8676002)(8936002)(66946007)(66446008)(478600001)(76116006)(2906002)(10290500003)(5660300002)(186003)(66556008)(316002)(71200400001)(52536014)(82950400001)(110136005)(82960400001)(6506007)(7696005)(83380400001)(4326008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aUNBMG11VHpCOW0rN0w2SGJnTUlROW5KRTRMWDdINnpmKzhKbGNkMWRjeHlR?=
 =?utf-8?B?SVBadEpqS0VNNzFPWU0yUEM3MzNQWXJ3QVhTeGJZTGdPWk05KzlENEFlbkRm?=
 =?utf-8?B?MHRubTh5eU5pTEpwQ2kzeTlESG1JeDNwMGJLZ0JPL0NVb1dWT2dxTU0rZG1y?=
 =?utf-8?B?d1hoVnJrbDR2RXlxQzhsRVBUbXBlNW0wU2RWcFVlaDUvandxL3cwU1lLc2Z0?=
 =?utf-8?B?Q0VpVjlnYkY1TkVXZ3o0ZGhmaXpPM1hyWGFXRzZ6WEV6Y0RPWURxMUpqa0hw?=
 =?utf-8?B?Z3hmTVgrNVVsSExZWVlPNSsxTGxHc2p0bGlBNE9tZ1FrY053VGx3NTBhOVMy?=
 =?utf-8?B?WmNYVmFMNVRxczVPam4yZkRNb2hDR1kvNk81Ykd5RjdxWXd2VUJhUWpIeTBS?=
 =?utf-8?B?dHVXY0ovbVhObnpOdDdIMXJ5dm9LMUFoUVZkaTU0R0dHRjF3NDhZaDArSEF6?=
 =?utf-8?B?SFdjZUJ3RFNraTNqYURuS1VIQm1kMnZzMUE0YUw3WjNRNnNYdnFhMzFOWGNJ?=
 =?utf-8?B?QytFdkk1eWxZOG5MU1dXaklxSkhzODBkb016QzBwMmIwSm5WKytweEkzODVn?=
 =?utf-8?B?Y3VnbE5KS2RTTVBNa0Q0eUxiVEZSTE1WRFB6ekJpaHNDYXh4Vis1OTZFd2FT?=
 =?utf-8?B?U1gxTmFDb3FPOE4xc0NOYnRSN2ZlZVYrRVlia1BzTFprRVoyOG54cWVYdytY?=
 =?utf-8?B?b1BjNXV3dnlkZHN4UVIxYzF3MWZCTStjVUFLYWVsMnNYQUlySmtqVVA0T1lu?=
 =?utf-8?B?a09EbGZOM3lZY2psaFR2MW52M3kwUFFHUjRFRGhaZkpYYlpCNzZ4bXhSSS8x?=
 =?utf-8?B?bS9UQTBHSTl6UE1JZXJFcEJRZEpldkxIQ20venRYZ3hnQ05LaHNiUzBISmVI?=
 =?utf-8?B?TDk1RTRHUXJBSjliQ0x0MUx2bnpJQ1VheUxoM2NOc1lUSCtzZFJaNWVVdkhT?=
 =?utf-8?B?TWVLellhUGZlWE9vUStWOEtMeEFYOVdYMm9ZRzNHcTJpQzF0K2R5UnZzNU0r?=
 =?utf-8?B?V2o0Qk1rcUppNFZlS3NPUkw0bWh0RldMMGdBaW54d0lubWNQNE1tYStlaE1a?=
 =?utf-8?B?RzVYQTg4Y3lCajF2eFVnbTFUZzZhT1hGUmtsYnVhcTRrVzU4Q1pLRDg4M1A0?=
 =?utf-8?B?cXNCTmpnK2lDYmVvOHdYdiszbFU0Wm1zcUl0NnhTdCt3N1UrMjQyYzZ4dklY?=
 =?utf-8?B?bFRldlViTEtHSkVkNTFHSHVnYW9CdDlQdUNOZ3RkZkwyTmtVZ2pwZXlRYWs4?=
 =?utf-8?B?eXhxMWcvbXRaWlk3d3lGNnFxbkF3bkN2QWpXQUtiOXhoRENJMG8xcGlsWGpX?=
 =?utf-8?B?RklTWTU5L0NWWktmUXFUVTQ1SHdzNE1GMG1pZ2ZFcUs1aVIxRVNRTld6T29P?=
 =?utf-8?Q?d4FuYjA7jfNvIyV5glfUmLy8X4n2lcPk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR2101MB0880.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5555899-1824-4baf-cfeb-08d895b08f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 04:21:21.9814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BhMQjAwNDeIGP0evPZAMQzdE7I7CixtpmfvrTqpHSeqcH6e1TFywFZY6wnN+V5Pt+Dcfxlqqi2KPUjYRG5TrGtVwq+EVrPr4DjoCAnyuUN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR2101MB1662
Received-SPF: pass client-ip=2a01:111:f400:7e8d::722;
 envelope-from=sunilmut@microsoft.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQo+IEl0J3MgY2xvc2UgZW5vdWdoIHRvIHRoZSByZWxlYXNlIHRoYXQgeW91IGNhbiByZXNlbmQg
KG9yIGlmIG5vIHJlYmFzaW5nDQo+IGlzIG5lZWRlZCwganVzdCB0ZWxsIG1lKS4NCj4gDQo+IFBh
b2xvDQoNClRoYW5rIHlvdS4gTm8gcmViYXNpbmcgbmVlZGVkOyB0aGUgc2FtZSBwYXRjaCBhcHBs
aWVzIG9uIHRoZSBjdXJyZW50IG1hc3Rlci4NCg0K

