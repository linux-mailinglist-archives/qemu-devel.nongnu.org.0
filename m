Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013740455A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 08:03:08 +0200 (CEST)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOD9O-0002UJ-US
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 02:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOD75-0000wh-LR
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:00:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mOD73-00010w-IS
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 02:00:43 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1894ITQY031111; 
 Thu, 9 Sep 2021 06:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=7LGrFPyy5KRdmkJSrSM48iGf+vmfwG8LiUnXx/KxAp0=;
 b=Qa4CFl6JVALe/9zeQ59NNhYaJIDiBA7EO4rJegYo3DmV6Fd1qLvgDVs2y8FTFV7NsAT/
 4xe4SjQrXDFGFzHx9NtH/vK04OpR+FDJ5RqxFU3FqwEftAmws5lNMzhZVA616dcJgJKr
 VLjNpyXRznvfIt4EwN/Oi+XyRE/rJm4g6P80HM84WbZc/A68diY68uHaFEM7GODcS9u4
 UWGllYJfmqFfml8jwol6HcVH+gkN6J0jEbuhjVrQvRmPEjwNDZWhCPae/KvoI3fTUjsh
 qosDFXl0z32CsOhfU/IXSUcdCyh4ksDwg5R8hrhNs5v8iDDlsCkwyV/nPu92Vs2o/LDh cQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=7LGrFPyy5KRdmkJSrSM48iGf+vmfwG8LiUnXx/KxAp0=;
 b=P4ulNmzkIs+T+LpxgrfyLPAeZUUTZPwVFILPyp94XJTIAjb3GTd2aD1E7bicX+1SQZew
 PuZzRj0oRKsFhzMSWSoOtYUXJUpaQOl3B8oi5zPjOZnzy5+LqlCFZlQlEncF3FjMuFFg
 qg4hKDx/B1H1WHQ1G7/P3Ny/AWTuatRm6yjhujGLNk3iovAX+Nb4RitRPcrlRr6Z3/b5
 XwXS3IK/27VoWmiIQv2BHE6I4YwnB5Ajs/NPNLlVMTr+ndEJTnOGUTEavQYQ2GRoW0RE
 u2hnm/Z9MGl25R3TxYKlsutgsYMsrFHNp/22ZjFuKyxPZdGKf5768dw749kLiEdKbguR Vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3axcw6d6b2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 06:00:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1895uEJw083087;
 Thu, 9 Sep 2021 06:00:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3030.oracle.com with ESMTP id 3axcppqtrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Sep 2021 06:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxTqlV0fmMPSfBNmpyE13ABvVgEVgPAcWpC6sWfNbZHvt1l/rg8Y6uNkp8EnAJzn06XGSzza4X2ZLB3FSzP55lfyOFkDzExsedwvNhmSj3s914KkGFOh7pGnurqKnmdxtHjn0FnjRpObTc7MoHjxpMoDq61+4DZUMf/TOnG25FDue3Tr1YdAR1dc5UMQa7ws9qzSoxsvrk20BZBIEOj7PhBDsQ1IlsNg0dzV2w0Lt6W0OB4X5ESdMPcZq0EQZr41aTaK4CimfAwwdRWF8MO9KT5+FhqbUtJadkQkCcwuYg4CYMpvANATePEf1XM+RyjvWuJqSTjo/V5/zkg+CbfMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7LGrFPyy5KRdmkJSrSM48iGf+vmfwG8LiUnXx/KxAp0=;
 b=ZwPJa7SiqERR3uLr4ETegSCxP4nI3GRyIWv8WUavm0PE5UQDduwU7HFNXGgkTgKAszohDWOpPY6UPRnO3/OBF1eFZGpm9I+kWP0HTDHPCf3dVmdaHM67jEJwGEfZQ4eYLIC73E29/hMjwKCbgS1yiZAZF22iLl7zBUGfEbOZ5oy5M4UIbX0eUbj4JMN9Jthlq0/S9o/YN8fC4q/T7HrGCNU6YxXbO2QkeQr3h3qOnOFPKlTmJsrjvkPyBi3pdJ8BsYwu3QoKeXEOhPHefkbz/byXcLWLoZA9tu/WgnogwMGc3BBfXwCHN13AjrDSXdM1ksZSpk+RYC8I6KV0ywkMbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LGrFPyy5KRdmkJSrSM48iGf+vmfwG8LiUnXx/KxAp0=;
 b=YDd1uLlS8aHoFoZDaQVXV7RANEDsFJfcU+mzdfqLs6wwgBBAJznZz61LPJ8BsKBGTkOnub3PNV2yjv1C60R1hDqZjHkzLEBv4PSil/TwE6QDBQyWo/b1aPqYBezJYeJY+sDv1V+oW+ZUAS46HnOGhbmft3tcEBqZKgTbr9+UXtE=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR10MB1629.namprd10.prod.outlook.com
 (2603:10b6:301:9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 06:00:37 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::b82d:51fc:e780:8740%7]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 06:00:37 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: John Levon <john.levon@nutanix.com>
Subject: Re: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Topic: [PATCH RFC v2 09/16] vfio-user: region read/write
Thread-Index: AQHXkr3G9jy/LCtCcUyvtTrQze2laquY9OiAgAJloAA=
Date: Thu, 9 Sep 2021 06:00:36 +0000
Message-ID: <A82F2970-293D-4455-8C92-2C9E58C3E626@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <92fb16181e71a1c4049f9995294dbd7ff4270627.1629131628.git.elena.ufimtseva@oracle.com>
 <YTegRT0DPt50h8VU@movementarian.org>
In-Reply-To: <YTegRT0DPt50h8VU@movementarian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: nutanix.com; dkim=none (message not signed)
 header.d=none;nutanix.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aad367e6-4c6a-43f1-df78-08d973572507
x-ms-traffictypediagnostic: MWHPR10MB1629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB1629D7BCFE58BAAEB22F89C7B6D59@MWHPR10MB1629.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GPIKbRLQoojKevj88fldsm9PEvd/nH0f+PDEZEJHaILZC8wKvnSUq8UKdxVshug5EaptKkAMyET1/WXiqcxQUFbZz2hGViw8G3SKAymJjxv1rnIwIOmUrqVe60nYFvLdx63dJFqn47AIaq+OxDBhGKfqE8aMkT6rSonlELskKSjeKelQS/VvxGSWkxuKay6VfT4AQ2EN6GMqn7bcXfZ13gvYZM/46u0TntC7uUVU5FIH4y2YOXCXonsq7MprNTIWQDHxPl2XSkKDBZ//8zbC0bime8XenNpKj50MA2y8QnEU6q3YH+aU3e0lORfqO9F/97MiWS0dgyioy+K8yZByxzNMytRVDKlxpHoKypT+03lMGGtda4DuadHS1H+FBRDOlayzGT9ICFMm/sClQKwGQp9/+btpqed+9TcxM5a0IDnGDE95cFnwdfXRgEKsgYhM4hh1bcWT9ghsW7a+7iyRVA3g2xzb1lKJQ+yVQAjEO0IYZzGpJhv83DmFmDZHaSrMZWexeGPX0KUJ8k9jlqq9NAfLp1GR7++b4qto6NFr0bYGmQdDGeSJCVRSlsTBJNyZyaWnKiRX1TvMz1JexWVfylXV2ghaglZ98YsKnH1FET4b9v0XyMskIQvKEk2SuoRvsqWL9uzgo/NoDFZVeJZJ46YKkuu0s65S3P83JnUfuehYO8RSyTX1vTKJrGaDoX5FQHPty19iiD0Ag6RqD9a2Zu9DLVRBuwPLRPMK1f3wkHdttPJi0cTAwziujXkQHEy7QnUbdwCMZFTxu+TzeTvrmtG2+WN4viMVgdiTtbRtZOm2SkoZ9rUyXjVtfaX5kqjn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(39860400002)(366004)(136003)(2906002)(64756008)(8676002)(8936002)(6506007)(478600001)(91956017)(66476007)(86362001)(6512007)(66446008)(33656002)(296002)(53546011)(122000001)(38100700002)(54906003)(316002)(36756003)(6486002)(6916009)(2616005)(71200400001)(4326008)(26005)(66556008)(186003)(83380400001)(38070700005)(76116006)(5660300002)(66946007)(966005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDQySHA0ZXNPS2FieUdaZVgzTk1GVDdSWEplRTRHRXB0WDRYNWFhbnlnazF1?=
 =?utf-8?B?MmZ3dTRjb0dUQ25UbENVSm9mMHhFKzEvN0QzVXZlVVFaUXQvazFPOE92UFdj?=
 =?utf-8?B?NUcxTXk5aWk1M3FZTmk1TS9yZVF3eG1MTGx6Z0pmUE9CZXplcmdiUlVMN0M4?=
 =?utf-8?B?QlJsYnE1eFFxZi96WTFaUTQ1UHJvdHlncFVSN2lSNEdRaUFpRXZWK2V3WkNs?=
 =?utf-8?B?SEM1VkJmOVltQTUxUHJjcytweEdzV2lRdEd1RmtiWXA0UTM4UzNYYkYvWlJ5?=
 =?utf-8?B?RkNKVUlsV2lFZVdrWDNNa0RPY0lDR3BJMHFXZXI5VTdIa3dpWVNLbDFzbllt?=
 =?utf-8?B?R1dOdTczYnhZVmhHQmJnd0M5K1ZNN3JXQzRUV2FzaDdwbDJQeGQ4MXUzUlIx?=
 =?utf-8?B?Z21EQTdBL2ROMFVrK3dMYUd2OHpFOGJWYld5M3AvVHJ0N0dZekU0TmxleWtZ?=
 =?utf-8?B?aUV3ZDcxWnE1ZHlsdUx0MkFTR1pOQW5xR2U3alhBMWRKY0tCckgwODc4dHdu?=
 =?utf-8?B?aUtObGxXTFNIemllbTdMNEo2TVNZYkRoNWVwdFBHS3BNNGxsZmtNNWlGVndq?=
 =?utf-8?B?SVFvckdVZmRvN3BNenVBdUhQdFRxRTl3RndjaUVEdE1Bdzk0UGZyaTVIU1N6?=
 =?utf-8?B?TzBPSDFWV3JwRS8zOGpoYjJycFk2aWRBcU9NUXd1cXBLQ0RRTmVvNDlxaFE0?=
 =?utf-8?B?Y2ptU1N4ZFdHaGRZVjZmREpzVGl4V0NLdHNlYnNpaEphOXo0WCtUbngrM2pn?=
 =?utf-8?B?eENTM0dRZUhGUmVDSXA4dkVCb2VuSDRqeno3Q2hwTm5hbnBGZHltWCs1TjZk?=
 =?utf-8?B?WUk0eDlVWWhOV0JEN1Q1VW1IcG45Q2xvQ3c3ZFpxZ3FMTDA3MU5YNVZrclph?=
 =?utf-8?B?a0dxcUZUK1I1RHFXVHVCMGhDeVltSnVhbXlscEFmaHVVV0oxdkdseXUreDdk?=
 =?utf-8?B?SWpZWjZTRDdScWxmRlQ1WkdFNDFpUnpiU2ZGZUprWkdQUVBpV0x3TlVJQVFF?=
 =?utf-8?B?OGFjaDNsem50WFl0M3FnZXN4ZVp5d212c2I4MHBzWjBFbEpZbHhUVndlSW8v?=
 =?utf-8?B?RmprZjBFMDNGTXcyWmtVSDNzSzBTQ0FFV0EwTlRIbGVCM3lQeUFjRk1uS29T?=
 =?utf-8?B?Kzh2NTJjMjhVWmRlbVdkWGdwRkMyQVhzeDRLRG9rNlZ5Vk1PMXdiUHlDakMw?=
 =?utf-8?B?OHBJV3pBNmF1eXArMi9DTkdMejQ4R3lUaktaejcvQ3cyUUtiSGU3ZHRuVmdL?=
 =?utf-8?B?L2VHbWQ1L2xYWGl2ZU5wQThpTGRIQStxd3cwVVNUbEl0KzYxcHY4aHBOUlVQ?=
 =?utf-8?B?V0pJM0JEcGg2R0VYTFJIV0RYdktLdStMUEpJRDYvVGRnYkhQbGpURmN5RjJp?=
 =?utf-8?B?eGEwM2VOMlRmMGpJS2xJVFpjVHBTSUFTa1Z4N29zK1VxekZ3aHI1VVYzUjlx?=
 =?utf-8?B?K3BxbFpSVktCK1lYMlRQMnVRVlhqditnd0w4OEw2enVtN3pZNi9jbm1RM0pL?=
 =?utf-8?B?UlhpdlNOT0RYOUljeGNsSU5OWE1YQU9VS3dBcjQ2akhDRjZSL1RpVEVFVzky?=
 =?utf-8?B?cU9GUmt0Ynlwd1FBTWtENlhZWXBud0ZMcHFnN2labEpYNzFCM1I4b3VIcUJX?=
 =?utf-8?B?TzBWWTYyT0lmZ3lXVFJiZldjRDdBekt1MUQzc0xaeU9acjlTYkJYSjZKU1Bv?=
 =?utf-8?B?UHIxQTBvaDVMN0dobWUzT1Vra0kxMm9wM2pDN1NzaXVhSnRQTUwvbHI5U1c1?=
 =?utf-8?Q?uWem1TxGLgpyR3TTZax1QiSXf8wpYW8eCOERxak?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32B46B3BA850DE4F9485FE3AAF9DA81F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad367e6-4c6a-43f1-df78-08d973572507
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 06:00:36.8938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aTl7PAJk/gLnin19WaSysYpi6WvF1fTC3HgCSBkE5HFWTH0wF6Z+7hJhoXdcibcw4MLG9KKGyNaq7cMXTvH+Cmeu38aEbuVhBVndQuap38s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1629
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10101
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109090034
X-Proofpoint-GUID: gqqRllUYrQ0ls_xm46h31sQN90wIZSvE
X-Proofpoint-ORIG-GUID: gqqRllUYrQ0ls_xm46h31sQN90wIZSvE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jag Raman <jag.raman@oracle.com>, Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gU2VwIDcsIDIwMjEsIGF0IDEwOjI0IEFNLCBKb2huIExldm9uIDxqb2huLmxldm9u
QG51dGFuaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgQXVnIDE2LCAyMDIxIGF0IDA5OjQy
OjQyQU0gLTA3MDAsIEVsZW5hIFVmaW10c2V2YSB3cm90ZToNCj4gDQo+PiAraW50IHZmaW9fdXNl
cl9yZWdpb25fd3JpdGUoVkZJT0RldmljZSAqdmJhc2VkZXYsIHVpbnQzMl90IGluZGV4LA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IG9mZnNldCwgdWludDMyX3QgY291
bnQsIHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICBnX2F1dG9mcmVlIFZGSU9Vc2VyUmVnaW9u
UlcgKm1zZ3AgPSBOVUxMOw0KPj4gKyAgICBpbnQgc2l6ZSA9IHNpemVvZigqbXNncCkgKyBjb3Vu
dDsNCj4+ICsNCj4+ICsgICAgbXNncCA9IGdfbWFsbG9jMChzaXplKTsNCj4+ICsgICAgdmZpb191
c2VyX3JlcXVlc3RfbXNnKCZtc2dwLT5oZHIsIFZGSU9fVVNFUl9SRUdJT05fV1JJVEUsIHNpemUs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBWRklPX1VTRVJfTk9fUkVQTFkpOw0KPiAN
Cj4gTWlycm9yaW5nIGh0dHBzOi8vZ2l0aHViLmNvbS9vcmFjbGUvcWVtdS9pc3N1ZXMvMTAgaGVy
ZSBmb3IgdmlzaWJpbGl0eToNCj4gDQo+IEN1cnJlbnRseSwgdmZpb191c2VyX3JlZ2lvbl93cml0
ZSB1c2VzIFZGSU9fVVNFUl9OT19SRVBMWSB1bmNvbmRpdGlvbmFsbHksDQo+IG1lYW5pbmcgZXNz
ZW50aWFsbHkgYWxsIHdyaXRlcyBhcmUgcG9zdGVkLiBCdXQgdGhhdCBzaG91bGRuJ3QgYmUgdGhl
IGNhc2UsIGZvcg0KPiBleGFtcGxlIGZvciBQQ0kgY29uZmlnIHNwYWNlLCB3aGVyZSBpdCdzIGV4
cGVjdGVkIHRoYXQgd3JpdGVzIHdpbGwgd2FpdCBmb3IgYW4NCj4gYWNrIGJlZm9yZSB0aGUgVkNQ
VSBjb250aW51ZXMuDQo+IA0KDQoJSeKAmW0gbm90IHN1cmUgZm9sbG93aW5nIHRoZSBQQ0kgc3Bl
YyAobWVtIHdyaXRlcyBwb3N0ZWQsIGNvbmZpZyAmIElPDQphcmUgbm90KSBjb21wbGV0ZWx5IHNv
bHZlcyB0aGUgaXNzdWUgaWYgdGhlIGRldmljZSB1c2VzIHNwYXJzZSBtbWFwLiAgQSBzdG9yZQ0K
dG8gd2VudCBvdmVyIHRoZSBzb2NrZXQgY2FuIGJlIHBhc3NlZCBieSBhIGxvYWQgdGhhdCBnb2Vz
IGRpcmVjdGx5IHRvIG1lbW9yeSwNCndoaWNoIGNvdWxkIGJyZWFrIGEgZHJpdmVyIHRoYXQgYXNz
dW1lcyBhIGxvYWQgY29tcGxldGlvbiBtZWFucyBvbGRlciBzdG9yZXMNCnRvIHRoZSBzYW1lIGRl
dmljZSBoYXZlIGFsc28gY29tcGxldGVkLg0KDQoJCQkJCQkJCUpKDQoNCg0K

