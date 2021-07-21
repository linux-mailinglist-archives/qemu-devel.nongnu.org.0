Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01E3D1531
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:37:51 +0200 (CEST)
Received: from localhost ([::1]:59720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6GAI-0000rq-6v
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6G93-0008Vf-70
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:36:33 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6G91-00011U-EG
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:36:32 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LHGuWZ026777; Wed, 21 Jul 2021 17:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=WXNPoZEcDVvMV5aTpu9F3SoCmdCdO5z2sS+6TEaTXfk=;
 b=Yr73CXgBD7rm+a3OrK6RMDGKjdY7gpN+10Rt5kExVUp7S6TP2rsu9IpA4bqNo1MXwbjv
 UGuJmra9UcBqjGbENnaIdcA8xt5BeuJXwxvhWTSL4mK5ruHmJyBg1kTibP4N0WYFjpoW
 EOH5gHLrp2h4khQJNJysMw6F4Ws9e+ZlRgsX/S642VqHgMo92AbgAkm/0OGTkK/Gvtjv
 9CC38GyoI/Md0h88phdJOyHLj/+urmp5lyrt4EymErxPqngL1Skwq1UwExBkHKttbyK6
 5J8OXwuR3rQqg6Sjgx6okSO3CYlZ/4k/9gIAXc/AmwllqeHfFx6ezF1mxeamEFrgSHER wQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=WXNPoZEcDVvMV5aTpu9F3SoCmdCdO5z2sS+6TEaTXfk=;
 b=0Nrjy6DYQYhQQNX+OyO8FHfxJkzxUKF8K1l/cEJzM8S6XPCqpQTOQsHZz0YLKZJ2CwZV
 or4k9fFheG0QxsSmPogPtnJ0XrR+vz6Eb12ByTOHNJsPs8wToV+NmeVscfVlGTY+vUtn
 CSbhETJ0lYHq6MPAJx7A170edVUBjGDE3XMfZYSbXNy8fKYVmbJE99cgKNDISfMHOuBd
 wM30JeovFP+pAzGL6OHVQfHEC2Z5p4Tmoa7ofkV2nlq8oQOhvEFeDchX1HXoDAMfX/VE
 TdpWpjfmGn45cigqGz5jxWqxZ2YT0RuxMBCA3+svXMvJR9vmvzoOkNC0lOq4mNhrPnGw ng== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wyq0u5br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 17:36:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LHZ82u157403;
 Wed, 21 Jul 2021 17:36:27 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3020.oracle.com with ESMTP id 39uq19mg6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 17:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2b+yU9DSy6Q4W/Vn56jGJN/1RX6gEky9X3JcKAna80R2w0lnTReaP4NZRTwt02iU3a+MvSElfdq5l7Udkq3IU+i9wFcXoEgrfXphpXTdUJ1JI90Lz3QU/VybKmhsDSv2+8TB2kxF1Gw+CPMde3GzkPcwvJ1JGOlq3B8vAxgdklUDuBRrCp3a+2Vwn+GntA45AnR0IwS/+FkQN92j0SebGu3lj7e6BjwBXw+I6j5e+awGivWXQbO/BxuTNQN5/bw2B5PUTegX35sQ8627GUQ65HiJr6YoO0rozWsjpgRRvOPbSs5EfwJUDjiURxKB511MbwtpTf6M2RfsFXYHEkUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXNPoZEcDVvMV5aTpu9F3SoCmdCdO5z2sS+6TEaTXfk=;
 b=GVLBPuPGfVZmjAoJwrLnQZmUv0Qmg0dfAR00PH9ivHTEnfT/qqwwIGXXiRU9S1NSBXBILNuWGmGlvkoEfiHEWH0Pkcykalrf15UU/IynPU5LdUhxDQ64UDy9j4Jj105E+23V+xc0sXjOLJmSdF9zyDGo/8byKVCHOcLIvBorPO5KluPQV5LOiA3do67AusQN9Io/hylKOLdWsmrpzDLNB46wrdb+FTK5Itf4hMfO2s2mDinS9d+9ZSQntxnZHIHyrvmMctQlYHcgvQYvWEFendy6NKSor1g0TY6fVHWSlu/f5NuE/t+SU4NqCzGgM2VegwGGRnKEYsPNSYuh+Vmb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXNPoZEcDVvMV5aTpu9F3SoCmdCdO5z2sS+6TEaTXfk=;
 b=eQeDaJKmI9XwKJVOgnhA3Cfgkpcz93xgg65G0NS2ZQaJho+1zK+mU+a9/JtpgFpdGPSrrJ+OJA6KKkpEFDalC1bTDXJiF88434sFGzyL7Fm3SwRFhC32pTz6ayMNaVNS4/t4P/cMMmpSZagYN4ExnBBoddbGIeDxj4f460mSCXQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BYAPR10MB3285.namprd10.prod.outlook.com (2603:10b6:a03:159::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 17:36:23 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 17:36:23 +0000
Subject: Re: [PATCH v5 05/10] ACPI ERST: support for ACPI ERST feature
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-6-git-send-email-eric.devolder@oracle.com>
 <20210720141704.381734cc@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <9c400686-e304-a8ec-6ba2-4edc62db16e4@oracle.com>
Date: Wed, 21 Jul 2021 12:36:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720141704.381734cc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:806:28::25) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA9PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:806:28::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Wed, 21 Jul 2021 17:36:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cfce58b-4284-4c8e-6049-08d94c6e0ed6
X-MS-TrafficTypeDiagnostic: BYAPR10MB3285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB32858328AA66AA165611918197E39@BYAPR10MB3285.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K03mhi6L3ykbnIxokMs8nmLg4Xh0YrAzjT3LaF5EFJlsz2YYQjel3rKOfAIgb1AW8t6A4kNxoiHsrrLwl0I7ohKtY/FHqjTYytsj+7BA2NKKgO9aJVuSJCpJUhurq1d5EvgVltTzTIxSJdBqsVkGk8DAC5V3RQjXQ5l8wZJRMYFMd/EEPVXR/l0dAOccyNJb3goQMVeI5iK5Az3qRO3+wv95b9dQzR9uVlcjABYeyMjoiy+DI25HUjbClze6sEnm+WJPt7eo2HjgLkV2Dq49lNn6CLXhY0u83IMtdJDXtJNuexV6KXXwBCNWu+sow8PvxwLK2rt0QjKFAiHfp6d5lc8JrY2XxtnJezvnxg4OaE/n55RDV7D+5hr15FBKn82LEZ50sHCyzIb3pUgPzjq1bE51h9sEKmwm2ltJ0MPjGTHfiabAxQ6fB9A8WUNYmCR9GpcnNY0n/TNGMBqUuNLo0yLYocM3OzTuwYCOTVYic1JqOF/19kp4qAnXuZep46QpRNNb+Uh2ddUgxpkwDGcGBkvaNC1fEps/8M49JYv3jURkdFrdeRAI59q2H4ypYfWFlts5wbQPjnD1EbilFLjl1WLtKTkl+dacsuvNLVUI248UsDoX3H7baUoHlHbslD8LE4bKF5z9N3JiYNL8m92RsHRGHAorjwSbJSLOdZ0GDmbG2ldS/ZK4L+Dcv0ztntHx5mPhQYR/6503HQys7ejIIsq6WzWcD59MhtSt/8r3Xo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(376002)(346002)(366004)(316002)(8676002)(8936002)(186003)(38100700002)(478600001)(6486002)(2906002)(4326008)(107886003)(5660300002)(86362001)(31696002)(31686004)(53546011)(2616005)(6916009)(66476007)(66556008)(36756003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnJCQkJBMXYyR2IzUUVWY3FOVWUrWlBTeUNjUUl0SEo3eGhYbTVmejVGMlVn?=
 =?utf-8?B?U0h5MEUvYWFNWmdLdTlGTGNRUWtoWjZkZkVBa0VQSFdvVFlvOSs2Q0xiaDFZ?=
 =?utf-8?B?MmVzUEtVb3N6TVcxNEo1MVlNdE5lWVV5WThPQWd1dnVRQXhxdGpiWFhZWTcx?=
 =?utf-8?B?bW1pNGluamVMclg5Q0dpbFc5T0tucWVpd0dxNGVvUkVCbnQ0TU92elVwZU54?=
 =?utf-8?B?Sjk4MnZTUk01R3RHVFpqS2lKYm9RUDgzOFlTbTFWYTkrNFFxSnYxWjlVZXZS?=
 =?utf-8?B?ZTd0aDhnNSt6dUUvYWNtQXRuSmZBTFQxMEUxMlVrL0NlNDRxNGk3cEhnL2cv?=
 =?utf-8?B?UGxQS0picG5DTER0SDEvaXpRNjQ0L0poMzg3d1RXa2lSK1hXSjZDNzBEdUFG?=
 =?utf-8?B?enZUVHFYL1NPUDFqdjVrQ2Fzd2dkR3BsaGMvN3hzTllMQ29Qc3FtdndwN2VC?=
 =?utf-8?B?NEY4NWdPaXF1KzF3a0NpZ0QzQVYxSklFcUFueGE1QXA4NHplNTQ5S3VieGVU?=
 =?utf-8?B?eElBQ0o1NHNWNUhDWC9zNSsxblplU3NTU3YxQ2loWlJsSmJ0ZkhqemdNOXBQ?=
 =?utf-8?B?bk1neWdhQ3VxMHFXc2ZIbUZEUE83c0RWZDJhM2gxQVdCbi9pcFNMRWIvSWcv?=
 =?utf-8?B?L3ovZEFzQ0hCdjl3eVNvV256R1VKSnI2TjJBaExQNlVlOUFPSjhXMWdrSTZj?=
 =?utf-8?B?cEFkNlJQVFJ3UVdUWFA0T0JBS0hhdWJrNTNpbklWN21TdkE0eWoyTE5PUGl2?=
 =?utf-8?B?NmRFM0N1a0dYNi9rY1Z3a041clpQZkhGakdONTVHZVIzNjdsSG9BR21xbEdq?=
 =?utf-8?B?SHI0SURQREl5b0FjTzd5cGxIVlBjWVR3bkE0dXpaK0pXMUNYN3l5aGZjOVR0?=
 =?utf-8?B?bkY3UklNQk94aTJ1Q1I2TG5kSUljcUFqSVhpQ0JZVkZ3VGNxR2FFYlJYYUlL?=
 =?utf-8?B?UmRJSVNmREtDYTF3WEhwMFVKVFZvRTlwb1RZWW5FbGkvanVHNFIwc2tudHlM?=
 =?utf-8?B?djZ5aXgzSjJTaTRSMmI5YVhDWERTcC9raDNsbjRFb1dSUHlHSUpqVWpvY1h4?=
 =?utf-8?B?TGJjUWNCNUZ0alhkV0luL3NhbmFReTlCbzZaendCVVJoWVA3RlZLVUF2Y0JD?=
 =?utf-8?B?eGZvQU5pcXJLSDkwWnpSRUp3S1NRR21UK0dESHVFRHI3a2Z6Vmd3Nm9IOGdD?=
 =?utf-8?B?d202VEZnUTNNZTdhYUxSZGx6d3NJeXpra0VCcS82UG1hclVnTEZBbVd5QUh5?=
 =?utf-8?B?ZENQd1kvSjZrd1ljRWNqeG5aOGh5NnhjSmhLejlpd29vY2RPOXhpby9WYWQz?=
 =?utf-8?B?WUlhNVJiVlJpRGplMDJMVms2Um9kalpzQ0JqNnhSc1BvR1phamNIUkRGaXU4?=
 =?utf-8?B?cnc2S1JZMUlQUG8zRHNZa1JWQktwSWpiMDU3b1dPc1VmVjJPM0JnR3pEZkhJ?=
 =?utf-8?B?ZjZxWUY1TUQ0WEJCdStNRlIwakJBUHZ2MGZ4bkYrT1g4SlRzL3RMVXNNMWk5?=
 =?utf-8?B?a0NOTWJCVU1RMFA1VktGVlIyVnpyK3FVSTVhSTg5MDZSZlYzcnpRVm9NSUlo?=
 =?utf-8?B?OEl3SXVuM3UvZ1BvMzkyZjRYUWkzTEhYSVhOTWl1Z1lxVVFDUTFqRlcyWk5j?=
 =?utf-8?B?eFV5eUpvQmQ5ZmZVdTdhNjhlQVladEpjYzJaRXFXcXgzeUw1cjVvWWlheDdu?=
 =?utf-8?B?VWxId0luem5LVXFldGlURVByNDVUYnhKbEdZMzM3SXRYbmpLSmM4Z2dpSEFi?=
 =?utf-8?B?bzhBUDhHM3YrYTV2OUM4VlBpUUIrRmV1V3I3bVNZWTE4K0k2Q205dzMwZG1l?=
 =?utf-8?Q?ZGDbWpxXhc/cqUcSeLunGMdBuJXtEFv9wgkRg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfce58b-4284-4c8e-6049-08d94c6e0ed6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 17:36:23.0511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sohloHhP0DsRcvLqv9Zk37RP4OsHZ5pBrqmSu4HmqfGXsoVNWAOXMtFFjGxTdGzg7f5rvWyMkDbHPqo7kUGoZGWdGtZOH2X0U9Lf6ZTNeQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3285
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210103
X-Proofpoint-GUID: K3b_2ZzXMk5iIF6gfLCW2ycCFgFb3ee1
X-Proofpoint-ORIG-GUID: K3b_2ZzXMk5iIF6gfLCW2ycCFgFb3ee1
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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



On 7/20/21 7:17 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:16 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
>> +
>> +static const TypeInfo erst_type_info = {
>> +    .name          = TYPE_ACPI_ERST,
>> +    .parent        = TYPE_PCI_DEVICE,
>> +    .class_init    = erst_class_init,
>> +    .instance_size = sizeof(ERSTDeviceState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> what is this for here?

Without this, at run-time, I obtain:
qemu-system-x86_64: ../hw/pci/pci.c:2673: pci_device_class_base_init: Asse
rtion `conventional || pcie' failed.

> 
>> +        { }
>> +    }
>> +};
>> +
>> +static void erst_register_types(void)
>> +{
>> +    type_register_static(&erst_type_info);
>> +}
>> +
>> +type_init(erst_register_types)
>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>> index dd69577..262a8ee 100644
>> --- a/hw/acpi/meson.build
>> +++ b/hw/acpi/meson.build
>> @@ -4,6 +4,7 @@ acpi_ss.add(files(
>>     'aml-build.c',
>>     'bios-linker-loader.c',
>>     'utils.c',
>> +  'erst.c',
>>   ))
>>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
> 

