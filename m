Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48303D0AC1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:55:20 +0200 (CEST)
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m680d-00067r-Ll
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m67zD-0003jg-59; Wed, 21 Jul 2021 04:53:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1m67z9-0004Ku-Ju; Wed, 21 Jul 2021 04:53:50 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16L8obdB010615; Wed, 21 Jul 2021 08:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=LdSM0mQ5MvhS2OhNq4EUzgFUgSclsl3G1WVAtp3saVE=;
 b=E+WrWBSCEi4Q36XD+S1abXplpTN8yfpzyE7v1FDpZLpWoymOkfJBWsySw7yJaHbH+vdD
 gBb0QM62rbltADxy0yqpFejwvX/IlH3yCUBmaQTFb3k9K8dV0MUu4Hh94DcYsJkxDKs4
 Tpmr2uTKMZl9f26DvVkRo85Hm+uAkmJUGbkgJz9O9DXO6GGQ3RjhIfuYON1UcuhgOwNS
 Nl+4SYlAWk+MhP20gBtnX14uiKCYNgloBWt4aowTr/zJxUGCvK375g2jC6pDVDQ+l/WQ
 9s5/ur3jSFSjmZsY0clu2mHXH6fglfZfl4QOTFiLcJxaNcdjqISewESW3wnKYroLY60F iA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=LdSM0mQ5MvhS2OhNq4EUzgFUgSclsl3G1WVAtp3saVE=;
 b=rtovjb3OaJDs1+pz2s2JsTtharwlMToqzaUi8w1kO5P0cmUyIDSDHeVWe+eO5PSyDEAL
 Sm8GT/cO1ek5e3RVNzNQBCPtoKiAlFt0vYJiB1/de3lf0u9MWViViyepRlfmduh9rrPn
 qBWUWmHFF3qfn/BqiQza+jzEDwQJ00Y1KdCT1SwOLocOSjqnUG93+U3HkvqSROm0HMF4
 7JagkWs84Q2hgamvL0C4ZWyfzcqurQeMenrOkBdnEWZYWSez0DfMSLHG++NXPa+jArdb
 6xrEjUHMoqoUjcXYnvIIwLMRh9vQ/lVNjK7bFzJT8D+OO7I6xQVQUwaPHpqT60RWNyYD OA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39wwmtt7v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 08:53:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16L8oORe125082;
 Wed, 21 Jul 2021 08:53:32 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
 by userp3020.oracle.com with ESMTP id 39v8ywxsu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 08:53:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCSUlZYaf5O5RDQuJRSZevZgdK6Asg5bvdf7AyZMn85LlSMl6T3WLFpLOoFI+v+dMvHNvSpvp1UXm7yiDQKV6jKn/eAvrEEeip/D97GOaX9NuWjdsQr7A4QapQY8M2B7kK9tFuUcOsOFBkk/8ObZgjIp4nv2jFyKPvxgfp2bkWuQZ86kjdpH+2aOQvrhFJcqU6PWYi27HZZ90Fc02yqXKbngdnfL/jrfHcn1BsyEuSz/FcylmwR5ZqSiJy3a5ivpxSutcePx4KnQ+d8ZR0x0aghTTX3hv0x4Y7L+NdTy9YUbKxiV1tNaKtOKWVYcJtssr4eVVU+ixU5uQQk/XgrljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdSM0mQ5MvhS2OhNq4EUzgFUgSclsl3G1WVAtp3saVE=;
 b=ZCqz7rGCsjDJE72InmlAnA0NTNkURJEHASaLlUmHuAi7XYjPaG2BuRov98PH6+DdvqtHw82NtGiU1L1qEwbHae4nw2oUNUl/b2nq86GCjZZ4Pc/vERYPQGr8Fj25DtYK98c309mMD+8Il8syyMhN8bpwRlM677o+aSz2PaT1WBfK+9HGt1+VBVYnhWMwD+31tSkIclc5fuq2CEntAhmNGWRjlOvkgKsPVTOmbPhrtl7B9HM0tL3FdOADfZAcros3JFxDiKIB/KPxAyoSPmcXiIDuDTc4nLsybPy6TikcRw2fb8Zo6ELL19tehyJZBwk1xx1mARDpT7mSXjLhxLltvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdSM0mQ5MvhS2OhNq4EUzgFUgSclsl3G1WVAtp3saVE=;
 b=nroyPDooQDKfQvWzyVexJJBOtdssUxaaGlkt56/jEkW9bLDBPCWFxzqX+ZqJmcfNdu9PZOclv6cb7NAwV9gWacx+5T+SJXMYPARvsYqDxRqmmTjUTmWCT9o95rAXxiC5h1dqZnBEhaRWLxYIld2D4549ROSrItFEOON11rwz2Jw=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 08:53:30 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:53:30 +0000
Subject: Re: [PATCH v6 0/6] hmp, qmp: Add some commands to introspect virtio
 devices
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <11b4c5b0-e595-2b86-2dab-54e821e47ad2@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <f6902815-df0b-949a-4eac-9f2a0093499d@oracle.com>
Date: Wed, 21 Jul 2021 04:53:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <11b4c5b0-e595-2b86-2dab-54e821e47ad2@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------584B59E288F4AF6299C9620F"
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:806:21::19) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.39) by
 SA9PR13CA0014.namprd13.prod.outlook.com (2603:10b6:806:21::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Wed, 21 Jul 2021 08:53:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 307ad0de-5411-45c5-906f-08d94c250355
X-MS-TrafficTypeDiagnostic: PH0PR10MB4679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4679E12F48C2961482B91231E8E39@PH0PR10MB4679.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBgzXZzIYI3FORDAFD3YmJZOjwfyPpN5IYGoDZNeuRuMq8lxq5zyjvB/rXWYyk26H4mMme2yE56XWJn11NxfR4u0uJ9F5qkjmNaFikSD1Hvwy2WL1JSHkNXUVP/khNSXf2Ji41jqNdO5Dpdm4MhgB1houynW0YX02Ve+r5M/9F0Zb65oSnkst378p9UKHSddxl/YwDHwVkgjYOir+MeAM7deG5hOblSngAmCOHDVXtoSCzJnMOZ1oYGnoJA4K59+Sx2BEHmBxa/XaN6Px2oGNKe/+ncKy35vB9QKib9dwG2xsjZsUa8/phrcADvotaTp5tgGF+gm/2ouXK9TgqWVnA0Vw2vDCKwzfaROBQz3VIJnlq4qGmf52oaDgvAbsRJ/lVPuxNUJHRXV4fEu9/0X/WTesHAxspETKicblo9CREKJzWJjnxZHLtdGEEDladPO3OsUiMUriRXR6Jt0BxVE+22L6G6NS/JQfTdqp3Y17qHYGRHDhug20iqSg3lt+/UG/njGDE9eQ+Xrh6ul5CHFmFouzRL2pdnZpci+KebKGqCRP2h4kWroOS+uh0XhCBwZW66uQG+5/E6Hshn7Lk1TpaCLpf2+gvBYpPE9/2Q+nUkF4yb0jyhgVPH2an8jNrSQJL8MHDXUVYHVk6UVfZ8fIDg3ccTGJAncK1mS4xrEPEMz4O6MZ6UBGf/1ByN+E2XMsgezQ8mcQn3uPbSpkYSGEwSkvyOWJy2QfKFMyefpNV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39860400002)(136003)(366004)(31686004)(478600001)(36756003)(2616005)(8676002)(2906002)(956004)(66476007)(66556008)(66946007)(44832011)(6486002)(7416002)(5660300002)(4326008)(83380400001)(26005)(38100700002)(86362001)(186003)(33964004)(107886003)(8936002)(316002)(7696005)(31696002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0dCZEp5ZU1ZRDZ0VlhHYmVaV2dIWW9tNUNnY2hNMXU0QW0rcmVBNW8xTlYr?=
 =?utf-8?B?aHZTM05RZUNDZ2g3cnI3TmtjV2RvVlYyV3lhRmFVY3lhNWczU2xxM3YvSnF0?=
 =?utf-8?B?b3FuYkQzRWV6QkFkNkZ3bTJDVnJNdCtEQStUNWh5dHBFVmRic3hucWpsdjcy?=
 =?utf-8?B?cWdQTjhGNXQ5N0llYUN1bHR6RWNJVExodUw2QUhEa0dRSDRibVNFWXBTa0pZ?=
 =?utf-8?B?WUdtSU5OR3ZsQ3JsWCt2K3JxcFN5WlZudS9JYkovb1RYbkZhc2pCVVhGZlZ3?=
 =?utf-8?B?WWFIdUk4MkNYS25NY3M0SFlNdnd0VmR1RnFyZThvS3oxaTNnbXVJTEJ0S2dD?=
 =?utf-8?B?dEprMEtxVTFzZTNUemUrWk1IUUFvK0pPditjTmFzVWtnUUlwUlZTU2NHK2NW?=
 =?utf-8?B?U1NjUFdKU0l5WkpZRDlIWFRJbFByU1p1N2swdnhsWENkZGxWOGhIWG5QTkZC?=
 =?utf-8?B?U2JmdzI5ZStkZUU4TUcrYSt6S3dKUk1pZVJ0cDhrajdkSElDYzV4RWhCck92?=
 =?utf-8?B?Rlp3NWxxbHhKVVVvanFkNUxZVlhvRW5YM2lJZXRqeDB5U3YvT01hVzJsaHJ1?=
 =?utf-8?B?WHFGTWVySEoxVHJONElidlFYR3dnOSt6eFY0bnYrWjNCd3g4UVRkYnhBMWlB?=
 =?utf-8?B?eXVBTG41ZEJESlB5em8rWEw1UTZXaExFR0d4c1ZmcUxubEFtUWp3OEx3eEVD?=
 =?utf-8?B?aHNyZitSWW50MTBuUzUrbTRaQ0VtcXozNDVNczFTZmtsQTlmUUZlbFVLQmx2?=
 =?utf-8?B?eHVlTkNUZHZTeG1YR0o1SzNpRW9pbDVKbDBpZ0ZpeC9nUk04dGk3SmhGWDNW?=
 =?utf-8?B?Z0VDWmNnRncwNWJwOEtxWE5xS1czbUhBR254cjZmaTdpZzdkVWtSdklXN0FY?=
 =?utf-8?B?ajVZbkVSeDZjdlBlWStrNlJRTFRJcyt0LytTNUVURzFiYWU2WmdjZ0Q2eWNR?=
 =?utf-8?B?c3JrckJXVitvRzdhWGs0WjZ1U1VORUh6NUNpb2tSS1FQVVQ0a05pZmVXUng2?=
 =?utf-8?B?cU1uaGhrTEo3eDBYTTJaUDNXOFZ4RjlQczlYWXRMYUgyL0dMeWZQRU9uQWRa?=
 =?utf-8?B?Qy82QU5IZWowUjVPNnhoTmVpL1hkWkQvc0Uram9oSnRkckF1OTA1M1lkSzl1?=
 =?utf-8?B?MnAzeTVsZHZ1TTZpREFKRWY0N3hmTlVjYjNiUW84R0lqU0luQWJHWVJZbVhq?=
 =?utf-8?B?dCttQStWMDdRbURZM0FCczRueStneEtjY0V6eTB6UGVLcFJaR3EvS2hIbHBD?=
 =?utf-8?B?ZVpSSzdNV3lHY0U1MnVFQy9MdmZoZXcvditVRXg3SERlYTMxUGZzYS9xeVN5?=
 =?utf-8?B?NXI2OUpmeGJFME9QTi9vaFpGWm00OUxBNFY5R2lPaDRxYVBCZkVqeFV6NzRC?=
 =?utf-8?B?VkE2T0VHSjV1QldLUllOZFc2RWcrM0pWYXR3b0wxOHpBZit2czB5eEtJZHZa?=
 =?utf-8?B?TjRXdXBlbFZMMkRVQitMQUtROUVTeG9DK0RvelgweHZBbUdRSGFONTJFOCtP?=
 =?utf-8?B?cUxxN0wxZm5QTVBFS3ppSEl4NzFSSHJpQU9iem1pYXRWMkx5MHJmMWYxaFdL?=
 =?utf-8?B?RVgwakU0a1JobG1nN1ZySmVKWUZ2SGs2cmZPWHppOTlZcDhwbHN0RzZKZ2F0?=
 =?utf-8?B?M3NOV2pJa0pUVUoxYlFMM0tyaW5aUVMrbkJ5cmNnSzlRSEVIU2ZweTFtbUdq?=
 =?utf-8?B?N082UlF2Y0VyS0NLL3I5bE05aHp0bjkxM0lBZ2lxY3JOQXZzVmtpKzJMVjNr?=
 =?utf-8?Q?JpvEFJruUrK5aNRly85f6gJBh5/o50sNuFOh4vM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307ad0de-5411-45c5-906f-08d94c250355
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 08:53:30.4977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ECL/a1qpO50Os8bd/zX0huwdpKes9AhbBWks3PP6F8BO6VZ7uHQinGz2N/GT1eVCIuEysG7+L5xZkHs5QOoYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4679
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10051
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210048
X-Proofpoint-ORIG-GUID: icXVfsohqMDCnb5xw5dgQDIEBdCEPkH9
X-Proofpoint-GUID: icXVfsohqMDCnb5xw5dgQDIEBdCEPkH9
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, armbru@redhat.com,
 amit@kernel.org, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, si-wei.liu@oracle.com, marcandre.lureau@redhat.com,
 joao.m.martins@oracle.com, mreitz@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------584B59E288F4AF6299C9620F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason. My apologies for the delayed response, several work-related 
things came up recently, but they're slowing down now so I'm turning my 
attention these patches to get taken care of.

A few questions and comments below (and in other following patches):


On 7/13/21 10:42 PM, Jason Wang wrote:
>
> 在 2021/7/12 下午6:35, Jonah Palmer 写道:
>>          Dump the information of the head element of the third queue 
>> of virtio-scsi:
>>
>>          (qemu) virtio queue-element 
>> /machine/peripheral-anon/device[3]/virtio-backend 3
>>          index: 122
>>          ndescs: 3
>>          descs: addr 0x7302d000 len 4096 (write), addr 0x3c951763 len 
>> 108 (write, next),
>>                 addr 0x3c951728 len 51 (next)
>
>
> I think it would be nice if we can show driver area and device area as 
> well here.

Sure thing. And I apologize if it's obvious (I'm relatively new to virtio), but how can I expose the driver area?

I understand that virtio devices are part of the Qemu process, but I also thought that virtio drivers are in the
guest's kernel, which I don't believe I can see into from Qemu (or, at least, it's not obvious to me).

Jonah

>
> Thanks
>

--------------584B59E288F4AF6299C9620F
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jason. My apologies for the delayed response, several
      work-related things came up recently, but they're slowing down now
      so I'm turning my attention these patches to get taken care of. <br>
    </p>
    <p>A few questions and comments below (and in other following
      patches):</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/13/21 10:42 PM, Jason Wang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:11b4c5b0-e595-2b86-2dab-54e821e47ad2@redhat.com">
      <br>
      在 2021/7/12 下午6:35, Jonah Palmer 写道:
      <br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dump the information of the head
        element of the third queue of virtio-scsi:
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (qemu) virtio queue-element
        /machine/peripheral-anon/device[3]/virtio-backend 3
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index: 122
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ndescs: 3
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; descs: addr 0x7302d000 len 4096 (write), addr
        0x3c951763 len 108 (write, next),
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr 0x3c951728 len 51 (next)
        <br>
      </blockquote>
      <br>
      <br>
      I think it would be nice if we can show driver area and device
      area as well here.
      <br>
    </blockquote>
    <pre>Sure thing. And I apologize if it's obvious (I'm relatively new to virtio), but how can I expose the driver area?</pre>
    <pre>I understand that virtio devices are part of the Qemu process, but I also thought that virtio drivers are in the 
guest's kernel, which I don't believe I can see into from Qemu (or, at least, it's not obvious to me). 

Jonah
</pre>
    <blockquote type="cite" cite="mid:11b4c5b0-e595-2b86-2dab-54e821e47ad2@redhat.com">
      <br>
      Thanks
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------584B59E288F4AF6299C9620F--

