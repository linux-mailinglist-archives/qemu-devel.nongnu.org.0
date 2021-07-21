Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5BE3D1399
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:14:25 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ErY-0006Qq-5m
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6EqP-0005fe-Ji
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:13:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6EqB-00021Y-1d
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:13:13 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LGCkcE018361; Wed, 21 Jul 2021 16:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ZVSFYeNbkW19JqfWuThmY12YtSUZpc7V9ovAofFtpiw=;
 b=XIEIzZ67VO09qObf2Fq2LuxJn5FA63/s6HFYeomWqbBiZaQNxNeresMaalAhsoBdGW31
 UtUJo849q4dQrUO3bIzFMStQ0AD4hzE8MQ+WNDrHOhCdBZTLDC5LhNJKtH6zeQyuMjER
 KAoTEZqYe1u4/sFPj+Pg1DZh3jiDY6X44zGFT8Sqz5xjsey48D+fLr0PUjjdfnxPKlYK
 dyqSoLmR/ydgW2yIMQ00y8196mjrhQOkA7Djk90mCvY7YVVeb6fxmhGDSY0MsPAb3+Z+
 STgjLkPEVQ1G7EHPybjh4Z6bJcvkNWz4cYArHFVDSHJOs9QxXcbaGPstclgx0Ijoqeu7 /w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ZVSFYeNbkW19JqfWuThmY12YtSUZpc7V9ovAofFtpiw=;
 b=tLmtMlCnek3IJvl7q+aIBROQGvmjeiyEnVD+dEHHdw+itQDsiwf6x1OmlptkXjPemMCl
 5o8g38TtrWDsk/xiPVilN1z2y8FnDdJV3tNYoKNFxrVUWcOMhElY343+m6z3DoOyEw36
 Nvc1guDOMlUB9PcNGth2jVIlQIp6x7TQDwgq/nSXjd47nkq8zqoo8zF9CdL3uHTc+ZxZ
 NafnzFgDerBxzYBracI4xPuxUsWHtETOLtTrycmWTwUJQ+nnoC1vlSyVlpS8IqPr3m3z
 7aqaNNsvhwPUYJikTE+xYrLsCya35cNjIIc6T6H6+ocf87541Jh5TsvoNFOgIXG9eBQl fQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wvr8b9a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:12:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LG6SOL136154;
 Wed, 21 Jul 2021 16:12:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by userp3020.oracle.com with ESMTP id 39v8yxpkt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf6mdX5cjo5OZ7UMwNmjsdHKeMs1aIT8vnYmXUt+yBCFK8IN8vApkDv/BOGOKrabTGT1DoK7v/2uN6Irf+NVZUlwkGY1oW/68KmchqsHM2keClnvPSIFWUSfpBMdHToEfVd6Y3hIdmks68Upm72kNe8LicPj8mrn7P7KYKhpk6e62XT31SPJH1swxTMYj/x9kKm3OVyn1fXdEZGAEbtu1YpHaHgHeSatXkwBL9JbNPkO3VB0nVJC/viFF9miJD+aFiia+VId3MzLilyS1IMYk0zwMMeSHiJaS13OC+ZCgaiVTBC+cNZ9q6M31a/OkeT/BAIJ9L6ni+mV6GYtRkQEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVSFYeNbkW19JqfWuThmY12YtSUZpc7V9ovAofFtpiw=;
 b=fd3L8Jj/moT/kB8ocZmVRXvPNzwN+mX1qFG2+RaWiYtWTinMBJKoyuIYiByjMD828a1A68pULCYA4PY7ofm3tjXo12dEvUQf91TfNRXkF61PdGuNALzXsX+bXSysSIKGmekF9qJoz+8NRzvdy9mz/BRdPZVLXboQA5/AseF9XwBfEq/Uv3sdF1ILUbl2wQFJzdO6L1R3+1gOkHXVF4FPgYbvkLSa29od1iH4JroJxmV90YzHIVwwKv0MSjpfDHSEuOZWjtTCPfaUarp4ZQft6kpjFfTKnQVYqzTJY2NC/3QOr2wHYJEKHltsZAgtchcZ4uNHPXOEYsKL29X3dQbWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVSFYeNbkW19JqfWuThmY12YtSUZpc7V9ovAofFtpiw=;
 b=dj+8hY6G4OFvYInRnkztpewVf5u+oo6jsvGohok37na3XYVLElsbou5jY+MZuCKCrUK9GOyOATYQt1RwU0D69I8FJqpuKgu9FsBLz5lpiXhDhmG0zW7t3F6F66ajEKFCVVDXOiYVfdnx8pTNXj/ZLwIa0DxOP9UgsRkJaHBcr6E=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BY5PR10MB4017.namprd10.prod.outlook.com (2603:10b6:a03:1ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 16:12:51 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 16:12:51 +0000
Subject: Re: [PATCH v5 06/10] ACPI ERST: build the ACPI ERST table
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-7-git-send-email-eric.devolder@oracle.com>
 <20210720151640.2d682f57@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <b6e963a3-a5d0-5029-6059-b89d7e16482b@oracle.com>
Date: Wed, 21 Jul 2021 11:12:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720151640.2d682f57@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SC1PR80CA0061.lamprd80.prod.outlook.com
 (2603:10d6:4:67::12) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SC1PR80CA0061.lamprd80.prod.outlook.com
 (2603:10d6:4:67::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Wed, 21 Jul 2021 16:12:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8fd0b3-79d6-4f19-68d5-08d94c6263bd
X-MS-TrafficTypeDiagnostic: BY5PR10MB4017:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB401770BFB28E5DFF26BECB6B97E39@BY5PR10MB4017.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5KeIJnP2F91Qr85NRQrsuMgpzRRKtGj8V8504hH95J1SwgLulOUYUReNmyRUbb8K2Bib//EHzX/MJL77KX4YXCTwp/BPR1KFh9GNE460ggQ6gsV56qENwzK1rkASSWsBSavGSsFaGn2yKbSC+mMG0FCDMmMlUee3BLAebFkuFu04b2JYdYawyh8v7V9YmkmieJPzQqLWIYbmKguMbgXz0nKbLDul5oqSpjGBEKW1RCR6+rrfeoT8/8xIMoZx0e6dReJT7gHdhXKNhJsivEVTzs2X5DYO/O0EWOmZx1LQN9Ej21Sga2nKfYL1cb3bnYvmLU5tZimryAlOhLtR+cP8Rw7bJMqCvCmSfHH+EQkdOIAUOU7j130oV5F6gpz2V8GRtP7lqwKWSekvUnoO5WpsUCtQFkGa5N1LGBstCW4DmM/PndDxzPJzfWS3nhLwv3K7LYbaDq4FyRPR/qEmMsd1v8ly44lvs8O8l+F+TQ8nZeC8FSQ66se/HdrP1MtxwHLaae20DIzyEAJprFw/lMf93hW6N1mAzOfmNH+Dx3e46ytwkiMk63bhN0C5YTZOJpQiu8pSpAncgheLLLzevvIGg2wFaVYY3pLchR1W8unnfoZeF/fnnP5R/QU4ZhKt524TFvkkCO6yNQVW4peHwA1pYNJOcFnwj6uOXUEa7Dxp7yGklJPYjtESdNuP/ukGb3TTYPqASXwkuKCf0C83P1tDCYF2KvwMqUkvGk+q+qJScE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(366004)(136003)(396003)(186003)(4326008)(66476007)(66556008)(5660300002)(6666004)(2906002)(66946007)(31696002)(53546011)(30864003)(38100700002)(6486002)(83380400001)(316002)(36756003)(6916009)(8676002)(107886003)(86362001)(8936002)(2616005)(31686004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak8vSCt1TnJhTmc4aGl4NWlua3NhK2RxekR3TUxwWG1OUFdJT1laQkhTV1lw?=
 =?utf-8?B?dDRVNDM1VEJmUGZQVzNkdnVZOENIdHF6MUI1REQzUHlVYW9JcjNzeFZGcW9z?=
 =?utf-8?B?U1YwaUNCYnJvZkZXa1hWcWhEMzkzYnkvTEpKMWJia1ltam1kcXl6b3QyNUxi?=
 =?utf-8?B?KzhWUk9ZaWNWNkt4ZTdOVGgzR05TR2JmSjFhMWhEMlIvdTBmMzl5ZVpJWG53?=
 =?utf-8?B?S05ueEhTRFBCYTQ3b1o0NnVldWsrL0hFdWhpUUV5SWJJQmh2cm1mRW9GZEFW?=
 =?utf-8?B?MlFPZmJTbkZCb1ppalphRnFZMWkzQno0b0loNW94RUMzdWNTWm5QL1pOcmlZ?=
 =?utf-8?B?YjdjVlRST1UwdmZZd1FOVXpIVE5uUllWNUhIRGEyNTZ5elZidkVxN2tzVE9x?=
 =?utf-8?B?NGVhSHlzVVdoTmhTazdrdFhaaENWMjhMMC9yZXl0dUlhR0ZLck9BaHZmNnN2?=
 =?utf-8?B?VzRBeW9ybjZLb2ZwVWRBcHZHaExpT1l5clBlcXgwL2E4eFhxV2FmcXc1VHVv?=
 =?utf-8?B?QmJRTzZhdUhnRWpwQ2cyV0UyMFBqUkxTYU9VMjJMREF6YkZnZ0JXUm52bHlv?=
 =?utf-8?B?Z1RRRjJncmdwcytOUy9YMzVuMFZheXZ0OFZqN0VlbjI4akJXUGdMVWJLWDJt?=
 =?utf-8?B?SzVKT1VTN0swTFNJd1M4SHpJNjUxaVlOblVXdUU1VmZhS1pkTUFLQU9GRTdO?=
 =?utf-8?B?YXVpVkw3TVRSTmczOEpJNVdQcThyS2VWOFBlNU4vdnlON2taR01wdTFvMWl0?=
 =?utf-8?B?S2FPK3BPak1kQm04T1l2c3RMYzlrSjMvNUVMRUJXMG42bHFvanUwTEFBMlFP?=
 =?utf-8?B?RHlUQm9iU2k2ckFIdkJGMW9mY1F2OHZCWlIwOE1oQmFzNWNZWXVyNFA3OGt4?=
 =?utf-8?B?UVBEWm5tMFhiN1VYV3FUVlB6M3lHRHUwb1d3YjhvZVlja3J0dDFLMW5JU0JE?=
 =?utf-8?B?Q0I2b3ljOE5LRnhyNkFwOEs5dEFkRnMyOFEwVUpiTkhXeGhacmI3bi9SR0Yv?=
 =?utf-8?B?MEJ1ZjBmNk1yWnlMSFcxK3kzdjVaVDVHTFhWQUhvTE9Ld1FVTDFWM2o3NDZF?=
 =?utf-8?B?TzJUQUJrUnVESys1Q2hwa1dpMVBsOHF2Y1dCNnJ3VVppU3hZMjdYNzBtSVNT?=
 =?utf-8?B?T1RxQ3d1Ulp5WHhGNVhrUmxmT3pnUDh6L0ZDTmxtTS8xdS9wd2JQWWFPUmZQ?=
 =?utf-8?B?STdzbWdGajlYQzk1QVlBZnVuOUJYSEUyVkszSlNYcGVhNUN4TWRGY1JVV0Z5?=
 =?utf-8?B?OWhuaUZiN0FGZlk3K2RZY3BTZHhlV3E4L1djRVZDZmkxU3g4WURFZUxKZldS?=
 =?utf-8?B?V25ISnhYQWhtL1g0eisvTDNuMktwWnAwcmFpZ0Nmdkg3UzltR20xZ0piR3Jv?=
 =?utf-8?B?T3NsaXJmU2lnelo5UlpnNHRvRWdHajRRMXBTeDBVcDBRSExaWHRIalpzUU0r?=
 =?utf-8?B?dVcwbjY4NWNXRHBZV1VObm15NjJxd2NuUWxFemhOZitzVnlSdVA0ekJzUnl2?=
 =?utf-8?B?WWt4bmNCelllNXNON0xLZmdRbzRkZUJ1YXM5WXFmMHdUeVVFNUdST3hDN2N6?=
 =?utf-8?B?Y3habzJlTmxpVHExS0FIOE11RHVnYVpkQ002cWJleTJsZlhUK2NoQm84eUNF?=
 =?utf-8?B?eVkvZnRIczVPK1dMK1J6a0Z1Y2JTNVJMS2xWdlZmdVZXTVJGZ0Mrbzh5MHFP?=
 =?utf-8?B?NWlRcWRKMHZqWElwWnVSRWlFaEhxaElsVCt4RXhOcjBFNlh5RTJxbEpUd0xC?=
 =?utf-8?B?Mnc1MXFEZlcrS0l1VVlZRzdyNGt0Y1BjNi9meGZRN3VYUUFxM0x2ZVMwaVF6?=
 =?utf-8?B?ZFFBc0U3TVdMcGVkcmkyUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8fd0b3-79d6-4f19-68d5-08d94c6263bd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 16:12:51.6436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udr7JVOGm9WbXaLH9jIErppZZZ5gvJJXrGRQ9Br7VDOMzeqCUqTRjmpNOq3y/eFPZwHvxfV85zj7l2L60QnJ5EVTBT5lATMcLETasdsebEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4017
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210094
X-Proofpoint-GUID: XcPpKk06DpXXpBB52U6RIpJdPae-_2Un
X-Proofpoint-ORIG-GUID: XcPpKk06DpXXpBB52U6RIpJdPae-_2Un
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



On 7/20/21 8:16 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:17 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> This code is called from the machine code (if ACPI supported)
>> to generate the ACPI ERST table.
> should be along lines:
> This builds ACPI ERST table /spec ref/ to inform OSMP
> how to communicate with ... device.

Like this?
This builds the ACPI ERST table to inform OSMP how to communicate
with the acpi-erst device.



> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c | 214 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 214 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index 6e9bd2e..1f1dbbc 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -555,6 +555,220 @@ static const MemoryRegionOps erst_mem_ops = {
>>   /*******************************************************************/
>>   /*******************************************************************/
>>   
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction_entry(GArray *table_data,
>> +    uint8_t serialization_action,
>> +    uint8_t instruction,
>> +    uint8_t flags,
>> +    uint8_t register_bit_width,
>> +    uint64_t register_address,
>> +    uint64_t value,
>> +    uint64_t mask)
> like I mentioned in previous patch, It could be simplified
> a lot if it's possible to use fixed 64-bit access with every
> action and the same width mask.
See previous response.

> 
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +
>> +    /* Serialization Action */
>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>> +    /* Instruction */
>> +    build_append_int_noprefix(table_data, instruction         , 1);
>> +    /* Flags */
>> +    build_append_int_noprefix(table_data, flags               , 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0                   , 1);
>> +    /* Register Region */
>> +    gas.space_id = AML_SYSTEM_MEMORY;
>> +    gas.bit_width = register_bit_width;
>> +    gas.bit_offset = 0;
>> +    switch (register_bit_width) {
>> +    case 8:
>> +        gas.access_width = 1;
>> +        break;
>> +    case 16:
>> +        gas.access_width = 2;
>> +        break;
>> +    case 32:
>> +        gas.access_width = 3;
>> +        break;
>> +    case 64:
>> +        gas.access_width = 4;
>> +        break;
>> +    default:
>> +        gas.access_width = 0;
>> +        break;
>> +    }
>> +    gas.address = register_address;
>> +    build_append_gas_from_struct(table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(table_data, value  , 8);
>> +    /* Mask */
>> +    build_append_int_noprefix(table_data, mask   , 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(erst_dev);
> 
> globals are not welcomed in new code,
> pass erst_dev as argument here (ex: find_vmgenid_dev)
> 
>> +    unsigned action;
>> +    unsigned erst_start = table_data->len;
>> +
> 
>> +    s->bar0 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    trace_acpi_erst_pci_bar_0(s->bar0);
>> +    s->bar1 = (hwaddr)pci_get_bar_addr(PCI_DEVICE(erst_dev), 1);
> 
> just store pci_get_bar_addr(PCI_DEVICE(erst_dev), 0) in local variable,
> Bar 1 is not used in this function so you don't need it here.
Corrected

> 
> 
>> +    trace_acpi_erst_pci_bar_1(s->bar1);
>> +
>> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +    /* serialization_header_length */
> comments documenting table entries should be verbatim copy from spec,
> see build_amd_iommu() as example of preferred style.
Corrected

> 
>> +    build_append_int_noprefix(table_data, 48, 4);
>> +    /* reserved */
>> +    build_append_int_noprefix(table_data,  0, 4);
>> +    /*
>> +     * instruction_entry_count - changes to the number of serialization
>> +     * instructions in the ACTIONs below must be reflected in this
>> +     * pre-computed value.
>> +     */
>> +    build_append_int_noprefix(table_data, 29, 4);
> a bit fragile as it can easily diverge from actual number later on.
> maybe instead of building instruction entries in place, build it
> in separate array and when done, use actual count to fill instruction_entry_count.
> pseudo code could look like:
> 
>       /* prepare instructions in advance because ... */
>       GArray table_instruction_data;
>       build_serialization_instruction_entry(table_instruction_data,...);;
>       ...
>       build_serialization_instruction_entry(table_instruction_data,...);
>       /* instructions count */
>       build_append_int_noprefix(table_data, table_instruction_data.len/entry_size, 4);
>       /* copy prepared in advance instructions */
>       g_array_append_vals(table_data, table_instruction_data.data, table_instruction_data.len);
Corrected

>     
> 
>> +
>> +#define MASK8  0x00000000000000FFUL
>> +#define MASK16 0x000000000000FFFFUL
>> +#define MASK32 0x00000000FFFFFFFFUL
>> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
>> +
>> +    for (action = 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
> I'd unroll this loop and just directly code entries in required order.
> also drop reserved and nop actions/instructions or explain why they are necessary.
Unrolled. Dropped the NOP.

> 
>> +        switch (action) {
>> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> given these names will/should never be exposed outside of hw/acpi/erst.c
> I'd drop ACPI_ERST_ACTION_/ACPI_ERST_INST_ prefixes (i.e. use names as defined in spec)
> if it doesn't cause build issues.
These are in include/hw/acpi/erst.h which is included by hw/i386/acpi-build.c,
which includes many other hardware files.
Removing the prefix leaves a rather generic name.
I'd prefer to leave them as it uniquely differentiates.


> 
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_END_OPERATION:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 32,
>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK32);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER_VALUE , 0, 32,
>> +                s->bar0 + ERST_CSR_VALUE, 0x01, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>> +            break;
>> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER      , 0, 64,
>> +                s->bar0 + ERST_CSR_VALUE , 0, MASK64);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>> +            break;
>> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_RESERVED:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            break;
>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>> +            break;
>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>> +            break;
>> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 32,
>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK32);
>> +            break;
>> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_WRITE_REGISTER_VALUE, 0, 32,
>> +                s->bar0 + ERST_CSR_ACTION, action, MASK8);
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_READ_REGISTER       , 0, 64,
>> +                s->bar0 + ERST_CSR_VALUE, 0, MASK64);
>> +        default:
>> +            build_serialization_instruction_entry(table_data, action,
>> +                ACPI_ERST_INST_NOOP, 0, 0, 0, action, 0);
>> +            break;
>> +        }
>> +    }
>> +    build_header(linker, table_data,
>> +                 (void *)(table_data->data + erst_start),
>> +                 "ERST", table_data->len - erst_start,
>> +                 1, oem_id, oem_table_id);
>> +}
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>>   static const VMStateDescription erst_vmstate  = {
>>       .name = "acpi-erst",
>>       .version_id = 1,
> 

