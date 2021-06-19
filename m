Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D699E3ADB69
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:43:16 +0200 (CEST)
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufw3-0006Gw-Uj
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lufdS-0003NB-DI; Sat, 19 Jun 2021 14:24:02 -0400
Received: from mail-eopbgr60118.outbound.protection.outlook.com
 ([40.107.6.118]:40398 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lufdN-0007NJ-Go; Sat, 19 Jun 2021 14:24:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVcPIqWgtkkG2JaM/4xOhk5L4+uBaiokGJ6ALWfqMkZSaaZHJ7rq6HMrNFMrlk6J2MmTZyYUJvbeDA2+FysRNmqMvxeyu/LPQGYeWtLQVMf34dVw603aAJPr/sIayLrrLxXaJv0Dt5Hzn0Ens4SLZUiKkLqc0VyWtfYAyQzn70TTQK9N5W7zRwDvfATWIxX7vev8uQ9q3kZiwijg82ZU0zCkW1uM3oul6AI9AgZVQiR8IEJcANMGRLq7KZX/vMhsWF6MvSPyqG5Lhlw/XEPMDsSzK4M9/XdENbDGgnODjGLsnZxy8TKoS/yzbxE2pAjtBQMwHSQBSb652K1cjBFlcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZPih8ehGHqpm4SDziyZ3YiQH2MvjKMZxmzhnBXLIsA=;
 b=BiWWSOLjdABa21mXJFifRClC5ugbpMJU1vTXiheLf9vAaUUYHZbSYIspe3JVIdOnK88uT/txK9+BzYjwvXWPitV8blW8Oq0UQtPH7RAJKng6h3A/niptkcInJLe//XnP1GNtzW2uZ+v+oYvAIBIEEmxZIXfvqLcIkNdXH0VaTImFT8JWjXNCdFd/1AIiIVbE7vDZizJibS+gAPj7o2qCLcbYE2fawmspc9Tor102P3EhS3TLF9WOBQ3UwVnYJQWjNLO64/NYYN4LowxWXtkaKCYJOCh3k1ZDLPNZuIrn1wE/6lv0NSj7FzpskrkUTUvumOhVKw3omq9H1LW3RtLh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZPih8ehGHqpm4SDziyZ3YiQH2MvjKMZxmzhnBXLIsA=;
 b=GSUPeZXfniwa1/14l4dR4L4gWjiaOGlseoVd2pvLF0BWQmraygmfe5MROLeus/TMMRXC/NOCsRogBxu8QfiAG1+TL9icjaXISJbGZV3IPx2gNEMajDASxaYpV8dZTGtsH85iBhzGWfwLI+4W0eXgUotmt6vkUmGOfP9YZ6NYjXk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5493.eurprd08.prod.outlook.com (2603:10a6:20b:102::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Sat, 19 Jun
 2021 18:23:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 18:23:54 +0000
Subject: Re: [PATCH v4 2/6] block-copy: streamline choice of copy_range vs.
 read/write
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-3-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5c42c2dd-c4f1-f9b0-6f09-0d29d837be4f@virtuozzo.com>
Date: Sat, 19 Jun 2021 21:23:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210614073350.17048-3-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR05CA0360.eurprd05.prod.outlook.com
 (2603:10a6:7:94::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR05CA0360.eurprd05.prod.outlook.com (2603:10a6:7:94::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Sat, 19 Jun 2021 18:23:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7907d8dc-55ec-4509-539b-08d9334f6532
X-MS-TrafficTypeDiagnostic: AM7PR08MB5493:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5493C1C3505EDB7E5C902C58C10C9@AM7PR08MB5493.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDC0g2i6Cal6kv96Wwqq0/x3KdTMQDsmhRVmeYzGREWP1k6vlpfEgvw9uA6ZymlnMu1/Zw8UAlfvZzZLOzxlZgemUIIF1TsiDuz0JkkmlJmt3OSHRh5k28WpjH2YpSBkddAtDoSnEPzREs9viTGdb5JzzCIBNEh3oq3heYXuCfcMRUChWSlz+lnxQ0UyUdMkCYkHyIUFMR0+SHUdiIUPPIu3l4R7VPV416QKv9vgN2XlRhbdBjn7maKlhKHCLkFZDvNpyGNLHIeKlvybHLSgPPuvuxsBzYzX++6hqKG2KldHH5632dTanjKgs3DA+rlnJyyDTcF3Yv8W6dE8MOPoJJ/t7qpsSxcYI29mR/xHNZH1tKP/wo8/LS7Ja8WYRZVz/6Rv3JAcu+JAVzkDeLKJVSUgPTEZcpSiOmxNCxZxw3x6hJZN9lJAfqfkVSGrPjbRPiVaQfodXMtxUs3yRyV3J90SM6uM4o49m70fP2zw9YKW9ldaluGbPP66XiDZsPhTYNQNov/cF1Am7/9EZloNrPVKhZe9q1xFxHb3Odblun8rU9Yqzf0Ba/rJzAkuVCMUTqt3D6pO0T5+yejvXrtqV21h2v338CVnbbHTy68/DcNANiGSJXLF7Gftp2MNoig3/IzoVq8XZZUR5mEabMFwjZeZVRXMi/BRX+CysQa3i9yxFetfC6RoCBMHnL+yJliXbK1LTEuCdzpA/XgmOpy1AOUtjYuz41Dw7LghOGZrAqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(346002)(376002)(136003)(396003)(8676002)(316002)(8936002)(4326008)(31696002)(26005)(66476007)(478600001)(36756003)(54906003)(31686004)(186003)(52116002)(83380400001)(16576012)(16526019)(86362001)(38100700002)(5660300002)(38350700002)(66556008)(2616005)(2906002)(4744005)(956004)(6486002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akQ3REUrRlRia2lpNVl0WVBBYzFMVmFYQkFCeW5ZazlpWXIxc0ZQaGl5M2ds?=
 =?utf-8?B?UXRSUkhSSFk2UzhXZTZDc3l4QStVKzJpVnNzOHpvck5SUCtwNzVrRUxad2RP?=
 =?utf-8?B?NG1mQmhDSGMvRW1LUzNUeGRiRk9zdGQvN1JBVzg1VnlzRzZRdENQemtpdnUy?=
 =?utf-8?B?Y04wWVczNFBDUlVzMXBOZURYdytVWkpBYjE0QTY1VWVBaklXK3NQQWFlLzZT?=
 =?utf-8?B?NTNaYndiVzFQTjE0a3E0QUVRV1MzNnhTVDczUVRZZ3dGWGZKdGpORTVQSi9E?=
 =?utf-8?B?bzRaRy93UFZod3BxcTVOU3ZJMlBVbEo0STc2bEtpa09PK2IrNDlmQUI4TDBN?=
 =?utf-8?B?c244NVVvb0RHcENzZVdnbXhMTmRlb0M3Szg0OVR5K20wbzVhNThqdHJHVnVv?=
 =?utf-8?B?aUNvcGFHTTF4TlM2QXZtVGVFNXpwL0RQczJGZVpSVVRURjRVQ01MNDE2ZHQx?=
 =?utf-8?B?SUJmQTFCUlAyUkRYcll6b29XOVZWNStZQU90K045Q2l6VjdHQWFmaWl0TFE1?=
 =?utf-8?B?emg1cURKVm9vZ0RrMEVrSWtub0E1WFFtd1FJTWpIN1RsSWlycEhTa2hBdmo3?=
 =?utf-8?B?dlZyNDJHaC9sNk9FcWcwQUZTUHVUalNmSjZkQy8wM3oxL3VVdGVpTmMxMFhy?=
 =?utf-8?B?TVMydExsZEs1SUVHOGFEYjRZaXNQSUVjcFA2aHJrdmtIbjk5MUpNK016ajVh?=
 =?utf-8?B?QTNGWE5TMStBSlhUVXQrSVgyUm12THJiVjJMbW5UMHpSWUZ5UFQ3Q013VzN5?=
 =?utf-8?B?ZmpLdHlZT25XcERGY0VnV0RqZHZmNFd5anpveE9TL2s4ZHNCLy9xT0RmSzNx?=
 =?utf-8?B?dVZhS1VRN2MreWxQQ1pwREtHYk1Qb0FHRFEzL0RzdWlzVnBrSHNQZjZCU0dh?=
 =?utf-8?B?OWdWNmxKRUw3V1prOHVpeVB3ZlhYT1hheWpiaitaZDJ4SzZBcGE1cytlUzZi?=
 =?utf-8?B?K2czaHZwT2ZlS2pzZkdyRDc5bUc0REJHb0ZCMU5wOUlsNkNUOWUrcWhoWmJh?=
 =?utf-8?B?R2JqNE5SWEdWVzJDZy9JWkpRNWJnOHVqb0MyUVd6WEJudk9oOWt2UDIxaUVx?=
 =?utf-8?B?a2c0RUdVZ1dnYUdTV1lKa2x4OW0yOXBsclVGNTg5dW9IY2VNK05xQVZqN09B?=
 =?utf-8?B?REpPMkNENzJJd3I4N1ZtL3VjT2lyUGNFUWNmZXk2T250Q2NSaWg5UkxZWFNn?=
 =?utf-8?B?SHZ3b1BQY1k4ek1wM0ZWUEpKbHI4MEtSWHJGYWZkTWZUWkNwdGVoQW5mN2V2?=
 =?utf-8?B?ZnJCOXhiZk5aUlVSSWlPMWdYRlJEVXhxUWNzR24ycUpSUXU2UG5QcEY3cW9w?=
 =?utf-8?B?NFI3ZlRTYVZ0dUV2b1Y5N2tGQTFrN1ZQcTk2Z0NNRGZRYlM1bDY2U3lSc0s0?=
 =?utf-8?B?OVlwazY0d3B2c1lKbmtsNzl4YXJPT1VRNmkxQmwwQ0MrZ3Y2MnozK1BjWVZO?=
 =?utf-8?B?TmptM1QxOWJxdnJDMm5uTkgwUHRrOHk2STA2VlA4UjFKeis4NTZmNklVZzEw?=
 =?utf-8?B?cEJmOG9OcmNGVHB1Tm5ucCs3TzNCdmNoMVZiQkhMOGlhL3JkWk5wdW96SHRj?=
 =?utf-8?B?bU5xTjNaRk00Z281M0pVMW9temppcTZ6d09qdHlPTnVXTWJyYXpEN21GMGpu?=
 =?utf-8?B?QkczNi9nRXl5U1J2Ri9FVDJGcU1FMEVmQUJhVmFjNTlPVy9la01Kd2ZJN1ZW?=
 =?utf-8?B?TGJiRnVoWFdzOVNTajBUcDJJcHdPZDJmOXZsaDlkREdVaHIyakFLMkVGbHhC?=
 =?utf-8?Q?t5I8N65KfaVwQU2SSdDjTJp0vfWe3pFJnhhJGEU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7907d8dc-55ec-4509-539b-08d9334f6532
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 18:23:54.4130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeklD3VyK4tX1TzI4QfXnx3BgHVvfDfwgC0BqKje+jD715PE8YIubWwtTORBdhoiB1GhEJOR490SPOr8m83uytRQSFMkNx2t8MYOGGm+l2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5493
Received-SPF: pass client-ip=40.107.6.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
> @@ -158,8 +183,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
>                                                int64_t offset, int64_t bytes)
>   {
>       BlockCopyTask *task;
> -    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
> +    int64_t max_chunk = block_copy_chunk_size(s);
>   
> +    max_chunk = MIN_NON_ZERO(max_chunk, call_state->max_chunk);

Note that you modify this code in patch 4. So, you may write here

int64_t max_chunk;

max_chunk = MIN_NON_ZERO(block_copy_chunk_size(s), call_state->max_chunk);

to not modify it later.

-- 
Best regards,
Vladimir

