Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D66C4EEAEC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:03:48 +0200 (CEST)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naE8B-00011j-DI
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:03:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naE0p-0005ck-Cp; Fri, 01 Apr 2022 05:56:12 -0400
Received: from [2a01:111:f403:704b::702] (port=28545
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1naE0m-0004Hj-HN; Fri, 01 Apr 2022 05:56:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hH/n8n8xhmR05uVy+iSz9ezT7EtuqeOEhApY+aH8TYaKRqEPuUupcu7WdgNoS61Gj0lsgrZgttjf1V1uRh986gobUC615nifFIKrBpTeueVrBrK1TURcShlv53vIZX2446skJjg+tqGX38BnU2nAYFNRXP3pt5+pSrtubaw1HCCA11Ia60cq6In7UWVwAKkvAxP/FYO/pF1Bqd5l0dVDmAu2fp3px16eKhDLCKkfZVHn3fIfDqAAJJqGqKYP3UmaK2p5/AVQggbxGZUSaqOiU3r8DGp9A0UVXmi8YGS4C3r0VXui0E5fUPNunm3Ez91yUg/NeIpqm2+UYyY68+PBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mvmp6Vs8TjotvHs2CNXdQQLtS6rwBZxVyAY5GH3X/50=;
 b=QhMY1++sVhvcGvuPsR/Q1uC6PJO3Pn8QmNom28PA7mEngMM7PQHJbEJ9BrN424NJTeR16dr0ECJobtRGcfRX9RBJq08uRRubyQF8xeHyYsbs1NYPTrwy7pfT84qChk3x4OQj4QqGMXEULXaSSsMu59pwefBdu+uj6OPllqT2PBeyAQNgxXE5/eF15WiFgfyFBhKFckLpfAUtCvdUwoRdrJlSICyrhj3neHaLhBgWM3upXP/dcyIPGb46r2vUhKQQkQZ4ouECwyrEdVIDwY1U3miExxjWDfFxr6nbEE5G7V/zibyOyiSRGCpXg1YP5dSFgsTSgkTRGUeVJ/wpYVaqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mvmp6Vs8TjotvHs2CNXdQQLtS6rwBZxVyAY5GH3X/50=;
 b=0NPo3V/hncDfm9hWGB6Tp5U5s16ZYXPVcfMRGByz6A6rOVPbe6ij883EbiOJWMDKAv3wuWS7i7lZ5jshINg6EaQa+Yyr85d9ygPcLzScBMfn9sf6uF8tYtAkA+ZhT0AwRYbIfisQ7zlM0ke0i5+vRdk7iHasqm9tZUTkFvURyh7vtjce+mWV3ssq0kASDvBzFeoSlNsWwadwuWrkBlzByQ0K4k4SPNwUvBEgjI5uGaDTNH1DkgD4xcTcEChdsDUe6QD/H8h7+uFlSLXjvLJ6m3BxuDNCgm78CTwc5vgHI6P5IOWCWieUWRyTh8pWTGsThCwVU67nb/i4hJfivj3/zg==
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9)
 by SL2PR06MB3067.apcprd06.prod.outlook.com (2603:1096:100:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 09:23:37 +0000
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::2d54:6766:c147:f0b4]) by TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::2d54:6766:c147:f0b4%4]) with mapi id 15.20.5123.023; Fri, 1 Apr 2022
 09:23:36 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Cleber Rosa
 <crosa@redhat.com>, =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, Jamin Lin
 <jamin_lin@aspeedtech.com>
Subject: RE: [PATCH v5 0/9] Add support for AST1030 SoC
Thread-Topic: [PATCH v5 0/9] Add support for AST1030 SoC
Thread-Index: AQHYRaPsFYQT3Im+3UOTQIzlaCcedqzawSeAgAACzgA=
Date: Fri, 1 Apr 2022 09:23:36 +0000
Message-ID: <TYZPR06MB40155C89D32BB012339208C6FCE09@TYZPR06MB4015.apcprd06.prod.outlook.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <0ddfa28a-45ae-fdfd-02a6-94ab5a34b724@kaod.org>
In-Reply-To: <0ddfa28a-45ae-fdfd-02a6-94ab5a34b724@kaod.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8696bde7-d05f-4e6d-bc21-08da13c14cfa
x-ms-traffictypediagnostic: SL2PR06MB3067:EE_
x-microsoft-antispam-prvs: <SL2PR06MB30677B5F21F238147643C1C2FCE09@SL2PR06MB3067.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pHz5kG0H617MIb5LumEBq76mOZNRFD7NKdIw4ZLiWajea1YRuimKkn5JywBZskb64Gr8yENPu1zDTiZdfZgL2fkXN3AS0nMhU02JhnbM+6fb/+kpR998Epff0dBgfwKQkGyxWG71Bj6eqgDTneyOfDBuuw3DWl+Dq64jCBwuzpIvvbs42CgGtt/wli8H4Ts//qjq40LIYGshmszCBzEgtJSYk1dMA789qG81ufdheF/jdkXBao6TtLYbAyiBRPciO16f8/0Ki6IixwSf0JHIxopF1ouAeNwBsHQDUgsPmGldP0E2Nipz5zb5a5S+B9zI29yCvVWbx5CbS7gy71SGz7bRjUpj5+Jf1OGEk9abpB9csHu9T0nHr5y7o0PjNR6Ox7zdmkKhfHdaZ7IerrjyGUzomnUeUPAPra7X2oIo76NIk+QRM7ib7ED8hxjQI5hoTdq7dlrGhV8IB2L/n7wVHzdp+XxJ51zNkgQDXBx4sdVSRZ27J4Yo8HM1lPK7r1hU4m+BDO+lNhED0MHu3Sppm2hGpNEmBnDGCTVdtCglALRg+voiVbTPBhrKTc3Z9dTzJdOML+b0IFXh6ssblJjFeIovQGBuL1sfNZ6UPfYDm+7Ag2Jgb4KVUdmG1YCqszZ9NPoM7FG4bgnzThkkBxtMD1HL4DINNXFgibSixW6KAoUid+i55JatltF0WBBBtTt1IkjTQ16Qetp2AlI4BMy7DBvxitsWR4agPrumhE5LyeDgQDCoLCY1Gd7vbwfPpF5HEFJnY8EMnkuN1/c0JvMlveJLA2mUV+8euVr9cFH2HV8abAWJN0Pe244YSvoDt7dh5PlClb2I9+pNdS5vzQ+HHY3SLCtzvbYHkE3bjESKuqE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4015.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(136003)(39850400004)(366004)(376002)(396003)(966005)(921005)(508600001)(2906002)(122000001)(38100700002)(52536014)(7416002)(71200400001)(8936002)(38070700005)(5660300002)(66946007)(9686003)(6506007)(64756008)(316002)(66556008)(66476007)(66446008)(55016003)(4326008)(8676002)(76116006)(7696005)(186003)(26005)(54906003)(110136005)(53546011)(83380400001)(86362001)(33656002)(107886003)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkJlUTQ3L3lXVmNlNTN3Wkc1VU5VTGppTDNlYTMwR1IvbW5jQXpZM3NuLzU0?=
 =?utf-8?B?S3hWUzNXQ1RzcjlOd0VHSGNHb2JUL3dvN244Yk1vc01ZK0t6Tk14UkZsTkZN?=
 =?utf-8?B?UkVvbUxPN1V0RThlM090MmkwbURvSk5DUWJPZVFpZXBqL2QxS0V2U2VyZ1JF?=
 =?utf-8?B?MGhINm1DNGxSOGFvVUs5Ujl3ajlyTUNPcGg3YXBoNy9lT2NkV0xoOHZURktJ?=
 =?utf-8?B?TEMvcys2VHNnVDlRMkE2Uk5PRVZzcWtrWGNPVkdLT0xxV21wdzhuU1ZHL3Vo?=
 =?utf-8?B?WDhvV01NZGg4R0d4UjBQTXNRcEVTYkNiVnl6WWRwVlJXVzYyREI1ME02WVgx?=
 =?utf-8?B?ckd4SElqTDl1OGoyc1RCYXVJR0tVdnkzMy9weWsyNUdlZG9WcGRrN0N2TWcz?=
 =?utf-8?B?dWFCZjVwTlY1cytXUmdUdXEyVFg1aG5MQnFyRHJtYllXUEhubXMybnFzMERn?=
 =?utf-8?B?QnRSSWpJN1Vsc2VGSWNDeWl4Mm92dTd6ck5TOHB5ODF5RmczNi83SHg2eVYx?=
 =?utf-8?B?dWpSajNLUHEvdFh3d3dJWmdUa0NTbVdSRzZHWDdJdGI2QVlJbXFaam03dXVk?=
 =?utf-8?B?LzJjNVYrcGJuUWtRcHBsVzUvRmtpRFF0TTlCdWwzQmExWmZ0ak5XYjVtQk5p?=
 =?utf-8?B?MzQzUXBZaWlQWGxRRkc5T3l6VUl0K2UyV2ZKdXFKY3VYRVhQZGVtUGQwOFpx?=
 =?utf-8?B?eTNXRkRBSmNLNUdkK2JFMy9BTkVjdzhMWHYvR3NsVHpldnBNRmp5c0xLRjlr?=
 =?utf-8?B?NTBWRENTcnhmeGJKc296ZGZXSkdocGk2N1dMT3BWUDFQY2g2d0prUUEzdE4y?=
 =?utf-8?B?eDhrSWdHZmtROVM0N3pBVHhZV3gwK21rbW9XMWdxQzloQ0MzbDYwaE05dHhQ?=
 =?utf-8?B?Z1dWcWwvNUVidjBlU1VEQXpPNjhlSWVDbW9jR0NxeVF0YnhqekdySU9NNVc0?=
 =?utf-8?B?S3BBenR3Qk54MHc4MnBNamkvUVhqS3ArNHRsUmJnTG1tbXJvVkp5NjdTMXg3?=
 =?utf-8?B?cngreEdDemR4R0RBU3JiMHIyeEt3Zjk5V0pnYlUzY052S3MvNmEvYWwxMjhk?=
 =?utf-8?B?TVFqTTU1ZmdCYU1Ba2JCbzR0bjRkd2QxWUZSZWxoTHppUG9OdjN2SlA0ajdv?=
 =?utf-8?B?REIxZUxHTFo4ZjIyMlQ4QVh2bm1uWVA1bytzQ0JKMXJLQ2RFNVV4SkRyVmRq?=
 =?utf-8?B?RlZUV3FoczlPcVVZaG5OVlpXcFdqOFpXUFVkQU43M1NVU1crY2xnSVc2UzlI?=
 =?utf-8?B?b0JTUkkzaU44TFN0b0xkUHZDK2FrYkJwZDU0d0Q4T0hneWloMmkza3duWnEv?=
 =?utf-8?B?UXE5Q1JzWnFvK2cvdWllUzZ5dmVIWGt0dW9EMUlyMDR0UzN0NzJOekdXdVoz?=
 =?utf-8?B?S2R6ZW1GQStZVU9sOTRndTBIejc1dFZ6QitDeTQ5cm12NmZKeFhvU2VrcWdC?=
 =?utf-8?B?NzVnd0l0YktOaDZYWlh1TE9qa0J2eG1wTFNiYXJkeWQzUjhlTnZVTG1qTHZP?=
 =?utf-8?B?S1RoNXRENCtQL2ZSWXA5eWhKbW9LUFRxL1RNRlA4UXRwa0xnRzV1YTUzOWI0?=
 =?utf-8?B?dGZqQWQyYW9vcDdPeEJ5Y2xRSytScGV2bm1YSWRzc3VON2dlQ0JWZnZjTjBa?=
 =?utf-8?B?T3FFdmVBWGtNZHg1UUttdFhaTG9hMzZQcjF5bFNpcGVmTWllT3hpUW1Bd3JC?=
 =?utf-8?B?TEx0eHMwQ3lTbURIZ1AwTjc0K1QzbTlmNDJpdllhUEdwVGhEaEZISC8xWnNZ?=
 =?utf-8?B?T1FxNlpQdnJ4eWkrMnltUmM2S0VhaSsxRmlqODZsTWprMFRWM2lRbXlWM1JK?=
 =?utf-8?B?TWhMbFJzNU5RMnlLdE5jRU9udTFtWHVzTHBCTnQzd0g0Mk5DZVMzR3RNcXky?=
 =?utf-8?B?WjdBb3ZXYzg5MzNvSnVJMTBsVXZRb1hUMG9yMTdYUm5QVXJydUFUc3poWXdK?=
 =?utf-8?B?a1haeXo1MHEzM21hQlMzSllHdVpkV3V3b05OeDlBOUZGTHVBTitCN2JhbE1s?=
 =?utf-8?B?UVFSdnlKRE9ydHZRRWUxemp0QlF6cHV6WXArcG1lSGNSWHI1ZCttRjFYRnN1?=
 =?utf-8?B?SmlTVzYrdnIzQzdtdTdNSjZrUUdsNHRCOGg2N3lET1JEak5VQUNxNWM2RUxH?=
 =?utf-8?B?eEVzOVRTdDBaSTZYRkcyTkpXcmdLQzNWSWZZaVdvS2FGWFZQUjdRZVVTdVha?=
 =?utf-8?B?bzBWeUJpSnNmV0ZKcXZxcVR5cjZDUXRGeXRObTA3Y2Z6U1pGeUdpcEZPSGpS?=
 =?utf-8?B?b1VkTStqVDF2eHptblc1OFNzMnd1a0FWbUFDN1dKMnJ5eG9URjdxWk1MeUJH?=
 =?utf-8?B?SHVUQ3hrcHdPNVVMU1IrTk4xTUhhRWdWRy9xQUxqVHhTeFZLVWxnQndpK3Nu?=
 =?utf-8?Q?a8/VKXbkDfWk16uA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4015.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8696bde7-d05f-4e6d-bc21-08da13c14cfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 09:23:36.2619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n1ES2HwjuINwpXwRJuMW+lOZNzTF69UojfURdtWOe+BOXXNUOZCw2ZSCszSdRF1pLHJKerPJgY1/rWVbhmEE/XdVpXjIA5KWloVKNVPsn3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3067
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:704b::702
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:704b::702;
 envelope-from=jamin_lin@aspeedtech.com;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQ2VkcmljLCBKb2VsIGFuZCBBbmRyZXcNCkZpcnN0IGFsbCwgdGhhbmtzIGZvciBhbGwgeW91
ciBraW5kbHkgc3VwcG9ydCBhbmQgcmV2aWV3LiBXZSBhcmUgc28gZ2xhZCB0aGF0IFFFTVUgdjcu
MSB3aWxsIHN1cHBvcnQgQVNUMTAzMCBtb2RlbC4NCg0KMS4gVGhlIGFzdDEwMzAgYW5kIGFzdDI2
MDAgSEFDRSBjb250cm9sbGVyIGFyZSBpZGVudGljYWwuIA0KICBTdGV2ZW4gc3VibWl0dGVkIHRo
ZSBwYXRjaCB0byBzdXBwb3J0IEhBQ0UgQUNDIG1vZGUuIE9uY2UgaGlzIHBhdGNoIGFjY2VwdC4g
V2Ugd2lsbCBzdWJtaXQgcGF0Y2ggdG8gc3VwcG9ydCBhc3QxMDMwIG1vZGVsLg0KMi4gSSBzdWJt
aXR0ZWQgdGhlIHBhdGNoIHRvIHN1cHBvcnQgR09JTyBpbmRleCBtb2RlIGJlY2F1c2UgYXN0MTAz
MCBkcml2ZXIgd2FzIGltcGxlbWVudCBieSBpbmRleCBtb2RlLiBJIGFtIHdhaXRpbmcgZm9yIHJl
dmlldyBhbmQgYW55IHN1Z2dlc3Rpb24gd2lsbCBiZSBhcHByZWNpYXRlZC4NCjMuIFRyb3kgc3Vi
bWl0dGVkIHRoZSBwYXRjaCB0byBzdXBwb3J0IEkyQyBuZXcgbW9kZWwgd2hpY2ggaW5jbHVkZWQg
YXN0MTAzMCBtb2RlbC4NCjQuIEFzIGZvciBOSUMgcGxhbiwgb25jZSBBU1QxMDMwIE5JQyBkcml2
ZXIgcmVhZHksIHdlIHdpbGwgdXBzdHJlYW0sIHRvby4NCkJUVywgZG8geW91IGhhdmUgYSBwbGFu
IHRvIHVwc3RyZWFtIGl0LCBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9xZW11L2Jsb2IvbWFz
dGVyL2h3L21pc2MvYXNwZWVkX3B3bS5jDQoNClRoYW5rcyBhZ2FpbiAtIEphbWluDQoNCioqKioq
KioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5IE5vdGljZSAqKioqKioqKioqKioqKioqKioq
Kg0KRElTQ0xBSU1FUjoNClRoaXMgbWVzc2FnZSAoYW5kIGFueSBhdHRhY2htZW50cykgbWF5IGNv
bnRhaW4gbGVnYWxseSBwcml2aWxlZ2VkIGFuZC9vciBvdGhlciBjb25maWRlbnRpYWwgaW5mb3Jt
YXRpb24uIElmIHlvdSBoYXZlIHJlY2VpdmVkIGl0IGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgYnkgcmVwbHkgZS1tYWlsIGFuZCBpbW1lZGlhdGVseSBkZWxldGUgdGhlIGUtbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnRzIHdpdGhvdXQgY29weWluZyBvciBkaXNjbG9zaW5nIHRoZSBj
b250ZW50cy4gVGhhbmsgeW91Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gDQpTZW50OiBGcmlkYXksIEFwcmlsIDEs
IDIwMjIgNDo1NSBQTQ0KVG86IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPjsg
QWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT47IFBldGVyIE1heWRlbGwg
PHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQu
YXU+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQ2xlYmVyIFJvc2EgPGNyb3NhQHJl
ZGhhdC5jb20+OyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPjsgV2Fp
bmVyIGRvcyBTYW50b3MgTW9zY2hldHRhIDx3YWluZXJzbUByZWRoYXQuY29tPjsgQmVyYWxkbyBM
ZWFsIDxibGVhbEByZWRoYXQuY29tPjsgb3BlbiBsaXN0OlNUTTMyRjIwNSA8cWVtdS1hcm1Abm9u
Z251Lm9yZz47IG9wZW4gbGlzdDpBbGwgcGF0Y2hlcyBDQyBoZXJlIDxxZW11LWRldmVsQG5vbmdu
dS5vcmc+DQpDYzogU3RldmVuIExlZSA8c3RldmVuX2xlZUBhc3BlZWR0ZWNoLmNvbT47IFRyb3kg
TGVlIDx0cm95X2xlZUBhc3BlZWR0ZWNoLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMC85
XSBBZGQgc3VwcG9ydCBmb3IgQVNUMTAzMCBTb0MNCg0KSGVsbG8gSmFtaW4sDQoNClRoYW5rcyBm
b3IgdGhlc2UgbmV3IG1vZGVscyBhbmQgbWFjaGluZS4gVGhleSBhcmUgcXVldWVkIGZvciBRRU1V
IDcuMS4NClRoZXJlIGFyZSBhIGNvdXBsZSBvZiBwYXRjaHNldHMgYWRkaW5nIHN1cHBvcnQgZm9y
IHRoZSBBU1QxMDMwIEdQSU8gY29udHJvbGxlciBhbmQgdGhlIEkyQyBuZXcgbW9kZSB0aGF0IHdv
dWxkIGJlIGdvb2QgZXh0ZW5zaW9ucyBidXQgdGhleSBuZWVkIHJldmlldyBmaXJzdC4NCg0KV2hh
dCBhcmUgdGhlIG5leHQgc3RlcHM/IGFueSBwbGFucyBmb3IgbmV0d29yayA/IFRoZSBOSUMgc2hv
dWxkIGJlIGENCkZUR01BQzEwMCBpZiBJIGFtIGNvcnJlY3QuDQoNClRoYW5rcywNCg0KQy4NCg0K
DQogIE9uIDQvMS8yMiAxMDozOCwgSmFtaW4gTGluIHdyb3RlOg0KPiBDaGFuZ2VzIGZyb20gdjU6
DQo+IC0gcmVtb3ZlIFRZUEVfQVNQRUVEX01JTklCTUNfTUFDSElORSBhbmQgQVNQRUVEX01JTklC
TUNfTUFDSElORQ0KPiAtIHJlbW92ZSBhc3QxMDMwX21hY2hpbmVfaW5zdGFuY2VfaW5pdCBmdW5j
dGlvbg0KPiANCj4gQ2hhbmdlcyBmcm9tIHY0Og0KPiAtIGRyb3AgdGhlIEFTUEVFRF9TTUNfRkVB
VFVSRV9XRFRfQ09OVFJPTCBmbGFnIGluIGh3L3NzaS9hc3BlZWRfc21jLmMNCj4gDQo+IENoYW5n
ZXMgZnJvbSB2MzoNCj4gLSByZW1vdmUgQXNwZWVkTWluaUJtY01hY2hpbmVTdGF0ZSBzdGF0ZSBz
dHJ1Y3R1cmUgYW5kDQo+ICAgIEFzcGVlZE1pbmlCbWNNYWNoaW5lQ2xhc3MgY2xhc3MNCj4gLSBy
ZW1vdmUgcmVkdW5kYW50IG5ldyBsaW5lIGluIGh3L2FybS9hc3BlZWRfYXN0MTB4eC5jDQo+IC0g
ZHJvcCB0aGUgQVNQRUVEX1NNQ19GRUFUVVJFX1dEVF9DT05UUk9MIGZsYWcgaW4gaHcvc3NpL2Fz
cGVlZF9zbWMuYw0KPiANCj4gQ2hhbmdlcyBmcm9tIHYyOg0KPiAtIHJlcGxhY2UgYXNwZWVkX2Fz
dDEwMzAuYyB3aXRoIGFzcGVlZF9hc3QxMHh4LmMgZm9yIG1pbmlibWMgU09DcyANCj4gZmFtaWx5
IHN1cHBvcnQNCj4gLSBBZGQgImFzdDEwMzAtZXZiIiBtYWNoaW5lIGluIGFzcGVlZC5jIGFuZCBy
ZW1vdmVzIGFzcGVlZF9taW5pYm1jLmMNCj4gDQo+IENoYW5nZXMgZnJvbSB2MToNCj4gVGhlIHBh
dGNoIHNlcmllcyBzdXBwb3J0cyBBREMsIFNDVSwgU01DLCBUSU1FUiwgYW5kIFdEVCBmb3IgQVNU
MTAzMCBTb0MuDQo+IEFkZCBhdm9jYWRvIHRlc3QgY2FzZSBmb3IgImFzdDEwMzAtZXZiIiBtYWNo
aW5lLg0KPiANCj4gVGVzdCBzdGVwczoNCj4gMS4gRG93bmxvYWQgaW1hZ2UgZnJvbQ0KPiAgICAg
DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9Bc3BlZWRUZWNoLUJNQy96ZXBoeXIvcmVsZWFzZXMvZG93
bmxvYWQvdjAwLjAxLjA0L2ENCj4gc3QxMDMwLWV2Yi1kZW1vLnppcCAyLiBFeHRyYWN0IHRoZSB6
aXAgZmlsZSB0byBvYnRhaW4gemVwaHlyLmVsZiAzLiANCj4gUnVuIC4vcWVtdS1zeXN0ZW0tYXJt
IC1NIGFzdDEwMzAtZXZiIC1rZXJuZWwgJFBBVEgvemVwaHlyLmVsZiANCj4gLW5vZ3JhcGhpYyA0
LiBUZXN0IElPIGJ5IFplcGh5ciBjb21tYW5kIGxpbmUsIGNvbW1hbmRzIGFyZSByZWZlciB0byBB
c3BlZWQgWmVwaHlyDQo+ICAgICBTREsgVXNlciBHdWlkZSBiZWxvdw0KPiAgICAgaHR0cHM6Ly9n
aXRodWIuY29tL0FzcGVlZFRlY2gtQk1DL3plcGh5ci9yZWxlYXNlcy9kb3dubG9hZC92MDAuMDEu
MDQvQXNwZWVkX1plcGh5X1NES19Vc2VyX0d1aWRlX3YwMC4wMS4wNC5wZGYNCj4gICAgIC0gQURD
KGNoYW5uZWwgMCk6DQo+ICAgICAgICAgdWFydDp+JCBhZGMgQURDMCByZXNvbHV0aW9uIDEwDQo+
ICAgICAgICAgdWFydDp+JCBhZGMgQURDMCBjYWxpYnJhdGUgMQ0KPiAgICAgICAgIHVhcnQ6fiQg
YWRjIEFEQzAgcmVhZF9mb3JtYXQgMQ0KPiAgICAgICAgIHVhcnQ6fiQgYWRjIEFEQzAgcmVhZCAw
DQo+ICAgICAgICAgW1Jlc3VsdF0NCj4gICAgICAgICByZWFkOiAxNDE2bXYNCj4gDQo+ICAgICAt
IFNDVQ0KPiAgICAgICAgIHVhcnQ6fiQgbWQgN2U2ZTIwNDANCj4gICAgICAgICB1YXJ0On4kIG1k
IDdlNmUyMDgwDQo+ICAgICAgICAgdWFydDp+JCBtZCA3ZTZlMjBkMA0KPiAgICAgICAgIHVhcnQ6
fiQgbWQgN2U2ZTIyMDANCj4gICAgICAgICB1YXJ0On4kIG1kIDdlNmUyMzAwDQo+ICAgICAgICAg
dWFydDp+JCBtZCA3ZTZlMjViMA0KPiAgICAgICAgIFtSZXN1bHRdDQo+ICAgICAgICAgVGhlIHJl
Z2lzdGVyIHZhbHVlIHNob3VsZCBtYXRjaCB0aGUgdmFsdWUgb2YgYXN0MTAzMF9hMV9yZXNldHMN
Cj4gICAgICAgICBpbiBhc3BlZWRfc2N1LmMNCj4gDQo+ICAgICAtIEZsYXNoKGZtY19jczApOg0K
PiAgICAgICAgIHVhcnQ6fiQgZmxhc2ggd3JpdGUgZm1jX2NzMCAwIDB4MTIzNDU2NzggMHg4NzY1
NDMyMSAweDM0MTI3ODU2IDB4Nzg1NjM0MTINCj4gICAgICAgICB1YXJ0On4kIGZsYXNoIHJlYWQg
Zm1jX2NzMCAwIDEwDQo+ICAgICAgICAgW1Jlc3VsdF0NCj4gICAgICAgICAwMDAwMDAwMDogNzgg
NTYgMzQgMTIgMjEgNDMgNjUgODcgIDU2IDc4IDEyIDM0IDEyIDM0IDU2IDc4IA0KPiB8eFY0LiFD
ZS4gVnguNC40Vnh8DQo+IA0KPiAgICAgICAgIHVhcnQ6fiQgZmxhc2ggZXJhc2UgZm1jX2NzMCAw
DQo+ICAgICAgICAgdWFydDp+JCBmbGFzaCByZWFkIGZtY19jczAgMCAxMA0KPiAgICAgICAgIFtS
ZXN1bHRdDQo+ICAgICAgICAgMDAwMDAwMDA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiANCj4gfC4uLi4uLi4uIC4uLi4uLi4ufA0KPiANCj4gICAgIC0g
VGltZXIoVElNRVIwKToNCj4gICAgICAgICB1YXJ0On4kIHRpbWVyIHN0YXJ0IFRJTUVSMCAtcCAy
MDAwIC10IDANCj4gICAgICAgICBUSU1FUjA6IHBlcmlvZCAyMDAwMCBtcywgdHlwZSAwDQo+ICAg
ICAgICAgW1Jlc3VsdF0NCj4gICAgICAgICB0aW1lciBleHBpcmVkIGFmdGVyIDIgc2Vjb25kcw0K
PiANCj4gICAgIC0gV2F0Y2hkb2coV0RUMSk6DQo+ICAgICAgICAgdWFydDp+JCBtdyA3ZTc4NTAw
OCA0NzU1DQo+ICAgICAgICAgdWFydDp+JCBtdyA3ZTc4NTAwYyAxDQo+ICAgICAgICAgW1Jlc3Vs
dF0NCj4gICAgICAgICBzb2MgcmVzZXQgYWZ0ZXIgMjIgc2Vjb25kcw0KPiANCj4gQmFzZWQtb246
IDIwMjIwMzE1MDc1NzUzLjg1OTEtMy1zdGV2ZW5fbGVlQGFzcGVlZHRlY2guY29tDQo+IChbdjIs
Mi8yXSBodzogYXNwZWVkX3NjdTogSW50cm9kdWNlIGNsa2luXzI1TWh6IGF0dHJpYnV0ZSkNCj4g
DQo+IEphbWluIExpbiAoMik6DQo+ICAgIGFzcGVlZDogQWRkIGFuIEFTVDEwMzAgZXZhbCBib2Fy
ZA0KPiAgICB0ZXN0L2F2b2NhZG8vbWFjaGluZV9hc3BlZWQucHk6IEFkZCBhc3QxMDMwIHRlc3Qg
Y2FzZQ0KPiANCj4gU3RldmVuIExlZSAoNyk6DQo+ICAgIGFzcGVlZC9hZGM6IEFkZCBBU1QxMDMw
IHN1cHBvcnQNCj4gICAgYXNwZWVkL3NtYzogQWRkIEFTVDEwMzAgc3VwcG9ydA0KPiAgICBhc3Bl
ZWQvd2R0OiBGaXggYXN0MjUwMC9hc3QyNjAwIGRlZmF1bHQgcmVsb2FkIHZhbHVlDQo+ICAgIGFz
cGVlZC93ZHQ6IEFkZCBBU1QxMDMwIHN1cHBvcnQNCj4gICAgYXNwZWVkL3RpbWVyOiBBZGQgQVNU
MTAzMCBzdXBwb3J0DQo+ICAgIGFzcGVlZC9zY3U6IEFkZCBBU1QxMDMwIHN1cHBvcnQNCj4gICAg
YXNwZWVkL3NvYyA6IEFkZCBBU1QxMDMwIHN1cHBvcnQNCj4gDQo+ICAgaHcvYWRjL2FzcGVlZF9h
ZGMuYyAgICAgICAgICAgICAgfCAgMTYgKysNCj4gICBody9hcm0vYXNwZWVkLmMgICAgICAgICAg
ICAgICAgICB8ICA2NiArKysrKysrDQo+ICAgaHcvYXJtL2FzcGVlZF9hc3QxMHh4LmMgICAgICAg
ICAgfCAyOTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGh3L2FybS9tZXNv
bi5idWlsZCAgICAgICAgICAgICAgIHwgICA2ICstDQo+ICAgaHcvbWlzYy9hc3BlZWRfc2N1LmMg
ICAgICAgICAgICAgfCAgNjMgKysrKysrKw0KPiAgIGh3L3NzaS9hc3BlZWRfc21jLmMgICAgICAg
ICAgICAgIHwgMTU3ICsrKysrKysrKysrKysrKysNCj4gICBody90aW1lci9hc3BlZWRfdGltZXIu
YyAgICAgICAgICB8ICAxNyArKw0KPiAgIGh3L3dhdGNoZG9nL3dkdF9hc3BlZWQuYyAgICAgICAg
IHwgIDM0ICsrKy0NCj4gICBpbmNsdWRlL2h3L2FkYy9hc3BlZWRfYWRjLmggICAgICB8ICAgMSAr
DQo+ICAgaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oICAgICAgfCAgIDMgKw0KPiAgIGluY2x1
ZGUvaHcvbWlzYy9hc3BlZWRfc2N1LmggICAgIHwgIDI1ICsrKw0KPiAgIGluY2x1ZGUvaHcvdGlt
ZXIvYXNwZWVkX3RpbWVyLmggIHwgICAxICsNCj4gICBpbmNsdWRlL2h3L3dhdGNoZG9nL3dkdF9h
c3BlZWQuaCB8ICAgMyArDQo+ICAgdGVzdHMvYXZvY2Fkby9tYWNoaW5lX2FzcGVlZC5weSAgfCAg
MzYgKysrKw0KPiAgIDE0IGZpbGVzIGNoYW5nZWQsIDcyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9hcm0vYXNwZWVkX2FzdDEweHguYw0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9hdm9jYWRvL21hY2hpbmVfYXNwZWVkLnB5DQo+
IA0KDQo=

