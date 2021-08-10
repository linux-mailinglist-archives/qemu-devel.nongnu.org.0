Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83233E544C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 09:28:34 +0200 (CEST)
Received: from localhost ([::1]:53734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDMBd-00006z-HQ
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 03:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mDM8r-0004JL-NS; Tue, 10 Aug 2021 03:25:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mDM8o-0004Xg-S6; Tue, 10 Aug 2021 03:25:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17A7C9pF025389; Tue, 10 Aug 2021 07:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=8uSgpKve+6SxIoXB2whE03Dq95NCTCTrwO7yfqSJzyw=;
 b=zEmfcIMuLU3rSE2vtBzwU4aCqIQ7osHBVvfQFjFb0cLdSqGSz4eg5taELnHlPjlZtJw6
 EDG/JvZERjM2xmgma8mux5rkxBAAFMIOepo75FtToxmEmkNkn1kxFI/J804R+hLmHn9Q
 mISqmdj3XPADuE+7NpvQszK7jTPsdawx+XHIssg/6D+MpDTz5WQtXq82z4EZb9T/XG+Z
 reAS0wQ1o2asBN0j+U1MS2tU5wGrzqw78eTeW86L4uMf5SYDXwKZtGmEO7+mUtXh/SvW
 lniGe51rxw5hRUx/1l+X/LOUVonqWONWUXVPsOQd9ieJeKYpFrOQjpWxHq4jQc0o8EO1 Gw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=8uSgpKve+6SxIoXB2whE03Dq95NCTCTrwO7yfqSJzyw=;
 b=xOqCGqa9uriJsI+I8ywV98aZX1q3EKvQzxNod9pb/h7tykAZX/Guw0giUWwDEr/NMon8
 cgBdaMjYdJ6Xk+clrINmtqUJG+jJtzk1M+HbZNVvdXBxXBKEW1abEoyw8bc1SjCgZCuN
 nJWsobm5RtuWABZp04luNIQKU6e0YlfOlB+kWI4xLB+8BjPA3VxkIOogxu3I8LWzCcI1
 PbkWeqWeLAX44A2JCQf6fwZf086a0nmqYuSBCeZaMHm6yqxyc9JBt3OMDJn3+YgmRPbK
 8W2LeKA0LKvQd36V86/8yEmjgenF8XbVxOO23IKiyl2gz+PnvF2DrS3JUd9idsBcD+t/ jQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aay0ftw9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 07:25:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17A7GMjn054170;
 Tue, 10 Aug 2021 07:25:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by aserp3020.oracle.com with ESMTP id 3a9vv47xck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 07:25:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShR0TG+VOTIDSnKD6it0yRX7rmoiRreXHhKlPTyYANY02D6Bmfbw+P3kPGswrHlD0u66L8kYFGBLb9Mk07iwAMmrmm68RQZ9IeVwBBXmdTYLWHIr5HcWj6cdW+pCmK4/aCtrXccAGk7/Ok6hhkFX+waRTihvl+RScumL5A3a00zOBoCo4D6WKOconjlH87GTJSzM8zQ5Sk8eBTORFDnlpOQCK3Hu2cbCzH4/aI6I3AFdk8ttvDOjDkigXL0mPaUu8oU3D8y4mRetccOeth+LKkftw82HF3A1z+lRq4Va92x3w2od++fBvZseKV9vPhSUQUl3qPKk5dX5rJy43iQpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uSgpKve+6SxIoXB2whE03Dq95NCTCTrwO7yfqSJzyw=;
 b=neBSdFSiDOXZV6FKWEHlc6NgDVzGrzEpXmGoDLIDX91KeI6MLe80QT6FOTgG2wgkvtPf8fAgY5dkxW17VweGMlqcfhvt7VDX+TeBi0MeJfOfAzqhRRk/9mJO2D2owZk7946scY8ighRv+bhHReNh/6FF6hGFvGuivw4Gnl8BcB4tEgzA0MGOGS6XKmd01t3V7K/pgjzgDOvR+w/SDO2/E328vuu4lNbFhq3lc4fJ83bGKCfTqO90UZr8eBryFlBCpLflElrZwjjdVNKWNJeWcZhaooXL5gX18k12kw9Vr6rSdbFSLT9YYOR9KaHFgSRYPA0QUxMbTCPVSxUEqoY6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uSgpKve+6SxIoXB2whE03Dq95NCTCTrwO7yfqSJzyw=;
 b=E+NI5lyEr7TQnWXbXvT0JtJn7HLMju6nf+T4bmiUlA7szXuUa76YJOOi061esvR534uH8NQrxcD+knTv/u2afe5i25espB0XL063RJdCo64/s0ybK9xohmM16usbAY1z0wXAlL8S33SGUqJ6qUgDMC+OrQwFoMLMtl3wXsTiuyM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4536.namprd10.prod.outlook.com (2603:10b6:510:40::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Tue, 10 Aug
 2021 07:25:22 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::c0ec:e3aa:9d8f:61c0%7]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 07:25:22 +0000
Subject: Re: [PATCH v6 4/6] qmp: add QMP command x-debug-virtio-queue-status
To: Markus Armbruster <armbru@redhat.com>
References: <1626086137-16292-1-git-send-email-jonah.palmer@oracle.com>
 <1626086137-16292-5-git-send-email-jonah.palmer@oracle.com>
 <875ywhe83s.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <058790ad-2291-523c-941a-60f83263fa29@oracle.com>
Date: Tue, 10 Aug 2021 03:25:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <875ywhe83s.fsf@dusky.pond.sub.org>
Content-Type: multipart/alternative;
 boundary="------------32AFBA61F498CD92345F3A0D"
Content-Language: en-US
X-ClientProxiedBy: SA9PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:806:23::25) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (209.17.40.37) by
 SA9PR13CA0080.namprd13.prod.outlook.com (2603:10b6:806:23::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Tue, 10 Aug 2021 07:25:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fac4db9b-347e-47d0-c495-08d95bd003b9
X-MS-TrafficTypeDiagnostic: PH0PR10MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB453664B779176292FCCB6B5AE8F79@PH0PR10MB4536.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n/chFpfM2Ul3MsAzPNBzEZxPCzPyyzzRp1WHNs1p3WmrMSckkvrliMOP2XvMBmbvUcoo+IjbdtM8Yla5kZASVgECm1XJSVb7nfXOtVA7wC3GnUZn5SuE+QCBVyYIMPms0HINRdvx7WaRwBPGhqP/Fo2A7kN6GL6zdRFK/t3JkREj4yg2MeguYIIQe4VDMD4hzOjkSqXi2if2h7h/0pRb4T+FfbDg1L+J4ZTWk8r2bf5SzMggl7wU738+u6h8kdhVh9gmnGd/H/QOPU08lVKIo+A/QZ2pK0/nnWIFr5FkRxXc3qu7BbZasybKPBt1B61VLkHFnNrVDhNYc5691dFTPRUW7FxM6AwEN3AtNrh6MWU9mROAIRltkrl88O96B4ZNX95cO8DS+K9EezF1sLe4Thp8bg3cvj1Bf1Ez61XJvwK7eY49jTCxum9ZIX4WxX3furB7+ghd3kSiHAAs8upvJmkxOduWK/aoRLaA/9KZpA7VrocQjEA6nOA8KEPtlnQzw87vAjejZMqyT6YaoofOrE9nVAhU19qB/rtnjdUv2Qj1dWaaZ8kkwtT96ZaGhTRQpJDGfL6fPlZ/3wOB5xVMWUlOXTfVGRUlX0oz7bOn8ubhI6H9ISFJ8uUa1EpRlVUNhlZ0G9XVwCcMpITiB0RIzors/omICmBSMf0WUsVf2xApVO6i7JBKJmOZbL4/uwXPWbHUYrBL4oQS12dfgH5LkkvE86wyapz6+bObFP7/axI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(39860400002)(136003)(346002)(186003)(86362001)(31696002)(8676002)(26005)(2906002)(4326008)(53546011)(33964004)(8936002)(478600001)(31686004)(7696005)(7416002)(6916009)(36756003)(38100700002)(66556008)(44832011)(6486002)(5660300002)(956004)(66476007)(316002)(2616005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjhXaW1DNVBucEd2V1RObkFZSGhZeUM0Z0dBemtBdFBhb21LQWRzOVgvbHQ0?=
 =?utf-8?B?cjhQRmJJelFjRVhIMDBNd1dXY1Q4K083ajBIenJEd1JWeGxEK1JwZ2w3NnUy?=
 =?utf-8?B?NkVyaGdaSWFzMGNPYkN1blM1WENSYjFydVdob0kyYTBYb05hZ2ZSbStuZHpt?=
 =?utf-8?B?RXBqcVlWamNXeWZVMVo2YVZLa1RVWXFhR1o3eDU2ZnBmdDhQRVhnU2tra3gy?=
 =?utf-8?B?VklHWUNDWmhlR0lkUHRKL29VR1Fvbi9RajlKTzB5U3pCSWE5UUllRmtocXlp?=
 =?utf-8?B?Zzc0YUdzNmVMaEJIUzdqcEZtejI5c1N2N1pXQ2JzRWxrU0RrV01SNGIvN2ds?=
 =?utf-8?B?cG41eTJRYWw4OXFPZThmQTNWcENpRU9acTlzRy9iR1NFOW9wMjZlNjlhQkhO?=
 =?utf-8?B?aTErWmRmUC9Vc2hhRCtDb0xSZ2M0amRkT3FodGExRkpWMEZRclczN0FKL3hh?=
 =?utf-8?B?bjU3WS9yZ1NvZ3A2S0h4MGZLbHVNRWRPNVZyWHphVFBicm9XV1Fxb201WkMw?=
 =?utf-8?B?aUpiOEovRWpaMkJRT3VabVBWZlFRN0tMT1Q4VitFVW13S2Nnb2VVT0xKQmJP?=
 =?utf-8?B?Q3VRWWwyMGROTS9xc3poQUVHaU9IZDBzVEVoVmdGejliLzFpT0tWQWkwV3la?=
 =?utf-8?B?cXdwUFI1U2FuRm1QTC9LaktQamxIL2R2TkdNdGl4bzVmK2J0V2VUaFh0QXZV?=
 =?utf-8?B?b0xzeUcxYVRVSk4zU1FSUkFiTGU4VG1CU2lpZDNnWXowZVAwcnFJVVpxUUhh?=
 =?utf-8?B?VXNWK3dRNG9qZkt3UloreHp2ajlPeXNmZlhyZ2htdktueklNM1NlRXk5K1Vy?=
 =?utf-8?B?UHRkdjhhanpMcEY1dHJ0T3hrcnBSUHoxWGl5OG9HU3EwcUplckZzR3M1WFlZ?=
 =?utf-8?B?MXdCZmxhRitNVFNFdkEwcERyU21aUlMwWkliWVBxRUlJOGI5cDRndXcwV1RH?=
 =?utf-8?B?MHlZVVVlYjFxa0l0Vm9MZXl4ZUNRN1cxVVU3NlpQdU1sSzhlNkEzckNrY2p4?=
 =?utf-8?B?NzdlOTBMcktLSmJkY25CNXh6NFNJSmkxaUxPbU5zcklpREplcWFFKytRS296?=
 =?utf-8?B?QWtxNVhJcDN0amQ1ckFaamQrR0JIQXlwZytZTGVGcEYyNzJNUkVWR0t2cXAx?=
 =?utf-8?B?T2hOODBnWXRYbURWS0ttSStGNTZtTzkrQXZaVE5iQ0lDSlh1dytFUGxBTlJ3?=
 =?utf-8?B?SHFONktCcC95V2YzWE9qTkp2TXJORFYrRGFvak9aZ3BIbzFlcE5yWWl0a0dG?=
 =?utf-8?B?c1VlUmRCVmo4SCtxY2ZRNlVJTi9qcUMyeEZBelZ6dXQyZGc0aktUWE9kei83?=
 =?utf-8?B?MndiQkZVZDhVMVJZTysxYnJRdnBMUkVJc0dMM2lHWm1YYzc4T094dWFSek1Q?=
 =?utf-8?B?MjUxcGszbVVjVlpzOG4rcm9RNkE1MFBseHdUdGFQZExHY05YMGplc3N0MzVx?=
 =?utf-8?B?ZERuNHRrNUNVWkkzWWF5MkdMS2d5UnVwM1ozMUIyYzVmS1F5bUM4M2g1T3B3?=
 =?utf-8?B?dzNHQ213SE1nMHdQWUZ0am9Tb1NTaVZkRzdVUXNCaEcyREp5ZXJPSG5ha2VX?=
 =?utf-8?B?Qm9zSkgvMDdWcHkxc1pBMTRkZEVNTVRwYzh2eGFiTUZEMFBhOTFTWjBCUUpv?=
 =?utf-8?B?dHB2NThGNGtKZC9sajV2SURZWlVIbDI1SlA1R2R6S3RIakw1dDkweitxb1Jy?=
 =?utf-8?B?YnBUSUZFdG9YM2dKMTRwZWFhTzJ1YUpQYm9TdnhBV1o3cWxsMEREWm83TjVY?=
 =?utf-8?Q?+GJKpsSNbpQcXzcro+/wA+PzBCBWniHngPtiov+?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac4db9b-347e-47d0-c495-08d95bd003b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 07:25:22.5717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jCngiwigzPNWzNt2qo0UDbc8WXt8xIOuKF7dXKIA9KFRebMze09XzYlbxNf3VI/RpcWFrTkFLzCnuRqswvsPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4536
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100045
X-Proofpoint-ORIG-GUID: 74L_qksc_G1tQ6sjfTxcaaUmJp1seLZf
X-Proofpoint-GUID: 74L_qksc_G1tQ6sjfTxcaaUmJp1seLZf
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, jasowang@redhat.com, david@redhat.com,
 qemu-devel@nongnu.org, amit@kernel.org, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, kraxel@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, joao.m.martins@oracle.com, mreitz@redhat.com,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------32AFBA61F498CD92345F3A0D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/7/21 8:45 AM, Markus Armbruster wrote:
> Jonah Palmer <jonah.palmer@oracle.com> writes:
>
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> This new command shows internal status of a VirtQueue.
>> (vrings and indexes).
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> [...]
>
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> index 78873cd..7007e0c 100644
>> --- a/qapi/virtio.json
>> +++ b/qapi/virtio.json
>> @@ -406,3 +406,105 @@
>>     'data': { 'path': 'str' },
>>     'returns': 'VirtioStatus'
>>   }
>> +
>> +##
>> +# @VirtQueueStatus:
>> +#
>> +# Status of a VirtQueue
>> +#
>> +# @device-type: VirtIO device type
>> +#
>> +# @queue-index: VirtQueue queue_index
>> +#
>> +# @inuse: VirtQueue inuse
>> +#
>> +# @vring-num: VirtQueue vring.num
>> +#
>> +# @vring-num-default: VirtQueue vring.num_default
>> +#
>> +# @vring-align: VirtQueue vring.align
>> +#
>> +# @vring-desc: VirtQueue vring.desc
>> +#
>> +# @vring-avail: VirtQueue vring.avail
>> +#
>> +# @vring-used: VirtQueue vring.used
>> +#
>> +# @last-avail-idx: VirtQueue last_avail_idx
>> +#
>> +# @shadow-avail-idx: VirtQueue shadow_avail_idx
>> +#
>> +# @used-idx: VirtQueue used_idx
>> +#
>> +# @signalled-used: VirtQueue signalled_used
>> +#
>> +# @signalled-used-valid: VirtQueue signalled_used_valid
>> +#
>> +# Since: 6.1
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtQueueStatus',
>> +  'data': {
>> +    'device-type': 'VirtioType',
>> +    'queue-index': 'uint16',
>> +    'inuse': 'uint32',
>> +    'vring-num': 'int',
>> +    'vring-num-default': 'int',
>> +    'vring-align': 'int',
>> +    'vring-desc': 'uint64',
>> +    'vring-avail': 'uint64',
>> +    'vring-used': 'uint64',
>> +    'last-avail-idx': 'uint16',
>> +    'shadow-avail-idx': 'uint16',
>> +    'used-idx': 'uint16',
>> +    'signalled-used': 'uint16',
>> +    'signalled-used-valid': 'uint16'
>> +  }
>> +}
> I can't check the member types like I did for VirtioStatus in PATCH 2
> right now.  Please double-check them.

Double-checked these; 'vring.num', 'vring.num_default', and 'vring.align'
are all of type 'unsigned int'. I think these should be of type 'uint32' here.

Also, 'signalled_used_valid' is of type bool, so I'll change it to 'bool'
here as well.

>
>> +
>> +##
>> +# @x-debug-virtio-queue-status:
>> +#
>> +# Return the status of a given VirtQueue
>> +#
>> +# @path: QOBject path of the VirtIODevice
>> +#
>> +# @queue: queue number to examine
>> +#
>> +# Returns: Status of the VirtQueue
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-debug-virtio-queue-status",
>> +#      "arguments": {
>> +#          "path": "/machine/peripheral-anon/device[3]/virtio-backend",
>> +#          "queue": 0
>> +#      }
>> +#   }
>> +# <- { "return": {
>> +#      "signalled-used": 373,
>> +#      "inuse": 0,
>> +#      "vring-align": 4096,
>> +#      "vring-desc": 864411648,
>> +#      "signalled-used-valid": 0,
>> +#      "vring-num-default": 256,
>> +#      "vring-avail": 864415744,
>> +#      "queue-index": 0,
>> +#      "last-avail-idx": 373,
>> +#      "vring-used": 864416320,
>> +#      "used-idx": 373,
>> +#      "device-type": "virtio-net",
>> +#      "shadow-avail-idx": 619,
>> +#      "vring-num": 256
>> +#      }
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-debug-virtio-queue-status',
>> +  'data': { 'path': 'str', 'queue': 'uint16' },
>> +  'returns': 'VirtQueueStatus'
>> +}

--------------32AFBA61F498CD92345F3A0D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/7/21 8:45 AM, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:875ywhe83s.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command shows internal status of a VirtQueue.
(vrings and indexes).

Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/virtio.json b/qapi/virtio.json
index 78873cd..7007e0c 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -406,3 +406,105 @@
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus'
 }
+
+##
+# @VirtQueueStatus:
+#
+# Status of a VirtQueue
+#
+# @device-type: VirtIO device type
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc
+#
+# @vring-avail: VirtQueue vring.avail
+#
+# @vring-used: VirtQueue vring.used
+#
+# @last-avail-idx: VirtQueue last_avail_idx
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid
+#
+# Since: 6.1
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': {
+    'device-type': 'VirtioType',
+    'queue-index': 'uint16',
+    'inuse': 'uint32',
+    'vring-num': 'int',
+    'vring-num-default': 'int',
+    'vring-align': 'int',
+    'vring-desc': 'uint64',
+    'vring-avail': 'uint64',
+    'vring-used': 'uint64',
+    'last-avail-idx': 'uint16',
+    'shadow-avail-idx': 'uint16',
+    'used-idx': 'uint16',
+    'signalled-used': 'uint16',
+    'signalled-used-valid': 'uint16'
+  }
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I can't check the member types like I did for VirtioStatus in PATCH 2
right now.  Please double-check them.</pre>
    </blockquote>
    <pre>Double-checked these; 'vring.num', 'vring.num_default', and 'vring.align'
are all of type 'unsigned int'. I think these should be of type 'uint32' here.

Also, 'signalled_used_valid' is of type bool, so I'll change it to 'bool'
here as well. 
</pre>
    <blockquote type="cite" cite="mid:875ywhe83s.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+##
+# @x-debug-virtio-queue-status:
+#
+# Return the status of a given VirtQueue
+#
+# @path: QOBject path of the VirtIODevice
+#
+# @queue: queue number to examine
+#
+# Returns: Status of the VirtQueue
+#
+# Since: 6.1
+#
+# Example:
+#
+# -&gt; { &quot;execute&quot;: &quot;x-debug-virtio-queue-status&quot;,
+#      &quot;arguments&quot;: {
+#          &quot;path&quot;: &quot;/machine/peripheral-anon/device[3]/virtio-backend&quot;,
+#          &quot;queue&quot;: 0
+#      }
+#   }
+# &lt;- { &quot;return&quot;: {
+#      &quot;signalled-used&quot;: 373,
+#      &quot;inuse&quot;: 0,
+#      &quot;vring-align&quot;: 4096,
+#      &quot;vring-desc&quot;: 864411648,
+#      &quot;signalled-used-valid&quot;: 0,
+#      &quot;vring-num-default&quot;: 256,
+#      &quot;vring-avail&quot;: 864415744,
+#      &quot;queue-index&quot;: 0,
+#      &quot;last-avail-idx&quot;: 373,
+#      &quot;vring-used&quot;: 864416320,
+#      &quot;used-idx&quot;: 373,
+#      &quot;device-type&quot;: &quot;virtio-net&quot;,
+#      &quot;shadow-avail-idx&quot;: 619,
+#      &quot;vring-num&quot;: 256
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus'
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------32AFBA61F498CD92345F3A0D--

