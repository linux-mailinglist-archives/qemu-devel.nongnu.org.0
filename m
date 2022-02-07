Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF9E4AB8B7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:31:32 +0100 (CET)
Received: from localhost ([::1]:57136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1Ix-0001wQ-Ly
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:31:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nH0t7-0000tt-Ab
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:04:56 -0500
Received: from mail-mw2nam12on2081.outbound.protection.outlook.com
 ([40.107.244.81]:41537 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nH0sb-0003dF-36
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 05:04:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckNSJHtlxZjXQH2c7zCw6y3PywOnjo8lXUW49VJl3i9pEr3ofCu2EE2m+LbNnSD7gaN70kHbSnn6lCKaK+w+cIFBjbBcgCfucXcFOQ6rmJvSjvUnnhKDxU7V2UOUG7WImHAhZ4HhEcMguxPor4cG+dw4SUJYJkqkv1rNTqi2zie7k/bhnKXKeX7g6fViaka0wP+haD4/RYJo9VoS0QBDgmny1V40EHwopimmH4CMOJkDCY5Efx+QaMaUJacKeKPK26lw59n8TWBjt54sZ+zPbS5/RivyLD3IpITW1jRFf29I71g5llJwZDxYi5uPhm3kdFd1PSpMgbr+2fm8oK5EYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/vKZoAUsf958mFfzR2F6cXvA7ahSDm8UyNZOb6QI74=;
 b=QEq/TkftARWVz9bZbaq4BOBJnhd7Qag+kuamTlcEvX9rZFEm6rQ5gYnUPqXZrQ7ZoFuiXIYiXZMo+30lgYDI4ap3CSHvy1flftBkbD6sskyw2MWDxICt4c9VaMcyiViY7Qu7yH1FYPyv1XxwVn2/wRxBCqg+rTQv41sxftBRnzfUmCDw55U7Ep0pGxmhXDA7dfOUmeiC3OAq9Qml6ScIhI0Nzvf4MWSBghYbW+Ak4LdeBGt576Bt7KWULrrfxcRaCn2nb8+/5qzvhvwZUtJvIruShtEM5dQYeYwRP6duC/v3dSCvT7+cRMyxdyKj9NpSsbADGQuaUDHmR3JeJQ1duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/vKZoAUsf958mFfzR2F6cXvA7ahSDm8UyNZOb6QI74=;
 b=Q4fbdxOTcua30wqKvax/3fowp75krHTIdxNOn/F2FszWMmizmXuI2z7kyRHXm0oP3zwR5OmjG2a4R06ZHqSxI2fPxLxsaZQSV9SDnnkThWy+nNdY9+h/PBhX+e9wDmYlfqqxuY/VEAb213vXVxZ9NAZcOHa0WBcmpdFVXYcayfo=
Received: from BY5PR02MB6980.namprd02.prod.outlook.com (2603:10b6:a03:235::19)
 by SN6PR02MB4096.namprd02.prod.outlook.com (2603:10b6:805:2b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 09:43:52 +0000
Received: from BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::3152:6e16:1101:79bb]) by BY5PR02MB6980.namprd02.prod.outlook.com
 ([fe80::3152:6e16:1101:79bb%9]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 09:43:52 +0000
From: Gautam Dawar <gdawar@xilinx.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [RFC PATCH] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Thread-Topic: [RFC PATCH] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Thread-Index: AQHYGqoJ7j+qifPrNkibnSJ4G2KWd6yHbsoAgABn/kA=
Date: Mon, 7 Feb 2022 09:43:52 +0000
Message-ID: <BY5PR02MB69803E6DE0505F63E596F133B12C9@BY5PR02MB6980.namprd02.prod.outlook.com>
References: <20220205160349.712-1-gdawar@xilinx.com>
 <CACGkMEsG09WvptG_MuxKQyzZrFeZS8EBbXba+Gf7z+C9VDFROA@mail.gmail.com>
In-Reply-To: <CACGkMEsG09WvptG_MuxKQyzZrFeZS8EBbXba+Gf7z+C9VDFROA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57954722-b74d-4554-eee4-08d9ea1e59bf
x-ms-traffictypediagnostic: SN6PR02MB4096:EE_
x-microsoft-antispam-prvs: <SN6PR02MB4096ABBDD3DED0A732E7AEA3B12C9@SN6PR02MB4096.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pDLjjBiIiZHZwY0/8+DxjcVlVontBTp1Tlu6RSvZo74JuiyAyHrx3Q9tZwfaZvAbnH4N485iJOpBgoQ3vKzWEMfc1RYA+TFaUw30LzPZjUsHuKJlopekhISayHlioa1yOh4Yw3oq8Qu4DUmJUyINDBE3wxPtVZmSLA/U8BKbzQprYBAEtkFXCKgQixSzVEdtzUdTCppsj0Z+wnQkBBeHv1N0PinEbKELrjejUkVGwCT9i6M5ltyFL2/fMEYwZUzzd1Q6nesOdYfx6FxeH/+TaSNhfnSfXjxl2NYy9/XhR8Zyr1bVrsi45s/I2JCWw+smJMRzMCXUERxCg+FXX8qugeoxtvR7TYIW5INf3dpUIS8f5kEHaSYo4VYy3NQymk/a5nnOCYnIARrCc1nzs4bw0d69YhhrHncWRwnjKN0GvmRN34iJAe/80F2ybXqRxTaiVIiMHvPLTeBHFOhx7kKGWVCmnRXdgYE1/Ht44NouTJKVWoepPlxmqIZ/wySIHBgL9acO2HMfOIr8QVSaxFK5kCp2pWXo+hpwfdmGBvV62tnfnDD2obLjv6CCbBE3LbdsMhVQA2QFJ2RVeaZXfhjcbqhJOcaLvGoPDyx/7O38W4yHQ7z0JS1kHYOFmAoz3eDe2+OvmXm4Dwsb1KTCz0F1Pp6QHSggDS/eW3DY8yAG9+l8cXStZdw9B3eXn+gNFBz1pIqxC4f2HFXFLENYoUPxjluJZNR1BYvCnupPDueG9WVCapyneKajm6fvyDoNW1UJ8IqWhvJifsLkvUONpYYSJAjwJwVklLT7JSE6/tNkvHc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6980.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(71200400001)(107886003)(9686003)(53546011)(186003)(122000001)(7696005)(6506007)(2906002)(33656002)(83380400001)(26005)(5660300002)(86362001)(6916009)(8936002)(64756008)(66446008)(66476007)(8676002)(66556008)(66946007)(4326008)(76116006)(54906003)(38100700002)(38070700005)(52536014)(316002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TW0zNHJOTkwxOEVuWnZVLzlaMVZwdWhDcC9RNkpRVWxTcGVYQmg1WXNvK3Nh?=
 =?utf-8?B?cS9Gd2pTME9mVnNsWURvSC9uKzYzd3VKb2VJM3VOZnZTeXZkRm5Iem5nd0RY?=
 =?utf-8?B?SlhrZlpHeEZTMjBUaHZWTjZOSVVEN2UzbFBMUDF3eUNXdDVvY3JncHpVM3Zr?=
 =?utf-8?B?dWpnRngxMkI1Y1V6MC9PUit4Ykp2djNHZlF2b0hBS3kvdzRkcTd5QThUNkdn?=
 =?utf-8?B?SWp1RTdGZ3I0ZWlEV2QxbjhPSW5zYTA1UElwWEg4Z1FFb0dHN2xuTmlaMWtK?=
 =?utf-8?B?Qjg4amU2M0V1b0xsdmlUeDBvUmt0K3B3M2xnNzJCSXV0b0tOTzd1TzYzaWdF?=
 =?utf-8?B?cWtJbzVBNFBRd003RjZOUEwvdkw2UHVmOEpFZ3FvRlVmNTFMenlLS0VleG10?=
 =?utf-8?B?WXovZWZ0WlV5cm5VVGNIeWdJVEl2QSsvakxLRzVJTng4ZWhja3lmQUdQRk9R?=
 =?utf-8?B?QTEvOGt6RkFYdGVGeldiS3Ribk44VU42RFU4MklZOEFNTWlZbHI2R3VxN0pi?=
 =?utf-8?B?NWVPYkJ4MXFyckpqRUVRY2hNU3NJSmhoTmcrVFNRMURmWG5vb0U4ZGFUZkVo?=
 =?utf-8?B?R3lFZ1M2NmNVYnJLTzRMYnRjYjZpNElqU1dTc1htNHk0aW9tSVIzRm13WEZD?=
 =?utf-8?B?Y21ublo3aU5kaUtkZ0MyN0xIRmVhQTkwV0Y2THJQZWZ5WkxLYTFHME4wWE9O?=
 =?utf-8?B?UTdhMXFrNTByUHZNWDl6bDBFOWU3cmtZOXM2Q2I4ZGI1akRRKzFTbFZTbVNl?=
 =?utf-8?B?RUdNMEozZ3QxWG4ybWtsRTU4MDgrNXg1L0ErV0dvQXg3VGloV1JyYnU5Y3dm?=
 =?utf-8?B?V2crcUtGZEJBR1Y0Y2tIcU1JQjljYllLV01NeXkwV2p4VE5NbC9lWS9tVXlk?=
 =?utf-8?B?UEhucDA2dkxZZ2lOUjlUTit1UlB0cCtYRGFRbXJHcEk3TGIwQ3Y0NTR2R3RO?=
 =?utf-8?B?OEFaZTh5YWk0Z2VacmRMaENTTFY5RUZ6Mng5aGNnK0ZVZGo5bmZIcVpsWktX?=
 =?utf-8?B?bzFtSUxRMnFhRms1bUI4SW1FM0JnenM2TnVwbjBWaUcrUW5KMEtlUUhFM2x0?=
 =?utf-8?B?aWxPR2RwY2J5c1VFbTYzRWJyendEMjdUdUs2dVhOYTFlbndRL09Pck0yQm5B?=
 =?utf-8?B?VUlxS3N3RWlvTjdnMlFKUjRwTnplTC9CREcvb29Ta2gxTCs2cFZkS28wU045?=
 =?utf-8?B?bUZ1NmFnYjA0dFlHVnRvSDJ3M24wb25zOVNMdE9PWjlkRis4UjBZdXZyckdy?=
 =?utf-8?B?SVRwQmRiREtyc1dtM2FLSGJ4RjY1amNScUh0akUyZndWWnVFVnQ2TnoyeUlP?=
 =?utf-8?B?UUFKQkZXVXl2amc4MTRpZW5nSFdpdDF6VVRFUlREcWpiNTBXUWM3SDJYVklR?=
 =?utf-8?B?RlltaVh1dXBJSmwycGh5QW80VWlGdmtnd0E2Y09GVTVLT2RKRXQ1cGZWTzVx?=
 =?utf-8?B?UFF3LzRYRlBzWkpWTGswM082Z0krZWx6blNseHo5YkV5L2phTXhMM2JqUHM1?=
 =?utf-8?B?MTE3L2x0ZW9xeDUyQmd3RVZYclFJVk8rVEo3UWZHMXpSNGtVZ2lUSmhjUjhh?=
 =?utf-8?B?d1lFZzZKMVJmNDhhSFNhZjh4Ui9wVHNBdk5wRHNObzArVm40TFVBMVNHT1Az?=
 =?utf-8?B?eFJ2bGFuSGR6UVFPcnA2RTBhYlhxOFlWNG51dDZnSXN4Q1JOeU1QLysybHlR?=
 =?utf-8?B?VjJaL1JNdThCMHQwUGltSGo0dGlOZEtnUXZSU2xqWGZzVFVJVE9vWTROcTZC?=
 =?utf-8?B?SUczbFFnbE55cjRyZ0NrYWhoWEgrVDhWQzJsci81M2U4V0E2YytIZ1ZhRzZX?=
 =?utf-8?B?Ymxxa0F3QVFFM3I0Rmx1OUVtQjNXWENXd2t6dVRrQ3JFd1hGOHZWVVVXQnJa?=
 =?utf-8?B?THVOWVk3WW5yT3hpQnlnVzZ0clJpUHlCa045T3BwMXJzQWNKY05oRFIvZCtV?=
 =?utf-8?B?TmdsNlBHTHhIUUkvdFVJUVhEcG5WS1djdUpQZVhaN1k2N3o0dnl0OTlQdEQ0?=
 =?utf-8?B?TFQwNlVhNE1FTkZtalRUYVJSZFpORGw3NGd2QUtzM3ZnZldVcnQ3L3dKRGk0?=
 =?utf-8?B?U0xzdGp1U05wNFBnSHlYN1NpeW9DeGgvNnVGaEhiMFM4bDMvd1ZwRkp0WlNt?=
 =?utf-8?B?RDlScXhoZU9sU1IxWXhpOXljV3EybDBuTHhxZFp3NUJXQWl3ZU1BY1lJL1U2?=
 =?utf-8?Q?M/CevfhjvSpQCsmqjHetgJk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6980.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57954722-b74d-4554-eee4-08d9ea1e59bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 09:43:52.4524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGHzNuB6oT+TSnf58ufrRJZyWzH9nQA+M6pSzhc2ZfHFdpcAvtiAK74eIOr4yc0b1/ENaeeCXX+6oujgEfMrNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4096
Received-SPF: pass client-ip=40.107.244.81; envelope-from=gdawar@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 eperezma <eperezma@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Tanuj Murlidhar Kamde <tanujk@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgSmFzb24sDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gUGxzIHNlZSBteSBjb21tZW50
cyBpbmxpbmUuDQoNClJlZ2FyZHMsDQpHYXV0YW0NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IA0KU2VudDogTW9uZGF5
LCBGZWJydWFyeSA3LCAyMDIyIDg6NTMgQU0NClRvOiBHYXV0YW0gRGF3YXIgPGdkYXdhckB4aWxp
bnguY29tPg0KQ2M6IG1zdCA8bXN0QHJlZGhhdC5jb20+OyBxZW11LWRldmVsIDxxZW11LWRldmVs
QG5vbmdudS5vcmc+OyBlcGVyZXptYSA8ZXBlcmV6bWFAcmVkaGF0LmNvbT47IEdhdXRhbSBEYXdh
ciA8Z2Rhd2FyQHhpbGlueC5jb20+OyBNYXJ0aW4gUGV0cnVzIEh1YmVydHVzIEhhYmV0cyA8bWFy
dGluaEB4aWxpbnguY29tPjsgSGFycHJlZXQgU2luZ2ggQW5hbmQgPGhhbmFuZEB4aWxpbnguY29t
PjsgVGFudWogTXVybGlkaGFyIEthbWRlIDx0YW51amtAeGlsaW54LmNvbT4NClN1YmplY3Q6IFJl
OiBbUkZDIFBBVENIXSBBbGxvdyBWSVJUSU9fRl9JTl9PUkRFUiB0byBiZSBuZWdvdGlhdGVkIGZv
ciB2ZHBhIGRldmljZXMNCg0KT24gU3VuLCBGZWIgNiwgMjAyMiBhdCAxMjowNCBBTSA8Z2F1dGFt
LmRhd2FyQHhpbGlueC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBHYXV0YW0gRGF3YXIgPGdkYXdh
ckB4aWxpbnguY29tPg0KPg0KPiBIaSBBbGwsDQo+DQo+IFRoZSBWSVJUSU9fRl9JTl9PUkRFUiBm
ZWF0dXJlIGlzIGltcGxlbWVudGVkIGJ5IERQREsncyB2aXJ0aW9fbmV0IA0KPiBkcml2ZXIgYnV0
IG5vdCBieSB0aGUgTGludXgga2VybmVsJ3MgdmlydGlvX25ldCBkcml2ZXIuDQo+IEhvd2V2ZXIs
IHRoaXMgZmVhdHVyZSBzdGlsbCBjYW4ndCBiZSB0ZXN0ZWQgdXNpbmcgdmhvc3QtdmRwYSB3aXRo
IA0KPiBoYXJkd2FyZSBkZXZpY2VzIHRoYXQgaW1wbGVtZW50IGl0IGFzIFZJUlRJT19GX0lOX09S
REVSIGlzbid0IGRlZmluZWQgDQo+IGluIGtlcm5lbCdzIHZpcnRpb19jb25maWcuaCBoZWFkZXIg
ZmlsZS4NCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBhYmlsaXR5IHRvIG5lZ290aWF0ZSBWSVJUSU9f
Rl9JTl9PUkRFUiBiaXQgZm9yIA0KPiB2aG9zdC12ZHBhIGJhY2tlbmQgd2hlbiB0aGUgdW5kZXJs
eWluZyBkZXZpY2Ugc3VwcG9ydHMgdGhpcyBmZWF0dXJlLg0KPiBUaGlzIHdvdWxkIGJlIHVzZWZ1
bCBmb3IgYmVuY2htYXJraW5nIHRoZSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudHMgZm9yIA0KPiBI
VyBkZXZpY2VzIHRoYXQgaW1wbGVtZW50IHRoaXMgZmVhdHVyZS4gQXQgdGhlIHNhbWUgdGltZSwg
aXQgc2hvdWxkbid0IA0KPiBoYXZlIGFueSBuZWdhdGl2ZSBpbXBhY3QgYXMgdmhvc3QtdmRwYSBi
YWNrZW5kIGRvZXNuJ3QgaW52b2x2ZSBhbnkgDQo+IHVzZXJzcGFjZSB2aXJ0cXVldWUgb3BlcmF0
aW9ucy4NCj4gSW4gdGhlIGZpbmFsIHBhdGNoLCBpbnN0ZWFkIG9mIG1ha2luZyBhIGRpcmVjdCBj
aGFuZ2UgaW4gDQo+IHZpcnRpb19jb25maWcuaCwgaXQgd2lsbCBiZSBwdXNoZWQgaW4gdGhlIGtl
cm5lbCBhbmQgdGhlbiBRRU1VJ3MgZmlsZSANCj4gd2lsbCBiZSBzeW5jZWQgd2l0aCBpdCwgYXMg
dXN1YWwuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEdhdXRhbSBEYXdhciA8Z2Rhd2FyQHhpbGlueC5j
b20+DQo+IC0tLQ0KPiAgaHcvbmV0L3ZpcnRpby1uZXQuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDEwICsrKysrKysrKysNCj4gIGluY2x1ZGUvc3RhbmRhcmQtaGVhZGVycy9saW51eC92
aXJ0aW9fY29uZmlnLmggfCAgNiArKysrKysNCj4gIG5ldC92aG9zdC12ZHBhLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2h3L25ldC92aXJ0aW8tbmV0LmMgYi9ody9uZXQv
dmlydGlvLW5ldC5jIGluZGV4IA0KPiBjZjhhYjBmOGFmLi5hMTA4OWQwNmY2IDEwMDY0NA0KPiAt
LS0gYS9ody9uZXQvdmlydGlvLW5ldC5jDQo+ICsrKyBiL2h3L25ldC92aXJ0aW8tbmV0LmMNCj4g
QEAgLTM1MDcsMTEgKzM1MDcsMjEgQEAgc3RhdGljIHZvaWQgdmlydGlvX25ldF9kZXZpY2VfcmVh
bGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApDQo+ICAgICAgbmMtPnJ4ZmlsdGVy
X25vdGlmeV9lbmFibGVkID0gMTsNCj4NCj4gICAgIGlmIChuYy0+cGVlciAmJiBuYy0+cGVlci0+
aW5mby0+dHlwZSA9PSANCj4gTkVUX0NMSUVOVF9EUklWRVJfVkhPU1RfVkRQQSkgew0KPiArICAg
ICAgICB1aW50NjRfdCBmZWF0dXJlcyA9IEJJVF9VTEwoVklSVElPX0ZfSU5fT1JERVIpOw0KPiAg
ICAgICAgICBzdHJ1Y3QgdmlydGlvX25ldF9jb25maWcgbmV0Y2ZnID0ge307DQo+ICsNCj4gICAg
ICAgICAgbWVtY3B5KCZuZXRjZmcubWFjLCAmbi0+bmljX2NvbmYubWFjYWRkciwgRVRIX0FMRU4p
Ow0KPiAgICAgICAgICB2aG9zdF9uZXRfc2V0X2NvbmZpZyhnZXRfdmhvc3RfbmV0KG5jLT5wZWVy
KSwNCj4gICAgICAgICAgICAgICh1aW50OF90ICopJm5ldGNmZywgMCwgRVRIX0FMRU4sIA0KPiBW
SE9TVF9TRVRfQ09ORklHX1RZUEVfTUFTVEVSKTsNCj4gKw0KPiArICAgICAgIC8qDQo+ICsgICAg
ICAgICAqIEZvciB2aG9zdC12ZHBhLCBpZiB1bmRlcmx5aW5nIGRldmljZSBzdXBwb3J0cyBJTl9P
UkRFUiBmZWF0dXJlLA0KPiArICAgICAgICAgKiBtYWtlIGl0IGF2YWlsYWJsZSBmb3IgbmVnb3Rp
YXRpb24uDQo+ICsgICAgICAgICAqLw0KPiArICAgICAgIGZlYXR1cmVzID0gdmhvc3RfbmV0X2dl
dF9mZWF0dXJlcyhnZXRfdmhvc3RfbmV0KG5jLT5wZWVyKSwgZmVhdHVyZXMpOw0KPiArICAgICAg
IG4tPmhvc3RfZmVhdHVyZXMgfD0gZmVhdHVyZXM7DQoNCkkgd29uZGVyLCBpbnN0ZWFkIG9mIGRv
aW5nIGhhY2tzIGhlcmUsIGl0IHdvdWxkIGJlIGJldHRlciB0byBpbXBsZW1lbnQgSU5fT1JERVIg
aW4gcWVtdT8NCltHRD4+XSBZZXMsIEkgYWdyZWUgYSBjb21wbGV0ZSBzb2x1dGlvbiB0aGF0IHdp
bGwgc3VwcG9ydCB0aGUgZW11bGF0ZWQgdmlydGlvIGRldmljZSB3aXRoIGluX29yZGVyIHJ4L3R4
IHZpcnRxdWV1ZSBmdW5jdGlvbnMgd2lsbCBkZWZpbml0ZWx5IGJlIGJldHRlciBidXQgYXQgdGhl
IHNhbWUgdGltZSBpdCB3aWxsIHRha2UgY29uc2lkZXJhYmxlIGFtb3VudCBvZiB0aW1lIGFuZCBl
ZmZvcnQuIEkgYWxzbyBub3RpY2VkIHRoYXQgc29tZXRoaW5nIHNpbWlsYXIgKGh0dHBzOi8vcGF0
Y2hldy5vcmcvUUVNVS8xNTMzODMzNjc3LTI3NTEyLTEtZ2l0LXNlbmQtZW1haWwtaS5tYXhpbWV0
c0BzYW1zdW5nLmNvbS8pICB3YXMgcHJvcG9zZWQgeWVhcnMgYWdvIHdoaWNoIGdvdCBkcm9wcGVk
IGZvciBzaW1pbGFyIHJlYXNvbnMgYW5kIGl0IGhhcyBiZWVuIHN0YXR1cyBxdW8gc2luY2UgdGhl
bi4NClNvLCBpZiB5b3UgZG9u4oCZdCBzZWUgYW55IHNpZGUtZWZmZWN0cyBvZiB0aGlzIHBhdGNo
LCB3ZSBjYW4gZ2V0IGl0IGludGVncmF0ZWQgZmlyc3QgYW5kIHRoZW4gc29tZW9uZSBjYW4gd29y
ayBvbiB0aGUgY29tcGxldGUgc29sdXRpb24uIFRoaXMgd291bGQgaGVscCBpbiBiZW5jaG1hcmtp
bmcgcGVyZm9ybWFuY2UgYm9vc3RzIGFjaGlldmVkIHdpdGggSU5fT1JERVIgZmVhdHVyZS4NCg0K
Tm90ZSB0aGF0IERQREsgaGFzIGFscmVhZHkgc3VwcG9ydGVkIElOX09SREVSLCBzbyB3ZSBkb24n
dCBldmVuIG5lZWQgdG8gdG91Y2gga2VybmVsIHZpcnRpbyBkcml2ZXJzIHRvIHRlc3QgaXQuDQoN
Cj4gICAgICB9DQo+ICsNCj4gICAgICBRVEFJTFFfSU5JVCgmbi0+cnNjX2NoYWlucyk7DQo+ICAg
ICAgbi0+cWRldiA9IGRldjsNCj4NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3RhbmRhcmQtaGVh
ZGVycy9saW51eC92aXJ0aW9fY29uZmlnLmggDQo+IGIvaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJz
L2xpbnV4L3ZpcnRpb19jb25maWcuaA0KPiBpbmRleCAyMmUzYTg1ZjY3Li45ZWMzYThiNTRiIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL3N0YW5kYXJkLWhlYWRlcnMvbGludXgvdmlydGlvX2NvbmZp
Zy5oDQo+ICsrKyBiL2luY2x1ZGUvc3RhbmRhcmQtaGVhZGVycy9saW51eC92aXJ0aW9fY29uZmln
LmgNCj4gQEAgLTgwLDYgKzgwLDEyIEBADQo+ICAvKiBUaGlzIGZlYXR1cmUgaW5kaWNhdGVzIHN1
cHBvcnQgZm9yIHRoZSBwYWNrZWQgdmlydHF1ZXVlIGxheW91dC4gKi8NCj4gICNkZWZpbmUgVklS
VElPX0ZfUklOR19QQUNLRUQgICAgICAgICAgIDM0DQo+DQo+ICsvKg0KPiArICogSW5vcmRlciBm
ZWF0dXJlIGluZGljYXRlcyB0aGF0IGFsbCBidWZmZXJzIGFyZSB1c2VkIGJ5IHRoZSBkZXZpY2UN
Cj4gKyAqIGluIHRoZSBzYW1lIG9yZGVyIGluIHdoaWNoIHRoZXkgaGF2ZSBiZWVuIG1hZGUgYXZh
aWxhYmxlLg0KPiArICovDQo+ICsjZGVmaW5lIFZJUlRJT19GX0lOX09SREVSIDM1DQoNClRoaXMg
bmVlZCB0byBiZSBkb25lIGluIHRoZSBmb2xsb3dpbmcgc3RlcHM6DQoNCjEpIGEga2VybmVsIHBh
dGNoIHRvIGp1c3QgYWRkIHRoaXMgZmVhdHVyZSBiaXQNCjIpIHN5bmMgdGhlIGtlcm5lbCBoZWFk
ZXIgdXNpbmcgc2NyaXB0cy91cGRhdGUtbGludXgtaGVhZGVycy5zaA0KW0dEPj5dIFllcywgSSBh
Y2tub3dsZWRnZWQgdGhhdCBpbiBteSBwYXRjaCB3aXRoIHRoZSBmb2xsb3dpbmcgY29tbWVudDoN
Cj4gSW4gdGhlIGZpbmFsIHBhdGNoLCBpbnN0ZWFkIG9mIG1ha2luZyBhIGRpcmVjdCBjaGFuZ2Ug
aW4gDQo+IHZpcnRpb19jb25maWcuaCwgaXQgd2lsbCBiZSBwdXNoZWQgaW4gdGhlIGtlcm5lbCBh
bmQgdGhlbiBRRU1VJ3MgZmlsZSANCj4gd2lsbCBiZSBzeW5jZWQgd2l0aCBpdCwgYXMgdXN1YWwu
DQoNCj4gKw0KPiAgLyoNCj4gICAqIFRoaXMgZmVhdHVyZSBpbmRpY2F0ZXMgdGhhdCBtZW1vcnkg
YWNjZXNzZXMgYnkgdGhlIGRyaXZlciBhbmQgdGhlDQo+ICAgKiBkZXZpY2UgYXJlIG9yZGVyZWQg
aW4gYSB3YXkgZGVzY3JpYmVkIGJ5IHRoZSBwbGF0Zm9ybS4NCj4gZGlmZiAtLWdpdCBhL25ldC92
aG9zdC12ZHBhLmMgYi9uZXQvdmhvc3QtdmRwYS5jIGluZGV4IA0KPiAyNWRkNmRkOTc1Li4yODg2
Y2JhNWVjIDEwMDY0NA0KPiAtLS0gYS9uZXQvdmhvc3QtdmRwYS5jDQo+ICsrKyBiL25ldC92aG9z
dC12ZHBhLmMNCj4gQEAgLTYyLDYgKzYyLDcgQEAgY29uc3QgaW50IHZkcGFfZmVhdHVyZV9iaXRz
W10gPSB7DQo+ICAgICAgVklSVElPX05FVF9GX0NUUkxfVlEsDQo+ICAgICAgVklSVElPX0ZfSU9N
TVVfUExBVEZPUk0sDQo+ICAgICAgVklSVElPX0ZfUklOR19QQUNLRUQsDQo+ICsgICAgVklSVElP
X0ZfSU5fT1JERVIsDQo+ICAgICAgVklSVElPX05FVF9GX1JTUywNCj4gICAgICBWSVJUSU9fTkVU
X0ZfSEFTSF9SRVBPUlQsDQo+ICAgICAgVklSVElPX05FVF9GX0dVRVNUX0FOTk9VTkNFLA0KDQpU
aGlzIG5lZWRzIHRvIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZWQgcGF0Y2guDQpbR0Q+Pl0gWWVzLCBJ
IGNhbiBkbyB0aGF0IGJ1dCBpdCB3b3VsZCBoZWxwIG15IHVuZGVyc3RhbmRpbmcgaWYgeW91IGNh
biBzaGFyZSByZWFzb25zIGZvciB0aGUgc2FtZS4NCg0KVGhhbmtzDQoNCj4gLS0NCj4gMi4zMC4x
DQo+DQoNCg==

