Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59045355A7C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:38:05 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpeN-0007bf-Ul
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lTpcM-0005z8-M7
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:35:58 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:44879 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lTpbj-0002X0-6W
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:35:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIHR/aitZavS1yNv7SQSXOlEPnyKqRx3wqBpxmBBTLZgj0zUa/NArZ1C63JGjSgQ/5VwMrJE3nivr+tlDhx/2PJeuVIx7BUmq/j+3k1iwcgs+7t/B/HeTSZuJLh3sM9cEcoyTTibef75eX/YdKI1vMR1HCFcZaphFIXaVqLoo2fDqVscEpRtrfFl1CbYdCC9+InPIosZafHZj+lwUVNuOQCK1kUHYWAdSaBfbc0wdcFigdgHkpiOprUpYc6sD+3ENa64T8VvmxhtRYe2NqO/sMYu4EQZsRQLzRoMGjF0bkDPTAq9uHMT4bMj3TpRkSaaWFpU/gaHzd7xv9OEyjXlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOvj6L3ndwFldoRl8VDKQb3m6mMF986ZyEQOMl8dXgM=;
 b=eoH32OGB3AudyGyTSWee3IPPZwB8dOX4MLbnMn52zocOCou7pdzLAcsAEKciQhSYvI2/rl9MxVWxQz7hOWmTOVWdbAPQtqdu+yMV1irPjmLyHa8fFDRrTxI3ssYTh16b7QGsiv8RQ4427lEjstB2FPv2NUd97o2yMwAyxVjFiTwoOWY+0HBZdYv816udrSUZLBV1YsnP3n1QhKHGr0y9/pQ2eApABf1BbF67EBfr8Oiw3E2MnQVbe4jOWsWFuDlugP5qKr4TXjbPTlEz6qXNK2203MRpAqRKX+UMdZuNRs7KLJzktQocNJB6P9TiF7QIWeM6vML35ze4qwC6zy+wCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOvj6L3ndwFldoRl8VDKQb3m6mMF986ZyEQOMl8dXgM=;
 b=SrPccr5AFKAoO37YlcDyTlBuupbc4Z86LXjhOY8LuAkmpaRSqTBlShMUx97P4AU9BzkEyTm9JlFCbiCw5BbGITMI8B+PJvHoo81mDq2eYjqM5ty0H3cltrU4T/uIbWNkxyyDDjUnrDh1qONvZn9BhSIU9TKD8xzAHj3xONbmrns=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB3572.eurprd08.prod.outlook.com (2603:10a6:208:e1::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 17:35:13 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 17:35:13 +0000
Subject: Re: [PATCH for-6.0 v1 0/4] migration: Fixes to the
 'background-snapshot' code
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210401092226.102804-1-andrey.gruzdev@virtuozzo.com>
 <YGySAFr2uWyiI5pe@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <0d1dd08c-feaf-757e-7665-bdcb269a68c6@virtuozzo.com>
Date: Tue, 6 Apr 2021 20:35:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <YGySAFr2uWyiI5pe@work-vm>
Content-Type: multipart/alternative;
 boundary="------------05FF64E0F316A14E1ABC1313"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Tue, 6 Apr 2021 17:35:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0381e617-ba26-4688-9c30-08d8f922556a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3572D9EE546F04F7D92E33DB9F769@AM0PR08MB3572.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:337;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Zia8zUYEsGAgUkjlP+HV+ojc1ne9zhGLT9TSVefIdGosC4gSvCsWlDQAomxrhSSUglhznjJNA2mfQcbBTtYcqnQ/4fLmbsG5aOga7MdQxK/nRLTlY6rIsjV+0713004ecdMWQBNPKq9mKle6KjX+eHARN0C2R6SdxV/S+bUOtym+qSf5gcz+lCBhTtLdlS9K1NjyHi+rCT2eAyPlfALWZ3gsf2Q1gF12ayxJjBtJhSs/+1F/ZOAnExoQU6IvaCGLzVrIorlwtTiVCSbimoKpUlbfk983ISBYLsCP6hEDCqY4iAXlsfyBfCJSP9oNn+GU4TE/xryJeGMhPTP3U2mHuY1cCfEitAYyt+KgspymlINXLgh/dmHuAAhh9bPpQJKRrVdpEoAtP4ZDYKBRgnNnD6Ac0sBndnoc4QP3NE5BJw8CFCL2ZOXgb5+fsUzjrbFhJ/RyakKxPsVE17B9LXIV57/tdDiDKC2sBfMebeZMAh2j8mjfk31RIa5F8trvgGiHqgF+ma4s/xHLrXzjDBzDg/kw0RljRXO2a0yzJYtm9kwoBuiP3KowmbHMoCxA++57xY+WlvF4CNYkwPhszcebPBfk/E86tSPVgzVMV1mGHzwf0DwwYoQpZ54PrACbFf+SLfmtTuReMXUVdtlPI4Q0rKzL9AockZ7R0yl7VpT61TWhxgvZKoMRs0jMRVwE8txuweC4InfVdorseyv35LsL1WodRzo7yfZlhbc0s8RqqzUdpsyyYxsLCxnUS8BVljU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39830400003)(4326008)(186003)(478600001)(26005)(86362001)(5660300002)(8676002)(16526019)(316002)(16576012)(8936002)(54906003)(956004)(66556008)(66476007)(31686004)(6486002)(33964004)(53546011)(66946007)(44832011)(6916009)(38100700001)(31696002)(2906002)(83380400001)(36756003)(52116002)(2616005)(38350700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnE1SWlUbDNoN2c0V0FDNmwwM3lLYmdXdEhtSHJPNmpnaDdRN1VyT2EzR1Na?=
 =?utf-8?B?a0xxUkZUSTVVVy9nZU5tUHdKaER2UnI3ZjQxWVZ2MFJURXZrN1F4RXBZRkYz?=
 =?utf-8?B?NHhFQ1dpM3FUTlpva3pJVUtGWGttRWplSnJnZTlabzljNThlcm1BaWs5RDlQ?=
 =?utf-8?B?WnlsVTlnZ2M0YjFKYnRHVjN1RjZlNTBTUUZSVXdYcWRCMGhKRFZnVFkvcTcz?=
 =?utf-8?B?eXIxM1F2R0dvL0hJRnFrU2hFVlYxS1dQeFUvK296alUycmlhUjdpSU85bzdt?=
 =?utf-8?B?a2k5ckhjL1lBcUExUDJxbHRRM3czMVcwK05TVytNQzFyejlnbTJJMENGOHR1?=
 =?utf-8?B?ckh5ak02VnBYNE8vZ1UzNnFwSEtMZ2pNVVhvM3ZCWm1XenVjRlk3SWJ1N0lD?=
 =?utf-8?B?OFpJS2Z0V2xFYm5GUHRhaGxLYTU3NnZQbGRTN0JkQzUzUkFKU05lMVI3NFAw?=
 =?utf-8?B?VUtMbktHM09WNmtpc2hxU1BQQmdTTVU0WVZocU1CaDAxRG1sNVBFcTMzclJh?=
 =?utf-8?B?RGJOZFhFcUJhTEw4YmF6TlY1T2Vucks3S21EU3UzcitPNjh4V2pMTFhmZGho?=
 =?utf-8?B?U3pNYjREcXlPWlZRMGdOMmNQOGt4WjVJT1ozZDUvbjhEUTROenMyaStrbEdI?=
 =?utf-8?B?WUN6aVFXQ1VsTUcvUHY3QktNRERqeWVTYVFJQzB1b0NKdHA5MnNVNEtza0JE?=
 =?utf-8?B?TlZTSVhGWVlqZUdmTHFOSGk3TUcxSVVJajVwazFFZlNZSHdzUkoyeVJhVng2?=
 =?utf-8?B?UFNXQnZyZFlvVHlEU1EvVFdldWhpeEpOUkNuSjhmZm9NbFN4aWQzc3JTcUVi?=
 =?utf-8?B?N2tMbkFIcDdQY1BkQmIwMERXcm1nSEJnVW5Tbmo3RFUrdWxCMFdMOUFvbkJp?=
 =?utf-8?B?ZEZocFZpT0V5THluMGhVcGE4eVN0dTArNE85eDdpR05rV2tKMVFxZ1Q2c2hv?=
 =?utf-8?B?dWVmcHRPZXBGcnROSVkyR29VZUV3MTFQc2tqa0o2M0cvK1RaZUZHRmJGN0Zt?=
 =?utf-8?B?akxLbCs1bmZlUFFSdXJpS0twUGh0R0VzdHpPZXdOZHNiUkU5MnZCVjlxYU44?=
 =?utf-8?B?WkhFT2dFc0NncEVGK2I3aHlHTnZhMWZ6MFhsM2NhZmJvbTV6MmJ5cTQ4RWoy?=
 =?utf-8?B?R0FiTGViQkZSWUdyVmNGUkFiVkRKUWNxMDVwRXM5UVBYMzFuNEVPOHg4Y1RH?=
 =?utf-8?B?ZmRVd200OXo5TmRLMDdKWFFwRzVqczIvZHRORmV5V1NmUDhNbDRwMnR1RGdu?=
 =?utf-8?B?YWlzanl0TEc1K0hER3dIYU1hNjRxcUVtQ1VDREx5MnI2QU9wcTVBSkhJeTc5?=
 =?utf-8?B?QkhPZG5aRTdkRDZtTlMwNGF4Rzl5bk9sM1RjOU8waS9uaTQ2QzB6b0VVU3dk?=
 =?utf-8?B?bkk2RGdZL0hsS3RXa1A2Tlc3OTNPcmpSWDRDbitZeGw4ZlozQWNNT1pyQVVu?=
 =?utf-8?B?bTg2cmUweEpNeC8vZS9FZDJZbXZYamlDbWhMaUNQSlJPWmtCSWFNN0dxU2Iy?=
 =?utf-8?B?WmtvazlXOVlNaUVzbFlEbEZKaGJnM0ovZ1pFeFlCbzFQeWhGQ29xc3I5eW1Q?=
 =?utf-8?B?SnVWZDVNZ0Jab0l4TVNMdXZadk5IL1R2REZQUHZFZzNTUVdDaUc5em02KzY4?=
 =?utf-8?B?ZmVmdVJMVmRYUnQvZ1lQNFZkWi9BbG9Ga3Iva3FOTDZCYzBsOEliVGg3RDNO?=
 =?utf-8?B?MWs5M3QxTEtSSTVicTFDMzRHNUNVanptYTRTZWQ1R2xIODV3eHIyYUFobU9i?=
 =?utf-8?Q?XMjnjpwS7T8MjFjOFkEC1fznn2Z4QlSkw8/AZHn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0381e617-ba26-4688-9c30-08d8f922556a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 17:35:13.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4Ft8e3Qy5455V29m0mPc7n4xl4xS+YqSK/07JzlQBONesfJ8ju7KG/kHqxBksJAElNXjiLuLusz7Zdd64B3C0sOGy2p3HfmEtkBmoUoGIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3572
Received-SPF: pass client-ip=40.107.20.138;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------05FF64E0F316A14E1ABC1313
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.04.2021 19:53, Dr. David Alan Gilbert wrote:
> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>> Changes v0->v1:
>>   * Fixes to coding style and commit messages
>>   * Renamed 'bs' to 'block' in migration/ram.c background snapshot code
>>
>> This patch series contains:
>>   * Fix to the issue with occasionally truncated non-iterable device state
>>   * Solution to compatibility issues with virtio-balloon device
>>   * Fix to the issue when discarded or never populated pages miss UFFD
>>     write protection and get into migration stream in dirty state
>>   * Renaming of 'bs' to commonly used 'block' in migration/ram.c background
>>     snapshot code
>>
>> Andrey Gruzdev (4):
>>    migration: Fix missing qemu_fflush() on buffer file in
>>      bg_migration_thread
>>    migration: Inhibit virtio-balloon for the duration of background
>>      snapshot
>>    migration: Pre-fault memory before starting background snasphot
>>    migration: Rename 'bs' to 'block' in background snapshot code
>>
>>   hw/virtio/virtio-balloon.c |   8 ++-
>>   include/migration/misc.h   |   2 +
>>   migration/migration.c      |  22 ++++++-
>>   migration/ram.c            | 119 ++++++++++++++++++++++++++-----------
>>   migration/ram.h            |   1 +
>>   5 files changed, 115 insertions(+), 37 deletions(-)
> Queued

Thanks!

>> -- 
>> 2.27.0
>>
>>


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------05FF64E0F316A14E1ABC1313
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 06.04.2021 19:53, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YGySAFr2uWyiI5pe@work-vm">
      <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Changes v0-&gt;v1:
 * Fixes to coding style and commit messages
 * Renamed 'bs' to 'block' in migration/ram.c background snapshot code

This patch series contains:
 * Fix to the issue with occasionally truncated non-iterable device state
 * Solution to compatibility issues with virtio-balloon device
 * Fix to the issue when discarded or never populated pages miss UFFD
   write protection and get into migration stream in dirty state
 * Renaming of 'bs' to commonly used 'block' in migration/ram.c background
   snapshot code

Andrey Gruzdev (4):
  migration: Fix missing qemu_fflush() on buffer file in
    bg_migration_thread
  migration: Inhibit virtio-balloon for the duration of background
    snapshot
  migration: Pre-fault memory before starting background snasphot
  migration: Rename 'bs' to 'block' in background snapshot code

 hw/virtio/virtio-balloon.c |   8 ++-
 include/migration/misc.h   |   2 +
 migration/migration.c      |  22 ++++++-
 migration/ram.c            | 119 ++++++++++++++++++++++++++-----------
 migration/ram.h            |   1 +
 5 files changed, 115 insertions(+), 37 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Queued
</pre>
    </blockquote>
    <pre>Thanks!
</pre>
    <blockquote type="cite" cite="mid:YGySAFr2uWyiI5pe@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-- 
2.27.0


</pre>
      </blockquote>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------05FF64E0F316A14E1ABC1313--

