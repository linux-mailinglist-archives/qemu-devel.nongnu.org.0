Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650845AC1E9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 02:52:06 +0200 (CEST)
Received: from localhost ([::1]:40738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUdrp-0000vF-HH
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 20:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1oUdoG-00068G-I9
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:48:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:17434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1oUdoE-0000Ms-Kw
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 20:48:23 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2840fVpE023647;
 Sun, 4 Sep 2022 00:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=EyQeGvfGjIP9X8Si6ThkWmImWUo0bPucRZjW9vcBwuI=;
 b=HlruF7t/6ZByN9fSUHsYYgTzkKlM0OVTU/71EiCSynWW7ospDh4ckWLLgHc7TiHyvRps
 l/jdMQOY5c9REyWECLGovD2W887wZSX99vf6yVJE2+vWI6jKdH2tlXBdMxHEM6CVcCc8
 iHopZK4hwvAhVofc3Wx15Srsbdh/UIzOuLrLyGD6go94khJxh7vmjJf2J9QEhh8AdMFD
 pgVHOMuve5dIZgUCIl6Ot3fjWHW+VZLNCSRPmY3I0prvlDAWFqQkinhM5RpJR+43zURw
 bsyyVcydaMM8fhg4CvCaKtMdtXk+U3HX24/PceQM16GM3qs2h0bYtMF7MpAHsimH/Gru kg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jby101krg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Sep 2022 00:48:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuxGFkfcMTx0nSFyw3z3jiKREGPis79srbOXmn67MUA94QhuApPoHAXLRDlg0sAcWDVxwt/eNqOkWUhUGT0Tb/m4x225+ZW+/db0iJG7pSvF7tpD3UmxpVvKKCCsQMm9jTvR8y/jv6YYqE7RTOiqJSYz0FPPf4otn+0TbYwoUh5IWLizSAiMSdvRHwmarGY690LjCX+wf3vGKSz/SywktSlYPJlhD84iQ4/nCFE5QlcTNkNG9Q78XoFrpNu3ir3RZsGNtuWmNvOyYsXXWt7Dgec1xjREi1aRYk+QF2799EelO5iydcz+56SQeDU3aSSqQEeT2AxfgCudQeK4MDR00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyQeGvfGjIP9X8Si6ThkWmImWUo0bPucRZjW9vcBwuI=;
 b=go7LFEIDsIfoshVZjjHvZol4+1AYXHOZajn+RgSjcGeHiI6rEoOvT9btmBtGIrx6A6NmogibY4fcJfsME0lAtFvNVJCZhA42CILs0N+qKmuqqp8dGDpj1aZ900COe9qGn6FpLaLgUinuPpvY8xqep4AqZy4PrB7sT+sHmK2ipzdmLHCdbi6TZejyJx+1Hi9p4ArDIYHqEz8YzAVA0A2Ofu1cgO1ybc+f29lAvmWmB5WmqFISmpu7lKIcteKKJnVfVftIplwJRxMuktJFknPNYjD5SD0ErXruvoyUpg1BATOE9TYsRkpZHAKI8AUTEKC0brBA4mdQV2a/oOjBv2Ht6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by DM6PR02MB5017.namprd02.prod.outlook.com (2603:10b6:5:4d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Sun, 4 Sep
 2022 00:48:17 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::41a6:c2ff:ba0d:16ac]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::41a6:c2ff:ba0d:16ac%7]) with mapi id 15.20.5588.010; Sun, 4 Sep 2022
 00:48:16 +0000
From: Brian Cain <bcain@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Taylor Simpson <tsimpson@quicinc.com>
Subject: RE: [PATCH] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Index: AQHYvkn4kxqb0pUjNEyS6HtoMkyeQ63OcRKAgAAB/PA=
Date: Sun, 4 Sep 2022 00:48:16 +0000
Message-ID: <SN6PR02MB420524B7A4013B299C6A07BFB87C9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20220901212931.27310-1-bcain@quicinc.com>
 <65465b46-5423-9c94-7ae9-f2379bcb829c@linaro.org>
In-Reply-To: <65465b46-5423-9c94-7ae9-f2379bcb829c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9b9e636-7764-4a49-f48b-08da8e0f27c6
x-ms-traffictypediagnostic: DM6PR02MB5017:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8uahPMScYnj0PnNTRgjZWFv7SNPYIYPJsgL6TFDx9PQSNJGDjJWXdrVAoo1fPnqFeJaCq8vS8brg9QjulD1+2B8rpntjk1aHLO0jrurRLBvpfCYfVoG0OjHqz4O8IqoFRyp4WQIg6OHjDi7gYlcdAOpA+X9nwKqJ7L4ypQhzWDmO8RMGCqzYwb5SgAUpRr0dRWTqxTPFpyAI13mLeQd5xLrn483x5rB79gXxbVuyCrHnpyWlcyKdm/TI7NPT/q2SLW0LQowm76RVYmx8cpoPGTgSIZ0IEjs+HgzQcgwPlFHEGqpaHROMldrGfiPgd92TWLgWsEHQraJeCINf8r28fZdfVsD4bx9MVyq9cJ6CyzBG1f5RtlHLjpGGz+ydodkwa65A8zqOGnB7w+st1CahupS8XXwP0fPFH2JpIWL0jMl8CSAvp7PAasu3BOsqRyUvpTuW19SK82P3dw+WozLVC3QiLNjPHo4xuaW2Bl4w/hevSk44CYCUqjyIiyWMQseBdiIVnCVoGNBhi6hkpqrecawdsrXKHsZAqy+8Bo2gM1XizxjMhEhapOELMPl81qu+8gb4qyegL8oVPEztxX0U5rgMnprIBeG40fW5lfuqemaPfmIYOlhv5NfLfP8KEplsPIyM3vsDd7udZ4kuk3hW9ypiwelXaDrlvFZme0UmnJ9Iohf/Ygp32/DtFL98qrA5Kn8lFhKvXNyEtBOHhEwy1DhJYqNbBExrfYmEgpd9X1Lbl3ufMJS82zw3asFH3vn5yuh7VTZwMNX6ISJ718xPZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(66476007)(66446008)(8676002)(110136005)(6636002)(316002)(64756008)(55016003)(8936002)(66946007)(5660300002)(2906002)(52536014)(66556008)(38100700002)(76116006)(6506007)(558084003)(38070700005)(26005)(122000001)(33656002)(86362001)(7696005)(9686003)(478600001)(71200400001)(41300700001)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWNabXpaQVlLQW8vdDFJWFdvNndiakx0K2gvQWVXTklpTWlnR3VYeU1iaGlV?=
 =?utf-8?B?VVNmTmp6Skl5Z0dtZFladjRaUnpLenlldXZEQ3FHQ3ZMZTFvYTFqa2xMNWpr?=
 =?utf-8?B?c29lcmczendhS3BzVlA3SDZBR0psSkdKdFZkRDgzaDhuRDVRRVd0UW1VYkJX?=
 =?utf-8?B?ZmU1ZkhXMWN2OElXS0lFOTY2RWQ5RjMvRmFSQTRHNTZHQjZiYXpLRmtMWGJK?=
 =?utf-8?B?UWlWemZUbGl0SjJMMHBoaStxRzBuVUxGbHQ0WmJEeEtBNFMyVVFnVFZaT3JZ?=
 =?utf-8?B?NHFSVGtlRStGWXNsVEI1aFJIUGYzNzhwNHVDbG9DWmNGaFpjdTZtTlJ4b0xG?=
 =?utf-8?B?aFNDZEJuVDgzLzB0dXAzd2NqNHRJSm8zSW9hdDRaejFvaDA0QXl4a1VleUxz?=
 =?utf-8?B?WXd4NGhhN2RjL2ZIRWQxVVkwclNIRHhSZkNrZGZIbDVhNFRhWWxZcGcrTnpo?=
 =?utf-8?B?VkN4aERDelFoeHhlQ2E3cnpvT043dUF4WG1DQlBTQVpzU2dnNUhpY1kvTitj?=
 =?utf-8?B?TUJjT2ZkTlVmOFIyK3N3RVBidWhzZGVlKzRrUW1aMjFqL1p4UVc4NzlKSTBS?=
 =?utf-8?B?c2pZUlE3QmVzRDRkdU5vTzJHcnFiakluQ1hQdWd2TlNBb0MyWTFaQURGS01v?=
 =?utf-8?B?RmN0NUkyL3FUL0RhbTJzRTl6bC9lcURYTFRNcjlidndTWGtUb01kd2toa2Jw?=
 =?utf-8?B?ai9EUUo3ZFVXODgwS0p1UXNWZnc2NHRXWkdaWGEyWU9SZ1lYZGswZmFQRTFX?=
 =?utf-8?B?QUlBYTgybUszeGhvM2NwQlVqN3FYOE5BNmJZczF0QjVxSnFLd29SY090cDNz?=
 =?utf-8?B?QTJBTVc4VDAwb2pvM21ZQTA4R3Z0Zk5rcDBKbHJNRTFpaW9UQ3ZxV2hxUHU5?=
 =?utf-8?B?aWtyL3ZkZ2Q0ZG9IUWNhV1k4QXhZUFpBeWpHU3d1bW1udEhqcFRaZEkzZGhu?=
 =?utf-8?B?RGpSUG0veWNDSTJ4S2FKU0k1MVArMzVNeDA5a2lrWCtVMFMyaDV0L0crVWNF?=
 =?utf-8?B?a3FxWkh3SU9iTDEwckt2NCtSeGpJSzBwRnQ2QjZzWXpkZjlPS0ZIZVdodU1N?=
 =?utf-8?B?RXhxZ2MrRDBhZ0dKRGhWMlJQZ3Q3a2V6NHlWZ0E3RzlPNHBpdm05TmptV0VW?=
 =?utf-8?B?TGJEUi9LbGd6OUZFejIvN3VzTktCK0NGbGVFNVJ6eWN2VzVHMDJiVzQwMHZF?=
 =?utf-8?B?Vnd1ZmxqOWlKZ3ZnUVZTRjBqMkU0SWYyU0FhSmhGalhHcnhZR1FPZW8xQVRk?=
 =?utf-8?B?dDlPWkV0NWNQQklaYXNGZzUzODJ4ZnlHNU9QRE1iRDdvS0tNSHZWMCtWL3c4?=
 =?utf-8?B?dlVEZFdkbVZIWldMVW52MG1oR0NEeW44TDRhYWF2NXp3V3J1enREaUM1YXBn?=
 =?utf-8?B?eFFMcm5NTUdpR2ErZzdUUFRiRGtGU242TnhsNUFOT0lWQTVuR3hHMEYwcE5i?=
 =?utf-8?B?MEkwY2g1Vk05QzNhMzgzdWxTYXBjSkRuQUlRWFN6MEkyVyt3SktoSlVKTE9J?=
 =?utf-8?B?WTNMUjY3alVNZiswOXppTlFjV2Q0QzBHbEhubHVla0VDU1VDKzdBeXJMWnla?=
 =?utf-8?B?cjF1bUgzL3gyY01QNUM3UWFIY1hSSnp5blRib2FsZy9tMFVtOXAwN1ZrMmll?=
 =?utf-8?B?TU1IVHcxWWRra3B6Mnk4Y0VVNUttUGNWWGhWZG5SM1V1K1I3WGpzRXUrajVa?=
 =?utf-8?B?ZkZRdlhpclpCOVNpb2ZuQlZNUmh0TUFNYU9UWUxkVVN1MVpKZkJyZnlZNnhC?=
 =?utf-8?B?anFmVE1nRHU3M3RtN0Y1VWVHMW16aXFRSERaQTQ3MVBBNkFhZE9EcEg4SXoy?=
 =?utf-8?B?WnNCMVFDTnR5ak1rYWlLSHNUdFBBeS80eEdxeS9ZTzV2ZWY2SFhOQ1hrcGw5?=
 =?utf-8?B?eUlQZTh0cXpmUWpVN2pTMDNnWmpmYkdCSXFGQ3VzMnh5R1dvT3AvRFQ2Tm1C?=
 =?utf-8?B?VTR1eDF1WHhaekdxbldXTFBTSk5BZ0IxVm4wbVgrWWp6WWcvM0UxUkJ6bnM5?=
 =?utf-8?B?My9mYTFsNXNUb2FnT2ErcGdlZ2cySS90LzlUYkVIcmNTckU4bW5lZFVNd00z?=
 =?utf-8?B?aHNOT2xLd2hQdldyTnd4RmIxN0ZMaFJhV0VTaHBlTnErK21vd0ZLbEYrVVR2?=
 =?utf-8?Q?s0ZFef/P8uRId0raCnVIqh56V?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b9e636-7764-4a49-f48b-08da8e0f27c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 00:48:16.9194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ZutV7RT4rWOy0Due0eWYq4z50n7e7Xq2YLdQuvwkAfY/S8dlC+2QNiAdZ6IifdlWoktDxEGBkSeS7GBVgO9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5017
X-Proofpoint-ORIG-GUID: zbFeA2ZU7pNzEUfCQRFNzCBdYnZPGKY4
X-Proofpoint-GUID: zbFeA2ZU7pNzEUfCQRFNzCBdYnZPGKY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-03_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=557
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209040002
Received-SPF: pass client-ip=205.220.180.131; envelope-from=bcain@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCi4uLg0KPiBJdCBtaWdodCBiZSBjbGVhcmVy
LCBhbmQgZWFzaWVyIHRvIGluaXRpYWxpemUsIGlmIHlvdSBpbnZlcnQgdGhlIHNlbnNlIG9mIHRo
ZSBtYXNrOg0KDQpPayAtLSB0aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9ucyEgIEknbGwgZ2l2ZSAn
ZW0gYWxsIGEgdHJ5Lg0KDQotQnJpYW4NCg==

