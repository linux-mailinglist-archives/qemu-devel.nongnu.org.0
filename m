Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7816F1EB6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 21:23:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psTfv-0003Ta-Gf; Fri, 28 Apr 2023 15:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psTfs-0003TD-RE
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:22:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1psTfp-0004p3-9o
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 15:22:31 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SJ1GUa010363; Fri, 28 Apr 2023 19:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=yCj5VFcP7llY4hjLVd3fkwW9hl1VCkKjgaNnwHpWoe0=;
 b=ec9noaEme/qikbT7yNzhU6ZiXlarvjB9XjImRRlGi46TTUJ4TPEXpKV6XVTrbqAMtEB/
 AdXWaxQNRwX7e4bylR/fnTuc0+XMN1q5TFc37tMrW7lQEG0RTOQQbTgRXmGVn9Ksyv0t
 3VetFt21hQV+4s4sWhE5pxJG63AZ1XPBe0hc3F7b+HFGbmvvQv+sWuiLEYMF5ESIdwqE
 /PkMgV3UejHrboVY1KVEyNYy350NtuB6znZHTW1eKOkj8YQI9nD3Kied+gp/B4p/kt2Y
 vTny1XL+g49bdGF4yOPu0kBUXoIfGK9m/ccC+dTOyJD8zy6+J60eZFZ7sg2d5Yfxe4kA JQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q850ctmqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 19:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3u2rv5PxHM6nPVrdiPHvN/eaEgz0J1OenQuBOJ3FNsyiyngKyHG615rs5ktmuj/FpiK2TpNAKqfOyGVXaDFui7Alrk0bvUD33bTAUOdSZfm+3WPbNJ9QgxBQ5IKhIQHWmyMRJ2XmyTSRf5gKlRMO4MDeWa7ELb4zDBqCWPmMKv4IQYdrS+wqgfQh1vQa2uZinwxDA7W9RDGYj3TTqwwNLeg5m74jWOZR5DX/1MP1mpO8uOqMYczrko8Ulc1iO9OrmScQn/nJQaxOy5kvhF6kQhxUAPoR+ReT/9HsNKGXcDoyeV3g1h+1SAyeTJOkfbS6DKEjbDihvmuX5eURicwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCj5VFcP7llY4hjLVd3fkwW9hl1VCkKjgaNnwHpWoe0=;
 b=R4h82KiqzHAQj34XkyxisQyzpDUbqQg1mzVUvFGYCd2e6fH7io+9/uShBvu0Fl0cUJ86xGb4/N0pGTWN91GjQJmzbQlqLiaUdx1ArctOjerIJxk84DkiDtg5pzI+hWbwJUWlehb9E6oOC84Uf3cq6A8IByOVPX4+n7XreJayXy7wK/nxZ5KoC+RNn40F+FiLi+K7P0qkmtxPehGGlXLG0RQK7EDUsWzzVRc/Vy9IkU0pWNQbUlQYVU/xgb936NMoEdnO/F3QTrFJjsWZV5Uz38jn1SfdFjr7v6bLjTFcL5iJq5Qpvq36Ft9SR03tdCnd8NpVprMcRZET9EzsOgIc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SJ0PR02MB8532.namprd02.prod.outlook.com
 (2603:10b6:a03:3fd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 19:22:22 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::eb63:d1c0:28de:72f5%8]) with mapi id 15.20.6319.032; Fri, 28 Apr 2023
 19:22:22 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Alessandro Di Federico <ale@rev.ng>, Anton Johansson <anjo@rev.ng>
Subject: RE: [PATCH] target/hexagon: fix = vs. == mishap
Thread-Topic: [PATCH] target/hexagon: fix = vs. == mishap
Thread-Index: AQHZeQe3gCJKQ91WiUGQR2cGFaWcPq8/J2KAgACeelCAAVTXwA==
Date: Fri, 28 Apr 2023 19:22:22 +0000
Message-ID: <SN4PR0201MB8808FEDFE5A89E21E90F690DDE6B9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230427125632.104034-1-pbonzini@redhat.com>
 <4db9ea15-7478-06ef-f774-0f7162780f29@linaro.org>
 <SN4PR0201MB88083C644B813C721200D94CDE6A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB88083C644B813C721200D94CDE6A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|SJ0PR02MB8532:EE_
x-ms-office365-filtering-correlation-id: 2b6dba80-94ff-4002-b8df-08db481de42e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: srNLShqSmblc6L/U/MDCe/Ao3BIm6Z63p2G4fxXZIHbGZPnA+EOzjelWAke4T1IJqraA3xDOLCMNPWKiDsKwowgEoP31HKSQN4CnUIg7sc3XcumB1QCW3eZ6w3M2JWAqtbNciND3dE0AxHVlXRhkZOVcqE0FHp/1e5MIc3Msqk+6U1E3L5m9P7OvFXEgRmBjPsIMniQIIblCuWlMXHii2bNSq9Tv2ppq4VWYXespdi94QKt2QFK/MxeWGz2jV7GWhk5hl+kloO0/BxHomIYy589SHCW5Og8I2N6AVEOUKNxbkv8miyK+tJeTi9mQJXikjPYDfjDOB62woLdAZQ1LO6o9zZCOnLE4nx0l48AmaZNjiIIVvDKGtE9dm7vhrjUtb0tyczfKj7gs5vlnOB5kU5/uQWF0YVgwE+rkYb8YDhuQAm0r2oyJomm1H7hdYGz9XsaoT+3CbVviaLVdgNYO+8VOgqbBFu8Vdb9ZNmHRRFtMog6HKVIRznEmUMtyBIG5FpJZEFpdegkfvrTJV28vrVfaQlvaxm9tWUqD7Ab0QLdNxsuDuZca1Hj6s7kWwc+EZ7LRkaqsi06YxXIqCJiF8zaSXmd3JmVcIhxDklWRS63e8HzXxQrVl1+hPMAawJXO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199021)(41300700001)(4326008)(38070700005)(316002)(38100700002)(52536014)(5660300002)(55016003)(86362001)(8676002)(8936002)(110136005)(54906003)(64756008)(66476007)(66946007)(122000001)(66446008)(66556008)(76116006)(478600001)(26005)(9686003)(186003)(53546011)(6506007)(71200400001)(7696005)(33656002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3A0R283NVB3b2ZiV016cWxmbmJMOXVTbEN2ZFhyaThUenpFelRiYjZvQ3pq?=
 =?utf-8?B?SFg4TzgxTXJGM2k1bldVdVdpNjdmTFVmS1RGbjFXbVQ4T0p2cFIzUy9udGZR?=
 =?utf-8?B?Vmp3bDkwWFg5dVJpQVRXMVUxcThEV0pkcHlLNTh0RExDeFdwKzJQVHVPd0lC?=
 =?utf-8?B?b0Q4MEcrYXo1b3JPZjU1d0o0NVUzVDNqSnBGYk1LaU1UQTVKcUJwQXFJVW4x?=
 =?utf-8?B?VUZqSFJIQTIvVFp4YjBuOHptUllXakpOTWlSSk1MUGJSZFZyUlJjdk5YWG1y?=
 =?utf-8?B?M21Hd2dJVWlIT283N0grTG5QY1dqdFlxY0F4aXNsY1U5UWtVTmhkaUFtQkw1?=
 =?utf-8?B?czZKT0RQOUh5QlJCM2x4QTcwUmlnbmtVU0RIVldMMVlKbktvditoK0pIZzVW?=
 =?utf-8?B?TzN1OGdkNHBTRy9ramowbDAwbWRZcTNCUTRWRjA1T29pdFVucDVWMm5INEVF?=
 =?utf-8?B?VzIyR3Jwb0pYbno0eHk1NTFjSW5MTzNiOWJ4SjFCa2U4OHlwVGN2eEg0U3Ny?=
 =?utf-8?B?OVRkcC9VUWx3K3d5cWhSQitoalFSR2h2bUxKYW55UDVFV0s4NmRRMXVPcDdV?=
 =?utf-8?B?ZDZ2R1FuYXU3ZUhOZ1FmT0VWQWhQTEZKNGVhaGJCcGJpVTVYSnVRZXlDYkRZ?=
 =?utf-8?B?dk9kNFJnY2VmckF3R0hNeFNlcVVzeVBhNWxGaWJGTE91cHU1NVhrVHZ5RWwx?=
 =?utf-8?B?UExOYmZjcC9VNWNnUERISStId25adjJjZkN4YVF6Yk5HaTI2bGV3R2hrMlRV?=
 =?utf-8?B?cnpKSWU1MWNtV0JIU0xScTZteFpybDhzNi9zVDR0bXlGOEZ0TWRZVjQyOGtH?=
 =?utf-8?B?WkJsQXhFSzNaV3VjWGRZd2J5enZhbkVFY2JaL3NRTnhLL1dhK0tFTklNQUgz?=
 =?utf-8?B?ZXIvQjZmdUlpaVdMc2Job29WUUg1V1FCczgzR0s1bE9ndFEyNUIzcDY2dzI0?=
 =?utf-8?B?cXhtMldqTGVqNXRpejcrbzI3UGM5K1FFNFh0OUpEYXhuVG4xckdYVDZQSHY3?=
 =?utf-8?B?WjJ1MkZ2RUErcmJiVjBzM3NOWWxlRllWbkxkem1kRlV0TTFiS0s5a24zaUJO?=
 =?utf-8?B?SWxnR1QzWk9QQzVmYlNoSllteG5oOHhoaXhKWk1ZOGUrVis0ZERTYkhWaFVs?=
 =?utf-8?B?Y2gxN1dNSStqdkxydFJxdDlwRk1HVm5NdTlaTTluQUFJT01zWkNkVXh1Q3Vm?=
 =?utf-8?B?dTRSelJLa2dLU096SlFqdTE3d0ZpNjU2b040MkUyc1RESmdYVG9xd0tvTC9J?=
 =?utf-8?B?UlF3c2UvcGZaMWxmenhCMXNTVWNTNXYrckFOOHh0N2xlaitNb1pxcXdtc2lB?=
 =?utf-8?B?anJzNDNtZGNwTjhNSmFiOGJsZUk0NkFqS3pJUW8zbTlZcldOaFFHbUJYNmVR?=
 =?utf-8?B?MjZJSGJGVGpNMzArY3h6S1JUdnJQSU8xSElER1VLcEZzTmtsU3hvc2M5VDdD?=
 =?utf-8?B?NGdqNk5rK0k5Uk1UMkZrdzR5aWpET24xQ1lBMC9vQktDSUxvL2xLNEZENHUy?=
 =?utf-8?B?L2Q2OE5nMU9qY2J4YXpMdC9MWlZ3cXd5eGZEZzVLbFc4cEV0cG5mZHl0YjV5?=
 =?utf-8?B?d3Q1T05FQ3dPck53MXFwWEFnQ2dka0svRmhoblJtd09xQzMwbTBFR25Ib05r?=
 =?utf-8?B?Zkg1UlYyd05yeUVTUWVCTFB6MGRxajZyd1B6aHdiaWRJNVVjSWxCcEllMWZI?=
 =?utf-8?B?VksxdnZlR3VXL1RqbkZaRHRnby9YYVNDYVViYU1aNnpxRlNiclZscDJlWWdD?=
 =?utf-8?B?RHF6L1ZIUEg0V3c5bStjaHlKejlpS1pHQzVDSTc4UU5CUytGdEZNUHlINlFy?=
 =?utf-8?B?emZmbjF4Wmt3alBDQkFoL1Z6UmkwcUp0aEFpaDgzai9ZZ0t6VUJ3MXVWdDZB?=
 =?utf-8?B?TWVvUmJ4MWIvb0grNWtOUjRzdjVkUUhOVmhrK0VXdTh5MGpvNlBwLzBPNyta?=
 =?utf-8?B?endDS09ocmEvVDJtd1MvZ0RHZ3lrRFFtNWEyV0RTZ1NNSE96bG0reEI3dU4w?=
 =?utf-8?B?UGFhSWxzT2VhZ0FSS2YvU2tteTErRnU2R0VodFBxMUlQR2wzU040NDZZS3NH?=
 =?utf-8?B?eFNKZTJDeHc3ajdOYzhPTGpGS0wreTQ2VnZTZkp6TjJmODE2TWpYc1FNYUli?=
 =?utf-8?Q?wncUSF8Psmrsv7ZX9k2oDrSaK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: usKAK6vOiFu0JShpwjrdJvpdHuPARKUK2+5XDJum+dXqEqYKp/VuuaEFslJSZfgPA/CSvTgOWb4GDbds4WMEYG/EpFjn69rBtKndyM5GEq2s2i1DQJeDQIOau1zsXwwpAPxT5N74hm95P5CPnmKjrbvGjH+YkjFSyNQEab/GOmWTtacdM4XnS1plZLqTLB78VQmpdxTSwNQlhdXElpOFWH/un50ecIlEuA19S1EYq2qv+n+C1BjFUUEdRXFpBp46HWOc+kcU6jJ5j16eCeZEHDVWX/fOdxqHEWMwxjEn3Geo1Paupocvm3qVrxKJIoeFhBpgqmsu0+v4ahSvgCINyl5pQNwJBStfzPlb10JZZjtolTz3bjhvi4CcXw4lQrEWAtw+hes4nYmB7Vz+ER/eDbdgJxo5fplxwypb/mNfkTMxNsX6fb7zfdOFMNOOeekZ7B2Kpvv6StMZSaB/l+eaXa48V7biridTsDdTpvyeWX5eAoOrt7N10cYyjb7X+3zwb7II9takziWd9dF6BJYU6+39Ck6+6SWC7hI1h+92NMG7Qiilwnhiphf7OnSdPY393gKb1xBmxyR7FEJduKFBBtb13o+fO/j5dYIpBOJa5rfpLJ0GfvNq1lGqVijoByVCx5NJfeQ6v99jutBlGjY6UnRLxCXgBd0Yl5OEEpKAIviqcxKF7PJ2idve4IsLnj2lsYGlUl1gVKOeAQ/czmg9Fm/lvC5f2FulnnOV6g4EmH0QIYcsNtR8qZzqRWnR7Fyso14qdT/75TqnDv3dXCnm7Rp+3HvlZtuhrWN9miyIDx4xX03TLocmFJOHCEOxDaXqCiZKBoHEFxJqw+ickBiAEA==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6dba80-94ff-4002-b8df-08db481de42e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 19:22:22.2536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+YVMO+hHwPN+qvD0jbipdpRR8IWBK7OCkiOibQnton4qXlenHlfMSMRv7tv4htnK3uzCBjxl9ardGoRhygzvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8532
X-Proofpoint-ORIG-GUID: 28N7Ie7XKR9w55FXIUgmi1QgMki3I0bX
X-Proofpoint-GUID: 28N7Ie7XKR9w55FXIUgmi1QgMki3I0bX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_05,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 mlxlogscore=726 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280157
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF5bG9yIFNpbXBzb24N
Cj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDI3LCAyMDIzIDY6MDUgUE0NCj4gVG86IFJpY2hhcmQg
SGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgUGFvbG8gQm9uemluaQ0K
PiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBTdWJqZWN0
OiBSRTogW1BBVENIXSB0YXJnZXQvaGV4YWdvbjogZml4ID0gdnMuID09IG1pc2hhcA0KPiANCj4g
DQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUmljaGFyZCBI
ZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ID4gU2VudDogVGh1cnNk
YXksIEFwcmlsIDI3LCAyMDIzIDg6MzMgQU0NCj4gPiBUbzogUGFvbG8gQm9uemluaSA8cGJvbnpp
bmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiA+IENjOiBUYXlsb3IgU2lt
cHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gdGFy
Z2V0L2hleGFnb246IGZpeCA9IHZzLiA9PSBtaXNoYXANCj4gPg0KPiA+IFdBUk5JTkc6IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZQ0KPiB3
YXJ5DQo+ID4gb2YgYW55IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBt
YWNyb3MuDQo+ID4NCj4gPiBPbiA0LzI3LzIzIDEzOjU2LCBQYW9sbyBCb256aW5pIHdyb3RlOg0K
PiA+ID4gQ292ZXJpdHkgcmVwb3J0cyBhIHBhcmFtZXRlciB0aGF0IGlzICJzZXQgYnV0IG5ldmVy
IHVzZWQiLiAgVGhpcyBpcw0KPiA+ID4gY2F1c2VkIGJ5IGFuIGFzc2lnbm1lbnQgb3BlcmF0b3Ig
YmVpbmcgdXNlZCBpbnN0ZWFkIG9mIGVxdWFsaXR5Lg0KPiA+ID4NCj4gPiA+IENjOiBUYXlsb3Ig
U2ltcHNvbjx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhb2xv
IEJvbnppbmk8cGJvbnppbmlAcmVkaGF0LmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gICB0YXJnZXQv
aGV4YWdvbi9pZGVmLXBhcnNlci9wYXJzZXItaGVscGVycy5jIHwgMiArLQ0KPiA+ID4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IFJldmll
d2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4N
Cj4gDQo+IFF1ZXVlZCB3aXRoIG5leHQgSGV4YWdvbiB1cGRhdGUNCg0KVGhpcyBwYXRjaCBpcyBj
YXVzaW5nIHNvbWUgeXlhc3NlcnQncyB3aGVuIGlkZWYtcGFyc2VyIHJ1bnMuICBUaGV5IGFyZSBj
b21pbmcgZnJvbSBzaWduIGFuZCB6ZXJvIGV4dGVuZHMuDQpXQVJOSU5HIChBMl92YXZndyk6ICdF
eHRlbmRpbmcgdG8gYSBzaXplIHNtYWxsZXIgdGhhbiB0aGUgY3VycmVudCBzaXplIG1ha2VzIG5v
IHNlbnNlJw0KDQpJIHdpbGwgaW52ZXN0aWdhdGUuDQoNClRheWxvcg0K

