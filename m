Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D06A9AD5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:41:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7Va-00053R-FT; Fri, 03 Mar 2023 10:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pY7VZ-00052x-4M
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:39:45 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pY7VX-0004vx-D0
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:39:44 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323Bu8qG027666; Fri, 3 Mar 2023 15:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=LoIN5vvsLt4Z/GgCHw03vkdeD0sDJh14ARS0pYu4GHY=;
 b=g9vwSxEhUshN9b1TgoSS6sBj3nqB/EnGJnJIho0PpnSZLRENkk0HdSDNuZtI6FAHzmkY
 DDd+2Fw3eR9md6broZJoKTl9c7/CkVvj3fgqp3E/EJdDg4nYWgm3nhrUpsZpaBC0QkWx
 LXTLNa4Q+XLIsGV+wJltFoJUhOYlqE8IbwPaHGunk+kd6Vr99mozLrP2o6GOvBwvxw/f
 fzcR5xlXVjRunKah5aV2vFFKp6t5S3qsBUd3ZrFuj6q94tgmgjajZwQsVAS4xC3uA12X
 UX8tkHBeCIiuCd6xELy5OWldEIFmub7Edszd4ltNLbejmzs/fpVJpOAAV9C5rvkYa9Ks vg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p3801t148-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Mar 2023 15:39:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zmdd6421g0hmzibW1eTtd6fkg/XscxHArzKYE6gXw1/7vAzm1Fe8EtpcP5uP7xV+NHHueXgsvEEMGA3tFUbF4NW04Po8JFGmAoPAVJ1K8JSeqPtbzNyUf8Ma/LobWEIUjyjz6VdcZVf3PnDofyHuLHp9yjdd7Q78USNDJ1eijjduYEZfWq0E2k3VUvvYHETIeS3S3LBaFYl7eQS2lRQHHSzQs3L29P37KKK2LsLwBVid0xslFf6Dv1VSv4hbJW4a+gwP4KwRGpBSDArPUcN/d0tqaw3cKyqY8YhqqgIL8G7HsSCyy7dWDGZbZZqf/bRHbBvwMfaYAzPkjK1A/u+kVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoIN5vvsLt4Z/GgCHw03vkdeD0sDJh14ARS0pYu4GHY=;
 b=DvSc858ZNXzm4wNJCeGOQxjUmhq1huOkFeb321dg3X6vWanYxRSRxepXVzt8tP7OAWgqzxV0OV+v7U4sAYm+soW7Wg7aJfkl/rw3Ygc1dotR/Sr3gsMgH18pQTdeCSnal228AHzUW3Dw3qmLYweGAa7dtau0PqVjnkfsZi/KDWHIrFkVZH/noNvU+bk16w4ddM1g3JUxQbQVxdnThlAImIGFoLlrqGKSDzM22CVtuGY2AgRmPnbR+zg/9u5NpwCoddQzfZILVkPFQR9zX1Oxrm6NtuZGWlr4fBZK03wU0M3LSjd6Mqn4ukWS35t/tZTuJm4VnkQpVmJYGOlNpdrSKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6711.namprd02.prod.outlook.com
 (2603:10b6:610:ae::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 15:39:35 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 15:39:35 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "anjo@rev.ng" <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "ale@rev.ng" <ale@rev.ng>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>
Subject: RE: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
Thread-Topic: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
Thread-Index: AQHZTElL9AdChuPYo0aSaFmd2Bpt7a7mfpBAgAKingCAABIDwA==
Date: Fri, 3 Mar 2023 15:39:35 +0000
Message-ID: <SN4PR0201MB8808D8C4AF4601FB5F8E3BECDEB39@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230301142221.24495-1-anjo@rev.ng>
 <SN4PR0201MB8808E80B0AD000E394223813DEAD9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <4c181663-5ec3-cd94-1e0f-f6551823fac4@rev.ng>
In-Reply-To: <4c181663-5ec3-cd94-1e0f-f6551823fac4@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB6711:EE_
x-ms-office365-filtering-correlation-id: 22ee6501-9c18-4abb-9e62-08db1bfd7ddc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WXcQt5n8FtY4LBMayvqLZkUchCDwbbWsid2zUbYzANeWDe3DHTV1hzMN0Zi09Xqr8goxlC52SkAFM+ZCostE9gRNUOxMTlQi8/4TpcwFYgFCeD5JPF22SRVASu3vrnuPB0Rs1jzjkvHPqBv/QwzW5ooMLAfEtbP4Jpi6sROAGC417iJ1nCGONJDWssZ0D9iDCAdaL4d+GklvYWQykBruzweqOBfz5I9nYFzruUVD2VvAVlAW4aqw+elr0bI3IazBMpHJfOQ8t2ppP9qXbR2juv/6+WdoVWApmzAlFrasaevb3Czg6MCsiruvkUt6y2OtiynncX5qYDcp7jx64105sxXr0/gYWwGWuXYtgPnj6cJ05iNLeZ2b+wdKLL57rog6CBP4EfKOyFBsCVzPEfjWpRidCcgP/oreeZ+5gyjjBw3HZrAZ05JVWRSYkHZiBy4aRpFco7ll9fH/JH3KpMSc/TZxTtzRXE9QceIHk3oWpzJo8lrPbxKegFpLBGCRiOdMttXq5IZ4NQmSdWY29fqAzsEspMHx0KHaW6oxkrdNlZ97aN4kuNj6O721bTG/KOqXVOjCqITImx5M/6Y17oU8lWPS/w3vwwteO7jEjIfY1v3ejJDUh8MOxOOewU7oR8wi3UyMa9HYROaBv4ry5hP5hZoV6SHbn8BTmyvNwK7l6xlTg7jzAqQFSCJi7fs74KHs7jFT+srl2bsaTfIrJZPCzraHiMnb2uSzKQn3I+ZgMDs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(86362001)(33656002)(66556008)(52536014)(53546011)(9686003)(186003)(76116006)(64756008)(66476007)(66946007)(66446008)(54906003)(8936002)(8676002)(41300700001)(110136005)(316002)(7696005)(478600001)(5660300002)(71200400001)(6506007)(55016003)(122000001)(26005)(38100700002)(38070700005)(2906002)(4326008)(83380400001)(81973001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGtHL3ZNSlZzSDk0MWlWZVJtQ2dJZ2dRcTRvSk9ZSnZRNkNWMmtRbWZ6ZU83?=
 =?utf-8?B?bXQrZ3h2dERjNit5VDJIQkgzODdheUw5eWhNVU1WMEU4UXRoZHQrcVBMR0dG?=
 =?utf-8?B?RjVwMEhxWDVJNGJVWm14b0xOaG1KSTdnSkd2UVR4a2hVQlFseDFZQTV4enJu?=
 =?utf-8?B?VHJJTGZvcnhyeDk0MU5TOTZscHlWMkdQWXpQUUdFVlk4aUVBeXM0aUxPOUFw?=
 =?utf-8?B?REJJUy9UK0d0L1lXcUhhSUk0VlFrRTJOMWtuNFN4KzhNeG1FT3l2THYwcTZX?=
 =?utf-8?B?ZU1FZnM1c2F5RWJvUWhrRnlLNkRURjNnUFdtdGdRRXdiZXB1RXE3cG1CK0ps?=
 =?utf-8?B?aDd2ZnpGK2Q3MzNaejJoQ0lNUXF4QWJUUWRNeVNDakNjejg3NXllL3ltUnRV?=
 =?utf-8?B?MnVuMk1PODdvT0VJNlpkMWYwOGdVSG5jTXZOU0tBdStvU0FnMkwrOGY5NWdZ?=
 =?utf-8?B?TFlBUGljZ09zNkxpbUY4UXZzb2hFSkpmMzZ4bXJ6a0twYm9YZElrSTdZTU1a?=
 =?utf-8?B?V01ZQUg3S054djYybm9uRWVueERDTko3bHJuMVIzTDRTb2tzZHJDZE44MXA5?=
 =?utf-8?B?WkJtVk8zSkEzRnhNY1h6ZjBrWFRzMFREa1g3TmFCY1VuUHpDNStYZ05nVDdk?=
 =?utf-8?B?ZjIzUXhLUGxHakxyZXFqcU82TzNyc2FURnFYVE1ib2ZkSEpubWh3eFVHaUtP?=
 =?utf-8?B?UkZWWHdKOFF0aFNGSWV0OVlGUW1ENjNLa0RzR3pXRGxteHhyY3lZK1NJY29Y?=
 =?utf-8?B?SkhMakc2blBIbHJ5MzFPNm13VnU2NE5tZlU4S0lRNzZDT3p0NjFhSEw1NHVa?=
 =?utf-8?B?YVdta0RENythZFJ5am1JUmhScjc0TWh6dURINmpzZnNNcVh3L2h5dGx0Um9P?=
 =?utf-8?B?VE9xWm5PN3RSa0tReTJCeFpQTlpITVYxNlFuRDNaTWFWcDJzK0Z0T2NJcDll?=
 =?utf-8?B?ZzlMQXVGUnZoKzJMREx3R1RDNUU2T0h4aHJOdWlqMXU3aXJCY2pRVVFydXVG?=
 =?utf-8?B?YWEyelhybTAyUU5KbmhFeDZNcFprdFFTZUtzTEJkTVdZOXpZZGVRYUhNclc5?=
 =?utf-8?B?RmpWaEZ5SHM0TVQxc2NUMmZza1VMSHF5NG5FZjltbGNTQnI5S21GVngwcVlS?=
 =?utf-8?B?SThOQ3ZaLzhyNjlwbDZRTlhEbkxzTmRaU2dlSWZqL2VkdW9OS0Fla0VBcUVu?=
 =?utf-8?B?eU1ETFpRanNLK2RRZnF1OGhlbDU1NEJYNFRYZGI2WENSLzdXNmVJdlNiRHZ3?=
 =?utf-8?B?Y2N2eDVZZFNsVkZMa0FvYkZBZjNVSC9Za1FZcUNvVmNaWVhyWEhvNTRrMVZ1?=
 =?utf-8?B?aEx3YjBlNDFwZjlRL0lWQnlDamphWlArcTA1Z01mZ0diT0RWS1ZiZklUY1lD?=
 =?utf-8?B?RVdHNEtGb2VObzNmWWRFTTlnUnk5L2gzSlhJcGcvcUNzWGJEUHUwRlh1ZTF5?=
 =?utf-8?B?Q2ZUNmVUNmhnVU9JajJ0NXBwZGJHUC9zTWhuaDlrUmVjQ051Yld5RDFGb0lT?=
 =?utf-8?B?Wjh1ZnlwcVUrVDJkdlpPTEZsd09TTENFTTZ1WGZrOUF4cW9KMW5Xa1hySU9F?=
 =?utf-8?B?RGd3cStuSjEwcmFzZndGcFZsV0lUVTEzUGFHcmJiZzdzelhXN0hyWG5yQlVy?=
 =?utf-8?B?YmxQUER3bStPUTJxLy8rR2pObkdyRUlBbEhhWTNsZnY4STFFdHp2UjBYMEZN?=
 =?utf-8?B?U2pjL1ljSENLTzdVcEJrUmMvR3dUTWVRV1h2YUNhV2FzdWFBMWU2MkZhNEVj?=
 =?utf-8?B?NEtnSnBQZ2dod0l4UkU2bWhscHJzcytFQll4NUgvYVdSSkt2UkVBMEhENmpJ?=
 =?utf-8?B?OExxRVVXNkIwak1UQXZDZXZSWE01R3M1Zm1reUJEelpYWjlUYzgwMWQ0dk96?=
 =?utf-8?B?bTBDaVRaSlhIa1BGTlZ1ZmVwMWFyaWhweGJLWTRtYUhKL0FadUQ3NzdlNWpK?=
 =?utf-8?B?TnRtK3duZjhXbExrbElwSUFaWXozRFpjT1NYWDJ6Q2Vvdnh2ZTA0L0t5UUNB?=
 =?utf-8?B?SW9kZThtV0FvTHVMVVJRaG1MTCtsYkJJOVduVEhqb2lOUXE5U3ZGNFBaZ0lj?=
 =?utf-8?B?eit4S2pxQnk4a2tHY0RPWlh5TytDOVoxYXZrU045T203WnVGSEZuZXBzQU9y?=
 =?utf-8?Q?s3uJLL0PZbnGtmUUkHJvw8BAe?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bb8kPIPD2mKp9PtHrdKCIWgi/ivVJg7pj/+rXypaK+eylrEAP5wBWpARWd0TbigGxK/c3F37r6WK6E+6TW2KUSYGSDMFhUcySIIXSwR/Wk3RQel4qNKCwz4/iD7CdpekdYJ240Q54Uq4Y65lYraZfbLbGixTYWUrc/4fmtb3ph8CP1O1/pOkP+jm4fPjohbT4PtNwl3KexXefBpAc60Qz6n/N6H2wYXs/0WKjiY00VuS1rqXT5RWhyCn9eQsB4p79j5dQFxr8MDcFhDB3/JgK76Y4CEwMlE3SS3nbTGN4w/q06anCkLbUeMaKIlkj4b65+AcjpM+T/vB+7vXzQHBy0A9PcsIEMJG/GyjNpXWYMNaP7cIZfdn1LJTacNuBd6fgZjLIdd6ZMjowHzLLlDXZhKy/Rtxmdm7jWd2LDAcKbo61IfMRqJj8gN9JDZrg5sUHdw0ShAGm0b9imfGjXeuLZJ2bofiyDzmylUDV2bBIolD3wcDV61gqRws9dfDmv6mCDmTw6DAOTMy/p5+NvsOppWkd+DSqYK517rQJ4GpdKDq2979r4OSUKQXrNsae6/mitCry5aTJuytIGRJVSoB3uKKP0tKVL5gj/lPocJWrqrelVHGuI8T905lgfw7nAeG9SulEUIuvU6WiUHUN3QPgYU42flCVTCJCzEm+NAsA6TnFSpFoOAwg0YbOxaM6JtSKhOoBlzuEZoYhuGoxwkCQql0YICzLOKtyTJDK6EN9EmJVQ/VumstynM/OcvGzfCLg+6qvIM4UIo63mjmsG9rekEWOyOclGbGfuBKfv8Qj19fPm4v+EUdWoBsVCzA3SpS
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ee6501-9c18-4abb-9e62-08db1bfd7ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 15:39:35.5187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmebIDgT84r1XUOOm1wueUBhzsQ9IdvZCvhITXWxWPqxv8VfTUgHctgMBl4pnAQZaAOacI+1EUytWPGjALHFaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6711
X-Proofpoint-ORIG-GUID: I8hXnp2fVtba6bpvvyH4rQQ05JWky-k4
X-Proofpoint-GUID: I8hXnp2fVtba6bpvvyH4rQQ05JWky-k4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_03,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303030135
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW50b24gSm9oYW5zc29u
IDxhbmpvQHJldi5uZz4NCj4gU2VudDogRnJpZGF5LCBNYXJjaCAzLCAyMDIzIDc6MzIgQU0NCj4g
VG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZw0KPiBDYzogYWxlQHJldi5uZzsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIXSB0Y2c6IGByZWFjaGFibGVfY29kZV9wYXNzKClgIHJlbW92
ZSBlbXB0eSBlbHNlLQ0KPiBicmFuY2gNCj4gDQo+IE9uIDMvMS8yMyAyMzozNywgVGF5bG9yIFNp
bXBzb24gd3JvdGU6DQo+ID4+IGRpZmYgLS1naXQgYS90Y2cvdGNnLmMgYi90Y2cvdGNnLmMNCj4g
Pj4gaW5kZXggYTRhM2RhNjgwNC4uNTMxYmM3NDIzMSAxMDA2NDQNCj4gPj4gLS0tIGEvdGNnL3Rj
Zy5jDQo+ID4+ICsrKyBiL3RjZy90Y2cuYw0KPiA+PiBAQCAtMjY2NCwyMSArMjY2NCw0MCBAQCBz
dGF0aWMgdm9pZCByZWFjaGFibGVfY29kZV9wYXNzKFRDR0NvbnRleHQNCj4gKnMpDQo+ID4+ICAg
ICAgICAgICAgICAgICAgIGRlYWQgPSBmYWxzZTsNCj4gPj4gICAgICAgICAgICAgICAgICAgcmVt
b3ZlID0gZmFsc2U7DQo+ID4+DQo+ID4+IC0gICAgICAgICAgICAgICAgLyoNCj4gPj4gLSAgICAg
ICAgICAgICAgICAgKiBPcHRpbWl6YXRpb24gY2FuIGZvbGQgY29uZGl0aW9uYWwgYnJhbmNoZXMg
dG8gdW5jb25kaXRpb25hbC4NCj4gPj4gLSAgICAgICAgICAgICAgICAgKiBJZiB3ZSBmaW5kIGEg
bGFiZWwgd2l0aCBvbmUgcmVmZXJlbmNlIHdoaWNoIGlzIHByZWNlZGVkIGJ5DQo+ID4+IC0gICAg
ICAgICAgICAgICAgICogYW4gdW5jb25kaXRpb25hbCBicmFuY2ggdG8gaXQsIHJlbW92ZSBib3Ro
LiAgVGhpcyBuZWVkZWQgdG8NCj4gPj4gLSAgICAgICAgICAgICAgICAgKiB3YWl0IHVudGlsIHRo
ZSBkZWFkIGNvZGUgaW4gYmV0d2VlbiB0aGVtIHdhcyByZW1vdmVkLg0KPiA+PiAtICAgICAgICAg
ICAgICAgICAqLw0KPiA+PiAtICAgICAgICAgICAgICAgIGlmIChsYWJlbC0+cmVmcyA9PSAxKSB7
DQo+ID4+IC0gICAgICAgICAgICAgICAgICAgIFRDR09wICpvcF9wcmV2ID0gUVRBSUxRX1BSRVYo
b3AsIGxpbmspOw0KPiA+IENhbid0IHdlIGp1c3QgaW5zZXJ0IGEgd2hpbGUgbG9vcCBoZXJlIHRv
IG1vdmUgb3BfcHJldiBiYWNrIGFjcm9zcyBsYWJlbHM/DQo+ID4NCj4gPiAgICAgIHdoaWxlIChv
cF9uZXh0LT5vcGMgPT0gSU5ERVhfb3Bfc2V0X2xhYmVsKSB7DQo+ID4gICAgICAgICAgb3BfcHJl
diA9IFFUQUlMUV9QUkVWKG9wLCBvcF9wcmV2KTsNCj4gPiAgICAgIH0NCj4gPg0KPiA+PiAtICAg
ICAgICAgICAgICAgICAgICBpZiAob3BfcHJldi0+b3BjID09IElOREVYX29wX2JyICYmDQo+ID4+
IC0gICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9PSBhcmdfbGFiZWwob3BfcHJldi0+YXJn
c1swXSkpIHsNCj4gQWggSSBzZWUsIHlvdSdyZSB0aGlua2luZyBzb21ldGhpbmcgbGlrZQ0KPiAN
Cj4gICAgICBkZWFkID0gZmFsc2U7DQo+ICAgICAgcmVtb3ZlID0gZmFsc2U7DQo+IA0KPiAgICAg
IGlmIChsYWJlbC0+cmVmcyA9PSAxKSB7DQo+ICAgICAgICAgIFRDR09wICpvcF9wcmV2ID0gTlVM
TDsNCj4gICAgICAgICAgZG8gew0KPiAgICAgICAgICAgICAgb3BfcHJldiA9IFFUQUlMUV9QUkVW
KG9wX3ByZXYsIGxpbmspOw0KDQpZb3UgY2FuJ3QgdXNlIG9wX3ByZXYgYXMgdGhlIGFyZ3VtZW50
IGhlcmUuICBJdCBpcyBOVUxMIHRoZSBmaXJzdCB0aW1lIHRocm91Z2ggdGhlIGxvb3Ag4pi5DQoN
Cj4gICAgICAgICAgfSB3aGlsZSAob3BfcHJldi0+b3BjID09IElOREVYX29wX3NldF9sYWJlbCk7
DQo+IA0KPiAgICAgICAgICBpZiAob3BfcHJldi0+b3BjID09IElOREVYX29wX2JyICYmDQo+ICAg
ICAgICAgICAgICBsYWJlbCA9PSBhcmdfbGFiZWwob3BfcHJldi0+YXJnc1swXSkpIHsNCj4gICAg
ICAgICAgICAgIHRjZ19vcF9yZW1vdmUocywgb3BfcHJldik7DQo+ICAgICAgICAgICAgICByZW1v
dmUgPSB0cnVlOw0KPiAgICAgICAgICB9DQo+ICAgICAgfQ0KPiANCj4gdG8gaGFuZGxlDQo+IA0K
PiAgICAgIGJyDQo+ICAgICAgc2V0X2xhYmVsDQo+ICAgICAgLi4uDQo+ICAgICAgc2V0X2xhYmVs
DQo+IA0KPiBJIGRvIGxpa2UgYmVpbmcgYWJsZSB0byBjb21iaW5lIGJvdGggYnJhbmNoZXMsIGFu
ZCB3ZSdyZSBubyBsb25nZXIgcmVseWluZyBvbg0KPiB0aGUgbmV4dCBpdGVyYXRpb24gb2YgdGhl
IGxvb3AgdG8gY2xlYW4gdXAgdGhlIGZpbmFsIHNldF9sYWJlbC4gU2luY2Ugd2Ugd29uJ3QNCj4g
ZXZlciBlbmNvdW50ZXIgbW9yZSB0aGFuIG9uZSBpbnRlcm1lZGlhdGUgc2V0X2xhYmVsIHRoaXMg
bWlnaHQgYmUgb3ZlcmtpbGwsDQo+IGJ1dCBlaXRoZXIgd2F5IEkgdGhpbmsgaXQncyBhbiBpbXBy
b3ZlbWVudC4NCg0KSXQncyBvdmVya2lsbCBmb3IgdGhlIGNvZGUgdGhhdCBpZGVmLXBhcnNlciBn
ZW5lcmF0ZXMsIGJ1dCBteSBzdWdnZXN0aW9uIGlzIHRvIG1ha2UgYWJsZSB0byBza2lwIGJhY2sg
b3ZlciBhcyBtYW55IGxhYmVscyBhcyBwb3NzaWJsZS4NCg0KPiANCj4gVGhhbmtzIGZvciB0aGUg
ZmVlZGJhY2ssIEknbGwgcmVzdWJtaXQgd2l0aCB0aGlzIGNoYW5nZSEgOikNCj4gDQo+IC0tDQo+
IEFudG9uIEpvaGFuc3NvbiwNCj4gcmV2Lm5nIExhYnMgU3JsLg0KDQo=

