Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F433C940
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:20:34 +0100 (CET)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvZh-00041I-8W
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLvYa-0003ZL-Qb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:19:24 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:4106)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLvYY-000463-Bd
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615846762; x=1647382762;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d+CfUdruGwx/Ye1LnluzGw4bDdgLQAFSMur0639WfZU=;
 b=Ab06doX7v86XXRe7PkwrejHP32a6cO3fl1YFXvmSDxAywP/W7P1RAcGH
 c5RW03DDr3L9mOeL3Ygmpm/QO4zwWgmz9o2ZcjCfuim7SdvI3/4SNhZlC
 XhSX+cQ9N3LRPw9MmmOqLq09C/o50HXtTyDm+SvM3xBd06puvD4llT68G 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Mar 2021 15:19:19 -0700
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Mar 2021 15:19:19 -0700
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 15:19:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 15 Mar 2021 15:19:18 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB7092.namprd02.prod.outlook.com (2603:10b6:a03:21f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 22:19:18 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 22:19:17 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 29/35] Hexagon (target/hexagon) translation
Thread-Topic: [PATCH v8 29/35] Hexagon (target/hexagon) translation
Thread-Index: AQHW/d3GDdLGZmOd1UesCq0DZKzEA6pYcSAAgCbAjECAA7mcgIABp3tAgACwmACAAI5CsA==
Date: Mon, 15 Mar 2021 22:19:17 +0000
Message-ID: <BYAPR02MB48861FFE3BD8D9F2B703C7E7DE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-30-git-send-email-tsimpson@quicinc.com>
 <152e99c9-675a-1fc8-c44c-e80d5af8ce70@linaro.org>
 <BYAPR02MB4886C193F014511DDCCDC7EADE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <889ed981-29e6-357d-48ae-6d3bb8f63ff3@linaro.org>
 <BYAPR02MB4886A6D9B6D4D88253B5FC2BDE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <0a46f441-2eb4-5ef9-24f1-181301156fbe@linaro.org>
In-Reply-To: <0a46f441-2eb4-5ef9-24f1-181301156fbe@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60cd87d3-83e1-4148-3e9a-08d8e8005fe9
x-ms-traffictypediagnostic: BY5PR02MB7092:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB7092E3C2474163BEFDA1A48EDE6C9@BY5PR02MB7092.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XJXqiLxeS1qyBQDokBr6aVFLljU0brjXdCnFMhm5dDgkd/AaamJpW/qT1WNSd3jRA3UszZpslbm6NvxsuazG7fwwykE4a+uTNL3Jgf/xoWlHHh2qmXaGhz8W7Yam3CLWeGMSWBZD6CVyeaIrO64j86l9txicWhx89cVrrdFRnTjh0U8XrIXJ9Y5bK63rAg670NMjwHU4LhyARcCvJjfb5FUbrdWquSUUoeLWKWNOoSla6ARKtnfA/RmLXm8t+7Pb28rGqjbWRYdzDUwu6ThzdGslKJR4ZMbqfLdE7fAh8L0ZiRlLDQ6TzLwaxnON/0OAufo63bZDP0ZweLs2AAnp/cClO5yRtsFZ/PDy8OZiw1rxVV/Y7ALsnfgXgvdCHwr0fqTYigzOnIywlV9m/vvbXd720rvJ/rqj+rNN+2LhBKAD8K8aO4Zp+z2/MwZa27zJ9GT2pPxiPjZTyUvouAx/rYyoLeJlxCeqvg63bfrYBjGCPOdEkHm2IXBr5dfrxk67vNOBsKgKjeN0OH5a5JFjfmiCheQVQRJBZwKrjxSge/zz80DEF+ZEzo0aXCxcKBWV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(66946007)(76116006)(64756008)(66476007)(316002)(71200400001)(66556008)(7696005)(66446008)(8676002)(52536014)(6506007)(110136005)(54906003)(107886003)(8936002)(55016002)(26005)(9686003)(478600001)(2906002)(33656002)(53546011)(86362001)(4326008)(186003)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WTE1TkN3R2hmbzM2bkJ1TWR6TkE1VE55aDJYZDJFQzE3K0dMeDdWYXA4NnVF?=
 =?utf-8?B?cUh5SWpxRDN0akQrY0FCdnZnbUJLMTFqbVpreHlxbHcxcko3anpVTDJURlZX?=
 =?utf-8?B?RlBHV1RRc3Y5L015RGI2QkhSV20vWmEyb3VJMkRoOXpoaCtIZTRKZzF4RjR1?=
 =?utf-8?B?SjJnRDZxaDB6bTNES3cxQXZCVytCVU5wMzVnSHNoUGM1cHBIYnhuSjI5N3Q0?=
 =?utf-8?B?b2VwT3FQYmtKL1FFcVRmdHRsREFlTHFscUtmOG9WTmRsblJsRTliZUJId2h5?=
 =?utf-8?B?YjNiL1FwQkxMdHpobTJlbjBKSGJxcTJKdnQwcHhXbGtob2x6SzRENmFnc2c0?=
 =?utf-8?B?bzAyNy9Yd09iL29NcWNJSzJWYTVsV0VIQU5tcFJ6K3BNRXY1NkMvTHZQZzJM?=
 =?utf-8?B?V1N6NDVRWEEwQ080YWJVK3NON01pOFhKSTR0NUVqQzlYZWxGWG9OeEFwMGFm?=
 =?utf-8?B?ZDY3S1E3RE9GWi8rYnkwVWNxcWthRERPcGxoeTcySUhsRU9TenMxQS8vbGE4?=
 =?utf-8?B?bGxuV2hrcmo1dFlQTkw1NEtlWlA1OWFCTHQwKzN5WkJvRVYrcGx1WUVqUVds?=
 =?utf-8?B?YWNnd1lrODFQRUIxRTUzYUVIRHJoY1dBMVB5SmMyaU1wYVFXcldZUnQzOG55?=
 =?utf-8?B?WTFUNEJPNUhjKzlUUjcrdG82Y3pYYkpNd0xiaGh6K1ZFdjV6ME5GRUlaZENC?=
 =?utf-8?B?Z1VpZk1uNmp2RG8rVktDQmRYaG9DK1RlUFNqbWhXZ0J6TUdUVWF0Q2lVMzFR?=
 =?utf-8?B?Q0Vma1h6ajFsdFlJM2tndVBzWUJUUjhITnU0UXljUkwzT1ZUcHhRVzFyWWJu?=
 =?utf-8?B?UWwyTWk4RHNneWNVY05rQmVqRVNiOEQwWHE2OXljNE9Wa2NuaWNTUkJlK0No?=
 =?utf-8?B?eFJIMmFRTmM2cVFOc0FzbytOOEx3c01sKy9rdVVwSFE3U1hRUkttTHpQVjZp?=
 =?utf-8?B?VmxWTUhFSzB2MkpyK0ZZTklVSFZjR0hWMVBEck9aUFAwcFZoS0xDUDhFMERY?=
 =?utf-8?B?OGxkNlhYQUZ1SFVLd1VsS1lzTDZ3ZE5XT0F6anA2ZmdhN2JCN1gwMGdOTzB5?=
 =?utf-8?B?bGJSTnNCQXlkL24wcVpCTkNJUU8vQm53M25Wek41Ym5kK2FDVjJiUjdwakc0?=
 =?utf-8?B?NGd4UitVc0dKMDI5VHNXdjVEbVlLOXJzR3VObUZaajBENEhNWHJFQ2hjcWZK?=
 =?utf-8?B?bVBjYlZrQm9CRHl4YTJVYUhQVnNCSXNrRmM1bm41djMzclh3RHBtMVBTV1lj?=
 =?utf-8?B?MXM5RWhEN052ckQ5Wkl3bGo3a200VnVvNldBTng1U0RsNjVpYyt3cmNsNlhY?=
 =?utf-8?B?S20raFkvZmgwWGFnTFlFMnh3USswV0Ivd3JYc1paYWo5UmNiUmw4cVdSMlFn?=
 =?utf-8?B?RkxNSitBU2xVTUdZU0xIcFB0V1VCam1EaVdRaE1DTGd3TUZoc0lXMUpkdE85?=
 =?utf-8?B?ZWx5ZFRGT0NlZEkxMHpOMmZDNG5wbUlsRDZMMTZwc2FQVXdMTSs3MjFXVWNH?=
 =?utf-8?B?TkVpL0JwOFRFeDFrdXROUVlaUXBlUlkvNDAwSXlPK2pGOFh6Zy9hN3hGUUpW?=
 =?utf-8?B?WmE1QUZWdW1mekpZREpIS3N0SGRpTFlsdEU1RDNDaUxqSENVUTJTWFU4UUtn?=
 =?utf-8?B?ZjNkczVCWHJvaEoxT1FaM0RJdjVwdFNoYUZtMVU2d0VmU0tJTUhvLzI5UFNH?=
 =?utf-8?B?RFByUlBWbVNzSm1hSXVXQ3JvdmpYYTVveFdwZ1BZRFpaVjdxbHNWZGlUNWNU?=
 =?utf-8?Q?obmrYoCx9U7lxOgLu2np6CGzimyZ3mUqgWN9rga?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX2iLl4Qab/IBJ649cLpFJmzXQtkOUY3FPL3rLoJ56K2NdKqMEGLf592qCemQpHiWhnzGfN0neN5+2V2DOE3yFyYSEiTJ5URUgpfXdZ3S5zWSJiRo2xfPRAi2Cf0+PG5/5P9Pp2hIqHsTXqHicf+pfMzVj6mIqyGioOu2+HLnWJU/MEDM4fFs0jB5HZu+am3In+5emn+UMumqBNV85BlZJWPPA/wdgxYUiLlTmMjH3xv1v2IQA8IiUZ4o2hbhXcnHR7UgJbr/4dGFG6FSIFqcqmD3UMFRthbeyi1MaCOwTUM+7PBn1ue9Tp4VNoEkBVZKkTxuMsXOlrmgS18c5FlMQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kF6Un0tuzgtmgyURdUE3B8P3fQKHFEKE1NlAuDY0g9Y=;
 b=FidB79FFEl6a2WzzGQMdq+IcE29JRE12D8erL/gVioYEZwZ1plVAwyRCN63FowrZ7bqaiZEd+yUV20ANb+wqBWXO9C6vrYz7Spx9G8tk5A3sWXDHROtn3I7KSKBflvtMDcov8lOrW6GseZAVcCNA4r4fGmrEpaAle31O41AH07RnAne5GaDjOrs6AAB1SAKRwNJS3Yg9VjEv76FQbgBy6Wm3LS+KYnt4DHlASdWDj3EX3YZG0s6Zb2eqqVxfl5yUXF6LS+QEFyzMipSMi0oyk6TASBLxEOhbzbns/EP+UpYsboghWiQt09yYwkddqbhEwpiw0KI0+bU62nfhlf8PlQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 60cd87d3-83e1-4148-3e9a-08d8e8005fe9
x-ms-exchange-crosstenant-originalarrivaltime: 15 Mar 2021 22:19:17.8671 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: cDs1Bg0bSgN345lT77dV8IWpYK75qcuE48jWg/+bF7frg8xvpZ9JGQwnKoOPkqlIX8d1A2nAwpfNDuQilj0AfA==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB7092
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDE1
LCAyMDIxIDg6MzIgQU0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNv
bT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGhpbG1kQHJlZGhhdC5jb207IGFsZXgu
YmVubmVlQGxpbmFyby5vcmc7IGxhdXJlbnRAdml2aWVyLmV1Ow0KPiBhbGVAcmV2Lm5nOyBCcmlh
biBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAyOS8z
NV0gSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIHRyYW5zbGF0aW9uDQo+DQo+IE9uIDMvMTQvMjEg
OTowNiBQTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4+IFllcywgYnV0IERJU0FTX05PUkVU
VVJOIHN0aWxsIG1lYW5zIHdlJ3ZlIGFscmVhZHkgZXhpdGVkLg0KPiA+Pg0KPiA+PiBKdXN0IGxp
a2UgY2FsbGluZyBhYm9ydCgpIGluIEMgbWVhbnMgdGhhdCB3ZSB3b24ndCByZWFjaCBhbnkgZm9s
bG93aW5nIHJldHVybiBzdGF0ZW1lbnQuDQo+ID4NCj4gPiBUaGVuIEknbSBtaXNzaW5nIHNvbWV0
aGluZyBiZWNhdXNlIHRoZSBjb2RlIGVtaXR0ZWQgaGVyZSBkb2VzIGdldCBleGVjdXRlZC4NCj4N
Cj4gWW91IHJlYWxseSBhcmUgbWlzc2luZyB0aGUgcG9pbnQuDQo+DQo+IFRoZSBjb2RlIGVtaXR0
ZWQgaGVyZSwgZm9yIHRoZSBOT1JFVFVSTiBjYXNlLCBnZXRzIGV4ZWN1dGVkPyAgSG93IGRvIHlv
dSBrbm93Pw0KDQpJIGNhbiBzZWUgdGhlIHNpZGUgZWZmZWN0cy4gIEZvciBleGFtcGxlLCB0aGVy
ZSBpcyBhIGNhbGwgdG8gZ2VuX2V4ZWNfY291bnRlcnMoY3R4KSwgYW5kIEkgY2FuIHNlZSB0aGUg
Y291bnRlcnMgYmVpbmcgdXBkYXRlZC4NCg0KPiAgIEFuZCBpZiBzbywgdGhlbiAqc29tZXRoaW5n
KiBpcyByZXR1cm5pbmcgd2hlbiBpdCBzaG91bGRuJ3QuDQo+DQo+IFRoZSBzdG9wIGhvb2sgaXMg
Zm9yIHRoZSB1c2Ugb2YgYWxsIG9mIHRoZSAqb3RoZXIqIERJU0FTXyogY29kZXMsIGZvciB3aGlj
aCB3ZSBoYXZlIG5vdCB5ZXQgZXhpdGVkLg0KPg0KPiBUaGVyZSBzaG91bGQgYmUgKm5vdGhpbmcq
IHRvIGJlIGRvbmUgZm9yIE5PUkVUVVJOLiAgV2UgaGF2ZSBsb25nam1wJ2VkDQo+IGF3YXkgdG8g
dGhlIG1haW4gbG9vcCBhbHJlYWR5LiAgQW55dGhpbmcgdGhhdCBuZWVkZWQgdG8gYmUgZG9uZSBt
dXN0IGhhdmUgYmVlbg0KPiBkb25lIGJlZm9yZSB0aGF0IHBvaW50Lg0KDQpPSyAtIEknbGwgbWFr
ZSBzdXJlIGV2ZXJ5dGhpbmcgaXMgZG9uZSBkdXJpbmcgdGhlIHBhY2tldCBnZW5lcmF0aW9uIGFu
ZCBub3RoaW5nIGlzIGRvbmUgZHVyaW5nIHRiX3N0b3AuDQoNCg0KVGhhbmtzLA0KVGF5bG9yDQoN
Cg0KDQo=

