Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A99401C56
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:34:15 +0200 (CEST)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNElK-0004Mz-6D
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNEU9-0002tu-LL; Mon, 06 Sep 2021 09:16:30 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:55860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNEU7-0003D6-5M; Mon, 06 Sep 2021 09:16:29 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 186DE7u3003585; Mon, 6 Sep 2021 06:16:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Y/T3gmVknihB0WBaQT+4xPIM6+/9v6TX7qTZDXa4OHE=;
 b=KSCxce0tO3P9LCum75y9553yJpKDaT9U4siFbdACP+LyXe7n9v56VuH4IoXqtzcFRgH0
 htiHNBMDaNnQglL4GSRoKqQ0ZbEK4EFnWM1joJF63tzKN1HgakNXJ+lOApoOCgLI3LBY
 5xHVTJXZOQz+6YfDWGd8DzYdTrbpmZkiMAc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3av6mx597a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Sep 2021 06:16:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 06:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWCG6U4eKmSaZqyjEIML5i89iQjiix4T/sn370llINEUfZnqhRpgNzTW5z8OOTvRZkSfXOAlMn+DekJ2TvJtIj+Py11STVPRV28wPcCzHe+8ZAGz49qi0VH2JENSbNejIJNO6BIBnGhWS9hffw2Tx4Y4r9wcCXKKtSfT3noaaRPldVixlfqMxcdXdKTNjWbTihWBA7O2giosujOUAoJBhH9nItuLe9b6+oD6NlzBTBBS4KVrJxjzWGKxLW4GLS97ob2VsStPUjEAOeEQr61aDq8Q0z5+x8UKpqXzWtzaIZC3A9UA154yFpxY44RVNSvpQk+jCiTrSc2oQ8FphhcE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=frW+ewDoMGdCThJRPIK1J+RIBf1kdqNL+AWpLI4HyQ4=;
 b=EtxWqEy/QKnzVnAfcKWQ9pWkWJOyjbKtupcRZ3KP0eGX3EwZIjD8NS8H87HGRrpBh25BD8BAB5aSfF434vt9bLxJ93zhyJuFcQQczTs/FQVoH/gSlhyzCimNh5pJg+xXd6jM3rrahJI8sjU2bZ/hshP42dTsSF7kFaPTmlVqFe425h2XbwgKInJGEPMVXwshWlPLBHf6NywiHoCx14d2RO3GdFliK3PisVLwy9xCFYB57qj4EN8pdz09rMKj5Em/WBD7+Cr7n3/iB4XlXjmRjh99PDONkDsaUjlvgpMNJQSWAdB/XCIThRQKF4N+GAT8ei2xRi8wqRB9qA7ZEaPeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4326.namprd15.prod.outlook.com (2603:10b6:a03:335::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 13:16:10 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:16:10 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
CC: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Cameron Esfahani via <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "patrick@stwcx.xyz"
 <patrick@stwcx.xyz>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3] hw/arm/aspeed: Add Fuji machine type
Thread-Topic: [PATCH v3] hw/arm/aspeed: Add Fuji machine type
Thread-Index: AQHXooei3LcXT9sUi0e5ZKxfK7+Au6uWungAgABDL4A=
Date: Mon, 6 Sep 2021 13:16:09 +0000
Message-ID: <2F2F44C6-4817-4D58-A7A0-496446AC77AF@fb.com>
References: <20210905185535.3108281-1-pdel@fb.com>
 <df253697-2a94-0806-3004-ac0131ff5992@amsat.org>
In-Reply-To: <df253697-2a94-0806-3004-ac0131ff5992@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd74f085-1996-4234-db41-08d971387e46
x-ms-traffictypediagnostic: SJ0PR15MB4326:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR15MB4326B780D668FA9A5F8FF7C2ACD29@SJ0PR15MB4326.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: biNAkEFIhz+PW1sYyBSK+vcvURVRmzyBQRPxYUQ/gj7ZMLeGPM4AWh1PkrPktm8iWWTZeZ8FkQcg/CqKRtKMraE56y8aJS2voAWNbs8cFo2snjbAQepwGg1iAU9JzV0BWUPVVpXD+2xjRynlOKj2LLwvTVxEemAIN8xsQOt2VtNdYN4CX8ceSbfYd57ltKsnP7T2rkplDF4GkpULD+LaLd4zUDKHNf7t5MmQeAGp4Z5/KJzR5EPYTigPd43S9/uaYPjNMoRKJY4fx6L5AkXgGlRUgvsRVBhXmfAFigY2bucXTFlLIXSrOELppw/6eeQNboj5Aqo1fOrcfUlyjpHMIwthMNv9V+2jG564Zjn2fTmHWKIKdw5k5inWEOr8h0Fn78T3Ck79QmrhXRtoda5uXaYXclyzfZxexJohttjtTRzvrYkZc6kPTbvmetH74my+sMFb9nygDoYXYpiRBa9rsKS18cRDjzBxVWirB+3s74KrUVCruRNXNYkdlZlcIEzi3WtpkMyfKxrtQo1QUnT2Tgb3EAaO0oF/fRmMEBrumQtfeAl7kvmeEz8kGvEV3S4Vc7YMWYK5uNY26u+IEAbCmYUlCXoboGyCCjRpL3eimSQzkQwzMHEd/jpVGqU0Nverf8ul4m1mIFW3rvtNFZ4x9FOphSgoEZwhpXs5AuS/wX8MbEckLhSSMqIkEmym1D3smBanJZLyPEP+onItSNXjEw2t3nrWRnFRjfs96/HXA8oUBkqmW6ujpRF95FyMWmbYBOXZlwvAIscnBmCx2vOYJErDhwlDmLphj4vMCKWa9MpMnel3BcQ/IkqQnfzMUaO+f/j5VrqRQFyxm6VDQA2HdNoEE5woUxlubOjN7bKnO+s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(38100700002)(66476007)(122000001)(64756008)(2616005)(5660300002)(71200400001)(66446008)(38070700005)(83380400001)(8936002)(4326008)(66946007)(2906002)(316002)(53546011)(8676002)(6506007)(66556008)(36756003)(478600001)(186003)(6512007)(76116006)(54906003)(6916009)(6486002)(86362001)(966005)(33656002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjhDN3krdnhZZy9EWjgzL0NBbTd0VmV6R0lsUzduTHdNTFVtWldDa0V5YW9M?=
 =?utf-8?B?M05zZ0dLNVMxNzRMbGhGY1JMMWtaUGhEVUl4TjdSY2lleTFhQkw2dDdTd1la?=
 =?utf-8?B?N1NmL3pJU3pnWng5UWlOOW0vZTJpa3ZvSCtZcU5vUjVwanJjQzJVUVRmMyt2?=
 =?utf-8?B?SXlzb2UrOHR6eEJ0NGN4VjRQUVcreURCN0xBWGJvVkltM0h3YVlpYzdlc2po?=
 =?utf-8?B?UFZvSVBQUlhiU0JOMzBXancrV1pxaStuSmFITk9mWnd0NXdpaVV1Z1lmaTJH?=
 =?utf-8?B?bjRITVhVN1NVQTUvcTQrdGFlVGtzcVI4RW00U1pTRzA4S3NRaXQ1MU9KeDN5?=
 =?utf-8?B?NVduaHZqUEJXT3B4bHVSdDU5eVVoVWNNcGRxZjFqdE04V1cvajRmZTZ4M2g0?=
 =?utf-8?B?bHFJRFlLNFRrR3RwWndNNzVkd0ZFVlBBaEh0OFI1M1NaMXhNT1dMdnFqMzlm?=
 =?utf-8?B?WVQ2ZEwvVXoxUFlkTnhreTRWZk1UbGs5bjVBak9DR1FrWWJnc1RmQ05DMHhR?=
 =?utf-8?B?MURRMHMrdUpGWGExUVlwNkNZZlY0NGR0bWNGaHhFT295c1h2N2NJNmZ6a1Jp?=
 =?utf-8?B?S2dYSjJzNG1razBiZDUvSjhRL3czRVRlVkZSMHlSM3ZZRFRxYjlqVFZxT3VC?=
 =?utf-8?B?dU9ON1pCdk9LY3BkU3FLSGdKdnoraFJlNVRlRFc4aTlrWkliNGszaXVHTncx?=
 =?utf-8?B?dEhDUlJaT1lpSHh0UHh1UE15NlRoZ0dRLzUxTEFGZ2E4QlhkS1Rpdmx2UVNI?=
 =?utf-8?B?aE5aVXR3Wnc4OExMWXBjcEEwLzFRckNPR0owM3h3bGJPenE3M1ZFQjAvbUZ6?=
 =?utf-8?B?bEl2dWJNVFR4bmtoUHlHVUk5OUdFVnJIYTJmeUcvaTMwM3pnYTM2RUtyR01R?=
 =?utf-8?B?ZStFQTFaV2M4dCtJbUx5OExlMlNPRFJRelJsVkRDbEpqaHhEaDJqMDMxcmpy?=
 =?utf-8?B?c3FaZmZ2elY5eVdnRXk1STNYNmdLcVN6Z3RKT2wzMFRadWxUQy9QM0tnTGsw?=
 =?utf-8?B?Q0czTUN5d1RLdlp6SzJ4bmp4amllU2F3bnpMcTBnTmVkWVRHK1dHVWtBMlRX?=
 =?utf-8?B?SEhzaVAydXZ6SlVIcmVGRnpOdG1aT1dCQzRIalltUXlobU55S2pjaUxZUzVF?=
 =?utf-8?B?ME1pT2VyV2g4RDU4dk85dXhFYzR4b2ZUSVdvRlFPTVl5NEgrOUhOaU90bFZ3?=
 =?utf-8?B?WmJNcStTbmRkK3ZYTkRHY3p1Snh4bHlRTldXdUVReE1NWjRUb0lhVnpwYnEw?=
 =?utf-8?B?TWRXNVB4MlgwbUlia3FWOXJZQ25jbGpBOGdnUWxtaERNY2R4R0JRZEk3UGxP?=
 =?utf-8?B?OWpldDVyWlhvT0tkUzNmR0NlSk1aVThleWVHMVZiUWZGeE5BVWNwZ3p4bjNU?=
 =?utf-8?B?YllaZ1VSMk9tY0JkRzVHSlRjWW9wSE9jd1FibGlsdlMxQUs0SDV4MGtScTR5?=
 =?utf-8?B?TElaejRiVEZDNXJ3WnkzZXhUalBHMnBaMWdxd2p4ZmdXNDNxdHlZRStnbjdT?=
 =?utf-8?B?emJDYkM2N1VUeWsrUkpUaTE1RXp5a083bVJBWDUvcDRwOWhnUkN0VTFFRy9p?=
 =?utf-8?B?cWF2TmRmY0Q5Yzg3dVlsQmZDc2ZxOTlROVVoZWlHV1F2V0w1dWNsM1UzVG5C?=
 =?utf-8?B?Wm9rU01xK1M4dVNFSlI0b3Zna0xXME54K1VFM0NweUZpN2puVkh5NWp1dFFD?=
 =?utf-8?B?WjcvSkplaitJWEtrSXZURE5sZlhLUDQwNm9WR0xWOWpsMHhseXV4V2pKWnYv?=
 =?utf-8?B?UzcwbjErbkdQZmtWakZmRHd2aGhhYzVya0JUWFNNU2lOeFlTdzZ1TjF0bmlm?=
 =?utf-8?Q?WQ+vSHeLL9wiqHdekHhlMYDjMqM4g5P4neKMo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEA15CD1D3FB4744A2688152688E230B@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd74f085-1996-4234-db41-08d971387e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 13:16:09.8107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RN7MShOTzxYoJHyZumMc+3NvEi7eOpJsk3XZctiaiewI/7d2ZQ7XdU5kFHBoLr9O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4326
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: Eo_0EUNX7uhTcMpjxJHZEkNhnZUpsbNc
X-Proofpoint-ORIG-GUID: Eo_0EUNX7uhTcMpjxJHZEkNhnZUpsbNc
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_05:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060085
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=888312a924=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IE9uIFNlcCA2LCAyMDIxLCBhdCAyOjE1IEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
ZjRidWdAYW1zYXQub3JnPiB3cm90ZToNCj4gDQo+IE9uIDkvNS8yMSA4OjU1IFBNLCBwZGVsQGZi
LmNvbSB3cm90ZToNCj4+IEZyb206IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4g
DQo+PiBUaGlzIGFkZHMgYSBuZXcgbWFjaGluZSB0eXBlICJmdWppLWJtYyIgYmFzZWQgb24gdGhl
IGZvbGxvd2luZyBkZXZpY2UgdHJlZToNCj4+IA0KPj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZh
bGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJv
b2stZnVqaS5kdHMNCj4gDQo+IFNvcnJ5IGZvciBiZWluZyBwaWNreSwgYnV0ICdtYXN0ZXInIGlz
IGEgYnJhbmNoLCBub3QgYSAoZml4ZWQpIHRhZy4NCj4gU2luY2UgdGhlcmUgaXMgbm8gdGFnIHJl
bGVhc2VkIHdpdGggdGhpcyBmaWxlLCBwbGVhc2UgcG9pbnQgdG8gdGhlDQo+IGNvbW1pdCBpbnRy
b2R1Y2luZyB0aGUgZmlsZToNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51
eC9ibG9iLzQwY2I2MzczYjQ2L2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2st
ZnVqaS5kdHMNCg0KT2gsIHRoYXTigJlzIG9rLCBJIGNhbiByZXNlbmQgdGhpcyBwYXRjaCB3aXRo
IHRoZXNlIGxpbmtzLg0KDQo+IA0KPj4gTW9zdCBvZiB0aGUgaTJjIGRldmljZXMgYXJlIG5vdCB0
aGVyZSwgdGhleSdyZSBhZGRlZCBoZXJlOg0KPj4gDQo+PiBodHRwczovL2dpdGh1Yi5jb20vZmFj
ZWJvb2svb3BlbmJtYy9ibG9iL2hlbGl1bS9tZXRhLWZhY2Vib29rL21ldGEtZnVqaS9yZWNpcGVz
LXV0aWxzL29wZW5ibWMtdXRpbHMvZmlsZXMvc2V0dXBfaTJjLnNoDQo+IA0KPiBTaW1pbGFybHk6
DQo+IA0KPiBodHRwczovL2dpdGh1Yi5jb20vZmFjZWJvb2svb3BlbmJtYy9ibG9iL2ZiMmVkMTIw
MDJmYi9tZXRhLWZhY2Vib29rL21ldGEtZnVqaS9yZWNpcGVzLXV0aWxzL29wZW5ibWMtdXRpbHMv
ZmlsZXMvc2V0dXBfaTJjLnNoDQo+IA0KPiAobm90ZSB0aGUgbmljZSBmYipmYiBTSEEtMSA6UCkN
Cg0KISBXaGF0IGFyZSB0aGUgb2Rkcz8/DQoNCj4gDQo+PiBJIHRlc3RlZCB0aGlzIGJ5IGJ1aWxk
aW5nIGEgRnVqaSBpbWFnZSBmcm9tIEZhY2Vib29rJ3MgT3BlbkJNQyByZXBvLA0KPj4gYm9vdGlu
ZywgYW5kIHNzaCdpbmcgZnJvbSBob3N0LXRvLWd1ZXN0Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+IC0tLQ0KPj4gaHcvYXJtL2FzcGVl
ZC5jIHwgMTEyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPj4gMSBmaWxlIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCspDQo+PiANCj4+IGRpZmYgLS1n
aXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMNCj4+IGluZGV4IDdhOTQ1OTM0
MGMuLmNjMmQ3MjFhYzcgMTAwNjQ0DQo+PiAtLS0gYS9ody9hcm0vYXNwZWVkLmMNCj4+ICsrKyBi
L2h3L2FybS9hc3BlZWQuYw0KPj4gQEAgLTE1OSw2ICsxNTksMTAgQEAgc3RydWN0IEFzcGVlZE1h
Y2hpbmVTdGF0ZSB7DQo+PiAjZGVmaW5lIFJBSU5JRVJfQk1DX0hXX1NUUkFQMSAweDAwMDAwMDAw
DQo+PiAjZGVmaW5lIFJBSU5JRVJfQk1DX0hXX1NUUkFQMiAweDAwMDAwMDAwDQo+PiANCj4+ICsv
KiBGdWppIGhhcmR3YXJlIHZhbHVlICovDQo+PiArI2RlZmluZSBGVUpJX0JNQ19IV19TVFJBUDEg
ICAgMHgwMDAwMDAwMA0KPj4gKyNkZWZpbmUgRlVKSV9CTUNfSFdfU1RSQVAyICAgIDB4MDAwMDAw
MDANCj4+ICsNCj4+IC8qDQo+PiAgKiBUaGUgbWF4IHJhbSByZWdpb24gaXMgZm9yIGZpcm13YXJl
cyB0aGF0IHNjYW4gdGhlIGFkZHJlc3Mgc3BhY2UNCj4+ICAqIHdpdGggbG9hZC9zdG9yZSB0byBn
dWVzcyBob3cgbXVjaCBSQU0gdGhlIFNvQyBoYXMuDQo+PiBAQCAtNzcyLDYgKzc3Niw5MCBAQCBz
dGF0aWMgdm9pZCByYWluaWVyX2JtY19pMmNfaW5pdChBc3BlZWRNYWNoaW5lU3RhdGUgKmJtYykN
Cj4+ICAgICBhc3BlZWRfZWVwcm9tX2luaXQoYXNwZWVkX2kyY19nZXRfYnVzKCZzb2MtPmkyYywg
MTUpLCAweDUwLCA2NCAqIEtpQik7DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCBnZXRfcGNh
OTU0OF9jaGFubmVscyhJMkNCdXMgKmJ1cywgdWludDhfdCBtdXhfYWRkciwgSTJDQnVzICoqY2hh
bm5lbHMpIHsNCj4gDQo+IFBlciBodHRwczovL3dpa2kucWVtdS5vcmcvQ29udHJpYnV0ZS9TdWJt
aXRBUGF0Y2gjVXNlX3RoZV9RRU1VX2NvZGluZ19zdHlsZSANCg0KT2ggeWVhaCwgSSBub3RpY2Vk
IENlZHJpYyBtZW50aW9uZWQgaGUgaGFkIHRvIGRvIHRoaXMsIHNvcnJ5ISEgSSByZW1lbWJlcg0K
cmVhZGluZyB0aHJvdWdoIHRoaXMgd2lraSBwYWdlLCBhbmQgdGhhdCB0aGVyZSB3YXMgYSBjaGVj
a3BhdGNoIHNjcmlwdCwNCmJ1dCB0aGVuIEkgZm9yZ290IHRvIGFjdHVhbGx5IHJ1biBpdC4gSeKA
mWxsIG1ha2Ugc3VyZSB0byBkbyB0aGF0IGluIHRoZQ0KZnV0dXJlLg0KDQo+IA0KPiAgIHN0YXRp
YyB2b2lkIGdldF9wY2E5NTQ4X2NoYW5uZWxzKEkyQ0J1cyAqYnVzLCB1aW50OF90IG11eF9hZGRy
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEkyQ0J1cyAqKmNoYW5uZWxz
KQ0KPiAgIHsNCj4gDQo+PiArICAgIEkyQ1NsYXZlICptdXggPSBpMmNfc2xhdmVfY3JlYXRlX3Np
bXBsZShidXMsICJwY2E5NTQ4IiwgbXV4X2FkZHIpOw0KPj4gKyAgICBmb3IgKGludCBpID0gMDsg
aSA8IDg7IGkrKykgew0KPj4gKyAgICAgICAgY2hhbm5lbHNbaV0gPSBwY2E5NTR4X2kyY19nZXRf
YnVzKG11eCwgaSk7DQo+PiArICAgIH0NCj4+ICt9DQo+PiArDQo+PiArI2RlZmluZSBUWVBFX0xN
NzUgVFlQRV9UTVAxMDUNCj4+ICsjZGVmaW5lIFRZUEVfVE1QNzUgVFlQRV9UTVAxMDUNCj4+ICsj
ZGVmaW5lIFRZUEVfVE1QNDIyICJ0bXA0MjIiDQo+PiArDQo+PiArc3RhdGljIHZvaWQgZnVqaV9i
bWNfaTJjX2luaXQoQXNwZWVkTWFjaGluZVN0YXRlICpibWMpDQo+PiArew0KPj4gKyAgICBBc3Bl
ZWRTb0NTdGF0ZSAqc29jID0gJmJtYy0+c29jOw0KPj4gKyAgICBJMkNCdXMgKmkyY1sxNDRdID0g
e307DQo+PiArDQo+PiArICAgIGZvciAoaW50IGkgPSAwOyBpIDwgMTY7IGkrKykgew0KPj4gKyAg
ICAgICAgaTJjW2ldID0gYXNwZWVkX2kyY19nZXRfYnVzKCZzb2MtPmkyYywgaSk7DQo+PiArICAg
IH0NCj4+ICsgICAgSTJDQnVzICppMmMxODAgPSBpMmNbMl07DQo+PiArICAgIEkyQ0J1cyAqaTJj
NDgwID0gaTJjWzhdOw0KPj4gKyAgICBJMkNCdXMgKmkyYzYwMCA9IGkyY1sxMV07DQo+PiArDQo+
PiArICAgIGdldF9wY2E5NTQ4X2NoYW5uZWxzKGkyYzE4MCwgMHg3MCwgJmkyY1sxNl0pOw0KPj4g
KyAgICBnZXRfcGNhOTU0OF9jaGFubmVscyhpMmM0ODAsIDB4NzAsICZpMmNbMjRdKTsNCj4gDQo+
IFFFTVUgc3R5bGU6DQo+IA0KPiAgICAgICAvKg0KPiANCj4+ICsgICAgLy8gTk9URTogVGhlIGRl
dmljZSB0cmVlIHNraXBzIFszMiwgNDApIGluIHRoZSBhbGlhcyBudW1iZXJpbmcsIHNvIHdlIGRv
DQo+PiArICAgIC8vIHRoZSBzYW1lIGhlcmUuDQo+IA0KPiAgICAgICAgKi8NCj4gDQo+PiArICAg
IGdldF9wY2E5NTQ4X2NoYW5uZWxzKGkyYzYwMCwgMHg3NywgJmkyY1s0MF0pOw0KPj4gKyAgICBn
ZXRfcGNhOTU0OF9jaGFubmVscyhpMmNbMjRdLCAweDcxLCAmaTJjWzQ4XSk7DQo+PiArICAgIGdl
dF9wY2E5NTQ4X2NoYW5uZWxzKGkyY1syNV0sIDB4NzIsICZpMmNbNTZdKTsNCj4+ICsgICAgZ2V0
X3BjYTk1NDhfY2hhbm5lbHMoaTJjWzI2XSwgMHg3NiwgJmkyY1s2NF0pOw0KPj4gKyAgICBnZXRf
cGNhOTU0OF9jaGFubmVscyhpMmNbMjddLCAweDc2LCAmaTJjWzcyXSk7DQo+PiArICAgIGZvciAo
aW50IGkgPSAwOyBpIDwgODsgaSsrKSB7DQo+PiArICAgICAgICBnZXRfcGNhOTU0OF9jaGFubmVs
cyhpMmNbNDAgKyBpXSwgMHg3NiwgJmkyY1s4MCArIGkgKiA4XSk7DQo+PiArICAgIH0NCj4+ICsN
Cj4+ICsgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzE3XSwgVFlQRV9MTTc1LCAweDRj
KTsNCj4+ICsgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzE3XSwgVFlQRV9MTTc1LCAw
eDRkKTsNCj4+ICsNCj4+ICsgICAgYXNwZWVkX2VlcHJvbV9pbml0KGkyY1sxOV0sIDB4NTIsIDY0
ICogS2lCKTsNCj4+ICsgICAgYXNwZWVkX2VlcHJvbV9pbml0KGkyY1syMF0sIDB4NTAsIDIgKiBL
aUIpOw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzIyXSwgMHg1MiwgMiAqIEtpQik7
DQo+PiArDQo+PiArICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1szXSwgVFlQRV9MTTc1
LCAweDQ4KTsNCj4+ICsgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzNdLCBUWVBFX0xN
NzUsIDB4NDkpOw0KPj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbM10sIFRZUEVf
TE03NSwgMHg0YSk7DQo+PiArICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1szXSwgVFlQ
RV9UTVA0MjIsIDB4NGMpOw0KPj4gKw0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzhd
LCAweDUxLCA2NCAqIEtpQik7DQo+PiArICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1s4
XSwgVFlQRV9MTTc1LCAweDRhKTsNCj4+ICsNCj4+ICsgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1w
bGUoaTJjWzUwXSwgVFlQRV9MTTc1LCAweDRjKTsNCj4+ICsgICAgYXNwZWVkX2VlcHJvbV9pbml0
KGkyY1s1MF0sIDB4NTIsIDY0ICogS2lCKTsNCj4+ICsgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1w
bGUoaTJjWzUxXSwgVFlQRV9UTVA3NSwgMHg0OCk7DQo+PiArICAgIGkyY19zbGF2ZV9jcmVhdGVf
c2ltcGxlKGkyY1s1Ml0sIFRZUEVfVE1QNzUsIDB4NDkpOw0KPj4gKw0KPj4gKyAgICBpMmNfc2xh
dmVfY3JlYXRlX3NpbXBsZShpMmNbNTldLCBUWVBFX1RNUDc1LCAweDQ4KTsNCj4+ICsgICAgaTJj
X3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzYwXSwgVFlQRV9UTVA3NSwgMHg0OSk7DQo+PiArDQo+
PiArICAgIGFzcGVlZF9lZXByb21faW5pdChpMmNbNjVdLCAweDUzLCA2NCAqIEtpQik7DQo+PiAr
ICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1s2Nl0sIFRZUEVfVE1QNzUsIDB4NDkpOw0K
Pj4gKyAgICBpMmNfc2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbNjZdLCBUWVBFX1RNUDc1LCAweDQ4
KTsNCj4+ICsgICAgYXNwZWVkX2VlcHJvbV9pbml0KGkyY1s2OF0sIDB4NTIsIDY0ICogS2lCKTsN
Cj4+ICsgICAgYXNwZWVkX2VlcHJvbV9pbml0KGkyY1s2OV0sIDB4NTIsIDY0ICogS2lCKTsNCj4+
ICsgICAgYXNwZWVkX2VlcHJvbV9pbml0KGkyY1s3MF0sIDB4NTIsIDY0ICogS2lCKTsNCj4+ICsg
ICAgYXNwZWVkX2VlcHJvbV9pbml0KGkyY1s3MV0sIDB4NTIsIDY0ICogS2lCKTsNCj4+ICsNCj4+
ICsgICAgYXNwZWVkX2VlcHJvbV9pbml0KGkyY1s3M10sIDB4NTMsIDY0ICogS2lCKTsNCj4+ICsg
ICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzc0XSwgVFlQRV9UTVA3NSwgMHg0OSk7DQo+
PiArICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1s3NF0sIFRZUEVfVE1QNzUsIDB4NDgp
Ow0KPj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzc2XSwgMHg1MiwgNjQgKiBLaUIpOw0K
Pj4gKyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzc3XSwgMHg1MiwgNjQgKiBLaUIpOw0KPj4g
KyAgICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzc4XSwgMHg1MiwgNjQgKiBLaUIpOw0KPj4gKyAg
ICBhc3BlZWRfZWVwcm9tX2luaXQoaTJjWzc5XSwgMHg1MiwgNjQgKiBLaUIpOw0KPj4gKyAgICBh
c3BlZWRfZWVwcm9tX2luaXQoaTJjWzI4XSwgMHg1MCwgMiAqIEtpQik7DQo+PiArDQo+PiArICAg
IGZvciAoaW50IGkgPSAwOyBpIDwgODsgaSsrKSB7DQo+PiArICAgICAgICBhc3BlZWRfZWVwcm9t
X2luaXQoaTJjWzgxICsgaSAqIDhdLCAweDU2LCA2NCAqIEtpQik7DQo+PiArICAgICAgICBpMmNf
c2xhdmVfY3JlYXRlX3NpbXBsZShpMmNbODIgKyBpICogOF0sIFRZUEVfVE1QNzUsIDB4NDgpOw0K
Pj4gKyAgICAgICAgaTJjX3NsYXZlX2NyZWF0ZV9zaW1wbGUoaTJjWzgzICsgaSAqIDhdLCBUWVBF
X1RNUDc1LCAweDRiKTsNCj4+ICsgICAgICAgIGkyY19zbGF2ZV9jcmVhdGVfc2ltcGxlKGkyY1s4
NCArIGkgKiA4XSwgVFlQRV9UTVA3NSwgMHg0YSk7DQo+PiArICAgIH0NCj4+ICt9DQo+PiArDQo+
PiBzdGF0aWMgYm9vbCBhc3BlZWRfZ2V0X21taW9fZXhlYyhPYmplY3QgKm9iaiwgRXJyb3IgKipl
cnJwKQ0KPj4gew0KPj4gICAgIHJldHVybiBBU1BFRURfTUFDSElORShvYmopLT5tbWlvX2V4ZWM7
DQo+PiBAQCAtMTA3MCw2ICsxMTU4LDI2IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9tYWNoaW5lX3Jh
aW5pZXJfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsIHZvaWQgKmRhdGEpDQo+PiAgICAgICAg
IGFzcGVlZF9zb2NfbnVtX2NwdXMoYW1jLT5zb2NfbmFtZSk7DQo+PiB9Ow0KPj4gDQo+PiArc3Rh
dGljIHZvaWQgYXNwZWVkX21hY2hpbmVfZnVqaV9jbGFzc19pbml0KE9iamVjdENsYXNzICpvYywg
dm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIE1hY2hpbmVDbGFzcyAqbWMgPSBNQUNISU5FX0NM
QVNTKG9jKTsNCj4+ICsgICAgQXNwZWVkTWFjaGluZUNsYXNzICphbWMgPSBBU1BFRURfTUFDSElO
RV9DTEFTUyhvYyk7DQo+PiArDQo+PiArICAgIG1jLT5kZXNjID0gIkZhY2Vib29rIEZ1amkgQk1D
IChDb3J0ZXgtQTcpIjsNCj4+ICsgICAgYW1jLT5zb2NfbmFtZSA9ICJhc3QyNjAwLWEzIjsNCj4+
ICsgICAgYW1jLT5od19zdHJhcDEgPSBGVUpJX0JNQ19IV19TVFJBUDE7DQo+PiArICAgIGFtYy0+
aHdfc3RyYXAyID0gRlVKSV9CTUNfSFdfU1RSQVAyOw0KPj4gKyAgICBhbWMtPmZtY19tb2RlbCA9
ICJteDY2bDFnNDVnIjsNCj4+ICsgICAgYW1jLT5zcGlfbW9kZWwgPSAibXg2NmwxZzQ1ZyI7DQo+
PiArICAgIGFtYy0+bnVtX2NzID0gMjsNCj4+ICsgICAgYW1jLT5tYWNzX21hc2sgPSBBU1BFRURf
TUFDM19PTjsNCj4+ICsgICAgYW1jLT5pMmNfaW5pdCA9IGZ1amlfYm1jX2kyY19pbml0Ow0KPj4g
KyAgICBhbWMtPnVhcnRfZGVmYXVsdCA9IEFTUEVFRF9ERVZfVUFSVDE7DQo+PiArICAgIG1jLT5k
ZWZhdWx0X3JhbV9zaXplID0gMiAqIEdpQjsNCj4+ICsgICAgbWMtPmRlZmF1bHRfY3B1cyA9IG1j
LT5taW5fY3B1cyA9IG1jLT5tYXhfY3B1cyA9DQo+PiArICAgICAgICBhc3BlZWRfc29jX251bV9j
cHVzKGFtYy0+c29jX25hbWUpOw0KPiANCj4gTWF0dGVyIG9mIHRhc3RlOg0KPiANCj4gICAgICAg
bWMtPmRlZmF1bHRfY3B1cyA9IG1jLT5taW5fY3B1cyA9IG1jLT5tYXhfY3B1cw0KPiAgICAgICAg
ICAgICAgICAgICAgICAgID0gYXNwZWVkX3NvY19udW1fY3B1cyhhbWMtPnNvY19uYW1lKTsNCg0K
SSBhY3R1YWxseSBsaWtlIHRoYXQgYmV0dGVyIHRvbywgYnV0IEkgdGhpbmsgdGhlIHJlc3Qgb2Yg
dGhlIGZpbGUNCmRvZXMgaXQgdGhpcyB3YXksIHNvIEnigJlsbCBqdXN0IGxlYXZlIGl0IGFzLWlz
IHRvIGJlIGNvbnNpc3RlbnQNCkkgc3VwcG9zZS4NCg0KPiANCj4+ICt9Ow0KPj4gKw0KPj4gc3Rh
dGljIGNvbnN0IFR5cGVJbmZvIGFzcGVlZF9tYWNoaW5lX3R5cGVzW10gPSB7DQo+PiAgICAgew0K
Pj4gICAgICAgICAubmFtZSAgICAgICAgICA9IE1BQ0hJTkVfVFlQRV9OQU1FKCJwYWxtZXR0by1i
bWMiKSwNCj4+IEBAIC0xMTE5LDYgKzEyMjcsMTAgQEAgc3RhdGljIGNvbnN0IFR5cGVJbmZvIGFz
cGVlZF9tYWNoaW5lX3R5cGVzW10gPSB7DQo+PiAgICAgICAgIC5uYW1lICAgICAgICAgID0gTUFD
SElORV9UWVBFX05BTUUoInJhaW5pZXItYm1jIiksDQo+PiAgICAgICAgIC5wYXJlbnQgICAgICAg
ID0gVFlQRV9BU1BFRURfTUFDSElORSwNCj4+ICAgICAgICAgLmNsYXNzX2luaXQgICAgPSBhc3Bl
ZWRfbWFjaGluZV9yYWluaWVyX2NsYXNzX2luaXQsDQo+PiArICAgIH0sIHsNCj4+ICsgICAgICAg
IC5uYW1lICAgICAgICAgID0gTUFDSElORV9UWVBFX05BTUUoImZ1amktYm1jIiksDQo+PiArICAg
ICAgICAucGFyZW50ICAgICAgICA9IFRZUEVfQVNQRUVEX01BQ0hJTkUsDQo+PiArICAgICAgICAu
Y2xhc3NfaW5pdCAgICA9IGFzcGVlZF9tYWNoaW5lX2Z1amlfY2xhc3NfaW5pdCwNCj4+ICAgICB9
LCB7DQo+PiAgICAgICAgIC5uYW1lICAgICAgICAgID0gVFlQRV9BU1BFRURfTUFDSElORSwNCj4+
ICAgICAgICAgLnBhcmVudCAgICAgICAgPSBUWVBFX01BQ0hJTkUsDQoNCg==

