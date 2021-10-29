Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1A2440333
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:27:35 +0200 (CEST)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXXK-0008MF-Fl
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mgXOg-0001om-SA
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:18:38 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:44147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mgXOe-0005uW-4o
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1635535115; x=1636139915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/FBK7alxte7bvKZpKlZ3UfHNkeSyXOKvn6TO+MGggPY=;
 b=L7JXEp6xP3cF8fS5OF6XzKgxYPkgeHN+cIPh/r1JBsH38eKusOlmBNoM
 IP3dAviFPAt0VGHYwCSR7kBcTT6se9y/aZRLWCkZKOta6EKi5BTxZChbq
 WkpCgX0W6n+5LgE3kdGfXiAeaDUYbJiEkNwfL0dP0ifg3o4PlIUpQbVYP E=;
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 19:18:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKo+VzDBU6J8eaw+kUBWi2tp0buiBtiBZDIQ2D8H0VlNhbaTnDEc09XPGycGIxafg3G0d95+yuJxQcO5wmjbyw7MHQnUee2HVjFULIAOtk3rV1WpvXZQkHG+pZutjZyEys0khHqLc6C3Tx2t0uI45pnRdiSIAsMa4ji5JMaLgNunC2+tca0uRzvq0HdvvkFWvVKAmuOyV5Zdz4ubYry6tuF7EkHXHefARiqmf+a7KTuqtYDbCYcQx9DU2y7xe0Djn01q5kAh5348+p9AjtzlxhwWeTTgByv0dq556qZxoilr3S/roxMoJJlsE/TfDglbjIpD9koZz1hy1h6sCGxAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FBK7alxte7bvKZpKlZ3UfHNkeSyXOKvn6TO+MGggPY=;
 b=kbrteZP3Lehgd+1T21gCRj0Fgb3lNnAFUljH1fIi8UKXCLuGVzTTWQQzhSVxlwJYsYRuRltyirBZkGoZx5FBEI0TZo1fHm7li6gTNvUALOeSJXHlVIv0irPhRCKxrLlkfCa7I2DJgjm9MNEczsHT1mbOJc98be+7tDKeTvDAHFBA4T3L99VGyUgilZ4DKJagCiYTU7DYGvRHiRqteYJ0jk4l+XeujHEllEUs7RppJ8N4P6wsNTMzDLiU3MF/ITQsC8Y3SQM24E2DTqMC5mg+ecQroIJShih5jy/1hTYoR8gZBnQkE8FGpIMGwCibEBB2qDmNlcZ9z6eXmTNMQc8URw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SJ0PR02MB8815.namprd02.prod.outlook.com (2603:10b6:a03:3d6::7)
 by BY5PR02MB6290.namprd02.prod.outlook.com (2603:10b6:a03:1b1::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 19:18:30 +0000
Received: from SJ0PR02MB8815.namprd02.prod.outlook.com
 ([fe80::20a7:d7b3:2bfa:cd05]) by SJ0PR02MB8815.namprd02.prod.outlook.com
 ([fe80::20a7:d7b3:2bfa:cd05%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 19:18:30 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 30/30] Hexagon HVX (tests/tcg/hexagon) histogram test
Thread-Topic: [PATCH v4 30/30] Hexagon HVX (tests/tcg/hexagon) histogram test
Thread-Index: AQHXv1GMymFWqI2Gf02aMjv75/pqnqvqc/qAgAAAowA=
Date: Fri, 29 Oct 2021 19:18:30 +0000
Message-ID: <SJ0PR02MB8815F28A6EAD32FBB62A6893DE879@SJ0PR02MB8815.namprd02.prod.outlook.com>
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-31-git-send-email-tsimpson@quicinc.com>
 <a0debdd9-30cc-635d-9504-6f1e6fa533e6@linaro.org>
In-Reply-To: <a0debdd9-30cc-635d-9504-6f1e6fa533e6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ac34b65-2efa-4bcf-b4b3-08d99b10e4b8
x-ms-traffictypediagnostic: BY5PR02MB6290:
x-microsoft-antispam-prvs: <BY5PR02MB6290167A8932699F04B6218CDE879@BY5PR02MB6290.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnEzl04HYs9zijjNgZag/eRl2G19hfGf86fp3zwuqPhthha7IKz71TCxIjNM7bsoGQgxrZj8AUXhfDtZ513DRB4tYP33qQJRGe7UsGo4XsVy/fnKdWuGeh5q9vWhwPxtnHuUsRk8Opzj7W42t7/r7UXtqtZSiAPlIpn/a3wiAi0CkATLkNcdeSTivWBPQLl16ctOvD7ge0F76ZO1XQaNuwIixKq5Q06j1k5aMCNBCGLfoGMfka2nh1S/rGqYYszuAXm39SWeEP2k9zBRfeCG3bMm2Ogjzlbt9YA9jaGF2D5s0jnx2ltzQBA0rvu7I/8IjtTuQPLFaCexYrKAY6q7NUX0pNJpyX2IDVQIC6anmIzv5jMpzEpe5z3KwHD6xCjXNcEmewllXDX99DS00RhnMn5Vt3GCKMqf0AMyOyxwj/sldEX+bqQmh+jxWvxc2KHt5fuHiJ1P55xMjsmeSrIL+xeRJt0Lt6wONEVjx4TQrntG551i3lr/GhK2lUCWiCKk7FzsGGH7TmFlkhgQzdfjgJmRF0o5wQC6r+XmJ/z3M73MDMhEwsegdHxPO20UR6/JlwXzFuLz8Ycnn+hyokSBTbhgGyj+RJztZMUJfOwkJlLZbFdjAkqGCJ90obR7KNKIwTzsJZ9gnQzYDlNlz/w+YuSywAkKCatYGyPnhvDnTQ7Nx7L59PSryRt3HIjcow647n54NQCRlbM5F97bJtunUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8815.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(316002)(54906003)(110136005)(508600001)(2906002)(71200400001)(66946007)(66446008)(64756008)(26005)(76116006)(55016002)(9686003)(86362001)(53546011)(66556008)(66476007)(7696005)(6506007)(4744005)(52536014)(107886003)(33656002)(5660300002)(122000001)(8676002)(4326008)(83380400001)(38100700002)(8936002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWV1QzNFTmVJSnNwRmNvM3JBYUp4S2JhOGdQN0c2Q0tOVy82VXNKUFF5M0V5?=
 =?utf-8?B?U1FWV0I1SkRrSmRZbUhvQVFZYUJBSmhqRmFRbWFxUkhuTnREQWtoOVRFZ0w5?=
 =?utf-8?B?RnVzLytDYmcyR1dSakRFZE05ZjBWU0t6THArTERIYSszUloxM2VUbWc1TFVL?=
 =?utf-8?B?U0J3MDRva2svUmlBTkQ2bjU1RFZtQ2Y2ZmhZdm84SnlhU2pwNTV6WHAzSjZo?=
 =?utf-8?B?aG51RUxWcFh5UStaN0czc1REa2lRWkhFQ1cxTkdVSUR1SWFLYWhXek1WU0p0?=
 =?utf-8?B?blZ1bFcwVmJSSGRwc1NKQ0dsamZWU1FUdHNtK1BiUWltMFdWYm1nS0U5K3F1?=
 =?utf-8?B?Nk1ONDUzQWFycHI2TWFKT1I0RWovdnFVT1FqbW81WDZ3VXh3RHZMdnZBSGNz?=
 =?utf-8?B?a0oyaHBxeWsxajlBK2FJMGNSOFlDYWpGMjlDV3I0bUgrVGFMOS9id0JmY3Qy?=
 =?utf-8?B?T3ZPRlR1cG0zN2MwUkhDQXpGS2pPZGErMXZzUWNzSkF4L3RaUW9UVndORnlu?=
 =?utf-8?B?S2tvNHB4aGhvV1hISkt1dStCQ2NMMDBSRzhqU3Zwb2JhUFgwbXBCRzJmZ21Z?=
 =?utf-8?B?cmZ6VGdRam1nY1FiTFhNUU9nNHU5TmliRFc1WjFNR0Q1WTYxdDN6KzRwVExY?=
 =?utf-8?B?azRmQ0Rlamx5bjFnY1UxcHRLK0p1T0p0bWVadm96bUhjbGxEMnIwUTlaSjF4?=
 =?utf-8?B?WEh6VFpkenFhZ3FsK05UTk9XMUlTTDh2MU1TVktIVExSNGRqTDRuNUpiUE5n?=
 =?utf-8?B?aUQ5RnhoZ2dIcGw5VjVaUFVMNm15eXRSTGlUY3VJMXBYZEtBS0J3UklaVXFQ?=
 =?utf-8?B?Zlh5cDZxMlJJUW9OSDFMcFRuS1UvL1hxUzJBZzFHalN6VE0xb1pnblY3K1Y0?=
 =?utf-8?B?OWtab3pPczg5N01yRHUvZGpIR2VHQklLTjdTUERaYVB5QXRpVHFCVEo0NU50?=
 =?utf-8?B?UXkzUGMvNDhqbXI5WngzbWw4MlV6MTdlTU5IMWZlT2FadGNsK2hhY2EyV1FY?=
 =?utf-8?B?Ukw0bjNDK25TcTI5bkwrMVBoK0g3dDVRcWFuMzdIR243azE0cGlSYzRDVUJT?=
 =?utf-8?B?RTg2MjRQUlowc25weHNQeE1YMFdnVWdzMUFPb1NUVjZRWVpLUkY5bk1XaEtM?=
 =?utf-8?B?Q3pvN1hwTS9RMnVsZnd1d0dLS3JNZEJ1MHhuRnpVVWFpMmJSblAvMVhKKzhy?=
 =?utf-8?B?cTlWVExZVzRTd29lZDJERzg3c05PdGtpQUlxMHRuOGNIdk01ekNEZFhCYU5n?=
 =?utf-8?B?U1dxZ1NQMzRIWVFyVlRkdUc3WU9VSzhLTXkzSGpIV1pIVGtENlh3aGcxaVJK?=
 =?utf-8?B?b0V5aEVoZjRsTm1CYnBNTDRvUTlnWFB6MGpwTC9pUVREaGt5QkZ0Nzl1Sm5N?=
 =?utf-8?B?MjNJSGxJeS9tcERsd0oyVHBrc2N4ZHRxdlNZL1FOcVdpaFRuaGJMbEdpMzVW?=
 =?utf-8?B?cjkyRVdVaHpQYWpSSURKSlNIV1R2c0NLdVhLeDhMRDAwWG1nVkcwekRRNXhN?=
 =?utf-8?B?bVRkSWJORWNjV2FVTlEzS1BKV0VPa2NGM0g2YUVES1hUNjBXVG9aWVc4cmtm?=
 =?utf-8?B?V2pSeGRSMU5BVlQ3Mm5pWmNqQ3J2bzRWMEhTL24yWUkwK1ZFY2F5OVJwVEpK?=
 =?utf-8?B?MnFwTHZ5TGhjbWdKQlBwWE1VVk1yVDJ4blZvN2QwTkFleW8vTEFwYWdBNnR0?=
 =?utf-8?B?KzV1d0FqY0RNZ3FYeDc1c2lOemlReldlZDVRaHNrRDk0YVpMcUMwbUxpTDkv?=
 =?utf-8?B?SjZLbDlQTWY1L25PY2RzSnNUSFF6M3plMmJ0cjVITE05a21hN1B6KzFDZTZW?=
 =?utf-8?B?cWdMRmp1RzBScCtJSGFrQ2JjVTY4UnZhOWQ2M2piQVNXTEo0ZUJEZFB6S3Rp?=
 =?utf-8?B?M1ozamhqcmpwbVBQdTVtYmtSQ2JhWTJybDNEN0JnZ1J0cG9xdkdJWTNaZ2Q0?=
 =?utf-8?B?ZCtkSVpleTNRZUFzbUFRNmk0dFd5QlRhbFJFOEJJaHdRYjNTb3krUWlNKzI2?=
 =?utf-8?B?dDRvbGVGb0FaN0FYVUJtNkt6RXNla2QwY1lKMTlNbDQwTkRmZDRpU0R2U09W?=
 =?utf-8?B?WEVOWU56d1JURWExOEJYTU9PNVc0alRWRHJTbUtTWFhHdzdNcFZOOVpnU3I2?=
 =?utf-8?B?UmtzQ0VjaW5rZ1NhOG1YWkY5ZkJUV1NMMmVBOTJsYXJMSzAwQWF4NGZzNzRU?=
 =?utf-8?Q?m1ffu7ipcIOZSjVBt6+P0EM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8815.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac34b65-2efa-4bcf-b4b3-08d99b10e4b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 19:18:30.7383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCTrk5gMWL+RPgZPUYPYrTnSUYv2jQKwwypWxkM28hiBwbM/WtbIYgnY0TvbWZ2wPp5V/jfaw/kBPNKaNPqPOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6290
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2Jl
ciAyOSwgMjAyMSAyOjE1IFBNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGY0YnVnQGFtc2F0Lm9yZzsgYWxl
QHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMzAvMzBdIEhleGFnb24gSFZYICh0ZXN0cy90Y2cvaGV4YWdvbikgaGlzdG9ncmFt
DQo+IHRlc3QNCj4gDQo+IE9uIDEwLzEyLzIxIDM6MTEgQU0sIFRheWxvciBTaW1wc29uIHdyb3Rl
Og0KPiA+IFNpZ25lLW9mZi1ieTogVGF5bG9yIFNpbXBzb248dHNpbXBzb25AcXVpY2luYy5jb20+
DQo+IA0KPiBTaWduZWQuDQo+IA0KPiBTZWNvbmQgaW5zdGFuY2UgdGhhdCBJJ3ZlIG5vdGljZWQ7
IHlvdSBtaWdodCBncmVwIGZvciBpdCBhY3Jvc3MgeW91ciBwYXRjaGVzLA0KPiBqdXN0IHRvIGJl
IHN1cmUuDQoNCkkgd2lsbCBkb3VibGUtY2hlY2suICBXZWlyZCB0aGlzIHdvdWxkIGhhcHBlbiBi
ZWNhdXNlIEkgYWx3YXlzIHVzZSBnaXQgY29tbWl0IC1zLg0KDQpUYXlsb3INCg0K

