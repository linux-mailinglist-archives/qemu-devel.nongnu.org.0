Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD123C87E7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:44:53 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3h48-0003bm-5b
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3h2H-0002Wm-O5
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:42:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3h2F-00026C-By
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:42:57 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EFfQNb012560; Wed, 14 Jul 2021 15:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ERD51bE68XaXIilh+hjgunIszy0o2G6A6xsqQQ6kFPw=;
 b=OQGjejbmc+U1P8D5n352DA0xEHr8y4r6a/jPLtJwhNSroAtKha+kKtXXVPA2FJMf29Sl
 JRoEIYT0c/ZpJcf+LuIHkPt0Umfy1d2GBCs+e7DnO68LMKfYXbQNoDPTHhX22X+qRC/P
 qMgOalq7UXnPw0+ejwZLT0iCPQVm8HKLHvLDymM01Hnh3+veL4Bew0yyjJRH3iea/Cff
 V6gOjdUUIfUU80IZdga+Y3Bh1Lgm/sArzfOSIEqvlp/+eF+zxVLS07pd9P3PsGwfwZo2
 NEgAkbi8WHGwcvhHPI7WzyhKWHVjuwy+AA+GiQZoprkrlQkH9vtoleU2XOCn8M8M51lD wg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=ERD51bE68XaXIilh+hjgunIszy0o2G6A6xsqQQ6kFPw=;
 b=DqO9djoz8nVIp4g2ypxzjb9wO/S2ljvIR7X07Kw24M0R6sEobSAIVtZGpwSm05VzgmgO
 TFqeJbNOwdaYgoRec6ktgTSxNuEfnTm1gifgm1Iz4Opn5N+jS5ksrDNFkcLJn/D87mel
 4LKxjedQjHwV9iVy1s8UZctN/Hsu7THqcUcJmz7fxAO4hxS3nje1ACLLoBSQNDuikVdT
 0/xYd1yL4Omeki/WaOjVxgCqAKrQVqDrvgwRDNczjwNmf9aeife2lQwQ2zCTdKj7XiMB
 4jNsG2K5Sc34hphucANo3VH9p0b7p2Yz++hQaFqUNua9HHHZ/Iev/6brTXKvEe+fil0b mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqkb54gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 15:42:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16EFf0T2078334;
 Wed, 14 Jul 2021 15:42:50 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by aserp3030.oracle.com with ESMTP id 39qyd0wmpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 15:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCytqBeGd+DoOVME4tBOY4Yn0WcJaHPxQLrQ4yMLL/G7Gn5YEokxipU0TFfivfbTnMz4Drg1N3U+hwOzQ0/XjyyebfG91BND97yPhH4e3m1A5W3Njt8XXnCFS2l2j40bl2HyptjRfafHRFAyd7H/iHbrorgY6u7c6JeQDgku5LnL/kMwSbaKqI5ePQeLArj/5dcis7S1ODP8+0HeCZDrxCBsDVoz/KOVTTNjp7RCmTXD8kbJuYrCy9Mctv+91USKXbVK1p6zAIIMPDgUEzNFb2iNzJrbwRpVqJPwEDhfeiJtKiOf4zNul6c1UE7f8BR8HwPHEsleu5/fc90BVlkM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERD51bE68XaXIilh+hjgunIszy0o2G6A6xsqQQ6kFPw=;
 b=hyaf7YOkIMg6OKqA5P1eCONkfQVkPPrt+HmQ/ncOQonVcVSwzp6EzbNvhVbqEC9RBicyGYxNWrU/NCdkbSQpDlTo9y2F7ddj5+Gge6sqwod3O5qCnsorZ51/bkck6dPGoc14uvW1ZBqKv+kpED4WggnQoYOMAGAlJgmbwshwXFTCbq+/p3ppnbawN1yn/WtLf+dBoIab3iUm172+pmFv0nrO2KSlC9/iEJ0a1r0IOkZn9ifqGszL2nKYpyp/jHZClwPiJY2vH5TNgq2r5GW7S3cEANoQ7fLOXiGPIEbhN8VvECWujszdcifI6Hbl6C9Z9kSc4kSQ2DQ8YaX7mRg4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERD51bE68XaXIilh+hjgunIszy0o2G6A6xsqQQ6kFPw=;
 b=NXRf7eBjxjE18Dk8VPUbTCKG8yZb1wMDOHok4Ehd/zgbHVj/+zaNGZDYMEgXrz0SW6EIi83O0LBEghyOdjiVGSoYKkJ4CQ/Y+AO1JDreOyq2zL2NWGB3idbTWCvz9KSBbtfXdsO9n6dutufDkHRnK8SjQ1qIZ0u76CCc7JgyzPs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3542.namprd10.prod.outlook.com (2603:10b6:a03:11a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 15:42:48 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::fd75:49c3:72bb:ca64%5]) with mapi id 15.20.4331.022; Wed, 14 Jul 2021
 15:42:48 +0000
Subject: Re: [PATCH v3 1/3] msix/hmp: add hmp interface to dump MSI-X info
To: Markus Armbruster <armbru@redhat.com>
References: <20210714004754.22243-1-dongli.zhang@oracle.com>
 <20210714004754.22243-2-dongli.zhang@oracle.com>
 <8735shmorf.fsf@dusky.pond.sub.org>
 <ae859cde-5d56-01f8-4ef8-bffce9303ff1@oracle.com>
 <87pmvljknw.fsf@dusky.pond.sub.org>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <aeaa70ea-00a2-9335-0d72-2fcb6a3ca419@oracle.com>
Date: Wed, 14 Jul 2021 08:42:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <87pmvljknw.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0046.namprd16.prod.outlook.com
 (2603:10b6:805:ca::23) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::7d72] (2601:646:c303:6700::7d72) by
 SN6PR16CA0046.namprd16.prod.outlook.com (2603:10b6:805:ca::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 15:42:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cf35c5c-8e07-4120-4ee7-08d946de07ed
X-MS-TrafficTypeDiagnostic: BYAPR10MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3542138C9E75B350F4CD53C4F0139@BYAPR10MB3542.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkS2cGfcOqjSdDCQFidm0gRemMB9+4GitXs2WqlLffqXS1mytnxpSoeZnzd/U8LlnXWcCmiFosBSNfJQytAfvi7+/Bay6HVw19tSUasi0x4+XLvZJyYITklXjD8hzSjdOPhHKGGmkqUA3VsR1KK6lSLQh2sYTcUf3deMPv2Dpp+qGIPZOK5zTajAhTtxcN33JbO6d8mJsJIjH+awQSr6nX+5z/xNUbccXEIsRFPYqddXft3/rjv32FXqc/pV8FjHzp72E9aiF7cAf4/NLAQ8W1DTMScFte6/FC/tigdh6g/qGvXqpLJdtfbnEDu1sX96e3u0VMHd4kTwQnBIQAL3+md3CGITc/My2mK/P8AAfbAMVKI34qIE9ZAe8rUdPAFkP52GyfdN9iaLRP31mQhFihvoXuOglQjwDvjnGolbjvUsPXpG7u+EDQXn3v5pv7WemzRtf/YFT0jVf6OZ9MAwnaFJ3UCiL+5K5PZakhWCpqfFdG1/275hmD45lVfpahXetoBF3eiBhxTCqA5ORv6NzVHxbZmITyNx9nKeQztKHT0bcMOIOsRFRu0JG2dW9KQFBZu5ukMHd0MFOsUI3TJoAp7Tsv3LrbVQnBCpFR7wlLkA/otj7hNUk2g+PrjX4HBO0wwljDjhdG3YijQgerdCCtidBgxonN/dsqxVO25XM1ek2czAD0Zz/bc4wCsVPkShVvEltHE3y6KrGkOX3C8w9R/Nc++lcbwe86O2ZfiGDF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(396003)(39860400002)(66556008)(186003)(66476007)(36756003)(31686004)(4326008)(316002)(83380400001)(66946007)(31696002)(6486002)(86362001)(38100700002)(2906002)(44832011)(53546011)(6916009)(8936002)(5660300002)(2616005)(478600001)(8676002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUwyVnl2d2pPTGh6OERqR2wxMVc4MW4vU1crWUJSdzRpY3JvMHA2cFdGeXdy?=
 =?utf-8?B?ZHJyMlk5L0tUcGlaazhUMm90UU9HcDlBOUpJNG5kdWlFaENlSmRBcFBxVjJ3?=
 =?utf-8?B?SGdDQVFyWGhsVVBFbmw1SjI5QUtpekZuZ0lNY1ovYkczK2E4eFRWVTFrVHI0?=
 =?utf-8?B?QSszQkc5ME50YWpuaUhMYlUzdXpoZnVnTVh3QXJVeUhHMWUySzRVTERPRzRH?=
 =?utf-8?B?VnZTVmNjeldwNUc4MHRPQmh6Wk9Qa2F6Y2ltNVNjM3U3NVlQeDNydXZidGcw?=
 =?utf-8?B?MDdocWlrYVNmYm1FZ0F1N29PSWhIVThjUmdKeDE0aXNxQzUvS0JKeldFem1r?=
 =?utf-8?B?cW9KdXlKM2hnb21taDVRQnY3VG1XV1FZVmR0ajdBdGEyUUtLUCs0TU5JKzEy?=
 =?utf-8?B?a0NjdzZMN2R6dUc2TGpoOFpWSFIrZFFEVXRvcElnaFNvbmlBd0pBVmxtN0xW?=
 =?utf-8?B?UmczVzdidjZ1RE5mWDZpOXJ4a2N0citWT2VUMm9kRGZJeGlQSTdvL1dtNzdB?=
 =?utf-8?B?OFNteG5LdjlJNm1YZlQ0Uk5uTTRTVGJYSFR6N2U4QzhnQ0FBb3pOQ0IweDM4?=
 =?utf-8?B?VElnRnkxekpuTzdEQ1dHR3lBOXZNT3F6cVlzZTlLR0JIcm9INUVGQzFDdW9J?=
 =?utf-8?B?amppL1g0OC9PZ1dvaWxxLzRHUmplQ0FhaWV4VXd5aElLZmx6cFNVa3RsMno2?=
 =?utf-8?B?ei9JcGg5OWxreTBDNWE1V3I5SGpIeE5Sd2hIcDVWL2toV1dJUEZrQ1NXenNG?=
 =?utf-8?B?WHlJaXhUa29HMTZ3RHZrM3dQemVaN1RkenpvWG5PNDZmbkR2ZnBYSmZBZVhG?=
 =?utf-8?B?UWtCaEJoVlVjUEpMNDVoYld1bVoxQVl5L2VvaURZZHFyTkd2RmdpYS9GL3B1?=
 =?utf-8?B?TG1GNnZBVHp3WnZvL0hEcUEvMmVrekgzZC9RWVRvQUVPRUVacTl6eVR0Y1F1?=
 =?utf-8?B?UG1idkhleGMzL3crcVVBZUcyVmpuc1ZLU0lDaHBJcE9yemovVUhpQVJzTWVW?=
 =?utf-8?B?cUFYc1RPYUw3c08yeTYrQ0k1UzlvRWs3Q2FnaE15Q1A4cDdSUjNCZVdDYTYv?=
 =?utf-8?B?Vzh1VTMxQVV5YWZDTzlOSGlja3VHMWFWK01HS1NOZzY1dFNsQzQrdnNGOUhX?=
 =?utf-8?B?SEoydTBnbXY0WENhcHdUYlFtT0RSeVovakRQdG5NQTBCVUF1bStzRE56TEQv?=
 =?utf-8?B?bzhSdEg3MUxqbGI4ejJrY3ozbHFrb3ZzcUk1V1ZIYnVIdEMySFdrMHlGT1NS?=
 =?utf-8?B?bkF6V2tDY0ppRkszQXNpUVdvTi9zTyt4RnkzaXA0Z1dtbi9Hd3RyNlpJNEhx?=
 =?utf-8?B?WndLVVppVUx5dFB2S1dvM3ZkbjJNL2dJV1pNdnk0WlZzZnFMNlJyb2RkR243?=
 =?utf-8?B?ajVJOStDbWY4Zk93V2RoV2JFTnkyOEdIeEZYRmtCRUlLVzREYklVdW9zSmlu?=
 =?utf-8?B?MVBIZlNod2t0Y201OWV0eERJT0hXVWE2di9RUW8xN3U1ZmJvSloyZlJ1ZDlJ?=
 =?utf-8?B?WTk3NlEyTDcvWFU0aVc1bU5zeHhIN1YrQjVuSzNhcEIzVE5NYnJ0S2w5Slhk?=
 =?utf-8?B?RG1TTExuZW1TQmdzMGFFZFlyNGN3ZFkvWUplUlphVmE5SUM4QVcxTmwxVCs4?=
 =?utf-8?B?YWlKQ1ZNL0ZjZlhGK0JXc2wvS3NqdmZ4UmRCOGZaWkk4bnRndFdWNE1zV0VO?=
 =?utf-8?B?MVdxWU5rY2xuTDZyVEZjTG5hUjJwUmtkblZTdTJaTmhyT3VNdHlWY2VnZEtC?=
 =?utf-8?B?bWhYZXFsNjk0dDQ5M3hEMEpKS2tiZ0huUlo4dzFxSzhZbHhER1BNMXN2VWd1?=
 =?utf-8?B?dVNxa2c5dGwxWXRZRzBMdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf35c5c-8e07-4120-4ee7-08d946de07ed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 15:42:48.1051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfI9L+03U9DTrMC+NdyG3McP3Rlrs4Rzq3SarY4bIE4D/KPMTGqATroeJDG/A443uhHffY5FtdqPHCLjHA7Jjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3542
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10045
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=843
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140093
X-Proofpoint-ORIG-GUID: b_mSUehSO19aa2PQu3DRqtdK3dlMlrN8
X-Proofpoint-GUID: b_mSUehSO19aa2PQu3DRqtdK3dlMlrN8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Markus,

On 7/14/21 2:42 AM, Markus Armbruster wrote:
> Dongli Zhang <dongli.zhang@oracle.com> writes:
> 
>> Hi Markus,
>>
>> On 7/13/21 10:46 PM, Markus Armbruster wrote:
>>> Dongli Zhang <dongli.zhang@oracle.com> writes:
>>>
>>>> This patch is to add the HMP interface to dump MSI-X table and PBA, in
>>>> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
>>>> vector is erroneously masked permanently). Here is the example with
>>>> vhost-scsi:
>>>>
>>>> (qemu) info msix /machine/peripheral/vscsi0
>>>> Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
>>>> 0xfee00000 0x00000000 0x00004041 0x00000000
>>>> 0xfee00000 0x00000000 0x00004051 0x00000000
>>>> 0xfee00000 0x00000000 0x00004061 0x00000000
>>>> 0xfee00000 0x00000000 0x00004071 0x00000000
>>>> 0xfee01000 0x00000000 0x000040b1 0x00000000
>>>> 0xfee02000 0x00000000 0x000040c1 0x00000000
>>>> 0xfee03000 0x00000000 0x000040d1 0x00000000
>>>>
>>>> MSI-X PBA
>>>> 0 0 0 0 0 0 0
>>>>
>>>> Since the number of MSI-X entries is not determined and might be very
>>>> large, it is sometimes inappropriate to dump via QMP.
>>>
>>> Why?  What makes HMP different?
>>
>> Here are two reasons.
>>
>> 1. The size of MSI-X table is nondeterministic and might be very large, e.g.,
>> the PCI_MSIX_FLAGS_QSIZE is 0x07FF. The "info tlb" (which is a table and similar
>> to MSI-X) and "info lapic" also only support hmp.
>>
>> 2. The [PATCH 3/3] of this patchset support device specific data, the
>> definitional of which varies depending on each device type (so far only
>> virtio-pci supports the interface).
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
>>>
>>>> Therefore, this patch dumps MSI-X information only via HMP, which is
>>>> similar to the implementation of hmp_info_mem().
> 
> I think you're mixing up valid and invalid arguments :)  Let me try to
> pick them apart.
> 
> 1a. "Command output may be too large for QMP, therefore provide only the
> HMP command" makes no sense.
> 
> Both QMP and HMP are not meant for bulk data transfer.  They are control
> plane, not data plane.  To illustrate what that means, consider a backup
> feature.  The commands to control the backup task are QMP (and HMP, if
> desired), but the actual data transfer uses some other channel, so it
> doesn't clog the QMP pipes.
> 
> If the data is too bulky for QMP, then it's too bulky for HMP, too.
> 
> 1b. "info tlb" and "info lapic" are HMP only because they are debugging
> commands for humans.  Debugging is not necessarily done by humans only.
> Sometimes, humans use programs to help them debug, and these programs
> would be better off with QMP commands.  For the HMP-only debugging
> commands, we decided providing for (largely hypothetical) debugging
> scripts wasn't worthwhile.  A similar argument could probably be made
> for "info msix".
> 
> 2. "Output is in part specific to Devices, therefore provide only the
> HMP command" is also iffy.  Yes, hacking up a bunch of monitor_printf()s
> is probably easier than specifying a QAPI schema.   "It's work" is no
> excuse.  "It's more work than it's worth" can be one.  But then we're
> back at argument 1b.

Thank you very much for the explanation!

> 
> Your commit message's first sentence suggests this is indeed just for
> debugging.  If this is the case, consider replacing
> 
>     Since the number of MSI-X entries is not determined and might be very
>     large, it is sometimes inappropriate to dump via QMP.
> 
>     Therefore, this patch dumps MSI-X information only via HMP, which is
>     similar to the implementation of hmp_info_mem().
> 
> by
> 
>     Since this is just for debugging by humans, provide the command only
>     in HMP, not in QMP.
> 

Yes, this is for debugging purpose. The primary objective is to confirm a
specific vector is not erroneously masked permanently, when a specific device
queue is stuck.

I will replace commit message and send v4.

Thank you very much!

Dongli Zhang

