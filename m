Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8A350561
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 19:23:32 +0200 (CEST)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lReZ0-0006CU-Fi
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 13:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lReXO-00054B-1r
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 13:21:50 -0400
Received: from mail-eopbgr10103.outbound.protection.outlook.com
 ([40.107.1.103]:22815 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lReXH-0004hu-MP
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 13:21:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS1XB0/CXZMYDDeLOMcMB0qlqGZwJOHyUyZ9WUNyPLi0IRkSNFrjt+ipQRkKLL/DSgvQpHfvsnGlgPAjcIVWkLf8x/DgYRIurwAKrWJH4hEh9KdiQKtRYpZYGM0CH+p3c3J3hPGoxgN1m4pg4GWQrqR5ty9ZLjrE7/Skv9YKW7/eJBweUBQACGeP+z83lzqQwvR2r6v4HanM9522vb7aM4+LV9s7KJIlNJLz62b3+Pp4+j4Q62yfCejgUiwBweaf4bRlGdIil/E767eqtDj9qq6bT04Au1HCM8E8pid0JTsX6JQe0OA/UpIyUfENaIaq2sHXyOgL0ZvxIqDp3IH6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v2FXXXatm5vpwdkeH/UFYK+Wff/Cf5wjpH5DaF09zo=;
 b=Ya8Dy2p2G+CbMyOvFKGsHrAHz69gxJwbe02BjNCkFLoBGkFvHdnXEPZa6OC0U0YtVeqL82uZxKxVlQac8S3WzJFBNzGzQRmKtUXUC2wxa2RwxdmtzhDxEIGA3Bf8TSMNkt0rndAjJt6XjcV7AScbhvgcC6tL/Vx0/8F12AcSrkcQuDiw/tPmHhLorjnXmoyQ1zgvdpP+iXNZJHi+zVXbEb5UOWf0AfjWo8GrQvNGJLPddT/RFiCBnP2bC5ts7PnRbrSk0BhbbxqBrbbJCTNg9YScbE5yExIIZvOdoZENWHqmReKyHVgMX5xQLsjn4RED3ev+9ZR1p6LnA5T9T92H8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v2FXXXatm5vpwdkeH/UFYK+Wff/Cf5wjpH5DaF09zo=;
 b=cWvL6PV/q5Vl6UWbq8TnBWMJA6cDxCEiNx/eAaoM1ZA3UzBb/zTqn5+9j1fH2p/qraSN64C7bVZ/01YlZYZOaqyPWbHlXxVL1T+WDYV2V0j/WyDhvIvm3WFaEsXNmEJjBxF++8+kxBQMq7g9kvQecJnGr+GgA/OdFyCP82FPmyc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB2995.eurprd08.prod.outlook.com (2603:10a6:208:5f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 31 Mar
 2021 17:21:34 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 17:21:34 +0000
Subject: Re: [PATCH v2 0/3] migration: Fixes to the 'background-snapshot' code
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210331154809.86052-1-andrey.gruzdev@virtuozzo.com>
 <20210331160257.GO429942@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <d45c9f47-2337-ad68-06eb-7473f7ec069c@virtuozzo.com>
Date: Wed, 31 Mar 2021 20:21:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210331160257.GO429942@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------A5B95CC65AC2FAA2D08C9FA3"
Content-Language: en-US
X-Originating-IP: [158.255.154.235]
X-ClientProxiedBy: AM0PR03CA0048.eurprd03.prod.outlook.com (2603:10a6:208::25)
 To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (158.255.154.235) by
 AM0PR03CA0048.eurprd03.prod.outlook.com (2603:10a6:208::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Wed, 31 Mar 2021 17:21:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eba74820-c0f6-42c0-d40a-08d8f4696ee6
X-MS-TrafficTypeDiagnostic: AM0PR08MB2995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB29955DA3BF02615312F167919F7C9@AM0PR08MB2995.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yrlH4MNax1Q/qmgq5hJiLxMtQf7phAQbNQNK+qi7Tc0bbRohah2DZnrgUmqxvkmDfFGMR3ElrxC38j050V/hse0y8UuyJqra44zhZYJz1fH0iFUL5463Y/+pTu8LXKeMrnS8ID57XwhQvZuji9hdrOnKTDTe6T2P5AT7l5g17HQZ4V7YDvA0gGK1IGfvHyIvk+odMiYT73jWaJei9Pm005qdhgVNmGmiaKRtz6lFAfEcgURQmCo2OOvmNM6EhjlbV1awdbkGRFzuZfVFF4tkJLCxvW6rVrB+WcnBvlMksy6vJG/kejQ9bZhzVMzsOZLrH5eA79FkTWKnEf/RYhF9L6KZRYeTai3GmoFVJM07YIIKmDbjbSpFRUpqfxMjYixzC4UozelkHIAazkAhY2CQ43UrHzGIHo5s8m9QL7UoXVRAf/2EvsOcrW+JbT0HaxknjSfdfKGCDayEv46TBm4gR/JgtTZU99czoLHKb+7U3nSar/OSwPwZLYWEiarhBPGnsBmgJJZQTCBqyfpha2WIXbXACmG4rlKcb84yF+jDZFfe6Hh5bVv3ctj7VXZ26fRVl0lWpkNyLPDdm+BFmaW4NOkpE+gU70lQeGS5nw/RRtX+GLT4jpyTyP1OAIoyAIEntNHDo2QfLgE1QGjM/eeLTVTlTl6ryXnNt93tzlVQSxbRVDqwejbI108itCoDzA8emDzn8MBg0dKhmir/ti+3jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(376002)(366004)(136003)(53546011)(38100700001)(2906002)(31696002)(33964004)(36756003)(5660300002)(956004)(83380400001)(2616005)(8936002)(478600001)(6486002)(16526019)(4326008)(186003)(86362001)(8676002)(44832011)(16576012)(316002)(52116002)(31686004)(6916009)(54906003)(26005)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWxYa1NHZU9hU0hrTC9XTy9HRUVLOWdnRFg0aitvTXdOS1FwV3VsL1h0KzAw?=
 =?utf-8?B?T3F1NzduT2lPTUJxSjdoOEF1M1J4dVFvOFVINUZMcnladXlrcFpYdXlBSHUy?=
 =?utf-8?B?bXNucjZ0MlRXNWlWYWxRTmRxMVoxSm56Nmt3b25ucnhwSUFvR1RHaTFsNFdv?=
 =?utf-8?B?TU91a0RxWmkxb2tkQ2tIQ3BNVUp2aGplOWtjak5DVWI4d1Nyemx1N0k1dFFX?=
 =?utf-8?B?bEFhazAvQkRKYWhoQXdIZnkrbUdEQ0g5OHBXSVJSUVM0RUozdlFuQzJ2dkNM?=
 =?utf-8?B?OE41VnFhMUNYbklWU21nWDdnZkMxOHZKZzZ6dlJRaXQvczlaeWNnQm9Fczhr?=
 =?utf-8?B?QWlhdXEza0dVV1dMcEVOOWQraS9Oc2ptU2ZQOFQvVFF4QnpEYnhjUzVUU3Q0?=
 =?utf-8?B?T09oQTNBTktnaWgrUzFPVUV3TzdncWltM1Zid1BkTG9uTzhPUDN5VjZyRFdC?=
 =?utf-8?B?VzJ6akJJVCt1TFl5VW5qMGhOcUhHTzNWT2k3aFdPV2REWVJaNlBnajdQUVU5?=
 =?utf-8?B?N3JJNmpXQlNEbmtwVHVYbVJhR3BVOVJ6MkhBYXFXcUJYdVN0WS9kdUlpWDZn?=
 =?utf-8?B?eDlPZjlzckdVdDFnVDlQQ2RDVm5jaGxWSUtTcllOem5nTmdCR3Q0SkJMNW5h?=
 =?utf-8?B?NVhycXEzaCs2OHNMTmlDTUQySXRWeUNWZmtDd2h1QkJxQmljM3pMVjdVeHAr?=
 =?utf-8?B?RW5WTW41Rkg4WEpZTm8zSVVxUHJMWkZiMTlGZC9KMDVKSDhqelF2N1FkTnJO?=
 =?utf-8?B?cUZKcWxpdmlMNTNxZkxHODdZaEtGY1lEQktCOVRxR3k1QjZZbG4zaFlXVDhu?=
 =?utf-8?B?cm9qdG81Qys4WU80cnNBczMzNnNWZkxLakc4U2puQzFLd00yTkhFai9LZ0hQ?=
 =?utf-8?B?QUUydDBSWjRRWVBPTlY5VXhWWDFaTTI2eTN4Z1kzbnNzY1RqN3dWekZEaHhJ?=
 =?utf-8?B?bVp4ZXF6SklpYlM3UnhEOWJ2YkdIcWpzMEw0T2l6SFJhWWxRVGQ0OWw0Y2dJ?=
 =?utf-8?B?dWRkcytEYXVRSlAzUjhXWGdHZGNGRlFQdjg3ODlHOGNiSnpoeXcyUXRkMTdR?=
 =?utf-8?B?bG1QRTlXZFNoWFNlRjNBZVE5NXNZbG9aRkFPQUcvWGU1dWRIUnA5SFZSK0lw?=
 =?utf-8?B?MDJTTlZTOHVhdC9PZEVJZ0lsWDBHeFVTTnF2dmZuc0RLMUhoTFJaOXdLeXRa?=
 =?utf-8?B?QWdLMmFJOEVjbDBrSHJoMjdQOURmZWRiNzV5WVEyUndFd0ZBK2xyUVB4OGhV?=
 =?utf-8?B?d0x4ZWlENXZXYlhCSXhUR3pUSGlTbnV4ZS9zY1pTekw1aSt1TzRHSU9iK08w?=
 =?utf-8?B?eWJsRzJxYlZsU2c5V2tzSmtmZTlCL0pPbXZ1Und3UmNQTTZJZERYanJaNlV2?=
 =?utf-8?B?MkQvVllqNTROYnNZb3NTNmlhWnhicEJIc01hNEVIS093bk1nZmsxbnBQSnJP?=
 =?utf-8?B?Wkkrbm83VFczRVFMYUo2TlhvcEMrNFZtcGhwYnN5QTB5QnN1M0pWYll2WnlJ?=
 =?utf-8?B?MVlHUE9paVorcGNWYVYrQW1oajlSNGZoVXZjUGFjSG1WV2MzK0dzcnowQ0hv?=
 =?utf-8?B?djBJV0N3blR6bWNOKy81SVR5TkNvV1kzSkpEazZxb1kwWWtQZWVuNnlmNGNz?=
 =?utf-8?B?b1A0RUU5VERYSmRxa1RRcWdKY1k5Z29TNWJ0TEMxaUQ3UUZQY05Oam9UR3Ns?=
 =?utf-8?B?WFBoZ25TME1Lb1gzczdwejBPZUJlWTVHMnROL3lrSEJMZlJ2WmRCbU9Qb0hu?=
 =?utf-8?Q?JH06lN93p7BidRw1k4MSBLiV7RALZA8dRXu30AD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba74820-c0f6-42c0-d40a-08d8f4696ee6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 17:21:34.3429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xV7qxLHn/fWr+laSFIL1gZXNtzlRzUPYsWmAXSiNgV0SYk1CqFmTrLxODMa+0KQdwKC3VKKMoDfpmyYTJCch2ry3cbG0lls4D5tu6fpx1so=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2995
Received-SPF: pass client-ip=40.107.1.103;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

--------------A5B95CC65AC2FAA2D08C9FA3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.2021 19:02, Peter Xu wrote:
> On Wed, Mar 31, 2021 at 06:48:06PM +0300, Andrey Gruzdev wrote:
>> Changes v1->v2:
>>   * Added comment over the overlooked qemu_flush() in bg_migration_thread
>>
>> Changes v0->v1:
>>   * Using qemu_real_host_page_size instead of TARGET_PAGE_SIZE for host
>>     page size in ram_block_populate_pages()
>>   * More elegant implementation of ram_block_populate_pages()
>>
>> This patch series contains:
>>   * Fix to the issue with occasionally truncated non-iterable device state
>>   * Solution to compatibility issues with virtio-balloon device
>>   * Fix to the issue when discarded or never populated pages miss UFFD
>>     write protection and get into migration stream in dirty state
>>
>> Andrey Gruzdev (3):
>>    migration: Fix missing qemu_fflush() on buffer file in
>>      bg_migration_thread
>>    migration: Inhibit virtio-balloon for the duration of background
>>      snapshot
>>    migration: Pre-fault memory before starting background snasphot
> Should this be 6.0-rc material, maybe?
>
Ah, yes)


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------A5B95CC65AC2FAA2D08C9FA3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 31.03.2021 19:02, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210331160257.GO429942@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Wed, Mar 31, 2021 at 06:48:06PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Changes v1-&gt;v2:
 * Added comment over the overlooked qemu_flush() in bg_migration_thread

Changes v0-&gt;v1:
 * Using qemu_real_host_page_size instead of TARGET_PAGE_SIZE for host
   page size in ram_block_populate_pages()
 * More elegant implementation of ram_block_populate_pages()

This patch series contains:
 * Fix to the issue with occasionally truncated non-iterable device state
 * Solution to compatibility issues with virtio-balloon device
 * Fix to the issue when discarded or never populated pages miss UFFD
   write protection and get into migration stream in dirty state

Andrey Gruzdev (3):
  migration: Fix missing qemu_fflush() on buffer file in
    bg_migration_thread
  migration: Inhibit virtio-balloon for the duration of background
    snapshot
  migration: Pre-fault memory before starting background snasphot
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Should this be 6.0-rc material, maybe?

</pre>
    </blockquote>
    <pre>Ah, yes)
</pre>
    <br>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------A5B95CC65AC2FAA2D08C9FA3--

