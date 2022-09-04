Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4925AC810
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 00:57:24 +0200 (CEST)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUyYN-0006WF-By
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 18:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUyWn-0004we-Re; Sun, 04 Sep 2022 18:55:45 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:37016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUyWk-0007fl-Vf; Sun, 04 Sep 2022 18:55:44 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2847x69j015664;
 Sun, 4 Sep 2022 15:55:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=5j2d1ivVADVbeBypSHQmtvlOPT6KrCD5ObE2D6fE8k8=;
 b=B53p1Ux3M/klmi5dZN7vCjoeo1lLU6GC9QQLZrpXL/WXZ7mfUGqZQDrS1kGyOmDDR/4E
 pmZcky/HH/n/jAyLbPLvgPtle/n3H43DzTmVrjvLAM6lakbijPfnTNKgEAqqTfJheDqX
 haAxlzTp244NiJHBIaDNylGxg3ryvvWJkJpkd9p9+v3b/i2SM0U0/9/ZJDsLfiOLwxfS
 xpkesXk60uZHN4m7YKfeGltsV8GvxoRIaigjQbSxEXTYKe7ZZ8CFQA2pnqesWA6Zn7EI
 vTrz1uKHcW+Ig8Xa2/w3o0LIaaN4I9r/cHXMx6eYyt4aLA4FLYxvXii5dBq6fD+CrK27 KA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3jc6fyjea0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 04 Sep 2022 15:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4k5K8ahgZZQiTvtJrLsLVkZhIF58oUb76yNi18YA5mA3F7+wlEuot6Yw0mW+qFm11BVRn7YXxVkcbcI2uTwqylggDqL9G2Az+2tWVxtDamt+XMS8uYqsrMhuDfzQ05SWI/7P6s51P/nOsm3m43Q2ggmwsNC2iquEC1HTv36LPqUxpmELFRjXfm9paFOVO2DiURb60BUEDetYyTW+f8h7AsYkTZHPCSr3ifXYAppZ6QmnCLvRpUplk9p64xVfwiHfk3G9kDG5mpfD91LzcLup7PQrRgou/Cu9eIhBgnpxPmom6pJgajVNXYoV5H7HZhgslKMbiuncPzzkanPs3LL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j2d1ivVADVbeBypSHQmtvlOPT6KrCD5ObE2D6fE8k8=;
 b=YUdJ8SvM+SBtBuqLINssOxw+GGJjnjq2l5Z/1sFbBZMZs+6m3rSiWCiQhVMpBxitxA6NhYcsTgACnzlRJ8kdCotXWbmbOMqdZaUx6UHjzSWWgz9nmT+ZCbUG0AuOhMnJ+7ZudU38EfTxqJr157Jwat5JnziB6FEuo+JNlSUmNcxlTgxBEQYeS9ff+eb3EBePP0CcQIK82vsz+lm0bjyzQBrEZ7E3lXSZf8FmHby1NFjdWOgeodfLCapB6dXI1H18mzpVmZ5pp8JXvG+mWs4KvjHebFAGOshG6m9hpS+GNDsGZOWi0lB0aqnfhhsxH3Q37PO3D1jhvj8RIIdPymB9Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by PH0PR02MB7128.namprd02.prod.outlook.com (2603:10b6:510:17::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Sun, 4 Sep
 2022 22:40:16 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.017; Sun, 4 Sep 2022
 22:40:15 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "kwolf@redhat.com"
 <kwolf@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>
Subject: Re: [PATCH v2 1/8] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Topic: [PATCH v2 1/8] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Thread-Index: AQHYuVjI2VSWY2BpvE2HlUIKaNkCoq3MdnwAgABI7YCAAulxgA==
Date: Sun, 4 Sep 2022 22:40:15 +0000
Message-ID: <A7B9999F-27C5-4A27-B8AF-EBB09A0F2A00@nutanix.com>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-2-d-tatianin@yandex-team.ru>
 <20220902175112.GA5363@raphael-debian-dev>
 <50487a10-30a1-ab52-d4ba-2cd9c49835a0@yandex-team.ru>
In-Reply-To: <50487a10-30a1-ab52-d4ba-2cd9c49835a0@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.63.22070801
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f55ca9d1-49bd-493e-a2d7-08da8ec66fe1
x-ms-traffictypediagnostic: PH0PR02MB7128:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bKfYtaOQvYR+kNj+ydgcDpsOUno0+LyDri3YlPATCKqAVBNd/i9aNde+foS2h7ZNzvCEculF/ls7WG5GZerKTVWuLX7Ge6Qh8m9AiMd4jGUaygMQCDo6aFpwd2TKfv8u1hWGgplxnAzcckRWWGCIaIVQc8f6Ke6qF0Q1JUenlmlEakG+rCPdOfCXsYOr6jWSJhi2TQ1EesnhWLaJmqjV+QrnBngU+CU/wCZFJXHK9YdZH39iZ27/WuWiK4YWmA/uC0P6pxw2Pj7aWzFAx3WKYOytXJD1ZO9GU6nDJgOhr0KNDIWnFzNgHSkfJYoKHvMnMV2ZTH+Xa0aIENh48CewnuC+S6vJUMhOUVFdz8vneAkGpp1ghpoHRivw+dfq1XNBlwe5JzYQ3f+/kOG8qMZAsNLnokBP4SpqFYbhVq6DFwx8EM13o6cih0/uecOVPWM5TzvN2QgJu53CZz1Lq1Z6Taf0pnLPhURRktSJZ38xwStcy56ZDmDKPrp6bPcfy/PlO5Q0f3VEXAzj7J+44oyw7tWYAOOSgPP6ywDf44ksdjcZJIgFSWeaJFCQMQ9DZcOwjgT3IY7tXtoCnh3UeeO2FJGd2Ft8/btwWX9BxkuseCJAVhnUyVAG58wz38jwZuBnan1A5qwO2dAVNDY8GIJb6aQcKtATPncXMUe6XHoP83qnrgn9C1dUdnPwpiZdahMaZCjME6TeZd9crtWYukhrSQSIcDL+mz9S1K/wlsoyENBSey0iX4MPVyfpXx6GdXa9wIBeKTYyuINucd2ODayOFBSE6CVItkk6qrEWys6N/98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39850400004)(376002)(346002)(396003)(136003)(54906003)(6916009)(33656002)(8936002)(2906002)(6486002)(478600001)(558084003)(38070700005)(71200400001)(86362001)(76116006)(44832011)(186003)(2616005)(8676002)(122000001)(4326008)(64756008)(66946007)(5660300002)(66556008)(66446008)(66476007)(6512007)(38100700002)(316002)(26005)(41300700001)(36756003)(6506007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDF3czNERXJuT2U3TWJQSW1WeXJXOXFZYUFHeEFvOTB5VVNvNHp0VStXMWlN?=
 =?utf-8?B?dkRIWjArbTJlaDVlLzREaytyUS91a1RObWpzb2twNi9scEo5dWNlS3U2RjVT?=
 =?utf-8?B?Tlk0bEVGYW0zeDIzSWh0cWV1MmNzVUkvKytnZ1J3dmdTQmFaaGlKUzNSakRK?=
 =?utf-8?B?dHZ1eEUybmlFLzhmS0NtK3lXSFpmZDhTMmNYQ1lra0lLdnE1T05qQTQvSGVT?=
 =?utf-8?B?bm5TRWRIN3lGakphN0FYR1ZBZTdwVS9SNWdKV05rOHpnbTZ5TnJyRHhVUHNE?=
 =?utf-8?B?SGVpRG82ZDI5YWI1WlMwbnlwLzg2anR4aVp3ZFRWMkxacHd0YUpZa2w0NEUw?=
 =?utf-8?B?c1NadXFlN0NvSTJobytxMGJFRFRFUkd6anZqOW05eDkvZEZHWW5ya2JtaHhY?=
 =?utf-8?B?Y09ML3gxbXNxa0o5ZWhWemVMQlAraXpIcWRBWG0zZGM3VUs1MW5lYlRDYlhk?=
 =?utf-8?B?R2xSNVBVYkxJSU9uZlNCWU5neU4xNlAyWGZES2VIQjZSUndmV2JybU5oa1dL?=
 =?utf-8?B?YkFodk9SVzlPTkFQNVdsN2krcE15TmRLWXpSSDJidkZzWGhPbGhNVUhndURh?=
 =?utf-8?B?RmlBSkMxMDJ2NzY0cWFsem9EeCthaEhPVzVzSEh1eXpXS2JiUU1ncDV3ZXBw?=
 =?utf-8?B?NGhzVThJanoxdFlEbVdKYVpBTHBDcFgwbnZZR2dXemorcXZrdUs3TUhSaGNE?=
 =?utf-8?B?V1dkY1BpcnVwaXRDdnNkd09rQmZKaGFQMmpJQW1pS2w5Q1lQR1RMbHp1RnBs?=
 =?utf-8?B?L0ptdmVJN1IxOFRpWHY2U1VMbEhHSm0wZjJkdlN2dWl5SUdkNys0VEtpSSsx?=
 =?utf-8?B?M08yRWxYeGZQRnBPWlpoNnppRkQ4Q2NVamRkaGxOeGFlUzZydmFDdnJndXBD?=
 =?utf-8?B?OGdTTzRTMU9YbGZsbWxUd3IwUWY3WE1kMnhhazM0VURXNzJEcHlqdTR3RXBZ?=
 =?utf-8?B?RlJnb0xXczc0TVppanltdWhvQlFZSk1SSlE4VjFxcGlKRTRpVTV6WmNmUjha?=
 =?utf-8?B?VHFzd0N1Y2R2eU9vZkJIVS9HMXNidFJvYnVGLzdoNFA0eXJaaHJqN3BhbUVY?=
 =?utf-8?B?UEw5V3c0ZTVGZmRibE9mRmVpQjJvbnBIclVBVHo0RkZXUngvT3dSMEtyZDd0?=
 =?utf-8?B?RU1oRVlMdlhDeUM2ak1mMDNsaWZmeWFaSnZzMDYzY0FNeWh4d05tREp4TmFC?=
 =?utf-8?B?Z3VJRnFIbnp6TFQ3T2FRZVJJTUhYaVA0bk1SL21UZHhxcHkwbmxLTmJQM0do?=
 =?utf-8?B?bDZQQVdOYTZQUEpraW9IeXkyNC93WHRQTEZWSC9ONU12TEtQUE1VKzZGdktq?=
 =?utf-8?B?cWE3aEJKS1FNZ09JNzhQN1pyZS9velVydzZ1MnRBQllUcUFzdkNlRXluTzI1?=
 =?utf-8?B?UjRpOUx0cVFERHJSZFBHMWFORUVNb2gydHREd29sRStRZXNJWjBjL0ZYTkxF?=
 =?utf-8?B?QVk1a0dWVW5COWVnQ0c5Y1Q2U1dzVkZnQUpXQkx5dUhPc1VoKzZMRTNueUkz?=
 =?utf-8?B?REZNekhHd2szazA1K29kaHNYMVJoZGo1bUFiMlVQNDJMN1RHcVlOcHBLaVFl?=
 =?utf-8?B?WForTU1nei9sN3Q5aUxGeSsrVEx0V0ZXV1JmVVJtRnAwZ3hOZXA3blJDNDBk?=
 =?utf-8?B?dHFMMkx0K1RLaCtmK2VNd1o2Z2tzd2VOWGZXVlRLcHo5OEswa01LZFBTM0NH?=
 =?utf-8?B?YnhpYlVOSEZIWTJ2eHFIWDNmeXMwYy9LeHZDYXYxU2s3NFBLQXhTdTlkR3hZ?=
 =?utf-8?B?cWJzdkdzaEIzRzJJaUphSzkwNWl3Qld2V2FrMVozN3VLRjN1cmIwVkM5S2tJ?=
 =?utf-8?B?VS92YXh3c1ppVVBnaHQrZXNaY2k4MW50MnQzL1lEc3cxdVl3V3UybGJpcWdz?=
 =?utf-8?B?ZHc0WE16ODVTRXJSUTVGTHJyOGkwZmlFRkl5MXhQVXRDNzM4dno5UXdjdk0v?=
 =?utf-8?B?aVMrTVJNanIyVzVUYXZCUkhOOE5sN1Z6RmpRbEVXVXhmekV4dmRHeUx3RG5n?=
 =?utf-8?B?eGpWT0hRaktZbEZ6NXVobjVqTDAzelBFKzJpbVF3OUdpV1ZOcnNaQ0p4TVhD?=
 =?utf-8?B?Z0lOeFZJMEp1clI0QVJXZ2dOZ2kvUWRmaGhDTmM4Qk9aeTlXa2xYSituU0tk?=
 =?utf-8?B?SGt3VGhGRUdadEJObUNvcGI0ZXZBWUhCeFhCL0ZUaVk0ckhSU3EwZVowQys2?=
 =?utf-8?Q?nvyifwhtCgy7rXFsjEnGjlw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E72958DD2E6D14A90E15468BA302ED4@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f55ca9d1-49bd-493e-a2d7-08da8ec66fe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 22:40:15.7448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTQ4CoGa9ZAybBrXPlYqm2QOyVD5esCHJXhEVpooLqc3t4HKcWc0vsAEz57dFhYWZ3O42zw3kEf7IWuBHzIJ06G5N1I28H+KY06NyEi+E9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7128
X-Proofpoint-ORIG-GUID: T5ch_sv76pUTBU7tqIZo3Z_fdXnNpcWn
X-Proofpoint-GUID: T5ch_sv76pUTBU7tqIZo3Z_fdXnNpcWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-04_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

PiBJIGNhbiBzcXVhc2ggdGhlIGZpcnN0IGZvdXIgaWYgdGhhdCB3b3VsZCBiZSBiZXR0ZXIuDQoN
CkkgdGhpbmsgc28uIEp1c3QgbWF5IGJlIGVhc2llciBmb3Igb3RoZXIgcmV2aWV3ZXJzIDopDQoN
Cg==

