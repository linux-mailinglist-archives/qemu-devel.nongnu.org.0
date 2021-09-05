Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AA401046
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:36:52 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMtGN-0006UB-5t
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8882ecb67b=pdel@fb.com>)
 id 1mMtEu-000504-5V; Sun, 05 Sep 2021 10:35:20 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:31116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8882ecb67b=pdel@fb.com>)
 id 1mMtEs-00013n-2q; Sun, 05 Sep 2021 10:35:19 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 185EXYIo027116; Sun, 5 Sep 2021 07:34:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=A8zjOZMiq5SXE7ZD3JFH6NFO0RH5h4wTfPJ2vorLaSM=;
 b=kDGLhn5JPvJEo4BWZo63Jq4xeZgU/plgrBTqFqRzZD0Ix8ApCa2I+p3H/WL1HFKRSWQB
 21b8cfuJpuNibo/qlqorM1J5TvusSaEJY06BQM4v2VRiZJd3KWOiFDGbKPJxnnqQidJW
 kvndopXeba9Mv+pYDdzHLOO5TZsd7qZyEJ4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3av846wdrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 05 Sep 2021 07:34:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sun, 5 Sep 2021 07:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF2PTg2aUFQOdLvyHphjNWAVNQ7W64SvvGL+mcRqQZ2WNkGLiZQbp0f35DNgxoGFtOTfvfLf75X0oGnC9vHNK5I6QF0t0r53E0AcpSWxwu3PjhVGWCtswNB1gPJnTcXki8Ne24QbQxLo3N2ujfLPvGanUJkM2vmuFpN1OaN4OHRXRQai7nBOvGGcNWDFgTQIcZnRcHzCUQGjhbW4aWQjeYoep90mRXZe43OKMH/4WDyjQeFskvLWpq7d+hIRA+7STUVdkYW1TAoZsT8sEOerAC53QU+LNn05hpn0npWsjIYLq6WyJ4uBXXz9CNKHSnYxnXbDVsJ1I9tt2qebNip/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=A8zjOZMiq5SXE7ZD3JFH6NFO0RH5h4wTfPJ2vorLaSM=;
 b=mmnmhHn4Pf5JSjuBPRu2wcxxAVtcPwXk8WQujx56vrEC2XOAtb0m0DenvaWMhtVYEoKFYSwMxTXL1sE3JdAA33noUDmGbJIIVkExtXNUyL45iuKG/nIrzZQ8gj/DpTP6tnJAXVkQB/83O4wqmHI+xdyHXD68IB/nf2s2PzhIo9o/8kA7GQzAn0jIos1CwpwUP/smJHVYnbjmyDJJuC+3ecL1h2n1F6Oc7JF9TNqIUbrSEdzH1LuT7MP8GmfO5eVKc/C7YSSIE+/Wlvi8W3iar2E/gMRaC+APlaGh7j9r6PSjcBsRJewVKAPTWtqcpEiHZxMJuP1sUyg2lIRHj9bcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4647.namprd15.prod.outlook.com (2603:10b6:a03:37c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sun, 5 Sep
 2021 14:34:48 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4478.025; Sun, 5 Sep 2021
 14:34:48 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "Peter
 Maydell" <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PULL 00/14] aspeed queue
Thread-Topic: [PULL 00/14] aspeed queue
Thread-Index: AQHXoQQdKcQ7WWCO9EGazxyuLva0SauTWrGAgAElTYCAAKRTgIAAYAHT
Date: Sun, 5 Sep 2021 14:34:48 +0000
Message-ID: <A1FBA6CB-6D97-4EC3-A4AD-90CE687A08D7@fb.com>
References: <20210903194108.131403-1-clg@kaod.org>
 <beab1f50-d8f5-b3d3-5612-15e5f74eb961@amsat.org>
 <9ef56813-94f9-a1cb-aba5-9d2e2a081d23@kaod.org>
 <24abcdb3-e666-477b-a3e7-746326640bca@amsat.org>
 <cb42b5f4-0484-2192-5c93-fe20bbb39ef1@kaod.org>
In-Reply-To: <cb42b5f4-0484-2192-5c93-fe20bbb39ef1@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 421472d4-f465-4173-b806-08d9707a503d
x-ms-traffictypediagnostic: SJ0PR15MB4647:
x-microsoft-antispam-prvs: <SJ0PR15MB4647E8F59E99F7EFAB244455ACD19@SJ0PR15MB4647.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7nYawf54YZaHKIcmimqsuJ/zN0vlApu2/BHDZTEkG/bpquIFSK/cQ4Mfv80LssM2mAdZMW0GrPxGHZ98lCMhnofb9g86NzHV/5EL06vu/NgSgpjKymaIOm1ayXYblDtwrvfZoF0JSSJ4RdWmsscDTQGUVWeLEH4w9cSgjetkTwSpFe7laMtGMhuPiDqc4F3PCXWTUdcGmu97iZD0/rvFal2U8g26Za5tZgXJV2gQQFLpbZds223kJH+saW3knjuk+OMYQDIMLsu7mUVpz07ab+xiGQecwCWGWEtc77XrcQWl0ruhgK+l74ivKY5IlMa2MucnPhKxYBLOEVOuwNbTmGmbVh7WRhAM4mSrewYRQeTqeYYSIhTO+CheVPWTHz7i+jxofi3XaOWOavTdYV6foWXwFTFqH2UbWXFyVzyLAT7kP19DUGuYlx16cbjEZA0Lf2/YxzRchPJs58cuDOKgR+8rNGrYSv/6crkpHPu5krYJUu7yRN82Br2RNq44smP1dbYrsO3aos94ogl+1xgqb8OcLLiNeQks8iXxgJWekktUnEYwypknYc/OJRf6trDYk96zLv+sEsc5TbvBTL6ewbm4a7OT/LKUygSVtz12qEfzy42yx4Kdt/2WvppJ8CN5CqDQMsPBlSQ5BI7K2oMFC2CO+MnZACIGHSQztpIDwoYMMk+rCqCMOpKfxJeYXwL+3RfmPffM/8zDntIEKTxaf+rF3ZOJthHYbduocdNeL6jL1dxflgDgc++mz1bNnxgmEPNUeNwBM/Z7eoFN2KBOY+uzNeyVD5If2/81ZY51IVKM7eKCcBRQb6EKzcUagU/i7eqDjAZb+QKL999MPitEWdMA5sbvrU4GH3fGmMYzo3A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(2906002)(8676002)(83380400001)(66556008)(122000001)(36756003)(64756008)(8936002)(6916009)(5660300002)(71200400001)(316002)(54906003)(66476007)(66946007)(4326008)(478600001)(6506007)(6486002)(38070700005)(76116006)(2616005)(966005)(38100700002)(186003)(6512007)(86362001)(66446008)(33656002)(66574015)(53546011)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2liWjBKeXJlM1krQWhQcmZ3NFRsalowQWpIRTBlSmtnUnlyQURlZVhEUHRp?=
 =?utf-8?B?RkF1V2RWc2taSXc5Sm9RWXNXWnIvTEdCQnVvQ2MyaTZOMkcxQjJUYS9GMzF3?=
 =?utf-8?B?ajZNcWl0VStGWEpHUFNsMWppZnlxWW5YeTQ5aWhUVzM0dW9QcGcxY3lvOUp2?=
 =?utf-8?B?dnphS08rR3dGVWduN2Q4MmJieDV1UHhSVHZGZEhGOWhQeW93WVR6d0h5bEQx?=
 =?utf-8?B?d2k3SlRQWUtnUXpIc01uU084dWtsQVVUNGlkeWp3cWJKYUsyT0lLYkd6a2py?=
 =?utf-8?B?THRhVGJxWTl0eTZEK2tqQ3N3T0JZNkV6WHcrYkV5d0p0SXR4dHZjNndvRzk0?=
 =?utf-8?B?ODVIOUZ2ZFV5MVU3N0liUW15YVJWWUsrYittS09yelFXSFRZM2hrOHBYUklZ?=
 =?utf-8?B?enpmY0Y2dEhZQ3JUTDdQQkJTNkFCSWxrS0pqZkZ5WWFpV1M1cnJ3S0J6Q2tL?=
 =?utf-8?B?dmFlK0NWVFozb002b0FHbUk4TFd2b1dtMVhKdi9WbVVxZS9jdmdzelRqcEo3?=
 =?utf-8?B?OGZIcjNxdXFPYng5TG0xS0UrQ2VxYVVwdmtrNXFDbk53TS9pMWZzQjNtdCtF?=
 =?utf-8?B?aTNQNGY4c2tyVG1nVUYrTVBWTHZLbE83TTRkcnRrTFFTQ09GVGdLOGcwZGxS?=
 =?utf-8?B?NkxNdXFlMGlIc0s4R0x1MXZBTGNIeVBsQldKK3VLVFU2cHkwdEY4cUtQd0Uv?=
 =?utf-8?B?OVlrcEdZSDZTTlBUQ1BFRURrSkZ0QkpyM3Noa0EvbVJibmYzZ2ZYVWd2dk5o?=
 =?utf-8?B?cS9obXM5Q1Rncy9MWUFSRXlmRWgvbXJURTB4YXJtbVRGVzRIWGNScTZmRHpq?=
 =?utf-8?B?amFMb0twTEcyWUUrNXI1MWE5VWJQdjMxWHlDT2lySlVaUTloMG15cVpBR1BM?=
 =?utf-8?B?YnJTWHBVTkNPR3lTYXlTeHVGNGRWNkZxK3lDSHBNSU96bUlHUmc1ZGQ2dnpB?=
 =?utf-8?B?aXhzNFg5M0Q2NWsyQ3NOSjMyMW5JMHZlTkoxU2Uyb3gyQTgzT3l0WTJ0akli?=
 =?utf-8?B?YzQ5YnhjWW9EY2oxb3paUkJJTzF1S3VOWk5JRFpFWXd0T016aFlGRmxUVVBC?=
 =?utf-8?B?amhaalFFaFZJVlgycDF2SE9RSWlmZnB0Z3N4a1JBbk1GblBhb2xCZHpRSUhX?=
 =?utf-8?B?VFl2Ym0rRmR2VGwvVEhTOC9HN2RLdkdNNUJwa1lkMkRrZTIyMm1wdHZGQ0Fi?=
 =?utf-8?B?YitMVldZdTBORnIwenBlUlRMTlIrQlJmdEdHOG9VWXcxZU9iNFRFdkFLYkFn?=
 =?utf-8?B?b0NSb2J4SVhZWFJKVzJwbG9zVmcrM3hVUWF0OW5Rc2lzWWR4cVk5SHRYVitI?=
 =?utf-8?B?MUl0c2hCb29PY2dQa2dJNWpiNWdZNVpXVzJIeDZEWFNZTUhER2JSTU1yTFNC?=
 =?utf-8?B?cnFRS09ZaTdON051RWVRZ2lZVzhlZjd5SUxUUUxrMUVXNVorSUx2czZveVRo?=
 =?utf-8?B?V3FsemhndXRkdXJmc2NjR1hBSVdwNytZRUJTQW9ZTFdZZUlLR0pLWDJpM0pV?=
 =?utf-8?B?K1FodlNrbitieUVidklJQmpjS1F0MDg5ZU56NnRSdnJSOFN5b0hyaFRpS2Fr?=
 =?utf-8?B?eXA3cG43UE5IaGZNMkJRdFR3eE9xd0hSQ2lOVFpGV1dIZ1c2VGhBa1VTdUFL?=
 =?utf-8?B?dWgrcVRVMzU5a3cyWllsVERYY2VmZVN2UWRWM1UvVndNMUpDcWRDY05la3E1?=
 =?utf-8?B?aHRNb2NMV1kxVk50L1RxTkRhZ3ZNZml4R1paTFBDOHVTS1lDdi95Z3BGUCtV?=
 =?utf-8?Q?AuzGGeIRa1HYpWHtNKuz9W7kgeXkJJu50qT/u3X?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421472d4-f465-4173-b806-08d9707a503d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2021 14:34:48.2329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GifClBLn2ubdPD3nzw25dAQRw3TqMlG99J4/20N+U59jrVtd5cUkeenhS97KRJ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4647
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: f1m8BoTi-pC7H9RbDeXQOu5ifEuI3Q_j
X-Proofpoint-GUID: f1m8BoTi-pC7H9RbDeXQOu5ifEuI3Q_j
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-04_09:2021-09-03,
 2021-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109050104
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8882ecb67b=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gU2VwIDUsIDIwMjEsIGF0IDE6NTEgQU0sIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdA
a2FvZC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gOS81LzIxIDE6MDMgQU0sIFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4+IE9uIDkvNC8yMSA3OjMzIEFNLCBDw6lkcmljIExlIEdv
YXRlciB3cm90ZToNCj4+PiBPbiA5LzMvMjEgMTA6NDEgUE0sIFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIHdyb3RlOg0KPj4+PiBIaSBQZXRlciwNCj4+Pj4gDQo+Pj4+IE9uIDkvMy8yMSA5OjQwIFBN
LCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4+Pj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQgODg4MGNjNDM2MmZkZTRlY2RhYzBiMjA5MjMxODg5MzExODIwNmZjZjoNCj4+
Pj4+IA0KPj4+Pj4gIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3JlbW90ZXMvY3NjaG9l
bmViZWNrL3RhZ3MvcHVsbC05cC0yMDIxMDkwMicgaW50byBzdGFnaW5nICgyMDIxLTA5LTAzIDA4
OjI3OjM4ICswMTAwKQ0KPj4+Pj4gDQo+Pj4+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoNCj4+Pj4+IA0KPj4+Pj4gIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWdvYXRlci9x
ZW11LyB0YWdzL3B1bGwtYXNwZWVkLTIwMjEwOTAzDQo+Pj4+PiANCj4+Pj4+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byA5MDc3OTY2MjJiMmE2Yjk0NWM4NzY0MWQ5NGUyNTRhYzg5OGI5
NmFlOg0KPj4+Pj4gDQo+Pj4+PiAgaHcvYXJtL2FzcGVlZDogQWRkIEZ1amkgbWFjaGluZSB0eXBl
ICgyMDIxLTA5LTAzIDE4OjQzOjE2ICswMjAwKQ0KPj4+Pj4gDQo+Pj4+PiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+
PiBBc3BlZWQgcGF0Y2hlcyA6DQo+Pj4+PiANCj4+Pj4+ICogTUFDIGVuYWJsZW1lbnQgZml4ZXMg
KEd1ZW50ZXIpDQo+Pj4+PiAqIFdhdGNoZG9nICBhbmQgcGNhOTU1MiBmaXhlcyAoQW5kcmV3KQ0K
Pj4+Pj4gKiBHUElPIGZpeGVzIChKb2VsKQ0KPj4+Pj4gKiBBU1QyNjAwQTMgU29DIGFuZCBEUFMz
MTAgbW9kZWxzIChKb2VsKQ0KPj4+Pj4gKiBOZXcgRnVqaSBCTUMgbWFjaGluZSAoUGV0ZXIpDQo+
Pj4+PiANCj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gDQo+Pj4+PiBQZXRlciBEZWxldm9yeWFzICgzKToN
Cj4+Pj4+ICAgICAgaHcvYXJtL2FzcGVlZDogSW5pdGlhbGl6ZSBBU1QyNjAwIFVBUlQgY2xvY2sg
c2VsZWN0aW9uIHJlZ2lzdGVycw0KPj4+Pj4gICAgICBody9hcm0vYXNwZWVkOiBBbGxvdyBtYWNo
aW5lIHRvIHNldCBVQVJUIGRlZmF1bHQNCj4+Pj4+ICAgICAgaHcvYXJtL2FzcGVlZDogQWRkIEZ1
amkgbWFjaGluZSB0eXBlDQo+Pj4+IA0KPj4+PiBJIGhhdmUgYSBwZW5kaW5nIHF1ZXN0aW9uIHdp
dGggdGhlIGxhc3QgcGF0Y2gsIGRvIHlvdSBtaW5kIGhvbGRpbmcNCj4+Pj4gdGhpcyBQUiB1bnRp
bCBpdCBpcyByZXNvbHZlZCB3aXRoIEPDqWRyaWMgYW5kIHRoZSBwYXRjaCBhdXRob3IgcGxlYXNl
Pw0KPj4+PiANCj4+Pj4gVGhhbmtzLA0KPj4+PiANCj4+Pj4gUGhpbC4NCj4+Pj4gDQo+Pj4gDQo+
Pj4gSSBndWVzcyB3ZSBjYW4gZHJvcCB0aGUgZm9sbG93aW5nIGZyb20gdGhlIGNvbW1pdCBsb2cg
OiANCj4+PiANCj4+PiAgICBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2ZhY2Vib29rL29w
ZW5ibWMNCj4+PiAgICBjZCBvcGVuYm1jDQo+Pj4gICAgLi9zeW5jX3lvY3RvLnNoDQo+Pj4gICAg
c291cmNlIG9wZW5ibWMtaW5pdC1idWlsZC1lbnYgZnVqaSBidWlsZC1mdWppDQo+Pj4gICAgYml0
YmFrZSBmdWppLWltYWdlDQo+Pj4gICAgZGQgaWY9L2Rldi96ZXJvIG9mPS90bXAvZnVqaS5tdGQg
YnM9MU0gY291bnQ9MTI4DQo+Pj4gICAgZGQgaWY9Li90bXAvZGVwbG95L2ltYWdlcy9mdWppL2Zs
YXNoLWZ1amkgb2Y9L3RtcC9mdWppLm10ZCBcDQo+Pj4gICAgICAgIGJzPTFrIGNvbnY9bm90cnVu
Yw0KPj4+ICAgIA0KPj4+ICAgIGdpdCBjbG9uZSAtLWJyYW5jaCBhc3BlZWQtbmV4dCBodHRwczov
L2dpdGh1Yi5jb20vcGV0ZXJkZWxldm9yeWFzL3FlbXUNCj4+PiAgICBjZCBxZW11DQo+Pj4gICAg
Li9jb25maWd1cmUgLS10YXJnZXQtbGlzdD1hcm0tc29mdG1tdSAtLWRpc2FibGUtdm5jDQo+Pj4g
ICAgbWFrZSAtaiAkKG5wcm9jKQ0KPj4+ICAgIC4vYnVpbGQvYXJtLXNvZnRtbXUvcWVtdS1zeXN0
ZW0tYXJtIFwNCj4+PiAgICAgICAgLW1hY2hpbmUgZnVqaS1ibWMgXA0KPj4+ICAgICAgICAtZHJp
dmUgZmlsZT0vdG1wL2Z1amkubXRkLGZvcm1hdD1yYXcsaWY9bXRkIFwNCj4+PiAgICAgICAgLXNl
cmlhbCBzdGRpbyBcDQo+Pj4gICAgICAgIC1uaWMgdXNlcixob3N0ZndkPTo6MjIyMi06MjINCj4+
PiAgICBzc2hwYXNzIC1wIDBwZW5CbWMgc3NoIHJvb3RAbG9jYWxob3N0IC1wIDIyMjINCj4+IA0K
Pj4gU291bmRzIGdvb2QuIEV2ZW50dWFsbHkgZG9jdW1lbnQgdGhhdCBpbiBkb2NzL3N5c3RlbS9h
cm0vYXNwZWVkLnJzdA0KPj4gaW4gYSBmb2xsb3cgdXAgcGF0Y2g/DQo+PiANCj4+IFJlZ2FyZHMs
DQo+PiANCj4+IFBoaWwuDQo+PiANCj4gDQo+IA0KPiBQZXRlciBELCANCj4gDQo+IENvdWxkIHlv
dSBwbGVhc2UgcmVzZW5kIHRoZSAiaHcvYXJtL2FzcGVlZDogQWRkIEZ1amkgbWFjaGluZSB0eXBl
Ig0KPiBwYXRjaCBhZGRyZXNzaW5nIFBoaWwncyBjb21tZW50LiBJIHdpbGwgcmVzZW5kIGEgUFIg
d2l0aCB0aGUgDQo+IHVwZGF0ZS4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEMuIA0KPiANCj4gDQoN
Ck9oISBZZXMsIEkgY2FuIGRvIHRoYXQsIHNvcnJ5LCBJIHdhc27igJl0IHN1cmUgaWYgaXQgd2Fz
IG5lY2Vzc2FyeSB0byByZXNlbmQgb3IgaWYgaXQgY291bGQgYmUgZml4ZWQgaW5saW5lIG9yIHNv
bWV0aGluZy4gSeKAmWxsIHNlbmQgdGhhdCB3aXRoaW4gdGhlIG5leHQgMjQgaHJzLCByZW1vdmlu
ZyB0aGUgc2VsZWN0ZWQgdGV4dCBmcm9tIHRoZSBjb21taXQgZGVzY3JpcHRpb24uDQoNClRoYW5r
cywNClBldGVyDQoNCj4gDQo+IA0KPiANCg==

