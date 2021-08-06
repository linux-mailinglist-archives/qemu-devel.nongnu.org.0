Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F213E3045
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 22:19:20 +0200 (CEST)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC6JK-00087E-C4
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 16:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mC6IR-0007Sq-KP
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:18:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mC6IO-0000Yq-7c
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 16:18:23 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176KHsB4000817; Fri, 6 Aug 2021 20:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=aQGhXiKALL8G8zQEX6SrES9wk20dbCHMX9uZ6+7Mj48=;
 b=d4hYWyzQkLM3q2xZlitPlFEtdukyHWOU++IJdoRhGWJaqJMIM85BUtHqjzcXmEd/Km8m
 SLC75UlsKqQS6oVZsRm/wX8ENKUxtYCoH+PIcKQU6yscInGvTydmUDHqSIuRpfJFBS1D
 pRbb/WFyNCmqrsdhnOkjLdfpDO6caGUqiaZ2nq3hcJ8IxRpDiQQPqoOmjrCMaSdxzB5W
 jhFIMKISSQqdlyt+6s2FeUj1JI+J56dA9kt5U9ICp5V8ngsPJCYhxz3zJLhGccVtgfPt
 w0VWUl+mzSGhwPXaLqiZuxFFHGZitTfFNKI+msEwiPa/uZhPNOOb0gQh4tRKMHxM7FFn Rg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=aQGhXiKALL8G8zQEX6SrES9wk20dbCHMX9uZ6+7Mj48=;
 b=ufgSU6pFPrYJc2OX9DRjQ24shS2hUNAJwOclk6DOgfTitNsQOUukTSu+9zwVpzBoPgOp
 XfbWMKP4CTN+um7uUTjlpqgWVlnfP7sFazrML8BTO1F2MAcnyHHmwUrXwusYmHY9OFQh
 hk1TcQo+tIQskjcNkDjapvUh1O7FVq6lkIOfVK8xdtkbsIXN3RQTCozpz29aW6RFkj90
 u08yyta2K8ZmFeyh3uutaC8GKnFB0SGhC4dKjBxA7sE0qoUp/4OHl5kdYbcK2pbkNoX/
 8w35Zk9oS5gpQh9hzeTA7V9l3mYvqD08ZAo5hJX5lrRJ+rkO+N67HPj6he1nCuFI0gQ7 bA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a9661rv1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 20:18:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176KFfJF073702;
 Fri, 6 Aug 2021 20:18:15 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by userp3020.oracle.com with ESMTP id 3a5ga2v3fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 20:18:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwocylj4+UTKsfppeDxmnBlGkKGWgJ6zblFft1tYczlTpwhoH0MWM5yz9phsY+v8nST752Ml56ka2VwpY0HXyNB71/hWUVfPyo4AwvPZl4880Y64dV1KZ0VTEp0pEXpSMKMJkI5i/fTqQspCISqPJiscuBGUzvDV6OTYt73A1o1PODJPuZ7iB6td1ZqwCWNBIOf01iLOOCj8xG6cZRa3FYrsJniuMLpEh21/mLqOPc9mfmhPE8T/54VVkVhcXJORDhwVcoR9klVNtUXJrlZamahxhd/kJifE1ATEhCsLXOlIfkr3jjgq3A7bdofGo8DoWx+QwOr9MgsLAJRuk1Brtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQGhXiKALL8G8zQEX6SrES9wk20dbCHMX9uZ6+7Mj48=;
 b=RyU5QZLnVHmBUJWP3aR5MAiyJNpQTjIpftaO5D5dr/TuMTgSxXLCjTrxcBZcwegIJZLK1Okq1a0stkQmmIHzyVNxdIVd1xphvx7Tbw4fViw362wjGVVbvXoMFx0uHe7mUDhdUbJ2pYx5FeXwI9p3XUH2Tg0NNITd/jy+mCV1QCZweGpgTGyY3qAEaK1p4HGDCGzUBORXGx4zN6LSWPUzlbs9zVrbMZCwUnBzLnpG5AiLxSbhTJEAl6Kx/IVJsWW6Urupx4y29B62mBxrMpgaMFWo+MHMqZ72hYY6O2vYMY1Zt+LCc5YTsxpT2JvX0UGOJbtoW7xRaD3Kz/mc7zIbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQGhXiKALL8G8zQEX6SrES9wk20dbCHMX9uZ6+7Mj48=;
 b=Raodv3JrCoXRyXTJbYsvWyr28gbFofE2zi9kuEtSedBA5DccCbYXdi49WXFyhNhHRHnX6KjOa+mwbYg/RYlcqCdSm1RlSIyuuQEfxR3YSt8CJsiBjBY/59Al7yCk+qASCsGamd1VHwjSb11yLQgRq7/BLIf30Dk8z9dbWW5oECA=
Authentication-Results: twiddle.net; dkim=none (message not signed)
 header.d=none;twiddle.net; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DS7PR10MB4879.namprd10.prod.outlook.com (2603:10b6:5:3b0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.19; Fri, 6 Aug 2021 20:18:12 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::b5fe:bca7:2b78:f1e0]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::b5fe:bca7:2b78:f1e0%6]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 20:18:12 +0000
Subject: Re: [Qemu-devel] [PATCH] acpi: Add emulated sleep button
To: Igor Mammedov <imammedo@redhat.com>, Stefan Fritsch <sf@sfritsch.de>
References: <1500543086-26588-1-git-send-email-sf@sfritsch.de>
 <20170720165957.743ccf1a@nial.brq.redhat.com>
From: "Annie.li" <annie.li@oracle.com>
Message-ID: <1a70f9be-e3ca-7311-a078-f55fe56ad0f3@oracle.com>
Date: Fri, 6 Aug 2021 16:18:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20170720165957.743ccf1a@nial.brq.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN6PR01CA0009.prod.exchangelabs.com (2603:10b6:805:b6::22)
 To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.104] (73.69.1.191) by
 SN6PR01CA0009.prod.exchangelabs.com (2603:10b6:805:b6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 20:18:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f0ee87b-3c0e-4ad0-feab-08d9591750da
X-MS-TrafficTypeDiagnostic: DS7PR10MB4879:
X-Microsoft-Antispam-PRVS: <DS7PR10MB4879DEAF795DEA27611E9F8BE5F39@DS7PR10MB4879.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUgebKYCtxUefd5STsgXsMVGLZhOdu3PAyEpKtjF11VEUyGuBI0zpTHZNRZSh+LgNJSPxRfAqlIRvZsvPQJYN1qL72OVVHMRr9rdzyDmUrtGe/fYjdPsbk510nnl6gi79ku3q/jya/1acU9XOoMvOnVXKcG4Pq0jeaeJBDM546X8Cpfz0091HsPgWLYePs2xsuXuXLvZmFyoDhygN7v5xbZIgrG9zMDHp9k1snykU/2VbtIFqGLatgWAPzmW3xjz73S8aJX0f2lXKAdP0biIcQrZP/EhVmPBmqo81FXaLHcA6ODsMU3U2gLQeBcQR+SKs50vUvaKAfxSypXTlRPJ2AR55q5hFD4ePPbMA5EdyiUpxv5gM2B+95oYWARUKcxsnpmpUow0tiYJiP+d3yNQr4c1xxDo41yr3FZmof425kgJe8MmjFzu8FIgXKeDnQVFoFnADQR/UFMW4brEmMkdlxigyAMgwIQWfP/n9X9dIM9uq9KyQ3p3g5MoMTYrOjb78zSGsF3H2y4QbmQJfXRwld5vs6jkwg9prp+w6amsLrgYkj15nClkwiM3ExbTov3C/tFdiy54WU1e9wZwQX3kX0/XonYOnZ0S2qWVzAtiOuxjugJyWDdrZ3Dx0cU+T+mrn00g3myU0X535Cq8A9vyFBUuEn4Tfw0p2X1VgVG0sqqvkvi8RPCy/ly/X92MJQsb/cQtz7nMu7QCmZ3J1vdFSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(376002)(136003)(346002)(31696002)(30864003)(36756003)(5660300002)(31686004)(38100700002)(8936002)(53546011)(54906003)(66556008)(4326008)(316002)(83380400001)(2906002)(26005)(110136005)(478600001)(186003)(2616005)(956004)(66946007)(6486002)(8676002)(86362001)(66476007)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFFTTy9RR24rMnFjbFFqOVZYRXVWZEZXL3YySUc4czZWLzZEaVZnTTVsWi9Q?=
 =?utf-8?B?em45OXM1YjYrdml2NU5zQnMrQ1hRa0REdDJaMXFWRVgyQVRuNHpyQkNVK1ov?=
 =?utf-8?B?bXpuZzZYVzNCVTRiVlJxVGF1czBLd1pOY0praStVUXBpTGhtQ1RzTUI1VU1m?=
 =?utf-8?B?cm9JaFpsbEROdmdkL0VlZ1d3aFlHNklBWmE3M2lISkVkYTFYdlZaZ2srclhh?=
 =?utf-8?B?ZWtRS1dEaXhsYXFWR3dmdkVYVVBsM2x3NnkxV0lwMlVGcU03N2Y3QmVzVVp5?=
 =?utf-8?B?OXB5QkY4MzFhalVNbDFoTmVGN0tIUDd2SlI4Qkk2NUhScWRvYlh0K2FxTzVH?=
 =?utf-8?B?UUgxajVURWRGaUh6ejM3VTE0NFJuMHYvVkJTWWpiRDJzR2Nna3YzQkppVTBw?=
 =?utf-8?B?YnY3UFJFTGxpaDE2cENrUEp6anNqOWd5cGlISHpCcmtvbE1QbElTUjZFNXZm?=
 =?utf-8?B?KytiZnFTRGZjTldEb3hGYkxycCtxN1doUzJnZkpOdUhhNzJVeGUySFhxeFRz?=
 =?utf-8?B?Zk01QmI3bjVwN1lVRmc5M25HMmo1ZmVuN3NQVVRkQzIvNWhxWTdGZGdQTkZW?=
 =?utf-8?B?aGFDMXpqUndHWDhCYjhGNGhqUFBubkRRNzEvYzJKaUFVWUVnS00yR1RWVmVT?=
 =?utf-8?B?RnUwTnhaanpQaWN2eDZnQkhkWlVJeTJtazRNSGN4dmU3dndmNkRTQi9jdkFz?=
 =?utf-8?B?RGxiTkE4eTU3dG5Ta0xnTHo4bkhwZERWaFRIUE1yS0RlaEg4WkNnOTMydXJv?=
 =?utf-8?B?RTBJNFVkdnA3RzF3THFLdmFxYmVCeGlDd3h3VUJxK0VvbzE5M1B3VmRSTlV5?=
 =?utf-8?B?K3cvUTMxZXJJcGlTekhVbnRQS1Zyam40eWxQZWpJSWtjeTA5MUhLRFlyUzM5?=
 =?utf-8?B?UW1YZjZCcFR0aHhBcFVLbi8ranA4SXE1akZNMjdOODBqWGhyaTQ4ckNZdEFR?=
 =?utf-8?B?MUZjQ2NqdFpUYytyNUhhR2l0VzZIZy9neWlTRUVHUHFmZzhmWjhBSDI0TExo?=
 =?utf-8?B?SmlQYVNiQ0M3SzhaQXJLcDczRWswV0U3Z2xURWl6NlI4RmMyaWVXM3J2K29R?=
 =?utf-8?B?cWFEK00zMm0yZXhmZmxOUzhkYUVkVXNpWUplVmZSZkRzaEpJRmZjSDRwbGho?=
 =?utf-8?B?QmRvdDZTb1pNeWxzYTFuU3pmK0hqZ0VvTWxtY2krT1d5VXZvY2VzNGtkMjFt?=
 =?utf-8?B?KzlkdkgyMzFuNjdkbjJKYVljR0NXNllSMSs2c0ovOG8zYmkyNUZtTVIwNllh?=
 =?utf-8?B?Rmp6S3VqZFljVkRxMmI1SVZNVWQ1bTBsOWQxUXc5cTRqeVlzek1FYlFScWJC?=
 =?utf-8?B?eEUyclhZL2tHN1A4bm5Rd05jeUVGNFFFRDhuTVA4b21TcSt3S3F6SGFpU1Bt?=
 =?utf-8?B?cHdSUW5OOHlmejJvUklVVGxscUlDMDNMU3ZhQlJrbzhmN0dBWldUc1RsblMy?=
 =?utf-8?B?UCtLZUhMZnZyNTkyVmhHT2ZveHE5aDI5Y0o1ZVllZUJoZy83N0FZaEpza09E?=
 =?utf-8?B?THlTc1RzU0JTN0k2VGdZRDkydHhVVTd1a0pzR3hGSDM1MTk1YWdJU2h6K1lN?=
 =?utf-8?B?LzZSdXBpV1hsUHQ5ZHBkZjZIL1RTbEJUYitXRlZBZ3VIVG0veHVORnZ0QW9i?=
 =?utf-8?B?VTNUN1AyU1E4SWI1WjVvWm4xellIay9FTUdYTXVjVFpNWHdaOFp1RlBweThw?=
 =?utf-8?B?cEYzRHR3ZXZJRDNGRHd6N1U3QVZkand5WUdKTHk3N2RITWEzUzFjYUtPY3R6?=
 =?utf-8?Q?xpERLk2OVWL+We6wvDML5C5zDzYQMP/Wm7EAiA8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0ee87b-3c0e-4ad0-feab-08d9591750da
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 20:18:12.7273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuSIey42d0+AQRUHqzovpkpeTNcP2qtaTmN4ZmfnmSapl3uXvmtAyjfEE/BKqAr6YSXny1BFNRqLJG44xPQ2Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4879
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060135
X-Proofpoint-GUID: 2w4v1IlFI0IINSB-jzPdHJh_0TbrkNEO
X-Proofpoint-ORIG-GUID: 2w4v1IlFI0IINSB-jzPdHJh_0TbrkNEO
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Igor,

This is an old patch, but it does what we need.
I am getting a little bit lost about not implementing fixed hardware
sleep button, can you please clarify? thank you!

On 7/20/2017 10:59 AM, Igor Mammedov wrote:
> On Thu, 20 Jul 2017 11:31:26 +0200
> Stefan Fritsch <sf@sfritsch.de> wrote:
>
>> From: Stefan Fritsch <stefan_fritsch@genua.de>
>>
>> Add an ACPI sleep button and QMP/HMP commands to trigger it.  A sleep
>> button is a so called "fixed hardware feature", which makes it more
>> suitable for putting the system to sleep than a laptop lid, for example.
>>
>> The sleep button is disabled by default (Bit 5 in the FACP flags
>> register set and no button "device" present in SSDT/DSDT). Clearing said
>> bit enables it as a fixed feature device.
> per spec sleep button is used for both putting system into
> sleep and for waking it up.
>
> Reusing system_wakeup 'button' to behave as per spec would
> make this patch significantly smaller.

About reusing "system_wakeup", does it mean the following?

1. when guest is in sleep state, "system_wakeup" wakes up the guest
2. when guest is running, "system_wakeup" puts the guest into sleep

"system_wakeup" sets WAK_STS and then system transitions to the
working state. Correspondingly, I suppose both SLPBTN_STS and
SLPBTN_EN need to be set for sleeping, and this is what fixed
hardware sleep button requires?

I have combined the sleep and wakeup together, share the
code between. But Xen also registers the wakeup notifier, and
this makes things more complicated if this notifier is shared
between sleep and wakeup. Or this is my misunderstanding?
please correct me if I am wrong.

> If you like idea of separate command/button better, then
> I'd go generic control sleep button way instead of fixed
> hardware, it would allow us to reuse most of the code in
> ARM target, plus I'd avoid notifiers and use acpi device
> lookup instead (see: qmp_query_acpi_ospm_status as example)
>
Do you mean the "Control Method Sleep Button" that needs to
notify OSPM by event indication 0x80?

Thanks
Annie
>> Signed-off-by: Stefan Fritsch <stefan_fritsch@genua.de>
>> ---
>>   hmp-commands.hx         | 16 ++++++++++++++++
>>   hmp.c                   |  5 +++++
>>   hmp.h                   |  1 +
>>   hw/acpi/core.c          |  8 ++++++++
>>   hw/acpi/ich9.c          | 10 ++++++++++
>>   hw/acpi/piix4.c         | 12 ++++++++++++
>>   hw/i386/acpi-build.c    |  1 -
>>   include/hw/acpi/acpi.h  |  2 ++
>>   include/hw/acpi/ich9.h  |  1 +
>>   include/sysemu/sysemu.h |  2 ++
>>   qapi-schema.json        | 12 ++++++++++++
>>   qmp.c                   |  5 +++++
>>   tests/test-hmp.c        |  1 +
>>   vl.c                    | 29 +++++++++++++++++++++++++++++
>>   14 files changed, 104 insertions(+), 1 deletion(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index 1941e19932..8ba4380883 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -638,6 +638,22 @@ Reset the system.
>>   ETEXI
>>   
>>       {
>> +        .name       = "system_sleep",
>> +        .args_type  = "",
>> +        .params     = "",
>> +        .help       = "send ACPI sleep event",
>> +        .cmd = hmp_system_sleep,
>> +    },
>> +
>> +STEXI
>> +@item system_sleep
>> +@findex system_sleep
>> +
>> +Push the virtual sleep button; if supported the system will enter
>> +an ACPI sleep state.
>> +ETEXI
>> +
>> +    {
>>           .name       = "system_powerdown",
>>           .args_type  = "",
>>           .params     = "",
>> diff --git a/hmp.c b/hmp.c
>> index bf1de747d5..b4b584016c 100644
>> --- a/hmp.c
>> +++ b/hmp.c
>> @@ -1047,6 +1047,11 @@ void hmp_system_reset(Monitor *mon, const QDict *qdict)
>>       qmp_system_reset(NULL);
>>   }
>>   
>> +void hmp_system_sleep(Monitor *mon, const QDict *qdict)
>> +{
>> +    qmp_system_sleep(NULL);
>> +}
>> +
>>   void hmp_system_powerdown(Monitor *mon, const QDict *qdict)
>>   {
>>       qmp_system_powerdown(NULL);
>> diff --git a/hmp.h b/hmp.h
>> index 1ff455295e..15b53de9ed 100644
>> --- a/hmp.h
>> +++ b/hmp.h
>> @@ -45,6 +45,7 @@ void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
>>   void hmp_quit(Monitor *mon, const QDict *qdict);
>>   void hmp_stop(Monitor *mon, const QDict *qdict);
>>   void hmp_system_reset(Monitor *mon, const QDict *qdict);
>> +void hmp_system_sleep(Monitor *mon, const QDict *qdict);
>>   void hmp_system_powerdown(Monitor *mon, const QDict *qdict);
>>   void hmp_cpu(Monitor *mon, const QDict *qdict);
>>   void hmp_memsave(Monitor *mon, const QDict *qdict);
>> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
>> index 95fcac95a2..2ee64b6878 100644
>> --- a/hw/acpi/core.c
>> +++ b/hw/acpi/core.c
>> @@ -422,6 +422,14 @@ void acpi_pm1_evt_power_down(ACPIREGS *ar)
>>       }
>>   }
>>   
>> +void acpi_pm1_evt_sleep(ACPIREGS *ar)
>> +{
>> +    if (ar->pm1.evt.en & ACPI_BITMASK_SLEEP_BUTTON_ENABLE) {
>> +        ar->pm1.evt.sts |= ACPI_BITMASK_SLEEP_BUTTON_STATUS;
>> +        ar->tmr.update_sci(ar);
>> +    }
>> +}
>> +
>>   void acpi_pm1_evt_reset(ACPIREGS *ar)
>>   {
>>       ar->pm1.evt.sts = 0;
>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
>> index c5d8646abc..3faeab4d2e 100644
>> --- a/hw/acpi/ich9.c
>> +++ b/hw/acpi/ich9.c
>> @@ -260,6 +260,14 @@ static void pm_reset(void *opaque)
>>       acpi_update_sci(&pm->acpi_regs, pm->irq);
>>   }
>>   
>> +static void pm_sleep_req(Notifier *n, void *opaque)
>> +{
>> +    ICH9LPCPMRegs *pm = container_of(n, ICH9LPCPMRegs, sleep_notifier);
>> +
>> +    acpi_pm1_evt_sleep(&pm->acpi_regs);
>> +}
>> +
>> +
>>   static void pm_powerdown_req(Notifier *n, void *opaque)
>>   {
>>       ICH9LPCPMRegs *pm = container_of(n, ICH9LPCPMRegs, powerdown_notifier);
>> @@ -299,6 +307,8 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>>       qemu_register_reset(pm_reset, pm);
>>       pm->powerdown_notifier.notify = pm_powerdown_req;
>>       qemu_register_powerdown_notifier(&pm->powerdown_notifier);
>> +    pm->sleep_notifier.notify = pm_sleep_req;
>> +    qemu_register_sleep_notifier(&pm->sleep_notifier);
>>   
>>       legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
>>           OBJECT(lpc_pci), &pm->gpe_cpu, ICH9_CPU_HOTPLUG_IO_BASE);
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index f276967365..15e20976c3 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -79,6 +79,7 @@ typedef struct PIIX4PMState {
>>       int smm_enabled;
>>       Notifier machine_ready;
>>       Notifier powerdown_notifier;
>> +    Notifier sleep_notifier;
>>   
>>       AcpiPciHpState acpi_pci_hotplug;
>>       bool use_acpi_pci_hotplug;
>> @@ -371,6 +372,15 @@ static void piix4_pm_powerdown_req(Notifier *n, void *opaque)
>>       acpi_pm1_evt_power_down(&s->ar);
>>   }
>>   
>> +static void piix4_pm_sleep_req(Notifier *n, void *opaque)
>> +{
>> +    PIIX4PMState *s = container_of(n, PIIX4PMState, sleep_notifier);
>> +
>> +    assert(s != NULL);
>> +    acpi_pm1_evt_sleep(&s->ar);
>> +}
>> +
>> +
>>   static void piix4_device_plug_cb(HotplugHandler *hotplug_dev,
>>                                    DeviceState *dev, Error **errp)
>>   {
>> @@ -535,6 +545,8 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
>>   
>>       s->powerdown_notifier.notify = piix4_pm_powerdown_req;
>>       qemu_register_powerdown_notifier(&s->powerdown_notifier);
>> +    s->sleep_notifier.notify = piix4_pm_sleep_req;
>> +    qemu_register_sleep_notifier(&s->sleep_notifier);
>>   
>>       s->machine_ready.notify = piix4_pm_machine_ready;
>>       qemu_add_machine_init_done_notifier(&s->machine_ready);
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 6b7bade183..06b28dacfe 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -294,7 +294,6 @@ static void fadt_setup(AcpiFadtDescriptorRev3 *fadt, AcpiPmInfo *pm)
>>       fadt->plvl3_lat = cpu_to_le16(0xfff); /* C3 state not supported */
>>       fadt->flags = cpu_to_le32((1 << ACPI_FADT_F_WBINVD) |
>>                                 (1 << ACPI_FADT_F_PROC_C1) |
>> -                              (1 << ACPI_FADT_F_SLP_BUTTON) |
>>                                 (1 << ACPI_FADT_F_RTC_S4));
>>       fadt->flags |= cpu_to_le32(1 << ACPI_FADT_F_USE_PLATFORM_CLOCK);
>>       /* APIC destination mode ("Flat Logical") has an upper limit of 8 CPUs
>> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
>> index 7b3d93cf0d..51cf901ef6 100644
>> --- a/include/hw/acpi/acpi.h
>> +++ b/include/hw/acpi/acpi.h
>> @@ -78,6 +78,7 @@
>>   #define ACPI_BITMASK_PM1_COMMON_ENABLED         ( \
>>           ACPI_BITMASK_RT_CLOCK_ENABLE        | \
>>           ACPI_BITMASK_POWER_BUTTON_ENABLE    | \
>> +        ACPI_BITMASK_SLEEP_BUTTON_ENABLE    | \
>>           ACPI_BITMASK_GLOBAL_LOCK_ENABLE     | \
>>           ACPI_BITMASK_TIMER_ENABLE)
>>   
>> @@ -148,6 +149,7 @@ void acpi_pm_tmr_reset(ACPIREGS *ar);
>>   /* PM1a_EVT: piix and ich9 don't implement PM1b. */
>>   uint16_t acpi_pm1_evt_get_sts(ACPIREGS *ar);
>>   void acpi_pm1_evt_power_down(ACPIREGS *ar);
>> +void acpi_pm1_evt_sleep(ACPIREGS *ar);
>>   void acpi_pm1_evt_reset(ACPIREGS *ar);
>>   void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
>>                          MemoryRegion *parent);
>> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
>> index a352c94fde..2073eec168 100644
>> --- a/include/hw/acpi/ich9.h
>> +++ b/include/hw/acpi/ich9.h
>> @@ -48,6 +48,7 @@ typedef struct ICH9LPCPMRegs {
>>   
>>       uint32_t pm_io_base;
>>       Notifier powerdown_notifier;
>> +    Notifier sleep_notifier;
>>   
>>       bool cpu_hotplug_legacy;
>>       AcpiCpuHotplug gpe_cpu;
>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>> index b21369672a..00f54653dc 100644
>> --- a/include/sysemu/sysemu.h
>> +++ b/include/sysemu/sysemu.h
>> @@ -75,6 +75,8 @@ void qemu_register_wakeup_notifier(Notifier *notifier);
>>   void qemu_system_shutdown_request(ShutdownCause reason);
>>   void qemu_system_powerdown_request(void);
>>   void qemu_register_powerdown_notifier(Notifier *notifier);
>> +void qemu_system_sleep_request(void);
>> +void qemu_register_sleep_notifier(Notifier *notifier);
>>   void qemu_system_debug_request(void);
>>   void qemu_system_vmstop_request(RunState reason);
>>   void qemu_system_vmstop_request_prepare(void);
>> diff --git a/qapi-schema.json b/qapi-schema.json
>> index 8b015bee2e..c6ccfcd70f 100644
>> --- a/qapi-schema.json
>> +++ b/qapi-schema.json
>> @@ -2314,6 +2314,18 @@
>>   { 'command': 'system_reset' }
>>   
>>   ##
>> +# @system_sleep:
>> +#
>> +# Requests that a guest perform a ACPI sleep transition by pushing a virtual
>> +# sleep button.
>> +#
>> +# Notes: A guest may or may not respond to this command.  This command
>> +#        returning does not indicate that a guest has accepted the request or
>> +#        that it has gone to sleep.
>> +##
>> +{ 'command': 'system_sleep' }
>> +
>> +##
>>   # @system_powerdown:
>>   #
>>   # Requests that a guest perform a powerdown operation.
>> diff --git a/qmp.c b/qmp.c
>> index b86201e349..bc1f2e3d7f 100644
>> --- a/qmp.c
>> +++ b/qmp.c
>> @@ -108,6 +108,11 @@ void qmp_system_reset(Error **errp)
>>       qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP);
>>   }
>>   
>> +void qmp_system_sleep(Error **erp)
>> +{
>> +    qemu_system_sleep_request();
>> +}
>> +
>>   void qmp_system_powerdown(Error **erp)
>>   {
>>       qemu_system_powerdown_request();
>> diff --git a/tests/test-hmp.c b/tests/test-hmp.c
>> index d77b3c8710..3fa850bf1e 100644
>> --- a/tests/test-hmp.c
>> +++ b/tests/test-hmp.c
>> @@ -67,6 +67,7 @@ static const char *hmp_cmds[] = {
>>       "sum 0 512",
>>       "x /8i 0x100",
>>       "xp /16x 0",
>> +    "system_sleep",
>>       NULL
>>   };
>>   
>> diff --git a/vl.c b/vl.c
>> index fb6b2efafa..6a0f847dcf 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -1608,6 +1608,7 @@ static ShutdownCause reset_requested;
>>   static ShutdownCause shutdown_requested;
>>   static int shutdown_signal;
>>   static pid_t shutdown_pid;
>> +static int sleep_requested;
>>   static int powerdown_requested;
>>   static int debug_requested;
>>   static int suspend_requested;
>> @@ -1618,6 +1619,8 @@ static NotifierList suspend_notifiers =
>>       NOTIFIER_LIST_INITIALIZER(suspend_notifiers);
>>   static NotifierList wakeup_notifiers =
>>       NOTIFIER_LIST_INITIALIZER(wakeup_notifiers);
>> +static NotifierList sleep_notifiers =
>> +    NOTIFIER_LIST_INITIALIZER(sleep_notifiers);
>>   static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
>>   
>>   ShutdownCause qemu_shutdown_requested_get(void)
>> @@ -1838,6 +1841,24 @@ static void qemu_system_powerdown(void)
>>       notifier_list_notify(&powerdown_notifiers, NULL);
>>   }
>>   
>> +static void qemu_system_sleep(void)
>> +{
>> +    notifier_list_notify(&sleep_notifiers, NULL);
>> +}
>> +
>> +static int qemu_sleep_requested(void)
>> +{
>> +    int r = sleep_requested;
>> +    sleep_requested = 0;
>> +    return r;
>> +}
>> +
>> +void qemu_system_sleep_request(void)
>> +{
>> +    sleep_requested = 1;
>> +    qemu_notify_event();
>> +}
>> +
>>   void qemu_system_powerdown_request(void)
>>   {
>>       trace_qemu_system_powerdown_request();
>> @@ -1850,6 +1871,11 @@ void qemu_register_powerdown_notifier(Notifier *notifier)
>>       notifier_list_add(&powerdown_notifiers, notifier);
>>   }
>>   
>> +void qemu_register_sleep_notifier(Notifier *notifier)
>> +{
>> +    notifier_list_add(&sleep_notifiers, notifier);
>> +}
>> +
>>   void qemu_system_debug_request(void)
>>   {
>>       debug_requested = 1;
>> @@ -1899,6 +1925,9 @@ static bool main_loop_should_exit(void)
>>       if (qemu_powerdown_requested()) {
>>           qemu_system_powerdown();
>>       }
>> +    if (qemu_sleep_requested()) {
>> +        qemu_system_sleep();
>> +    }
>>       if (qemu_vmstop_requested(&r)) {
>>           vm_stop(r);
>>       }

