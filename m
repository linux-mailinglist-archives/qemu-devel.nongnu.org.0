Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBFA545557
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:11:39 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOVF-0004vA-9M
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7159535c0b=pdel@fb.com>)
 id 1nzOQH-0002Pd-1G; Thu, 09 Jun 2022 16:06:29 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:25336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7159535c0b=pdel@fb.com>)
 id 1nzOQ9-0004fC-5F; Thu, 09 Jun 2022 16:06:25 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259FPZaw017724;
 Thu, 9 Jun 2022 13:06:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Gmqy8gQ4qaJJOVC614ll9Q6bNBz2KYnd8AHgPZw63nM=;
 b=R4GmMOSPkExCQ6PDUg54YU3KO/8TG9WlYjnQxC1uJ8NX95vt0Tacv66bfnSWa1E2EGoA
 j15xRjOFXU8lA6uIFtJ/cmNiBH5WnmokMhXa+eDI2kusXsblYJH68zMbiTu6ru2uMLzm
 eEzwVyJTDwUZ62ajfev8qgDKdBL5kcvARzQ= 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gjaduyts2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 13:06:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G61G1/1zXqEKAKweJqapD7PxkSXvpL0P0hJxM0iH1Rj9bAv8EwMlqzKKNaMLtpQIBY/ZYU4Nj99pyVMmc5Yu8m0ujQ9zYoA8G1SaAjVSWDHl2MyJKso5hXFBXjxVMB4EBKdLuidnWm1nY3G7Tws4i38C5GvW99kkG5NQfGiyB+w4D47GGTlyJMz8+wqzExxdRuEkJWWrVkuMjISWyz2tcX+E0m+svJw+y+yLnhSDCxpmsluSYxXEkIRRTG3yNpZfqNwHx6yJmrqQSHDCA8ViSp/B+e5gM7wtscnw/A/Qi6s0ezhlOOg2BWLnb8JoA1Lq5ntBcoq2p6i5XNzxd966hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gmqy8gQ4qaJJOVC614ll9Q6bNBz2KYnd8AHgPZw63nM=;
 b=POPhWEvEZX9s/1oETEx6GDJYaIquVp8NgY8CyyEu344Lhgp1t5TW9z3yiNupT5yLHBX5dr6pSAtswHxTRZd2cdOUaaOfjuESNgMEIMy8guchd6mua7077rpuDsGiMkBLV99L/N+6UqevMty0rjzeVpTliu80d/tOIx2jz5HF8u/gUx47xgu6l77PSvsOWsLeo7ee4zGf/EjZ4No88Ycf9QmkCgYRuYIUN1bjnc6XyZd+0qvn4xz6T4u0cKWHdTbRd79cLatU2ESI3t0fZysPsqkVwLH3nIdq5HqwlzHC7iHDJVfrfP2nZWOfEnCXmn6Fc9XVrrpMVoADjtwaZfzTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM6PR15MB2553.namprd15.prod.outlook.com (2603:10b6:5:1a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 20:06:00 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081%7]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 20:06:00 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Iris Chen <irischenlj@fb.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, "patrick@stwcx.xyz"
 <patrick@stwcx.xyz>, Alistair Francis <alistair@alistair23.me>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "hreitz@redhat.com"
 <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Iris Chen <irischenlj@gmail.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Thread-Topic: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Thread-Index: AQHYe67k9O5+v/KGDUWEqp8w0nH6W61HdQYAgAAMSIA=
Date: Thu, 9 Jun 2022 20:06:00 +0000
Message-ID: <810A50A3-E9C2-4A62-ADF9-89DCC9BBD9BB@fb.com>
References: <20220609031320.2212468-1-irischenlj@fb.com>
 <20220609192201.GC10629@fralle-msi>
In-Reply-To: <20220609192201.GC10629@fralle-msi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5a3b08a-a0d9-4e58-16f6-08da4a53794b
x-ms-traffictypediagnostic: DM6PR15MB2553:EE_
x-microsoft-antispam-prvs: <DM6PR15MB255335C43F3B28BEF17F6B5DACA79@DM6PR15MB2553.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dr1+6qjyVcKN+QbCEZ9rh61pnsvym047IfluIm2CRSHlOtrQBG7vLLlMRyuosvvDzSuR4lQDNCpd1TQOGWU3r6eyhVtOhGH5rINhUGDyeFArn0kZvEbI+AAvXJoV1a3iU4kM816v3oS1X84p4Yjb3vaXHz4FVlivikF7l2D/0U7e/J4GR+MBxI6aZwPSR61dd4Fri2sPde9DV+woHV4XsW8Covbc/yNNZ1ty77ZMpmnd4d3omZgB5WtoO3/vwFhjEqzuDGyhXEwVD5pKe/MxfjMM/O9LFg0mU+oy+d8czCy8ocIcJsBg6902hq8rt5O9t5EXGgMpJdTx5oJ5nW7O1lGpOaI57b5cqFErDhGPh8nHqOJhfioKo86Pfzx5WtSXM+tIX5i7x3UYT5/+DWnACY7VtQcKtuOrYVpYC6ZyCfG+IwRX5ZWuJ4jOIOfoRiokpSIBb1Zu+4cWfetfWhW7HWibrf9JhtSrfLj9gRf5TREUY7Uk5Uj9kl4kfAH4nkLvhgZB5GN+/RQorWHKiXEwBwRyilNCMyOipoLzV6MQalzZMf+DLuDiBoA46dPo3BCQKBH+buJlTNXlZ7mYCtrkEQfEWYDPwZD073TOlvUbjcnMFeLpWCOYUXMQrXUQfODU/szXXO0QQyHYVkFVeMWR4wZH9byCHHWkSiX/PO5ECHXAvIHMK7yiLp1X4CKP/lwmNvmie+97ARCr+y4JF6zJipb7tCAOGccxv+nA6z/uiGV8OQDBp9iqB2SNDocRgvSk2L4HHw8k6TGaf6WldXIlVQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(36756003)(186003)(109986005)(316002)(53546011)(6506007)(54906003)(2616005)(6512007)(508600001)(76116006)(122000001)(33656002)(7416002)(8676002)(5660300002)(2906002)(66556008)(4326008)(66446008)(66946007)(66476007)(38070700005)(71200400001)(83380400001)(8936002)(64756008)(6486002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2JwaFRaeFhVd0R2dnJ1b2ZGYVh5eEtTSWhzajNRL01uamM0Q1hWNnVhTUFF?=
 =?utf-8?B?eER2TTl6QmZUZWhRUXJWOFZVaUNzLzI0VU4yd3lEcEs1QXdFMWRkbFhQNExW?=
 =?utf-8?B?WlcvckxLOVl5UkVWdE9RNXJzZmt3NC9obm83NVdZa21iSS9aTW1QdTVSb1Fr?=
 =?utf-8?B?NnFDK29lMU03SERqNksvcjZBZXFZQXIrekhiS3AxQUZieDZjL0VRbW4yaEVP?=
 =?utf-8?B?RG90cVBYZ24zZWdMZUtEM3A4aXJ6Nm14aG1CNzJFdEFPK0Y3UlpnUUtRcmVM?=
 =?utf-8?B?ajlGdUM0YlJ4VVJBNWZxWjQ3MmhXa1pmNVRIckZEcTZ1K1RHdjNyaCtSOTg2?=
 =?utf-8?B?N2VERHhLbndaMmFLdTZwVTBMaW92N08xbEcrWlBHUHBDMjE4S3d1MkJwUU9m?=
 =?utf-8?B?WjhVZjNSMldIM2ZSM0FmVG1QSytZUVYxTXV3c21FZiszSDVidFQ1Z3puNk5l?=
 =?utf-8?B?RWxBSnRBdG43VDd6Z3JEaEJqQzNJVzVaRVdqUVdSdW1jbzM1bGliOEh3K1J6?=
 =?utf-8?B?ODdmRm1aaithS0svWU1hNlJKaThqTkxFZlYxNzJPdlhmYWJVM3VGRmxNc0dV?=
 =?utf-8?B?Ly9Ga0FSUVJnNXZpN2xWVFpOY1BSREU5TFN3dzNmOUU0SHNydEJXWnl2c0M0?=
 =?utf-8?B?eVg5a3NJM2RHSUJ1Kzh4S0I1RUZTNGptcVpTVmJuR2grVFpnQXVNb0g3OXAz?=
 =?utf-8?B?bnBnQm1hUUlidk5OdUZhcHJSbzVhQXpOaWJrYXl3SGxYVDl1Q1RBUkY5c3VF?=
 =?utf-8?B?R2ZJWEVTUDY1aHdCTkhZenQydXBzWkYvYk1JblBKdmRtRHRHb2hTY2dVQ0w1?=
 =?utf-8?B?WGJDb2RvZkltUHRsa1RIK09NVVlBc1prZVdEeGk5bVpFcTNScTExd05zMWtw?=
 =?utf-8?B?YlorT3EzRXd6N0hRSkx6RWRvY2hhWU1vNkMyRWlRTWdpWGRVa285WnBaODQ1?=
 =?utf-8?B?ZlJKQlRrY2Vid1BoQTNYWlh0R0JBekhrUGVpc3Y2Z1I1TU1SMWM4K3RoeFcy?=
 =?utf-8?B?QTdqZ0tRVGpoSTFEa2FmM203WVdZNXZxYm5ZU2l1Q0Q5MkxqNUJhcXV4MUsy?=
 =?utf-8?B?VWorSDV3THR3SitBYmJINUYzKzdVUlNnZzNrZk5ZY0JjNG9KNmJWLzFzYUpn?=
 =?utf-8?B?OE5xUEZGSnNLdkZBS0JIbURHVTJseTZsRGRFSFdQTEVTYjFhRzdUcVhadnpR?=
 =?utf-8?B?WjkrcWQrTVhieFR3a05wai85TVo4WERlR0crb3FSYjgrSXpDN2dFTVNaRytP?=
 =?utf-8?B?bTFZN21xWGpFR0Vpc0ZjNVpTV1BGbnhUdjNIdlNnaUY1bG90KytzMmlkS1Vs?=
 =?utf-8?B?UGpsdEo5RjJRTkpJdHdSeFFnMXpVckdRS0k4Sll5SVZrOEN6NXVzYkVhMXF4?=
 =?utf-8?B?SUhNRW1QUjZ0WitFSm9McTlRV3NYckRpbFh1YmFGdnQ5NXEwTnRObjBxN3JM?=
 =?utf-8?B?aE5vakRPSHZuVC9YVGczdVZyREJRYzBKaHJabzVsYUM2NDZ1bzBsMlZ1TkFW?=
 =?utf-8?B?VElhellDN2M3eWpZQ2lNTklESjIzSWNjMm1OeHpzdzBlZXBRVDhlRHFNUGF1?=
 =?utf-8?B?TkdMNkgzS2RtaFA1WnN5YkEvdXpwK3k1Q2ZnRy9zczl3UTBWaldNdkNYMUxo?=
 =?utf-8?B?M2dsZDBjaTRqMXljL2FMVHpoa3YrU3UwSlhxMWRYQWJGQzRTUnhWdWdmYlJv?=
 =?utf-8?B?bEduKzFhMnRBNS9qQjl5RGVRc3B5ZUdmWVF6eXJyWnlEVGlhYjZlZWN4ZTZy?=
 =?utf-8?B?NmtOOU5qTzdFSU5WdnpFUXFBeG9ZVGFxRmdmSkdFUzlTTkhhdXEwNmliNEdQ?=
 =?utf-8?B?Yk05blJVZ1VuUmVGd1hhcnlxUHRLeDhGbEdlQVVuTncyeC9OM3R4YXRKbE9q?=
 =?utf-8?B?M055emVkQVNKK2dFWVY5d3ZLMGNKWnc2Ymg3SU9icjVLdGloOXRBYmhWYXpN?=
 =?utf-8?B?amorNFYrY013U0ZZanM4WTl0VmwwNFc2eFFhTUp6VlFkb09yeFdDaEZLQnRa?=
 =?utf-8?B?cUFaT0NtN0VWRkduWWZpcE1UbnBkSGN6MTdGOStLdHplRkprQUdPbnZpbEg5?=
 =?utf-8?B?RnpKZDNudWcvbTZIU2oxWlV1OGZYMzlYa3E3Zms5dCtJUG9VaXdkU2VrTldQ?=
 =?utf-8?B?cXJNN2s3RGJFVldYUVkvMGc3UEllSkR0TnNLVHZjR2FQUEZnYTVWNlR1ZHpH?=
 =?utf-8?B?SkpyRnhIanhRVHJMcGQ1TmJtUjJUUVArdXZraVQrRjBhREQ1eXZuTm85N08x?=
 =?utf-8?B?NlJJQkhhZXEwcU9HY3lyVHpyMTd0REtSWmpqaklsdE5odE82NUMwOEdQOG1M?=
 =?utf-8?B?SVJ6elUrbytCOXRZbEpHR0NFenRVeDE5Ykg2b0tKcm0vWi9TRmRFaStHcXoy?=
 =?utf-8?Q?irThmXaOHAE9J4QQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51913723E6C44B47B0F01E8DAA8FD839@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a3b08a-a0d9-4e58-16f6-08da4a53794b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 20:06:00.3426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YjS7FFhmdm69mvKmIdkap4hF1HjFWtCfshQTPbYjl9Cgl0LcGD1GsUoP4cu0S2k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2553
X-Proofpoint-GUID: DDZqpf9l63QDoSXPNjWco13pBY7XNDAn
X-Proofpoint-ORIG-GUID: DDZqpf9l63QDoSXPNjWco13pBY7XNDAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_14,2022-06-09_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=7159535c0b=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVuIDksIDIwMjIsIGF0IDEyOjIyIFBNLCBGcmFuY2lzY28gSWdsZXNpYXMgPGZy
YXNzZS5pZ2xlc2lhc0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSGkgSXJpcywNCj4gDQo+IExv
b2tzIGdvb2Qgc29tZSwgYSBjb3VwbGUgb2YgY29tbWVudHMgYmVsb3cuDQo+IA0KPiBPbiBbMjAy
MiBKdW4gMDhdIFdlZCAyMDoxMzoxOSwgSXJpcyBDaGVuIHdyb3RlOg0KPj4gRnJvbTogSXJpcyBD
aGVuIDxpcmlzY2hlbmxqQGdtYWlsLmNvbT4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogSXJpcyBD
aGVuIDxpcmlzY2hlbmxqQGdtYWlsLmNvbT4NCj4+IC0tLQ0KPj4gQWRkcmVzc2VkIGFsbCBjb21t
ZW50cyBmcm9tIFYxLiBUaGUgYmlnZ2VzdCBjaGFuZ2U6IHJlbW92ZWQgb2JqZWN0X2NsYXNzX3By
b3BlcnR5X2FkZC4NCj4+IA0KPj4gaHcvYmxvY2svbTI1cDgwLmMgICAgICAgICAgICAgfCAzNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gdGVzdHMvcXRlc3QvYXNwZWVk
X3NtYy10ZXN0LmMgfCAgMiArKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCsp
DQo+PiANCj4+IGRpZmYgLS1naXQgYS9ody9ibG9jay9tMjVwODAuYyBiL2h3L2Jsb2NrL20yNXA4
MC5jDQo+PiBpbmRleCA4MWJhM2RhNGRmLi4xYTIwYmQ1NWQ0IDEwMDY0NA0KPj4gLS0tIGEvaHcv
YmxvY2svbTI1cDgwLmMNCj4+ICsrKyBiL2h3L2Jsb2NrL20yNXA4MC5jDQo+PiBAQCAtMjcsMTIg
KzI3LDE0IEBADQo+PiAjaW5jbHVkZSAiaHcvcWRldi1wcm9wZXJ0aWVzLmgiDQo+PiAjaW5jbHVk
ZSAiaHcvcWRldi1wcm9wZXJ0aWVzLXN5c3RlbS5oIg0KPj4gI2luY2x1ZGUgImh3L3NzaS9zc2ku
aCINCj4+ICsjaW5jbHVkZSAiaHcvaXJxLmgiDQo+PiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3Rh
dGUuaCINCj4+ICNpbmNsdWRlICJxZW11L2JpdG9wcy5oIg0KPj4gI2luY2x1ZGUgInFlbXUvbG9n
LmgiDQo+PiAjaW5jbHVkZSAicWVtdS9tb2R1bGUuaCINCj4+ICNpbmNsdWRlICJxZW11L2Vycm9y
LXJlcG9ydC5oIg0KPj4gI2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4+ICsjaW5jbHVkZSAicWFw
aS92aXNpdG9yLmgiDQo+PiAjaW5jbHVkZSAidHJhY2UuaCINCj4+ICNpbmNsdWRlICJxb20vb2Jq
ZWN0LmgiDQo+PiANCj4+IEBAIC00NzIsMTEgKzQ3NCwxMyBAQCBzdHJ1Y3QgRmxhc2ggew0KPj4g
ICAgIHVpbnQ4X3Qgc3BhbnNpb25fY3IydjsNCj4+ICAgICB1aW50OF90IHNwYW5zaW9uX2NyM3Y7
DQo+PiAgICAgdWludDhfdCBzcGFuc2lvbl9jcjR2Ow0KPj4gKyAgICBib29sIHdwX2xldmVsOw0K
Pj4gICAgIGJvb2wgd3JpdGVfZW5hYmxlOw0KPj4gICAgIGJvb2wgZm91cl9ieXRlc19hZGRyZXNz
X21vZGU7DQo+PiAgICAgYm9vbCByZXNldF9lbmFibGU7DQo+PiAgICAgYm9vbCBxdWFkX2VuYWJs
ZTsNCj4+ICAgICBib29sIGFhaV9lbmFibGU7DQo+PiArICAgIGJvb2wgc3RhdHVzX3JlZ2lzdGVy
X3dyaXRlX2Rpc2FibGVkOw0KPj4gICAgIHVpbnQ4X3QgZWFyOw0KPj4gDQo+PiAgICAgaW50NjRf
dCBkaXJ0eV9wYWdlOw0KPj4gQEAgLTcyMyw2ICs3MjcsMjEgQEAgc3RhdGljIHZvaWQgY29tcGxl
dGVfY29sbGVjdGluZ19kYXRhKEZsYXNoICpzKQ0KPj4gICAgICAgICBmbGFzaF9lcmFzZShzLCBz
LT5jdXJfYWRkciwgcy0+Y21kX2luX3Byb2dyZXNzKTsNCj4+ICAgICAgICAgYnJlYWs7DQo+PiAg
ICAgY2FzZSBXUlNSOg0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIElmIFdQIyBpcyBs
b3cgYW5kIHN0YXR1c19yZWdpc3Rlcl93cml0ZV9kaXNhYmxlZCBpcyBoaWdoLA0KPj4gKyAgICAg
ICAgICogc3RhdHVzIHJlZ2lzdGVyIHdyaXRlcyBhcmUgZGlzYWJsZWQuDQo+PiArICAgICAgICAg
KiBUaGlzIGlzIGFsc28gY2FsbGVkICJoYXJkd2FyZSBwcm90ZWN0ZWQgbW9kZSIgKEhQTSkuIEFs
bCBvdGhlcg0KPj4gKyAgICAgICAgICogY29tYmluYXRpb25zIG9mIHRoZSB0d28gc3RhdGVzIGFy
ZSBjYWxsZWQgInNvZnR3YXJlIHByb3RlY3RlZCBtb2RlIg0KPj4gKyAgICAgICAgICogKFNQTSks
IGFuZCBzdGF0dXMgcmVnaXN0ZXIgd3JpdGVzIGFyZSBwZXJtaXR0ZWQuDQo+PiArICAgICAgICAg
Ki8NCj4+ICsgICAgICAgIGlmICgocy0+d3BfbGV2ZWwgPT0gMCAmJiBzLT5zdGF0dXNfcmVnaXN0
ZXJfd3JpdGVfZGlzYWJsZWQpDQo+PiArICAgICAgICAgICAgfHwgIXMtPndyaXRlX2VuYWJsZSkg
ew0KPiANCj4gJ3dyaXRlX2VuYWJsZScgbmVlZHMgdG8gYmUgdHJ1ZSBpbiAnZGVjb2RlX25ld19j
bWQnIHdoZW4gaXNzdWVpbmcgdGhlIFdSU1INCj4gY29tbWFuZCwgb3RoZXJ3aXNlIHRoZSBzdGF0
ZSBtYWNoaW5lcnkgd2lsbCBub3QgYWR2YW5jZSB0byB0aGlzIGZ1bmN0aW9uDQo+IChtZWFuaW5n
IHRoYXQgYWJvdmUgY2hlY2sgZm9yICFzLT53cml0ZV9lbmFibGUgd2lsbCBuZXZlciBoaXQgYXMg
ZmFyIGFzIEkgY2FuDQo+IHRlbGwpLiBBIHN1Z2dlc3Rpb24gaXMgdG8gbW92ZSB0aGUgY2hlY2sg
Zm9yIHdwX2xldmVsIGFuZA0KPiBzdGF0dXNfcmVnX3dyX2Rpc2FibGVkIGludG8gJ2RlY29kZV9u
ZXdfY21kJyB0byBmb3Iga2VlcGluZyBpdCBjb25zaXN0ZW50Lg0KDQpPaCBnb29kIGNhdGNoISBZ
ZXMgYWN0dWFsbHksIGluIG91ciBmb3JrLCB3ZSBhbHNvIHJlbW92ZWQgdGhlIHdyaXRlX2VuYWJs
ZQ0KZ3VhcmQgaW4gZGVjb2RlX25ld19jbWQuIFdlIGVpdGhlciBuZWVkIGJvdGggY2hlY2tzIGlu
IGRlY29kZV9uZXdfY21kLA0Kb3IgYm90aCBjaGVja3MgaW4gY29tcGxldGVfY29sbGVjdGluZ19k
YXRhLg0KDQpJIHRoaW5rIHdlIGhhZCBzb21lIGRpZmZpY3VsdHkgZGVjaWRpbmcgd2hldGhlciB0
byBibG9jayBjb21tYW5kIGRlY29kaW5nLA0Kb3IgdG8gZGVjb2RlIGFuZCBpZ25vcmUgdGhlIGNv
bW1hbmQgaWYgcmVzdHJpY3Rpb25zIGFyZSBlbmFibGVkLg0KDQpUaGUgcmVhc29uIGJlaW5nIHRo
YXQsIGluIHRoZSBxdGVzdCwgdGhlIFdSU1IgY29tbWFuZCBjb2RlIGdldHMgaWdub3JlZCwgYW5k
DQp0aGVuIHRoZSBzdWJzZXF1ZW50IHdyaXRlIGRhdGEgZ2V0cyBpbnRlcnByZXRlZCBhcyBzb21l
IHJhbmRvbSBjb21tYW5kIGNvZGUuDQpXZSBoYWQgZWxlY3RlZCB0byBkZWNvZGUgYW5kIGlnbm9y
ZSB0aGUgY29tbWFuZCwgYnV0IEkgdGhpbmsgdGhlDQpkYXRhc2hlZXQgYWN0dWFsbHkgZGVzY3Jp
YmVzIHRoYXQgdGhlIGNvbW1hbmQgd29u4oCZdCBiZSBkZWNvZGVkIHN1Y2Nlc3NmdWxseSwNCnNv
IHlvdeKAmXJlIHByb2JhYmx5IHJpZ2h0LCB3ZSBzaG91bGQgcHV0IHRoaXMgbG9naWMgaW4gZGVj
b2RlX25ld19jbWQuDQoNCk1vc3QgbGlrZWx5LCB0aGUgcXRlc3Qgd2lsbCBhbHNvIG5lZWQgdG8g
YmUgbW9kaWZpZWQgdG8gcmVzZXQgdGhlIHRyYW5zZmVyDQpzdGF0ZSBtYWNoaW5lIGFmdGVyIGEg
YmxvY2tlZCB3cml0ZSBjb21tYW5kLiBJIGNhbuKAmXQgcmVtZW1iZXIgaWYNCmV4aXRpbmcgYW5k
IHJlLWVudGVyaW5nIHVzZXIgbW9kZSBpcyBzdWZmaWNpZW50IGZvciB0aGF0LCBidXQgc29tZXRo
aW5nDQpsaWtlIHRoYXQgaXMgcHJvYmFibHkgcG9zc2libGUuDQoNClRoYW5rcyBmb3IgY2F0Y2hp
bmcgdGhpcyENClBldGVyDQoNCj4gDQo+PiArICAgICAgICAgICAgcWVtdV9sb2dfbWFzayhMT0df
R1VFU1RfRVJST1IsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAiTTI1UDgwOiBTdGF0
dXMgcmVnaXN0ZXIgd3JpdGUgaXMgZGlzYWJsZWQhXG4iKTsNCj4+ICsgICAgICAgICAgICBicmVh
azsNCj4+ICsgICAgICAgIH0NCj4+ICsgICAgICAgIHMtPnN0YXR1c19yZWdpc3Rlcl93cml0ZV9k
aXNhYmxlZCA9IGV4dHJhY3QzMihzLT5kYXRhWzBdLCA3LCAxKTsNCj4+ICsNCj4+ICAgICAgICAg
c3dpdGNoIChnZXRfbWFuKHMpKSB7DQo+PiAgICAgICAgIGNhc2UgTUFOX1NQQU5TSU9OOg0KPj4g
ICAgICAgICAgICAgcy0+cXVhZF9lbmFibGUgPSAhIShzLT5kYXRhWzFdICYgMHgwMik7DQo+PiBA
QCAtMTE5NSw2ICsxMjE0LDggQEAgc3RhdGljIHZvaWQgZGVjb2RlX25ld19jbWQoRmxhc2ggKnMs
IHVpbnQzMl90IHZhbHVlKQ0KPj4gDQo+PiAgICAgY2FzZSBSRFNSOg0KPj4gICAgICAgICBzLT5k
YXRhWzBdID0gKCEhcy0+d3JpdGVfZW5hYmxlKSA8PCAxOw0KPj4gKyAgICAgICAgcy0+ZGF0YVsw
XSB8PSAoISFzLT5zdGF0dXNfcmVnaXN0ZXJfd3JpdGVfZGlzYWJsZWQpIDw8IDc7DQo+PiArDQo+
PiAgICAgICAgIGlmIChnZXRfbWFuKHMpID09IE1BTl9NQUNST05JWCB8fCBnZXRfbWFuKHMpID09
IE1BTl9JU1NJKSB7DQo+PiAgICAgICAgICAgICBzLT5kYXRhWzBdIHw9ICghIXMtPnF1YWRfZW5h
YmxlKSA8PCA2Ow0KPj4gICAgICAgICB9DQo+PiBAQCAtMTQ4NCw2ICsxNTA1LDE0IEBAIHN0YXRp
YyB1aW50MzJfdCBtMjVwODBfdHJhbnNmZXI4KFNTSVBlcmlwaGVyYWwgKnNzLCB1aW50MzJfdCB0
eCkNCj4+ICAgICByZXR1cm4gcjsNCj4+IH0NCj4+IA0KPj4gK3N0YXRpYyB2b2lkIG0yNXA4MF93
cml0ZV9wcm90ZWN0X3Bpbl9pcnFfaGFuZGxlcih2b2lkICpvcGFxdWUsIGludCBuLCBpbnQgbGV2
ZWwpDQo+PiArew0KPj4gKyAgICBGbGFzaCAqcyA9IE0yNVA4MChvcGFxdWUpOw0KPj4gKyAgICAv
KiBXUCMgaXMganVzdCBhIHNpbmdsZSBwaW4uICovDQo+PiArICAgIGFzc2VydChuID09IDApOw0K
Pj4gKyAgICBzLT53cF9sZXZlbCA9ICEhbGV2ZWw7DQo+PiArfQ0KPj4gKw0KPj4gc3RhdGljIHZv
aWQgbTI1cDgwX3JlYWxpemUoU1NJUGVyaXBoZXJhbCAqc3MsIEVycm9yICoqZXJycCkNCj4+IHsN
Cj4+ICAgICBGbGFzaCAqcyA9IE0yNVA4MChzcyk7DQo+PiBAQCAtMTUxNSwxMiArMTU0NCwxOCBA
QCBzdGF0aWMgdm9pZCBtMjVwODBfcmVhbGl6ZShTU0lQZXJpcGhlcmFsICpzcywgRXJyb3IgKipl
cnJwKQ0KPj4gICAgICAgICBzLT5zdG9yYWdlID0gYmxrX2Jsb2NrYWxpZ24oTlVMTCwgcy0+c2l6
ZSk7DQo+PiAgICAgICAgIG1lbXNldChzLT5zdG9yYWdlLCAweEZGLCBzLT5zaXplKTsNCj4+ICAg
ICB9DQo+PiArDQo+PiArICAgIHFkZXZfaW5pdF9ncGlvX2luX25hbWVkKERFVklDRShzKSwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgbTI1cDgwX3dyaXRlX3Byb3RlY3RfcGluX2ly
cV9oYW5kbGVyLCAiV1AjIiwgMSk7DQo+PiB9DQo+PiANCj4+IHN0YXRpYyB2b2lkIG0yNXA4MF9y
ZXNldChEZXZpY2VTdGF0ZSAqZCkNCj4+IHsNCj4+ICAgICBGbGFzaCAqcyA9IE0yNVA4MChkKTsN
Cj4+IA0KPj4gKyAgICBzLT53cF9sZXZlbCA9IHRydWU7DQo+PiArICAgIHMtPnN0YXR1c19yZWdp
c3Rlcl93cml0ZV9kaXNhYmxlZCA9IGZhbHNlOw0KPj4gKw0KPj4gICAgIHJlc2V0X21lbW9yeShz
KTsNCj4+IH0NCj4+IA0KPj4gQEAgLTE2MDEsNiArMTYzNiw4IEBAIHN0YXRpYyBjb25zdCBWTVN0
YXRlRGVzY3JpcHRpb24gdm1zdGF0ZV9tMjVwODAgPSB7DQo+PiAgICAgICAgIFZNU1RBVEVfVUlO
VDgobmVlZGVkX2J5dGVzLCBGbGFzaCksDQo+PiAgICAgICAgIFZNU1RBVEVfVUlOVDgoY21kX2lu
X3Byb2dyZXNzLCBGbGFzaCksDQo+PiAgICAgICAgIFZNU1RBVEVfVUlOVDMyKGN1cl9hZGRyLCBG
bGFzaCksDQo+PiArICAgICAgICBWTVNUQVRFX0JPT0wod3BfbGV2ZWwsIEZsYXNoKSwNCj4+ICsg
ICAgICAgIFZNU1RBVEVfQk9PTChzdGF0dXNfcmVnaXN0ZXJfd3JpdGVfZGlzYWJsZWQsIEZsYXNo
KSwNCj4gDQo+IEFib3ZlIG5lZWRzIHRvIGJlIGFkZGVkIHRocm91Z2ggYSBzdWJzZWN0aW9uLCB5
b3UgY2FuIHNlZSBjb21taXQgNDY1ZWY0N2FiZTMNCj4gZm9yIGFuIGV4YW1wbGUgYW4gYWxzbyBy
ZWFkIGFib3V0IHRoaXMgaW4gZG9jcy9kZXZlbC9taWdyYXRpb24ucnN0Lg0KPiANCj4gVGhhbmsg
eW91LA0KPiBCZXN0IHJlZ2FkcywNCj4gRnJhbmNpc2NvIElnbGVzaWFzDQo+IA0KPiANCj4+ICAg
ICAgICAgVk1TVEFURV9CT09MKHdyaXRlX2VuYWJsZSwgRmxhc2gpLA0KPj4gICAgICAgICBWTVNU
QVRFX0JPT0wocmVzZXRfZW5hYmxlLCBGbGFzaCksDQo+PiAgICAgICAgIFZNU1RBVEVfVUlOVDgo
ZWFyLCBGbGFzaCksDQo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvcXRlc3QvYXNwZWVkX3NtYy10ZXN0
LmMgYi90ZXN0cy9xdGVzdC9hc3BlZWRfc21jLXRlc3QuYw0KPj4gaW5kZXggZWMyMzMzMTVlNi4u
YzVkOTdkNDQxMCAxMDA2NDQNCj4+IC0tLSBhL3Rlc3RzL3F0ZXN0L2FzcGVlZF9zbWMtdGVzdC5j
DQo+PiArKysgYi90ZXN0cy9xdGVzdC9hc3BlZWRfc21jLXRlc3QuYw0KPj4gQEAgLTU2LDcgKzU2
LDkgQEAgZW51bSB7DQo+PiAgICAgQlVMS19FUkFTRSA9IDB4YzcsDQo+PiAgICAgUkVBRCA9IDB4
MDMsDQo+PiAgICAgUFAgPSAweDAyLA0KPj4gKyAgICBXUlNSID0gMHgxLA0KPj4gICAgIFdSRU4g
PSAweDYsDQo+PiArICAgIFNSV0QgPSAweDgwLA0KPj4gICAgIFJFU0VUX0VOQUJMRSA9IDB4NjYs
DQo+PiAgICAgUkVTRVRfTUVNT1JZID0gMHg5OSwNCj4+ICAgICBFTl80QllURV9BRERSID0gMHhC
NywNCj4+IC0tIA0KPj4gMi4zMC4yDQo+PiANCj4+IA0KDQo=

