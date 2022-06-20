Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C041C552772
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 01:02:56 +0200 (CEST)
Received: from localhost ([::1]:56414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3QQ3-0006pE-Ko
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 19:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71706c1562=pdel@fb.com>)
 id 1o3QOg-00066N-91
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 19:01:30 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:61358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71706c1562=pdel@fb.com>)
 id 1o3QOe-0004PD-3f; Mon, 20 Jun 2022 19:01:29 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KM1p5V031041;
 Mon, 20 Jun 2022 16:01:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=rURI3FO9oK07lHa2sZDOO4ne5oPBNTDVnq/TzyWibGk=;
 b=hZNSwRM+1anU4i0xL9ZU+dXZhmFyMRNarGQCSyP0iPC9o9cprG3u+e2FrxeaFrtklVBg
 YYBaXcb+VhsaikuE+XCe3JyvHedizjL5PEfFrG39IN0DroAQYSSKvLUnaJf4T+W9OqAV
 vqjOUjZMxXeBwYfZFzPv/RbQ2Eysd0bddH0= 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gsarpcfgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 16:01:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWqqUKnpx505m22mNq2mkQhh+5pG9S/74q7xen3fn/pIuVWc3AgrnIx3Ic19sYpGRlkWXYs2sdkpFi+lkGHVChldPdMAqiNQGoai8XgAHKJcWvnsoQo7jyehYzeY5UUD5cXzpCMSyj7eNKv5NOlBc8K0omN//hxZgNdGdDLEiBKxEZ0axXjeBbSyt+07HMR8JO/PSboEMTlHW0niu5NFcnODkkXxoY0D2kh0cQEfI5tR1DGOHXJD5DDuCudgUiQ9wYjG2hif5YBmt22O4Xz5V7DiogIlYKGJiTcxY6EfQ6+0CdhdaEhRxNhmb/H+H1pFMnqnKwf+Q4+r7DDG8e2lJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rURI3FO9oK07lHa2sZDOO4ne5oPBNTDVnq/TzyWibGk=;
 b=mQpWPit4vpIrza5stGy+KAvpvH9Zcui3L7qa8IhdVba9dDWcymoK8QtWbkHuhh8leKX01TAcClmY0NHuCcwJULy7gtEEn52CcvVk2aDAW9h3gO8CdXLeDbysHqqS7BdACpMtJ9qVzpyJkQAPCUK6MBW+HspNK/aOShIjaZIaD+ATQhV2oeqRMiVxYusowPb45TLY22Y1L8mNPitQa34QeAtQkXOXrviAx0jtlPHGhQn2WH92o0aq/fvcfVF3FN/HOkIkkUlPI+LqaS7/FWg5EhBVcyDSwQZM3ijvVeCDOaHcwBpfxnK+dAT6lu1jUMhSrNSMJ92trX+13y1zRCZpnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SN6PR1501MB2190.namprd15.prod.outlook.com (2603:10b6:805:5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.21; Mon, 20 Jun
 2022 23:01:23 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::5812:71cc:63fb:1081%7]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 23:01:23 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eblake@redhat.com"
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>, Samuel Thibault <samuel.thibault@gnu.org>
Subject: Re: [PATCH 4/4] slirp: Add oob-eth-addr to -netdev options
Thread-Topic: [PATCH 4/4] slirp: Add oob-eth-addr to -netdev options
Thread-Index: AQHYgR090Sx054Gy7ESbOLRKrfcmoK1U86qAgAP9boA=
Date: Mon, 20 Jun 2022 23:01:23 +0000
Message-ID: <F3F7C834-C0A4-4528-A90C-6D86A3F9789B@fb.com>
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-5-pdel@fb.com>
 <20220618100533.eb6frd5wu2hyfncu@begin>
In-Reply-To: <20220618100533.eb6frd5wu2hyfncu@begin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7351998-da53-4547-d931-08da5310cc33
x-ms-traffictypediagnostic: SN6PR1501MB2190:EE_
x-microsoft-antispam-prvs: <SN6PR1501MB2190B5477AC32031FF4F98C7ACB09@SN6PR1501MB2190.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6fThWbPANPoVPkSVhe5zv2YxL1u/1Ab2t9w526kVutBfssNbiA1vkfiF1B78BtfWrNVejnMsbWJ9Uk/smQBAW33qyZ7kldKK/PJVKvVkUIWLuvHY+RrbY739SVGWCtXcKSfoEvrdM+GpH/KTVcX/2oBosEcU/gDmsE0mt1U/DZV/S2oH2Sls5SZptNAXt8KFMh7DcappmGQ0RkVYh6romev4Bi35Fx4Bj7LrqrZebSz/1ejCIBCZ8iWbtNFuKtqDMEq/1o6skWBe1A7UqJz/CQp4e6pULlfxtTmj+M1q4wE6RuOYigfKv3tYKSn1h1n/ToK9ANE9m+kN6vwgHBoX66Q+PfBArimlWWHvg2r5tLc5+quoyMI6IQXfEJ7WfGFWEX8molfzIV1MpxVPL/wJTUnUHxNUTolxYxd4zGJSEf/WiiPPBuVlZ3Xf8dmzaEWrTOeuipNq4yqf0e9oHSR8Dj0BmbCuhKNgwzjhwtWl+oyfL6G3h+gJT+pXCMTiIL1eUNsPRw6aXTYZ4dFes9rV91PynqQpYnhD2vosaofe7SnjcDmqqbAjXo4d/DA3cwbO4Thq313YJ+USWrX+pzqxE3y6TFrEfw7OmWaVhJG/6cqq84RLBxfBuhu387QNzYhRLuepKCqbmk4FIkzrF8RJKFB/YbRBV/+mx9kKtUAofXENLjJYakDDz5r9XmEBi7JBT8DR6wGsMNEuT9BISdyXbVh+WKv9QuSqZkDxaVj/QjpyFqq3poOZaK4yNdnv1ybNjyUnN4GY5eZv5CAHdBgP9fa3Euy22Cx+jjdKTLEUTBbdWr6M/osg7vynA4hGc7qn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(66556008)(6512007)(53546011)(2906002)(86362001)(6506007)(66446008)(66476007)(64756008)(66946007)(109986005)(38100700002)(38070700005)(91956017)(76116006)(54906003)(316002)(6486002)(4326008)(8676002)(33656002)(36756003)(71200400001)(478600001)(8936002)(5660300002)(122000001)(186003)(83380400001)(66574015)(41300700001)(2616005)(966005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVFrUVpacTR6S1YwS1pqdERFVGZEeXdzNk5CRTF4YzZESW1HcHZJZGdhaWRR?=
 =?utf-8?B?YmR6MFhKTERJZ2xuZy9QSVNHQ1lUalZEMGkwYkRJQTBRMEpNOFl3MjdoUXB2?=
 =?utf-8?B?NXZiaFZSUko5NEJZZ1Y4RHNKVWVjZGJKMWZQMW16dlllQXp0NHhQOVoxV2dV?=
 =?utf-8?B?MHNvNWhuKzl2Vmt4Y0lVNGVQcVl3aFg4SCtlVnZFS2hoYUFzZ0I5amRHTUZx?=
 =?utf-8?B?T0pQeVhsdG0yUjJtdDVKOGlVVVdrSTlvRmlHSFlWVGZqeEtSUnUyZVhPc0xy?=
 =?utf-8?B?Kytla0tmVkNRN3ZqYjYvZ2IrdStueVpuMStlMjJpYTZRU0I2UjBpcFZTaWtB?=
 =?utf-8?B?TmlxSXVLYjN4R1J3UURXZFgrRFFoaVlQN05uS1g1amZsVmpPWEhoTFA0M2hR?=
 =?utf-8?B?K0VZQUEzeHNvRFZGbzJ6UmVReWNFUTBBclV5TmJsYTZMK2ZXVzV2Y2FaQkZr?=
 =?utf-8?B?bFhSOGlsRjRmU2tMVWRNdlNPL214L2Q0eTdhbkl1eTV2RVB3SEgrRm9sUGFo?=
 =?utf-8?B?TDhxckxYZkxxcjcxTDB0T2J5SU5MakZXVE12cm5uMmdQSjNyU0UxRVpuUHpL?=
 =?utf-8?B?Ym95VURxdVFBa08xQnlMbG5pNklzTWt4N0hBRkZ4OW1VcUM5eFpwQjJVSHVT?=
 =?utf-8?B?anZFVE9lZ1BuVjRQTlBaMHc2eXBQbzYxcHdNNlA4bm5pN256K21yT0ZZR0xj?=
 =?utf-8?B?TXd0Zmltc1pTZ20rc3ZQWkZkQ3RUb2NaZEN1U2VmODdHZmlnV0UzSVNVMnI4?=
 =?utf-8?B?d1hadEVmZnZybldickdGQ0tyTVRQTHhVMmNvVXdNTzdMVldGRHBuMEdyd2Zw?=
 =?utf-8?B?TVdvZHAyKzBoc2FhcVl5aC93VTFHZ1g1V2xHekV4N2t5M0hZM0NuWldXcVNS?=
 =?utf-8?B?eDcvMUczaUJqT1ArSm9WWW5PZC8xOENEOGo2MnNZdXZhWFowdGo4YktCdUJj?=
 =?utf-8?B?ZnZka3VxZkZvREZ0VmpwUzMyOE9lSE5uSEpicXN4bG1TcEJBVGhObGRqUGFQ?=
 =?utf-8?B?RDBBL0JwWm9Eb01LdnRDSkYwYm9sV1BsSFFzOVRYYitsZGo3bUlhOU0yVE50?=
 =?utf-8?B?SndmKy9HMTB3bUlwWXFSTmlXeVlqYklBN0I0MnZScE5vbytoSmlVQjNOc05x?=
 =?utf-8?B?R29DdTk1NTFaUS82N1ZhMmJNM1BFUWhHSWczRFEzTVJORDQ1enF3WXZVcGxX?=
 =?utf-8?B?MnBPa1ltUUdEcndxeENvT3pkTklPY3Rqa1RhZ2hWZlAzcDBkcFFLRG13RkZl?=
 =?utf-8?B?M2NZVnVabFhjNkVnN1FpTmdpejErTm45VzRxVkhEeS9mMVBpSXROU2NXK0RN?=
 =?utf-8?B?WEUrTWkwd1hoR2lUTEN1NFNGL0N4bGF6STRza2E2Zy9LTUxUamhESTlnTlJF?=
 =?utf-8?B?U1BDWHdqRTNNR21tWmE5WFlRa1lmeDdsRjZ0dTdLcVIxbnEzNk1ob2dLVmVW?=
 =?utf-8?B?c1JDV0FYVm1Mc1c0WjdFazI0V1pjS0VNaGdPdHFOQys1Um54azFva1VJclpm?=
 =?utf-8?B?Zk42T3VHMzVxUU9PTzRoQmdMU3ZlRlE0bEVWNkVlb3U2SCtCR2pZMFNNRk1l?=
 =?utf-8?B?eWxjdUJFZkNpazRlak5HbFR4b21SdUZzenFtenpUN2h3cUlSRmsyNWFUM25Q?=
 =?utf-8?B?Zkxid3FrRXlHN1FCK3ZUeWswSTVwdk1kZldKcVZrS2hmd0FzTC9BOU5HVk9Q?=
 =?utf-8?B?aTZGVmlEOURuVDNtekd1aHk0Y3ZITlQyeE9iRSs5bHlHMGx5OTl6MW1kd2Rl?=
 =?utf-8?B?Y3k2MmdqQnM3ZVdMckpBNU0ydURxRnpGUmRnd3lGWjBVb09oelhJUlhCNkEz?=
 =?utf-8?B?NXhUaW5pTnNja0NhbmJNRU0yc1ZDdkxkaUVuUzhkdVVvTzhlWG1JNG9zUmNJ?=
 =?utf-8?B?UVdEVlZjYy9HbWFFTE14eSs0OW85eWMxeWRhYW1PK0VpY2p6eE1NY2dvSlZx?=
 =?utf-8?B?ZnR4V2VnWnNUWmtSWTRvLzUvbmdtdmVGWlA3cEhMemZKZ2lIZkhmUVFkMTdG?=
 =?utf-8?B?TnhMbmMrNnhVQWhYcGFVRmZYNE1ndEVJZTZseDJaNThwUVlYbm0zY1JVelk2?=
 =?utf-8?B?a2dsREo3TmdUREZFVG1LL1AzRTc0Q3lQdzgvMldlNG9ZRmV6WFgvN0xES094?=
 =?utf-8?B?WEVuYVVudUZLOTN5L3VpbC8vY1lucEdwcWdvV0NkcTliWjllY0xWMVhqdEw0?=
 =?utf-8?B?bVBUbVJyTGlEVG9nelUwbDRrbXVzaE5GOHJGcTJ4WU11YkRQQ2Nid0I5M0dT?=
 =?utf-8?B?SzF3YnNGVWUybXBrZzJOSjd0MTZQUEY3WUFrTkdyWHlmb1hvdkw5SDFUdGda?=
 =?utf-8?B?TFhDSGZzeFJ2RnY4d2JIOVFGQ0VLUFd6bG9Uc1dZdUxTNW9oTTJaQnhpeTd5?=
 =?utf-8?Q?gwabUzYll0xGgGGE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80F858FC90058A46B149E35DFE428EDE@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7351998-da53-4547-d931-08da5310cc33
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 23:01:23.6566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jHf6B9Lv9tXa2zsuqWvCjhFmbgi9W5Sg6DhpPoeVisdPwC2OuJJT36OgLOljHlxd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR1501MB2190
X-Proofpoint-GUID: oFIv_52E_I0A5ig4gV2734hRI_BLdelj
X-Proofpoint-ORIG-GUID: oFIv_52E_I0A5ig4gV2734hRI_BLdelj
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_06,2022-06-17_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71706c1562=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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

DQoNCj4gT24gSnVuIDE4LCAyMDIyLCBhdCAzOjA1IEFNLCBTYW11ZWwgVGhpYmF1bHQgPHNhbXVl
bC50aGliYXVsdEBnbnUub3JnPiB3cm90ZToNCj4gDQo+IFBldGVyIERlbGV2b3J5YXMsIGxlIG1l
ci4gMTUganVpbiAyMDIyIDE4OjA1OjI2IC0wNzAwLCBhIGVjcml0Og0KPj4gV2l0aCB0aGlzIGNo
YW5nZSwgeW91IGNhbiBub3cgcmVxdWVzdCB0aGUgb3V0LW9mLWJhbmQgTUFDIGFkZHJlc3MgZnJv
bQ0KPj4gc2xpcnAgaW4gZmJ5MzUtYm1jOg0KPj4gDQo+PiAgICB3Z2V0IGh0dHBzOi8vZ2l0aHVi
LmNvbS9mYWNlYm9vay9vcGVuYm1jL3JlbGVhc2VzL2Rvd25sb2FkL29wZW5ibWMtZTIyOTRmZjVk
MzFkL2ZieTM1Lm10ZA0KPj4gICAgcWVtdS1zeXN0ZW0tYXJtIC1tYWNoaW5lIGZieTM1LWJtYyBc
DQo+PiAgICAgICAgLWRyaXZlIGZpbGU9ZmJ5MzUubXRkLGZvcm1hdD1yYXcsaWY9bXRkIFwNCj4+
ICAgICAgICAtbm9ncmFwaGljIFwNCj4+ICAgICAgICAtbmV0ZGV2IHVzZXIsaWQ9bmljLG1mci1p
ZD0weDgxMTksb29iLWV0aC1hZGRyPWRlOmFkOmJlOmVmOmNhOmZlLGhvc3Rmd2Q9OjoyMjIyLToy
MiBcDQo+PiAgICAgICAgLW5ldCBuaWMsbW9kZWw9ZnRnbWFjMTAwLG5ldGRldj1uaWMNCj4+IA0K
Pj4gICAgLi4uDQo+PiAgICB1c2VybmFtZTogcm9vdA0KPj4gICAgcGFzc3dvcmQ6IDBwZW5CbWMN
Cj4+ICAgIC4uLg0KPj4gDQo+PiAgICByb290QGJtYy1vb2I6fiMgbmNzaS11dGlsIC1uIGV0aDAg
LWMgMCAweDUwIDAgMCAweDgxIDB4MTkgMCAwIDB4MWIgMA0KPj4gICAgTkMtU0kgQ29tbWFuZCBS
ZXNwb25zZToNCj4+ICAgIGNtZDogTkNTSV9PRU1fQ01EKDB4NTApDQo+PiAgICBSZXNwb25zZTog
Q09NTUFORF9DT01QTEVURUQoMHgwMDAwKSAgUmVhc29uOiBOT19FUlJPUigweDAwMDApDQo+PiAg
ICBQYXlsb2FkIGxlbmd0aCA9IDI0DQo+PiANCj4+ICAgIDIwOiAweDAwIDB4MDAgMHg4MSAweDE5
DQo+PiAgICAyNDogMHgwMSAweDAwIDB4MWIgMHgwMA0KPj4gICAgMjg6IDB4MDAgMHgwMCAweDAw
IDB4MDANCj4+ICAgIDMyOiAweGRlIDB4YWQgMHhiZSAweGVmDQo+PiAgICAzNjogMHhjYSAweGZl
IDB4MDAgMHgwMA0KPj4gDQo+PiAgICByb290QGJtYy1vb2I6fiMgaWZjb25maWcNCj4+ICAgIGV0
aDAgICAgICBMaW5rIGVuY2FwOkV0aGVybmV0ICBIV2FkZHIgREU6QUQ6QkU6RUY6Q0E6RkUNCj4+
IAkgICAgICBpbmV0IGFkZHI6MTAuMC4yLjE1ICBCY2FzdDoxMC4wLjIuMjU1ICBNYXNrOjI1NS4y
NTUuMjU1LjANCj4+IAkgICAgICBpbmV0NiBhZGRyOiBmZWMwOjpkY2FkOmJlZmY6ZmVlZjpjYWZl
LzY0IFNjb3BlOlNpdGUNCj4+IAkgICAgICBpbmV0NiBhZGRyOiBmZTgwOjpkY2FkOmJlZmY6ZmVl
ZjpjYWZlLzY0IFNjb3BlOkxpbmsNCj4+IAkgICAgICBVUCBCUk9BRENBU1QgUlVOTklORyBNVUxU
SUNBU1QgIE1UVToxNTAwICBNZXRyaWM6MQ0KPj4gCSAgICAgIFJYIHBhY2tldHM6MjUzIGVycm9y
czowIGRyb3BwZWQ6MCBvdmVycnVuczowIGZyYW1lOjANCj4+IAkgICAgICBUWCBwYWNrZXRzOjI3
MSBlcnJvcnM6MCBkcm9wcGVkOjAgb3ZlcnJ1bnM6MCBjYXJyaWVyOjANCj4+IAkgICAgICBjb2xs
aXNpb25zOjAgdHhxdWV1ZWxlbjoxMDAwDQo+PiAJICAgICAgUlggYnl0ZXM6MjQ2MzggKDI0LjAg
S2lCKSAgVFggYnl0ZXM6MTg4NzYgKDE4LjQgS2lCKQ0KPj4gCSAgICAgIEludGVycnVwdDozMg0K
Pj4gDQo+PiAgICBsbyAgICAgICAgTGluayBlbmNhcDpMb2NhbCBMb29wYmFjaw0KPj4gCSAgICAg
IGluZXQgYWRkcjoxMjcuMC4wLjEgIE1hc2s6MjU1LjAuMC4wDQo+PiAJICAgICAgaW5ldDYgYWRk
cjogOjoxLzEyOCBTY29wZTpIb3N0DQo+PiAJICAgICAgVVAgTE9PUEJBQ0sgUlVOTklORyAgTVRV
OjY1NTM2ICBNZXRyaWM6MQ0KPj4gCSAgICAgIFJYIHBhY2tldHM6MiBlcnJvcnM6MCBkcm9wcGVk
OjAgb3ZlcnJ1bnM6MCBmcmFtZTowDQo+PiAJICAgICAgVFggcGFja2V0czoyIGVycm9yczowIGRy
b3BwZWQ6MCBvdmVycnVuczowIGNhcnJpZXI6MA0KPj4gCSAgICAgIGNvbGxpc2lvbnM6MCB0eHF1
ZXVlbGVuOjEwMDANCj4+IAkgICAgICBSWCBieXRlczoxMjAgKDEyMC4wIEIpICBUWCBieXRlczox
MjAgKDEyMC4wIEIpDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIERlbGV2b3J5YXMgPHBk
ZWxAZmIuY29tPg0KPj4gLS0tDQo+PiBuZXQvc2xpcnAuYyAgIHwgMTMgKysrKysrKysrKystLQ0K
Pj4gcWFwaS9uZXQuanNvbiB8ICA1ICsrKystDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9uZXQvc2xpcnAu
YyBiL25ldC9zbGlycC5jDQo+PiBpbmRleCAyMzEwNjhjMWUyLi44NThkM2RhODU5IDEwMDY0NA0K
Pj4gLS0tIGEvbmV0L3NsaXJwLmMNCj4+ICsrKyBiL25ldC9zbGlycC5jDQo+PiBAQCAtNDE0LDcg
KzQxNCw3IEBAIHN0YXRpYyBpbnQgbmV0X3NsaXJwX2luaXQoTmV0Q2xpZW50U3RhdGUgKnBlZXIs
IGNvbnN0IGNoYXIgKm1vZGVsLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBj
aGFyICpzbWJfZXhwb3J0LCBjb25zdCBjaGFyICp2c21ic2VydmVyLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBjaGFyICoqZG5zc2VhcmNoLCBjb25zdCBjaGFyICp2ZG9tYWlu
bmFtZSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqdGZ0cF9zZXJ2
ZXJfbmFtZSwgdWludDMyX3QgbWZyX2lkLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
RXJyb3IgKiplcnJwKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBvb2Jf
ZXRoX2FkZHJbRVRIX0FMRU5dLCBFcnJvciAqKmVycnApDQo+PiB7DQo+PiAgICAgLyogZGVmYXVs
dCBzZXR0aW5ncyBhY2NvcmRpbmcgdG8gaGlzdG9yaWMgc2xpcnAgKi8NCj4+ICAgICBzdHJ1Y3Qg
aW5fYWRkciBuZXQgID0geyAuc19hZGRyID0gaHRvbmwoMHgwYTAwMDIwMCkgfTsgLyogMTAuMC4y
LjAgKi8NCj4+IEBAIC02MzcsNiArNjM3LDcgQEAgc3RhdGljIGludCBuZXRfc2xpcnBfaW5pdChO
ZXRDbGllbnRTdGF0ZSAqcGVlciwgY29uc3QgY2hhciAqbW9kZWwsDQo+PiAgICAgY2ZnLnZkbnNz
ZWFyY2ggPSBkbnNzZWFyY2g7DQo+PiAgICAgY2ZnLnZkb21haW5uYW1lID0gdmRvbWFpbm5hbWU7
DQo+PiAgICAgY2ZnLm1mcl9pZCA9IG1mcl9pZDsNCj4+ICsgICAgbWVtY3B5KGNmZy5vb2JfZXRo
X2FkZHIsIG9vYl9ldGhfYWRkciwgRVRIX0FMRU4pOw0KPiANCj4gQW5kIHNpbWlsYXJseSBoZXJl
Lg0KDQpDb3B5IHRoYXQsIHRoYW5rcyBhZ2FpbiBmb3IgdGhlIHJldmlldyBjb21tZW50cyENCg0K
PiANCj4+ICAgICBzLT5zbGlycCA9IHNsaXJwX25ldygmY2ZnLCAmc2xpcnBfY2IsIHMpOw0KPj4g
ICAgIFFUQUlMUV9JTlNFUlRfVEFJTCgmc2xpcnBfc3RhY2tzLCBzLCBlbnRyeSk7DQo+PiANCj4+
IEBAIC0xMTQyLDYgKzExNDMsNyBAQCBpbnQgbmV0X2luaXRfc2xpcnAoY29uc3QgTmV0ZGV2ICpu
ZXRkZXYsIGNvbnN0IGNoYXIgKm5hbWUsDQo+PiAgICAgY29uc3QgTmV0ZGV2VXNlck9wdGlvbnMg
KnVzZXI7DQo+PiAgICAgY29uc3QgY2hhciAqKmRuc3NlYXJjaDsNCj4+ICAgICBib29sIGlwdjQg
PSB0cnVlLCBpcHY2ID0gdHJ1ZTsNCj4+ICsgICAgTUFDQWRkciBvb2JfZXRoX2FkZHIgPSB7fTsN
Cj4+IA0KPj4gICAgIGFzc2VydChuZXRkZXYtPnR5cGUgPT0gTkVUX0NMSUVOVF9EUklWRVJfVVNF
Uik7DQo+PiAgICAgdXNlciA9ICZuZXRkZXYtPnUudXNlcjsNCj4+IEBAIC0xMTY2LDYgKzExNjgs
MTIgQEAgaW50IG5ldF9pbml0X3NsaXJwKGNvbnN0IE5ldGRldiAqbmV0ZGV2LCBjb25zdCBjaGFy
ICpuYW1lLA0KPj4gICAgIG5ldF9pbml0X3NsaXJwX2NvbmZpZ3ModXNlci0+aG9zdGZ3ZCwgU0xJ
UlBfQ0ZHX0hPU1RGV0QpOw0KPj4gICAgIG5ldF9pbml0X3NsaXJwX2NvbmZpZ3ModXNlci0+Z3Vl
c3Rmd2QsIDApOw0KPj4gDQo+PiArICAgIGlmICh1c2VyLT5oYXNfb29iX2V0aF9hZGRyICYmDQo+
PiArICAgICAgICBuZXRfcGFyc2VfbWFjYWRkcihvb2JfZXRoX2FkZHIuYSwgdXNlci0+b29iX2V0
aF9hZGRyKSA8IDApIHsNCj4+ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgImludmFsaWQgc3lu
dGF4IGZvciBPT0IgZXRoZXJuZXQgYWRkcmVzcyIpOw0KPj4gKyAgICAgICAgcmV0dXJuIC0xOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiAgICAgcmV0ID0gbmV0X3NsaXJwX2luaXQocGVlciwgInVzZXIi
LCBuYW1lLCB1c2VyLT5xX3Jlc3RyaWN0LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlw
djQsIHZuZXQsIHVzZXItPmhvc3QsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgaXB2Niwg
dXNlci0+aXB2Nl9wcmVmaXgsIHVzZXItPmlwdjZfcHJlZml4bGVuLA0KPj4gQEAgLTExNzMsNyAr
MTE4MSw4IEBAIGludCBuZXRfaW5pdF9zbGlycChjb25zdCBOZXRkZXYgKm5ldGRldiwgY29uc3Qg
Y2hhciAqbmFtZSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB1c2VyLT5ib290ZmlsZSwg
dXNlci0+ZGhjcHN0YXJ0LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHVzZXItPmRucywg
dXNlci0+aXB2Nl9kbnMsIHVzZXItPnNtYiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICB1
c2VyLT5zbWJzZXJ2ZXIsIGRuc3NlYXJjaCwgdXNlci0+ZG9tYWlubmFtZSwNCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgdXNlci0+dGZ0cF9zZXJ2ZXJfbmFtZSwgdXNlci0+bWZyX2lkLCBl
cnJwKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdXNlci0+dGZ0cF9zZXJ2ZXJfbmFt
ZSwgdXNlci0+bWZyX2lkLCBvb2JfZXRoX2FkZHIuYSwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgZXJycCk7DQo+PiANCj4+ICAgICB3aGlsZSAoc2xpcnBfY29uZmlncykgew0KPj4gICAg
ICAgICBjb25maWcgPSBzbGlycF9jb25maWdzOw0KPj4gZGlmZiAtLWdpdCBhL3FhcGkvbmV0Lmpz
b24gYi9xYXBpL25ldC5qc29uDQo+PiBpbmRleCBlZmM1Y2IzZmI2Li43YjJjM2MyMDVjIDEwMDY0
NA0KPj4gLS0tIGEvcWFwaS9uZXQuanNvbg0KPj4gKysrIGIvcWFwaS9uZXQuanNvbg0KPj4gQEAg
LTE2OSw2ICsxNjksOCBAQA0KPj4gIw0KPj4gIyBAbWZyLWlkOiBNYW51ZmFjdHVyZXIgSUQgKFBy
aXZhdGUgRW50ZXJwcmlzZSBOdW1iZXI6IElBTkEpDQo+PiAjDQo+PiArIyBAb29iLWV0aC1hZGRy
OiBPdXQtb2YtYmFuZCBldGhlcm5ldCBhZGRyZXNzIGZvciBCTUMNCj4+ICsjDQo+PiAjIFNpbmNl
OiAxLjINCj4+ICMjDQo+PiB7ICdzdHJ1Y3QnOiAnTmV0ZGV2VXNlck9wdGlvbnMnLA0KPj4gQEAg
LTE5NSw3ICsxOTcsOCBAQA0KPj4gICAgICcqaG9zdGZ3ZCc6ICAgWydTdHJpbmcnXSwNCj4+ICAg
ICAnKmd1ZXN0ZndkJzogIFsnU3RyaW5nJ10sDQo+PiAgICAgJyp0ZnRwLXNlcnZlci1uYW1lJzog
J3N0cicsDQo+PiAtICAgICcqbWZyLWlkJzogJ3VpbnQzMicgfSB9DQo+PiArICAgICcqbWZyLWlk
JzogJ3VpbnQzMicsDQo+PiArICAgICcqb29iLWV0aC1hZGRyJzogJ3N0cicgfSB9DQo+PiANCj4+
ICMjDQo+PiAjIEBOZXRkZXZUYXBPcHRpb25zOg0KPj4gLS0gDQo+PiAyLjMwLjINCj4+IA0KPiAN
Cj4gLS0gDQo+IFNhbXVlbA0KPiAtLS0NCj4gUG91ciB1bmUgw6l2YWx1YXRpb24gaW5kw6lwZW5k
YW50ZSwgdHJhbnNwYXJlbnRlIGV0IHJpZ291cmV1c2UgIQ0KPiBKZSBzb3V0aWVucyBsYSBDb21t
aXNzaW9uIGQnw4l2YWx1YXRpb24gZGUgbCdJbnJpYS4NCg0K

