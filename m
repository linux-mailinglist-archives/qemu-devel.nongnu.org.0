Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DAA519228
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:08:12 +0200 (CEST)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1cp-0006FW-Ab
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1Mg-0001RC-DG; Tue, 03 May 2022 18:51:31 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:46848
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1Mc-0001so-11; Tue, 03 May 2022 18:51:29 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 243HFh2U016667;
 Tue, 3 May 2022 15:51:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=GOVDB3pjrG7HYG2mO22v+/7+pLfWIdmLJKgsIHykUco=;
 b=bzCax3m00rUwgUjkJKXmm4X/xdQq9f7ZMhpDn2A1T8vPcQFV0UcMFe+lCKD0CDS32iKL
 J8ZHo6tK8+x0nQwEOtEfUAUKPTLbHQ7CU/ADh7BVe9kUXaG7TwVYVJ4T4ilHnzs/or9u
 20EPP4QutS3cPrPa0X9yxSReUmIPJXaPjPc= 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
 by m0001303.ppops.net (PPS) with ESMTPS id 3fu6sbbjnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 15:51:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzYZERwH1zB/dnWyvu1fuImrSaQEt1WP26Fxp8J8lKFA98GLjBFYVebXf4rJ7cZ31ppToYdsEGPaEqggEUfJCNUWbxBQLZdPJxb5mZs58xj/hF8VvyUcQ9VXnaG30zdJwnSdPTNu5n1UT6jd1gghxiP7VwXWP+oc8D/yM6FK+ze7lGApDnwGOGJTPrAqsHWNEnpgI7OHZbIaP0eRbPMgTPpzmx0vlVrS0UWXUKmnsBByXAPJEcAp69MNjwyQG6iSVz6xIR/k4Czl+c1011kbC9yrIUeXtpYdewjUYnnMmb1/4D6/CEHG5BtGUsIxjW0EEDKrckthiR8yqR/9W+r14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOVDB3pjrG7HYG2mO22v+/7+pLfWIdmLJKgsIHykUco=;
 b=AOIGC6C6lMwtY8pT5KWKvng8hrzARc7ItqC3a6P4sZv4E7GMCMD7N1m+6Bqc5i+I6IVWHY0E99XCWksJwUgs+rVNmbFMeBPB14sj6XYL7dMETThtdHalkhD+5V2wXNMaS4tLcvVCK27aa13ARYlVU1J4dx6Y3kKk0NGi3VMbbhGTe18V01l0UdGJKA9ZJNrM6Y87+PNhjqx6MNGTtb2YLj1sYNjtBSOZYPwCYPy4eFTBxWTghEA/23oIGSmi3EL3DucgBkqOua+i2tySSihieJO/tQs0ptiTEDsBhmjwekKf4V2Qw4P8OikvbA7t4lIhQEo7v2CB6FmYeon2fH89TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by MW4PR15MB4683.namprd15.prod.outlook.com (2603:10b6:303:10c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Tue, 3 May
 2022 22:51:19 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541%4]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 22:51:19 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, qemu-arm <qemu-arm@nongnu.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Thread-Topic: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Thread-Index: AQHYXy6+7tiiaA0Gq0SF+yxrT9QWG60NrPWAgAAUQwCAAAEFgA==
Date: Tue, 3 May 2022 22:51:19 +0000
Message-ID: <743B6ADC-E2A5-49C5-92F0-903EF8F3AD21@fb.com>
References: <20220503204451.1257898-1-pdel@fb.com>
 <f0143ab9-54e9-09cd-d203-e779f9d8d6e4@kaod.org>
 <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
In-Reply-To: <A0BF3AA6-C57B-4A95-BCE2-92CE7A3733A8@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fd4b2c7-bcc7-4221-786f-08da2d577069
x-ms-traffictypediagnostic: MW4PR15MB4683:EE_
x-microsoft-antispam-prvs: <MW4PR15MB468311BAFD36D895CCE46F8EACC09@MW4PR15MB4683.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0cWPQEdfmOZkKFIhdU+kgr8nlAid/gghYgr29LLJlqWaVYHYyQaAorlM827S5EyNZoYAQlng1uBQNs2q5lWBcIqva0FVo5oTNziLA7+FLJ5Ap+dNtItTAxwvttWY86pIKB3uAxyDVsLzvlZ6asaDwXjkjoDzI1TQ6XYwVyq5iq3ZO3PYnIIP92eDtBHP1NDzn7EqNKB/euVTv88iJOHLt8/ps2jm0ZZhnSmWe3jhu3qAZzgXGzLTYolvbqRvmhjqBeGLiGPMr65/xAvsKqg1L8HVUBbdKMC4cj0adHImbPqO/U7XnG51u466V3sk2ROuOq5hMLTQcZh1M0nD9Q6JDjw1KuoUw17O94uNnfAt+2fKs/GCfKe5idlb0TutmSuSk+SqNsq1UhkgTCcxTlK/wVjF8LNs6H4GGoQMjTdBxZww6SVVxVEpN1HKTk0+NHJ4Pzn/aBTx+etbuqq+YPmCnmFhBuWzZT+LiQmm5xKu3I3hjbFNCfmbViyHeBA1FZAL0nc+nkG8XJIwJNHqSDh4Bi6EOV/MgWGr/5HKml6BxhDlMC7lmgXv0wSJ3keEaURIv7+3RFh2U9CxswZvIv34eyPQkKw578LKYBsDrALRBENDRF13kJW8BdyPdIzY+PymbxalvyEsBoGifLgEkGDavrdQ/vYPiansG3g9Ha+ZtKb5gGohpkovAYbL7hvm93GVPBkg/e54SrmMRkvaO88girXuKAoxQ2xKglAmeM1ay1b1+emwnZwP4sZ5IBYI+pNN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2906002)(5660300002)(33656002)(66574015)(36756003)(122000001)(38070700005)(8936002)(186003)(316002)(38100700002)(54906003)(109986005)(2616005)(66446008)(8676002)(4326008)(66476007)(64756008)(66556008)(6512007)(6506007)(53546011)(71200400001)(508600001)(86362001)(66946007)(76116006)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1I3OVl1WnA2OVBLYU9QVDBsUXpVU3ZUeDQ4YnM4RjhZT1NnODI0OE9TcVVs?=
 =?utf-8?B?WFZ0MWZ0b3pIcGtGRUhwYkMvVU1BZ0xPdXZkd2s4WWowbFRETGNGK2kwNGty?=
 =?utf-8?B?ak9HbVVkUmdhcEtkVGxDOGxkemtjbVZVTHV6NS9yZExPU2JSZHRZN1VTNU1y?=
 =?utf-8?B?ZWxmV0VEUlNKNGVVVmtaaDBHVEpwZXdyZ0dKK3ZBMjFlV0wyaUxkY2x2Q2Jq?=
 =?utf-8?B?aEU3aFpUY2J1UlowVTRQa3JMZnlFNFFxbWJ2ZXlCTGhrQ3ZCcko5OGJuVlkx?=
 =?utf-8?B?VTgvNzVwUjJhaFlQZUNiRHNmM1lKQ3lCQW9xZzdHL3NwMGY0am5yRXhmeVdT?=
 =?utf-8?B?QU9md1FBbGhOcGRyNEtQWG5ZQ0paMndFa2pwOXRTdlM3cCtjeDY3WDRGOG9R?=
 =?utf-8?B?RElrNHJicjM0WmluTlZseWtlUDRxclVIamxHZXJZbXFZUVcwYU1jbW4wYTdE?=
 =?utf-8?B?Y0RmamtXckVRZXprWnpSd09xNzBQNUJhUUM1eFJBbTFleE1hUkFVZlNKLy9v?=
 =?utf-8?B?YXlod3kyQWFaVW9veVJ1cy8vVFlFTnQ1RGlLTktBVVQ4SDJlak1qODlDYmNN?=
 =?utf-8?B?STI1OTFSL3o2b0VndlhSdDdLblAyMWJORmtxK2xSODViRTdZMm5ueXZNL1Q4?=
 =?utf-8?B?MjRpWnNtckJPeDNEeGdWZDg5UTN0c3hnSGQ1clVqRG1hdFE5WEVaWjAyQVR1?=
 =?utf-8?B?Tk4rZ0NXUDdNdGV1LzI2aTRDSkRFNjIrR05RUnpoOGlubVlNaVRoSEdFUC90?=
 =?utf-8?B?ZFB4cElHZml3NlZPOE9oUDAyUi82N2tnUjJ0TlVyTGR1blB6dXUyaFduRFFO?=
 =?utf-8?B?MFB6dGh2bWxRWmg0Y2ROeWtucDFVdklqMUE1Y3JIamZ1RDQwV2hQM04xS0V6?=
 =?utf-8?B?ZmlBclBKeE1uZG9ubFJncmNEQ0lJZllNdGorY1F6MEMyZXZ6Z3V0UyswdlFt?=
 =?utf-8?B?RmhhS3NGQ0hOUE5CMjVhY29SODBMMWJxdkxiNG9jYXNmT2prTUhObXhlTkJT?=
 =?utf-8?B?RFFCRlJKVEpLN1doR1I4Q3BRYTlERS9kRWt0NU85QUZZdHhwSUtQSW9wOVEr?=
 =?utf-8?B?OGdwVlg3Zk1NS3d3TzMxZ1lKN3g2QytMZEVNSGRtTDYzUmdWbTEraDBPczhK?=
 =?utf-8?B?RHdwNy9jOUd0RlpVTGh2TnQzWUh5TGU2MFFYUkdZSk9JZkJHVWdLSno3OEJR?=
 =?utf-8?B?R2dpY1c2VUp1ZlUxMFoyUS9WeitpRG00WktKUTlHbCtqQkc5eUtxcVNLOVVE?=
 =?utf-8?B?aTZHcVJjcld4Y3BBVzEvMXBSaERJemFZUERPT1I5bGRvQWtnc1JjME9jekh3?=
 =?utf-8?B?YnB4MTVrOWlnb2ROdlh4SE00UndRQ2ExWkVxU3ZnQ3RVMVlzTUxBYlh5T0VH?=
 =?utf-8?B?U1BhU3V3UWxyOUdPMlB1a3ZpTXFCdXJ1cUdVVjlkSytZUjh5VUxHc1loYU0x?=
 =?utf-8?B?ZzByU1JncXg2Z1ZGRmRjeitOU00zOVJiSko0Y1pYeTZLTmYwYTFlS2srSVRV?=
 =?utf-8?B?dysvWG43MlYrdmNaQTNUT3NnWERvVmNtTEprZkwrbjlyekRhT245M3FwRERr?=
 =?utf-8?B?L3lNdk1lUE9yQUdoS1RoOXVXVXJGSnlOT3U2VmdleERZaUlrSGdaMWR4Qitj?=
 =?utf-8?B?NUwwcisrTW4xV2xUa3dpMklwNUtnWVB4bVNXMmI1dnRwek10Y1BFQXlMYjBB?=
 =?utf-8?B?TlhsRWRjR1lySTJ0aXdPdDRQdk4weUhpNm9GemdlRnRxbWIvdjRrZC82Qngz?=
 =?utf-8?B?ckl3d1NGc2RQdERhdVpDZzF5Um5CZDNSWkxhbHZ4bXJucE0yODMwSHBMR3dO?=
 =?utf-8?B?cXlNNWttaExLNnUrNkVsTmh0Yi9BeUZ0bEwvbjlCZUxNYitTT1BoTkhFQktl?=
 =?utf-8?B?amdXc0QwSmJQamdnVHAyZ2lZc2VMSWc5ZFVMOXhta3Ewb2ppVHNnZ3o5VmdO?=
 =?utf-8?B?ejN2Qmk1K2hxSDVwYkpMUmFycmgybWhKQXFXTXlWd3lqOFEvSlJyK1ovbXVQ?=
 =?utf-8?B?NVZSOFYzNnJTWmE1VEJQYzFSSVRxanJEeTE0YzVTaWxEcDRtNFRCSFQ4WjFV?=
 =?utf-8?B?azhWMkhLKzFXSGpsWWRsUXFVMmRGTmt0WEhBZm4veE5JUkF3emFZV0thaGk0?=
 =?utf-8?B?ZDdrTFRzTzgzekw2cFhtWlVrVFVNRDRQaWExaXVoOWVLTFdxRUI0cDlkQlgr?=
 =?utf-8?B?MFBEb0FSYkZLclJCc05mUkNjbEJ0RUx5UFllZ3hpQWFUZWJ0cEdtWjhRZnFh?=
 =?utf-8?B?bHE3Q1NrTXRMZDA2YjFzbkpEcnFNcFd2S0hOUkN5ZVJrVmVOcHJCZXpDc09H?=
 =?utf-8?B?Z2pZTERmb0FFZmZKNHZaczJWdGp4Lyt0MlZzcCsxbkxDejlmMWZpeWRjNHd6?=
 =?utf-8?Q?8fdIqn64ovZVKtmU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <521712515C2F77479C31C7065F37241F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd4b2c7-bcc7-4221-786f-08da2d577069
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 22:51:19.7398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rLhbsKr8C29gBHFtmHiK5G9DMk2XGqC1FE/JIfzy3FtqT5sNI4M2ZEBN1uKr66C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR15MB4683
X-Proofpoint-ORIG-GUID: cILuegex-H9bkzFZPSDTBOk0z4lHJMV5
X-Proofpoint-GUID: cILuegex-H9bkzFZPSDTBOk0z4lHJMV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_09,2022-05-02_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=61228a338c=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gTWF5IDMsIDIwMjIsIGF0IDM6NDcgUE0sIFBldGVyIERlbGV2b3J5YXMgPHBkZWxA
ZmIuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIE1heSAzLCAyMDIyLCBhdCAyOjM1IFBN
LCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPiB3cm90ZToNCj4+IA0KPj4gT24gNS8z
LzIyIDIyOjQ0LCBQZXRlciBEZWxldm9yeWFzIHdyb3RlOg0KPj4+IEhleSBldmVyeW9uZSwNCj4+
PiBJJ20gc3VibWl0dGluZyBhbm90aGVyIEZhY2Vib29rIChNZXRhIFBsYXRmb3JtcykgbWFjaGlu
ZSB0eXBlOiB0aGlzIHRpbWUgSSdtDQo+Pj4gaW5jbHVkaW5nIGFuIGFjY2VwdGFuY2UgdGVzdCB0
b28uDQo+Pj4gVW5mb3J0dW5hdGVseSwgdGhpcyBtYWNoaW5lIGJvb3RzIF92ZXJ5XyBzbG93bHku
IDMwMCsgc2Vjb25kcy4gDQo+PiANCj4+IFRoaXMgaXMgdG9vIG11Y2ggZm9yIGF2b2NhZG8gdGVz
dHMuDQo+IA0KPiBFcmcsIHllYWggSSBmaWd1cmVkIGFzIG11Y2guIEnigJlsbCBqdXN0IHJlc3Vi
bWl0IGl0IHdpdGhvdXQgdGhlIGF2b2NhZG8gdGVzdCB0aGVuLA0KPiBpZiB0aGF0IHNvdW5kcyBv
ayB0byB5b3UuDQo+IA0KPj4gDQo+Pj4gSSdtIG5vdCBzdXJlIHdoeSB0aGlzIGlzIChzbyBJIGRv
bid0IGtub3cgaG93IHRvIGZpeCBpdCBlYXNpbHkpDQo+PiANCj4+IFRoZSBmdWppIGhhcyB0aGUg
c2FtZSBraW5kIG9mIHByb2JsZW0uIEl0IHRha2VzIGFnZXMgdG8gbG9hZCB0aGUgbHptYSByYW1k
aXNrLg0KPj4gQ291bGQgaXQgYmUgYSBtb2RlbGluZyBpc3N1ZSA/IG9yIGhvdyB0aGUgRlcgaW1h
Z2UgaXMgY29tcGlsZWQgPw0KPiANCj4gWWVhaCwgb25lIHJlYXNvbiBpcyB0aGF0IEZhY2Vib29r
IE9wZW5CTUMgbWFjaGluZXMgaGF2ZSBhbiB1bm5lY2Vzc2FyaWx5DQo+IGJpZyBpbml0cmFtZnMg
dGhhdCBpbmNsdWRlcyBhbGwgdGhlIHJvb3RmcyBzdHVmZiwgd2hlcmVhcyByZWd1bGFyIE9wZW5C
TUMNCj4gbWFjaGluZXMgaGF2ZSBhIHNtYWxsZXIgaW5pdHJhbWZzIHJpZ2h0PyBJIGRvbuKAmXQg
ZW50aXJlbHkga25vdyB3aGF0IEnigJltIHRhbGtpbmcNCj4gYWJvdXQgdGhvdWdoLg0KPiANCj4g
SSB0aGluayBtb3N0IEZCIG1hY2hpbmVzIGhhdmUgbW92ZWQgdG8genN0ZCBjb21wcmVzc2lvbiBy
ZWNlbnRseSB0aG91Z2gsDQo+IGJ1dCB0aGlzIG9uZSBtYXkgaGF2ZSBiZWVuIG1pc3NlZDogSSBj
YW4gZml4IHRoYXQgb24gdGhlIGltYWdlIHNpZGUuIEnigJlsbA0KPiBhbHNvIGV4cGVyaW1lbnQg
bW9yZSB0byBzZWUgaWYgaXTigJlzIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBpbWFnZSwgb3Ig
cG9zc2libHkNCj4gYSByZWdyZXNzaW9uIGluIFFFTVUuIEl0IHdvdWxkIHJlYWxseSBiZSBzdXBl
ciBhd2Vzb21lIGlmIGl0IGNvdWxkIGJvb3QgZmFzdGVyLA0KPiBzbyBJ4oCZbSB2ZXJ5IG1vdGl2
YXRlZCB0byBmaW5kIGEgc29sdXRpb24uDQoNCk9oOiBJIGZvcmdvdCwgc29tZWJvZHkgcmVtaW5k
ZWQgbWUsIHdlIGFsc28gZXhlY3V0ZSBlYXJseSBVLUJvb3QgU1BMIGNvZGUgaW4tZmxhc2gsDQpl
LmcuIHdpdGhvdXQgU1JBTS9ldGMuIFRoYXQgaXMgYWxzbyBwcm9iYWJseSBkaWZmZXJlbnQgZnJv
bSBtb3N0IG90aGVyIG1hY2hpbmVzLg0KDQo+IA0KPj4gDQo+PiBUaGFua3MsDQo+PiANCj4+IEMu
DQo+PiANCj4+IA0KPj4+IGFuZCBJIGRvbid0IGtub3cgaG93IHRvIG92ZXJyaWRlDQo+Pj4gdGhl
IGF2b2NhZG8gdGVzdCB0aW1lb3V0IGp1c3QgZm9yIGEgc2luZ2xlIHRlc3QsIHNvIEkgaW5jcmVh
c2VkIHRoZSBnbG9iYWwNCj4+PiB0aW1lb3V0IGZvciBhbGwgImJvb3RfbGludXhfY29uc29sZS5w
eSIgdGVzdHMgZnJvbSA5MHMgdG8gNDAwcy4gSSBkb3VidCB0aGlzIGlzDQo+Pj4gYWNjZXB0YWJs
ZSwgYnV0IHdoYXQgb3RoZXIgb3B0aW9uIGlzIHRoZXJlPyBTaG91bGQgSSBhZGQNCj4+PiBBVk9D
QURPX1RJTUVPVVRfRVhQRUNURUQ/DQo+Pj4gQHNraXBVbmxlc3Mob3MuZ2V0ZW52KCdBVk9DQURP
X1RJTUVPVVRfRVhQRUNURUQnKSwgJ1Rlc3QgbWlnaHQgdGltZW91dCcpDQo+Pj4gV2hhdCBpcyB0
aGUgcG9pbnQgb2YgdGhpcyBlbnZpcm9ubWVudCB2YXJpYWJsZSB0aG91Z2gsIGV4Y2VwdCB0byBz
a2lwIGl0IGluIENJVD8NCj4+PiBJZiBJIHJ1biB0aGUgdGVzdCB3aXRoIHRoaXMgZW52aXJvbm1l
bnQgdmFyaWFibGUgZGVmaW5lZCwgaXQgZG9lc24ndCBkaXNhYmxlIHRoZQ0KPj4+IHRpbWVvdXQs
IGl0IGp1c3Qgc2tpcHMgaXQgcmlnaHQ/IEkgd2FudCBhbiBvcHRpb24gdG8gcnVuIHRoaXMgdGVz
dCB3aXRoIGEgbGFyZ2VyDQo+Pj4gdGltZW91dC4NCj4+PiBUaGFua3MsDQo+Pj4gUGV0ZXINCj4+
PiBQZXRlciBEZWxldm9yeWFzICgxKToNCj4+PiAgaHcvYXJtL2FzcGVlZDogQWRkIGZieTM1IG1h
Y2hpbmUgdHlwZQ0KPj4+IGh3L2FybS9hc3BlZWQuYyAgICAgICAgICAgICAgICAgICAgIHwgNjMg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+PiB0ZXN0cy9hdm9jYWRvL2Jvb3RfbGlu
dXhfY29uc29sZS5weSB8IDIwICsrKysrKysrLQ0KPj4+IDIgZmlsZXMgY2hhbmdlZCwgODIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+IA0KDQo=

