Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EF3D279A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:32:17 +0200 (CEST)
Received: from localhost ([::1]:40672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bc9-0004bc-1w
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6bam-0003pr-DU; Thu, 22 Jul 2021 12:30:36 -0400
Received: from mail-db8eur05on2072e.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::72e]:6689
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6baj-0005Tz-4z; Thu, 22 Jul 2021 12:30:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3TQQgvkgLbKjB+j517pHgWgV0LKASCzu1R5ttGylvOvefHsKyAOH72ApzpgsPRRaFTWcIZ8G5+qW1kSffSfU5GjSIcT9ZSzyiJ7NUGuwWFsjxMNaCk/2hiLnJ1IiWCmeXFgTuGAMGfV7gbxGPSqHjYSl47ijEnRRlB4IZ6FBOvP8qKP1L7EQ18aRqVAYuzXK8acAORP7tpGtKiAQKHF3XmQIPB2JML9IqJ97i6J4NN3/61Rbg8obS3o4q2RWr7mxdMZrbN7i0zJr4VNn/HpaspLsWr/yVYWuW67f0f4xgyMBOMcdb5brXA/gROhTdXDOd4c+JCJIDtXFXc9PFfTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZCkBOjaOOKeuE7mNKjSiZLcy2jfkbwe4gFUrfAq2g4=;
 b=eKzW5lAPfW5TRd6i1c1hivVNUK+JSggrfEBf68VsPrdQqQkP5SO43DxYbURxGXX6Yf3IiuZkIvp6zuQZD5O3FKrLr0l2ZHMwpl/rq+jebQWILUcOMfCKJ+o//v7+lr4hjQKe6EUVRYSN0C0D1lu+EZWRX9E2HUKs3cg8n6xjdEmxJFLBapY40ohXs35lJ8dDyALjfXWef5wntXoZfR5iTFLjQgqQd26nRjIrYIhXH+3KAe6WeJ9PjksPDrjiY/ThXFG8X5B2jptyC/Cj7yzPd2kt/DKOh3B5QqNo79PYf554InPDp6ahiLJdHpbjHBgCOQUqFwg00YWTo723RvMfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZCkBOjaOOKeuE7mNKjSiZLcy2jfkbwe4gFUrfAq2g4=;
 b=PRDjawVp6yQV2t9um20N/c4Rc6SK8Qt3J4+gJ9vIAAAArOXpMvdr6/kt2xUAO6YEhCaGjSH+usArpUOVlnIhJQ0vRlszo9ai5m+DQ3ydynUWrPrTSj1+IoSYQv89NJuBr6WwHK2jVWbkzlQg8M/kqPY4cd/KrzO2RcfwSiAgVuU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 22 Jul
 2021 16:25:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 16:25:27 +0000
Subject: Re: [PATCH for-6.1? 1/6] mirror: Keep s->synced on error
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <09dec00d-0ffc-f30c-2edd-c6ef886de05f@virtuozzo.com>
Date: Thu, 22 Jul 2021 19:25:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722122627.29605-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Thu, 22 Jul 2021 16:25:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ae81056-43cb-4fa9-4fa5-08d94d2d5096
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-Microsoft-Antispam-PRVS: <AS8PR08MB60693ADFD2A64FA7F21D7D60C1E49@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5u+KGXIsdZNPPyKHeSNGVA+LLhpQgWJTBpY/qaqLLHD8/MT78gQ5MKJ51x1dnDq0F/2d4jZtB64a1+z4qsuLADK5hbCIlO8X9UgCCNr2vN+QFB5L6vYUk/wCdW4ETW7R/jI4h4xY7o79OpzVrqJm5xm09bDkZho9YIArFLw8nS2kRI6KmNtb8LFJuEzX8dCtS9qN3CFhm5H1NnTNjKCJGTqUKtlNmF5ydzAuZfMVHNPaIdw9IF8vss8eUk7tm87AV0IWlulyqCG4QHqxc6c+3GRP3FbDZDDhvtIivmcylvcnPa3TLlw7VOtVEtEzYKlvFkXmFcKFdv2B1y67gf9SMUnGr9Pl/JJfJIC3WZSC+thwj92TBWEtr1kbV2qUAlDPTJPFDHAjX60dwwXNCLYXw4CbT8dMrRXg9SGRccU6xiWZATLMFUuFcdi0u5KrAvh0wyc/FfM0OZFezS9gDdD5mjij2K0nSSKpyPixgAE6CqytysbFJTHMzdu01fAKXsKDzy4sDZD9Y/iTGTSu/BmQZQ5ov2++cobl0zwHu8xqHzcn5wjmdePSuXuC6oy5hKjj/gWS9Rlk7sG9vzaVwuS6RqeqwDJJiYbmhBOt6K2V9WwLYaSoLI7XdyaxPpT/+4AEDTbL84r+Sy5gtCPXROyTSxlR4CAGq69sYB8VLrHjkKuczmge2eDJGDMIsXqmiM4sQiso1urfDF9lUNx1Zhtws1vBsx8jtKZQiipjcxyJ3KqGMP15XFZ/+GoX8KdK6a2yzj69GO/kIDa5giIlTsDuFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39840400004)(366004)(186003)(31696002)(36756003)(5660300002)(8936002)(2616005)(52116002)(31686004)(66476007)(16576012)(38350700002)(54906003)(4326008)(956004)(8676002)(66556008)(316002)(83380400001)(66946007)(478600001)(86362001)(6486002)(2906002)(38100700002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhlM0htcjBOOUtOcGk0ZnNjakduTTFNMFlsRHlickFpdjh0QkxmUS80OE5s?=
 =?utf-8?B?NEo3Z0w0T1BzWmRESU9LL084MS9mQnFROHBLNnNFL29SZHpaVzBYQVY5UnU4?=
 =?utf-8?B?TUMxdHZZTXJCWnozbGRyQzRxOGdDV3ZmdmJ0QVVnSlc4SHNLeitFU2hwV0s5?=
 =?utf-8?B?T29LWEhGTU5YWHN0Um5KN1pWMkpBakZYQnFoN0hsUXRvTTlYWGp6d2I2OU54?=
 =?utf-8?B?Z3JKUFY0UE1Gd0tyc0wxN3ZKVjVSMWxuTkZiU3ppWU1NSFhLUW1oYURta2FS?=
 =?utf-8?B?Q1JiYlIwTTJiZkc2eDhuRis3d214cFJGRGRhZG5mdzA0dStJUkJycmxIVHpo?=
 =?utf-8?B?QmJSenNVUC9VdUV2YWJGaS85TEJ5enVRZXJUdFlzYmhxRU54R25ZZFZncUs0?=
 =?utf-8?B?NXBmVldzeFNBUXAxbWZHTkFQYjZ3Um9tTEdtTEk3QkdZTmVMWVBHV283NmNs?=
 =?utf-8?B?bnhCSEtseSs2Q25NcWxZTWhLK1VjQTVCZnoxSk1HMCtTcmF0SlU0UGY1OElz?=
 =?utf-8?B?c2VYdEkvOGRWcngvSkIzalhVWllPQVMwZWpCb2lEZE9kdWZqOGxORDVFQmcx?=
 =?utf-8?B?d1JVWThPMGZyclAvVXpPeklsRmR1emJyQmVXOWxHZXZHZjZDREhEd0tSa1RC?=
 =?utf-8?B?Tkw1OTRoR2JPUk1ac21hVWk1S003Z2dIbEU1RnA0dzl1cnpEWkgzUWRlMDF0?=
 =?utf-8?B?WW5vSDFPQkF5akRNVjc3cHZxd1kvNFJUL2pmcXVMc3d3Slk1MGovN0hjT1g5?=
 =?utf-8?B?ZmpuSXBxaVIvK0dzcGFEM2FuNlloWFg1NEw4RER6V3JjWTVlc3l4Z0JPbHdO?=
 =?utf-8?B?VWYvWDk3NEJlTWw5ZElFZlBSYnVjVi9mTlpQN2NSY1JleWZOUHk5UktSOUNv?=
 =?utf-8?B?WFd1UHY0Z1JHZXRxN3VxY3g0Yi9EaCtEYUorQWZMQitPdHhzRk50RmpHbjB4?=
 =?utf-8?B?NmM2YTJIUFdRVTBjOEcxRVNVMHhkSXB5blhoaDFPbFBObHB5MnJTa01FaHZ3?=
 =?utf-8?B?NU9HbXNmT1FmelRVQ2pKT1E5WlVyZmhtUHBnTm1kSzhVcDRuWTUwN1ZsbmVr?=
 =?utf-8?B?Uk04ZUl2RXZ2R3Aya29IWHQyeXVMYkpxUGtIeXZwK2xhTDJGMG1IYmZZM05L?=
 =?utf-8?B?S0JCTDVhMVl5c2lJazNEK0pnWTlkZW52OUpESy9pYnJzQitMRFBIRjR2N25w?=
 =?utf-8?B?WitYRUlQSExuOCs4dTZ2VmJIR3BPYStwaW1VaGt3TW1vb0JwMSs2cTZ6bzkz?=
 =?utf-8?B?UDJwOTN1bmFuTk1JMkJTSTJ5S01hcnNPdDdUQ08zOVRUK3E2QTUzQzF0SVRz?=
 =?utf-8?B?b2hLbDVQV2NuYmhjZDVwK3B2TktCN0s0RHFsVlNDVjJ5dVRQcDFjUUI3aEdq?=
 =?utf-8?B?d0grRjRFWG93akZidWNlZHdpSVpRV1c3c2NtNXRGeElrZDVTaVVYN0JFdmY1?=
 =?utf-8?B?OTFLWmdOVDg5TDBOYWNuWlVicmQrTm5PVWtXVnByYTRQTS8zYUg3aldaY0hq?=
 =?utf-8?B?S0tsV3FGWVlKdjZJQWljRm90QkM3TkJKSVphUFRBcU1KdTIwdkJoUFVZMnVp?=
 =?utf-8?B?QVIrb0MrRGRpbDVvRWg4M0JPWVJKNG9taWppOWp3dEpkcW1KcEFmSG5TdGZV?=
 =?utf-8?B?eHM2Wktrd0cxeTg5aFVxdDBlMjdpaUkwYXVpZGg4V2JvWnNTVHBBczdHZ1BD?=
 =?utf-8?B?Uk04LzhobHdqQk1HRmxkc1IxeE5SU2V6Ym4zRHpuTVdrMWtHbm40NWVXeVRR?=
 =?utf-8?Q?Cm6e/2/pSFA59isA7AsFpl3EmvEhxUz+tVvqJ0b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae81056-43cb-4fa9-4fa5-08d94d2d5096
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 16:25:27.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMzCiSbM25HjIUxqhwDlrqOn3KE+YAFkGT/tLVaGh5LHfYTOmaUYM6AKDQYWvOy/usQkKjKwb4sa0J5yrd9nklcT7vIHDFd7QQk1XvHv7uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=2a01:111:f400:7e1a::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.203, SPF_HELO_PASS=-0.001,
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

22.07.2021 15:26, Max Reitz wrote:
> An error does not take us out of the READY phase, which is what
> s->synced signifies.  It does of course mean that source and target are
> no longer in sync, but that is what s->actively_sync is for -- s->synced
> never meant that source and target are in sync, only that they were at
> some point (and at that point we transitioned into the READY phase).
> 
> The tangible problem is that we transition to READY once we are in sync
> and s->synced is false.  By resetting s->synced here, we will transition
> from READY to READY once the error is resolved (if the job keeps
> running), and that transition is not allowed.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/mirror.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 98fc66eabf..d73b704473 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -121,7 +121,6 @@ typedef enum MirrorMethod {
>   static BlockErrorAction mirror_error_action(MirrorBlockJob *s, bool read,
>                                               int error)
>   {
> -    s->synced = false;
>       s->actively_synced = false;
>       if (read) {
>           return block_job_error_action(&s->common, s->on_source_error,
> 

Looked through.. Yes, seems s->synced used as "is ready". Isn't it better to drop s->synced at all and use job_is_read() instead?

Hmm, s->actively_synced used only for assertion in active_write_settle().. That's not wrong, just interesting.

-- 
Best regards,
Vladimir

