Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EB74B1CC1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 03:59:43 +0100 (CET)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIM9u-000459-A8
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 21:59:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nIM7w-0003MC-4z
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 21:57:40 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:46205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1nIM7t-0001iA-DJ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 21:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1644548257; x=1645153057;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=acNkxNkhmZ29lPLEnqF87hg188hH2tZK6D2J6baszFM=;
 b=s7DyIowrYKsETtnILsn0WwEQGVWg4OMFv3E8cYlhPxQj8aJaO0WRm8jk
 c5W0SRcH7F2iplfEI1mrAo9XbXqoALFttJhHMaJCqVsxeg9/qhfeYywYT
 AkaCOtjzWRMrwAxWNe12p5SmrF+EkpwCHVo4bAWmQQ+YRKgU/xknBQ/AI A=;
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az9acZnlLxeyuoqkVkblZ+IXmoO0oTNmxhTyYBq8Qy9jEPdX8EjfudYbcnmXUSbS3YigeQMJ+1xJDQzNKvxGvzD77338Cb3v0kVjDkIKFoppSA2r/2sVeh4VhwitA1szC1CNWpTJYEvqM57QxuQW9gr7fjtG7sWGvxLg6aNf+jH5Q6ZbpXL9/YGSDTRwPC+NqNWX05ixQfZynCnu4YVbh6ntBQnQ4CAldQc+jYPm1IBOT00Do4Df2EwUHlbW/QLFUDgLESoG95Pauta6KDvsoqFkLtPHx2J1nUluOWkghVTOLzXvmkTdLi+0Ay7uLojo67I13sy2NKRXl9unIhglsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acNkxNkhmZ29lPLEnqF87hg188hH2tZK6D2J6baszFM=;
 b=FtAfjrdtg66vAd6Pi5xzSMpB3CGuAcsQHVKeyx/Dwf/grq81T3PpJsc3XMSqy4bVbJnYbN8b2OK3YNkv5PxwzUbg9kzbupPSD+a4/w6FnkYJP6L5ZDpb/frNOLqvyVJMrSw+kPphFHr2BJ8RHkbQEGcr2IpzFNEYbw51r0ZaIyEDPIjCeSQAxx0pCqqFm5eFfeHTUU2qYG4wNowGIPPf/qtVcmbGvO5PZ9p7pdOQKv+fgT+ZyXYn2eQ3Q1/X8tScJ1kci/Qh4eDajqJ40th97wcPIDt0wWvXozowgAZIEzzTryWHofybeaxLqkdw9ggqa7eKYVRqPLWo4uFUUVyiMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BL0PR02MB3649.namprd02.prod.outlook.com
 (2603:10b6:207:4d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 02:57:32 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::bd2b:92ca:d25e:9d10%9]) with mapi id 15.20.4951.014; Fri, 11 Feb 2022
 02:57:32 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Thread-Topic: [PATCH 11/15] target: Use ArchCPU as interface to target CPU
Thread-Index: AQHYHgF2SVTRlM5SbUGKmF4H97ngoayL0hWAgAE1szCAAIeigIAAGeWA
Date: Fri, 11 Feb 2022 02:57:32 +0000
Message-ID: <SN4PR0201MB88089AC229C2BEBFE6D37E9BDE309@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220209215446.58402-1-f4bug@amsat.org>
 <20220209215446.58402-12-f4bug@amsat.org>
 <83e91592-af1b-de86-83ce-a3fcf467fdf7@linaro.org>
 <SN4PR0201MB8808BEEAFCF4A89EDBB2165DDE2F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <048e19d0-0dc7-919e-fd46-3130f1b08111@linaro.org>
In-Reply-To: <048e19d0-0dc7-919e-fd46-3130f1b08111@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6307064-2d7f-4398-cba2-08d9ed0a3fb6
x-ms-traffictypediagnostic: BL0PR02MB3649:EE_
x-microsoft-antispam-prvs: <BL0PR02MB3649B0685170E672BD0065B1DE309@BL0PR02MB3649.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C4lANchxaSUerRzB9HlGi2bak/WOfZRMrVivUwSonDuicE0iquPTcK35/EYzLjYFnkRpfVYxwT6LdQ4VPvDM1dF1Qy6/4v2JQEZvuqWttuA5cVzcYquQRysbMmztjdWO3j1w+D1nZ2Mtiqe2ddRxrKXoQhSwJleGa9Se36X00r1KUwGfk4UiXzPvDAvIKQYAfh6WMft0MNkFU/83xtQ5COOEdi04/V1NEN17X/Okxed8XZ+DsrR+lp89CVQCh2NbZ4Yamd95OHHSalhM0mrSftKCGq23oORjvwBjXIPZipLD72LsEV6qV3IaEGi9p2h9Ozjez9x2clVHo+Y7syrRKrpfdJCaAfJIU86iYJty5WZGHOPO9jBAWMLdhGpYqewu5nkR5BqN4Vcv9GldYH7QhKkapX+64fKui81HlKGqO38gdzG8ZubTDIMhY4QTnDqtUk+piUzd5hrDk1JHTa95uZvdyPmX80cLdUCEoT4zkDWAscoi8eli6OcSPRYTE1fhzkX8Hyzr9e6+w8OfxXdmU866TxaPR5NCsQ/NzT+IvRia2XczGBK0qmeebEMHzdfCGAJPN+HQFGi/C3NutO/cDThukco5QTLAKvT90hlMqhldGHD02X2vLUM/HrR/qy72+OR4ikhX32Iz4R5Vf6lvpmoxDT+aTSAV1lAREaix+JolqKVtmXQGBA+hh5jIsQkND6DfzJ3oxdclJZBuWM7VCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8676002)(86362001)(76116006)(55016003)(508600001)(8936002)(38100700002)(38070700005)(9686003)(52536014)(83380400001)(4326008)(66946007)(33656002)(66446008)(110136005)(66556008)(71200400001)(2906002)(53546011)(122000001)(64756008)(7696005)(66476007)(54906003)(6506007)(316002)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bU1oWTA4bGFad1k4TGc5R2NmTTNUek5BSk9UblQ5cXNLWkRIOUJXbkVXQVhZ?=
 =?utf-8?B?T3ZCcVdDSmhFN2NtKzc1Q1lDMlZwWVpTZ3RVSXZNRTVROXZPamduSGpIZ0JH?=
 =?utf-8?B?MlRWcVBIYmpCeldvU1B4aGgyU25NNW9rc1YwZjBvK2N3MUg3YWVLWlZYNGJB?=
 =?utf-8?B?ZFdRVDh0VSt5RnhrRWYyaS9UcXZBc0pDUm5PY0V4OVc3eTQ1dm5Ncjl3djBF?=
 =?utf-8?B?eGtUdU9SVFJqdktJMlhneHpyQTVpT2xOaHh1M2lQOHc3Vm16V2V4S0ExZ2ZL?=
 =?utf-8?B?dG9kZHhnYS9DUW43WE05KzlmaUpPek1xcDVNTXh3Wk9FanZUVEFBcE1kRjly?=
 =?utf-8?B?cEZycWM1SFhweGZMZUVhV1Y2cmg1L1VFeWVoZzh6VnQ5MEdiOENQcTlsWk9Z?=
 =?utf-8?B?V0pRMCtEOVZLUU90NHloOEhyN25yNldrVVp6TWp1ZDJTaE5OS0tVNWw4MWNO?=
 =?utf-8?B?UkRRRnF6ZXZKeWFKeDFLUlh6UUw3a2JwcHVoNE1aVmo5aTBySEVxSTk4ZXRT?=
 =?utf-8?B?aGFOd2RwWGJQSlNvZ24yQnErYmRBQlBUMEkrRUFiUElIQTZaN2tTU0hYNU5B?=
 =?utf-8?B?YVpDRDFYVmUwYlNLT09zbU5FMStRR05Hd2luMnlZVWJUcEdXQUZpa0tvUG1j?=
 =?utf-8?B?ZTI5RENiNVl4QVNWZFBScHc4ZEcyaFQvNWxtR0xVQitxWHF2TVhtSUg4bDRa?=
 =?utf-8?B?UEt0emJRb3hqaExJdm1yUFhoVmdKN1JXNVVvRjc1eWtGT3d2OEdCbmVQdkRw?=
 =?utf-8?B?RzB2NmNBV2g5QXVXSlJlUC9WdnBrQXEwd3J3NHVHZHdrMzE5UnJGT0ZEVjNI?=
 =?utf-8?B?UmsxTy9SYzc5UTFhYkxhWCtxc003MTJiTUEzZG42cURGTWNmb0IrL0NrSFFu?=
 =?utf-8?B?UVpvbUN6NlFpTzloNnBybjB4b3VsTzZhK0p3S2N1dERmWUpjelFmcHMrL083?=
 =?utf-8?B?eFZ6di8zcGErem83ZmxtMUJIdjAzTlBHZVFHT051Slo5L1VheXZWM0swc2xr?=
 =?utf-8?B?amZ4UzZMdnhCT2k0M3ZQTGJiZXQzOHBUc2xLZ3plWmJEd1poanNET2tJbzR4?=
 =?utf-8?B?MmF3SUtncUVMVzVxbmVRQjkyQ2Vmei9YYVR5Q1dNMHJKQjQ4V0tlY3Rzbi96?=
 =?utf-8?B?NTJ4M2RNeGc2c2w0ZzhZNlVBbmhIYXdoYm1TL2JTL0V3anh5TityeUpVcnRN?=
 =?utf-8?B?QVFmN0VpRUJqMlFvSmFqVzdVQmh5cUxVa21EVXcxN1VBQktIdlJSdzYySHRr?=
 =?utf-8?B?UVZSM1NycWFZRCtvdUVkWlZYa2Y3L3ZkYWNnOGtDaEZnZDlVZEE1WDRRWkxS?=
 =?utf-8?B?SWF1UjV5MFRES21mejZFTGNDNmp6emxjK0dTdUFTZ3dRcFA5OFVvRTdtZ0Fo?=
 =?utf-8?B?THZwVUY0ZUo5U21mZ3hEUmU1eHZLazhkNHNFckZ4aHU4RzQ3c2xzUFFYWFNp?=
 =?utf-8?B?bjA5N0t4UGdmQ0lOWlExVjBWMm5QMm9xblFzM0NKY0JkbWRrRmxoV245VmhU?=
 =?utf-8?B?UnJFamROY3dNM0taRzVKU3FLZVRPNUtuNFpTaFpMbkNkcGNBZGtuZXFKZ21q?=
 =?utf-8?B?S0ZDYlVVNjRLWGlzNlNQSDBzS3dGSTNpdkpsZEExUStKWXdWaXluVFBhYlNY?=
 =?utf-8?B?anA4VU5yU3lzR3h4dGNxRDZ0bDV0WUExOVlPQ3R4RktwZDhveWdPL28wdUFm?=
 =?utf-8?B?UUYxY1FqS2ZtOXVxZGR4R3ZWUXE5QldRNmZWR0l5RlNrNW1JYk1aYm1BSlRm?=
 =?utf-8?B?RDFQNFlNeVE0QUI5bGZjRTk0MXlkYndZZXM5UkQwQkIrTDRNdWNMemFzaVRD?=
 =?utf-8?B?QkRwVEVMTWNjQjBzTWxsc09xajBMdS9sbWZKdCtTdUxucjRlRTMxRDFZRWpo?=
 =?utf-8?B?RXFOcHIwOFhmQlVOUy8wU3hkbkc2SWk1U015bnpONFFRSUZ3R0R0ckhWVEFD?=
 =?utf-8?B?QThyaCs5aWNYVm8zZUhHUG5ScG40ZVlCZ0pZODVNeXYyS3Y0NzhoSFRJaEhO?=
 =?utf-8?B?YXZYVnFNTnJLVk1ONENHall5cEdBM1ZNeDI2NWx4dm1lWlFHanBhbW1yU0cy?=
 =?utf-8?B?TmFZVmV2NXRYb0I3cmxPb0JZWUNyRksyUnBudm00WVhkTHFjdE5hcG9Ud3FM?=
 =?utf-8?B?YlN3U1VsTHhLbHhFZ2FkbUpndG9GY2lLcmEraC8vR0U4NldQYWhBVzcrRDlU?=
 =?utf-8?Q?p2LjswDBdoASDKTWoVYcvm8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6307064-2d7f-4398-cba2-08d9ed0a3fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 02:57:32.2942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KSfCU6CknwyNoE9XwkZxOYBGcwrVDczSAwuwmsjFb8TvM39PesuiLqf9ZA4Lu2Yq8nwM+DGNDAPVzlyviErN0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3649
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVh
cnkgMTAsIDIwMjIgNzoyMiBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gPGY0YnVnQGFtc2F0Lm9yZz47IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT47IFRob21hcyBIdXRoDQo+IDx0aHV0aEByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDExLzE1XSB0YXJnZXQ6IFVzZSBBcmNoQ1BVIGFzIGludGVyZmFjZSB0byB0YXJnZXQg
Q1BVDQo+IA0KPiBPbiAyLzExLzIyIDA0OjM1LCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiAt
I2RlZmluZSBIRVhBR09OX0NQVV9DTEFTUyhrbGFzcykgXA0KPiA+IC0gICAgT0JKRUNUX0NMQVNT
X0NIRUNLKEhleGFnb25DUFVDbGFzcywgKGtsYXNzKSwNCj4gVFlQRV9IRVhBR09OX0NQVSkNCj4g
PiAtI2RlZmluZSBIRVhBR09OX0NQVShvYmopIFwNCj4gPiAtICAgIE9CSkVDVF9DSEVDSyhIZXhh
Z29uQ1BVLCAob2JqKSwgVFlQRV9IRVhBR09OX0NQVSkNCj4gPiAtI2RlZmluZSBIRVhBR09OX0NQ
VV9HRVRfQ0xBU1Mob2JqKSBcDQo+ID4gLSAgICBPQkpFQ1RfR0VUX0NMQVNTKEhleGFnb25DUFVD
bGFzcywgKG9iaiksIFRZUEVfSEVYQUdPTl9DUFUpDQo+ID4gK09CSkVDVF9ERUNMQVJFX1RZUEUo
SGV4YWdvbkNQVSwgSGV4YWdvbkNQVUNsYXNzLA0KPiBIRVhBR09OX0NQVSkNCj4gPg0KPiA+ICAg
dHlwZWRlZiBzdHJ1Y3QgSGV4YWdvbkNQVUNsYXNzIHsNCj4gPiAgICAgICAvKjwgcHJpdmF0ZSA+
Ki8NCj4gPg0KICBCdXQgaXQncyBkZWZpbml0ZWx5IGEgc21hbGxlciBjaGFuZ2UgKGFuZCBtYXRj
aGVzIGFsbCBvZiB0aGUgb3RoZXIgdGFyZ2V0cykuDQo+IA0KPiBJIGRvIHRoaW5rIHRoYXQgdGhl
IGNvbnZlcnNpb24gdG8gT0JKRUNUX0RFQ0xBUkVfVFlQRSBzaG91bGQgaGFwcGVuIGZpcnN0LA0K
PiB2aWEgd2hpY2hldmVyIHRyZWUgeW91IGNob29zZS4NCg0KT0ssIEknbGwgc2VuZCBhIHBhdGNo
LiAgVGhlbiwgc3VibWl0IGEgcHVsbCByZXF1ZXN0IGFsb25nIHdpdGggdGhlIG90aGVyIGNoYW5n
ZXMgeW91IGp1c3QgbG9va2VkIGF0Lg0KDQpUYXlsb3INCg0K

