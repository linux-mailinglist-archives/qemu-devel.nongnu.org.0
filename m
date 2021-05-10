Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914737804C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:52:29 +0200 (CEST)
Received: from localhost ([::1]:33758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2aS-0000K0-LY
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2ZF-0007qm-Kb; Mon, 10 May 2021 05:51:13 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:44128 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2ZB-0002oM-9l; Mon, 10 May 2021 05:51:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdsmVLVAdb59Hbwcfb08LKQTI3oeq4VSrs1wux5vuRSEG/Z0p2UIZKFfClAipITpIRqWVbWb2o+I2mtUEtnjCzjnccc6lyY4EBLhSYZpP0VsYGA2ucOv6z1s35GBotvrrF0xe/pDO6wr8UTtOsysxEr1JgrEthwjyu/hkjuV47QDWjpnFNZT5GZOxiPpaGS57epGW8E2Nj94ICKIgSYD9zfmcEXSGomMiw1lbbXm0OeyfHn1eu+E5sH5gFYSRtz6CBcSewofHdCFm1C26z0RjMQWFKIHdFrfDcI/8z5W4umOVvIAW6pbHxnAeCgfstEOIP04MlrMi+O/0I/C4tuzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3aldMUtzlXgz24gPkMrzMzzzH60JaqpNtkNVF/kuh4=;
 b=WqXxf0HQndkGTnks1may+uR/lY21tS+JsmrX4aFITnFamycSOqe3OMDlqvkNjny1KenlcPAH7mqle2qQL3+ATesO7IKianmwCdgehIbqDlzBCvD0GmGJhKlpGIwHem2IHRAzPAx+LfGk4QMwVFN1PIHyNfI19etuqEDHUfy96A7VzgIlXkKz5j+snWZldw4FSs6PzOMNwTrw95kh2jqK3GzsD6ZkOiF7ZMh3gMAnMngGEgdCHYYotHuI9H9pfiUcy8/ok0HzpvisT4ut00H+MJbRftfKf7tlIQp0YhsLtimAUdQTQtNSMCzfpRj162Imr4N2m3kMVUeyio5va7RmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3aldMUtzlXgz24gPkMrzMzzzH60JaqpNtkNVF/kuh4=;
 b=NdEidE/P4hyk1SgTVzZ/Z/yTyaxnfrxB3odzgB0+TheTBOSDR2F1ktTExIVClhxism8OCIvXYI01xujBKVD1+qu6qgKQ20OF/Ul5uuqtazSnYF3fBcG2JUh0Jc9VmMmp5/xPSLMwWyea/pFwLZDswSvukOKLAXEueHrgJHtaxqo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4344.eurprd08.prod.outlook.com (2603:10a6:20b:74::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Mon, 10 May
 2021 09:51:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 09:51:06 +0000
Subject: Re: [PATCH] ratelimit: protect with a mutex
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org
References: <20210413125533.217440-1-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1544114b-186e-3a4f-208a-f5592873caee@virtuozzo.com>
Date: Mon, 10 May 2021 12:51:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210413125533.217440-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: PR3PR09CA0019.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 PR3PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:102:b7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 09:51:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f590ce1-7fa2-40c2-742a-08d913992148
X-MS-TrafficTypeDiagnostic: AM6PR08MB4344:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4344E44A958400694025738BC1549@AM6PR08MB4344.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAnE0JcwtdWWFkrmeFio0nCzfs4AsfBHb4/NQYNBQrRT6jfxl6q73n5HLyAhkU2NYgW/UoBYjWpdik95Ut5UlvHlr7zRUpemXAlgKM2QXqldAkwiezfCdL4LwK0PxhkbL7P/HwXp9/IhYQzWL+r17OS4H7j1IvEgI/N2bt7p6vX74vL8I9ICpKuCdtY+380Qsi7GYs5t6EmDluX91fgljCxdt8YlZSANXUgo29AZGne41dVzQ32ZDTcgtuVnELMDMohBSSLWUGCmGFXUZ38urzMZnbm4GKd1hsXBjGxaNHTl77UPTOJy4fLFMWj0O3RDNaaEJNOBPCzKDnRVOuJ8EInsDX5Ij/WIgULmH3k3aVBKidvbNOF38boAn+UviSm0TNVD5syeECaEKcDxFheOQEYszyDUl3gXtlYam56jPMS3tArv1vHTe1qvHJa0aqctOL6SrE1X0qI8h2x84PD953TmmYEyNIiBDOTfMhurk2S4dYL7+rVtKzVN/B9+Ls83r49T6g3h9kcsEDxWYGAzFwPghJY3cQL+Oim7MOLHyXm+epu5M44IFVCcZ/3UqK7t0CdyG3YbMg8taftPZxy8ya4pPWNPnArBuvcxeFURJAXS31SZ9D0j0AiPdfVKLyhawnqAduBHZH84S3tcjLSxIv9VenqTh679A9v4wuVzZU/LNjugV1FNLaGrHduCQtEI1XOwk5KRFncgekDiUVQKRIJQdkZxxJfLAxPIdyf+q6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(366004)(376002)(136003)(478600001)(26005)(4326008)(6486002)(16526019)(52116002)(8936002)(5660300002)(31696002)(86362001)(2906002)(36756003)(186003)(16576012)(31686004)(8676002)(83380400001)(66556008)(2616005)(38100700002)(38350700002)(316002)(66476007)(66946007)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TG9reHhHZUdWSVkybzV6UVd4aWlzcTJxVndKQ1UrdkRsT1B0WHFGa0txVk8y?=
 =?utf-8?B?eXR4OFg3TVc4TlNnZ0F5M1lzT1d5RGM0Tm5NdGxMaDBpaDRYc3NTY3lDa2dM?=
 =?utf-8?B?RWNsYnFyYkFDVktDTEVOd29XN3d2c0RvTkp0MEowdnRDdkJzdWFkM25wdTQw?=
 =?utf-8?B?SFI2YjZ2eWZZYmw5YkVoZ2xXSW5vNnozZ21MamVzTW05ZVdMNTcwMEpMNEow?=
 =?utf-8?B?cWZtU3phcFcvTm5sbmZkNWVGWENTL25mcmR5TzMyQUFXdHh6LzRhdE1SVkxT?=
 =?utf-8?B?QTZHTGx3cWRhVmJocnh0OFhHR24yWFUwM2p6a2t2MUwyby9mR2J5ZUtvbjda?=
 =?utf-8?B?VEE5QUJWNmQ3TFExdExxOWpCaWhRQ2lKR3ZoSzdZZ1gwZ1JrcmdrVzhzMG1R?=
 =?utf-8?B?TzVEdGo2ME1MTTNVZ0RUS0NqZ1ZydTIwMWJMQU8yZjhPY2F4NWlrWUNvb1Vp?=
 =?utf-8?B?YldFbkthNXhFT2ZZT0x2V0dyalA1UDhaMkhBbnVmbUlaWTkyeE1mNnNRZnJN?=
 =?utf-8?B?QTduVXl0TElSNENHM0w3SThBUHR2VmdDbTlUMmZmc3JNRTZJWTBldkloTVY4?=
 =?utf-8?B?R2pSdm5qVFVCOU9GQ09oZk9iRE4wcmsya1JmU2dWZnNxM1IyRHhOL0RTQi9z?=
 =?utf-8?B?VVFFQzROQ29UR29Sa3dpNmIxbEJGR2ZydXc1a1dLaDVDckhkN0tBRFVadVI1?=
 =?utf-8?B?YXZ1ZFl2dTJKeTFYckRicmk2cUVjNjJlSWF3NE4ySUdxbm1pUzF0V2lSVnZr?=
 =?utf-8?B?TWhUM2pEdHVTUGppbDJ6SzQyMHM4YzhmdFZPSTg2KzdSMXA1OFd1cjQ0d0l5?=
 =?utf-8?B?dklVbEFTWjQ0azIrU21XWDQwb0s1b0lwMUJZa0xIaEJvaVRXRVM4d3MxamlO?=
 =?utf-8?B?cDRwaXF4OWFNYi9xTXB0ZGdGOUNDUXVOTFp0bHRLNmoxeVFWSDk1bG9PWUN6?=
 =?utf-8?B?ZGYxaVd4RzdqKzNxVElwY1BxbHplSFZKUndheG16WjdRWkRYWXpvL01OTjl1?=
 =?utf-8?B?OGJIQ2t2c2tlckZ3Y1Z6TUkyaC9uS3RqVDY4ejJBWFNpMVNlT2dSWURwK0Zp?=
 =?utf-8?B?YUZsVWNwRHc1Ky9jYUc5WGpOeDNBUVI5OUxxWE0xZ0JQeDZRZTZQeDBXbWVG?=
 =?utf-8?B?dEN1V3BjSGt4RmtBeWhIc2VZLzJWaitMRW9YdGFZNVF5UkUwOFkveFVnTU9r?=
 =?utf-8?B?Szk3YXk2NkdaNmVyNFd0bXFpVzZ5Szk1eVVtWnAzbU1SdDc1eWNiWTB5RjZp?=
 =?utf-8?B?SnlxK2FMT1dGUDlmUldBSUtrN1A5MUhqUnR6RUYvMmF1Y2pJQlYvVldzbzVY?=
 =?utf-8?B?ODB1Tzk3aFppS1JwajV6SlVsL1UxQWxiZ0oxekRmOCs5blFjdWJ2d09yRVNi?=
 =?utf-8?B?MmY1dlAxZXNyMWdOUVpJWkdpdjA3bGRiTjFIa2x5d0tNY1BlamE3RG9YWjdN?=
 =?utf-8?B?MmRLLzVseHB2eTFiaU52UlZQQ21WWGNIRE5SZXRhZjc5NnBlVDdkZkJoRDRv?=
 =?utf-8?B?L0FwcGNyVjdINkZ3NGdwVSs3KzhPTzdYcGtINE94VWNzUTVmTUN4aDRlTUU2?=
 =?utf-8?B?TzlyeHRXa0lGL1hUK1RpM2JsMUpPa0U1ZTNwc3VoZ1FLdmVOUGZNYUxXazB5?=
 =?utf-8?B?ZjBIZllBZktrT3hFTGJZbDBhcmVFVUJGRGVuWXVNcDZyTE5nSndvanR2M1dZ?=
 =?utf-8?B?ZHpNUkpza0ZESGJuZ3NaRUZScVdzQ05iQXB1NzhEMVdYWDRJMnplcUw3S3Fl?=
 =?utf-8?Q?4/CdKDDP4rLS316gIDP55v2r9ZY1DjGSwiTFWE2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f590ce1-7fa2-40c2-742a-08d913992148
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 09:51:06.0559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5DLkT+eHvAH+UEQoGPVxoDrTBXEc/ECk5RaGQRwl0UmjVa48jS/6SWrfgy7Rl9nb0KP7jGkFVNVOjDxL4d8rZXIAKIRt95g3Kc7NO+TCLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4344
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

13.04.2021 15:55, Paolo Bonzini wrote:
> Right now, rate limiting is protected by the AioContext mutex, which is
> taken for example both by the block jobs and by qmp_block_job_set_speed
> (via find_block_job).
> 
> We would like to remove the dependency of block layer code on the
> AioContext mutex, since most drivers and the core I/O code are already
> not relying on it.  However, there is no existing lock that can easily
> be taken by both ratelimit_set_speed and ratelimit_calculate_delay,
> especially because the latter might run in coroutine context (and
> therefore under a CoMutex) but the former will not.
> 
> Since concurrent calls to ratelimit_calculate_delay are not possible,
> one idea could be to use a seqlock to get a snapshot of slice_ns and
> slice_quota.  But for now keep it simple, and just add a mutex to the
> RateLimit struct; block jobs are generally not performance critical to
> the point of optimizing the clock cycles spent in synchronization.
> 
> This also requires the introduction of init/destroy functions, so
> add them to the two users of ratelimit.h.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

