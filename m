Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B821955E5E6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:18:45 +0200 (CEST)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DvI-0003NG-MN
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8178b97bae=pdel@fb.com>)
 id 1o6Dr4-0007Rc-LK; Tue, 28 Jun 2022 12:14:25 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:4224
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8178b97bae=pdel@fb.com>)
 id 1o6Dr2-0006dQ-U9; Tue, 28 Jun 2022 12:14:22 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25SEolmm007734;
 Tue, 28 Jun 2022 09:14:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=ZYHZUhgZcFrbBBxQgvJO7YeEr6SfuMkelfnYnIYepyQ=;
 b=fVDZDVCeYhHzl+5tnxvn5CQ2dXBJ4cfb7PE5IRxOIRb7vtiUtE4gFms0hD2x278M2kcI
 J40uWG+yxJV5TnxQ6GpAeKAvJK4NpieWERMZVMQLjcd179duIM1jl/sBroNeSlLbufIw
 bIwIDvCBREopR36zsdVZrtEPVC8NPGHmupM= 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by m0001303.ppops.net (PPS) with ESMTPS id 3h03ru0qfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 09:14:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DasOza2ZDOKhUDH9y2kl8ffMtgISQ4wQz2ZLO3tNHHoRCwfyfcZ0L3v0GLmFuliIJN830TOWEfBsUDlKLAjBmx0vg//di3CSunM/yHRE1XqRPEkiPWIzE1rOhEPcqhsXa+64IWOjVuCfZlX78EAPQcHEYs9Jt3fmu/hKhyrpwPhsMdEWRrCt43o6YdgD7UUcoPkQJcNYtpBg+5UAOwUK9aVqJLrm+pF7PztG9JfG7QKJy4Vo96IDeBpGYnPKrXXXeCqbn7ngAlyjpp9wj0WxpmnH5B3Prfe666XjrRIyJKtMEb+0KzZXlExcOx+nMeT+pwdvnXRC3+zdszAjjQti9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYHZUhgZcFrbBBxQgvJO7YeEr6SfuMkelfnYnIYepyQ=;
 b=gxBgBp0+DoncqvAfFOCdRR6JUOfz4cxtJ8l/2xa7ldaoAw9WYuwR5yIhGDer9ICEwDHXIyLpwUYSnUovTSZqVPPtKxO4i0ptnBy5A8VxIyPfqAhIga+R3u5bEQ4EsvHi1uOud6J7P3eK0UBFJwdSN+aCpSNjW+wm7KpNM3WAZUL2S94Xt/0s6F65BpzrLmVks+hEf0FNPxnwHhjNBKkqNbDZsqUL2rUTIZcpYhtHJZ9gQ/2R1HGbue3uq1RGSvHus2S2rMJ6GW4Vc450BXMI6ZxNpmm/P3p0KwxPYyVlb5Uf8tPw62zNU/2VLeW3zI6SOcSCbY0/uhKJlBYgmEuXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by IA1PR15MB5489.namprd15.prod.outlook.com (2603:10b6:208:3aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 16:14:12 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 16:14:12 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, qemu-arm <qemu-arm@nongnu.org>, Cameron
 Esfahani via <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH 1/3] aspeed/scu: Add trace events for read ops
Thread-Topic: [PATCH 1/3] aspeed/scu: Add trace events for read ops
Thread-Index: AQHYiwbt0hmOHQMPk0m3qXrsxhNua61k/iaA
Date: Tue, 28 Jun 2022 16:14:12 +0000
Message-ID: <638FE59D-CB42-4B5A-B114-584CAB5B5E56@fb.com>
References: <20220628154740.1117349-1-clg@kaod.org>
 <20220628154740.1117349-2-clg@kaod.org>
In-Reply-To: <20220628154740.1117349-2-clg@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6116dd29-902f-4d47-6e1d-08da59213d4c
x-ms-traffictypediagnostic: IA1PR15MB5489:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BgJAEV9d+kv164IyGJtJi3dTU+T05CAtAj+qJu/NYN+ecMJ3itdLbuCAoLu1PT/eXpEjmKzpaxJzZqhWC5v1sEDpu4qn5SHJgFvc/labC4qjR6vsFaKqJwT6FfdaEWt5QVn3zhknyelj7FRV+dF076QnRt07rbIWfkoLcGvXkRLujWtFsfSyTBP9KZW0eviEqYfO+bQOnrfB5OUc4WmO0+c1F9f9cntLsXtJolxDFRr8FapE8LkoCISMQp07TmqlDF8+Wus95SImRwKMxzjU/RbcTbkI5GrHZXH5tVd92XVPQjGSBeipNPfzG+VdRS4fuHFY/bCFkbDISNf1NYCJDcKRKJEFl7neIfaRTV4juLhx9l3/IxHKW3RbWe+CqGMGTBkk842pUDlX7IiRfMNeotPjrSEnOPEmaP0rnt/gZyVQh1UCli+wYwF4uulWK3F209q4Xr7EsdXDpm+81DEMnVCiY2CnNdDD1o1IuJkr/0ZSW6DDZmXGNjxpplsqMOy99QAap5NpeCd7ThKtHgJPkIXGHm4StdhVOCBHydmTDE3q6PJAEAJb/AWc7egUVUUEva3gRcE3f58NF0ztiwDwHbvto2lkNQJx9auRkenjA/T7MrHhcM7JXjWMyaHZYtZZUOC3bghWyxZJsXOHxPOrM4MCq+3mhg1rv0Rfns28GAXLljMXzXsz0Z3Y47QniCfKc/xr5zWmZVZzlAVu939+/NG1mmsCqNtUCSmKRqSd5XP0cx34hRxQZAJjfWHhLEUV9F6Gjkr9GtkpAWtloCk6LhL1jZxzHiaelTcl0XT7yenbFbB7S9Okfh68QMAXffJWJ56CYWdnaRB7rsEjShYdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6486002)(122000001)(36756003)(6512007)(38070700005)(33656002)(316002)(2616005)(8936002)(6506007)(41300700001)(2906002)(54906003)(478600001)(109986005)(53546011)(71200400001)(86362001)(186003)(66556008)(66946007)(8676002)(4326008)(5660300002)(66446008)(76116006)(66476007)(64756008)(38100700002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVBmWkdSKytSa05ubmlRaTRVZjlrcitIMy9hb0lIakxoUC9DazlmMlh4K1RE?=
 =?utf-8?B?SE9kZ29iME93b0hVR1pGV1RYZkJ6SUc2RlNYQ1BaNGowUDZtLytHOGQ2L2FT?=
 =?utf-8?B?SjA4Z3pZZnRlazkxcHZ4OFVpUjJJZDFXOTFCYjdiWDZUR3Q1OWxTVVcvR3JS?=
 =?utf-8?B?bXROdm94ZVAxZUNjdzUzODUvU2pqVk9UMHJpb3E4Y21jcjNJbmNqM1BjbTgy?=
 =?utf-8?B?T0w0aHVnWE5ZTE9JeSs0MFhkZFMyZ0ZiU1BuekgvVXRGRUFSaUlrZVRqU211?=
 =?utf-8?B?S2hySCtNL0wvYkxCQ3k5eWpJMGw1YU9uY3c1SkE1ck5DZ3lpQUJhL0xTT2xV?=
 =?utf-8?B?dno2bDMzSksvWGFKNlJWQ0REUER4Sythb2hmYjNBamI5Yk53N3VHeFZRWGFo?=
 =?utf-8?B?dEpjQWk0QVZHZEI3NWlRaFRZNmF4VUJ1ZzFGam1qU09pZ1JMQk1VVTQwZ0hz?=
 =?utf-8?B?dmMwZWNyZE1wRjR1V2s4eGJXcEZEUkxsMG1ZRWZXbEd0ejM1VzR1eU9wWHNI?=
 =?utf-8?B?cnJJR0Z5QXZvRXMxbk9GM3pyS3lSU283TXVVcG1tTHYwR1JMeDdBZE9yc3VO?=
 =?utf-8?B?bVpVUEtIYm0vcS9OZkVsbXI1Mk5yWmFGd01IZnB2TTVwZXZWMjJDVzBzVys1?=
 =?utf-8?B?QXpQenY0NkxEY0d3YjU2ekVaZUp6SXcrcmJVTWd4WTRzZTlKL2hiVWpMY2w5?=
 =?utf-8?B?aXlLSjFKc2tpNy81VGV6TWFtYVFLN3dTdDQ5VjlFdFNwVWtXNkZHNFJsRXlr?=
 =?utf-8?B?cmJuUW5BZXR4RjdJdk9zcXVOanp3MUIwQTNJZ0FmNjB6cnYvZER5bnIyRmxT?=
 =?utf-8?B?a0JtY3U5UllWYnVLZmZHcjZraitYd25sVFdQUGI5Vi9sTzdScDQzLzVHa1hI?=
 =?utf-8?B?cTZYNG5wcGxUMEU2cmNJd1lrWkU2Y2NtUDlpWGExTTRvR1RwK3hZcU9ERDBs?=
 =?utf-8?B?SmwvcFZMQ2M1bGhmWG95Snh6bCtUTEV2dDROTTBMRTJVTWxxU0VVaU50VUxV?=
 =?utf-8?B?ZEozVTJUUDJpeVBsOE9PZ29qYnFMSDg0SE9TK0dwcjk2UzJxV3ViSUVwbUhN?=
 =?utf-8?B?eC96bkxEME5QeVN3RUJ1aGd4TlY0T1RVY0N2dzU3aG5qTHZ0eUR5N1VlVUpZ?=
 =?utf-8?B?ZDI2UUc5ZTY2bW9QaEU0YVJHdWZPWGszZmtPVGNRZjFLZERBOUF0ZEZQNnNM?=
 =?utf-8?B?dmxyR0xxS2VZNjVMSXF2TTFGV0Y4WHlpazJEWTI2Y0YxRDljSERteEVSWVlF?=
 =?utf-8?B?S1ZiYzVSRWVnaWVoTzcxajNUNXRxaEM0RFNQU3NaVEVCM2VzWEhpcTVMUGg0?=
 =?utf-8?B?cTRVTzduNDkzckRQc0Z6cmluLzZpbzBhejRmT0pIejRzS21oRjRmM0xreWNv?=
 =?utf-8?B?d2UrYklTRjE1Tm5LV2tYNWROdXlJSWhqemowditOL3R5Vm1mNVBROERKNEY1?=
 =?utf-8?B?NWRLV0lNRmNQNWl4dTEzUXBGRDhUaEVqNFpQMUpyd01oN3ZidStiOGtXM1pQ?=
 =?utf-8?B?R2dTSUlodTZRMkZpM0dzeU14TTIrbStNc2dITnR5SHkyNTdxZTZMN1pDUWtK?=
 =?utf-8?B?VXFYaWxKc0VGZlhzcXRSV3MxTWxZbmZjM1U1eXVESThWSThSRUFjUlkxTGll?=
 =?utf-8?B?d0t5VHQ5ZytqSTdrWFFhSXJUSGJuVkRzN3ZMTURaS28zRGtYVURqMzY3NkFR?=
 =?utf-8?B?VTlnQUNFTVkvQjVKcU9CTG9EOGwvcUJjT094YTJhSnFiczcvRGRlRFZWRWV3?=
 =?utf-8?B?UStFTU54d3dad2VJZVlIR3ZJYkRPSjhscjAwN3lLdFhGWW9BRUZYQ2lKQjBZ?=
 =?utf-8?B?eEgzMHFLZjdXRkx4ZkdmUjFJbC9wbkRWVEhGVFViUlVHVGZhNm1HdE1zYjN1?=
 =?utf-8?B?c3UvOGJoaW1oa1J1L1FIMFZUUGdPWmtVenI2b1M4UGN6dkh4djB3T2xwS0xU?=
 =?utf-8?B?cmdCN3FCbjBCVzQyUVJNTHRWaFhUUVN3NFZDTkxjdTZVQjFmb204SzhOQ04r?=
 =?utf-8?B?RHMwZ0lxVS9QQ1JieHgxZ3paWCtZeFNmei9vaWNFeEZwUkJEOFI2c3ZESW5j?=
 =?utf-8?B?RGNraFo3RWNLODNsUldLa0FBSUkxV0RhMW5EaTAwdU14S0hCUExwZXpjdzd2?=
 =?utf-8?B?RFU4Q2ZVbGxLa1JidnpzLzVZVFZSK1VyWTZpZXlyTnZxNFl0NlVoc3F2Qk5T?=
 =?utf-8?B?Mnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EE61713B50D804D92DAEA4431301ABF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6116dd29-902f-4d47-6e1d-08da59213d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 16:14:12.3402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IbzxAMJBTrnq96e9dtIFcJJffa1reUTn1XPSu5ELVRjICOxGv9n9yejrEB68woAN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR15MB5489
X-Proofpoint-ORIG-GUID: Qq1w8cjnr-jpm-q4cTjPvHB0ug6c4c_j
X-Proofpoint-GUID: Qq1w8cjnr-jpm-q4cTjPvHB0ug6c4c_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_09,2022-06-28_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=8178b97bae=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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

DQoNCj4gT24gSnVuIDI4LCAyMDIyLCBhdCA4OjQ3IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QGthb2Qub3JnPiB3cm90ZToNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVy
IDxjbGdAa2FvZC5vcmc+DQoNCkFsc28gYSBuaWNlIGNoYW5nZS4NCg0KUmV2aWV3ZWQtYnk6IFBl
dGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KDQo+IC0tLQ0KPiBody9taXNjL2FzcGVlZF9z
Y3UuYyB8IDIgKysNCj4gaHcvbWlzYy90cmFjZS1ldmVudHMgfCAxICsNCj4gMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9taXNjL2FzcGVlZF9z
Y3UuYyBiL2h3L21pc2MvYXNwZWVkX3NjdS5jDQo+IGluZGV4IDE5YjAzNDcxZmM0ZS4uODMzNTM2
NDkwNjRhIDEwMDY0NA0KPiAtLS0gYS9ody9taXNjL2FzcGVlZF9zY3UuYw0KPiArKysgYi9ody9t
aXNjL2FzcGVlZF9zY3UuYw0KPiBAQCAtMjcwLDYgKzI3MCw3IEBAIHN0YXRpYyB1aW50NjRfdCBh
c3BlZWRfc2N1X3JlYWQodm9pZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LCB1bnNpZ25lZCBzaXpl
KQ0KPiAgICAgICAgIGJyZWFrOw0KPiAgICAgfQ0KPiANCj4gKyAgICB0cmFjZV9hc3BlZWRfc2N1
X3JlYWQob2Zmc2V0LCBzaXplLCBzLT5yZWdzW3JlZ10pOw0KPiAgICAgcmV0dXJuIHMtPnJlZ3Nb
cmVnXTsNCj4gfQ0KPiANCj4gQEAgLTYzNyw2ICs2MzgsNyBAQCBzdGF0aWMgdWludDY0X3QgYXNw
ZWVkX2FzdDI2MDBfc2N1X3JlYWQodm9pZCAqb3BhcXVlLCBod2FkZHIgb2Zmc2V0LA0KPiAgICAg
ICAgIGJyZWFrOw0KPiAgICAgfQ0KPiANCj4gKyAgICB0cmFjZV9hc3BlZWRfc2N1X3JlYWQob2Zm
c2V0LCBzaXplLCBzLT5yZWdzW3JlZ10pOw0KPiAgICAgcmV0dXJuIHMtPnJlZ3NbcmVnXTsNCj4g
fQ0KPiANCj4gZGlmZiAtLWdpdCBhL2h3L21pc2MvdHJhY2UtZXZlbnRzIGIvaHcvbWlzYy90cmFj
ZS1ldmVudHMNCj4gaW5kZXggYzVlMzdiMDE1NDdmLi5mNzc2ZjI0ZmI1ZDEgMTAwNjQ0DQo+IC0t
LSBhL2h3L21pc2MvdHJhY2UtZXZlbnRzDQo+ICsrKyBiL2h3L21pc2MvdHJhY2UtZXZlbnRzDQo+
IEBAIC02OSw2ICs2OSw3IEBAIHNsYXZpb19sZWRfbWVtX3JlYWR3KHVpbnQzMl90IHJldCkgIlJl
YWQgZGlhZ25vc3RpYyBMRUQgMHglMDR4Ig0KPiANCj4gIyBhc3BlZWRfc2N1LmMNCj4gYXNwZWVk
X3NjdV93cml0ZSh1aW50NjRfdCBvZmZzZXQsIHVuc2lnbmVkIHNpemUsIHVpbnQzMl90IGRhdGEp
ICJUbyAweCUiIFBSSXg2NCAiIG9mIHNpemUgJXU6IDB4JSIgUFJJeDMyDQo+ICthc3BlZWRfc2N1
X3JlYWQodWludDY0X3Qgb2Zmc2V0LCB1bnNpZ25lZCBzaXplLCB1aW50MzJfdCBkYXRhKSAiVG8g
MHglIiBQUkl4NjQgIiBvZiBzaXplICV1OiAweCUiIFBSSXgzMg0KPiANCj4gIyBtcHMyLXNjYy5j
DQo+IG1wczJfc2NjX3JlYWQodWludDY0X3Qgb2Zmc2V0LCB1aW50NjRfdCBkYXRhLCB1bnNpZ25l
ZCBzaXplKSAiTVBTMiBTQ0MgcmVhZDogb2Zmc2V0IDB4JSIgUFJJeDY0ICIgZGF0YSAweCUiIFBS
SXg2NCAiIHNpemUgJXUiDQo+IC0tIA0KPiAyLjM1LjMNCj4gDQo+IA0KDQo=

