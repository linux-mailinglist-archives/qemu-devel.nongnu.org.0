Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30B51A5A1
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:36:35 +0200 (CEST)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmHzM-0003Vk-CB
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6123628e29=pdel@fb.com>)
 id 1nmHxS-00028M-7O; Wed, 04 May 2022 12:34:34 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:54966
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6123628e29=pdel@fb.com>)
 id 1nmHxP-0002VC-Ha; Wed, 04 May 2022 12:34:33 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 244DvbgJ006423;
 Wed, 4 May 2022 09:34:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=U/YJI53OQ507VjaFIUQnboQBlY3dJr12n/2zdfis6+E=;
 b=KHaEKdtcTOM4EKgdMvp9VpMxGdVvz0rMcJBXJSJXLVQoCnyaFOvVBGmwyQgX1TPVqHE5
 jFMPMPCXFH6TXu4YT2BhTAn+VXGeEfaYPoAqfoyIktt/avXmDujLSXaFSKVBjpfAzuyX
 /kVROPcA3mVbNMHOXvnVp2N6+FrdLmgeA90= 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by m0001303.ppops.net (PPS) with ESMTPS id 3fuqp1t4a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 09:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=he+6VDQ6IoH4+BvD6LPg/02i8ByeQvINrFZOLo4REj8kTOhTNXhrBTHbANbdjvpi5/lVkqdJfN6O/bW4M3a1EOVFUxtjilRqneZewvwL7vOmhraFCR926UZg5x10Vc0oT7qgNoc7VVg7qnPxAwsNnIXlfuIr6LG0jzStwoxtS9OHXmKcBaxOHBKhszA2Yb/9QlTGqx8IdBjRAmKDvYPd3n5jvQVr4QC4iW4yEmHxO9kZMHyNa02aD4qDmrc3pa2OfhA/TEdfcihbNOPdZwpv6oQYOobkSBiRt/zrfzOMNzbx9FGv5qadaBoR7tOqE/YITKxUeOyiLHgvV4FhsOAP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/YJI53OQ507VjaFIUQnboQBlY3dJr12n/2zdfis6+E=;
 b=IVP0HUCgBdkVgIdkLZhMVbA68/lZElDnNKbPnHwdb5cD/F17c6MgCmCC6Q9Y75RNjuRGI710uoHjDEqpYUiUmE+znArgkw/HAlDNqy02o2yRDh1v/jo6s1d+B2IfHUFK7i2Nxe5R7V351eqEuTGRQShOZAIAokMn9XNrEDGazRHZKF57GWo2tTI1Mg1dxcHqpZfp8g4Nvag55LKzBbygocADDX5n/k96qJUw7HWm3YoE7UU9jxmYWCmISW7tmQOd472+m1bDcJk4QmkeRz8+mrkE5x6EOqEtRG3imc/y4A/MsWS3zNehnhZm9jXEUEqrxXotggFip1LygPiZCswlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by DM4PR15MB5453.namprd15.prod.outlook.com (2603:10b6:8:be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 16:34:16 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70e4:6720:69ef:5541%4]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 16:34:16 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Topic: [PATCH v2 1/1] hw/arm/aspeed: Add fby35 machine type
Thread-Index: AQHYX0HIkqOKjoOJ/k+YKhqMRITql60OVaUAgACVbwk=
Date: Wed, 4 May 2022 16:34:16 +0000
Message-ID: <856683F7-3F36-449E-B203-89EC3D876DD9@fb.com>
References: <20220503225925.1798324-1-pdel@fb.com>
 <20220503225925.1798324-2-pdel@fb.com>
 <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
In-Reply-To: <2ab490a2-875d-ae82-38d0-425415f9818c@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ed79b5e-3f04-4dc0-6e0f-08da2debee78
x-ms-traffictypediagnostic: DM4PR15MB5453:EE_
x-microsoft-antispam-prvs: <DM4PR15MB54531630D9C1DF18D17C0C92ACC39@DM4PR15MB5453.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JOX+hJXwYO3IfVNNOI3EWI8kgk7nSks0yskKiTZiRX40mhbh98txxvuoUC0rA/rKr8F+hD0T2d52XuDKg/TX1QH+PiTIrHXNQEoJn6QE4xIOAqBmEG0uMm1ulkTB5j0TikLF6wMxevEhbWpaU9Cg29lh1uaXQpRvUu7bkz3djOnr6+zen2I2saQzJdaxBlc76NF355jgnAMwlFvsEUQ9dSv4IbAI/81/pWHutiX5klbt7FQjlWbMg5Fvr2rk2JXjhvm3ne36UhYs3zXp+lkaC83EkqefrtQcN/OS+NHmhDvcZsUMUHnGTfH6YlpOSXLaiqjyIbuZprf2vL8xzoi9/+4NBDufSE3YaKcOPsIhD9tALPsvBtE/ycpFPDnZy4EggfPGPRwR9w+mDrsw6NvxUW+dbVneDxeeOGHOVfulrNp9xykIPng9IitIyJ+kbka1QT2/oo7suw1fKn8Ek4ucyxMK7PGF4DlBrvkRvEDfVLleZB5ERbk4njgG35PF4oLvT5kYItvcjfrKaaB6r1tm6dC5czi5j1CGQyCJxtPNz4ZXrdaw47OGlIbWEY90daoHdxl7ll2RGF84v1TVi2DhU5BzVoDmoDr68wZI2+BH0DUbC6H9X80LaOVh81t1Yi+GcJDWlRcLiB0CC33W1ReaSi9TTvRLyoA0EQG2DLktGOsigzG6K8YcgBY+rzWAAtbm01jrl1Uo0sFdotY/mQ4wWqprv/64uaTtSzBfX7rN1SGpsFblpVK+1KbC0fKJwiFnDry0CRPsXapiMLplWEbxGl2de2dsl9Sfep+E4mQihEmqtHWwW7E3Y3bju8g93UmKMUAVSTdkZICrZ/8xGnrji//m0yALXmpC1o5881YZXU8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(2906002)(508600001)(5660300002)(6916009)(6506007)(966005)(6486002)(54906003)(26005)(86362001)(6512007)(53546011)(8676002)(66946007)(66446008)(66556008)(64756008)(66476007)(4326008)(33656002)(36756003)(316002)(71200400001)(38100700002)(122000001)(38070700005)(186003)(83380400001)(2616005)(8936002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGVLRkNvQXRIRFo5TVJtVlVsWHlTdXYyMjF1V043S2dKbWtDd2tqeXJqNk9p?=
 =?utf-8?B?NXZJNlBCbnYyRUhvZDNMVVI2aG1UbmxiNEkzVUFoRkZBUWxwejhwMTRGTDF5?=
 =?utf-8?B?Mk5FME5KMjFLVUp5SWQvdExQTjJycEdZODR5cExiTldtYXdGWnJaQkp0WXdE?=
 =?utf-8?B?eWJlakgvcHhVcUJFdXRJSTl5aWFveW0xZ2tseHBJQ2FtMWp1eGtXTWx0RTlV?=
 =?utf-8?B?VXpNeDVHakRiUHZYelpQeU1jZUQrSzZCSkQ3SG04MHRTUHYvS0o3K1RvODlh?=
 =?utf-8?B?aXBkNmxCVDZJNlVNNUpqQlorcVdFQVFmTENOWGlUdzhOTGZmOVFBUi9RSk1L?=
 =?utf-8?B?Q0xNZFVKWVdEMVZPQ1lmYk9Oa3h5bSt1VksxK0hCVmlxaGRDZ0FOaFdaT1p5?=
 =?utf-8?B?MGtOTmdJd3M0TUQvQ3RjVEpjTnJ6aUpCeWg4Nm5KTTM5bFZRbmtpVW1ncDlp?=
 =?utf-8?B?Ny9IakdVYjRFaThyZGhSVG9mY0U2NW0xb0hsTkJDRUJkalVwSWFudk1tVW9y?=
 =?utf-8?B?NjB4ZVdWeVI2T3VDRk1DalpSMmFEcGh4Q2I0REI0YWQ2SlVzYU5qWXdYbnFE?=
 =?utf-8?B?TGdxbkVsaXZmQzRmVGZaUkxudWVwYWQ0K2txcnBxbEdtYVpUUDkyQ1pXbC9p?=
 =?utf-8?B?dkphZU9zaXFFZ0h3dG81cHA0OHc4NC9FYU1KUENEbjZjdkxXMHR2bmplaGJL?=
 =?utf-8?B?MW53NU5yWWozNHl0bEFaNm0ydm4ydDY0M0VBTkE2TmFIR1U4bTI0WS92SzZ3?=
 =?utf-8?B?RGJVTi9XUVBzVlpod1FPYmhHTGFIU2Y5R3o4eDRqS01SVnhsU1BucFdnZFVh?=
 =?utf-8?B?dlVlQUxSNlVKRUlidWMxYWtGdGVBc1Jia1hQa3lkRFgxd3VjQ2kwQW9HTVgx?=
 =?utf-8?B?N3dnaXlWQXd3ck1zOGt2Nkx5QmJNTVVJQnRWTFcxeThJYzRvMTFUVlZKTlRI?=
 =?utf-8?B?eWFZaTNhUEdHcEJUclhIN2hPVmZRRTZvZ1hFalVNRUpCNXJzMFltS2ZOU1M0?=
 =?utf-8?B?Tnp1S2kzZTZVUW5KZDFxSGp2M3JtZFJLODVIQm51azBjYWFJMTBIUVhDR3Ax?=
 =?utf-8?B?Z3JuWWZFeDhEblNlT3lUVThkL1lRR1hUS1BwQS9RNTlBN3F1WW5LT1U2dUll?=
 =?utf-8?B?SHZpQXBLMTlEUmpZbDliVHdRQlBRMHcxMXJ6UGhQYkpZNDlnbjRpaGJYN1ho?=
 =?utf-8?B?eVdnMHlRQy9OS3ViRXFzUzdPQ054bmdDVnNGMmZXcjZKZDZHSW92b3ZxMlNT?=
 =?utf-8?B?aHpZL3RxRUZiMFU3NW45YytERnlnWGR2NUFYWXp2WXkzYVBVUjFNTkIrMC9L?=
 =?utf-8?B?RVhCaFFlRXJXcVRqb0w0OXVTWjRRWjFpMzVXaGRoclMwQ2liQVVuQ1dGMGs1?=
 =?utf-8?B?TUJFZndIV1ZGVHdlSU1jRjJtVSs2TmRLQjNtcWUrVHpYNWJCdG4veDFnZTZN?=
 =?utf-8?B?U1lveWlhaDl1b05tSDBNVVdMaGNtelFxK2hjMmt5V2xzR1Z6T21CRUJ4MG05?=
 =?utf-8?B?cVBweE11YzJ6bzI0WnByVUdJQmQ1Y2h3VnZPMXFGK1ROMGlOUTIyNUJ2dG9j?=
 =?utf-8?B?bDlPYXFiTThHbldrdmhwcVk0MjY0cGhtR2tOVHBESU1KMy9DYWwwSnZVblA0?=
 =?utf-8?B?WkUyWHduRzY1Zk5Oa3FrTEJCOGh5SDV3SGpMUndzN2tsUXB3dDVtVC90NkRy?=
 =?utf-8?B?NE9Eb2Jub3lKOW9tZzAraWVmckRnRWNTUmh2b1dFWFZTdUdUUkNVdzhOZVZE?=
 =?utf-8?B?SWowTEtkbm9FUDlROFA4OUNHak9GemtHMUhzM0U1Y2VBM3M0UUdBclNtUGEr?=
 =?utf-8?B?SmFmMFV6c3JwNWk4dDJUbkFlRHNOWVplTzRNTFplUEFqenQ2SzBvQjg5V2hF?=
 =?utf-8?B?RU9FcmtnVDJIMGR4ZVNjdnMxc2Rrd05mdWRPYm1FcUFqNlV6bEZjUmlCMk1h?=
 =?utf-8?B?N2UvTWppdWJDenI4MTZucGlKd0Zxa0ZMQXZuRHFaMVRvejV5b0o0ekcvS0lO?=
 =?utf-8?B?ZlZEMlFmL2dkeGFkMHpYaitNK0FvQmFGWFlwMVpPWC94VDhKMVp6dWR6UTlE?=
 =?utf-8?B?QW1RaXd0WnRhUlZFRUlkWjNIV1Bob3NNa050ZnVWR1J3c21oTjcxem1PQzBG?=
 =?utf-8?B?cXNPWk5xL1NEMUlwNzFDb2RBa05tRTJySEp0M1NVRVh6REY3WTFUZEdoMnI4?=
 =?utf-8?B?Q2JRWmNSRUcxNXk3dUFZTXUwZ2Zoa3JTakdYcTkwVmh3NzFpRkFIaUcvNWNa?=
 =?utf-8?B?Zit4QUZ1a1h0MER2aElseDNqcWdxSURjdXphcVJMSmlpRVl0WUNsaUZ5L1k0?=
 =?utf-8?Q?E/14rB64f1DsSniM0K?=
Content-Type: text/plain; charset="utf-8"
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed79b5e-3f04-4dc0-6e0f-08da2debee78
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 16:34:16.7155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3AOAg/BmfZWiFHbXcMcCSyliKqlxqY8A8DriSJRVPTUkFo6oc9fQKZopTCOOvlSl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR15MB5453
X-Proofpoint-ORIG-GUID: Pr8_z6sXkRnwCwRUACLUMdVqLkXFz-EX
X-Proofpoint-GUID: Pr8_z6sXkRnwCwRUACLUMdVqLkXFz-EX
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6123628e29=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IE9uIE1heSA0LCAyMDIyLCBhdCAxMjozOSBBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0Br
YW9kLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiA1LzQvMjIgMDA6NTksIFBldGVyIERlbGV2b3J5
YXMgd3JvdGU6DQo+PiBBZGQgdGhlICdmYnkzNS1ibWMnIG1hY2hpbmUgdHlwZSBiYXNlZCBvbiB0
aGUga2VybmVsIERUU1sxXSBhbmQgdXNlcnNwYWNlDQo+PiBpMmMgc2V0dXAgc2NyaXB0c1syXS4g
VW5kZWZpbmVkIHZhbHVlcyBhcmUgaW5oZXJpdGVkIGZyb20gdGhlIEFTVDI2MDAtRVZCLg0KPj4g
UmVmZXJlbmNlIGltYWdlcyBjYW4gYmUgZm91bmQgaW4gRmFjZWJvb2sgT3BlbkJNQyBHaXRodWIg
UmVsZWFzZSBhc3NldHMNCj4+IGFzICJmYnkzNS5tdGQiLiBbM10NCj4+IFlvdSBjYW4gYm9vdCB0
aGUgcmVmZXJlbmNlIGltYWdlcyBhcyBmb2xsb3dzIChmYnkzNSB1c2VzIGR1YWwtZmxhc2gpOg0K
Pj4gcWVtdS1zeXN0ZW0tYXJtIC1tYWNoaW5lIGZieTM1LWJtYyBcDQo+PiAgICAgLWRyaXZlIGZp
bGU9ZmJ5MzUubXRkLGZvcm1hdD1yYXcsaWY9bXRkIFwNCj4+ICAgICAtZHJpdmUgZmlsZT1mYnkz
NS5tdGQsZm9ybWF0PXJhdyxpZj1tdGQgXA0KPj4gICAgIC1ub2dyYXBoaWMNCj4+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYy1saW51eC9ibG9iLzQxMmQ1MDUzMjU4MDA3
MTE3ZTk0YjFlMzYwMTVhZWZjMTMwMTQ3NGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1m
YWNlYm9vay1mYnkzNS5kdHMNCj4+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3Bl
bmJtYy9ibG9iL2UyMjk0ZmY1ZDMxZGQ2NWMyNDhmZTM5NmEzODUyODZkNmQ1YzQ2M2QvbWV0YS1m
YWNlYm9vay9tZXRhLWZieTM1L3JlY2lwZXMtZmJ5MzUvcGxhdC11dGlscy9maWxlcy9zZXR1cC1k
ZXYuc2gNCj4+IFszXSBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYy9yZWxlYXNl
cw0KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+IA0K
PiBSZXZpZXdlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCg0KVGhhbmtz
IQ0KDQo+IA0KPiBhIHF1ZXN0aW9uIGJlbG93LA0KPiANCj4+IC0tLQ0KPj4gdjI6IFJlbW92ZWQg
YXZvY2FkbyB0ZXN0LCB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlLg0KPj4gIGh3L2FybS9hc3BlZWQu
YyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQ0KPj4gZGlmZiAtLWdpdCBhL2h3
L2FybS9hc3BlZWQuYyBiL2h3L2FybS9hc3BlZWQuYw0KPj4gaW5kZXggYTc0YzEzYWIwZi4uNzI1
YzE2OTQ4OCAxMDA2NDQNCj4+IC0tLSBhL2h3L2FybS9hc3BlZWQuYw0KPj4gKysrIGIvaHcvYXJt
L2FzcGVlZC5jDQo+PiBAQCAtMjEsNiArMjEsNyBAQA0KPj4gICNpbmNsdWRlICJody9taXNjL2xl
ZC5oIg0KPj4gICNpbmNsdWRlICJody9xZGV2LXByb3BlcnRpZXMuaCINCj4+ICAjaW5jbHVkZSAi
c3lzZW11L2Jsb2NrLWJhY2tlbmQuaCINCj4+ICsjaW5jbHVkZSAic3lzZW11L3Jlc2V0LmgiDQo+
PiAgI2luY2x1ZGUgImh3L2xvYWRlci5oIg0KPj4gICNpbmNsdWRlICJxZW11L2Vycm9yLXJlcG9y
dC5oIg0KPj4gICNpbmNsdWRlICJxZW11L3VuaXRzLmgiDQo+PiBAQCAtOTUxLDYgKzk1MiwzNSBA
QCBzdGF0aWMgdm9pZCBibGV0Y2hsZXlfYm1jX2kyY19pbml0KEFzcGVlZE1hY2hpbmVTdGF0ZSAq
Ym1jKQ0KPj4gICAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbMTJdLCBUWVBFX1BDQTk1
NTIsIDB4NjcpOw0KPj4gIH0NCj4+ICArc3RhdGljIHZvaWQgZmJ5MzVfaTJjX2luaXQoQXNwZWVk
TWFjaGluZVN0YXRlICpibWMpDQo+PiArew0KPj4gKyAgICBBc3BlZWRTb0NTdGF0ZSAqc29jID0g
JmJtYy0+c29jOw0KPj4gKyAgICBJMkNCdXMgKmkyY1sxNl07DQo+PiArDQo+PiArICAgIGZvciAo
aW50IGkgPSAwOyBpIDwgMTY7IGkrKykgew0KPj4gKyAgICAgICAgaTJjW2ldID0gYXNwZWVkX2ky
Y19nZXRfYnVzKCZzb2MtPmkyYywgaSk7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgaTJjX3Ns
YXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzJdLCBUWVBFX0xNNzUsIDB4NGYpOw0KPj4gKyAgICBpMmNf
c2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbOF0sIFRZUEVfVE1QNDIxLCAweDFmKTsNCj4+ICsgICAg
LyogSG90c3dhcCBjb250cm9sbGVyIGlzIGFjdHVhbGx5IHN1cHBvc2VkIHRvIGJlIG1wNTkyMCBv
ciBsdGM0MjgyLiAqLw0KPj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbMTFdLCAi
YWRtMTI3MiIsIDB4NDQpOw0KPj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbMTJd
LCBUWVBFX0xNNzUsIDB4NGUpOw0KPj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNb
MTJdLCBUWVBFX0xNNzUsIDB4NGYpOw0KPj4gKw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQo
aTJjWzRdLCAweDUxLCAxMjggKiBLaUIpOw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJj
WzZdLCAweDUxLCAxMjggKiBLaUIpOw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzhd
LCAweDUwLCAzMiAqIEtpQik7DQo+PiArICAgIGFzcGVlZF9lZXByb21faW5pdChpMmNbMTFdLCAw
eDUxLCAxMjggKiBLaUIpOw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzExXSwgMHg1
NCwgMTI4ICogS2lCKTsNCj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAgICogVE9ETzogVGhlcmUg
aXMgYSBtdWx0aS1tYXN0ZXIgaTJjIGNvbm5lY3Rpb24gdG8gYW4gQVNUMTAzMCBNaW5pQk1DIG9u
DQo+PiArICAgICAqIGJ1c2VzIDAsIDEsIDIsIDMsIGFuZCA5LiBTb3VyY2UgYWRkcmVzcyAweDEw
LCB0YXJnZXQgYWRkcmVzcyAweDIwIG9uDQo+PiArICAgICAqIGVhY2guDQo+PiArICAgICAqLw0K
PiANCj4gDQo+IEhhdmUgeW91IGNvbnNpZGVyZWQgZXh0ZW5kaW5nIHRoZSBlbXVsYXRpb24gdG8g
aW5jbHVkZSBhIEFTVDEwMzAgU29DDQo+IGluIGEgbGFyZ2VyIG1hY2hpbmUgPw0KPiANCj4gVGhl
IEFTVDEwMzAgU29DIGlzIG1lcmdlZCBhbmQgSSB0aGluayB0aGF0IFFFTVUgY291bGQgcnVuIGEg
Y29ydGV4LW00DQo+IENQVSBhbmQgYSBBNyBDUFUuIEEgKyBSIENQVXMgaXMgc3VwcG9ydGVkIChY
aWxpbnggYm9hcmRzKS4NCj4gDQoNCkFzIGEgbWF0dGVyIG9mIGZhY3QgeWVzISBJIHRlc3RlZCBi
b290aW5nIG91ciBPcGVuQklDIFplcGh5ciBrZXJuZWwgbGFzdCB3ZWVrIHdpdGggdGhlIDEwMzAs
IHRoYXQgd29ya2VkLiBJIGFsc28gdXNlZCB0aGUgZXhwZXJpbWVudGFsIGkyYyBtdWx0aS1tYXN0
ZXIgcGF0Y2hlcyBmcm9tIEtsYXVzIHRvIG1ha2UgYSBpMmMtbmV0ZGV2IGRldmljZSB0aGF0IGNv
bm5lY3RzIHR3byBzZXBhcmF0ZSBRRU1VIGluc3RhbmNlcyB0aHJvdWdoIGEgc29ja2V0IGFuZCBz
ZW5kcyB0aGVpciBpMmMgbWVzc2FnZXMgYmFjayBhbmQgZm9ydGguIEkgd2FzIGFibGUgdG8gdGVz
dCBhIGJhc2ljIE1DVFAgdHJhbnNhY3Rpb24uDQoNCknigJltIGhvcGluZyB0byBoZWxwIGhvd2V2
ZXIgcG9zc2libGUgd2l0aCBtZXJnaW5nIEtsYXVz4oCZcyBjaGFuZ2VzLCBhbmQgdGhlbiBwcm9w
b3NlIHRoZSBpMmMtbmV0ZGV2IHRoaW5nIHRvby4NCg0KPiBUaGFua3MsDQo+IA0KPiBDLg0KPiAN
Cj4gDQo+PiArfQ0KPj4gKw0KPj4gIHN0YXRpYyBib29sIGFzcGVlZF9nZXRfbW1pb19leGVjKE9i
amVjdCAqb2JqLCBFcnJvciAqKmVycnApDQo+PiAgew0KPj4gICAgICByZXR1cm4gQVNQRUVEX01B
Q0hJTkUob2JqKS0+bW1pb19leGVjOw0KPj4gQEAgLTEyOTMsNiArMTMyMywzNSBAQCBzdGF0aWMg
dm9pZCBhc3BlZWRfbWFjaGluZV9ibGV0Y2hsZXlfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2Ms
IHZvaWQgKmRhdGEpDQo+PiAgICAgICAgICBhc3BlZWRfc29jX251bV9jcHVzKGFtYy0+c29jX25h
bWUpOw0KPj4gIH0NCj4+ICArc3RhdGljIHZvaWQgZmJ5MzVfcmVzZXQoTWFjaGluZVN0YXRlICpz
dGF0ZSkNCj4+ICt7DQo+PiArICAgIEFzcGVlZE1hY2hpbmVTdGF0ZSAqYm1jID0gQVNQRUVEX01B
Q0hJTkUoc3RhdGUpOw0KPj4gKyAgICBBc3BlZWRHUElPU3RhdGUgKmdwaW8gPSAmYm1jLT5zb2Mu
Z3BpbzsNCj4+ICsNCj4+ICsgICAgcWVtdV9kZXZpY2VzX3Jlc2V0KCk7DQo+PiArDQo+PiArICAg
IC8qIEJvYXJkIElEICovDQo+PiArICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1Qo
Z3BpbyksICJncGlvVjQiLCB0cnVlLCAmZXJyb3JfZmF0YWwpOw0KPj4gKyAgICBvYmplY3RfcHJv
cGVydHlfc2V0X2Jvb2woT0JKRUNUKGdwaW8pLCAiZ3Bpb1Y1IiwgdHJ1ZSwgJmVycm9yX2ZhdGFs
KTsNCj4+ICsgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29sKE9CSkVDVChncGlvKSwgImdwaW9W
NiIsIHRydWUsICZlcnJvcl9mYXRhbCk7DQo+PiArICAgIG9iamVjdF9wcm9wZXJ0eV9zZXRfYm9v
bChPQkpFQ1QoZ3BpbyksICJncGlvVjciLCBmYWxzZSwgJmVycm9yX2ZhdGFsKTsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIHZvaWQgYXNwZWVkX21hY2hpbmVfZmJ5MzVfY2xhc3NfaW5pdChPYmpl
Y3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICBNYWNoaW5lQ2xhc3MgKm1j
ID0gTUFDSElORV9DTEFTUyhvYyk7DQo+PiArICAgIEFzcGVlZE1hY2hpbmVDbGFzcyAqYW1jID0g
QVNQRUVEX01BQ0hJTkVfQ0xBU1Mob2MpOw0KPj4gKw0KPj4gKyAgICBtYy0+ZGVzYyAgICAgICA9
ICJGYWNlYm9vayBmYnkzNSBCTUMgKENvcnRleC1BNykiOw0KPj4gKyAgICBtYy0+cmVzZXQgICAg
ICA9IGZieTM1X3Jlc2V0Ow0KPj4gKyAgICBhbWMtPmZtY19tb2RlbCA9ICJteDY2bDFnNDVnIjsN
Cj4+ICsgICAgYW1jLT5udW1fY3MgICAgPSAyOw0KPj4gKyAgICBhbWMtPm1hY3NfbWFzayA9IEFT
UEVFRF9NQUMzX09OOw0KPj4gKyAgICBhbWMtPmkyY19pbml0ICA9IGZieTM1X2kyY19pbml0Ow0K
Pj4gKyAgICAvKiBGSVhNRTogUmVwbGFjZSB0aGlzIG1hY3JvIHdpdGggc29tZXRoaW5nIG1vcmUg
Z2VuZXJhbCAqLw0KPj4gKyAgICBtYy0+ZGVmYXVsdF9yYW1fc2l6ZSA9IEZVSklfQk1DX1JBTV9T
SVpFOw0KPj4gK30NCj4+ICsNCj4+ICAjZGVmaW5lIEFTVDEwMzBfSU5URVJOQUxfRkxBU0hfU0la
RSAoMTAyNCAqIDEwMjQpDQo+PiAgLyogTWFpbiBTWVNDTEsgZnJlcXVlbmN5IGluIEh6ICgyMDBN
SHopICovDQo+PiAgI2RlZmluZSBTWVNDTEtfRlJRIDIwMDAwMDAwMFVMTA0KPj4gQEAgLTE0MTEs
NiArMTQ3MCwxMCBAQCBzdGF0aWMgY29uc3QgVHlwZUluZm8gYXNwZWVkX21hY2hpbmVfdHlwZXNb
XSA9IHsNCj4+ICAgICAgICAgIC5uYW1lICAgICAgICAgID0gTUFDSElORV9UWVBFX05BTUUoImJs
ZXRjaGxleS1ibWMiKSwNCj4+ICAgICAgICAgIC5wYXJlbnQgICAgICAgID0gVFlQRV9BU1BFRURf
TUFDSElORSwNCj4+ICAgICAgICAgIC5jbGFzc19pbml0ICAgID0gYXNwZWVkX21hY2hpbmVfYmxl
dGNobGV5X2NsYXNzX2luaXQsDQo+PiArICAgIH0sIHsNCj4+ICsgICAgICAgIC5uYW1lICAgICAg
ICAgID0gTUFDSElORV9UWVBFX05BTUUoImZieTM1LWJtYyIpLA0KPj4gKyAgICAgICAgLnBhcmVu
dCAgICAgICAgPSBNQUNISU5FX1RZUEVfTkFNRSgiYXN0MjYwMC1ldmIiKSwNCj4+ICsgICAgICAg
IC5jbGFzc19pbml0ICAgID0gYXNwZWVkX21hY2hpbmVfZmJ5MzVfY2xhc3NfaW5pdCwNCj4+ICAg
ICAgfSwgew0KPj4gICAgICAgICAgLm5hbWUgICAgICAgICAgID0gTUFDSElORV9UWVBFX05BTUUo
ImFzdDEwMzAtZXZiIiksDQo+PiAgICAgICAgICAucGFyZW50ICAgICAgICAgPSBUWVBFX0FTUEVF
RF9NQUNISU5FLA0KPiANCg==

