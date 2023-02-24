Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3B6A15B6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPMb-0005B9-H4; Thu, 23 Feb 2023 23:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1pVPMR-0005AS-SP; Thu, 23 Feb 2023 23:07:07 -0500
Received: from mail-tyzapc01on2070c.outbound.protection.outlook.com
 ([2a01:111:f403:704b::70c]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1pVPML-0001uT-Px; Thu, 23 Feb 2023 23:07:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9svkZcaR1BOoo6XeTKPd0/kQqHXMI4wUFAntu3g3hu2PrITYEywAAFAwPPTS/2UemmQ1tOEMlsq4URKfVOWri2kv/oUFVqlhkTtr7PFw/DixyVYE1B2vSuM/zSzYgT8T4t8yPiUnKuAvik/gqbdzNbh6Tlo8soBPqTX3vgB6dQhcLX3sT9Jw0dUKiyndosoW3plKrv1LZ7J/Xc7C7ZyFyJmNWZH+n8fuWw+KCFa1fYH4v9t3vceBa0uIz24avE/C6yUn9fcyrmNqr2x5ugR0BLCu+nJ7rShaedUFtxKJHvtBxIW5ZBa42YlXa2I+wPt95ZOu3IdW+BTnrDIBOsAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rjw36O5z42PSIIwPu1FlXPeYICKgCphelarEMU4U/Io=;
 b=WytY9OL4etsiIIREYTEOCb5mRWie937z4t4XS6IarmpzC+IJktqoGJB6VyCfbp/YvJWTjmwjaCBp2vlOGPSHS61dhUF7/ytI6/Bh75ysdwZjLv4qKVBh4pE8FiVk1LTCWfWTYtHl9MzpTepJ8VzXAAhvusGs9/dixu1cmFOGZzqlGmQeirhFKDEm7wVmwt9z1XcSDrhZ2XM6Mf/7dBSWnU/cQ6V4t2XDP4SkgmaJWPHtYYy6p7H6GGSXYtHb5IEkQ6Vg4j0hmtQVXqXP7C8Q67Y7RNO9IuwZjYHQuYFvYdp5lnKbOLyYUvl7W45yGHhAWUGGHP186oax80U/hQwqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rjw36O5z42PSIIwPu1FlXPeYICKgCphelarEMU4U/Io=;
 b=yRkTYpvxhJk3+DzNY26pqT2n92h2ttqAUHXNPXd/npRN9lHgmTb7E9mFajZlVTQhBeeNXq/JAafKRfDHRDgEsGgoqQc7HG990V47HI6vux9A60GlEE3e3LizOZAmcopasXQH3hiKkaZ2f9DmNUHFC+Y4MkSzp3pmIKhOMQRE+oZCFVjvvgiADqAUEB4hEEhYKwkpVSVyEkMP5CW0shNoD/htm6pE+VN5lOZEVBJPj/2xkxAM/Ry+6YG8AUsqze2LQcBWxP9d/nVZDjqyDZpHbqeW5vQXdYbTE64FhQKZ8tdpjJUrq1xJp6Al6Anf7iSO/tXKc8tSMN0rk42mxzgYXQ==
Received: from TYAPR06MB2158.apcprd06.prod.outlook.com (2603:1096:404:19::21)
 by PUZPR06MB5555.apcprd06.prod.outlook.com (2603:1096:301:eb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Fri, 24 Feb
 2023 04:06:46 +0000
Received: from TYAPR06MB2158.apcprd06.prod.outlook.com
 ([fe80::9ba0:2077:3447:d0c3]) by TYAPR06MB2158.apcprd06.prod.outlook.com
 ([fe80::9ba0:2077:3447:d0c3%7]) with mapi id 15.20.6156.010; Fri, 24 Feb 2023
 04:06:45 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Jamin
 Lin <jamin_lin@aspeedtech.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Alistair Francis
 <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: Steven Lee <steven_lee@aspeedtech.com>
Subject: RE: [PATCH v5 7/9] aspeed/soc : Add AST1030 support
Thread-Topic: [PATCH v5 7/9] aspeed/soc : Add AST1030 support
Thread-Index: AQHYRaP+N4YWWH4gUEK71My03hSo9a6GYpQAgFf5o4CAASLOkA==
Date: Fri, 24 Feb 2023 04:06:45 +0000
Message-ID: <TYAPR06MB21587073E7D29DA6A93B54958AA89@TYAPR06MB2158.apcprd06.prod.outlook.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <20220401083850.15266-8-jamin_lin@aspeedtech.com>
 <0c4810ae-edee-41df-7609-a3c6577a9ed3@linaro.org>
 <656c0b73-5cc2-874f-28c3-3dabf86039e7@linaro.org>
In-Reply-To: <656c0b73-5cc2-874f-28c3-3dabf86039e7@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYAPR06MB2158:EE_|PUZPR06MB5555:EE_
x-ms-office365-filtering-correlation-id: 2f0433d6-cd57-452f-2ad6-08db161c8b61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ZMtrjIJYfJ5ZVIyS3BEjEwi6TtSCcE4VGmU409W9/kgRaGi+VnZu8W7P38qEwRfXdAx5knTcTy1YSxzLGzyhhnOMnOvyjLmORKo7ABz7yr8zzODlEhv+MQquuAEzR4cDeqds+Rt+vnYVjiNZd28iJbMwGtE47tOwOgHXq55D0SvkLJ7E8TQniPlX/dUB6e+b/vyZE6jGIMhOleYt7EmvdSaNZssmIYJCX6WujG7xlQEahGT2SE//cNDXdWR40VHGikee63N6Yby+I1JVZHTmpqS5y1Zg9AMDul+j8QReDaS6MgrNe5igUopMVFtSh4i5XD14UpOccWLwkpZT4sz5FuUDRy33Lp54J90wVxV+gMMo6wwubrZrwJf2r+aRAoZSuVpB2MNmypjBH9krDECxaZNe9nyGJ2RgpXDvLO5CmV3ovdFlfreVze220Kf0tlO920UWvMQIliz7j1sWRv01vBwgpyDTdhtFv1nE3FmY/s+jJm2NGXcPVQknKUFFGsZSp86d8GxlpEXUiHw4RhCrA7jmzDhvVvhkui8biKYWF+n336vrPxtVtAgFi0aXljes9H1Dv5y1PL4Dyj39MTW8AX3MeJXssX9MdAdcHDt3Nw3sWD9OxFazIi3DYjYVsOJjm92IxhK3KRIec6qzNlgjPuD4Z000YXfSJ8I/fbNUsqJa8rWf37WqzhUIhNTK2mzTyYsraPbHZ6SjSFA65ItybJ8SOdZa1zIgKd4ZbrsD9w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYAPR06MB2158.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(396003)(39850400004)(136003)(366004)(451199018)(38100700002)(921005)(122000001)(33656002)(86362001)(38070700005)(76116006)(7416002)(83380400001)(5660300002)(52536014)(2906002)(41300700001)(71200400001)(8936002)(186003)(9686003)(26005)(316002)(6506007)(53546011)(66574015)(4326008)(107886003)(110136005)(7696005)(66476007)(8676002)(478600001)(66446008)(64756008)(66556008)(66946007)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eS9EVEQ5T0UxYTJvWDFxYyszblhUcHZjZnlzMm16T0FlNWRyTnhIRU8rSnU3?=
 =?utf-8?B?VXZkYjZ5MzVnKzlVWTFEVWNMREo5RGtOM1RpbG13ZHliTHFlWThZbnlMR29k?=
 =?utf-8?B?VkxFb2hIdnJIN2ZHUjRKYWVwNk1PcjB5cThueGZ2bUl5OEpoWldZelVTM1Za?=
 =?utf-8?B?ckNnaTZ3RUNERUN3U2JiSXI2MzhXc0d5aUhuV2JSMWhPWVBGWWhQeWVVQkln?=
 =?utf-8?B?YnZJSUxCTVJZZXZrSHV0bVBTRjVNQlBUbldHT2h0OCtoRDhMS1BQN0V5VTli?=
 =?utf-8?B?ZDJMVkdYTWRFQ1k4TWZqS1FUanBOc2RyOS9tMzlkR0JNcnRoVGw3c3lDZVFt?=
 =?utf-8?B?ckhDdGpaMDZMUEhPZUF1YUdqZW91Q0Q1VHVJWk1iUUN6WmhqdlFpbHZaUWYz?=
 =?utf-8?B?TVQ2cG5XbjNkUG0xU1p4UlY2NlpmWVc2czJwYVlZdjE1VnRGOUVneTRyZmZV?=
 =?utf-8?B?LzJ5OWIxL09VWVFDMnZQeVdjS2t4WE9uUm40VUphWjdyd1pueHlzVnJXeVZQ?=
 =?utf-8?B?aTV0M0hlc0FzdWNWVFRtMFJPYXVENUVnQks1V1R6WGowZzJ2dUIxRDBOMG5S?=
 =?utf-8?B?dE5HTWtqRUJES0RmRHRTUUxtUWZaQ1NPZFcwWHFYbGNhNjVxTXhRZzlBSHND?=
 =?utf-8?B?UXloQlNnTHRQTk5vYUE3eUpncFFXM1VSRVpQK2YvcEd6cFY5aDRrcElPTUxO?=
 =?utf-8?B?NGZPNTRYZ1JXRmxnUUtFMUIvdlh4NllvMk5DVTFMSlMzc2htMmJKblFVT1Fi?=
 =?utf-8?B?WUNOVXd1bWZSK256ekE5NTRJRXlpWHBUZEFyeDUwMll1cHN6ZzFBaDQwV2N2?=
 =?utf-8?B?ZzN3R081ZzVWZ3pSRkh6YkVhZmZHSGhoL09kUXlSU08vejF0UjRqUmJGMmh4?=
 =?utf-8?B?clhDZnJ1enVadWZ4THh0MTQwdW1ReDM0eG9jU2NiOGRnRDFURHhWdG1zQ3Rm?=
 =?utf-8?B?d2lNdm9pWURmWXF2b1YzZ1Avb21Ia3NWa1ZxQnd5bWxZOFJZMTNGbjg3UFhN?=
 =?utf-8?B?VnY5bkgrOXp0ckdpVE5aWE1CUzRhWG40dmpLbFl5N2NvOFRGSDFSNnZsWXBK?=
 =?utf-8?B?UXNnMXRhM3lXOVBOODRtMlhwU2J6a0JncUJCc1l2NmtLWXNzZmhsQ2VkMGNx?=
 =?utf-8?B?QmZiYloxN0U5ZzVubHNubVk1R1dSRXhGalFzbEtYLzhiNitwa1JKNk5hQXk1?=
 =?utf-8?B?TGJpZHBCekJpQzRQZmdJZjFyRHlRUXlma3JFUVhwSk4wOFMwNFJwWFJjZkRR?=
 =?utf-8?B?dk5tTzBGa3FDaXIvKzI2WHN4VFNVdHA2N0N6YWF1a2s2SmRXaDdDaU9GQVN4?=
 =?utf-8?B?aDRpY2lkMnhETkRnK0M3R1BaTmIxcFQ0SFhVTHlxZll5Zzl2U2RJdXg3VE1X?=
 =?utf-8?B?MTNUWHlCaWt1dm1ncm5lb0ptQXI4SkR5cjBEdXJmVnFWNDF6enJ5WW5DR2tK?=
 =?utf-8?B?VkFJYXgvblRqbFhTdXA1dkRRM0Z4ampTOC82eGhRZUFnZnVjaS9YMk5KSVZ2?=
 =?utf-8?B?V3hWRTRaUEtjOEt0dWQ4cVVnZ2FEUWdJSmVCVVBZc1pvOUtWdTJTRUk5bG44?=
 =?utf-8?B?d3pQZnZheEFMa25tMDlKRmVBbHhWZHNTOEQ1ZjhqM1ZHaGJUTyt0WG1VVlNY?=
 =?utf-8?B?RWRJbDZ5UnNncWNnT1A3WHNCUW9jdFlLMkcrZVJNZjhvWU9NVXBiRmlUNjFV?=
 =?utf-8?B?TDFwNm1SZ0RmZFJxcWlBbHgyeCtNRSt0UlBYY0V2OWtvVVl2STJOTVZWZTZI?=
 =?utf-8?B?Q0Rqa1d0c2pGVlhMUkQ5WG1jTmRSdm81RU1MbTZpZTRUVzJsNVZ4M28zVnpO?=
 =?utf-8?B?VTdqd29tNGtYWDl3U29MUU01SUh5ekFqekN4Uis4SVFWWE9iREJqMzVEd3Ey?=
 =?utf-8?B?L1JwU1VzaDlkVDU0bXExa0k2RnZsaVZ3WUExM3F5S3F5TjR1K3cwK3NkSGNV?=
 =?utf-8?B?NmpqbGpZQ29vWG9kdVRjQm9icktuYi85RlV2MXlYNzN2V1cvbTZVdjRDOUp6?=
 =?utf-8?B?Zm5mQ20xVTYxNTdDc3cxNkFEWVdnUVFTajdLVXhDVXA3Y2xEaGpmMCtYWnVv?=
 =?utf-8?B?aGR4QTNqV2tkRGhJUVhoN0xEYmZhZzZ0Wm5MUWU3cDY1bTl6dTJuR1E3cDVG?=
 =?utf-8?Q?p9fe3mlhoV0D/o7oGQvnzlJaK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR06MB2158.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0433d6-cd57-452f-2ad6-08db161c8b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 04:06:45.6041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XXc+otW/lvXpx2gjErr37FXVtAN/JCTiQQBX1a72ziaNXCCZX+k8CTovhNpY7wQvnjvPoNNBSYAqEjmAc1dbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5555
Received-SPF: pass client-ip=2a01:111:f403:704b::70c;
 envelope-from=troy_lee@aspeedtech.com;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGkgUGhpbGlwcGUsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2Rh
eSwgRmVicnVhcnkgMjMsIDIwMjMgNjo0NCBQTQ0KPiBUbzogSmFtaW4gTGluIDxqYW1pbl9saW5A
YXNwZWVkdGVjaC5jb20+OyBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPjsNCj4gUGV0
ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgQW5kcmV3IEplZmZlcnkNCj4g
PGFuZHJld0Bhai5pZC5hdT47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBBbGlzdGFp
ciBGcmFuY2lzDQo+IDxhbGlzdGFpckBhbGlzdGFpcjIzLm1lPjsgQ2xlYmVyIFJvc2EgPGNyb3Nh
QHJlZGhhdC5jb20+OyBXYWluZXIgZG9zDQo+IFNhbnRvcyBNb3NjaGV0dGEgPHdhaW5lcnNtQHJl
ZGhhdC5jb20+OyBCZXJhbGRvIExlYWwNCj4gPGJsZWFsQHJlZGhhdC5jb20+OyBvcGVuIGxpc3Q6
QVNQRUVEIEJNQ3MgPHFlbXUtYXJtQG5vbmdudS5vcmc+Ow0KPiBvcGVuIGxpc3Q6QWxsIHBhdGNo
ZXMgQ0MgaGVyZSA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBDYzogU3RldmVuIExlZSA8c3Rl
dmVuX2xlZUBhc3BlZWR0ZWNoLmNvbT47IFRyb3kgTGVlDQo+IDx0cm95X2xlZUBhc3BlZWR0ZWNo
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSA3LzldIGFzcGVlZC9zb2MgOiBBZGQgQVNU
MTAzMCBzdXBwb3J0DQo+IA0KPiBwaW5nDQo+IA0KPiBPbiAyOS8xMi8yMiAxMjoxNiwgUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4gPiBPbiAxLzQvMjIgMTA6
MzgsIEphbWluIExpbiB3cm90ZToNCj4gPj4gRnJvbTogU3RldmVuIExlZSA8c3RldmVuX2xlZUBh
c3BlZWR0ZWNoLmNvbT4NCj4gPj4NCj4gPj4gVGhlIGVtYmVkZGVkIGNvcmUgb2YgQVNUMTAzMCBT
b0MgaXMgQVJNIENvcmV0ZXggTTQuDQo+ID4+IEl0IGlzIGhhcmQgdG8gYmUgaW50ZWdyYXRlZCBp
biB0aGUgY29tbW9uIEFzcGVlZCBTb2MgZnJhbWV3b3JrLg0KPiA+PiBXZSBpbnRyb2R1Y2UgYSBu
ZXcgYXN0MTAzMCBjbGFzcyB3aXRoIGluc3RhbmNlX2luaXQgYW5kIHJlYWxpemUNCj4gPj4gaGFu
ZGxlcnMuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTGVlIDx0cm95X2xlZUBhc3Bl
ZWR0ZWNoLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogSmFtaW4gTGluIDxqYW1pbl9saW5AYXNw
ZWVkdGVjaC5jb20+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBMZWUgPHN0ZXZlbl9sZWVA
YXNwZWVkdGVjaC5jb20+DQo+ID4+IFJldmlld2VkLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPg0KPiA+PiAtLS0NCj4gPj4gwqAgaHcvYXJtL2FzcGVlZF9hc3QxMHh4LmPCoMKg
wqDCoCB8IDI5OQ0KPiA+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
Pj4gwqAgaHcvYXJtL21lc29uLmJ1aWxkwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKy0NCj4g
Pj4gwqAgaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oIHzCoMKgIDMgKw0KPiA+PiDCoCAzIGZp
bGVzIGNoYW5nZWQsIDMwNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+IMKgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBody9hcm0vYXNwZWVkX2FzdDEweHguYw0KPiA+DQo+ID4NCj4gPj4g
K3N0YXRpYyB2b2lkIGFzcGVlZF9zb2NfYXN0MTAzMF9yZWFsaXplKERldmljZVN0YXRlICpkZXZf
c29jLCBFcnJvcg0KPiA+PiAqKmVycnApDQo+ID4+ICt7DQo+ID4+ICvCoMKgwqAgQXNwZWVkU29D
U3RhdGUgKnMgPSBBU1BFRURfU09DKGRldl9zb2MpOw0KPiA+PiArwqDCoMKgIEFzcGVlZFNvQ0Ns
YXNzICpzYyA9IEFTUEVFRF9TT0NfR0VUX0NMQVNTKHMpOw0KPiA+PiArwqDCoMKgIE1lbW9yeVJl
Z2lvbiAqc3lzdGVtX21lbW9yeSA9IGdldF9zeXN0ZW1fbWVtb3J5KCk7DQo+ID4+ICvCoMKgwqAg
RGV2aWNlU3RhdGUgKmFybXY3bTsNCj4gPj4gK8KgwqDCoCBFcnJvciAqZXJyID0gTlVMTDsNCj4g
Pj4gK8KgwqDCoCBpbnQgaTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgIGlmICghY2xvY2tfaGFzX3Nv
dXJjZShzLT5zeXNjbGspKSB7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBlcnJvcl9zZXRnKGVycnAs
ICJzeXNjbGsgY2xvY2sgbXVzdCBiZSB3aXJlZCB1cCBieSB0aGUgYm9hcmQNCj4gPj4gY29kZSIp
Ow0KPiA+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPiA+PiArwqDCoMKgIH0NCj4gPj4gKw0K
PiA+PiArwqDCoMKgIC8qIEdlbmVyYWwgSS9PIG1lbW9yeSBzcGFjZSB0byBjYXRjaCBhbGwgdW5p
bXBsZW1lbnRlZCBkZXZpY2UgKi8NCj4gPj4gK8KgwqDCoCBjcmVhdGVfdW5pbXBsZW1lbnRlZF9k
ZXZpY2UoImFzcGVlZC5zYmMiLA0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2MtPm1lbW1hcFtBU1BFRURfREVWX1NC
Q10sDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDQwMDAwKTsNCj4gPj4gK8KgwqDCoCBjcmVhdGVfdW5pbXBsZW1l
bnRlZF9kZXZpY2UoImFzcGVlZC5pbyIsDQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzYy0+bWVtbWFwW0FTUEVFRF9E
RVZfSU9NRU1dLA0KPiA+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVNQRUVEX1NPQ19JT01FTV9TSVpFKTsNCj4gPj4gKw0K
PiA+PiArwqDCoMKgIC8qIEFTVDEwMzAgQ1BVIENvcmUgKi8NCj4gPj4gK8KgwqDCoCBhcm12N20g
PSBERVZJQ0UoJnMtPmFybXY3bSk7DQo+ID4+ICvCoMKgwqAgcWRldl9wcm9wX3NldF91aW50MzIo
YXJtdjdtLCAibnVtLWlycSIsIDI1Nik7DQo+ID4NCj4gPiBDYW4geW91IGNvbmZpcm0gdGhpcyBT
b0MgaGFzIDI1NiBhbmQgbm90IDI0MCBJUlFzPw0KPiA+DQpUaGUgaW50ZXJydXB0IG51bWJlciBz
dGFydCBmcm9tIDAgdG8gMTQ4LCBhbmQgc29tZSBvZiB0aGVtIGFyZSByZXNlcnZlZC4gDQpTaG91
bGQgd2Ugc2VuZCBhbiB1cGRhdGUgdG8gc2V0aCBudW0taXJxIHRvIDE0OT8NCg0KVGhhbmtzLA0K
VHJveSBMZWUNCg0KPiA+PiArwqDCoMKgIHFkZXZfcHJvcF9zZXRfc3RyaW5nKGFybXY3bSwgImNw
dS10eXBlIiwgc2MtPmNwdV90eXBlKTsNCj4gPj4gK8KgwqDCoCBxZGV2X2Nvbm5lY3RfY2xvY2tf
aW4oYXJtdjdtLCAiY3B1Y2xrIiwgcy0+c3lzY2xrKTsNCj4gPj4gK8KgwqDCoCBvYmplY3RfcHJv
cGVydHlfc2V0X2xpbmsoT0JKRUNUKCZzLT5hcm12N20pLCAibWVtb3J5IiwNCj4gPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9CSkVD
VChzeXN0ZW1fbWVtb3J5KSwgJmVycm9yX2Fib3J0KTsNCj4gPj4gK8KgwqDCoCBzeXNidXNfcmVh
bGl6ZShTWVNfQlVTX0RFVklDRSgmcy0+YXJtdjdtKSwgJmVycm9yX2Fib3J0KTsNCj4gPg0KDQo=

