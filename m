Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694256218A2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:42:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQjW-0005nH-Oe; Tue, 08 Nov 2022 10:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1osQjU-0005mh-1V
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:41:48 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1osQjS-0003ZK-Be
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:41:47 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8E3qnb009699; Tue, 8 Nov 2022 15:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=GqslkT0NSuw1RjYV+E/oXqRPi22RnfCGAG2slqxYpO4=;
 b=ncjBmhWyWdU55wGnv9m//HDyDbF1Z9S+lKbiu5haGYzQI3bbnrZi3EntXN5lN1Njez0N
 MZXILjccYKU32G2G+spNTj4DRMi0c8647iTzAE3/pZm4b61oE/zVSF03nEgBhc0u3ULU
 SSqn0ZPXKEw93z7jwn3lByPqimUUzQHB0s+IcHk+DqeLcIOBRHqPlHujnCWys1WnIUHZ
 dQkzv5Xay8HnAsVS8G3AJxYmm4dNHB6IZwwQSyYDW5H8ZGqavsgJzBgsk97wloTg+rph
 WlpiOLlJV87jdE11Mpx0RNcqa+i4gBcG8hgI2nTaHl7MDouKNecPAgwy/iZXG9A01XqS ng== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kq7g4juxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 15:41:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bp/HGTOXrBaDiJJdJ5a+NnO8wr7iSpUqrp57XmV4zIkOpOVUgqIoMF3YjOA55ZVAu89cz8tSx8mNwyIHIM/u/2csRt4aeYHopVuSVbg54Rhn9oat2c9KnoX81sM9B8cvL9N0fkwF4eFyyY7IUFlPZlxitlrEptSMCYMT7iLZEDsttSW3TV7GBz9pd/ifkZGxGTfPlGIUaBB1wTHDEQ0JTWRJpC11W3pNa0KY3OLXDmK40JexMo14FslMw2N2S8MiKlzlpHwQ4qeMRPW+V5i3x4Mo/Jth60bJQKEixljD93ZL6ADqF0Xesd/1tHGvxzsPq0UteHD/g/I9qHltBZgSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqslkT0NSuw1RjYV+E/oXqRPi22RnfCGAG2slqxYpO4=;
 b=a7bzAiwBZ235GyPQ+aXtjS4CULK9IrrVR6pzhh1SbS9wyKlujie4EDAF8ruZfO4qGzA7EFAY5tPSh6GleQn+CTcK4h4TkMMxy9dxVV1ADT3W44tRYDu1SCtQDKu16Dde6QRZVl1B7dzBm/W6xBxP1GZmPMKJa5ELYXyzoiClMkCV8OgrsyyAC7DCKMPtwL9pbql6qofmn5qWQo5B6kBFX8yIgy/ypVk2jtQm0TYOXekh+UJZ8gVJXm+7GffBbmfvZkJC3NEh30hKjLdKrk5vhObuVo7kzj4Rj4FnbOO4uLO7W3j3hMJ6ZGC0LcHdZvrtX5O3rysxh3ieafet+wglbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7807.namprd02.prod.outlook.com
 (2603:10b6:a03:325::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 15:41:38 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 15:41:38 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v4 03/11] Hexagon (target/hexagon) Add overrides for
 S2_asr_r_r_sat/S2_asl_r_r_sat
Thread-Topic: [PATCH v4 03/11] Hexagon (target/hexagon) Add overrides for
 S2_asr_r_r_sat/S2_asl_r_r_sat
Thread-Index: AQHY8ydpaNMMAIUXx0a3Ju/gNwXNIa40nqyAgACLq0A=
Date: Tue, 8 Nov 2022 15:41:38 +0000
Message-ID: <SN4PR0201MB880800033126B7BD10773950DE3F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221108040552.22175-1-tsimpson@quicinc.com>
 <20221108040552.22175-4-tsimpson@quicinc.com>
 <65665a1c-8eed-f487-de8b-5b75b183992a@linaro.org>
In-Reply-To: <65665a1c-8eed-f487-de8b-5b75b183992a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB7807:EE_
x-ms-office365-filtering-correlation-id: fb9015fb-c4e7-4488-6411-08dac19fb9c8
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LcP9y0qDhFiQpqxQHkZaow8LkgQRiwaVHWBXAZ5y6vQ5JGe+AHltkE+tk4n9gLOFQUwdvc/Tf+n1eTGdfRgBsuDfS60L2O4mxk2YwBZrBcYIvonLF/Us7S5ndDItcGdh+8+qL4vbmM33CphjvenRyjPPO7wCas0IqyBWAOBn0fElIemMmFNk4K7CoYnF6iVHAFe+mWSOeuY542OevGQHD+uuc9PoHZ8PvKtO15PuQtI3Z+1NfGaWF/uYAkS8AebOgL4raO3IY7MIB4vDoOmq/BU0MuCGVPYxaFDsA/QcK+UvwjD8HyKhMheyyeYhZmjKNyYVeVN16lJmT6QHXDBnaNXEnGrVDEoIEvTFAMpjEcWLpCv6/YD5yDwFhevlbts4V5VCGDUE3rIpHTPJw1TlB7KpZlpoGpTegV603762e3jRXbXuHJ/i4xXbN8MolA6bsbsmkc/onoe6g/Z8GZmNg5BRStwpJ6OjIAXIFXXJPRoAfVR+/YgScGvC/Qgi5xR4XBa/6Sa0X3pKRXAvri3qkd1aK1enXCH3JibbIwCNSoHQgquUucDbJCoaBEMANa9ENfHfxfz7pCPSPfZ5kofdOieDsFovc+QEfKqyWWOLB8io7XFT6NF8J5HIDq0udx0Q+NYt0qo6S/nb9LM5CDpCQ76tQDl8/1Fe7RGdbmR30bsPdp/x+UYYE8uPtvc0Z7kHVOc4bDDI1W2sD3csrj2APmS9JZifR3QeKdRQjXmwcElVieON8hvmJRPtjCEJ1+O4xVK3LWOs9ukglsDKRGF6ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199015)(66946007)(2906002)(66556008)(64756008)(66446008)(8676002)(66476007)(76116006)(4326008)(41300700001)(8936002)(33656002)(52536014)(5660300002)(4744005)(54906003)(110136005)(316002)(71200400001)(478600001)(86362001)(107886003)(186003)(9686003)(26005)(83380400001)(53546011)(55016003)(38100700002)(6506007)(7696005)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUY1ZXYzU0NWYUJhZkhuWUNyZDdtb1B6ek5yMUNNZ3BIVHpZcTU5cndRS3Uv?=
 =?utf-8?B?YzVYYXVXOUxtS0FlV3JheHdTUEl5ZlFYRWhab0ZrRk4xM3NIWUhUUlJBUkZq?=
 =?utf-8?B?WjczcENUSjFLZklFRFR5UlBtTm43N29hdHJFNXEvb29IZEl1cTZWS3crMFRy?=
 =?utf-8?B?SmFIZkVwaXJ6VVBpZUYvQ2lrcDVPN2phZ1NSWmFCbXQ4ZFZlSXBQNTRWeDU1?=
 =?utf-8?B?eUZlb1pIS2RwZjZlSE5VUEtaeWVLSko3VStvbWs4eWFQbWpYZWFEbVFUb2lF?=
 =?utf-8?B?cDluRzMvMTdvWWhrVGlyZ255UjdYOGRmVmYrSUJlTm5WOWNYaWJHVWRkb3pw?=
 =?utf-8?B?U1cxcWdzS296bEJFeVNTVTE1UjJUL1VKcnFJMUtYMGY0T3NEWHViMm93YUNp?=
 =?utf-8?B?dTBRNEpaNWhmTkdrS3EvUjFKUmdqRVlpdzlUcU85VzVYMGo0N0cwSHBJT2hO?=
 =?utf-8?B?cmFZczJCQ010ZXVyZzFEa2UvZGdBNlVrMlVtL04xR01QRGxLNWIwcnBENmhv?=
 =?utf-8?B?Vk45T0dlZFN6UERISkQzTmlGZEcxeFJJZVBZYVc0MWNSb3RsNVlwaGNKQ084?=
 =?utf-8?B?R2t1b3gzQnQrRHAzYTFwVEhaNmpuSHFoakthR01taFp5V2x3VVRTVXhrcTF4?=
 =?utf-8?B?M2xLbVB5RjFUNjRVVHk4Z2tZbGZ0ZUEyTDNyQ0NReXNjaTdnUzBEc29ENVIr?=
 =?utf-8?B?VkQxejV4TFpXYnRPbzIwWVdsUlZLdytJZ3BJWkhHRnVhYmx3UDlMSkN0TDFT?=
 =?utf-8?B?dm5DMGRjbFpGUWdOdE5VL1UyL2Q1Y2lIY2JURGwxOTFJenYxZlV4NlZuTGJU?=
 =?utf-8?B?T0FIMFlVUWx1eDlHc2Q3SmpOa2NKNVpzaFlOZzhXV2g2UlppczlsSzZHUXhK?=
 =?utf-8?B?VXNsZCtWLzIrT1lXL3BLWU5oQnEvWlEwZ2MzZWJWOGQ2MTE1YnQ2UGljbFJ0?=
 =?utf-8?B?Qk9JU2xFS2xiRmV0WWpzQWVVZlJtbTB0dlNzTDMrRWRrODFJdmZ4aGxJSFY5?=
 =?utf-8?B?NmtJNmNRbURLUHFhMlZEWFdnRXYyNmtIR0x1UE5zc2lxd1dQL21aaHIrc2lz?=
 =?utf-8?B?SlEyVnRUNVBMajFYdVBZMlU2TVBEOEpGOEx4QlVlUkNMKzQxNDRVUWRMKytU?=
 =?utf-8?B?RktPWGpKUm52UEJlMUR5cWcvSytSSUwvamZuK1V3RkF1dElpR2YwcU8xQ3RN?=
 =?utf-8?B?ZXZQNFZlWWxLNklkTmhsTDJhZmtwakYzTHQvNTZKOGQvaXB0K0VPc3BDbXIv?=
 =?utf-8?B?YUNWcFBLM0Z6SnlzWmpDc1lWUE0rSERobkFxK2tyK1daT0srSGUwTVBXeUdU?=
 =?utf-8?B?Y1oxMVNsRWxSZlhqajdmR2RyMWVPMVRHZ0oxOE5wU1kyYUc2MUVIRE01aUNS?=
 =?utf-8?B?dG1CUjVpYlJsVC9kbHBPSG1wTXZCRW5Rd2lIUzV0TmRXbSt2QUdkTkhqc2pj?=
 =?utf-8?B?cndPYkI0VHhoZmwzRCtoMHVDTWNyR2RLbHNyMjNYLytWSXBMeUhTVXpTN1Rh?=
 =?utf-8?B?RWFIWlB0TmczTnV0M0hnZHg3RnRoUjllck9RbGtyTFNGWTRwL21ZTDNiOGhO?=
 =?utf-8?B?bGpodEh6dDlNVkVLdHVtL1NSQitFaERTOFcyWit1ZHlCYjNQQXJFd0Q2SExu?=
 =?utf-8?B?NjkvbTdlQTB1Zmd1dnVxSmM2MzlCU1F0QXdybk1OMGt1OU9pQ3dGTkhad1Nk?=
 =?utf-8?B?ejRCSVR0d09KVlNtcTMrRDVWM1Frc0crN0VpS1gvZysxVXp4MlNXc1BuOXdw?=
 =?utf-8?B?SVpjbnpGbzVsZTE3NDdZUnVVNzI3TnlPT05HMWFyT1l1ZnF3M0I3K0ErdXho?=
 =?utf-8?B?bWdUMkxlbWUwRmhRU2ZBaU1ZR1ZlSEF3K1ZvOUZVMGZrbFNSMFpwRXpJR21P?=
 =?utf-8?B?MFdVTU1idFI0clZXS1dkdVRhcE9Bczd1OVhINnFKa2MzZ3JiUVRqdUY3WC9l?=
 =?utf-8?B?VEc4WndlNElvSDlZYXV1dXVDMTFuejY1d1RsSFk5K3ZkK210Q0JWS2Rib2M0?=
 =?utf-8?B?YVNzK21NQmFHdEVZT3JWeDI5dmE1ODlUMmdIODVsTnhHVFZDTHFOYzZTNkJV?=
 =?utf-8?B?Z0Z4aEJnNGNPYVY3NFp0a2VLTTRvSEtPTmVGcUFiWmJrRFNScmt4bE80NXdt?=
 =?utf-8?Q?bcn2N9I4Iy7Qu/yCzJL52ACcX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9015fb-c4e7-4488-6411-08dac19fb9c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 15:41:38.7068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXcFLDytkDThOx5+0rSw3FJOB3YAyZUPiqnzTLzQGQ0JVyPOvFSWz1Qy2a/6jRUbGvH8nGWEu5AZsafhoFGIYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7807
X-Proofpoint-ORIG-GUID: KTB7G4fBgticF-mheYGm51bPg948JwnK
X-Proofpoint-GUID: KTB7G4fBgticF-mheYGm51bPg948JwnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=647 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080095
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVt
YmVyIDgsIDIwMjIgMToyMCBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsg
YWxlQHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMy8xMV0gSGV4YWdvbiAodGFyZ2V0L2hleGFn
b24pIEFkZCBvdmVycmlkZXMgZm9yDQo+IFMyX2Fzcl9yX3Jfc2F0L1MyX2FzbF9yX3Jfc2F0DQo+
IA0KPiBDb25zaWRlcg0KPiANCj4gICAgICAvKg0KPiAgICAgICAqIHNoMzIgPSBzaGlmdCAmIDMx
Ow0KPiAgICAgICAqIGRzdCA9IHNoMzIgPT0gc2hpZnQgPyBzcmMgOiAwOw0KPiAgICAgICAqIGRz
dCA8PD0gc2gzMjsNCj4gICAgICAgKiBkc3Rfc2FyID0gZHN0ID4+IHNoMzI7DQo+ICAgICAgICog
aWYgKGRzdF9zYXIgIT0gc3JjKSAuLi4NCj4gICAgICAgKi8NCj4gICAgICB0Y2dfZ2VuX2FuZGlf
aTMyKHNoMzIsIHNoaWZ0X2FtdCwgMzEpOw0KPiAgICAgIHRjZ19nZW5fbW92Y29uZF9pMzIoVENH
X0NPTkRfRVEsIGRzdCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHNoMzIsIHNoaWZ0X2Ft
dCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHNyYywgdGNnX2NvbnN0YW50X2kzMigwKSk7
DQo+ICAgICAgdGNnX2dlbl9zaGxfaTMyKGRzdCwgZHN0LCBzaDMyKTsNCj4gICAgICB0Y2dfZ2Vu
X3Nhcl9pMzIoZHN0X3NhciwgZHN0LCBzaDMyKTsNCg0KV2lsbCBkby4NCg0KVGhhbmtzLA0KVGF5
bG9yDQoNCg==

