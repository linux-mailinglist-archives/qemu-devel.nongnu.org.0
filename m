Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E545473695
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 22:33:03 +0100 (CET)
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwswQ-0006ip-F0
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 16:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mwsvJ-00063N-4Y
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:31:53 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mwsvG-00021C-38
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 16:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1639431109; x=1640035909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3C2+ScIYiKcNhVgHdJMp16uTWfCSW5XKM65n2ehw0hM=;
 b=XlA/HgGWomZgQB4tLELQNN4nPJM1d6RW2gfqEzL851F7QVBhy/39+H/e
 0J3Y7Ci3nwD2fXg9Lbh3MJMxlglJo0dohM9I5eWodT07Vvp7XCSsGDdvR
 5wHaZgDkV+fvfFxAeKAzcrmBhTLBbhroJeuuWgAqBaRDJ3RhMgl+iUoE4 c=;
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 21:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFpCruzqTo3TLN6F6UFu0BGpuNI2k1zavx2kKDq2rSbjKr5TYe8sclT0gsBcA696WYKAq5/sbFtzFMenk4HmbFLvblIipVOpJTcpQ9AZfx4XqfudVDPLnyCrFtBkVDYCOhVcJlGdiRRwQw8DGNqt5fv5QZJdxPABmspbCGBX7G+EY1D8RngRwgT0vn2sGqac6G0Yz2K0cX6LjbCCuL5CTEaf97lzu+OBcpbkedGNuZ1PK5ppE/iBR0TjYk/6EuXfH2DoV5tK18lM0xHFI0MyMaDqlnlKi6h6f4GpHee1NsbaeRzQb3EOKJIHAmZX5KuDKG/HDi+HiZQrVg/OEJK0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3C2+ScIYiKcNhVgHdJMp16uTWfCSW5XKM65n2ehw0hM=;
 b=lYuUEnskzwZVX1wLmxI016rM3kuGh4WXC6ajesFzIBWHC6ANmIZUArn3l2pPtKXHV8plwLTgv9p0a6PXt9GHuuqRCdABPyEbPxaaWe7tfs9Cpm31CTB+p/mEl+S8M5/SWs/Cct1qC31vXnpMeF/6MCBf6edIvV/3Gi1D+t1Dphsdw8KZz2jEZUFNIzJx8jFb+r1h4I6oELqCOsoOocTxvqJtB4ciQBCIcY9hlnH77WPaed5RZ+fYWIQ/a50pGPh7p4ehv1NN6ufbiQtvZvAq4fcb2XJSfJipKtotMM7SbGxqSPqtBAO1jFGNzxKZWzkt/cYoB8FUZG7Iv5hZT+HsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SJ0PR02MB8815.namprd02.prod.outlook.com (2603:10b6:a03:3d6::7)
 by BY5PR02MB6419.namprd02.prod.outlook.com (2603:10b6:a03:1f8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Mon, 13 Dec
 2021 21:31:45 +0000
Received: from SJ0PR02MB8815.namprd02.prod.outlook.com
 ([fe80::a8cb:67b5:264d:e157]) by SJ0PR02MB8815.namprd02.prod.outlook.com
 ([fe80::a8cb:67b5:264d:e157%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 21:31:45 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: RE: update hexagon float ref files
Thread-Topic: update hexagon float ref files
Thread-Index: AQHX8GT3ziCRw4bIiUCS7rzOuHsnS6ww7p1w
Date: Mon, 13 Dec 2021 21:31:45 +0000
Message-ID: <SJ0PR02MB8815EF1B9B3DBCD70E86DD9BDE749@SJ0PR02MB8815.namprd02.prod.outlook.com>
References: <c54f6905-5826-23c3-c619-a19eca3a4c86@linaro.org>
In-Reply-To: <c54f6905-5826-23c3-c619-a19eca3a4c86@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6419a394-17c1-4aec-3131-08d9be7ff648
x-ms-traffictypediagnostic: BY5PR02MB6419:EE_
x-microsoft-antispam-prvs: <BY5PR02MB6419D4368D58B5C3723B6DDADE749@BY5PR02MB6419.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a5g/TJaER5CnMuw6rkzqXzDmmX6gyur/mLjhWS325gumrnfhwzzOu5w+bkUusCSLc79FfNKfa84BWM99VyRBrQyl3NtKfPiY84tiMelikUEZt3sufu6y+TOtm/H3xl5f3Uu5OievjWkMgG08/N0PIul4gTQJWWg1XAiMMNxPSOResgF9FRA6D65VgHRrATd5GXpugBYyEgfQ3Eckxo/1rGwwN+lPyen5PDo8t/IPhr1xPk9P9Ojji39SZzQxBqHrSHQyjTQKZS8mI1Mxmg7aIvlrDNpjmLeDXDMf+0ABSL8tIuOR4j1eR5rNaEyJeN7cyKKASX4PjcwCcVRfxJq+uKGKxwM9676zREt3eEhvyqvcJlevof2vOk2p0HNIwvGD6Pr/MYO+n3K21HasM0Ra+NUxt8Q7hAL9IU1lrwIKCElSALnHBfZuWEjUWNUf8HAwY+zwCahLV1d3GWLqj//M9ItoJvzYq7eXsLRhHB8bBRv4f2+I3g7nnD8LDzlGlhkeJHQtcnWaEZRxd3Eu0L46SactJNDwb20NST6JIxIWa9qFlCpmUdoggmDkrQUhrKP0DWGcVQ7mxyZ2H0yx4f8SSzNDKxknltyV0MzpBzmzuAjuihaX61CaxqkvKwkYQqSrjSp2auAKdnusPw6cxp7FUcZ6MD57m1o4Z8d8q36WdhbwA++nekaQO4VlG9KV3c98KeKfy+58e+FEyNiUyitJ/b5PyW/DcO+IAYM1B4TdK9FTmivIYG60vsMEIdd6Y7+sYAqwyDWFGxlRM3bDG5vSnjtfyR07v2M/MRnP+MFKxl4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8815.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(316002)(186003)(86362001)(15650500001)(4326008)(6916009)(66946007)(55016003)(33656002)(966005)(9686003)(508600001)(38070700005)(6506007)(66476007)(38100700002)(66556008)(26005)(76116006)(122000001)(52536014)(53546011)(64756008)(66446008)(71200400001)(4744005)(83380400001)(8676002)(7696005)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVdQUGlTQW5QclhsWG83N0dnT2RBWS80clZPNHRMK2RIakw4L0dENjAvUDdm?=
 =?utf-8?B?b1J1a084S3l5a0p6WXpYZUlpWUJuaXNYV2Y3Uy9UNExpMUNFNGk0b2poM01h?=
 =?utf-8?B?eWxMZUhDMXo4VTAxWFFxOWtBTjhLRWhVMHIxUWMrdjRWR3ZORHVWVXVVR01o?=
 =?utf-8?B?dU50US8vRUQveG9VU0FkVnY3QzFqRFdNMXhWY0wzR2ZvSTZSVkNKdmJuNWpR?=
 =?utf-8?B?anNUOEt4VlFqUHROYS96Q0NDd3BVcUJYRFlYSUp6M0VORUxOQzZiOHlmYy96?=
 =?utf-8?B?QllEVS83bG9ybzhqdkszYmw2QmFvdi96RHJUelRZVVZGdW1BTFJCNHE5Qnli?=
 =?utf-8?B?U01RZHZSRG1wdVIyZWphUUh4NWxLbGVxUXJaUkZpMWx3SVNEQjdtZURES0JL?=
 =?utf-8?B?STlTNXJIL1hLMkI2Qi91c1pwYVhRS0p1SWMrcG5YMTZDUFMyQzlEaUoyRHQr?=
 =?utf-8?B?L2tZdXFjLzNaUkkxZW9OakJrK3Zvd1BmTXRVR1BHd093aVZTcVVkVUI2NkF6?=
 =?utf-8?B?L0RkNXEyNjc0NDFUMS9TaWtUWXF6eURxOHZXeTdPNjV1citsSjBaNCt4U1FF?=
 =?utf-8?B?eFNnTWsrRnMxM1Yrc29Da3BUTTZCWms1RktxMk9iL0FiSTIrVXFUenVDN3hZ?=
 =?utf-8?B?NnAvNkE2eUl0eDhXVjJhait6QUtiMU5wdVBsQnBtMWUzQXZwL3hzTWJHa2VB?=
 =?utf-8?B?UmkrTkNVVTZpaXMrT0kvM1I3a0lPM0k4c0RrcGlQUXB1ekZDclE0SCswOHEy?=
 =?utf-8?B?aXk4SU1QZTJnTmVZdEJYQW05OFBtVWtEUm5EcUxGdkhibUdOeTE5UG5vZ3Rz?=
 =?utf-8?B?dExiZzIvR1JFQzdsRmhJTXdRRFRyQzF6WGlkaWZ5Z0wvUEh0ejVBTW1MY3J6?=
 =?utf-8?B?UUdNZitCbWZ5MTFSanN6TEw4TFpSOWNoM21hY0NNRCtEaVdEbXkzSmdRb0Ju?=
 =?utf-8?B?ajZtQWJJS2JmM0hTNWhyM253S3Jxdnhzb1N2R2JPd3JMUnZjUU9tZmcvTDU0?=
 =?utf-8?B?YjMwUWsreEs1WEJseVpNMjk3UWoyWW5YTFR0d3lweEhZY1JGSTBKOGFtUFEr?=
 =?utf-8?B?Qk1MWEw0alBnTHJkcUFzOW9QdEx4b1NMTFFvT1JYblZiQUZoeHhLL2xsSTBl?=
 =?utf-8?B?SjY1THRIa0NFdmI4azdHeHh0R3RNSjZ1N0xMaEtETHduNmZURlkrSEhTcmJm?=
 =?utf-8?B?UVBhVUVGTzFFRTdGaUJ3Z0RuRkhGK2kzR01jODhaNGhsVnc1M2NCTytPMlNB?=
 =?utf-8?B?WHNaQTE2WStqUTkrMURGK2UrZXZBbDFRNnJtUFpwY2tVVUVUdlJRakFuN0ZL?=
 =?utf-8?B?aUVwRTBPeUl3TlMrQ0lDSXZqTHl0Q1lvU3VScVgxVmlOTy9YbmVxd2E4ZW1T?=
 =?utf-8?B?YUtoQUUvaEhWOUpxWHp0MHBINm1CVWgzeXRkdXl6QjNrdDdMTFZJWVlDY1Jm?=
 =?utf-8?B?THpxWXJ4VzliN3FQem9jU21rdDNEd05mSHhycTduNU5hZnowMEVuUDhTUjJ3?=
 =?utf-8?B?UWlRSHYzM1B2VERoNWpVaG1scGRxTWx1b25JT1crS3lhL2tCNFBHdW1Ic3lU?=
 =?utf-8?B?cU9oN1loZzNSK0FtM3JZWmN0M2xBVXRKaHJwTyt5c0VEcDR4N21xeDN0YlM1?=
 =?utf-8?B?dnJ4MU5ucmRreGlBbzdFOTBKOEYxRVgwdThLVjAyUElocTVBbkNvSCtpWVVB?=
 =?utf-8?B?Tzl4eFN5dzFjZFo0SmZ6VlJuTFBhOUhCTi8rUTgzaG9wN0pxVXloMGZ2K1ND?=
 =?utf-8?B?aDFBakVtNHVxSHlkdVlnMGhiMXJPRXJEZmxSM1E3Y1krRm1LQ3UvRllkQkZR?=
 =?utf-8?B?WXc5WHh3UWpzS2tsNG94VFM2WnBKTGVycVAycy9ITTNCdVdnRlhTcEJyc3RX?=
 =?utf-8?B?a3JES1ZJR3U0em5mOVJkSmFkS01VUUUxWkJIS3h2N3RCM2J6a2ZHbWhyOWRy?=
 =?utf-8?B?U0JiMHlsZFVRci9zK01RL2FKbnVZOXJhYXRZM0U2Z2U5SjF2bzg2RWlNc3NN?=
 =?utf-8?B?MzFLclRMS1NFYVp3NGZ6UXUwb1BKZ0FLTjM2Q200Z2M2OHh3WVg5OGJSazQ3?=
 =?utf-8?B?SkhtTldHQWRPVUlsajBsNTBMY2ltTUk5eXlyQkM2OVExbXRrRU0xQjJqQW1Z?=
 =?utf-8?B?T0krZ1IzZk9rYStjTUlDZHlZd1p3UHhCY2VDdkVpOFF1NUowSkgxVHA4K1NK?=
 =?utf-8?Q?+ylGvgaY7cHnkOJ8id8vHRA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8815.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6419a394-17c1-4aec-3131-08d9be7ff648
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 21:31:45.0979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTzUXdQ89WK5iWarb4G8kCgnSL0iMqZz9wCRbZiooC5mLwxfQlch3LFc9cFVZ1U7gMrH0Ud7Utbpv8MiaLla5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6419
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGFwcHkgaG9saWRheXMgdG8geW91IGFzIHdlbGwhIQ0KDQpTdXJlIC0gd291bGQgeW91IHByZWZl
ciBhIHBhdGNoIG9yIGEgZnJlc2ggY29weSBvZiB0aGUgZmlsZXM/DQoNClRheWxvcg0KDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTMs
IDIwMjEgMzowNCBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29t
Pg0KPiBDYzogcWVtdS1kZXZlbCA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJqZWN0OiB1
cGRhdGUgaGV4YWdvbiBmbG9hdCByZWYgZmlsZXMNCj4gDQo+IEhhcHB5IGhvbGlkYXlzLCBUYXls
b3IsDQo+IA0KPiBJJ3ZlIGxvY2F0ZWQgYSBidWcgaW4gdGVzdHMvbXVsdGlhcmNoL2Zsb2F0Xyos
IHdoaWNoIG1lYW5zIHRoYXQgdGhlIGhleGFnb24NCj4gKi5yZWYgZmlsZXMgYXJlIG91dCBvZiBk
YXRlLg0KPiANCj4gQXQgeW91ciBjb252ZW5pZW5jZSwgd291bGQgeW91IHBsZWFzZSBjaGVjayBv
dXQNCj4gDQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ydGg3NjgwL3FlbXUvLS9jb21taXRzL2ZpeC1z
ZnAtdGVzdA0KPiANCj4gYW5kIHJlLWdlbmVyYXRlIHRoZSBmaWxlcyBmb3IgbWU/ICBJJ2xsIHNx
dWFzaCB0aGUgZGlmZiBpbnRvIG15IHBhdGNoIGZvcg0KPiBiaXNlY3Rpb24uDQo+IA0KPiANCj4g
cn4NCg==

