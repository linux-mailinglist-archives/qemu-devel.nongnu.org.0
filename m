Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CBB6298DA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouv2q-00019Q-CP; Tue, 15 Nov 2022 07:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1ouv2i-00017W-Qq; Tue, 15 Nov 2022 07:27:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1ouv2g-0007Q5-Vt; Tue, 15 Nov 2022 07:27:56 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFCFgtY024815; Tue, 15 Nov 2022 12:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=v5wNIfx1iS47DAqd+la/nhi5cvuGdJwf18evDhyKbIk=;
 b=EBLxIeEB+oQxxNNjgnHqdz/n2v6ykf2Js9F701GjX/k1qOqSrBH0AwImzianWDfykeL5
 kkrj8UepusMJjKJGUeb4JI7kUhHC/7jgJuJcepApt5grCnCIJaG3SJFSS1RaNtiQ6yFU
 g0g44T/tHqYxD5khVDYl5LfMf/H3ujWjY/cGJ2ZpEy7/jPH2JmqYuhPXP+cIFaVnxSM+
 IwFHemk1FNicwd6tK8H7oE6q4ceSChADJSDUg6jL5gL4mBYj4imkB0KQCM3iJD6/MS1d
 Z8Velz6L7vqcxfFuMsI8QVT72OoRjibaltdhwGbCrqw6HD2S+X2SLajGkGy14LoqZGCO +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvamb0744-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 12:27:51 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AFCHUHK028191;
 Tue, 15 Nov 2022 12:27:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvamb073f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 12:27:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOT0UbP2ZSes8QKQfgVMtrXPp8HRskCFAHFbwlpTdDHvBqMsk2kx6n7yHZH4tUC06XqmdiOuwV4bJgqsZNlVGsopmuwHiYxQLh+3VfDjTn7xNS0hVYUSQlu9634s0djAO6RkxdMvnpm4pRtMPDkNSDCVsXWzehG2Vyj2oez+oOlo43F5kZuJAnmwo7bxNoS0ookUxc3SS6fcvVjokODXJRjfvTYzBNID/L9Kd06xXi4jqcLdC6nl9cX+H43VufA7DfdhpjA/LW2OhsPj4xZWXv2VEJQ25SRm1IlAaWU3cTQm8kT3cIyrehXM/mcqHoWUWd4QpaLQZvLR6us7i2H8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5wNIfx1iS47DAqd+la/nhi5cvuGdJwf18evDhyKbIk=;
 b=lhUDuZ85d0nFW7mmGf95Q0VGcV4ZDB6w4/T6oe8jKucn56jen/k3vdfLaQRvUXjP15ptWNd5EWYuDuS7OCcxEm9Qt5RUk/F1AIzo3r4TZlbI+1VJyYhmJjuq+sVzBEvmryy2jceZeBCQoJx2dCRhyXEJg/Q5cZnCoW34aTwXcUf3o2yASVBa7fG4kA1lNFi9CF2EaNSBvHXuvhwY2zFbKANSy5n5BIsqTV2PLSFZtFNGwgDzSlHg01EjYDwteT3hOXjbFgKHVKd0J8yOLEd8JN8xG0LyrU81stCBqRXJd5cxtMhEYA2NuXWyllMhM3PXXHFBwflZjDh+OprLRhLFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=il.ibm.com; dmarc=pass action=none header.from=il.ibm.com;
 dkim=pass header.d=il.ibm.com; arc=none
Received: from MN2PR15MB3488.namprd15.prod.outlook.com (2603:10b6:208:a6::17)
 by MW2PR1501MB2139.namprd15.prod.outlook.com (2603:10b6:302:5::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 15 Nov
 2022 12:27:49 +0000
Received: from MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::95f:9dc4:235d:c082]) by MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::95f:9dc4:235d:c082%7]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 12:27:49 +0000
From: Or Ozeri <ORO@il.ibm.com>
To: Ilya Dryomov <idryomov@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Danny Harnik <DANNYH@il.ibm.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v1] block/rbd: Add support for layered
 encryption
Thread-Index: AQHY6RfIlldlnETy2EiJ77oJUp1rra45yQKAgAL2QeCAA0IRgIAAB1XA
Date: Tue, 15 Nov 2022 12:27:49 +0000
Message-ID: <MN2PR15MB34885DED21F27D9B11EDF5788A049@MN2PR15MB3488.namprd15.prod.outlook.com>
References: <20221026084836.1819572-1-oro@il.ibm.com>
 <CAOi1vP8X6xeuYmPwTS=LivU=XeCM-WDERrCOAySWJauvsOs_iA@mail.gmail.com>
 <MN2PR15MB34884E9308FA492030A81E3A8A029@MN2PR15MB3488.namprd15.prod.outlook.com>
 <CAOi1vP8eddYYCCuJrPOn_10Du9rG1eAiGDLZtdsaaRFepq8dsQ@mail.gmail.com>
In-Reply-To: <CAOi1vP8eddYYCCuJrPOn_10Du9rG1eAiGDLZtdsaaRFepq8dsQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3488:EE_|MW2PR1501MB2139:EE_
x-ms-office365-filtering-correlation-id: 89dd9518-fb2c-4bac-2e78-08dac704cee8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WU54C7k/bQ4jE1Ty85q9ma32TEbo2M3QzBpNjI4BlT6LljJDZp4etIOrdaN0WS7PXOKzWM8tNE2Q6N7ylZWHJVLoglpQgezzMxpSx5GH/vE3UBmOtx3TXlB6l6qQnkf7ExLpad+gtwRXV69W0jViFGtkb1v5mctMTDsdGJ7tiOQIX148x1oSSf4c8HgttqONHyAHmLzDZZpfDejEFa7M9fCGhCngE30G1GvaEdpQIu5X2gtgq68sYgw3CtxRAWzCCg+cpJu3hMDGdxsg6FFLqoDiCRs1WEIZSlkkljMz1d8IZx8NlOHqkKpjVXY2DMcXEr6msl1hPBo3gzjnqFqXs5byxHoT8UR94xw2LmQuRl7lQ5uiDJU2tS5CjBckHLLvXoqaIrxy15+Bgn7Q2EsJ9k7NvGRUTK0tmbViPPCXO6ePhOP8s+l9mv2WjLTjMTJi3MjqGGjGAVATV7nkCsKVXHXfLkTcHKQmVweUmzOdNmBS0C2h/MpC6GfWQWtspcEyP2sf23zeiDi7sR9NjVvfMByckMrSdrNeIbB2cSLXj23cn9aK3HpFp2QlfCJkbj+gZqdzU1E8LZMhLM1FgEfzAolqBm33gUWgK25f6CfTU76r5+AXOFRlB4oE6/VRa29+Cp/jHuKZMi2NIhNjSBlBirdI6Pqw5H1twvREDWuxTBuHQxcqg0xyj6XGdDLTHvD+K+Gjv0TvysLppOneOM/AzZxbUpzfTO4UBnslecv8W8+cwPxXVflTh6KPuZsd0W9xR/AeAPXSe9aFZZrOQiuCJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3488.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199015)(2906002)(5660300002)(186003)(38070700005)(83380400001)(8676002)(66476007)(41300700001)(478600001)(64756008)(66946007)(76116006)(8936002)(52536014)(71200400001)(33656002)(54906003)(55016003)(4326008)(7696005)(6916009)(316002)(38100700002)(26005)(53546011)(66446008)(6506007)(9686003)(86362001)(66556008)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUZUa2EzWFpGZG1nMnR4QkJSTldBZ2Znc0RBNVdkVWhNSkJ6K0VKSUZHaTJy?=
 =?utf-8?B?NXZROVIyOVpTRWQ5OEhjQzNCSEhvNUk1c0RidDBlRWdYa2ZaV1pBZWNscjcz?=
 =?utf-8?B?ZnJRY2RQSHgrbXYxUWl2Tmx2b2tOdGt0UVBVZEpPaS83VUJxNlczS3ZDVHB0?=
 =?utf-8?B?d0tXTko4MFpYcVlJR3hoN1FnZDJoT2VGTGt5bE85ZXg5bVV4NXpNNVZhQkQ3?=
 =?utf-8?B?NElXamJPbU9ISlpYenJlYUVlcHBrK1p6MTN5VEVZVCtRbi8wWGFIdWovLzJi?=
 =?utf-8?B?bFozMmNlQTdOSlNFbUJYSEwzcHdHSytoTCs3aG9yNFczeDRDMFdjVDArNDg5?=
 =?utf-8?B?SmJPNHBzQ0IvRDlSRm40UUc0QTJFbmxYMmZOaUJRVUlBZFpEcXE5TDBBSTk0?=
 =?utf-8?B?UWtWZmswK3I5Znp4THl4d2JvQklYVUZIUHQvQSthTlNJMHhsSHBJN0hVWnFF?=
 =?utf-8?B?bndmN216cHN6NkdjdkZzaWFuODJrVW9LdmRRUmZQL1lDMnpwWkVITW5RMmd4?=
 =?utf-8?B?eCt5NFcxYTVPZDlrMFQ4WDZjVnorZWpwWm9oaGt2K3FIS1FPMTJyUzdkTFVz?=
 =?utf-8?B?alMyRHFpa3dBK1VpS0txWWY0clY2MzJhWDBVYnZKVUw4MUkwUW5RdC9Ra3J6?=
 =?utf-8?B?TEtaMVhySXE0T2lDQlJMcVB0VTAzM2FIT3M4eXRjNCszb0YyRy8rZXJqR3Rr?=
 =?utf-8?B?OElyN05GMjBIV2w5MHhRSEtUbjJleXUrMzNEeFYrQTJzWEttcXpLdVJWVCtR?=
 =?utf-8?B?aWE1dWUxaStlZHJzQmpkRk0zNG5xUlJ3S1VyODFmMGpmd3YyK01vUnJpSDhL?=
 =?utf-8?B?Z0FwaUJjUzAwcW81WTMzOEZIVzAvdTVuR2xYN01JN3pmYlF4VEIwc0hhQThB?=
 =?utf-8?B?L3BQTGZycEdEckVZUGQvTUt3SlQ3bVRKT241UjZwa2tVSEFEdmw2eXVvMC94?=
 =?utf-8?B?M3BKRGluQ0RudXdDMWJ2a1ZsMENZamw3REt1d0NkZjdrV3RoVDNFMnNhMExh?=
 =?utf-8?B?UzY5cEpmNUlEWVpCZ0hxQWpkQjVZcDdGdmFuaGsyVVRUNC9EeGF4ZE4vRjFH?=
 =?utf-8?B?V20rOWt1cU05dzQ2ZWViOUo0d3NHeWVNZmpPWms3OVZtK3pTeEE5a2N3SERE?=
 =?utf-8?B?M3BGVWhqdjd2Mmt3VUJnbG9kdjJ3TnY4cjMraDhpZndqSWFRSmhxK0Y1U3I2?=
 =?utf-8?B?VmRpOVJ0RGVOcDBKS1hRQW9ENmk4WHFNbExDNU9aY29FTEVRU3djY0IvS2hm?=
 =?utf-8?B?TWN6RGUrUTY0ZUQwRjFtNFZwOFlUaVJqdHFXaG93dGJjOEQ5ZjNMTlBhSkls?=
 =?utf-8?B?WEhsL2xmcXJUQzRZRnF1Mm52ZTlSZlA5djBPWGNCQTFhZHlhbVFVcG8rZndU?=
 =?utf-8?B?bVhxK2xCNFRTSEhORU1UalVKNzA5TWNJbXJJcE5VTXorVThEam03Y1hWNmFP?=
 =?utf-8?B?VFRENGJGWHBqZ3FubUtWMUR4WHVQQ0NQdTRjY1cwSSs5TkU2STlqU0krQms1?=
 =?utf-8?B?ZDc2Y0twZUFBT2Y3Si9MMGpLRjhUMDNLQ0lZbk1NNWh3ZUZoMkV3bEd2Rmp5?=
 =?utf-8?B?Z1kvdHUyV2tncHhMZE1HcXh4am9Ddjh4VGtIcC9pZGRLMWJNcmFmYldISjRV?=
 =?utf-8?B?UjJpMEk5N1pHSEh6RytacmhoZ3ZMY0lETEgzeDFTMzg1YnBuN2t0d2RNSlhk?=
 =?utf-8?B?NjhZOGJMZnhldElxa1ZFSnFOQ0lsNU52QkNhZUdZR25yTmhWakovVW51bkJx?=
 =?utf-8?B?K0NRb2RrUXY0a3lLRXBHT1poeWxoUjhicnVHRm9ESkpkL2VCTFA0MHdiaDJx?=
 =?utf-8?B?NXJjMmxvT0pqMWFQNE5wdlpxMHk5bFo4cHhPWHB1ZFBEOWtrblFWT1U3bEhz?=
 =?utf-8?B?QXZFeXFjcHlVRkZvd3IvYjRtUDFJb2Uwb21idUloc3VUSVpuOE0rdjVhaVJl?=
 =?utf-8?B?a1M3bENEbFhraGVpc0QzS0xqWVIvZjlycVFWSmp3ZXB3KzdETnR4M1lvSlV2?=
 =?utf-8?B?bUZ4RUpJdGdBdjJva3pWMExMU0o1djkxNXBZNFFaZWQ0N21jSGtiNHliUng1?=
 =?utf-8?B?cWlzekV4U2tTTDdUUVpwTTdKbGZ5QTY5c1lmaXVKdEkxQ1UrNkM3TUtWRXkv?=
 =?utf-8?Q?K7vc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: il.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3488.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dd9518-fb2c-4bac-2e78-08dac704cee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 12:27:49.0997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ww/dWrCbLnOQDgiRU5GdYWKK1UCHlva619vOB7il9W7quFU4iXW+RFBDJi947K6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB2139
X-Proofpoint-GUID: 94hpXLPfvbwqm-pcPaSHXLiN5UDAA3KV
X-Proofpoint-ORIG-GUID: HFsP8gqnf4TipsqhR3Vx4zskyuJ-oDHk
Subject: RE: [PATCH v1] block/rbd: Add support for layered encryption
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_06,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 mlxlogscore=734
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ORO@il.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SSB0cmllZCBjYXN0aW5nIHRvIG5vbi1jb25zdCBhbmQgaXQgc2VlbXMgdG8gd29yay4gQ2hhbmdl
ZCBpbiB2MyBub3cuDQpJIGRpZCBub3Qga25vdyB0aGF0IGEgY29uc3QgbW9kaWZpZXIgY291bGQg
c2ltcGx5IGJlIGNhc3Qgb3V0IDopDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogSWx5YSBEcnlvbW92IDxpZHJ5b21vdkBnbWFpbC5jb20+DQo+IFNlbnQ6IDE1IE5vdmVt
YmVyIDIwMjIgMTQ6MDANCj4gVG86IE9yIE96ZXJpIDxPUk9AaWwuaWJtLmNvbT4NCj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyBEYW5ueSBIYXJuaWsN
Cj4gPERBTk5ZSEBpbC5pYm0uY29tPg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0gg
djFdIGJsb2NrL3JiZDogQWRkIHN1cHBvcnQgZm9yIGxheWVyZWQNCj4gZW5jcnlwdGlvbg0KPiAN
Cj4gT24gU3VuLCBOb3YgMTMsIDIwMjIgYXQgMTE6MTYgQU0gT3IgT3plcmkgPE9ST0BpbC5pYm0u
Y29tPiB3cm90ZToNCj4gPg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gPiBGcm9tOiBJbHlhIERyeW9tb3YgPGlkcnlvbW92QGdtYWlsLmNvbT4NCj4gPiA+
IFNlbnQ6IDExIE5vdmVtYmVyIDIwMjIgMTU6MDENCj4gPiA+IFRvOiBPciBPemVyaSA8T1JPQGls
LmlibS5jb20+DQo+ID4gPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWJsb2NrQG5v
bmdudS5vcmc7IERhbm55IEhhcm5paw0KPiA+ID4gPERBTk5ZSEBpbC5pYm0uY29tPg0KPiA+ID4g
U3ViamVjdDogW0VYVEVSTkFMXSBSZTogW1BBVENIIHYxXSBibG9jay9yYmQ6IEFkZCBzdXBwb3J0
IGZvcg0KPiA+ID4gbGF5ZXJlZCBlbmNyeXB0aW9uDQo+ID4gPg0KPiA+ID4gSSBkb24ndCB1bmRl
cnN0YW5kIHRoZSBuZWVkIGZvciB0aGlzIGNoYXIqIGFycmF5LiAgSXMgdGhlcmUgYQ0KPiA+ID4g
cHJvYmxlbSB3aXRoIHB1dHRpbmcgdGhlIGJsb2IgZGlyZWN0bHkgaW50bw0KPiA+ID4gbHVrc19h
bGxfb3B0cy0+cGFzc3BocmFzZSBqdXN0IGxpa2UgdGhlIHNpemUgaXMgcHV0IGludG8gbHVrc19h
bGxfb3B0cy0NCj4gPnBhc3NwaHJhc2Vfc2l6ZT8NCj4gPiA+DQo+ID4NCj4gPiBsdWtzX2FsbF9v
cHRzLT5wYXNzcGhyYXNlIGhhcyBhIGNvbnN0IG1vZGlmaWVyLg0KPiANCj4gSGkgT3IsDQo+IA0K
PiBUaGF0J3MgcmVhbGx5IG5vdCBhIHJlYXNvbiB0byBtYWtlIGEgZHluYW1pYyBtZW1vcnkgYWxs
b2NhdGlvbi4gIFlvdSBjYW4ganVzdA0KPiBjYXN0IHRoYXQgY29uc3QgYXdheSBidXQgSSBzdXNw
ZWN0IHRoYXQgdGhlIHVuZGVybHlpbmcgaXNzdWUgaXMgdGhhdCBhIGNvbnN0IGlzDQo+IG1pc3Np
bmcgc29tZXdoZXJlIGVsc2UuICBBdCB0aGUgZW5kIG9mIHRoZSBkYXksIFFFTVUgYWxsb2NhdGVz
IGEgYnVmZmVyIGZvcg0KPiB0aGUgcGFzc3BocmFzZSB3aGVuIGl0J3MgZmV0Y2hlZCB2aWEgdGhl
IHNlY3JldCBBUEkgLS0gdGhhdCBwb2ludGVyIHNob3VsZA0KPiBhc3NpZ24gdG8gY29uc3QgY2hh
cioganVzdCBmaW5lLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gICAgICAgICAgICAgICAgIElseWEN
Cg==

