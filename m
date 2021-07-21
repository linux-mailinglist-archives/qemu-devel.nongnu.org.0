Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14CE3D13FE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:21:46 +0200 (CEST)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Eyf-0004Vw-VH
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Etx-0001M5-6Z
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:16:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:51274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Etv-00050O-1n
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:16:52 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LGCkdW018361; Wed, 21 Jul 2021 16:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=rtn78fHqlPziK8cYpZOQXkcD0PFBV9pLQbfXLVHjMy4=;
 b=KBG0Wu3DbsY71kZsxOXyza80Zx+/ELfayzZJAy1OAFF9dljZVdBk3uOKtN6UajFbn+LP
 lo/wcwMO+a3DZRvInTmBL4nvBR1QGu3s58o7ZqzIq7lphY9zouC8e9KjQ9eZ0mbiAwzv
 2mySXiPdbWwyEj/it2ef+TjXwVmtMsIqxd/tjoGFPu4VLpxO8JwJZs4QEFqffx2V+xaA
 fPLj58k9vMup2/+gh3saB2s3xidoChufxytOToI0tUrisZETxtfEBaBNNLwMTFr5iX9B
 KU1QRjAkLYFiBvHDourG9JkFs3hLyGrFaEm2wPPhTf7PMzhYefnwOSzZHBCT8Vn7XL4B 9Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rtn78fHqlPziK8cYpZOQXkcD0PFBV9pLQbfXLVHjMy4=;
 b=YQUitA51N9j7DkctpAsFN5DSEM05C0HWmUnkxUtQApn1TrgZo3/S0sK0ESDSTy6UI+AF
 sz9Z26VVZX6O+zSZJR2mTT+oLffx0YpcIlC9xxcIf/P5luyZEHza4JzSQLFv9AgzqfO7
 P8pA/KYOBVTjWvW4NcP5xNzhdeIpmCajryEsvRDhe/uAMquatZ6AWANM1OeHMRkcerFj
 44A97qIZh4Ck7/QxebV1DOGGe5dUc6JuYUhkG64xPZ+B+/Ziy+N6LKGOQcLBOzdCad5X
 EZ1+x2YbW7/2TbFiCOpiqxqf8VeAT6zKw6bHhVwp2m6f5r9WSQ3SXCDrjOGEUKbIgMKK 8Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr8b9mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:16:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LGGOVu196583;
 Wed, 21 Jul 2021 16:16:48 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by userp3020.oracle.com with ESMTP id 39v8yxpu3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxlQ2pyapK93aqRZX/qrhLXvM5HqlDs3Bi5zMAaQ3E+pLQa+uGuXu4ROBQ3MP1n+d+yUj98LHrYwaBC2CSz+H5zHmJ3Gj8E79xFGsRmcnU6/EDAiJiteEa/nn0Vjd3et6y4k7i2xYp19jtVNEAcIny8iHN3umO7W2NLTP/HGqRlkQsfVg2MHY9sGDIp2AGhIJMPkPTKr6BSEPIK6QXKAjJBL2OgVxLttiDMf1YTdrzBuHH7nhY5VYQTSkhkTHRVVRoN0yoV5H48lkv1jigR5dJ+wDFavYvNB2flEJQn+kARX2INmoT2ob2M5ek6T3oxh8a0dcA8ApF9cvH8Rd1qssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtn78fHqlPziK8cYpZOQXkcD0PFBV9pLQbfXLVHjMy4=;
 b=B4xVpUw/WV5UihGxqBT8mRj61w0C80Z+ZjkNkPqd9LIDNAwCF5xXqnMo0nPBHvQGrFp7MQHgcxu6/l7QEJ+ZeyWVU2boAkLbQqrF82sh3u7WvDq2JkEyOzozopQKsI5yJQs/UMzkSCnRI47I4KYZSNsyB2qQ0fGhR+2BMMKrn/ExiyV0VhL3gWjrzlFXs7xlS25l7I5wrzSM/4e5F3VabzRX7nzco3+l6EIymQ2LGEAPGa3yKuJk5rcW77N9E/jgXoM6yUyvZurPsrFU89sDyjLpq5vHSsxLNOGvqrGHd0xDSElOr9qk4T1TL93sVoHDF2VWDZG2e+hO8HfdDoS3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtn78fHqlPziK8cYpZOQXkcD0PFBV9pLQbfXLVHjMy4=;
 b=t40volQF5hQpASELcAtxYe82X17XD/OqhDgWOceZBQbsvg0G7HMo6kVGDUccVVO3L/pgLBbWxjIH3AnE7a2tJxVn1CkNWPdMww0o91a/Snu8J/l3tpcq4mpvhQkGv4q2H5PmlTofaagU+nemlic3GuPQei1YaAwm32gCTQyv5Rc=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BY5PR10MB3796.namprd10.prod.outlook.com (2603:10b6:a03:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 16:16:44 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 16:16:44 +0000
Subject: Re: [PATCH v5 08/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines.
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-9-git-send-email-eric.devolder@oracle.com>
 <20210720151924.2eb89d31@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <3916035d-a628-f7e2-44f3-1a724e3d523f@oracle.com>
Date: Wed, 21 Jul 2021 11:16:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720151924.2eb89d31@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::32) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SJ0PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 16:16:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c5c1a86-a489-4d4a-93a6-08d94c62eebd
X-MS-TrafficTypeDiagnostic: BY5PR10MB3796:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB37964F3912C1CD254C884F6097E39@BY5PR10MB3796.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: czWQDZgI3zljNiFWOzVIaPCzgeJUijY597sNMBYNwMg2tSjwLpiDGRe/yPC9e+CEsFsQA7GKDfftAKYw89ClFvKpt4GqVsp7QaTa90y0fsAU39HHPz8VBwhYTAqocN69vlylvwhQSZwXmlKGqJeuVpP+i7RYuZFnQlbfK4aqmCCDeJDCShumXaIH5cX7bcvfpHF/74QzP9IIyzJapJTlnaSNfrypkJ+W0xSGWHClG2VEuKxvu98f1/avpz9dmDLONey2MET5YlNkJ/ejE4z4faG/mwpYHWLONNXsVDq1zEC1XjdyRh/evegEEGld4lA3L63do8w7UkT56UfQ6vDAcevz5r0/bC6/Klfm4KfGiYu50/o3rW67qdfT9RNPlU5nIlpYtDdbdQVvTgGkeK4sCW0QtCVotttgHJc8rEE5oSXgD4VogiCcGGXd1O+y6pNIvKdKqaFf8zl3lyXEKsbi4FRwT9uwgdd91WqX0Ihj7XKRT1J35OF7iaQkuLbKU0hDci+fZ4g9Ru8vlieOOIN6HvwstpYfOalia8akr9yTttmH8ZFiwLAJW8i5bsTD51elveCwFHKJ6UAydrb2YCMCEcJ1VXFt2N09w2QTrmzYrFoCSJNt1LeUSqNA4WUR/etZoOPTmYc1hwFxw5+muHCN69IFVrpkoSZuaRJGvPMbm+CHmfwPm82SUF6aiGy7mSBCtzoXwV9xKsd8u9MT1eR17WB6rY8JZOBgz9BgPDCFZI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(396003)(346002)(136003)(366004)(6486002)(66476007)(66556008)(31686004)(6916009)(86362001)(5660300002)(36756003)(107886003)(4326008)(31696002)(2616005)(316002)(8936002)(186003)(66946007)(53546011)(2906002)(478600001)(8676002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlZkNzYyWkVpc0RXYXl3R2wvWDZwLzBlVXY4ZXhPK25GeTJObDcyUDhqYy9D?=
 =?utf-8?B?OTc0emZ3RDZ4R25sNXVLazBXM3NiZS9QSlVQUzl4RFVGUFE3TENxVktuNTYv?=
 =?utf-8?B?ZGRXNTc3WEZFSy9MZlk3Z014RStzVFRsemRhMTF0TG81T3V0MmtqYWxBREox?=
 =?utf-8?B?UWVaS2VMemwxM1BOUzA5Q3JMaExpUXdoRFo5RjgzU1JHbkJaZTd0RXJPOSti?=
 =?utf-8?B?VVp0VTljTzFad3dMNHdGNHhJTkJVaFZVM2d1RDFLMXJkUGt0UW1zS0ZxdEw0?=
 =?utf-8?B?K0FRUWt0VkgvSzdJODlKRGdVZHBGSHNlN2pEaFNVelFXSlRHUkkreW9sbUdL?=
 =?utf-8?B?N0xscnJLYmlHYStsWnNVOGlwcndMbFZVR2R3ZnhNbVQvR0Q5RUptUlNzVHB6?=
 =?utf-8?B?d1ZhV0xZNFhmVzJzNXRPNjVFdGpRMVREaGJObzByK1FSenhJRlBUemFPZm05?=
 =?utf-8?B?SHNLTGoyaWdoanllUVNCL2tudzFYeDg1YzZHVXZrem5xT1N3YzR5WDFVemov?=
 =?utf-8?B?bGVwVllKcDRTR1lMQmdJZDNxdHlvMW1UN1BDMWpkWUszU21GM20veFk1bzE1?=
 =?utf-8?B?UEZ4VmVyZmo5K2FyVVk2S0k4alFLMzZvVHg2WjE1VjVDS3JLZktWVFhGaUhh?=
 =?utf-8?B?ODdoeitMazFSRFd1ektxNndGYzZ0Z1JLK0NmYjBwMnhKNVlDbTRzOXpnT0Fk?=
 =?utf-8?B?bXdlUkthaWpJUkUvM3pmWlpZRVVwQ2Z1emxyVG94aERlQ1JYalZGZUJ4UHZs?=
 =?utf-8?B?dklNZTN6VTJGcUlyYkg2S1J4eEdsVlF1TW9GWXdGdXh6MW1abzlPUmp2OTZl?=
 =?utf-8?B?MU90N3NSdllqRWtNM3hGWGEvZzVQRVN1ZUlFUGI1OGwwNkdQRWs5YU5YaFVs?=
 =?utf-8?B?SFJyMW9pdmJGRStYMVE5SmI2TWlGbzRJMUZKOGdGZ1JEN0pwczZxbjBLOVVC?=
 =?utf-8?B?QlBOUGZvNlBjSitOUXI3UlV6ZnJVRHZtK1VMRE5odDNaWFFHaEY5UkQ1dEZG?=
 =?utf-8?B?eDdFMGlySmpYKzJDWGRpTWlWQTZNWFRpK2hnQ1lySExJaVJaMHB4cnl3Tzhn?=
 =?utf-8?B?VnVOMVk1YnVFcWVDYkVLUkZtMVJJQjM4MytwWFp2eUlEZTVQVkZ4ZDRZemll?=
 =?utf-8?B?ZkdMQlRNU01aS1pQNlZLT2ZBMlZ1WXRXVEdSeUlxZXdwL2wxU3dDbWcxUWRJ?=
 =?utf-8?B?OTZBQ0dZVFJGT1gwNWZ1N0l3clFjK1JHUjBNTUlTSWl1ay8zc0g5RVpnem1v?=
 =?utf-8?B?cjV1aDJLYXJpeHpqSUloUDFRTlN0VVBMdFpvR2pZOW9uVHNkZUd4UXNrUUxl?=
 =?utf-8?B?c21XMGNJVEhWbERTeFJWSkg3OCtOeVoyQU02YkMyUkRVa2pVTmVFWjFjMWg2?=
 =?utf-8?B?MkIveFpXcTRodWpEeFdVaEhpekFnelovQ25DZjBWdE00SEF4bWkxMGxnUFBO?=
 =?utf-8?B?aXh5MTVnYkszbGV4cmlCQW9SNFludTdKbGlOWUdVWGZ5aTFqUHp4L2NUUGtl?=
 =?utf-8?B?dXFWU0ZpYXdHQlFIMjlYdEpVczlDQksxT2FjM0JvVXhIS0VPVjBOT090WDJ5?=
 =?utf-8?B?aGYzWlVGUmpXR0tYbVJld08vaE1VTmRnN0ZrYk13REVwSDBzYUFRekNTRCtt?=
 =?utf-8?B?Sko3eEpsNnFMMUgybXpWclhGWmt4SnFxZmFTOFBrUjlVMTF5alUzWFBYN2JE?=
 =?utf-8?B?MktTZ1ZLWkhXV2hMN2tlcWt1dTFhNWxLOWxUN3BnL29VZ210N09nT21CWjFa?=
 =?utf-8?B?eXEzRDd0Q2lsSVpUWkc0TEZvb3RYMCtBSlN5TjdydHZqY0dlWFpTMVhvaWlj?=
 =?utf-8?B?NXcwTEg3Nm5NenZFd21RZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5c1a86-a489-4d4a-93a6-08d94c62eebd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 16:16:44.6339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8YyF4cNJYoD1cYcs3B1UB77HOsCmquUytIyMj+198qMp07pHSW4rjI1owGOgXQRYNrg6SPauCqxkze2DSyccebyRneYmFGciUVvLGOS4+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3796
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210095
X-Proofpoint-GUID: 4ZqjciZkCUhcxmH72TfYUU1NDe6Rh0Lt
X-Proofpoint-ORIG-GUID: 4ZqjciZkCUhcxmH72TfYUU1NDe6Rh0Lt
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/20/21 8:19 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:19 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> This change exposes ACPI ERST support for x86 guests.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> looks good to me, maybe move find_erst_dev() impl. here as well
> if it's the patch it's first used.

I've followed your previous suggestion of mimicking find_vmgenid_dev(), which
declares it in its header file. I've done the same, find_erst_dev() is
declared in its header file and used in these files.


> 
>> ---
>>   hw/i386/acpi-build.c   | 9 +++++++++
>>   hw/i386/acpi-microvm.c | 9 +++++++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index de98750..d2026cc 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -43,6 +43,7 @@
>>   #include "sysemu/tpm.h"
>>   #include "hw/acpi/tpm.h"
>>   #include "hw/acpi/vmgenid.h"
>> +#include "hw/acpi/erst.h"
>>   #include "hw/boards.h"
>>   #include "sysemu/tpm_backend.h"
>>   #include "hw/rtc/mc146818rtc_regs.h"
>> @@ -2327,6 +2328,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>       GArray *tables_blob = tables->table_data;
>>       AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
>>       Object *vmgenid_dev;
>> +    Object *erst_dev;
>>       char *oem_id;
>>       char *oem_table_id;
>>   
>> @@ -2388,6 +2390,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>>                       x86ms->oem_table_id);
>>   
>> +    erst_dev = find_erst_dev();
>> +    if (erst_dev) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_erst(tables_blob, tables->linker, erst_dev,
>> +                   x86ms->oem_id, x86ms->oem_table_id);
>> +    }
>> +
>>       vmgenid_dev = find_vmgenid_dev();
>>       if (vmgenid_dev) {
>>           acpi_add_table(table_offsets, tables_blob);
>> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
>> index ccd3303..0099b13 100644
>> --- a/hw/i386/acpi-microvm.c
>> +++ b/hw/i386/acpi-microvm.c
>> @@ -30,6 +30,7 @@
>>   #include "hw/acpi/bios-linker-loader.h"
>>   #include "hw/acpi/generic_event_device.h"
>>   #include "hw/acpi/utils.h"
>> +#include "hw/acpi/erst.h"
>>   #include "hw/boards.h"
>>   #include "hw/i386/fw_cfg.h"
>>   #include "hw/i386/microvm.h"
>> @@ -160,6 +161,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>       X86MachineState *x86ms = X86_MACHINE(mms);
>>       GArray *table_offsets;
>>       GArray *tables_blob = tables->table_data;
>> +    Object *erst_dev;
>>       unsigned dsdt, xsdt;
>>       AcpiFadtData pmfadt = {
>>           /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
>> @@ -209,6 +211,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>>                       ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>>                       x86ms->oem_table_id);
>>   
>> +    erst_dev = find_erst_dev();
>> +    if (erst_dev) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_erst(tables_blob, tables->linker, erst_dev,
>> +                   x86ms->oem_id, x86ms->oem_table_id);
>> +    }
>> +
>>       xsdt = tables_blob->len;
>>       build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
>>                  x86ms->oem_table_id);
> 

