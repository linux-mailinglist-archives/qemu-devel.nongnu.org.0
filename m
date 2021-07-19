Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA063CE8F7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:47:47 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5XMo-00005A-8A
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m5XJk-0006M1-55
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:44:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m5XJi-0006lv-16
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:44:35 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JHfCSm002031; Mon, 19 Jul 2021 17:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=pVTRm/3A5En6yQrFUJnVibN5rr+CulxFJaBd/LadmEE=;
 b=jPQXAgQmFyLKI+88LcQaau/n7Cw+jQfppvt35dsaQF0VWQhxUHqq3Hud/xfozG0Nvm+S
 m9fSXMZDtr2degw8YKWCIC60AgTjdHov8LrPAg/30fShnykB9jmKcS0/H02XKviwLjRr
 r12Iy99EHAx0NUIcDt5gNlhI74ADZE6WgvzzDVFejCsMmzuh+X9KXaSkP8yraboS25IA
 W9yBfeiqOCYjeevL51lXf7ZnXIp9W6Lu9bgU+Ns7JmmX3THECxVoYu7dl3s8yvLL80QE
 1Zt1mSLVoEfPyRQBfXe8uEwqVJ9OYbZXITkMycVgzBKVePA07HwFS3ByctaErmaWS8xs 6g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=pVTRm/3A5En6yQrFUJnVibN5rr+CulxFJaBd/LadmEE=;
 b=gg5mXv1mp5HF0KDWNMv0263uksQf3ZFP77jwen05UL9IhTedrW9S4dK1kaawrwXzt7w6
 S+Ug7x+WvFbUu3R60GLVsqKI2NJV+A5kr6CHUzpuddk5jcnioVPp8nOJA0Z7Uit6AfXx
 +T7vN9oc4hLPLe/YDyz2Y64e+P6RJq+4P7NLugB+OazeRvjyWp6S3pKXLn//WF8F8CNa
 xCnrHMdIwCNmFkzjsTBfGE0pCFwH9AkbCBEah7T++aQkYidwULV4bRaAc/kvfqNslreN
 DU3Qb6LT9t4qabPL2Z6xSouF+mXXOq/BtLn7G2dbRnIJ2WrlDK5FPZSgadEdeNjjp9ul Qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w83crtvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 17:43:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JHfHL3023507;
 Mon, 19 Jul 2021 17:43:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by aserp3030.oracle.com with ESMTP id 39upe8n2cq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 17:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9gSfVZ5K5ZyUNUKRmH0mAVp91lehCMu6zC27Hlp/GMmwUxT/Gq56N3WvLTNdXlMTIzgMccx6+8dajJ8Muc2aftJQXt1viZvoix4qknvvBhiKJ2YvEhgSWwllootPoDaGg+MgKRPMc6WpEhilYvEZaa6Dypm6wRGX21UfpUqYBUtXhMhFcbZIxgebFknxSYGzl3N3q+mOFdB2BRldMTuYHeiD/6wjhiYhnptlEMRD5mtbqMteevRSaXOpDl38buoKoL/OJE4jaiFHdKQWJedYlh6eB9DlyTj+o932Q/jN66BsPQROK+P1x/gULLfXe6dGPhT+/dDi8GTk+kHGLq2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVTRm/3A5En6yQrFUJnVibN5rr+CulxFJaBd/LadmEE=;
 b=WJkqCtnjxXQlZCISeryWskghanQOXVkVkE4PggbMguFpfYEKW9+9ByO6QmwhAWbZyj0BqUYEZf1Rah6aj1eBlWZ4phSyrXuPBqC+pYwBIrsjcAungbrX8CtbdLXcDT0QFnBuKwRYg6z0UalIwdedhgEKRhSNZwiq6RbLwvfCNjVrCk1I+e01+d0nqQ6Ilv5gy3l9wjsok0vX81sqAs6K7K3UUv9Mymy4iG9WzEWFKjCP21rTQV0eZONJegdoteF0RMwRt0Bnipxo5JjlLi5DcH+1ANnKOOHM1W0sysy2Jz1GzU+wBmqqDG7oLZBTkUCJCs+LQeRJIJ6ZLHV35ogZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVTRm/3A5En6yQrFUJnVibN5rr+CulxFJaBd/LadmEE=;
 b=Nc/JagxQhwkAvnU38X34E12liWLKlVHluMNM7iA7zUhmtctOhkkMGILcld3lZLVcAeADi9puaD3GWlr8ygPnIQY+Y0hKQV6LbT7Cz/5oMne+wbxrn03tSldmjIzQEYI3PwR7+6nEzotPNUQG6Dqgwvo0/dhFd8gZ8RxpDqwROoA=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3842.namprd10.prod.outlook.com (2603:10b6:a03:1f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 17:43:26 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 17:43:26 +0000
Subject: Re: [PATCH V5 16/25] vfio-pci: cpr part 1
To: Alex Williamson <alex.williamson@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-17-git-send-email-steven.sistare@oracle.com>
 <20210716114520.04921106.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <a19355a3-37d6-3080-c443-19891c4d9626@oracle.com>
Date: Mon, 19 Jul 2021 13:43:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210716114520.04921106.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 BYAPR04CA0031.namprd04.prod.outlook.com (2603:10b6:a03:40::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.24 via Frontend Transport; Mon, 19 Jul 2021 17:43:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcb7695f-b84c-4037-db64-08d94adcb644
X-MS-TrafficTypeDiagnostic: BY5PR10MB3842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB384292B681F11603952A5D28F9E19@BY5PR10MB3842.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3R/6dRdlWDkwQ8myK1IF8qURwCHXrPK8+PvlZ0s5FJ4iOmZ7D5ceWHOY4/6VgLRmRXBy8YCzPtnd/LcoceHG3C63Xp3u3qCDv4n8djwgsChde3Uptk67UTzGIld/znl/mt8AEWrAqxmY46/Oh5T+OimLhAjQooxd/IWLCFr27ZoyAH3h7Y0GUvGQC1sBguWswQmIpfDkcJcbaRDne5lYBYUWp7e8K8tD8nNr7jfFYiqba81yO7t3rD0XkCjDg/VMKetyyTSFfZFcwnkEISKkzpvD4vqOQDzKSdXehZ5A9tEDL3uhFMvcALBsFp3pw0eABSicV+glYUmnlF20Ek7gby/gCY3GsjEt+FpOAfj+tZKE0+A5bhaamS+xpZHGbQt55QEXkMx7v0I/ChbceYoDw1cOVZaMHZSpJhMY5zyFy1u33rDZ4lZuzhPQtKxGczpLAfj2Fq4Xy7CQmcEWp/DiasdMUojJICH2Mpzkb/Ph5+4Svh0cY6BGzfYE5K4PjkvzB7JcejD+v8FS/j1yD0wC9h+UCUs7GHoUIQmG7nupOxC9w/BUmQH7mr/xJJU1R5xZik6xWBSzDkTCI4r1jp/4pIjBpxHIuUHHuCEFsppQcEGgKyxU0MftKjRg42H+4zgZTdOYECGz5XP+DpLWtUmKD/dEToGhfzljY2LMAejXSu/A+EC4V8/UuD6p3godcteWUmZgToHkCU3CY8GkeLp7LtjP7K1/9LHOeZ2QotpFUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(8676002)(44832011)(8936002)(956004)(2616005)(31696002)(2906002)(6916009)(66476007)(66556008)(54906003)(86362001)(316002)(16576012)(508600001)(6486002)(83380400001)(53546011)(38100700002)(7416002)(4326008)(31686004)(107886003)(36916002)(186003)(5660300002)(36756003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3N6SnVjc3BwSTRnalkveGRyalZMSmtTaTdBa3psc3RRZmsxY2NxNldIL3pX?=
 =?utf-8?B?WkVLMFJ1UHBlSFFHOGV0bUVhNUNJMC9IakJYcFMxV29Nb0Fza0ZmSUhkYkUw?=
 =?utf-8?B?U1dBMWE1UytVWkxEOG16ZDdCclF0blpHM3RnVTN6N0RMUHNHbWo2S3J3eDNF?=
 =?utf-8?B?eWtFRFJuYXRjRmpYNlBib0dKOUFGdzk5cklaRzU2TlU4NGZ1MXRoQStZV0xD?=
 =?utf-8?B?bE5CcERxZXdpUjZEWTZDSTBMN2ZpcWlLUDZ3VFRxUVJSSUE0TU0rcEMreTRj?=
 =?utf-8?B?cVE5TU9uU2lrcjJXTWRFL0tsRnlJcXRaaUZBTWU0M1pGTDA4ZzdJQTJVcXlK?=
 =?utf-8?B?QWU3TXdUM01oSjFnSXJmbERpM0Z0MjNzN3RFdHZSV2NxaHhnWkFTVFZSdkFZ?=
 =?utf-8?B?VFVtYWFFT0xscTJqb2EwTVRjZzZ1UkdwUmxvMld5ZEFXajdPbDJKckNQeEZW?=
 =?utf-8?B?VXZUOFBscWRNbnlvMVdLVTZ0RTU5ZUNpODFJWkRXTURRbUlraElCS3NGNWhC?=
 =?utf-8?B?UVJlU1dhaUJoeUVMZ0k3dzBvYWVlaFlEK0xLNERMQ1c2Tm1lU3N4RUdGSUVh?=
 =?utf-8?B?N3IzcEx5SlNQanUvVlBwVFBPaHJoV09jbk83aSsrZjVYODFLdE1lNWQ2NFVj?=
 =?utf-8?B?NGdQSzZKNVlPS2MwUmlMS2NUbHpWeDJIbDRLRDUzeHprU0xWWTlKTUhLRnha?=
 =?utf-8?B?ZElvaXR3RTNnNHMrYXBUdCtIdEZ2d2xDVnRzTlBGbmxvbTluSlM1QVExYzA5?=
 =?utf-8?B?NmlkeUlsT3o2T1VrYXpBSVRqT0xjWDFOM0l3RVRleGR1YkFwUy9oZXNLWXpz?=
 =?utf-8?B?Z0xUd3J0SXBpeFR2dC8zVnhLR1gyVkdPOVJZbXFCSXZaTjRXVHRXRGJJS2h2?=
 =?utf-8?B?RWVtaklLN2ZJRUppTnhQSEpWQTFNRUhYNW0wb1EwQVZKS0xUVWlEaWYyUmc1?=
 =?utf-8?B?c1JEckRwOU9pYmdTbklLWmZpLzdZR21MbG1tb3VUM0YwdFJEbHdDRXV2bjFL?=
 =?utf-8?B?MWN5Y21Ba2tPNVgrZHpyLzhwR1NtNmZmTWlCS2FxY09mRjJGb2dubG52TDJO?=
 =?utf-8?B?K0dNa0VpRlM1WWJxMkYvbDZOMWRveFJRWjlyTXU4M1RVQjBUZ0N1a0hKRTJ4?=
 =?utf-8?B?SjNENDBtVHdvL1VKNTUvMDJDQVhicG9vc3R0azA3elBjbGp6R2N1bWlzM3Jo?=
 =?utf-8?B?N0IrZ2lzZTB5VzVDMlVtdmtiUXdveStjOWlINnlPYWQvZFNDdTR6bWFlRXRG?=
 =?utf-8?B?eW9iZGZnMTEvcTg1SUxWbU1LOGFyMkxuSW1QcWVqWDR1MG5UMWhMcWF6dFpm?=
 =?utf-8?B?dG9valdVNlJISWk4Ty83VnVkTlFOWlVFTityYVVYaW1NNFNaN3FLb2did1VC?=
 =?utf-8?B?L04wMHBaWG5MdkhhUm0vQnZyQXZRMmEvQncxMDkvS1NLQ3FmV1Juemh2L3Jq?=
 =?utf-8?B?VjJOeFo1WXIyWGNsbmtpVlRKTWY5SnZWajMycEFBY1hmd2lkQlBVeG9YN1Zy?=
 =?utf-8?B?cTVnOXhESk1iRTVGQ1pnWmNubENmc041NUMwWVB5ZFRUakxnNkltWkkzaURL?=
 =?utf-8?B?YUtNelJzVFkrd3FQMFVnRzBTTzZlUWgrejJGZnhWK0xvM0Q4VTFTK0ZzNjdV?=
 =?utf-8?B?MWZCZk9VZHEzT2ozWlB4ZDg4TGNyRTRXcGI1SktMZXhZUEkwYmgzaHBSQkZ5?=
 =?utf-8?B?QWZCUWZFK2tTZy9kZ3MxY3k5QllsSFU1Mm9FbHFsTzhsSDltalJ5ZmlmenBV?=
 =?utf-8?Q?k+j6hnTkGbOpZMQMbqvJIkdnP3zIFJFLVmMa7UQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb7695f-b84c-4037-db64-08d94adcb644
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 17:43:26.3440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNbf2EQHyrUMtqHdPh06Iu4TGmYxg56MMRaN7OXcYALvLbeaIA8xADp4lriH2I6TU9Yv6+P1sA6EbX28BV3r1lBAF5c8k2tTLj886t2GpjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3842
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190102
X-Proofpoint-GUID: 4KZtdQwl5pGITEVNEaoox_Gd3-3KVL7c
X-Proofpoint-ORIG-GUID: 4KZtdQwl5pGITEVNEaoox_Gd3-3KVL7c
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/2021 1:45 PM, Alex Williamson wrote:
> On Wed,  7 Jul 2021 10:20:25 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 9220e64..40c882f 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -31,6 +31,7 @@
>>  #include "exec/memory.h"
>>  #include "exec/ram_addr.h"
>>  #include "hw/hw.h"
>> +#include "qemu/env.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/range.h"
>> @@ -440,6 +441,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>>      }
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>>          /*
>>           * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
>> @@ -463,6 +468,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          return -errno;
>>      }
>>  
>> +    if (unmap.size != size) {
>> +        warn_report("VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
>> +                     iova, size, unmap.size);
>> +    }
>> +
> 
> I'm a tad nervous that we have paths that can trigger this, the ioctl
> certainly supports that we can call it across multiple mappings and the
> size returned is the sum of the previously mapped ranges that were
> unmapped.  See for instance vfio_listener_region_del()'s use of this
> function.

OK, I'll remove the warning.

>>      return 0;
>>  }
>>  
>> @@ -477,6 +487,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          .size = size,
>>      };
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      if (!readonly) {
>>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>>      }
>> @@ -1603,6 +1617,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>>      if (iommu_type < 0) {
>>          return iommu_type;
>>      }
>> +    if (container->reused) {
>> +        container->iommu_type = iommu_type;
>> +        return 0;
>> +    }
> 
> How would this handle the case where SPAPR_TCE_v2 falls back to
> SPAPR_TCE (v1)?

I am assuming that if SPAPR supports live update, it will be supported by the V2
interface and not by V1.  That works well here because reused will always be false
for V1.

If we cannot make that assumption, then this needs work.  Regardless, the qemu SPAPR
code will need additional changes to support live update.

>>      ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
>>      if (ret) {
> ...
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 9fc12bc..0f5c542 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -3264,6 +3272,61 @@ static Property vfio_pci_dev_properties[] = {
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> +static void vfio_merge_config(VFIOPCIDevice *vdev)
>> +{
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
>> +    uint8_t *phys_config = g_malloc(size);
>> +    uint32_t mask;
>> +    int ret, i;
>> +
>> +    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
>> +    if (ret < size) {
>> +        ret = ret < 0 ? errno : EFAULT;
> 
> Leaks phys_config

Will fix, thanks.

>> +        error_report("failed to read device config space: %s", strerror(ret));
>> +        return;
>> +    }
>> +
>> +    for (i = 0; i < size; i++) {
>> +        mask = vdev->emulated_config_bits[i];
>> +        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
>> +    }
>> +
>> +    g_free(phys_config);
>> +}
>> +
>> +static int vfio_pci_post_load(void *opaque, int version_id)
>> +{
>> +    VFIOPCIDevice *vdev = opaque;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    bool enabled;
>> +
>> +    vfio_merge_config(vdev);
>> +
>> +    pdev->reused = false;
>> +    enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
>> +    memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
> 
> This seems generic to any PCI device, I'm surprised we need to do it
> explicitly.  Thanks,

This is a remnant from before I added VMSTATE_PCI_DEVICE to vfio_pci_vmstate.
I will delete it, thanks.

- Steve

