Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5962189D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 16:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osQj1-0005dv-Df; Tue, 08 Nov 2022 10:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1osQiz-0005dR-1W
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:41:17 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1osQiw-00039j-K2
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 10:41:16 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A8E4tf3025244; Tue, 8 Nov 2022 15:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=VTj81GcM91e5S7lf0RSDZvRYQHBsd2+Hx+F4nqzy2A4=;
 b=lSGQ8k0U9XmGifcd9VBCmr4HJPl2eKIILDqiCPBcPgXRnkge8u1nmOowntNgqEp2jWbh
 bjhuN9KkhlDtaY/+r+IO9brwHVEjWCcrTFr0BGYgP1tgyW/HjEJWRlZcl0y8aDAL5PbH
 QcgzHCxzS/Y5p1FTkVwBt8N98t/Y/vE2d1tKzmggjPBhFlZiU3WF2jzZh8csjUV0F4GI
 HdZqU5GFDEN6JLhZouy4hNG+mgLG33PmD2tS7uwadBSWYfQI3z+zc9DIQFdc16fVUd7U
 ER6JnVnd5VDuN9loEPTSBBo97HQQlkwFpCTRvvRBKNu4L0Klt0x/gCLZZlFmU3M9rDDv Zg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kqhvj19cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 15:41:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPbvHcdfNYYXf5YNOH6gJwoWP7OFeTYAYYTqRn7eFKjdk89LZFt2Gt1U+ERTvzmYRshdXHb4/jJ09X/a15phIbdUhrlsQWk0D5CfB1G1nLHM7RGV2pXjg70Q+DNOcWhMq3MZVr9r//AnLbnxyRS/7f9Eg2vKvBtcHDW3sCStmTo7DAx63ppgGIPku0M8D/48XHIPhQoBgQ0Qy54oXx5WgDq5eK+XG+H0PtG8ACdl5l8fIJPOaeLsr/j77jWh3o6y2cFgnNjrBH1fIKTFaYEfQL1LCp4DCacn+Okkz6HCyG62OU71PfEMxuzYMJj0PslrBtPPgv6UGOkCSbZw4p/N6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTj81GcM91e5S7lf0RSDZvRYQHBsd2+Hx+F4nqzy2A4=;
 b=MDQPQ7yYT4jy+5+7H2L30ra+7PSvKz0vhLCPPFPUEAjsWf5Kk/wih6PJMY24n9kKrsuvyMRWFMEZbLOM+zjUhJxXcT6hrb/RqCIXYxAhQPfW6GudVgEFXGp9WP27XIeiIXGKnCLWqj9qLPbbETY6a04IvR+b45t3OKm/OK0VYOsy8F7tl7dDnmpJj/zHGUlcgyQOZtcTJSd05r7tuGgm4FSF8P9HEUJxeAgXNFxJclX2HDHoi2oyR7wDgdTnqlFS2VKOgkWRv2C5ym/P3gZaluF27YUztGIxwWXIpK9jNsRvsTcOEnK/Rc2yO4kpd3pEYtEOxZ5EXwn7zsymkNZOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB7807.namprd02.prod.outlook.com
 (2603:10b6:a03:325::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 15:41:06 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 15:41:05 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>
Subject: RE: [PATCH v4 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Thread-Topic: [PATCH v4 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
Thread-Index: AQHY8ydtNdQLJIZC8ES19sOlkzaLUK40n9aAgAB9FCA=
Date: Tue, 8 Nov 2022 15:41:05 +0000
Message-ID: <SN4PR0201MB88085020EF16C459E65B7032DE3F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221108040552.22175-1-tsimpson@quicinc.com>
 <20221108040552.22175-11-tsimpson@quicinc.com>
 <56eccfad-12a7-d854-7e62-d6ec865424f0@linaro.org>
In-Reply-To: <56eccfad-12a7-d854-7e62-d6ec865424f0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB7807:EE_
x-ms-office365-filtering-correlation-id: d2a8f97d-af55-4a79-e9c7-08dac19fa63f
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qcvTGZ7FIw2xtrgCOOXqT69dXc//Z5N3miL0ELnbykmwOPj22r0+xw1DoKzMue0ohvxdI34UD2AIJmBQGWTJr7dfWEY+RKIwoip8IVENNWz5UFo1AJdGuBVYoHvjQO/YvvzwrlWSuWzNN656uE2RGBJI+pc8Rkah7E5Sju7uuifsHqfpy+z4npqvTIcjS4AHwVkv8pxfUOwMhd/11wT/o+/IyG1IPlCQKe93vkVukVAgseHDlBifHF550PNrZ7oqqjBGxXx88NnCIdSnkxtfCnOLoMY5JwIJleZncSoOvDYqfV1jkvbGO3G5EOkTSZC+yTFcW8CQldkfLc3bW+XJeSPrMPJIhebUDNH6HKeO4cdhhqCV2h+80++o0yMO4UNTbn4IUmi15cKS0/x4EcgzoA6JMWWgY+L9zY/yoHETH+o9Q4vn9q67FZ0Ifii70tvvDtA4zpwFGEay+Jhhopi3TajfjiJnXXFvj3OKo3CeTzA7fcctM9lgWWQseLE7H3v6ENAhVHJEWsqMLNawNCMChDiUiur7lJo9nLeTHtzCCHIihCCYYYTMY5T62s07RkzrMM/8+c7gitpEOcrmuEqaKJxF2egq5+pB4CKdGDaEOU7j4I00o/vhlWZF4LT13IJBpYKSsDOZodgZ0FiNiFlXn1AYlEhMqUoECBQTVxXm5ihBJLY8ESk5zy751G8arPY5SG6/RhKAKwKlJbdKh3Z3EV0y5veSkGZK6Q16dXomEtFiuKYxyRgJhZgoo6gs0LkE2HsBI8gsrfDu8+IgZJBLcg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199015)(66946007)(2906002)(66556008)(64756008)(66446008)(8676002)(66476007)(76116006)(4326008)(41300700001)(8936002)(33656002)(52536014)(5660300002)(4744005)(54906003)(110136005)(316002)(71200400001)(478600001)(86362001)(107886003)(186003)(9686003)(26005)(83380400001)(53546011)(55016003)(38100700002)(6506007)(7696005)(38070700005)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azhZMENvZW16QXd1QU5VWm5SVzlyUHFHZ0JnZGdYTTJ4aTZ1Mko2dWJKaGNs?=
 =?utf-8?B?N1RJK2IyNkdWd1laQ09ZeG8wMG50b0k0NlQzWWJxK3I2cGY1U2VMdzFIUVN3?=
 =?utf-8?B?Nk96R3RVTW91ZmsvM2EvOC9UdTZZMUNQMFp6ZXdhZG5PUlNKVmFDNnE5eUdi?=
 =?utf-8?B?Uzg5UERORmhrUjBCbUplQncyMk5JN3cwSjFrekQwT1R6NmtYSEFrR0VHSnly?=
 =?utf-8?B?ZlAzRHVxQzJXUUlqL2pFTnF4WWlBRGZLSHphRVRrRWhYaGg0aURiYXF6UFhH?=
 =?utf-8?B?TzlKYS9VR1BEUkVnUmI1SlZBU0liZDVuSzBpZ0hGOWFTRTE5dFhuY2FGTHJw?=
 =?utf-8?B?YlJidEtvR2pFM1ZuUFBTNHJiSFdjRFhmSW9iN09kaERVbmVSNm1XV3V1ODlS?=
 =?utf-8?B?d2J6eTZsejJkdjQzMk1WWW5Lbm4xSHdYRUwrQk9sZ3B4S3UwTFI3cDZISGtz?=
 =?utf-8?B?QjNxbzJ3NStiRDdxbFJ6UlR0NkYzOUdJLzZrRTc2RFYweFliQ0VXSGZvVXBX?=
 =?utf-8?B?L1VUVGRYNWFVZlBUTVQzbTFPdElhcU92ZkRIOU9RRHZlVXRqOGd6MEw4bVVs?=
 =?utf-8?B?dGYxSE53bkpJQnB0bzZndFBwU3FrOVQydWdwN2l2RVlyUDFRTGdYN05jMnU5?=
 =?utf-8?B?OVIxOTYzTmtxREg1ODBjK3VZZitHbmN0aEhVR3VxczVJQlc1dWxxTHZVamNW?=
 =?utf-8?B?QzVNUUUxRldrSkorR2orWWJxMURlY084bld4MlhUZnlOOCtKZFlxNkF2MG9X?=
 =?utf-8?B?R1o2U0I1YUwvOCtaRU1QTGo5T2xIM2pYYVA5YlV3T2U4Y0RzMXIxYitsTkF5?=
 =?utf-8?B?TFdDUE5UVDlkditaWC85Qk44TVphdWRPeVBOSUZrOEFnK1NEZDdjb3EyRHg5?=
 =?utf-8?B?MnE1cENVcllzS2RHbXRBS2pRZmRUL2lVbE5YUjJCdmZRQnc1WnZiaWExVlp2?=
 =?utf-8?B?NmI0YzA0V2htRGN1eGN5dHVsSmFrcUVNMWp4Ry94cTEweDZaOHJodnhyaDdy?=
 =?utf-8?B?QVZEclpNQW10UERTVG1vN000UmZibHd5dzBSM3pJMHEwZ210TlFBbUM3akky?=
 =?utf-8?B?SHQ0TWZoUEtmamlOMjZYNVR6Vk1KbVhMaXVCQmw0czEyOWFvZnRCZno2clZx?=
 =?utf-8?B?NytxR0Y3N0NjSmxsL2xyVkU2VHMrVGx2NGxKT0pUK2JMd2JURnZwV1hoaXRJ?=
 =?utf-8?B?dFVnRVNONjlMSjVaUDlDUGhMcmVIb01BUEtac1cvRzFoVTdPZ2xnbG9xR1Zp?=
 =?utf-8?B?YkxxNG00aVk4bm1HNzk3RXFRWVQzM1RCaFFsNzE2ME5rV2hOMVlBczhaSXdB?=
 =?utf-8?B?ajRmNUdlZmdBVmw2bit1Sjd3bE9HeW04VFFEbjRRSzlCbW9CS0h1STZtZzBF?=
 =?utf-8?B?VnV5dkJLZW96NVE5cjRwSDlxaWVJM1puTjhob0VUTm5UQjVxQ1ltUVlxR29X?=
 =?utf-8?B?VGdwUW5lbDZuaGlGR0MrRU00ejJkV2RscXBOQ2htamx3MmpGSXFqMnpTeHBD?=
 =?utf-8?B?Nkpla2E5ZFNKbkFMa3hBT2NZc3FWSDF5VWNlOU5DRXhRSlBmMW11Z3E3NU15?=
 =?utf-8?B?cjBwV0xTZndjRG1VQVBVekhoT0xZNFB2aFhrZFlMalgxaWxGNU9QSEVQYzhG?=
 =?utf-8?B?SXl1YVdLeG1HVHlPbkRXK3VvSkFJNG9FY05sNGMyYUhWRG9oZHFuT0U1Zmtl?=
 =?utf-8?B?VmJjUlNvZ0RTS2ZDYThjMkJDdEtTcjMrU1grWFloZVQwY1NJT05uNEVVbTZZ?=
 =?utf-8?B?MGtvWlI1Nlo4Q3hZNmw4cy9adGx1ZXh1SjZjR1MwMHVjbGEvdHlVSnB0eVBx?=
 =?utf-8?B?bnFseG9CMFVCdGQwcnF1bS9pRmg3UWRVWjlmeEoxZForS1BueVZ5Z0JmZndJ?=
 =?utf-8?B?bW80dDZIcnNkNlpYQ3lKbEhEVGtXMHM3R0E0TTJlMmNFaitJNjFZaGM2NWF5?=
 =?utf-8?B?TTVhTjVTZXRnekFDaWQrV1pOajB3ZU95Q3E3UzN1SERyTUpHblVmR0lpMVhV?=
 =?utf-8?B?TGNqbGZmeTVGWVJuYmFYZk52L1RWVEI1TGcxbWEyWjR3VVk3ekMxb2wvc1d2?=
 =?utf-8?B?ZEkwbi8va3p1Y245NDB5RnhnNEFuL2h2bzlKVW4yMzdIZ2xDbmE4MllHZGh4?=
 =?utf-8?Q?WY6RPU5zD7qiNiIZP/OBBZNBJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a8f97d-af55-4a79-e9c7-08dac19fa63f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 15:41:05.9045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQYbGc+apLfUsOqz+0Eseol+PlPMC+TnRqbyYvs1Ku3DCrHncqHu7KeaztkiUk1ItXWmWG77suyhF/bciSxHTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7807
X-Proofpoint-ORIG-GUID: TSPtiVtxbIC5DCp9vv1BPCoR_lKhhflL
X-Proofpoint-GUID: TSPtiVtxbIC5DCp9vv1BPCoR_lKhhflL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=705 spamscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080095
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
YmVyIDgsIDIwMjIgMToyNCBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAbGluYXJvLm9yZzsg
YWxlQHJldi5uZzsgYW5qb0ByZXYubmc7IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29t
PjsgTWF0aGV1cyBCZXJuYXJkaW5vIChRVUlDKQ0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxMC8xMV0gSGV4YWdvbiAodGFyZ2V0L2hleGFn
b24pIFVzZSBkaXJlY3QgYmxvY2sNCj4gY2hhaW5pbmcgZm9yIGRpcmVjdCBqdW1wL2JyYW5jaA0K
PiANCj4gT24gMTEvOC8yMiAxNTowNSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gICBzdGF0
aWMgdm9pZCBoZXhhZ29uX3RyX3RiX3N0YXJ0KERpc2FzQ29udGV4dEJhc2UgKmRiLCBDUFVTdGF0
ZSAqY3B1KQ0KPiA+ICAgew0KPiA+ICsgICAgRGlzYXNDb250ZXh0ICpjdHggPSBjb250YWluZXJf
b2YoZGIsIERpc2FzQ29udGV4dCwgYmFzZSk7DQo+ID4gKyAgICBjdHgtPmJyYW5jaF9jb25kID0g
VENHX0NPTkRfTkVWRVI7DQo+ID4gICB9DQo+IA0KPiBUeXBpY2FsbHkgdGhpcyB3b3VsZCBnbyBp
biBoZXhhZ29uX3RyX2luaXRfZGlzYXNfY29udGV4dCBhcyB3ZWxsLCBidXQgSSBkb24ndA0KPiBz
dXBwb3NlIGl0IHJlYWxseSBtYXR0ZXJzLg0KDQpBRkFJQ1QsIHRoZXNlIGFyZSBhbHdheXMgY2Fs
bGVkIGJhY2sgdG8gYmFjay4gIFNvLCBpdCdzIG5vdCBjbGVhciB0byBtZSB3aGF0IHRoZSBkaXN0
aW5jdGlvbiBzaG91bGQgYmUuDQoNClRheWxvcg0K

