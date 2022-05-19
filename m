Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA4B52DCF0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 20:37:53 +0200 (CEST)
Received: from localhost ([::1]:37072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrl1z-0000u5-J3
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 14:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nrkyx-0008Ac-P9
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:34:44 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:41472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nrkyv-0000l6-2h
 for qemu-devel@nongnu.org; Thu, 19 May 2022 14:34:43 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JHZGhO018308;
 Thu, 19 May 2022 11:34:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=lw7EKNSaY3+JREsoVzoAIq/wCB41TA9DKeOMCnMdvXg=;
 b=WRkLnD0y6oZwy/zaFnpZhOyWRSvEwh1jUlFpTEdHYqsHQYnZrnNgInyhgppqrPJf2McF
 DTOrVwq8D0dq9Z3By2/FECcdt9xChTRTNYf1KVC8ltnT7j4s99qvmI6SQy8jCV5UJrZg
 l8nySQCFA7vrC0jyMsVoHP6G58FtT4Yl8AOXMDODRNLz8Q+n7Os0cVH5+LTg0j5lbcFD
 Rn0r99e5lf9oOdJYLTqeXYZKkA4718RwOBT7saJWrhOPYHXjg7DtqVxrbjv1nKoZRH5L
 b62Mgt9OhMn+7t0jih2S7H6GyPSARUOWXNVsw3E4eNPu5BrKncbAZfUXv3MGOD4lOwAu zA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3g2byyuncw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 11:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caxa4YhD7cv7TQca8h6jckzJKwYcx4xgKQrpZmKzxBw5hWPsXivfs8Xbu6nPObvMOOedEUfCqKnOnns77rcgvrdLeF/KU6sSGGqwYi+VfmSDstt7vuLgLbYJLbUw5DBdjwnPITwoXjC71iG+fRs/5JHV6kHhMznsfxXKHbBJo6hf3cvkLyw+79ZG3nkk2x7nbNsEuAkWA4n7m4BQakxVlyVzjHjqPFR0fBEd+YNe/lHXYNmEXtr01SYjB9+NKwsA/wvPRxtG1/l6h/bJCy3PtLYiNNdysGS/YJFILi+dauX9igLqY2utCFvhQxK8UIRO59Mnrz2PwJdCGZr/H2VDwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lw7EKNSaY3+JREsoVzoAIq/wCB41TA9DKeOMCnMdvXg=;
 b=gof/BrRfFcFJR5j0iEd76zOh8gZg+qDqGwO9AKxJjEPsQi9mP+G/wPFTTKeXhlCd0y1wsksirEsVyOhxODCFFoAk8CpvKk/zHZqkjVxO2r7wIczj3NXlHtLwJTaCzBdLyD73H2Ex1yHGn8Baa7Yjecw1NnZHqqrYLhUOwWLa/po5WfDOKtFQM4A512gS1hxrSzZ9MUT2Ml1oy9MJiPWh6bXMwF9Xar2R+puKi6inUB6d72CFp4451FffnV4JYvnepNOpU7ILXuu/ZrKwl7NVzjy2R0E2dvbEWCgFXytbtOQegMMaLopjfzJMXYIU6jkhNGptvkn8xNcJqCANYy2eWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by DM4PR02MB8983.namprd02.prod.outlook.com (2603:10b6:8:8b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 18:34:35 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%8]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 18:34:35 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
CC: Raphael Norwitz <raphael.norwitz@nutanix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "alexis.lescout@nutanix.com" <alexis.lescout@nutanix.com>, Felipe Franciosi
 <felipe@nutanix.com>, "mst@redhat.com" <mst@redhat.com>
Subject: Re: Accelerating non-standard disk types
Thread-Topic: Accelerating non-standard disk types
Thread-Index: AQHYaUvCbyr7NDMI806tQ3+qwDN2D60jMyaA//6d/4A=
Date: Thu, 19 May 2022 18:34:35 +0000
Message-ID: <20220516182215.GA13470@raphael-debian-dev>
References: <20220516173831.GB13284@raphael-debian-dev>
 <YoO/TdP1ArazkpVX@stefanha-x1.localdomain>
In-Reply-To: <YoO/TdP1ArazkpVX@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fcc3933-25a2-4c46-e78e-08da39c63970
x-ms-traffictypediagnostic: DM4PR02MB8983:EE_
x-microsoft-antispam-prvs: <DM4PR02MB8983E678F2053D8A87816C5FEAD09@DM4PR02MB8983.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 224QXDSRXjUr7PALYif8HYW+l7HP6oVbu8qObuaFP1DMP7SZggfNtpuvuIXrJYhovVsnySSl+ha6TBJBpFGCxFxnALCjWV8USqeiFo6lznlaHfW8NTwTTt5aFgZeVaZu0A8y4sQP9+4ornIvnick079z+w4Hi80EkQYgEp5Naq8Eg4l1TXV7UvaQgrdQeZCfdunYCcm7Czxlig4kWWykS+bx9Tu+GSMt0hIi2nFzgLO+UyTw7uUpv5Mp97Rv8lS2iS7NwC1rIEkImsbMFqc1QTnjuKveRGtbJcsCRVqYxvw7kJQTnSApX1TO5NDPmlWniy0+JBa2u042q/47ol5tOgfAOXtFmQ4ZPffFm5tR5a8wKsKyvmo2sCNe4XJyFlaNvMLk/8TunCf/aV1w6sbk7HU1+3Os1KyWC6JPGnDZ1W1lRrh/L1fp444k3Vw7o1f/OhBLLCcpBeAlYHyWw5a0v2bw7JOROpeamt2pOXLuTf7fX7fZLaOjv7wujKEM0m2uaoLnFdsmvnJmLebKzH7mGh/QrWsQogaJFC1fkp4C59i03wdAjEwkIEF5+4NUrzUYLP3WlFlk7SIn4thEI4PCHWGirlqpMPnX+tnL6qTeMVrctT+U239DKCWCVsMiAj32EhknMg9LuKMT3Fsz9OkMHecBUaVYdRcq+rPcME9G8q606puSjIy7ISib/z8NzEoARL74K3mRjQVynBxyqscTRpwA5+PvJ4/gpMZyRNWChv7pZ1usVvgYr6cc11xfIKhbTNxnPysmg1hr0VetJ4qwh4OZTNXCH7yi/eKfyFy0ti41l4zNvU33DfNwxzxNwPxC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(4326008)(66946007)(66476007)(64756008)(1076003)(66446008)(91956017)(66556008)(186003)(76116006)(5660300002)(38070700005)(38100700002)(83380400001)(122000001)(8936002)(2906002)(86362001)(44832011)(508600001)(33716001)(316002)(54906003)(6916009)(33656002)(71200400001)(6486002)(3480700007)(966005)(26005)(6506007)(9686003)(6512007)(8676002)(175924003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGV6WjVCMnN3alhhYjlOMW9zL2kxd2Vrazc0K0k1UEJ4OEtKUHYyVU93RnB1?=
 =?utf-8?B?cm54QWNkbkRJMnl0dDZSbVBVeUR6Smxrb3FpVmJwbDI1S1FlNXNmNUkrYlhu?=
 =?utf-8?B?eEZuUnhqTUhkRldKWTY2N1dJSHFqOUE5OGlSWElhY050VFUzbWNOOU55b21W?=
 =?utf-8?B?QURsZUVLcHR6cVlRNDR0dXM4VEpROWJFY1pINjJCaWFZOEM3UE5vZmtmRGl5?=
 =?utf-8?B?QzRvSXVKaUIvanY1b3JxMDVhSjhjamNYMXFFbjZqSjI1U1ZvNC9mV2EyV1VS?=
 =?utf-8?B?dDYrVlg1VkNFcmx5RklpelNJTHhqeUZnWnRmN0JhUDE4YXFybWNGbnhTSHB6?=
 =?utf-8?B?ZzJpL1VBVVg5YjlmWGFqMktQU3BIYUNrbUZpdWdSeHlsV0hMOG5NR3RnSkd4?=
 =?utf-8?B?YUdmY3RhY0NMTUs3WWhQMUUyem8ycGl6VWk3Kzl0TVhFNTdxN0Y4Szk1WHBo?=
 =?utf-8?B?VDdTWG9kRTVRUEw4UFhENUkyVmFuVlV3eGQvNGEvTmsreTZrWXNROUwxdnRy?=
 =?utf-8?B?M2pjQk55ZHcrVXduK092VG9RYUlZQlJ5LzZJUkg1RmJaWjN2QTEyOHQzVlhV?=
 =?utf-8?B?eEVFUjdoYlVkTWswdEhZeWVHYlR5VG50SjFhcGxLMlRKY29vZlVmRGNRSWN4?=
 =?utf-8?B?ZHlMUHVMMEErd2lxL1lqR2F2YmdSL3FzQWlwOXNGZ2svQUVLSWRPb2R4VWdG?=
 =?utf-8?B?RHo1RE80bm54VzBncVpiQ1RVYlY3YUYyWnplZ0prSElUZlo2TjdGQVM1bnU4?=
 =?utf-8?B?Tk1hN2dBY3FzbjVQeTgvQTAzTkI3L21Ic05iLzQ4bkhZdWhPdHJGMHgvOVlZ?=
 =?utf-8?B?SlFEemp3R2VQWmxHa0d5Rk05ZHorek1ERy9ra3lycENHS0k1SEhSZ1ZGeC9q?=
 =?utf-8?B?dC9IS0ZPT0dPa05wbHRuY0ZPUjMvWXZtZ05nVVJPSFBOVkhYRCtYa3RMUDJN?=
 =?utf-8?B?b0ZtSjlBcDcyd09ROGdRRXh5TjIrdnFBZWNlNkovNUN1ZUxMbXN2UW1RS1hR?=
 =?utf-8?B?Z2hwOXFydlU3Ty9GVHBCQ1ZoMWxoYUxqdzRodmdaWUNRVkpkSGpuSjc4R3VP?=
 =?utf-8?B?dU01U2ZBOTZYWE1DZHBvQWZoUlBsMVg3NGlHNDJJVVFIeFQ2L2F1dlFlUjRx?=
 =?utf-8?B?N1IyUTBxcXBnV2syMElGWGxHa2xJVy84Q0lySGtQak1iZ1ZqN3VCMFJmdGli?=
 =?utf-8?B?Zkk0OUR0OXFVN1g4K0xYUWErTW44bnc0R3BvOCs3Z01IeTZMM1RkdTVneU9o?=
 =?utf-8?B?bzdzT2JQNnFKWm14NDFZamdnUzFHaEZDSVJvV3B3NHViZ0tKUTZKbW1HMWR0?=
 =?utf-8?B?d01TZUFkSUJ0enNuSGEzK0lreXdQWjRKa3JvVnJicWpLM1dpZVF0UjVROVp2?=
 =?utf-8?B?Zk05MFFPU1JEYmZpMTlIWlIwN3lISVBYWlRlaUo0bXhOUnBySi9BbkF0TFNY?=
 =?utf-8?B?dmhIYWNWaXF5MkRZb2tJcWVPMlllL0taVHl3bGliWWlFalM3OHB3V1diUHRl?=
 =?utf-8?B?NE1oZXBXZWVQSXNIYk1HK2VHV2hJOGt1Qm1GUGltNUpGY1hpUzJwVUM2dEFD?=
 =?utf-8?B?cGhIM3lEV0ZGN1M2N3p3akp6SVNaZWhYWkNrRjZkRFFpMy9MZElLdnRCbDV1?=
 =?utf-8?B?bGgrS0x4V1RKZWJNeSt1cWQ0ZHcrMkxTWmFnRFAyeEtyL0pjWGlHYTE4eXZ3?=
 =?utf-8?B?bEhZRlI5OWRPdGQwaUFMVlRqNjluUWl4N3JIbkRzaVdhUzh2QmVIZFo3S3lu?=
 =?utf-8?B?V0hVU1ZPdXhuQ0tGWW80VDM0OHJtYXpLK2drS21GRmpzdVlid1FOVEEwb3Nu?=
 =?utf-8?B?bGZxNm1HZDlUTm1NaDlCWGZIeU1KMUNYTWxtcloyRUl1UnIzMmtTUFY4VldH?=
 =?utf-8?B?WEZnRHdRZytDLzRnVjBJYlVidlU4cEpINUp4SmhGWjEyV2c0ZkpzVDFHU0J3?=
 =?utf-8?B?MFZoemdTYnJOTEs1OUFPZGordk5MeGdZNHU4OGlnU2dLcEQ5UjZaeHY2UnJS?=
 =?utf-8?B?QWIrUjJ2a1JzakRXZThqK3dFTzA1aSsxeWJZcHEvZGcrS1JPNGFSZmdOaGN2?=
 =?utf-8?B?cUVLb3hjRFVaMTFSdlI3SmlMZVJueURJem1EblkxZFpYTU1qN0VVYWtyVmJm?=
 =?utf-8?B?YktiWUs3RWdOUE0vbmRzRXlIVXUvaDZiWTIxSEpJYzF4TG9hNlVmbXlMYzhU?=
 =?utf-8?B?azBFOU5peFdkd0dxVFZWcER6ZTFvaDBobDJJTzdqWWJNMXB5ekt5L0EwVzRr?=
 =?utf-8?B?cUlpR0FoY0IxcDNZRkFTak5DUzA3VnhUTnpvVldFZWZxU1pMNy9sVzZ5cmpo?=
 =?utf-8?B?emV5dWF1dk1aUnczODVMMkZ2Umh6UC90ektaS0N4Vk5pZGludSszMm1QMllm?=
 =?utf-8?Q?9zph3ln7IyK7rc/A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA3B236E0DC1094A9B3585925339D7EC@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcc3933-25a2-4c46-e78e-08da39c63970
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 18:34:35.5730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWj7ClQQuIJGIcKXKMNZ9s3CkLa1SL4IjYKozPvFXljXzMAHP+k3AKmbvPqDlmhrXCP/Uf6cqnDprcnGDpJxVgbs/H1QAPbZJKsy8tWzBpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR02MB8983
X-Proofpoint-GUID: ML9_qUOlqdpCCPX__fz02JYrajuYQWcw
X-Proofpoint-ORIG-GUID: ML9_qUOlqdpCCPX__fz02JYrajuYQWcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_06,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

T24gVHVlLCBNYXkgMTcsIDIwMjIgYXQgMDQ6Mjk6MTdQTSArMDEwMCwgU3RlZmFuIEhham5vY3pp
IHdyb3RlOg0KPiBPbiBNb24sIE1heSAxNiwgMjAyMiBhdCAwNTozODozMVBNICswMDAwLCBSYXBo
YWVsIE5vcndpdHogd3JvdGU6DQo+ID4gSGV5IFN0ZWZhbiwNCj4gPiANCj4gPiBXZSd2ZSBiZWVu
IHRoaW5raW5nIGFib3V0IHdheXMgdG8gYWNjZWxlcmF0ZSBvdGhlciBkaXNrIHR5cGVzIHN1Y2gg
YXMNCj4gPiBTQVRBIGFuZCBJREUgcmF0aGVyIHRoYW4gdHJhbnNsYXRpbmcgdG8gU0NTSSBhbmQg
dXNpbmcgUUVNVSdzIGlTQ1NJDQo+ID4gZHJpdmVyLCB3aXRoIGV4aXN0aW5nIGFuZCBtb3JlIHBl
cmZvcm1hbnQgYmFja2VuZHMgc3VjaCBhcyBTUERLLiBXZQ0KPiA+IHRoaW5rIHRoZXJlIGFyZSBz
b21lIG9wdGlvbnMgd29ydGggZXhwbG9yaW5nOg0KPiA+IA0KPiA+IFsxXSBLZWVwIHVzaW5nIHRo
ZSBTQ1NJIHRyYW5zbGF0aW9uIGluIFFFTVUgYnV0IGJhY2sgdkRpc2tzIHdpdGggYQ0KPiA+IHZo
b3N0LXVzZXItc2NzaSBvciB2aG9zdC11c2VyLWJsayBiYWNrZW5kIGRldmljZS4NCj4gDQo+IElm
IEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgdGhlIGlkZWEgaXMgdG8gaGF2ZSBhIFFFTVUgQmxvY2sg
RHJpdmVyIHRoYXQNCj4gY29ubmVjdHMgdG8gU1BESyB1c2luZyB2aG9zdC11c2VyLXNjc2kvYmxr
Pw0KPg0KDQpZZXMgLSB0aGUgaWRlYSB3b3VsZCBiZSB0byBpbnRyb2R1Y2UgbG9naWMgdG8gdHJh
bnNsYXRlIFNBVEEvSURFIHRvIFNDU0kNCm9yIGJsb2NrIHJlcXVlc3RzIGFuZCBzZW5kIHRoZW0g
dmlhIHZob3N0LXVzZXIte3Njc2kvYmxrfSB0byBTUERLIG9yIGFueQ0Kb3RoZXIgdmhvc3QtdXNl
ciBiYWNrZW5kLiBPdXIgdGhvdWdodCBpcyB0aGF0IHRoaXMgaXMgZG9hYmxlIHRvZGF5DQp3aGVy
ZWFzIHdlIG1heSBoYXZlIHRvIHdhaXQgZm9yIFFFTVUgdG8gZm9ybWFsbHkgYWRvcHQgbGliYmxr
aW8gYmVmb3JlDQpwcm9jZWVkaW5nIHdpdGggWzNdLCBhbmQgZGVwZW5kaW5nIG9uIHRpbWVsaW5l
cyBpdCBtYXkgbWFrZSBzZW5zZSB0bw0KaW1wbGVtZW50IFsxXSBhbmQgdGhlbiBzd2l0Y2ggb3Zl
ciB0byBbM10gbGF0ZXIuIFRob3VnaHRzPw0KDQo+ID4gWzJdIEltcGxlbWVudCBTQVRBIGFuZCBJ
REUgZW11bGF0aW9uIHdpdGggdmZpby11c2VyIChsaWtlbHkgd2l0aCBhbiBTUERLDQo+ID4gY2xp
ZW50PykuDQo+IA0KPiBUaGlzIGlzIGRlZmluaXRlbHkgdGhlIG9wdGlvbiB3aXRoIHRoZSBsb3dl
c3Qgb3ZlcmhlYWQuIEknbSBub3Qgc3VyZSBpZg0KPiBpbXBsZW1lbnRpbmcgU0FUQSBhbmQgSURF
IGVtdWxhdGlvbiBpbiBTUERLIGlzIHdvcnRoIHRoZSBlZmZvcnQgZm9yDQo+IHNhdmluZyB0aGUg
bGFzdCBmZXcgY3ljbGVzLg0KPg0KDQpBZ3JlZWQgLSBpdOKAmXMgcHJvYmFibHkgbm90IHdvcnRo
IGV4cGxvcmluZyBiZWNhdXNlIG9mIHRoZSBhbW91bnQgb2Ygd29yaw0KaW52b2x2ZWQuIE9uZSBn
b29kIGFyZ3VtZW50IHdvdWxkIGJlIHRoYXQgaXQgbWF5IGJlIGJldHRlciBmb3Igc2VjdXJpdHkN
CmluIHRoZSBtdWx0aXByb2Nlc3MgUUVNVSB3b3JsZCwgYnV0IHRvIG1lIHRoYXQgZG9lcyBub3Qg
c2VlbSBzdHJvbmcNCmVub3VnaCB0byBqdXN0aWZ5IHRoZSB3b3JrIGludm9sdmVkIHNvIEkgc3Vn
Z2VzdCB3ZSBkcm9wIG9wdGlvbiBbMl0uDQoNCj4gPiBbM10gV2UndmUgYWxzbyBiZWVuIGxvb2tp
bmcgYXQgeW91ciBsaWJibGtpbyBsaWJyYXJ5LiBGcm9tIHlvdXINCj4gPiBkZXNjcmlwdGlvbiBp
bg0KPiA+IGh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIx
LTA0L21zZzA2MTQ2Lmh0bWwgaXQNCj4gPiBzb3VuZHMgbGlrZSBpdCBtYXkgZGVmaW5pdGVseSBw
bGF5IGEgcm9sZSBoZXJlLCBhbmQgcG9zc2libHkgcHJvdmlkZSB0aGUNCj4gPiBuZXNzZXNhcnkg
YWJzdHJhY3Rpb25zIHRvIGJhY2sgSS9PIGZyb20gdGhlc2UgZW11bGF0ZWQgZGlza3MgdG8gYW55
DQo+ID4gYmFja2VuZHMgd2UgbWF5IHdhbnQ/DQo+IA0KPiBLZXZpbiBXb2xmIGhhcyBjb250cmli
dXRlZCBhIHZob3N0LXVzZXItYmxrIGRyaXZlciBmb3IgbGliYmxraW8uIFRoaXMNCj4gbGV0cyB5
b3UgYWNoaWV2ZSAjMSB1c2luZyBRRU1VJ3MgbGliYmxraW8gQmxvY2sgRHJpdmVyLiBUaGUgZ3Vl
c3Qgc3RpbGwNCj4gc2VlcyBJREUgb3IgU0FUQSBidXQgaW5zdGVhZCBvZiB0cmFuc2xhdGluZyB0
byBpU0NTSSB0aGUgSS9PIHJlcXVlc3RzDQo+IGFyZSBzZW50IG92ZXIgdmhvc3QtdXNlci1ibGsu
DQo+IA0KPiBJIHN1Z2dlc3Qgam9pbmluZyB0aGUgbGliYmxraW8gY2hhdCBhbmQgd2UgY2FuIGRp
c2N1c3MgaG93IHRvIHNldCB0aGlzDQo+IHVwICh0aGUgUUVNVSBsaWJibGtpbyBCbG9ja0RyaXZl
ciBpcyBub3QgeWV0IGluIHFlbXUuZ2l0KToNCj4gaHR0cHM6Ly9tYXRyaXgudG8vIy8jbGliYmxr
aW86bWF0cml4Lm9yZw0KDQpHcmVhdCAtIEkgaGF2ZSBqb2luZWQgYW5kIHdpbGwgZm9sbG93IHVw
IHRoZXJlLg0KDQo+IA0KPiA+IFdlIGFyZSBwbGFubmluZyB0byBzdGFydCBhIHJldmlldyBvZiB0
aGVzZSBvcHRpb25zIGludGVybmFsbHkgdG8gc3VydmV5DQo+ID4gdHJhZGVvZmZzLCBwb3RlbnRp
YWwgdGltZWxpbmVzIGFuZCBwcmFjdGljYWxpdHkgZm9yIHRoZXNlIGFwcHJvYWNoZXMuIFdlDQo+
ID4gd2VyZSBhbHNvIGNvbnNpZGVyaW5nIHB1dHRpbmcgYSBzdWJtaXNzaW9uIHRvZ2V0aGVyIGZv
ciBLVk0gZm9ydW0NCj4gPiBkZXNjcmliaW5nIG91ciBmaW5kaW5ncy4gV291bGQgeW91IHNlZSBh
bnkgdmFsdWUgaW4gdGhhdD8NCj4gDQo+IEkgdGhpbmsgaXQncyBhbHdheXMgaW50ZXJlc3Rpbmcg
dG8gc2VlIHBlcmZvcm1hbmNlIHJlc3VsdHMuIEkgd29uZGVyIGlmDQo+IHlvdSBoYXZlIG1vcmUg
Y3V0dGluZy1lZGdlIG9wdGltaXphdGlvbnMgb3IgcGVyZm9ybWFuY2UgcmVzdWx0cyB5b3Ugd2Fu
dA0KPiB0byBzaGFyZSBhdCBLVk0gRm9ydW0gYmVjYXVzZSBJREUgYW5kIFNBVEEgYXJlIG1vcmUg
bGVnYWN5L25pY2hlDQo+IG5vd2FkYXlzPw0KPg0KDQpJIHJlYWxpemUgSSBvdmVyLWVtcGhhc2l6
ZWQgcGVyZm9ybWFuY2UgaW4gbXkgcXVlc3Rpb24gLSBvdXIgbGFyZ2VyIGdvYWwNCmhlcmUgaXMg
dG8gYWxpZ24gdGhlIGRhdGEgcGF0aCBmb3IgYWxsIGRpc2sgdHlwZXMuIFdlIGhhdmUgc29tZSBo
b3BlDQp0aGF0IFNBVEEgY2FuIGJlIHNwZWQgdXAgYSBiaXQsIGJ1dCBpdOKAmXMgZW50aXJlbHkg
cG9zc2libGUgdGhhdCB0aGUgTU1JTw0Kb3ZlcmhlYWQgd2lsbCB3YXkgb3V0d2VpZ2ggYW5kIGRp
c2sgSS9PIGltcHJvdmVtZW50cy4gT3VyIHRob3VnaHQgd2FzIHRvDQpwcmVzZW50IGEg4oCcUm9h
ZG1hcCBmb3Igc3VwcG9ydGluZyBvZmZsb2FkIGFsdGVybmF0ZSBkaXNrIHR5cGVz4oCdLCBidXQN
CndpdGggeW91ciBhbmQgUGFvbG/igJlzIHJlc3BvbnNlIGl0IHNlZW1zIGxpa2UgdGhlcmUgaXNu
4oCZdCBlbm91Z2ggbWF0ZXJpYWwNCnRvIHdhcnJhbnQgYSBLVk0gdGFsayBhbmQgd2Ugc2hvdWxk
IHJhdGhlciBpbnZlc3QgdGltZSBpbiBwcm90b3R5cGluZw0KYW5kIGV2YWx1YXRpbmcgc29sdXRp
b25zLg0KDQo+IFN0ZWZhbg0KDQo=

