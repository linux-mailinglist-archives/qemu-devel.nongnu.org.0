Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A973E09A0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:51:47 +0200 (CEST)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNre-00040x-AI
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mBNqS-0003Kf-Sc
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:50:32 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mBNqQ-0000QR-A7
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:50:32 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174Kl9ck027141; Wed, 4 Aug 2021 20:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GccJ6RN6ch6JvX3BRBqtrdcutFE3GgBi2H+RUkB6nBs=;
 b=KtvHPfIwUsHcZ7CAcvsgTXM1kWC0WAi8bHDccB82udhHWY78/8KZc5Fbq1NwoEVnfy30
 j/iwxRHTj4YY7gR0Ti8aSoSNDBqXTL+A56LYydDfN4A9lNOeWUlElL+X/PyEym2ZSuMf
 EbrU0bM0R91He3oiSNPZ8t1lH0pSYzd38W662Ew8B1sStAe8YKiZ3PmyzdxVc4X6/tc8
 YVQWhasfSelBg5mLBlk8tSjZHv/RYRb7qwgI6/tRP4+sEM0lS2knkbvwqehg9D8kNbRU
 Vbfwxpu0pGh2fqNWxS6Gf+D3IMdSuhmTfGvJ9vfZlOO6U1UodTKx1sb8ibgvEg3RjWvv ug== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=GccJ6RN6ch6JvX3BRBqtrdcutFE3GgBi2H+RUkB6nBs=;
 b=HDLiAlx522wyrPo+W6WKQjD9fHTgjRvg8iRG8h8wZt0K8TUfJM9O33s5F5ZrmBo5DAnp
 rrLGY0pq/grkM5zZg9D8Q4NWbzcj6UyhhNiDWJ00cgnN6UYZnZ51JFPFd2VFefvBW+OQ
 +Repav9grt++eAfDzLqb9Sqby8WxCHeYz0Rfl5XBHXvKttRVUzFb1GMk4bgXyls0ych4
 VpXCxXHp4W4f3A2M4eWrzEDczXl0PiJwp7VmACQT6XtZr1n++2krpN/pAiQojGNsTx/r
 SPafA/9Me5b0SVRewDbh29nv6p8tHa5UMoKOlkWrbLcQoW7XACo7ryjoZ50m/Soa4mYu cw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a7hxpjdq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 20:50:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 174KjP1e057444;
 Wed, 4 Aug 2021 20:50:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3020.oracle.com with ESMTP id 3a5g9xv1ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Aug 2021 20:50:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QemsYhNcmcJgNF4TANliMMpPLmLWFBDX/KS1yedws9nUYIr+bokZQ0yRhTUIIlC9bhl7jFhgo0KKU76MN1ngEBky71CGSQqIa21R+Rhtvcm2uh1g5SoZQZKk41PVqz0O5l7gW/k18HvUKu9oqm0ghB0m+8nbl5Ts7xKL9QL6wWkkEmaNlz0Zw4FYu9Sm7WHmZ32B39ia5mIa4sCw4bK1xiZk3fwwr1o7rC6URTHhfhoXAutUpv/C3h02/5mC9H71yN4Hzx4oFA2J/AWcnzMwglkLvFTU6keFKu+hJsDnzj9Ae4p5WNqRrji/WF0CwBmbH1P4aWsg0bBAJnsvygikZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GccJ6RN6ch6JvX3BRBqtrdcutFE3GgBi2H+RUkB6nBs=;
 b=QpRg+RchVAEZOo7WfzDwfTtmqPRNn3I39NOvXHzkaewM5anI/LZhimf5uyUwzltxCe01YOAYfUEbQiFZE5HkmMYG3kawJ8rNsLE0mAHyWctYYc9H1/fMX7MjkPn3DlmfxhkpuUF/vUTTn7oSd/CUd62L1s6zrtV66y8BmdPZaHazY5Tj33js7cNSR9dw0E4udMcENXMZaucxyU6HXXX9MDMci7AC3yRnagBv+DlUxbqzNMkJq/c0L8yLd480xUH0eatzdrB1VSuHc/U8sTGQTxZ2VJYgxQ3e1Sl0oskGp2vvKQRUqatbmmy11WrjEJr6hWvqKNAc5m5iKEZWx3FR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GccJ6RN6ch6JvX3BRBqtrdcutFE3GgBi2H+RUkB6nBs=;
 b=0PDEKKJ9cTe2G9Ql+pdTx4EJlaJIaqRBhFWZdY+s6UV0wpVaBVRp6Pz8rifMsFMDfvaYl7r4lFy9syR2sJgXpy213r4B0AIA1ErPSFRuMkFvywy6FVKSLWcV6JvpUKa8YPj475q7K5JWCEF6zlWHhLsfPxGPQZm1HwUltrrxCLQ=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB5616.namprd10.prod.outlook.com (2603:10b6:a03:3d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 20:50:19 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 20:50:19 +0000
Subject: Re: [PATCH V5 00/25] Live Update [restart] : fork mode?
To: Zheng Chuan <zhengchuan@huawei.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Xiexiangyou <xiexiangyou@huawei.com>
References: <ad3f7ebe-8086-d70c-8db7-997e8a5fa411@huawei.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <d9539fbb-1f98-fa2e-f465-3cfbfdd50e0e@oracle.com>
Date: Wed, 4 Aug 2021 16:50:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <ad3f7ebe-8086-d70c-8db7-997e8a5fa411@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0025.namprd05.prod.outlook.com
 (2603:10b6:803:40::38) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.21] (73.219.99.178) by
 SN4PR0501CA0025.namprd05.prod.outlook.com (2603:10b6:803:40::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.4 via Frontend
 Transport; Wed, 4 Aug 2021 20:50:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 693f84f5-d89c-43d6-2961-08d95789789c
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5616:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5616E6759A63DB624F968494F9F19@SJ0PR10MB5616.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGALz50ccNuhlfJTxapO+qGN15YyWAI0Ax7Xk9+SB5zq0Gl/Np84EyUm25NvMY/g8cK4OSVonI7ujq6BhPLNQeepsyM9rrPBH9S1DvtJIeHrIQ8CEf5Oyt+uxDfnsEM5ghfTauHtKPPev+yaFQiofjy0mjmraZ4PqKG1f5M7mAQ+OJlhQoQSaRNAQCRuRCu2HZA59kWDS1vwECV3zUWVqDMxFTJXpVpBXeV4rskolqrVlp+HqwflWhVb08Jksf5sxAa8mRSS8Japr85c2OnWs4YXDuyUB+c41Iwxg/x57cVJmIkvE/ltw/hi+QO5CInu2uBOEQm19MdDQrgX+4PIqSSi/cVhsjxXHIiX4vE5PU9cKd9NFKyScKkk0EQDi5j/QP8wc9GarMRLclPF12ZsL9IpFViOe+cOaufulxRP3SAX7XI+Npph4WdGw+Al6BwxQESMwYvz40XQyRO/745hfMu5Dsk7ThQFZjf0dDRPAcCUz5dpuItMF6F95RXTHdDNYDSO8vxt6RTVZTvhMnf/I+wbpV2eQE3Civrz0NEt87tg1MuNHzxus+jCXPymZ5ZV3HcWD7HzL9ll6PFfYYR1KXwPY/YJK3sA+nJNv3z4KMHMz7MIVrp30M/BCnTcpyD1V/RJEqdzMKRooOGTc0OteUC7CSjbddxnX+8OKNCSlOgtXGCdWfW18yD7rHedFgqePWkbHqFniaiY/ZsF86Noi0i7HETY5OBkOXHUFncKMrTqkd6SPdta7FEWwTq9BaZUq8fuhApEXpDqjyuGYDnd7Shyz6kq78JCLVrPYtwe0Gf/UKJK7ZvhXAwv/vptz+vH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(31686004)(966005)(186003)(83380400001)(36756003)(31696002)(2906002)(16576012)(508600001)(110136005)(86362001)(26005)(316002)(38100700002)(956004)(2616005)(66556008)(66476007)(36916002)(5660300002)(8676002)(8936002)(66946007)(44832011)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1l1T2tsZHA0WjdlcnBZTzluTTM2bUkxRGdNNmFBM1hFSzdPNjNaQzE5ZVgz?=
 =?utf-8?B?cE1oKy91ZGhtRVFFUDJSaUxncXZ4cHN0Y1had0x4WVgxRlVxM0VWTk9CMDky?=
 =?utf-8?B?eDNBd0hMdUdpcDdtN3Rnc21SaFZtK3Vwd0NGTHJPSGhNckw5Rkl0N1hLRkkx?=
 =?utf-8?B?bHEzQVVUdnRtR09wUUloK3dlamhkUkRoc09CRzQ3WjhCZEdQTmJjOStudW1o?=
 =?utf-8?B?ekx1UGJUd3NpSjFqMWhMNFI3YmhpdExMQUs2dDBMcjVSRGt5Ujd4RXVKN3Zu?=
 =?utf-8?B?NFJ0L0t2dmtyN2hxc2VZeWFJS0thM3l0SFliWnVvRGlTb0szelg1dUQ2bDFW?=
 =?utf-8?B?RFA1K2xXQkl6eEY1elZCakF2ZjQvMHM4YmdIM1puQTl2L0E4d3BMWHpCK3RV?=
 =?utf-8?B?MkRjb3ZReTFja0J0Y09EYms2d1VreHF1V1FWMHFoSURsUUJ4cUJwdENEdDBO?=
 =?utf-8?B?THVxa0VaNGczdEMvVUxmRHhxM2JXY0VnUVdmaVVSeVhkTVV3MWUwb2JydmlO?=
 =?utf-8?B?U0NCVDdZUFB5aW45OFlGQ0RpY3NuSGFPVThFa1d3QWdRNFhiR2JIb2gyMzBP?=
 =?utf-8?B?QVFYaXY3ckc0NmwxRXJMOW15VEg0bk41RHRCTWs2M0dkWDhqY2x4MTc4TGE4?=
 =?utf-8?B?bkZ1OW40VS9SZnV1YndTUUUvbnpHdlBiME9aUlp5dkljR3VvUFo1UUtFKzdH?=
 =?utf-8?B?clY2MDNzVnlsb2xQNFE1WlpySE9ac2pDTzU5ZG1QSFk5WW1WNFpGSTRuQlN4?=
 =?utf-8?B?bDNCblM3VSs3SFJvVWdUdTEwU3NtdnREU0VaRDVabGg2MVBMc3UxQkRmM0hm?=
 =?utf-8?B?enpCRFRPVmtRVm5neGc4bTlpNUZFVVJEOVFnSGFsT0VMY3UxY1hsM01aRE1Z?=
 =?utf-8?B?YmZjQWN4MEFFZXloWTZCSHNFL2IyenRUUzFmZEpqM0ZMMzdyNi9lYzh3K3FH?=
 =?utf-8?B?NGZGTjhjSkFvMGdON1gyRHhDTCsvM0Y1MWFPaTRUMVZQNXgrT2lsdUdyM2VC?=
 =?utf-8?B?V1NBK1A5ak1YQkxNcXZJdGpEZVRISUNQalVZZFEzeWNlMTI4WjJRQ0dZMTI2?=
 =?utf-8?B?VVNRYVpHOGFkNVR1YzlKMG95M2NRaCtaNnQxR1ZubUVLOHFOZjR5eWpqSFNx?=
 =?utf-8?B?RnZqT0dtT0puM0RNVFpCam9SOENDZ0p6alozVlFGeTNvSmt1VStMZ21INkhr?=
 =?utf-8?B?VFkyVCtHK3kvSkNrbkxjK1lnbGxQNElNdUhSK0ZrQ0diem9JeThVNmpQaGV4?=
 =?utf-8?B?Y3lhNGJnSjFQY2QzSTFDSHBiNnRod0ptOGdVa0ZMMlVUMDYyd25Eb0szbEEz?=
 =?utf-8?B?UmNFSmhrOExlSHRENTVrUy9JTU1zVG1JaEJOS0czakZSV2ZqR1Z2eElGbzdY?=
 =?utf-8?B?Zjk4d2orSmo4dDhmaGQ1R1NsazdOYjg1N0ljQlNQczg1UUxwREc1SFJnSGdk?=
 =?utf-8?B?SzBqS2FpSzNieUVSSXppQVVmbjJLbXluLzkxNFdGeFdPTnJNN0poOFl3THU1?=
 =?utf-8?B?ZEJwU28xMTlBdVhTMHVVbjk3UEcyd0QxUjNnQmhnemlZWVdyNFZZQmRIZFpR?=
 =?utf-8?B?d1pZUG12bGVCd0YvUUxJNE15akFValhRWEFRbGFRVm9hSWNvRGw2NEJHOGM5?=
 =?utf-8?B?dCtxSE5iYVhPUTBjY2V4ZC9nYS9WOEo0ejYrY3FNMEpjUWJWL3F2a0U4MHpw?=
 =?utf-8?B?ZjhQYWp2dW5yV05jV0Y2WEU2bDFod2QvR00vbFlkQitqN24yQzYraDhpeVpE?=
 =?utf-8?Q?SKmqoiftAU4PFa/+g1WtuzPuYT2aOL2rPnDSvdl?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693f84f5-d89c-43d6-2961-08d95789789c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 20:50:19.6391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqTFeZ72zmdg5joHJzzN7D9eXTK+adNr6Wqrfkjf/KLXmj9wTva4vJrNqtxKU/uuqSzcKhFjzRusZJGT9lPMEEQJgc+sKecNbW/lHq2N3bI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5616
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10066
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040127
X-Proofpoint-GUID: eVWuyNWYLuuIP2cxVlEvkOmDUgZWhidh
X-Proofpoint-ORIG-GUID: eVWuyNWYLuuIP2cxVlEvkOmDUgZWhidh
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/2021 9:10 AM, Zheng Chuan wrote:
> Hi, Steve
> I have saw the discussion about the fork+exec mode below:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg815956.html
> 
> And I am still very curious and I want to discuss about the possibility to support both fork+exec and exec in cpr framework.
> 
> 1.Why
> fork+exec could have some advantages and also drawbacks versus execvp() directly.
> Advantages
> i) fork+exec give the chance to fallback to original process even after we do exec which is important for workload seamless if any error happens.
> ii) smaller downtime since we could remove the vm_start() downtime out of the frozen window.
> Drawbacks
> i）need more codes to handle including fork，address/ports conflict between parent and child.
> ii）more complex life cycle management for the two processes.
> 
> 2.How
> The cpr framework is flexible and scalable, and maybe we can make use of most codes to support both execvp and fork+exec mode.
> However, we may need to do more work compared to execvp method.
> i) do fork mode in a thread like migration thread
> ii) make parent and child talk to each other through socket or anonymous pipe
> iii）make use of sharing mechanism of fds in cpr framework including memfd, vfio and devices fds
> iv）deal with the conflict about the socket address and port like vnc （do by reuse port and pass the different args by cprexec）
> v) do life cycle managements for two qemu processes and need parent exit and reconnection for the child at last by the management service
> 
> Please tell me if I am missing something important:)

Hi Zheng, that list sounds about right.  However, additional kernel changes would be needed to 
change ownership of the vfio device descriptors. The vfio module records the mm of the creating
process, and does not allow other processes to unmap ranges.  Also, the mm->locked_vm would 
need to be transferred to the new process.

Fork+exec could be a new mode to the cprsave command.

- Steve

