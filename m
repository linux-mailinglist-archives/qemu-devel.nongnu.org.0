Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913F6680CFC
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSwt-0004f9-9v; Mon, 30 Jan 2023 07:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMSwb-0004bY-3c
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:07:30 -0500
Received: from mail-vi1eur02on2070f.outbound.protection.outlook.com
 ([2a01:111:f400:fe16::70f]
 helo=EUR02-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMSwY-0007tW-SC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:07:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnFka1TJs3923mBCdsh7k3ok3c+1kcLvnq8KU1XaR6UKSNblAB+3pa9XWWzeKmn2Jb9svFu0kQQt8fFXkuV2jjEG4scv0sb3IRDC0h1Vex7Ws5aKHhbGl1a1riVws2q0HV3rQ0oVYjjhNSJMcN+Sp7RAsz3xWaVSrTjke8aALSab/vHDcr2V9UE5zupcPrz5K6SfRKv3keJGw+aovKx4+lQcnokmSJNWMRrTwoLcIaXYAoTJYhiPupf/UNcmckz5MJrs+j5gfwP9fOfGQXwO6Th6mrUJyDwGdx5zJcLRvKgeCmhAfVgEo0ZyeFufhhdUHnG6lVzV46pgm7t2lPV99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cIMPMhYLAMCgX8Rx2E29/xja309olAuLDecomKOa7A=;
 b=GQr113Bb/1MuVzfc52LFsVoSBGCJHuLZ5kZfZdmwVR3esmy+NvN2RY75C32uvOZXzAxrAjUGWnLpKLmjh0j3lqpTUfVlLUmcHYU5zBVbLXbcbW16My+3t9Z+a1tR2FFiE9vLlMuXy5Yyr2A731xlhxZB4Rq6rFcqF4z9xr3RI5Muio1oZmPfRY8IvJ9kB5lBzFO/nG5zLAnSsEzujQyPHpn/94DoBTr/+TSSXAQ155TfDSYpiaiYlbwQPDxn++JWUFZqVQXsMvnSm7qRrGI+xBj8iJRjTGoMoAKpPkVIbo/jzFmKo5rlH/9YngiCarpO2atDV9bkECjLjUdAtlONgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cIMPMhYLAMCgX8Rx2E29/xja309olAuLDecomKOa7A=;
 b=CDjwHLqKDE/Q7+aWemg4V/G2CMkYoId/SkV+DhoSZItcYtITFduJs6/aCjvn2JKtX0YkU4gUtKuhJxxTzsHMx3n5iCYyL10zKBVMgYSRNB7XfzpdR5gTw5bwHtL8IySLvvfIAVVpa7EQwxPX+3ES7is/nDiWyTvH7D8Ti/4lK3Q=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0952.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 12:07:22 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 12:07:20 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jason Wang
 <jasowang@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael
 S . Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH 5/9] igb: respect E1000_VMOLR_RSSE
Thread-Topic: [PATCH 5/9] igb: respect E1000_VMOLR_RSSE
Thread-Index: AQHZM1oiHjinsUrJnEiZ6lKglB72HK60/sYAgAHgjcA=
Date: Mon, 30 Jan 2023 12:07:20 +0000
Message-ID: <DBBP189MB143380F3BC336D9A80B251A995D39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-6-sriram.yagnaraman@est.tech>
 <e6a03b04-2565-7ae3-ace5-1486369d000b@daynix.com>
In-Reply-To: <e6a03b04-2565-7ae3-ace5-1486369d000b@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB0952:EE_
x-ms-office365-filtering-correlation-id: ed47f94d-afd3-4727-577c-08db02ba8a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JEh9oZ75TExvIiB/eB/iclwQYiP0OVpVP5+nApdzUP0tsTFxJCf04zUiJ5oOIPoF9QcEGqJ2ih/eQ6LfvqC6waT/Ta9OvO/aVW/tu8l1eNnYcQNg/PS5iNw+t2+R7+PiWz9vDvFrA9fz2+BQQS0bi9L6wol4nQjXcAQSQfDI9y4WjjGLO5s2/jcUOrwTjey00HC1p7tb8z/5bcl6/a2aAO8Dj5+3yQP7XgzH8HE83NH3BYNP0R+vdmX4onDGGi/XFIjIUliIKmu8EXtWScVIDaWr8ZtGtRut0kbV8j70diAzoEsZfqoCB6YxRFFfX/Ol1tAA3JxKU2MI1iBBSxICj6U/DbWUjwJ3yAhJ/u0vHnIyJLETU+v8f2buI9DNwm4hz4rLsaiB9ouiv7Y3MN3VFziDl/rfwwFAa9n/s8REvVWfPzjBZZXgpW7wUA7vO9eY7VPxsAY43Od4/NdKlogXu0rD3aZndWryfPitkwBMaPgL3CoZfVuKfwpsFxrzMdIQqMrwu57Kg9DtJ/IJr03z0pcs3rkaVrC0wrbdrso8XgbDNUqE1fmG1EdhzELBUsegkP7Dw0hgOcnVfAFdRFE/Cjj5OUPK1eq2ZLJWtmKx+AnviRXpEmjLV6/sCPn3YfMPVPPzkZFWEOWfS9VntQwToZyvE1/HnvSt0YnY5L78NYUY6T6OPOVGcnccltAaLf6sdmRt3LKE0lITQ7tL4CJevw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39840400004)(396003)(136003)(346002)(451199018)(41300700001)(86362001)(83380400001)(55016003)(38100700002)(38070700005)(122000001)(316002)(6916009)(54906003)(8676002)(64756008)(4326008)(66446008)(66946007)(66556008)(76116006)(6506007)(53546011)(33656002)(26005)(7696005)(186003)(71200400001)(9686003)(478600001)(66476007)(44832011)(2906002)(52536014)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGV3dCt3UWZLSDgzTlpkak44dmNWcmx2dTd5bUFVdTNSMjRUODJIY2xIazJL?=
 =?utf-8?B?bVh5V0FSWHN5RU5kREM2U0xQU21VRjhTZFpMOGF3c1JBcUE0WnluL2NDUW41?=
 =?utf-8?B?SnJ0QTMzWE5jVHNTZmxEWDNCQWRtRkpDWThIZEoxbDJ5R1I3YXREUml4RmFE?=
 =?utf-8?B?U1JPSXNqOXFyVTVMbGptWlJ6TEd5cHlIcWx1SXBndFhTdG4rc0JwSlVweUxU?=
 =?utf-8?B?RU9UbHg5ZWdpZzNSUkl3WWlXNXlnK014aWIrT05neUVtSkV2dWJaMWlNWlJT?=
 =?utf-8?B?bHdQaU9WNmVaOHVIdXlnV2sxS3ZYYzRRMDN4Z2ozSlU1UEJIZHkxYUtway9q?=
 =?utf-8?B?elV6UCtHZTh2eUFtQ1JlZHNYaXVrMXphalJVMnc4NXM5aytRV296dXBFS0J3?=
 =?utf-8?B?b1BXQzJDTjduNThhN3pQcEhOcWxHekxHQXZ1OUpIVERaKzBhS1RZYW8xU1lO?=
 =?utf-8?B?MmVuNFVVWWd5K3AvMVRLWHZFNUEzT2s3emV6MFlyK21IbTJ5eXFBNUpQWG4z?=
 =?utf-8?B?OFpZVjlRcVl4dzREMkFZaklwWHBFcU1CRTVHSGxHMGNjeWNNYjZpUjFQS2ww?=
 =?utf-8?B?OGVoZlN5azdEeGNERnJTRlhNbEU2Z3YvZUh1dXVrVVJrTUx2QWtGOC90Wkd3?=
 =?utf-8?B?VlJFc2lmM3Y5Sk1ESW9SVTd0MFpwdUErQVhUcWxqR2lZNHExeHZmaWFyWS9z?=
 =?utf-8?B?VC9yZXNiNEhLSm1pV1FYV2o2UUFNUEdkVmFPMmlleFFLWUMzTEhUdFF3NFFh?=
 =?utf-8?B?d1dUaTRDMmJCS0xVTWljb3A0V3JWTzZMOGJjd081WGI2ODNJZDBVUlEvQ0lV?=
 =?utf-8?B?WFJWTlM2aE5XdGxEb2NDNGVoMkg3U1lrYUswb1BSdDVjZFFyLzdGUi9xa0Ro?=
 =?utf-8?B?cldzR29rUUtuU0FYN01uY0ttbFQ2bHpmK1U2dkZnNnh2S3IwMFJxZG9hZGFJ?=
 =?utf-8?B?VVpHZTRaV1BVZXhjMXNubFBvaE5FN0Fuajg3b0E4eE1Qcy9RZTBBZU8vZ3l5?=
 =?utf-8?B?dWMvdytTZk9mQkpJUUN3UmpBejVNd2tIa1VJdDZlWGVKazhmQXVQa2pINDZU?=
 =?utf-8?B?Zjk0RlFwbnlrRzBuWUZ3VWsxYmg1allnQkE2dVhsSTBicEhIMjRmWk5KN3FF?=
 =?utf-8?B?MHRvdDN2SlJhRC95b2NLN2V3aSs4ZHNKSlYvWHExY216cFhSbWkzdEdkWE5L?=
 =?utf-8?B?OXdsNGw1R1RqZm5Ya3crU1RUU3VuVWJLZkdtcmRSOVNwM1Y3ZGlYOEl3WGw3?=
 =?utf-8?B?SFFVY0V6S084QVp4WmlOdEEyVmdTUXgzRm5GUHR2M1dLd05FQWJSdE9mRjdS?=
 =?utf-8?B?SVlyY2UrM0VHbVI0NVVZRUtqUm1nRHFrNTNoekhkajdmclVzTUZYSm0raHFi?=
 =?utf-8?B?Y0FXUENXcjBHWit1ZWhwS0RtTXU4SFpPcmNPWG1FNldQRmZtSitUaWU3N3VC?=
 =?utf-8?B?Zkw3Z1AzNUNWQmlrSnJTMENNNHZYRUNnd1ZsWlExbXZoRm85aTBpeEYyT3dh?=
 =?utf-8?B?aS9jRm81MzFQVlhMNk5LQnltV2phbUo4NGdWOFNKYnNaOVFpVzdrMDc2clZh?=
 =?utf-8?B?U3ZOWW9DcWEwZmV1RDRQc0E4TTJENnNycDVOcWVRbzE1cktzZFdZMWd4ODNI?=
 =?utf-8?B?ZWEzejRmdVVrN0pLT2U1MytTRm5LVS9FbE1oeWtCQm1xMTFadUY4ck5LN0lW?=
 =?utf-8?B?SUJCMmtHR2svWHN4dTZRb3dYL1lQSDBreXplZ3hldHROYkd6ck5YYjhsYjVJ?=
 =?utf-8?B?Tk5oVGZSMCtGRk5lbWlObzdjYUxPdVZhdk9BbTJOM0M5YkNIK3RQeVE0WGh4?=
 =?utf-8?B?MVdobm9xSGRJSGlGbVEvT1RlOXJmMm1YTVpHcmRMQy84aWpFUmZtWXFRVVVN?=
 =?utf-8?B?enphaEdBYjFPNXBkdFd4TFZ4dk0xaTF0ZVpPUXB3QlVVaUd2VFZzVWhsbnVL?=
 =?utf-8?B?NW4rUkdpRnpXK3RTRkMrMTN4RTNLTWVZR3lUS3VEdGRQbFY4MzF6S0I2NHdj?=
 =?utf-8?B?OS9YL29tNlVhbktYVWp2ZVc2cXAvL1RLYi9MT0pYRlBVTVk0THY3ZXNRMVc0?=
 =?utf-8?B?OVcyeEFBN3V6NHZuRHAvNlZFNU5CU2VGRzRZR0RJVlZNTUpaZUI1L3Rad1Bu?=
 =?utf-8?Q?AC9CTWGc3gPbRItgNPzmsi8g2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ed47f94d-afd3-4727-577c-08db02ba8a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 12:07:20.7791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y18wJBRSruxJQ639muLz+BcFTsduKEjReIN0SqiorFdq31AfsOpNF8P+VVpTT113k9bsHBVZEuhjlSlLfPPJ+zQy4dsaJT8lXT6h1teHQSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0952
Received-SPF: pass client-ip=2a01:111:f400:fe16::70f;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBa2loaWtvIE9kYWtpIDxha2lo
aWtvLm9kYWtpQGRheW5peC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgMjkgSmFudWFyeSAyMDIzIDA4
OjI1DQo+IFRvOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
DQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+OyBEbWl0cnkNCj4gRmxleXRtYW4gPGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+OyBN
aWNoYWVsIFMgLiBUc2lya2luDQo+IDxtc3RAcmVkaGF0LmNvbT47IE1hcmNlbCBBcGZlbGJhdW0g
PG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDUvOV0g
aWdiOiByZXNwZWN0IEUxMDAwX1ZNT0xSX1JTU0UNCj4gDQo+IE9uIDIwMjMvMDEvMjggMjI6NDYs
IFNyaXJhbSBZYWduYXJhbWFuIHdyb3RlOg0KPiA+IFJTUyBmb3IgVkZzIGlzIG9ubHkgZW5hYmxl
ZCBpZiBWTU9MUltuXS5SU1NFIGlzIHNldC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNyaXJh
bSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4NCj4gPiAtLS0NCj4gPiAg
IGh3L25ldC9pZ2JfY29yZS5jIHwgMTggKysrKysrKysrKysrKy0tLS0tDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9ody9uZXQvaWdiX2NvcmUuYyBiL2h3L25ldC9pZ2JfY29yZS5jIGluZGV4DQo+ID4g
MWViN2JhMTY4Zi4uZTRmZDRhMWE1ZiAxMDA2NDQNCj4gPiAtLS0gYS9ody9uZXQvaWdiX2NvcmUu
Yw0KPiA+ICsrKyBiL2h3L25ldC9pZ2JfY29yZS5jDQo+ID4gQEAgLTY5LDcgKzY5LDcgQEAgdHlw
ZWRlZiBzdHJ1Y3QgSUdCVHhQa3RWbWRxQ2FsbGJhY2tDb250ZXh0IHsNCj4gPg0KPiA+ICAgc3Rh
dGljIHNzaXplX3QNCj4gPiAgIGlnYl9yZWNlaXZlX2ludGVybmFsKElHQkNvcmUgKmNvcmUsIGNv
bnN0IHN0cnVjdCBpb3ZlYyAqaW92LCBpbnQgaW92Y250LA0KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICBib29sIGhhc192bmV0LCBib29sICphc3NpZ25lZCk7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgaGFzX3ZuZXQsIGJvb2wgKmV4dGVybmFsX3R4KTsNCj4gDQo+IEkgYWRtaXQg
ZXh0ZXJuYWxfdHggaXMgc29tZXdoYXQgY29uZnVzaW5nLCBidXQgaXQgaXMgbW9yZSB0aGFuIGp1
c3QgdGVsbGluZyBpZiBpdA0KPiBpcyBhc3NpZ25lZCB0byBSeCBxdWV1ZSBvciBub3QuIElmIGV4
dGVybmFsX3R4IGlzIG5vdCBOVUxMLCBpdCBpbmRpY2F0ZXMgaXQgaXMgcGFydA0KPiBvZiBUeCBw
YWNrZXQgc3dpdGNoaW5nLiBJbiB0aGF0IGNhc2UsIGEgYm9vbCB2YWx1ZSB3aGljaCBkZXNjcmli
ZXMgd2hldGhlciB0aGUNCj4gcGFja2V0IHNob3VsZCBiZSByb3V0ZWQgdG8gZXh0ZXJuYWwgTEFO
IG11c3QgYmUgYXNzaWduZWQuIFRoZSB2YWx1ZSBjYW4gYmUNCj4gZmFsc2UgZXZlbiBpZiB0aGUg
cGFja2V0IGlzIGFzc2lnbmVkIHRvIFJ4IHF1ZXVlczsgaXQgd2lsbCBiZSBhbHdheXMgZmFsc2Ug
aWYgaXQgaXMNCj4gbXVsdGljYXN0LCBmb3IgZXhhbXBsZS4NCg0KWWVzLCBJIHVuZGVzdGFuZCB0
aGUgcHVycG9zZSBvZiBleHRlcm5hbF90eC4gSSBtZXJlbHkgY2hhbmdlZCB0aGUgcGFyYW1ldGVy
IG5hbWUgaW4gdGhlIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIHRvIG1hdGNoIGl0J3MgZGVmaW50aW9u
LiBBbnlob3csIEkgd2lsbCByZW1vdmUgdGhpcyBjaGFuZ2Ugc2luY2UgaXQgd2FzIHB1cmVseSBj
b21zZXRpYy4NCg0KPiANCj4gPg0KPiA+ICAgc3RhdGljIGlubGluZSB2b2lkDQo+ID4gICBpZ2Jf
c2V0X2ludGVycnVwdF9jYXVzZShJR0JDb3JlICpjb3JlLCB1aW50MzJfdCB2YWwpOyBAQCAtOTQy
LDcNCj4gPiArOTQyLDcgQEAgc3RhdGljIHVpbnQxNl90IGlnYl9yZWNlaXZlX2Fzc2lnbihJR0JD
b3JlICpjb3JlLCBjb25zdA0KPiA+IHN0cnVjdCBldGhfaGVhZGVyICplaGRyLA0KPiA+DQo+ID4g
ICAgICAgaWYgKGNvcmUtPm1hY1tNUlFDXSAmIDEpIHsNCj4gPiAgICAgICAgICAgaWYgKGlzX2Jy
b2FkY2FzdF9ldGhlcl9hZGRyKGVoZHItPmhfZGVzdCkpIHsNCj4gPiAtICAgICAgICAgICAgZm9y
IChpID0gMDsgaSA8IDg7IGkrKykgew0KPiA+ICsgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwg
SUdCX01BWF9WRl9GVU5DVElPTlM7IGkrKykgew0KPiANCj4gSSBqdXN0IGxlZnQgaXQgYXMgOCBi
ZWNhdXNlIFZNRHEgaXMgbm90IHNwZWNpZmljIHRvIFZGLiBQZXJoYXBzIGl0IGlzIGJldHRlciB0
bw0KPiBoYXZlIGFub3RoZXIgbWFjcm8gdG8gZGVub3RlIHRoZSBudW1iZXIgb2YgVk1EcSBwb29s
cywgYnV0IGl0IGlzIG5vdCBkb25lDQo+IHlldC4NCg0KT2ssIEkgYWdyZWUuIEkgd2lsbCBpbnRy
b2R1Y2UgYSBuZXcgSUdCX01BWF9WTV9QT09MUyBtYWNybyBpbnN0ZWFkLg0KDQo+IA0KPiA+ICAg
ICAgICAgICAgICAgICAgIGlmIChjb3JlLT5tYWNbVk1PTFIwICsgaV0gJiBFMTAwMF9WTU9MUl9C
QU0pIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcXVldWVzIHw9IEJJVChpKTsNCj4gPiAg
ICAgICAgICAgICAgICAgICB9DQo+ID4gQEAgLTk3Niw3ICs5NzYsNyBAQCBzdGF0aWMgdWludDE2
X3QgaWdiX3JlY2VpdmVfYXNzaWduKElHQkNvcmUgKmNvcmUsDQo+IGNvbnN0IHN0cnVjdCBldGhf
aGVhZGVyICplaGRyLA0KPiA+ICAgICAgICAgICAgICAgICAgIGYgPSB0YV9zaGlmdFsocmN0bCA+
PiBFMTAwMF9SQ1RMX01PX1NISUZUKSAmIDNdOw0KPiA+ICAgICAgICAgICAgICAgICAgIGYgPSAo
KChlaGRyLT5oX2Rlc3RbNV0gPDwgOCkgfCBlaGRyLT5oX2Rlc3RbNF0pID4+IGYpICYgMHhmZmY7
DQo+ID4gICAgICAgICAgICAgICAgICAgaWYgKG1hY3BbZiA+PiA1XSAmICgxIDw8IChmICYgMHgx
ZikpKSB7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IDg7IGkrKykg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBJR0JfTUFYX1ZGX0ZV
TkNUSU9OUzsgaSsrKSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoY29yZS0+
bWFjW1ZNT0xSMCArIGldICYgRTEwMDBfVk1PTFJfUk9NUEUpIHsNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBxdWV1ZXMgfD0gQklUKGkpOw0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfQ0KPiA+IEBAIC05OTksNyArOTk5LDcgQEAgc3RhdGljIHVpbnQxNl90IGlnYl9y
ZWNlaXZlX2Fzc2lnbihJR0JDb3JlICpjb3JlLA0KPiBjb25zdCBzdHJ1Y3QgZXRoX2hlYWRlciAq
ZWhkciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAgICAgICAgICAg
IH0NCj4gPiAgICAgICAgICAgICAgIH0gZWxzZSB7DQo+ID4gLSAgICAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgODsgaSsrKSB7DQo+ID4gKyAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBp
IDwgSUdCX01BWF9WRl9GVU5DVElPTlM7IGkrKykgew0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoY29yZS0+bWFjW1ZNT0xSMCArIGldICYgRTEwMDBfVk1PTFJfQVVQRSkgew0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWFzayB8PSBCSVQoaSk7DQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIH0NCj4gPiBAQCAtMTAxOCw3ICsxMDE4LDE1IEBAIHN0YXRpYyB1aW50MTZfdCBp
Z2JfcmVjZWl2ZV9hc3NpZ24oSUdCQ29yZQ0KPiAqY29yZSwgY29uc3Qgc3RydWN0IGV0aF9oZWFk
ZXIgKmVoZHIsDQo+ID4gICAgICAgICAgIHF1ZXVlcyAmPSBjb3JlLT5tYWNbVkZSRV07DQo+ID4g
ICAgICAgICAgIGlnYl9yc3NfcGFyc2VfcGFja2V0KGNvcmUsIGNvcmUtPnJ4X3BrdCwgZXh0ZXJu
YWxfdHggIT0gTlVMTCwNCj4gcnNzX2luZm8pOw0KPiA+ICAgICAgICAgICBpZiAocnNzX2luZm8t
PnF1ZXVlICYgMSkgew0KPiA+IC0gICAgICAgICAgICBxdWV1ZXMgPDw9IDg7DQo+ID4gKyAgICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBJR0JfTUFYX1ZGX0ZVTkNUSU9OUzsgaSsrKSB7DQo+ID4g
KyAgICAgICAgICAgICAgICBpZiAoIShxdWV1ZXMgJiBCSVQoaSkpKSB7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgY29udGludWU7DQo+ID4gKyAgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAg
ICAgICAgICAgICBpZiAoY29yZS0+bWFjW1ZNT0xSMCArIGldICYgRTEwMDBfVk1PTFJfUlNTRSkg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgIHF1ZXVlcyB8PSBCSVQoaSArIElHQl9NQVhfVkZf
RlVOQ1RJT05TKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICBxdWV1ZXMgJj0gfkJJVChpKTsN
Cj4gPiArICAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICAgfQ0KPiA+ICAgICAgICAg
ICB9DQo+ID4gICAgICAgfSBlbHNlIHsNCj4gPiAgICAgICAgICAgc3dpdGNoIChuZXRfcnhfcGt0
X2dldF9wYWNrZXRfdHlwZShjb3JlLT5yeF9wa3QpKSB7DQo=

