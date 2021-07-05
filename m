Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672033BC3E5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 00:31:07 +0200 (CEST)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0X7J-0001aD-ME
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 18:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m0X61-0000ee-Rr
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 18:29:45 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m0X5z-0006dH-Mf
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 18:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1625524183; x=1626128983;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5HEpeypo0LfDGrJ2j9piMTO7rfJ/JCtcb9pxNglGMlk=;
 b=rv/dKbtg/EvkpSh4irDbvba1QHZr7IL5CYb3/wXUU/i4dcnGjqfr3EAQ
 dZqm1UG48Gt4rtbTZR+0RgfutmEqyPCtl7Y2+vl2JTeLZWpC2K3y81a8X
 3IVOc7Rvu8/+I84bmiKcgZr3OGpqDImUdQFjq6ccx2rCjQch4H/zX1gQQ E=;
IronPort-SDR: YZbUJcj9TbD4MUcPTEzWHWK3AS0DK5rlw7fhrT16CMELJ7zOzZjHYFEBvU9ruZWX1H97FtJxpm
 6tLFWhBOpBFXatZvAX08Arv5L2o40Qixm48eeBodTrQYKAmYhb+Z2ACuRjvFJDWTzRquaJ5tGh
 Y+t90cOrctrLtywtoacPx1BSERMgiGMMfOh3bewpkAiZohseN7ig0Kh6lGE8Og9b2exQ0kKhaA
 X5P+0qM4UUNyOOmFY+x5XQH13BdkvoHDgK+khF+Jq10e6VATDgsmQrk4SVJ/EhMQySbr700+gG
 3f4=
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 22:29:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or8Q5IvbgjwG4iJKR9N/PDcBa010jdRZ7//LUpbCMgLzVXmnA9ofgfxCFH8vl18GBHEper4NdKfPyfw9iLgkXeDIQQ5Z/Oje0ADyRT2lkC7KUn03eVvmm+SLbLIpMP1cfvwhbt7cHT61B6QzRz3DsrbMPGHZ6fnMzLuP86NaFUpf723FxBx20jKhU+16dR2ZIOBls6JMgzLlcc9AofoWay8v9dpajrv9sRLw22ujH/j/MHtj2k5+wFxljIpx/lW1nLYws44eSsl5mITKmzhzDyRFifx17ClF76eyvBiHGUm1eExpHQiU9s1+jYHVg0dnO7d2Go6xIIvR3MAPZhM5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HEpeypo0LfDGrJ2j9piMTO7rfJ/JCtcb9pxNglGMlk=;
 b=HHEynzpJcH4Ha+sd4cDm3J4JfPLK6aaSiYGsGQnNCfyrAmGfQjpTiBcBpoV1rnpqQ0I9GoFCymZWJXIqR4f64nyUjVwSYtJE1Jzyy6WJ4EerLfdeplt1LqSmGyzgtjztQtwCkbbjtzY321rpAo8K16fNV+M/qh3gaUpqKR0ojgEPwBzqTsCR4zifc7nkfCtBVICFjH4+cdRRBHOWy87d62qpjVuzYR3ySxwit1UwIMrIAN9T3201wH4XqG+0yDX0e31GYG7facXLFcxUyIrFpBjcWGkQugY09a3BbdLbnlG1cnH42YkVGdOi7wsprmvVhte42prLRZRUnO2pCyARZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4952.namprd02.prod.outlook.com (2603:10b6:a03:45::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 22:29:37 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 22:29:37 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 12/12] linux-user: Extract target errno related functions
 to 'target_errno.h'
Thread-Topic: [PATCH 12/12] linux-user: Extract target errno related functions
 to 'target_errno.h'
Thread-Index: AQHXcQPcDyx8cOtSvESXh8edXM+nLKs08qIA
Date: Mon, 5 Jul 2021 22:29:37 +0000
Message-ID: <BYAPR02MB4886AA7871C08840750AE058DE1C9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-13-f4bug@amsat.org>
In-Reply-To: <20210704183755.655002-13-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [163.116.147.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4a35c19-c27e-4215-d6ad-08d940045f79
x-ms-traffictypediagnostic: BYAPR02MB4952:
x-microsoft-antispam-prvs: <BYAPR02MB4952EB8A787EDA11940B2600DE1C9@BYAPR02MB4952.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5VBGIBSI1GyMOKvS2E4VZywhyeB/B8+Piw2wKKYbrsFSc1fVWO4JtdqSJ6OlFrCxV848kcAHEdVTdiuFV+apRHNRLyQwZnCPtREmGoA5FCIy3TIMDeudxf1sfMQjSMgfUxy+AGVQ0TwPzFOU2p0t6ANfkp/jXcZwTXNMxgRWV4egmWcS/LMRpB/HT2hlaO6LoEJ0I1dSXj9et+De2i95sU/XvtiqXV6dh9r1N1rOof9/IXNBoGnbWwzwC80LywvNTmGO1H1F+DQdJxajBss5beXyfkx4Q0QSDxxWq1s5KxQ62Fs+6kT77kPlilc0TCM5qtuhPGD0fPqWVl+j6iYcAls4tZo/0urNs4OJ4/rOlgvkdu3hFc//V1DQFszcW3ZDixWltNTL0FpMxajFPOiWf/VDVMucA07tmDdRl2O60uwQ2+iSFTPzIWpi55Q10/jpmFtdJzR8uwFyOFA6OJofYm4DMgqvIeVUUCP8/cp5k75yMUUkoZJ6ESB/14z0ZD/15WFXF2Gyh+C8UR5st0+1GkVyXD+Q4EzFNOC5UKr7EynxC6cSZu70aMzV53zjyL/1PSDvqouiGWebTtrObyarWgYBYeyKwSszDhdJr6GwRp4+E3lRWTar8zN5lzfmRFl/jI1yo16Z0s+wVCTqLV60ow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(186003)(76116006)(5660300002)(33656002)(38100700002)(66556008)(66476007)(122000001)(86362001)(66946007)(316002)(4326008)(110136005)(54906003)(64756008)(66446008)(2906002)(478600001)(83380400001)(8936002)(7696005)(71200400001)(53546011)(8676002)(6506007)(26005)(55016002)(52536014)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGFNejNNUW5Xc3R3UGloMHU1QzhhS1pRSUg4OXdQM1pRQ0dMOEE2YkU2N0ta?=
 =?utf-8?B?czA1TkRLRHlhV1A2Z1M4NUxqTlNHeWx1MkJOZ0dnSEdGRGczc3lpU1hXNzJk?=
 =?utf-8?B?QkVlR0ZxaEx0Nyt2cEt6NHNDdVFGU3lTYzFMS0JmdWl6T0JOVUo0bEV6SmEr?=
 =?utf-8?B?NnpSaFBIdkRZQ2tFaWRtQkZZS254c3ZVbXU1Qnc2a2lnbmUwaDFjNFIyb0Fy?=
 =?utf-8?B?SmxWU1V5enUxQWI5dXZrWStpc3lLU1ZEcitLYVVoWFp3MHBpVjR4ZEhXK3ZI?=
 =?utf-8?B?WlU5S0dNbmxBVzlXUmY0N0d6cW1VTWlYUFVHVzA4S0xrZFZLcEx1ZG5DdDNP?=
 =?utf-8?B?L25mVGhyZlgzd21EaU50YVZYSGI1bVVVN2lreDJZRjZvVHVwRVU2ZWtYS1RL?=
 =?utf-8?B?TzA0c0xqdEMrTzBqQ0RPZThGQ0QvTTBlUWdXNlMvNU12WE1XUkY5SjJLYjNw?=
 =?utf-8?B?aFdUUU16OTlPNTJlVlpEYmdGMzVweUQyajg5ZW1tdXl6Um1FeHhoTnEwTEtC?=
 =?utf-8?B?dEJHZkNUSThqajVNWVhURGRtNXZSUDdnLzJvUmxvVjJaTzNmTTkvQlZEaW1m?=
 =?utf-8?B?RUE4SE1hVjFsalhLdExlTVRxUTJmY1BZaXJxdGhHc1pyVkRzN2xCdkJsV1lF?=
 =?utf-8?B?UjFyNXQ2OFNYbk45OGsrWVY3a2tFbW1ZN1JPb0o1OEdaTk05UGZrYmNuQ00y?=
 =?utf-8?B?dmlNWVpUbHpaaXJIcUlxOEVhNnFtTHZSa3ZHSXhRRmY3YVlSazRiWEE0NTNB?=
 =?utf-8?B?N3lzc1BqYUxhTjdHaERINHpuTTYwUEZaTlg5VVAybk1EcFNzc00yMjJVRWM1?=
 =?utf-8?B?bUlXbkdJemZ5OVFHUkM3VVVGYVBOZldXSEY1UExFa2VCK0FlWEJVUlVaeXZM?=
 =?utf-8?B?MVhDT055WFFpRFhwK0puZitRUzV2V2dXVGpraVZ1dStpVmJRRTFEbFJKL2NL?=
 =?utf-8?B?WGF5L0g2Lys4c3ovV2FzRzBQWkZYUVFsbUF3MEVhaHlFYlh3UkMvcXVOU2l2?=
 =?utf-8?B?TEcwd2F3K0I3WmM1Zmt2OHUwMG4yL05pRTRCdks0djc4TEtqek4rVmp1UjJN?=
 =?utf-8?B?clRkMTBHVy90MTQ0VnZ5K1d0a21qZjVSNjV6SWE0NmZhVmlBcUdGQ2llQjhl?=
 =?utf-8?B?bVJleXFrZDdKU0IrVHY4MVU1UHVtMGZiRGh6UHMwcDhyS0ZCN0lLZ3Z4ZEFU?=
 =?utf-8?B?Z3d1cC8xdG4rd0hNaTA1eWJsakVWZWVHbExkYWhwU29mbFBBdFNVMUhyL2d5?=
 =?utf-8?B?TkF2c3JkUHhhMWZ4UzVDUjFWeGVxN0o5L0RUNGc4VDVIdStMYnVpSkdVT3BO?=
 =?utf-8?B?V1FCWUtMVGtTeFVOcUd5MnVYdU1TUnNPd0xIR3Zvb3Q3Q21WYWNwVDJEcTls?=
 =?utf-8?B?ZEcrWXkrcXBBdVU2d084dHdBZUVaR0FjTUFjUW5qQ01DemJFWjUxeWVLUldt?=
 =?utf-8?B?WDNOdVhES0p6TUFyMmo0M3Q0ZjU1K1dtdmM4NFljdURMM3VyNVBqT05NbDJT?=
 =?utf-8?B?WmdUNWY4c1ZnRnFjS3FwelhiQ2ZodTZIM3BROTcyckJhek50SE41R1VIOE83?=
 =?utf-8?B?QXc0RzNFU2ZRczZPZC9OWG9PSFJQNWcvMWJudlpReHZlZzAvV2N6dW80Zlpq?=
 =?utf-8?B?bTRPYS81alk2M09rRVFkdnlzYmZwV2p3UllybmdqcVJqaGxoNnZLcVZQQm9w?=
 =?utf-8?B?S3JENW1lMnRpVkZ4RkdMSVdYTXI5bGd0N1lOOTBlb3k3ektQY2tvb0VBUG1I?=
 =?utf-8?Q?j17xGuCnf+me1ROO6hhmcY1XvoSOfAgKX4m2vd7?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a35c19-c27e-4215-d6ad-08d940045f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 22:29:37.4093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8g0KtE70v4cOb4/n6e6tOu6+Bq7xLnV0XzupVq2RGSsa/CwjXEqHILTRsp8YxorkAAxqUmZd3z4s690I07u9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4952
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogU3VuZGF5LCBKdWx5IDQsIDIwMjEg
MTI6MzggUE0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogUmljaGFyZCBIZW5k
ZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBKaWF4dW4gWWFuZw0KPiA8amlh
eHVuLnlhbmdAZmx5Z29hdC5jb20+OyBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+
OyBBbGVrc2FuZGFyDQo+IFJpa2FsbyA8YWxla3NhbmRhci5yaWthbG9Ac3lybWlhLmNvbT47IFRh
eWxvciBTaW1wc29uDQo+IDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Ow0KPiBBdXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVy
ZWwzMi5uZXQ+OyBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IFN1YmplY3Q6IFtQQVRD
SCAxMi8xMl0gbGludXgtdXNlcjogRXh0cmFjdCB0YXJnZXQgZXJybm8gcmVsYXRlZCBmdW5jdGlv
bnMgdG8NCj4gJ3RhcmdldF9lcnJuby5oJw0KPiANCj4gZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIv
dGFyZ2V0X2Vycm5vLmggYi9saW51eC11c2VyL3RhcmdldF9lcnJuby5oIG5ldyBmaWxlDQo+IG1v
ZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwLi40ZTVlOWQzODRjOQ0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL2xpbnV4LXVzZXIvdGFyZ2V0X2Vycm5vLmgNCj4gQEAgLTAsMCArMSwzMiBAQA0K
PiArDQo+ICt2b2lkIHRhcmdldF90b19ob3N0X2Vycm5vX3RhYmxlX2luaXQodm9pZCk7DQoNClRo
aXMgaXMgYWRkZWQgYXMgc3RhdGljIGluIGxpbnV4LXVzZXIvc3lzY2FsbC5jIGluIHBhdGNoIDEw
LzEyLiAgQnV0IHRoZW4sIHJlbW92ZWQgZnJvbSBzeXNjYWxsLmMgaW4gdGhpcyBwYXRjaCBhbmQg
YWRkZWQgdG8gbGludXgtdXNlci90YXJnZXRfZXJybm8uYyBpbiB0aGlzIHBhdGNoLg0KDQpJcyB0
aGlzIHNvIHRoYXQgZWFjaCBwYXRjaCBpbiB0aGUgc2VyaWVzIHdpbGwgYnVpbGQ/DQoNCj4gZGlm
ZiAtLWdpdCBhL2xpbnV4LXVzZXIvdGFyZ2V0X2Vycm5vLmMgYi9saW51eC11c2VyL3RhcmdldF9l
cnJuby5jIG5ldyBmaWxlDQo+IG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwLi4yYTczMjBk
MjQwZg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2xpbnV4LXVzZXIvdGFyZ2V0X2Vycm5vLmMN
Cj4gQEAgLTAsMCArMSwxODMgQEANCj4gKy8qDQo+ICsgKiAgTGludXggc3lzY2FsbHMNCg0KQ29w
eS9wYXN0ZSBlcnJvcj8NCg0KQ291bGQgeW91IGFkZCBhIG1vcmUgZGVzY3JpcHRpdmUgY29tbWVu
dCB0byB0aGlzIGZpbGUgZm9yIHBvc3Rlcml0eT8NCi0gSG93IGRvZXMgdGhlIGRlZmF1bHQgYmVo
YXZpb3IgZ2V0IGluaGVyaXRlZCBieSB0YXJnZXRzPw0KLSBIb3cgZG9lcyBhIHRhcmdldCBvdmVy
cmlkZSB0aGUgZGVmYXVsdCBiZWhhdmlvcj8NCi0gQSBwb2ludGVyIHRvIGEgdGFyZ2V0IHRoYXQg
aXMgb3ZlcnJpZGluZyB0aGUgZGVmYXVsdCBiZWhhdmlvcj8NCg0KDQpUaGFua3MsDQpUYXlsb3IN
Cg==

