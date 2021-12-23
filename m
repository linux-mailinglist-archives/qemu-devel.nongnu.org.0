Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED2547E685
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:47:02 +0100 (CET)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0RF7-0000JT-3a
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:47:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0RDX-00081N-QU
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:45:24 -0500
Received: from mail-eopbgr80092.outbound.protection.outlook.com
 ([40.107.8.92]:26113 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0RDU-0005Am-RQ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 11:45:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDglaS1SN3V/uBYYKnTdhKzbWTGsYqqrL4UJjrli/aGZay3/bg29hU6tPmLmKsf1qXe7uGc/QEtnwGlYMY8r20Qf/WUqwXmCTzgInOMFGZ8c5HjKhTxbPyiRpFh2zAX0oNANmgRsZlOYdV0c+8UQ0xgX52qvCa1Mad72VXhI+dkOwkmAacJ4C5WAu20dh5DlfbwcaCe0NLjGtlXGJp1VGLgHWmeGNT1h0dX6bwNd7bbq3rLAhz2mtrSBsNmCD2wS3IUpcyMjhVCVS7Qvh2hnZVnC7XCrvxC5UetFkRRK0QlcuSWoCal79kdfC6R0I2fwCTe9FXGaTISTHvUZpPdgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+XjBp5onW9IP0C462b0hHJTETm1V6KB7iuMHulKONI=;
 b=dRrw/FATgTb4bkY4JnuJhEP0kHurywMXi/04QKN2/hH/2L1i4BycHGKnpFI45hL6RpD6let13R9ziTXKNY/GWB6es9dYbps2mNpVp3zXGdkLBkEYtI2bgNur+DYpaVldN8Ig7Jcj/kE/+HzMmEXZ07b6ySny9RgB4r+D3wznIaJvvGh66x1HHWL30kVlHKBSg7WKTpCNLPKPs4qkTJdnuir1a+/A0e10JDp1j5PwUfKq4t1+M0eB/JUh+/DswpG7HFgAldpH5aG83JXT4sSbJIwxCOrlRDG2gm0ohkDRp3InaN6nsVDoB61dHZiqvMbn1M0ynTtflX1HL0qxAXBBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+XjBp5onW9IP0C462b0hHJTETm1V6KB7iuMHulKONI=;
 b=Dq8yOkiy/PyHB1EktJOPlqVUR6KkK7acIDlUcdp9yzb2KS4Yb09jSlExbM3n8d4LVaIIm6Zn+WKrT87mE4PsE/51NcG+8FCKhZjqqQaVqhtt1xuKj7afrd8fBI2zjxfndc54lNtJIdBQh0vdL3vlCWm9LQKRaNAbKkSrET1AaqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6804.eurprd08.prod.outlook.com (2603:10a6:20b:30f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:45:17 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:45:17 +0000
Message-ID: <13a83096-f42a-5cbb-c2cb-764cf4f28175@virtuozzo.com>
Date: Thu, 23 Dec 2021 19:45:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/5] net/tap: net_init_tap_one(): fix net-client leak on
 failure path
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Cc: den@openvz.org
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
 <20201221190609.93768-6-vsementsov@virtuozzo.com>
 <3c1f4d68-c0e9-4ecc-fede-e575e77be8e3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <3c1f4d68-c0e9-4ecc-fede-e575e77be8e3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0b65250-1cdb-43d0-1ba0-08d9c63399cd
X-MS-TrafficTypeDiagnostic: AM9PR08MB6804:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6804B15FC9DFF2E65B1ABE3DC17E9@AM9PR08MB6804.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FsrdN64UIGs23gpjiHKJrxL9pWFSd1EQL/+JZD2tpSdOV0/l1p+l1hQ5W9l/dKR+ADt/DOvqrCWKv366PTfRoQnSxBG5ONf+BCBjb33A/xdNTOGcPVkmtJttvGU0mooXoiiIo2E2n84O18/4+gDL5tkOl4sfcWX7H/0eVe5v1XYctn4O4mm/eU2T8rE4c8RrYwJ8BFN9+tFuM08TZDoZ49xJ5GTtQwmaz2Zr6tYE/O+iykTIgZPd2zkt3DbFsNBrEBK38XEe8wLjHeuDaEnqyiwe6alpmMXXuZy7bJ0szvUU8RZXEMdvl4ZsZapXImou7Pbpcuc6MbYo2+bs6HsgDD54qGVPLoqW4XilNL7sVhtu4sLOFoZJGcGCEwkdvVL8uN1HEEafRNA6XTwS83Hqy2AyJjxXTescTsJnEg34esLbY4d1SKOsbZeMVvHc/Xu/oFMW/JtoboTN/AUx6/OQxBS/XxmMOAvobUQX2Ghe+yF+zFYVZizzhB9rzrxZVGDYUdoBIjwnZUWvXkPojFrdO2XZ8jFNcR8YyaVMZR05ZYozFD7oq7T/FL7l8phSII9alPF/2C8uLvQArtoOOa24Y980OlZVmdH3DwsI8ryc1pIu0kUfmF6cGkfXtiAEj+Lfp0kWURdix2vjFgAEOlvKkVjYHdTAbyUfffS5sOK1XMt+Wzia+zKNg1BR7ACo0vTdyTvRbRrlm9BikrGaeELqnxj12yZuixj8ySxOkfc9zlvlPBmLSqwQnwInf/3K8kdubSAYrjacnxfnUu6Aqw/POw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(31686004)(2906002)(86362001)(2616005)(83380400001)(8676002)(31696002)(316002)(186003)(26005)(38350700002)(6506007)(52116002)(36756003)(8936002)(66476007)(66946007)(66556008)(6512007)(508600001)(107886003)(38100700002)(4326008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzhiSkJFV2NwblBsTlJiTHZHcFE3aTRnT0FhOWpNejRhQ1JiSWV0OXpUSVl0?=
 =?utf-8?B?dHo5QVlBOVZ5VUtsOVVNY2RrNWI1UFZPUUhlSCtDeGZUVytzS0g2d2JyUVFy?=
 =?utf-8?B?VWZqWU4vak9CNE05bE50R3RtMWYvWHlvRFVvdHdES0dKTWJWdWRhTVJTRUdP?=
 =?utf-8?B?cWgrbytHcFM4ZmxQQm90M0FDN2NyT290SEdaZzRsVXc2WDVBWlZqdFNzUzAz?=
 =?utf-8?B?c29GNU90RWhYSGxHSE5Qa0RvWHhYYTZCaTNoSmhqQnk2Qk0zVFFCd2Nkbk9z?=
 =?utf-8?B?UG9kV2NueTljSWpsRlE2a3NXZmFBbHhqZ0I0K0JtWWJvUUhJVkxUNkJhaWV2?=
 =?utf-8?B?TEo2Y0duU3BrcDV1akFrRTMrRTI5ek0wMlhuQmlJUzZ0cjZSczNTazhBTHBS?=
 =?utf-8?B?U1RENnlreTRwa1VDZUFPRzRmTzZxSmMwWXM4RlNuQkNPK0pxQzZ4ZjdtdHh5?=
 =?utf-8?B?M1F0US8vRkFXUnYzWWlacDJ4dzQzRGN1STVXdVIyaHRaQ2N6eEJjQTBieTFO?=
 =?utf-8?B?MXNjdjhvOGxGei9lWElHN3YzQTBQdGJpcGRHNXFvYkQzMjloUTJ4dlFyL2gy?=
 =?utf-8?B?RDU2Y3Rramo4a0RiWTJPcVh0NlZYTHVaeWZMTGJEQUc0VzFQNW5xUVp4SlZJ?=
 =?utf-8?B?bjRZbmZrcEs5VjdEQ2hJMXFMaFFMOXlqcmF5ZTNmK0V2WXZiS2hJcVBveW1C?=
 =?utf-8?B?WGVrcmE3cHNJSk5rUUh2Mmh0d3kxclkzbnVMT0x3TGoxU2tVNlZ5eEcrdVNT?=
 =?utf-8?B?Y3NRcjV3bDFJNXp3STl0SzNqN2Era2s5MDNvVndNenpPNERIMjRKdmQyU3lC?=
 =?utf-8?B?STRJakJ4L0RBWDJqYUNxSUdtMVFyTUIzVk5IelRtZmgzRlFHQlVTMHQwMWJq?=
 =?utf-8?B?UUhHTUxxbWFTNXNGWEdZeXJEd3pJVXlZQ3Z4cmhRdFlYUC9hR0dhY1RhZzBZ?=
 =?utf-8?B?TE1NMHlLMzhLTWZTMmZ4SkppNDc5U3lJVTcwNXBMTzg2dzBhQTYxZTlxR2Fy?=
 =?utf-8?B?ZEJCWUlCTFZTbUZwZEd0cjgxTmRMdytqRCtUenliNmNKSUtna2hZcklsMlBk?=
 =?utf-8?B?SEFFeEMwT0l5TEFmYkpXa1QyQ1g2VDNOcFJuM0lvd0U2T1MrQy9mbHRkck9D?=
 =?utf-8?B?NVdhcnpMR0NYUlBOOC9BSitSSXdMUHJWT1R5ZUI3Z1dGSHhLUXJWQ1lsK2gy?=
 =?utf-8?B?SmxKbTNkcjVxdUEybHFFRldmMTRBeEZkMDNNSCtGaHVRYWw4aUl4dUFiTDc3?=
 =?utf-8?B?VEF4WkpySHAxMmJLY20zTUJ2dmVMWlZyako0ZjJ3UDZLV2ZkV2dxbE03MG8v?=
 =?utf-8?B?NTRyYm1vTklINUZlbUFkWXgyS3RiWFZaY2tzVVNDZXNlK3JMQ1pXdWh6Q1lz?=
 =?utf-8?B?Nkg3QjdDNjBaVFFlU1hRL3pRL0hHTVZTOXJKd005V1dlV2d2ay9sdGNCdHBs?=
 =?utf-8?B?SENQYm5OTE44SFV2TUFYNjc1RU5kSUljUTJiU1gvSFM5UHJ5Z2lKaXlIOFo4?=
 =?utf-8?B?b25jbkhaM0E4ZGkwYXduZDlKWkRVdmhPckxOcldwV1FZMkZsV0V5RjAvaE1L?=
 =?utf-8?B?TVk3MXFVMVI1UFFpVlZTTzU2blFnbTkvbTd5NlBzUGNYdWpUVG4xbCtRQVBr?=
 =?utf-8?B?d28vTytTbFJQTUlUN1ZqTCt4azJHVm9XNjA2NWc3c3hjQjNIY2NQMjJGR1Yy?=
 =?utf-8?B?L0FFUkNxdndLQ2NFaHRwRWQzY0wrTHg5ODhIOUx3Y2VyalJvdHI3dkgxMU8x?=
 =?utf-8?B?NGRyVGpwWXVwdldIU0hEUVcvTzJiYWEyZ1I5Wlc4SUl0cUl6WWd2cmxjdXps?=
 =?utf-8?B?dkROL2IvODR6c1VBbGdmVmFwR1NOR09sb2RmQ0M3aEtyanEzKzBRcFlHTjZS?=
 =?utf-8?B?cFNjWENVVjQwa3BicUVMSWVIbHFOYytGSlNndWg3OUs3KzZZSUhIdjRmN1BW?=
 =?utf-8?B?WVpZTDRUamltYTJjSjc0SXFSN3ZEdU1WVS9wUGVQbGdVb0hQTllCelloRWg3?=
 =?utf-8?B?UnZLUS9kemVtTTZnVHVnMlFQVTNVUmU4bUFXclNwNlZKN0FwYkpBcWtFV241?=
 =?utf-8?B?NkJoclpxQXBaYVp1OFdFMU9wWllCVm5ZN1N6cWRPSTQ1bkZ0NlVKdkMvREl4?=
 =?utf-8?B?a0xXN1UzRUZvMWZrVmhGbXlZdVFaTlAzNTU3MXZWaVBUTS9LNnk0bjNDTjIv?=
 =?utf-8?B?SVZJdlRTU2o4SGIxdjFPK2E1VEViN3JGMVlxWWxKTU1Rcy9UaHc0VDhMTHRz?=
 =?utf-8?Q?+aNgIc8TM6xwCNFyOnaGgMguUd3Gzs9Mqf0W1rl7iI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b65250-1cdb-43d0-1ba0-08d9c63399cd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:45:17.8435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8G2184CuVdUncpFbtKoCDZIaRTEuaoiOmYyIaIcwE1dcFXL+DsZ3T3UNSfqVl7u8UXhlVXM+MzwGHNQ2cfRWZFF11N31miq1UEicAn7QuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6804
Received-SPF: pass client-ip=40.107.8.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

12.01.2021 07:53, Jason Wang wrote:
> 
> On 2020/12/22 上午3:06, Vladimir Sementsov-Ogievskiy wrote:
>> net_tap_fd_init() allocates new NetClientState through
>> qemu_new_net_client(). We should free it on failure path.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Attention: it's an intuitive patch.
>>
>> I see, that net-client is leaked. May be it's still freed some tricky
>> way? And I don't understand the whole logic of qemu_del_net_client(),
>> it's just the only public interface to free net-client I found.
> 
> 
> Your patch looks correct and it's indeed a leak.
> 
> I wonder whether it's better to do the cleanup in the free_fail label in net_init_tap(). The reason is that we need deal with case of multiqueue. Though qemu_del_net_client() can handle this but it's not clear if we do it in net_init_tap_one().
> 

Sorry for so long delay :(

Now I'm thinking about reviving this series. But I don't understand what you mean about multiqueue.. I think, if some function allocates a resource, we should release the resource on failure path in this function, not in the caller. Good functions tries to roll-back any visible changes on failure.. What am I missing?

>>
>>   net/tap.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/tap.c b/net/tap.c
>> index 89ea04862b..ba4c34af3d 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -711,7 +711,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>>       ret = tap_set_sndbuf(s->fd, tap, errp);
>>       if (ret < 0) {
>> -        return;
>> +        goto fail;
>>       }
>>       if (tap->has_fd || tap->has_fds) {
>> @@ -739,13 +739,20 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>>           if (ret < 0) {
>>               if (tap->has_vhostforce && tap->vhostforce) {
>>                   error_propagate(errp, err);
>> +                goto fail;
>>               } else {
>>                   warn_report_err(err);
>>               }
>>           }
>>       } else if (vhostfdname) {
>>           error_setg(errp, "vhostfd(s)= is not valid without vhost");
>> +        goto fail;
>>       }
>> +
>> +    return;
>> +
>> +fail:
>> +    qemu_del_net_client(&s->nc);
>>   }
>>   static int get_fds(char *str, char *fds[], int max)
> 


-- 
Best regards,
Vladimir

