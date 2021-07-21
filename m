Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3A3D1409
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:22:32 +0200 (CEST)
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6EzO-0006Zo-Qf
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Ew0-0003kQ-D9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:19:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1m6Evx-0006KE-W3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:19:00 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LGD09f016622; Wed, 21 Jul 2021 16:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=HAek3JLll9AVCgPZEZsBjdIshKIoawjZe0q8ONhIcOc=;
 b=pmkJpf84qbodCugEHzhz09QGQYjLGS1GE++rFHKpCPwCICM1ah4arn2UUDvsfeTWO8li
 dLgJxTGjw5eb+RV/aBYD32BVr6y6tAiy7pSZBCT8BC9U5FFYg0t5PMI5uQwcAYp7i9Ym
 RsEFW+HER8roKDWWjt8OlwWEhIm9BmNWpHJs4hIRzGLDwLfbCeV6ojFKJcY/7Hmipd9u
 +GEFU3R4uXaWwYVGgvXsKZkvCOu6D2SyX7xXsFiQp/CDrche+2xFkJOCvTsLtTGdDNM0
 N71K5MhwXG6hJAK6arpRlDScVbdyEv/YDCoHVx2ltUyfkxaQLv6JQjSM0HwJxsD6BpEF Gg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=HAek3JLll9AVCgPZEZsBjdIshKIoawjZe0q8ONhIcOc=;
 b=jo3lzdYvghHNKbC/XP2Sl7RmclbFnfJCvTy5E7OmglRq9Sy8PpTnCCB/MfWk12VdQEZi
 pbIS/b/tOfxe0AniR60OWhwrjQcZDiSwbTl032nS5/GrtOdBHzSCRKcdxQoOC8xdj7pV
 6A4GyvcFSiTngmNv+43tLXj2gp9o9nJrdIN2wmSmkqTQ1dFI2FIBszN3gbLDfgzZysTV
 1Rob9CzjxO0GLXYzGKgAN3HX+583W8DQioRsK/RKyRyB8WjzrBSdzGt8wmqB/S+zjDAm
 JV+a8kxnpaQoCTUSzdc4KqR8oDTotKfTumv84SLt+8xKUNvkfdonPzPtzfm42L5StQPL bA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wwmtu79w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:18:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16LGFCh1167450;
 Wed, 21 Jul 2021 16:18:52 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3020.oracle.com with ESMTP id 39uq19g0jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 16:18:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqdg5JRu1Telw9zK2VCvvOcriboHzIWGWdIohn1r8ebt936KPReMszwEGfkIqNhyuR/9lfVL8knjDS7lbC2ORMHkmWvJdm7V1tPbtW3vCtDNAb//GmeCdYqMwp9w9ZGhPOlbSllknvY7o+LFMegSphqDHMzZ/jw2niXpeaGfWJENxGzvNjuIesMbYa5Qt8NmlwbNyr7YyWRY08k5B3NRxkohk+mO+gf9Pi7ZCjCsQDgHwOPvbIoJP4vOF3GJquoqns3xft9rkFbFUFEliSqg33Ni3rkm6rm7eJWT6ZyDX2N0bZ9ijsCWuoBZIc4l3wdlB3Ea6Ubyl6Csy5ZNrlc3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAek3JLll9AVCgPZEZsBjdIshKIoawjZe0q8ONhIcOc=;
 b=XLzjLJbdNASJYZ/PYYfJ1KO3uoMrHSupfTQhNW8Rs9WGkgG8jQQyVXK1hyXmtJE5K7pxh+DB5N+QHPhfbU1AMi3bQo/28T3OcCM0D7cnNp4cd7Z0V6UpjGvHz0rlDEmziFx1M+uhYXj+pzmwISu9xgoQDY4UNvZd5f4AbZMaKVGMVT9uvyrxCdOFnMta5CnPUdCcBnHIvCv2FvBWGBoQU4v5wh/kHSJYqtLZZYHXKpzLoGS8IDH809Jh1BYM5H3DioqkdCt3Tq4rN5vfbQcovXqryc0P2e0iCmfPXWXaJ95SNyJu2vcAaK/9cet9A5CvO0TTLBlxGCKRkFS9EdsruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAek3JLll9AVCgPZEZsBjdIshKIoawjZe0q8ONhIcOc=;
 b=nMUHBvlFMSWytixQKJb4nWeW+bbPqZnG1XSgeMtGuYFHM9bxbiv0lQSu9t2ts36vuPVSS1BUaWqjd4S+VqY4edn2ri1z7hJMJ/NOWGgZL6jakoVtWCS5Svu/RoMXsJkoXhsn7WiUMivzhGNTrM+EzIi+5UIv80tfX5aAOiV31EM=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BY5PR10MB4002.namprd10.prod.outlook.com (2603:10b6:a03:1b0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 21 Jul
 2021 16:18:48 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::d1ad:b140:4d55:67a5%9]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 16:18:48 +0000
Subject: Re: [PATCH v5 09/10] ACPI ERST: qtest for ERST
To: Igor Mammedov <imammedo@redhat.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-10-git-send-email-eric.devolder@oracle.com>
 <20210720153830.71bd4b8e@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <f80724d7-f319-1e97-ce3a-7dc8682ac193@oracle.com>
Date: Wed, 21 Jul 2021 11:18:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720153830.71bd4b8e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 16:18:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 382d0fc3-7db2-4a5f-5908-08d94c633857
X-MS-TrafficTypeDiagnostic: BY5PR10MB4002:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB40027DFBA7C21269B662384097E39@BY5PR10MB4002.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlFhg1AqNG0ik6CQyI+ucyzcWLvpp5bXHUI0kAFMNvYUgt6PTJ4PefbqXNZFqRZJV43o4zydbU6BLEt+E7OQxyQojepdpvUUDmDHKuJB/+KvaF9sxf2CqHHmv2PzQGYz2Yl0OSMQWtR0wZxzHkx9Jm5NkBEVfKGC0J7eOzDMKB7ff54CiOurEYi05ftDrIHvvDFGzGsFmX+BNIe7ZJvnMRAoknt5OLXPRGuT0qHyeXcXa7tFT4QzeNZpNJZMl5cBrv/Bz2rif3b96DfPyIc9ORd/taA4Zi7twmzHqV0JB8/4YUKHfTK8rcMgwuiiWp1IYnrdMYCXLr7HaGd2SNGwztf0+lQrD4IIIpQg0T2kDUlX+LdzUoferyAf/0LJ8x1xlaPHwca/hu4UDxDVyGNJpaBv2keTDbs24z8VtPaBCKj1uBnn0RMTayMwZyRzTXYG8kJiUuBb5iPjRXcDKh9VEtmcBKXh4Ohj3TTX4Y8u1ldq2eoWSeCCRlAAiW5iqAEPb5zREzSURU8YwS2sd9IJTiRdS/Rew3bSGH9ZoGzA4dg4FPAsS2xRziL8FiKCOpnJvLkUBKCtphs91OoyweYu3NwqaMgPC80m73xjcJQi7ybSfKHqq6t8OxRsc0W8ItZI9BMVLnvi5HYmdPJBKmqd2o2A8/QPMZXTdB+kc7OaRKtYXwCKvvsz14RlE0vYQBRS7L2HZ4AXVkRt8MaKdjkGVc7mmLuCk6GU+wduOxcBRKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(31686004)(6916009)(316002)(8936002)(86362001)(4326008)(107886003)(36756003)(2616005)(2906002)(31696002)(83380400001)(53546011)(66946007)(5660300002)(66476007)(66556008)(6486002)(186003)(508600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEd6Yk1zR0xTajJJMk5jOUYxKzZqa3ZvQ1pid2hDN1YzaDZSbjMzMGZhLzdC?=
 =?utf-8?B?cTFKeTRyQ1ZCOEwvYWx2a3ZYcUF6ektpVmZJWGlPaW13QlU0QUE5N2hqK05o?=
 =?utf-8?B?cmkvY0tINnRaU0F5Vm8wZmE5MVU4aGx6MFJzelY3c2RsRUZMTGpuTVFIVFZ4?=
 =?utf-8?B?bnRLbG5PNldoNERGR2NxazVGZXZDUnREa2VQNzhBSTdHT2VyeGdSTW1uZldp?=
 =?utf-8?B?d3Vydjg3R1RlSXNUdElwZFFqOGIydnhnVWgwL2lXcks2aVVVNzFGREk2VVY4?=
 =?utf-8?B?VnNOWlEwWm5LR1VQTlh1c1RNdkRVUi8zWDErQVBEZUhzMlMvak9NRU9UZjRv?=
 =?utf-8?B?SXl6QVVHQUFSaDg2YTdHeGJuTENPOFJITzBYWXo2RUhpcmt1L01JeGt1NDRo?=
 =?utf-8?B?dm1HUyt4NGY4cUhIZFFPdnhhSm5aUGM3YUVneEJ5QkI2aGZ0NEw2aE5xL0ZM?=
 =?utf-8?B?NnphdmJsVUJoZEx6Z3BEeFNZU0tCTFB3TCtqYW0vMlNBSEJqUGRCWUF2Q3FJ?=
 =?utf-8?B?ZEtGOXVrLzhIcFo3VGNrV2JTUWp5SGo1YW04WmFaLzRuc0xVUWZDTWE5bTBT?=
 =?utf-8?B?MXVYZHk0MkN0akVkTldIeFpONzFvWm0veU4wOXQ0QWtEb0tMSlNkZzNycGpG?=
 =?utf-8?B?M1FvY2piaTMydWZiTWQ1SWJyRnJGZThyRzZYNlNvWVlIMDF4amhCeXJTSzdq?=
 =?utf-8?B?U3N4Zk9kL0owMXZDY2E3U2t6eU9zVUhvRUkwRXU1S3VVaGFpbW1nNU1iMXhM?=
 =?utf-8?B?amgwVFJuTno0S3RjNTk4TlNLa1J5ZUlzQ051SU85YVJXcGZ0akV1QmdFSU9o?=
 =?utf-8?B?OTZXTzFCY1ZQbHVmd0pneDFZWUlYTVArNmVpblNtVWtDSXVsTTRTSjBqL0Ra?=
 =?utf-8?B?R3FSbjI3RCtiRzNUaFY4Z2VjSWl5Rjg1K3ZkclByaEJGTDZVWU81R0N1enRJ?=
 =?utf-8?B?NS92YXRNMDNJYVl1OXZxaXAyenpwZG9jUmxBR1pUeCtjeElEN285R0xZbm9K?=
 =?utf-8?B?ZUo2ODYyMzJxdExMYXNzZXd4bS8wZ29YcTBnMWZaaUdBSW5nRUY3eDl4eHQv?=
 =?utf-8?B?UU1SYXlVRW5IVnRpRVZ2Q3kvLzZvRndqM1M3SWJrejBGUlREOCtaelBoUTNG?=
 =?utf-8?B?YlFyc3VHUlR6R05oRUFZTTRHSUQzVklzMWwxQmNlRWYvdnBabS9hOEJzTzYr?=
 =?utf-8?B?MWtjbm5FYUdaU2dTT3Z5aTd0RjN2YVZVclpYNVVMSXIwUzNVVklTd2dNWVlK?=
 =?utf-8?B?TnBUR3ZKYW1ZdTFpbTl0cWJmNnE3czI5QnVLYjhySVNuRVIzSGtRTWZkYVBD?=
 =?utf-8?B?Z0F1UmFRaTF5NjRyeE9aU09jc29LZ2xMNmU0U1pMS2hBN1BPRTdhY3czUll0?=
 =?utf-8?B?aU52cHRLTXlrSnB3c21EcU5BZ0owTVYwdmwxOVFIWXdpcWR4eFpjR0I3dENk?=
 =?utf-8?B?WEtTVzZKNWF4N2FqRGhSRUNacXVqTml1RGp5WEUyTW1rTWtKZDRLN1N2Vlo5?=
 =?utf-8?B?M1ZEZGw2d1p5MnMvUDRIWjhsNnhyT3ZscHBhNUc3WE9nQVJhU0tsdWxtUEU4?=
 =?utf-8?B?cTBvSzQ4RHFQSlV3L0JydHhzVkZBZVREcUZGaTVRNm5zbkNUNG1yTGY4d3ZP?=
 =?utf-8?B?U3lUKzlRajBXaHhsaEhNYmUxYm8zZS9XTWd2S0xBQTFUL3N0ZFNYcW91VXJO?=
 =?utf-8?B?RUpheVFSSUVpb3Z0WG54cjJnNFVDdGNhYVhHYllidURQcTQwT28va01CWHlB?=
 =?utf-8?B?M1ZKQnRlZlBiMExzVjhBYTcyVnNTOHZDaWo0andsd25sRGJKYTlYZEIvdmoy?=
 =?utf-8?B?U0FmRVJxS2JMaXdpakJIUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382d0fc3-7db2-4a5f-5908-08d94c633857
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 16:18:48.1651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPVcCK8f+jGOab0FbY0nT8H1XO4ljdphI8viGlklkmBsm1DA+Mw5hwfIQ6GVs6qvAhbX+4LKIB/ee5g6c+BP1BXqkut7gG8V8UCLXozLfis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4002
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10052
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210095
X-Proofpoint-ORIG-GUID: ucKhoQWBimMmqceXP39WVjg6gjXBQdH5
X-Proofpoint-GUID: ucKhoQWBimMmqceXP39WVjg6gjXBQdH5
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



On 7/20/21 8:38 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 15:07:20 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> This change provides a qtest that locates and then does a simple
>> interrogation of the ERST feature within the guest.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   tests/qtest/erst-test.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++
>>   tests/qtest/meson.build |   2 +
>>   2 files changed, 131 insertions(+)
>>   create mode 100644 tests/qtest/erst-test.c
>>
>> diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
>> new file mode 100644
>> index 0000000..ce014c1
>> --- /dev/null
>> +++ b/tests/qtest/erst-test.c
>> @@ -0,0 +1,129 @@
>> +/*
>> + * QTest testcase for ACPI ERST
>> + *
>> + * Copyright (c) 2021 Oracle
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/bitmap.h"
>> +#include "qemu/uuid.h"
>> +#include "hw/acpi/acpi-defs.h"
>> +#include "boot-sector.h"
>> +#include "acpi-utils.h"
>> +#include "libqos/libqtest.h"
>> +#include "qapi/qmp/qdict.h"
>> +
>> +#define RSDP_ADDR_INVALID 0x100000 /* RSDP must be below this address */
>> +
>> +static uint64_t acpi_find_erst(QTestState *qts)
>> +{
>> +    uint32_t rsdp_offset;
>> +    uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
>> +    uint32_t rsdt_len, table_length;
>> +    uint8_t *rsdt, *ent;
>> +    uint64_t base = 0;
>> +
>> +    /* Wait for guest firmware to finish and start the payload. */
>> +    boot_sector_test(qts);
>> +
>> +    /* Tables should be initialized now. */
>> +    rsdp_offset = acpi_find_rsdp_address(qts);
>> +
>> +    g_assert_cmphex(rsdp_offset, <, RSDP_ADDR_INVALID);
>> +
>> +    acpi_fetch_rsdp_table(qts, rsdp_offset, rsdp_table);
>> +    acpi_fetch_table(qts, &rsdt, &rsdt_len, &rsdp_table[16 /* RsdtAddress */],
>> +                     4, "RSDT", true);
>> +
>> +    ACPI_FOREACH_RSDT_ENTRY(rsdt, rsdt_len, ent, 4 /* Entry size */) {
>> +        uint8_t *table_aml;
>> +        acpi_fetch_table(qts, &table_aml, &table_length, ent, 4, NULL, true);
>> +        if (!memcmp(table_aml + 0 /* Header Signature */, "ERST", 4)) {
>> +            /*
>> +             * Picking up ERST base address from the Register Region
>> +             * specified as part of the first Serialization Instruction
>> +             * Action (which is a Begin Write Operation).
>> +             */
>> +            memcpy(&base, &table_aml[56], sizeof(base));
>> +            g_free(table_aml);
>> +            break;
>> +        }
>> +        g_free(table_aml);
>> +    }
>> +    g_free(rsdt);
>> +    return base;
>> +}
> I'd drop this, bios-tables-test should do ACPI table check
> as for PCI device itself you can test it with qtest accelerator
> that allows to instantiate it and access registers directly
> without overhead of running actual guest.
Yes, bios-tables-test checks the ACPI table, but not the functionality.
This test has actually caught a problem/bug during development.

> 
> As example you can look into megasas-test.c, ivshmem-test.c
> or other PCI device tests.
But I'll look at these and see about migrating to this approach.

> 
>> +static char disk[] = "tests/erst-test-disk-XXXXXX";
>> +
>> +#define ERST_CMD()                              \
>> +    "-accel kvm -accel tcg "                    \
>> +    "-object memory-backend-file," \
>> +      "id=erstnvram,mem-path=tests/acpi-erst-XXXXXX,size=0x10000,share=on " \
>> +    "-device acpi-erst,memdev=erstnvram " \
>> +    "-drive id=hd0,if=none,file=%s,format=raw " \
>> +    "-device ide-hd,drive=hd0 ", disk
>> +
>> +static void erst_get_error_log_address_range(void)
>> +{
>> +    QTestState *qts;
>> +    uint64_t log_address_range = 0;
>> +    unsigned log_address_length = 0;
>> +    unsigned log_address_attr = 0;
>> +
>> +    qts = qtest_initf(ERST_CMD());
>> +
>> +    uint64_t base = acpi_find_erst(qts);
>> +    g_assert(base != 0);
>> +
>> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE command */
>> +    qtest_writel(qts, base + 0, 0xD);
>> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE result */
>> +    log_address_range = qtest_readq(qts, base + 8);\
>> +
>> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_LENGTH command */
>> +    qtest_writel(qts, base + 0, 0xE);
>> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_LENGTH result */
>> +    log_address_length = qtest_readq(qts, base + 8);\
>> +
>> +    /* Issue GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES command */
>> +    qtest_writel(qts, base + 0, 0xF);
>> +    /* Read GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES result */
>> +    log_address_attr = qtest_readq(qts, base + 8);\
>> +
>> +    /* Check log_address_range is not 0,~0 or base */
>> +    g_assert(log_address_range != base);
>> +    g_assert(log_address_range != 0);
>> +    g_assert(log_address_range != ~0UL);
>> +
>> +    /* Check log_address_length is ERST_RECORD_SIZE */
>> +    g_assert(log_address_length == (8 * 1024));
>> +
>> +    /* Check log_address_attr is 0 */
>> +    g_assert(log_address_attr == 0);
>> +
>> +    qtest_quit(qts);
>> +}
>> +
>> +int main(int argc, char **argv)
>> +{
>> +    int ret;
>> +
>> +    ret = boot_sector_init(disk);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    qtest_add_func("/erst/get-error-log-address-range",
>> +                   erst_get_error_log_address_range);
>> +
>> +    ret = g_test_run();
>> +    boot_sector_cleanup(disk);
>> +
>> +    return ret;
>> +}
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 0c76738..deae443 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -66,6 +66,7 @@ qtests_i386 = \
>>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>>     (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>> +  (config_all_devices.has_key('CONFIG_ACPI') ? ['erst-test'] : []) +                 \
>>     qtests_pci +                                                                              \
>>     ['fdc-test',
>>      'ide-test',
>> @@ -237,6 +238,7 @@ qtests = {
>>     'bios-tables-test': [io, 'boot-sector.c', 'acpi-utils.c', 'tpm-emu.c'],
>>     'cdrom-test': files('boot-sector.c'),
>>     'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
>> +  'erst-test': files('erst-test.c', 'boot-sector.c', 'acpi-utils.c'),
>>     'ivshmem-test': [rt, '../../contrib/ivshmem-server/ivshmem-server.c'],
>>     'migration-test': files('migration-helpers.c'),
>>     'pxe-test': files('boot-sector.c'),
> 

