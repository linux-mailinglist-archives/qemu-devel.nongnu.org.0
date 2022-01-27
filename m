Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9549DEB5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:06:03 +0100 (CET)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1fG-0004Oi-81
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1Xk-0007wK-VI
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:58:16 -0500
Received: from [2a01:111:f400:fe07::71e] (port=58254
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD1Xi-0003Tf-Gm
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:58:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHtrb88Q2btHgUFYq2DHMyPR5hoEQpDUvzSdNmTkqGy2M6svh81D2JlVH0G7LWS3cXEvqoHXXyo5iQVPzg65vaTkEmOWPAW+cC5MjhnOTrOOdsE9/kweH8DGhrWIducVfynkXpABAJ/5uUgQNedzCK+JLRrAXCEEQKbagso5X0DF5Jx250803BdZW6gHucrkkezzja9aP46nWnZqzAen4oTkGHcMSKeaMZPLTpUUo14SJiJCvPwkXrLOfbA1ogiP4e3dmzUMVJOVg4VsHdy/EY+lbVhao9Gj6CFCf8FDnOB1rUnixqRDR9ggwygXkCwWIk5bJll1UPHcbHfLNNuJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/GtOfVJFbVpt01TbWYT5cdqap0NZdX34ue3AwuuKas=;
 b=FDkgbiYkE+0U2hx9XhDwbckWFV0BaDIotp1ip81wLmmRK+spL4/Uzk8gJOj7Ch/MDU8ZUEnc2MRkMKkuymaK7uHoYVNC+arCWOKpk16bu2Ozcb6cXTV/Z7gsrig/qxBSXMJbMMf+kVYQKUzdHgXJuhOvk2OCg2j0HvKTxxCh2MjTMxAlhBYgQ2+hKXMP+64H7ISFluekhLuwABbvWc6L3li2actOxKuZ4bC19pvrdpKytnTNkPO2Tmtgtgx1y0N2O632E3yu6EJLCAvNp4j4DK93DgRlVWwf2MJ11j0GfCbfJz+nHcraH8V/upTq0CKHfFWpDWOo9lGBhL6B7JMOLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/GtOfVJFbVpt01TbWYT5cdqap0NZdX34ue3AwuuKas=;
 b=Z1bYYVLW5Y3m5+fgEGRRhv28F5UqJeDpMeUuMKKgkajQn6nrdSpaBiWcidh+JDXJawQuVfSp5G22JheVXqdb46kZAjQzZpO5B+efLIRy4PMC+JD474WAIfGm7G+1mencDP8lgSkaNXZIwAQANgRl1xkKj758/qRftCUDh5mX6Mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0801MB1661.eurprd08.prod.outlook.com (2603:10a6:800:56::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Thu, 27 Jan
 2022 09:42:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:42:14 +0000
Message-ID: <a9406859-5c41-a72a-e22c-d4e4db06fcfd@virtuozzo.com>
Date: Thu, 27 Jan 2022 12:42:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 3/7] qapi/commands: Optionally generate trace for QMP
 commands
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <20220126161130.3240892-4-vsementsov@virtuozzo.com>
 <87y231vdya.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <87y231vdya.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:205::34)
 To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 778b4255-932a-4890-d19a-08d9e1794c9d
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1661:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0801MB16616A72C7B2D1A56251E090C1219@VI1PR0801MB1661.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DqhQWJC+kE3gQBbLa4qYB2xhVvMf3fzQYd/nClW5XUrVb8nBSRz05p1mCessikYImd2sHJ5coCJHsxG9cOpefmaTI4pAyUYUC1vbzh8OsFRZqEcvXlzcp1zVa7m5S+rr5tShFxudq1NDm8wWcKJNbCtioPsWNr0/cTV50yfBc68LwqD/pQ9NhAjCJfRsYHCuah5pB/ygo0cynyMHeNFdcj3zM45m7pQAhq2BunP8+L8A5oJf+OTxdo3HBRt2coaPu1O+tUSxRRSxCbxBE0WSEBBdDBJ188LhIzoAARqEovwWRYz7LfRmbcAIRBq4DhtfYatqdHpdzJGDooxC8AqjygtOF6UmCRVICuP/HMw4bRjCZJ8DJ4uSiGuoTUbHFgJZ5zj2Ol1k3tCI2bom52jAmT1rr64dZJFS68H6V7O2Bi1cZoGBxTUq93LM1y8yBO3nzjIbE+PrL6Reg7phMw610jKFLpund34vMbKK87Zku9sBTXBe/j93hvFbXIp91n+eRJJXEWqMVgLB33Ho+cqKRs5BXGcVi9mZO01nFiCza1FUQtX0UYbhHt/EZhhFOUCAwWYhs8JT/i+w06yvH7NHNUmFSpmbo0lTMNyH+VMeJiVt//P/W84NcHmDqds25V2A7YMb3cKMRQ7ZjttNxWc0ARXU/edvnMFfIjqZ4sik9hBG0cvYI3Z2TXhJOanTO1b7pegW99fa+VJhISz4EnmnDbFMMlkyIqwj9bXtihpQ1rMN+PBUAf9LCmRTjnMjpx6jCU3XOYf21CBSdaVAQTGR8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(38100700002)(66476007)(66556008)(66946007)(31696002)(38350700002)(186003)(26005)(2616005)(4326008)(86362001)(52116002)(6506007)(316002)(83380400001)(508600001)(36756003)(6666004)(5660300002)(6916009)(6512007)(2906002)(8936002)(6486002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW43V0dEanZlQTJhZHhqbmVKZW1EclNlZ3lHRXo5Y1VYQ1EyaHhPN3VBd0lZ?=
 =?utf-8?B?VjJMc0x3SkRjUEhyZzNZUWZqK1B0enI3Nmg1a3FoWHhNRVp3ZUNzeENTc3Va?=
 =?utf-8?B?S016S0phRTEvK3ZYNzRwKzRSSzlmQTF6RVlpZUs4dkdaQVRXWEZWYmwxb0xh?=
 =?utf-8?B?V2lxNHlOL0tzMjM2NFBvKzEyYlhYQ09hbWZwS2xNUk0ydHJGM29CMzVjZ0JL?=
 =?utf-8?B?bUZTemhmbDF1N2lYS2ZHUlR1dDNZSUFTZ29ucnNjamw3aGdWWDVEMFFXRitP?=
 =?utf-8?B?SThxd3dQdSt1U2d3YVdMeC82SlNxN29pclh1VjNENkhZSHMwLzlONWR2WkJU?=
 =?utf-8?B?dFRYeW1rcUlOUFlVRE13Wjl2M3Q2Z3AxYnRiZml4bG84TVZNTzMwMUkzdlFl?=
 =?utf-8?B?SFhPcytlV3E3WWliZGJob0F0VjNpTDQvV2tHNkpmc0FGNWVqK0pVR1g5MFNn?=
 =?utf-8?B?dXYxMEJMRjdWVlBHeFF0N2o1anA0RjZWTnIvdzVYcklRNFlDWFcxMTBSUHJz?=
 =?utf-8?B?ZGJzK3RXVjdSYytxSjRTZEFjQ256M1gzRzVWa1dRaVJpRGYxN2ZZS1JyeWVI?=
 =?utf-8?B?NGplNUdQdnNwaFJjWkZhMEp6bDNoNmdGTFM4TkVOV2hkMEN4ZEdBNklZWE5H?=
 =?utf-8?B?cG5meWtpRVl5c2E5TVRnZXNJTy9rTjRGMGh6TXVlVFFIWlRITGp0aXlkbmNO?=
 =?utf-8?B?ZFJrOUtlaFBwTlppMEZqUGVXRzV1OFIrNzNpcjQxSDFWSWQwVHU4WGxtL0VQ?=
 =?utf-8?B?NTgzM05SVHBnTEVtSS9zcFlvRWFOOEwwZjNyVTFQNms5NzZWR0t4TkVrV2U3?=
 =?utf-8?B?d1g5QW05dWM1Rm5BWVBoME9WQ3dNVStCV0FxamlVSmVmRm5HV3dFVEd5Zmhk?=
 =?utf-8?B?QmVBdzFtNmVFNHVCc1ZNREw0OWNCUkFkb2tOWHI5bHk0NXdldUxOWTI1WWJv?=
 =?utf-8?B?Y1RCTlQ5dm1ocUpSUGRYaVA2bklWT3I4RW9MQzllMTR2WEFjbVVNbURuUjk3?=
 =?utf-8?B?ajBpVjhFWEJycUQ3QkV0clFqTllxOUZmSjBWN0FxMVpCNEdWR2k5aDExLzg1?=
 =?utf-8?B?S2oxNHhJaENJN1lPT1ZmT0ZvYnZtVUdkRTRmMnFQeFhHOUZlSTJIeDRxUGdX?=
 =?utf-8?B?VlBWUTFFS1FXWjVQQWpOUUQwaFMzVzBiaENNYWhOLzJGOXpITzA3WmREUnM0?=
 =?utf-8?B?Tm1sREhvdnR3OTlOTHRBeHNOYnFGYjdxbEtZZjFSaDJtWGlyd0NKakRDUE12?=
 =?utf-8?B?aWZFd1U3Mk9hZzdRNHJpVFI1RUduZGJxcUp5T0JYNW1hVVROUUNGTEdROXdu?=
 =?utf-8?B?eUEzaDRLNFdscVNvQ1RqNzV6cTh5c0tQMWdnVnNjMzQyMmExb1BzMG1aSEcr?=
 =?utf-8?B?dTgyRWVlL2RBcmhreGgrcWJhemhtTERFVVNUc01iRnUzNCtEQlU4cGIwTy9E?=
 =?utf-8?B?RXhQS1ZFRkRweW00VCtBL2pMY0VsWThmWmtycU1XQjhSMTJPOER4ZWZXenM4?=
 =?utf-8?B?L1Z1ZEZ2S3ZMT2ZZZnFkWXg2T3EwM0ZxYXVJUjNFNHFmTHNOT3lsNnd1dXBY?=
 =?utf-8?B?VzBYYkNKc1RuT3FTYllQdzMzYUxYU1FxTGFSRTVKNk1PMnlCTy9RNktIZytW?=
 =?utf-8?B?V3NhN2pPbWpCaWdjUGx2NGN6dm1tb2xXbFlvdkUraG5keUNCZUhVK1hpb3FZ?=
 =?utf-8?B?Z0E0QXRiWGMvdW5rRk1XTG5ENUlzTVZETGFUWlhoM09FTDBJUjdDd3cxRk1t?=
 =?utf-8?B?RWRyT2ZNOEdmanZzRDk4Y1IyYWhlbEVPM1I1cFI4WkpzVUFGc3RFTnFhOWdq?=
 =?utf-8?B?WjRoQVdEZTlBVUM0Mll2R1B5N0hILzJFUTdZelBISndaT2d6TlBvNXlOWGJh?=
 =?utf-8?B?TTBSNFVWcldPTk8rbWg0NTNEMFd2SG0vODRTRDN2cHh6TFAvUFRkQkRKdkRy?=
 =?utf-8?B?RTdZYm54VXFMdkhsT3pIZ0dpdmU0VCtpdVZkb0cvbUpPRlI3M29uTFk2KzBy?=
 =?utf-8?B?bjJqL20zQmI5SXZLYmJiYWFLSFZYS0tZbDhkL1paRlNoR3gwT04vMHhrVFZq?=
 =?utf-8?B?cGg5WTlZdEUzMlRyVXM3RktYaHkvOCs1aFkwbU5CRURDTzRDcVdBNDIzZkVB?=
 =?utf-8?B?L3N3cW1mT3A0cnIrMHJNWDBSREtJNFZ5ZFJqOWhNUG9XUm5LbGpKeEJyTVhj?=
 =?utf-8?B?MmpydEV6empLUWk2TkNNZWM2ZEluREd0T0V6T014REN1N3lCUzdmaGVKQUNU?=
 =?utf-8?Q?5inUhgqeHDsivHqS8CWoIyn116qSo1E8Dnz7AadWe4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778b4255-932a-4890-d19a-08d9e1794c9d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:42:14.3433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wETBBjsqokNg/FYSYFhF6oixRs637CD3q4egwtRuJHSsLdUYbjf16YDH/NyVxKGz7GWCC4lLaUetqXLCJghJMbfWjOA2qnJaX6A+90tr9h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1661
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::71e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::71e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

27.01.2022 10:24, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Add trace generation disabled by default and new option --gen-trace to
>> enable it.  The next commit will enable it for qapi/, but not for qga/
>> and tests/.  Making it work for the latter two would involve some Meson
>> hackery to ensure we generate the trace-events files before trace-tool
>> uses them.  Since we don't actually support tracing there, we'll bypass
>> that problem.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   scripts/qapi/commands.py | 91 +++++++++++++++++++++++++++++++++++-----
>>   scripts/qapi/main.py     | 14 +++++--
>>   2 files changed, 91 insertions(+), 14 deletions(-)
>>
>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> index 17e5ed2414..fa90b6246b 100644
>> --- a/scripts/qapi/commands.py
>> +++ b/scripts/qapi/commands.py
> 
> [...]
> 
>> @@ -265,6 +319,17 @@ def _begin_user_module(self, name: str) -> None:
>>   
>>   ''',
>>                                commands=commands, visit=visit))
>> +
>> +        if self._gen_tracing and commands != 'qapi-commands':
>> +            self._genc.add(mcgen('''
>> +#include "trace/trace-qapi.h"
> 
> I believe this include is superfluous.

No objections to drop it

> 
>> +#include "qapi/qmp/qjson.h"
>> +#include "trace/trace-%(nm)s_trace_events.h"
>> +''',
>> +                                 nm=c_name(commands, protect=False)))
>> +            # We use c_name(commands, protect=False) to turn '-' into '_', to
>> +            # match .underscorify() in trace/meson.build
>> +
>>           self._genh.add(mcgen('''
>>   #include "%(types)s.h"
>>   
> 
> [...]
> 


-- 
Best regards,
Vladimir

