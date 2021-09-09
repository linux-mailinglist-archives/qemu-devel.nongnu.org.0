Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD82404DC4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:08:41 +0200 (CEST)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIrA-0003wc-EZ
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mOIo9-0000xD-2T
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:34 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:46638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mOIo2-0006nQ-FO
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:32 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 189Agjim029773;
 Thu, 9 Sep 2021 05:05:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=vhy7kZyWCbO2uUABU91Reu2WN4H7MDBug3+98eRw/6k=;
 b=exUwxW+ZB2zcvFaBXEqE4nUZ9+rPZeVXlTmfQq2vt9LyVlSCTw/k9ljaWPpRZPMjppd2
 Z3UXGlXH/YXuE3bBjGaeqYNKI6QKN92V8P65EQSoDuByuGoHGRcQzdl29GwJcTBNM/Wc
 zUU1EH3mn2XtlB5gBVl69udKQ/9V1tLQZlyqnD+uolXgEkBo8mqz7EW0XDXDY+Rh1g8R
 uttuRfUkANzq4m0JQWnkzNdsg84r+46n6jelKFolemSKubAPi7tA2/TACCiLZFY9nbQb
 XxBjo5YQYGUQFTjJzt3E8AMRtTLfAozOreJ2cEeJak93rqgMrGFaICKRBkxmEGvKczS3 vA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3axwah2kw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 05:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXHZZpEJkZFgJUz74TEY01pZEL0qWqUpa1kYYINye9MKsYarDrhGD8ckWR2UJa7Rln5e8Z5W29mMlFZ1rgtSQ/f3ppEaBf0dG5a6PhZN/3627PcPdIS8U4vu5puH3qQSebHlBbjg3osXvPMuurBWXmVFJ2pDhNid1Ifr+Msu5ZeBFOKLDD/DLS9voFL9JHw5nwwfZaSNtDYNUeLF+iLNIqhY9DdbaBAcWLO0syVvGKmeOm/XvawMT1vTidBK+bKR2uutbpsnr7BGSrIhwsre4wV+0oN7kli5hFSxjr21rlgmPGrz/G400szuKjZqXrwCV02OBtx8pJItUbL0Yg4oCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vhy7kZyWCbO2uUABU91Reu2WN4H7MDBug3+98eRw/6k=;
 b=MTM3SKOKjusxSqKPiBEbPnIlfw+s7nEw/zlikvmZ/5J9X2+yC5EV+xZjuVToponKeLW8tqMYWi5FCr98r/SsWSB327GKPttURu27UNrzyGYIT/esP5QJIGm2iGs0hOkwLUnC8s0hJIBKm2khPmXqLnbARWWwY2oOqCluucLXbc7pu2VrjfC9pzyaWc8QMZIcVEQY0bJT+Fc2zsPInzgaJzMxSG1P7tRnFv+CvAmgLNrB0GtzeGKfkV1bhL3vV5K4oV6YFOYYg0PGH4Qexle6ifb2aOLlGScUL2FZd8ylCnHH4fiodEK7Ie7zlFMr09ebCpRAyj3gl9HjlkCqld1KFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by MN2PR02MB6992.namprd02.prod.outlook.com (2603:10b6:208:1f5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 12:05:05 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0%7]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 12:05:05 +0000
From: John Levon <john.levon@nutanix.com>
To: John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Topic: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Index: AQHXkr3OvGMc1gF8HUqon/IhhiYGEKuY9OiAgAJloACAAGXUAA==
Date: Thu, 9 Sep 2021 12:05:05 +0000
Message-ID: <YTn4cHE0TRnhwQeJ@movementarian.org>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
 <YTegRT0DPt50h8VU@movementarian.org>
 <A82F2970-293D-4455-8C92-2C9E58C3E626@oracle.com>
In-Reply-To: <A82F2970-293D-4455-8C92-2C9E58C3E626@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e041ecd-25e5-478e-8e18-08d9738a0fa6
x-ms-traffictypediagnostic: MN2PR02MB6992:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR02MB69924A672CBB1564A5F4D76897D59@MN2PR02MB6992.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nop4Q7CHXPmam8btxwI/2Pnsl8JLsM8EqeXnmc5yRv2xx8AO96gjgARhmbgOk61XIDQcDeM4z+6Ji2Yf8ux8L/5FR4bVHSos7y+1jklG3fZbHHihd43SWiXhUZLAayuv+DnOXU24E7KJ/iYNzdBIiLBo1FV1W3YnTpx8hA0loTBQJj2vU6PJ+s/miIMblHzh7o6mBrOFHCzhOqgudLn86aYtbmfpshR/QGRR1dqsJOBKop8NfZfHoP2Ju9Q8aPF3KVAC5yfeoxNJUBufo99+Eyl2VX/17rFtZg7tncjOFRN9hT2rV+QAyHB3L6hLYiBwlmY7FKZBzOv+CkyguRLzUh6V2qBvkmtAJgDKw3XW7kFVv5mO+dVnr+EztJjYHzl7S129sW/SbND+EjVGYOUfDQTqDUK4LrJU4PVR6bu5trUZK3XX5hZ+dnrK21Gn1YfbbsN7/qqvpdc8yCzvavCE/AyLxiN1tRx4vxItbS14ylm64K/YYwed9AFus/vTmbZ+LcXZOvmZFQElUGERynp6BG/ABFUubuybrhoU94DXI7RsUllQApIIU8BWAL+6GUEfKEl657cLU3XHOnNGUHsVqMsZrJ0daZVwb2m0B2M1+Pa0ETaep8zoJ+yvY0As5wSO+gsKMxG+WrHJ+RosGmdLQD0ryfSDLB2E46d+nIxYx2RDzdO+VyvlT7cF8OZgrnlVcemCP5PXks9TG8vA1c23Oh6/8LOa2JTrzgizWvy/7aNK6Lz5bQNwgHImwaYUeDsDkbBdgkCaMAdIwjliUKlFA/R6/jBgtcf1hbB5vF6wmqQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(136003)(396003)(39860400002)(107886003)(6506007)(54906003)(2906002)(316002)(44832011)(36756003)(53546011)(83380400001)(38070700005)(4326008)(966005)(6916009)(8676002)(66946007)(76116006)(91956017)(6512007)(9686003)(8936002)(66446008)(66476007)(64756008)(66556008)(478600001)(26005)(86362001)(122000001)(71200400001)(186003)(5660300002)(38100700002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YklqbWF6UmE0aFl6TmxYNUVuT2JpU2FFeEduTVBZNTJnZTlNTXVzSjV3a3p3?=
 =?utf-8?B?RXJpcERRK053WTV5RFQvRDhkMnBGRnMrci9qbGJBajU3Z1hObmEyOFFpbjBy?=
 =?utf-8?B?STcwOEZnVTh0L3FqWEFtQ0lvOWplcTg4Y216TFhyeEY3Mzl2cjFIYmovSmph?=
 =?utf-8?B?V0FDbkE4bGs1dHljMUkxcXordXJ0OERHLzZTUmx4L25GZUdvWEtJdTFYSkgx?=
 =?utf-8?B?dThjbm5ORXo4eTB1ay8wQ3hheTJ0RHJBVmhZMFZLUDF2U1dwTnBOelhXTU50?=
 =?utf-8?B?ZXhiOVA4UUdiUi8yeDN4YlMwMko1aDc4NFlWa0h4eUpmRVo4Szh3YUZlY2o0?=
 =?utf-8?B?TmY2dXcvYVdmN01wYWp5ZnRLQmNzYmdrZEp4TWJiKzF1RWlUdFNKM2dOK1R3?=
 =?utf-8?B?YkJ5QUZpZjN5Ulk0U1psbzdpemdpd1Y3WElDeU9JeUlBRVFONmFOWVc2NWlh?=
 =?utf-8?B?SDNteFRudEE1TUN3aFhzcHpmbWx4UTBSamo3Z2czRmcyb0d1MDlQem9lLzQx?=
 =?utf-8?B?RTVZcGZhVkZNOEhhRCt2dnQ4SDBCanA3NWlKR2x1UGxabXJWbEozaHozcURQ?=
 =?utf-8?B?ZGJ3NkNZOVVLOUQzaVdhYk1QK1YzQ2Fpb2VQR2x4dUtQVVRyKzNrNDRPU3Rv?=
 =?utf-8?B?K3hXMWRSTnlTUlZtditpUFh4akRtcGxLS2JDTTBuKzZoLy8wTU5tSTlqWTVr?=
 =?utf-8?B?NEcxQUJxUW9iT09sczFPc3lwczh4emxhakdBMllFTGwwazg0SkhmUDFHL3VR?=
 =?utf-8?B?a2JDVFpCOEErM0RPYTlxQ3VWNDQ4V2pqWkZHZEFDL1V1Mzd6ZnlSdWI3aExy?=
 =?utf-8?B?SzAvSkVuRkZNMXRMRjdJUHM2QlhiR1dQcXA2b1BlOC91VGRRVldyMHlHa2wx?=
 =?utf-8?B?WTE1YmdYenRvcTZqb1lLZ1lNbThkN1N5Z3NDMGpUUWNNcUduUGxaekJVWjFo?=
 =?utf-8?B?Z3QydWhuQUk0U3gzd1VpUnFCTzcrQXRlSXRxalFEWG44WndpRUYxTVBvck1p?=
 =?utf-8?B?aDNoNXd5N3N6UFM1dUJtTFZIS05MN1VyTDRPQzVHVVlNUVNER3gvUG5mQ281?=
 =?utf-8?B?em1pbjJzM2lOK05CRElNUlpjeEgvWlBURkdhZjRPeklsVnVJa0ZCQ1J0VWhL?=
 =?utf-8?B?KzNpT2VqM0IvdTNvN1FFdTVjd0EvZUVNcHpnbVpxdHlTYkE5ZDJYRkE3YXkz?=
 =?utf-8?B?VUVoaEFXaklBSCtyS21vSEZGemQ5S25mVUZ3aU1hbEhrbWErdDkvWlUzMnlM?=
 =?utf-8?B?bmlTZ1kxS3pEK2ZNMHpOR3B4L1V3bkdWaVJpdjJDNk1hZ2pENllFY1BzM3Np?=
 =?utf-8?B?RXVJS1dFT3Vqck9WaklQTGxSRWNuSDJEUGsvNXVXbTh5VHdMbTVpeWx2dmEy?=
 =?utf-8?B?TUJpc21oVkJxeFJrVmVkaFduRlFSVWlNWHU3VEwvV1VTc1VFcmp5LzBiRnV6?=
 =?utf-8?B?SzNoYjNDTTlQOEUyTkYwWmdXODVucFg0WXQrdEs4NFJaQWhrbE93N1Rqcnp5?=
 =?utf-8?B?eE54U3VEN0xrRm9XdnFpQUF5NGhmNklZTmhRTms4eERDV1RCVkYzeERVRkM4?=
 =?utf-8?B?UkcrdERsd0MyaStqTlcwUE15c3VsKzRiOUM1bDBOTk9WZTQrRjhGODFmTlB2?=
 =?utf-8?B?NGhvTnJrUGkvMzdxalpDOTZYRExRRDQ3anErdE5ubXVuUkRmY0dHVlpsZk5G?=
 =?utf-8?B?MmtsWFpDL0p3RGZiV1RQUGwvOEJaaHhudFZQZmJtQXpvRDlqQmxtT3RncEdJ?=
 =?utf-8?Q?aD93ITaL7ERtrkMXG86cJ7tWIzOqqYDDNIS2yAL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C3718ADF094794D9D28E9848EA90CD7@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e041ecd-25e5-478e-8e18-08d9738a0fa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 12:05:05.4120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TLrCf0BpN//VKdQ+BBg5zXqpLmomceKj0ZFoctBYMROhFiwbRef43NYQyhu/njxnJX2Mxjkj11h+zBHJ5aVgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6992
X-Proofpoint-ORIG-GUID: mYipPe_auHeF9MXA9e1dpIGTlMnPhJmO
X-Proofpoint-GUID: mYipPe_auHeF9MXA9e1dpIGTlMnPhJmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=john.levon@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVGh1LCBTZXAgMDksIDIwMjEgYXQgMDY6MDA6MzZBTSArMDAwMCwgSm9obiBKb2huc29uIHdy
b3RlOg0KDQo+ID4gT24gU2VwIDcsIDIwMjEsIGF0IDEwOjI0IEFNLCBKb2huIExldm9uIDxqb2hu
Lmxldm9uQG51dGFuaXguY29tPiB3cm90ZToNCj4gPiANCj4gPiBPbiBNb24sIEF1ZyAxNiwgMjAy
MSBhdCAwOTo0Mjo0MkFNIC0wNzAwLCBFbGVuYSBVZmltdHNldmEgd3JvdGU6DQo+ID4gDQo+ID4+
ICtpbnQgdmZpb191c2VyX3JlZ2lvbl93cml0ZShWRklPRGV2aWNlICp2YmFzZWRldiwgdWludDMy
X3QgaW5kZXgsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRfdCBvZmZz
ZXQsIHVpbnQzMl90IGNvdW50LCB2b2lkICpkYXRhKQ0KPiA+PiArew0KPiA+PiArICAgIGdfYXV0
b2ZyZWUgVkZJT1VzZXJSZWdpb25SVyAqbXNncCA9IE5VTEw7DQo+ID4+ICsgICAgaW50IHNpemUg
PSBzaXplb2YoKm1zZ3ApICsgY291bnQ7DQo+ID4+ICsNCj4gPj4gKyAgICBtc2dwID0gZ19tYWxs
b2MwKHNpemUpOw0KPiA+PiArICAgIHZmaW9fdXNlcl9yZXF1ZXN0X21zZygmbXNncC0+aGRyLCBW
RklPX1VTRVJfUkVHSU9OX1dSSVRFLCBzaXplLA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICBWRklPX1VTRVJfTk9fUkVQTFkpOw0KPiA+IA0KPiA+IE1pcnJvcmluZyBodHRwczovL3Vy
bGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dpdGh1Yi5jb21fb3Jh
Y2xlX3FlbXVfaXNzdWVzXzEwJmQ9RHdJR2FRJmM9czg4M0dwVUNPQ2hLT0hpb2NZdEdjZyZyPXY3
U05MSnF4N2I5VmZjN1pPODJXZzRublo4TzVYa0FDRlEzMGJWS3hvdEkmbT1QSjM5MENmS1BkVEZV
ZmZTaTAyd2hNU3FleTJlbjhPSnY3ZG05VkFRS0kwJnM9TWZwMXhSS0VUM0xFdWNFZVp3VVZVdlNK
M1YwenpHRWt0T3pGd01zVGZFRSZlPSAgaGVyZSBmb3IgdmlzaWJpbGl0eToNCj4gPiANCj4gPiBD
dXJyZW50bHksIHZmaW9fdXNlcl9yZWdpb25fd3JpdGUgdXNlcyBWRklPX1VTRVJfTk9fUkVQTFkg
dW5jb25kaXRpb25hbGx5LA0KPiA+IG1lYW5pbmcgZXNzZW50aWFsbHkgYWxsIHdyaXRlcyBhcmUg
cG9zdGVkLiBCdXQgdGhhdCBzaG91bGRuJ3QgYmUgdGhlIGNhc2UsIGZvcg0KPiA+IGV4YW1wbGUg
Zm9yIFBDSSBjb25maWcgc3BhY2UsIHdoZXJlIGl0J3MgZXhwZWN0ZWQgdGhhdCB3cml0ZXMgd2ls
bCB3YWl0IGZvciBhbg0KPiA+IGFjayBiZWZvcmUgdGhlIFZDUFUgY29udGludWVzLg0KPiANCj4g
CUnigJltIG5vdCBzdXJlIGZvbGxvd2luZyB0aGUgUENJIHNwZWMgKG1lbSB3cml0ZXMgcG9zdGVk
LCBjb25maWcgJiBJTw0KPiBhcmUgbm90KSBjb21wbGV0ZWx5IHNvbHZlcyB0aGUgaXNzdWUgaWYg
dGhlIGRldmljZSB1c2VzIHNwYXJzZSBtbWFwLiAgQSBzdG9yZQ0KPiB0byB3ZW50IG92ZXIgdGhl
IHNvY2tldCBjYW4gYmUgcGFzc2VkIGJ5IGEgbG9hZCB0aGF0IGdvZXMgZGlyZWN0bHkgdG8gbWVt
b3J5LA0KPiB3aGljaCBjb3VsZCBicmVhayBhIGRyaXZlciB0aGF0IGFzc3VtZXMgYSBsb2FkIGNv
bXBsZXRpb24gbWVhbnMgb2xkZXIgc3RvcmVzDQo+IHRvIHRoZSBzYW1lIGRldmljZSBoYXZlIGFs
c28gY29tcGxldGVkLg0KDQpTdXJlLCBidXQgc3BhcnNlIG1tYXBzIGFyZSB1bmRlciB0aGUgZGV2
aWNlJ3MgY29udHJvbCAtIHNvIHdvdWxkbid0IHRoYXQgYmUNCnNvbWV0aGluZyBvZiBhICJkb24n
dCBkbyB0aGF0IiBzY2VuYXJpbz8NCg0KcmVnYXJkcw0Kam9obg==

