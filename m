Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93990462282
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:49:57 +0100 (CET)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrnb2-0008HK-9c
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:49:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mrnZ6-0007Lg-8o; Mon, 29 Nov 2021 15:47:56 -0500
Received: from mail-am6eur05on2117.outbound.protection.outlook.com
 ([40.107.22.117]:34347 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mrnYy-0005tN-H7; Mon, 29 Nov 2021 15:47:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRyhDxcBB+MPUeBhQpWup4YFIVx6C5540wUcQhnJ0cXI6q1A/YWd3ceZJbCt9fRK72LZv8Tl3iv9dYnUWzvTiNh4SPf0zFHHxrUzjvkHGPSUaRUtmz1u3Wg7JtIANewsUHC0vUKyvbnwz5eVgy05pe/bqiEaWUmiTVXjCp9JX+UoH2r4xNBi/gwFiPn2wgjvs1fTMV8cZ0hOG+kqsJb2wUoKgeePU9DPvy/rF1Y5sxZDmdQdj/+tPESIVCACTxLa8EcuVlrlMCtLBbMb6JVxlkQxL6Ho7Q76IBf0yn3pyoO1TjY/HflqjqpQimBGCzCGbbgmOC4C7HKXfR3QdV79BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svjiV7ikmX/t8wsG3b0M6UA3BbwStmW8VV+5KOv62rw=;
 b=XaW05477dhB+sgvafzPqOL9ZaMUIet7PbJq0c9NV3FY0QtAAD5w7lyTm4iO+gX3X8FD7NsiYACvguvMdswRUmCJ03kUZkpPGzjrL7jBBO19YZr+ntUFYCrwIuGn4mpjS9z92jgpfm6CBGTKR3p6T23Rlu2uih2FZu+njhti2Hm/ueEGTKY8ArDJopPT6L3+F8h4SPdfWnudgmf4XE2VUw4fWW5f7Tr8UcHsyoDHQ84fZtYw+U5M2uCi+yDaFqkqaWSrlLkTAnftkn5OF+4IirfNE2d8bYsv2dzmUMb7SUhll7p07CoIAa8LJRRzaOylvrsb7cTiXZnmI1Eo/YSiLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svjiV7ikmX/t8wsG3b0M6UA3BbwStmW8VV+5KOv62rw=;
 b=KOpRlz1kwoe5GoShHs13NcX56NZZyY7p+g+41nCJDW9lY5wvYJEWnEqOa8+3GDJ7XvkfulAOzhCs2BOe05ANMN45C+i7qFhkp7imz2rlLf+a8DNTOVv7nV1LOgOLmbkCbWEy93p8IT6DfRUe2Z/Vj19Qt3Hjmmkuyg6NqudqnyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5043.eurprd08.prod.outlook.com (2603:10a6:208:166::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 20:47:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 29 Nov 2021
 20:47:43 +0000
Message-ID: <e8605a29-6a11-8bee-9734-14571b0826df@virtuozzo.com>
Date: Mon, 29 Nov 2021 23:47:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC for-6.2] block/nbd: forbid incompatible change of server
 options on reconnect
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com
References: <20211124140951.439684-1-vsementsov@virtuozzo.com>
 <20211129173428.fqpcxd4ipjwrsr6u@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211129173428.fqpcxd4ipjwrsr6u@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0019.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::32) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.234) by
 AM6PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 20:47:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 807fe330-fc49-45dc-f435-08d9b3797d66
X-MS-TrafficTypeDiagnostic: AM0PR08MB5043:
X-Microsoft-Antispam-PRVS: <AM0PR08MB5043EA46983D04D3B89DF709C1669@AM0PR08MB5043.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3cbiVgdT1P/uFbohQXLZ63PbGtiD4VIMoCWcrPJagsA4XVBeZmN5EK7LXZukPq6UfmPArQc/3bRCgSglujXUDusI1zki10MST+IBAOkWlRjsq9tBlx6RNA+nkRpm7y9TR/DIslhJgSO0AaEglik65BX0VXaftH30HIccZq9/+Bc7O/sXLAomcVhP/xII5P/C5kZ/HRmo2TOUakaO+/+0xzpW4/9uX0inJBiPFnGckDfX1t8RgzvumQjZb6Kbag1kEw1/mkzDQQ7DWEU1zpA+OFRlKguQUP2Jzd4RfEkESnDonC3Cd5lyBO00SxJSDEDa6d5IszU53cry0bWconhEGzekn4P0yb6B/YjSX/UqoKgLrbuTCU72Ij8bJibmxPYs8JrtegJ62JN0FlhhuySw07WKdIp3cwhV1nhfWemCXpSdNQx7WNdussIIPYus67oOwZNhPg2a332gwjMyOZ5Pe6B2iIL2ABuL9MbrQc6du40rxvDSSdKkF41Fe1CRmI5Dv337qS0RfbgAAHs9OH0LpbrA728R1ZOo5ZGiJjRcADiMxkHB0Zqf65u9kjMygB3n0aEA6k4BPg23Ll0WWXHhNCqicUXqfZvo0cHtiQK2NT58dW6rukw3Z0kShg61oUIXWZ2RgD6r3z8sS7me2lrJ7I//xQG0qmW+oajhhDLQJjZJTsiAd8YzpL6AtrnneM2/ni6qfucMsrCsGMuRh7RrwzFN4yAuYEn+gPLaVs8XntA1xftbgOjYpv0JIQvnttfr79Nihs5KgII9Iny66GCsKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(52116002)(316002)(16576012)(83380400001)(38350700002)(8676002)(38100700002)(2906002)(31696002)(6916009)(508600001)(26005)(8936002)(6486002)(66476007)(66556008)(66946007)(2616005)(956004)(31686004)(4326008)(186003)(36756003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2VyNG0vR0pVY0xjaG03b01LNHNNVDM5SG9Fb3Z0MzJoc29vK2thWlpGVVI2?=
 =?utf-8?B?dEcyTlNydTU3T0QvYkNISEh3SnFUOERaNDRXZlErMDBmUXE1UU1YRlNtUEds?=
 =?utf-8?B?NTRzT2VVWjJ1QWs1TUl0eEJNd0xLN3lhQzk4clIrQ0NxWjAvb09sbW1sdGhB?=
 =?utf-8?B?Sm9xc1RzVlpMNWFnYTJWQ010VndIQkpQNmtrVkF5aWl5RjF3aUtCS2JZQ2RE?=
 =?utf-8?B?ZjVCME1BQXRacHZyTDV2dzVPWmpyM0E3NHhUOUY2MDdlc1F2MUVUWVM5Uklk?=
 =?utf-8?B?WXFZbWxTU3ozUUllR3NITXFsY0lmWjQzZU5JMHNEL2kwTVlXNG9GVCttY2tJ?=
 =?utf-8?B?M2R4b05Rdzd3YlVQUWRBVGRaTkhNYzE2aDRtUFZtOTVrSFFsQXc1Y3BtL3FV?=
 =?utf-8?B?TnNyNDVXekxMNU9RKzlHa2JBOWxtUStmME90a1l1NmhhSWpiczJJcmhzQWRi?=
 =?utf-8?B?MklVYWc3c3BXdGNnM1ZjaC9pL0pDSUZ0V2tpYUo4U3dQV3FaWVJSbHBteWt0?=
 =?utf-8?B?MGJ4Q3lSY1VvcVo1Uy8xQ3JsbG1lQkQ0Z1FQaFN4RnZ4bnlId3RnZE9Pa25l?=
 =?utf-8?B?LzlLaFhiSmJad0lPZXJpMC92alphZXhUV0FMNW9IUkhDSGlFM2ZTNDFpNTBZ?=
 =?utf-8?B?Vng0L052OGI5L0FqM3BFZlQ5WEpsblhpVEQ3LzIyVm4vbDVLUVVnR2IvbjVV?=
 =?utf-8?B?bjdCRU9wZUZEeDhQY3RUd2puV2Y3MVVScmlmN0FJRDlmMjNNS2JoSWhjYktR?=
 =?utf-8?B?dlh6NmFyTE1TZVUxWDlRK05XaHpiazFJTHZXaFN6VXhGa3V6ZWJxMXYwelJx?=
 =?utf-8?B?bk00VGxPN0NUVW4zMm93UVlXOFkxSGNWWFdUbi8yM3JLS2h6MXRRZjJyNkY2?=
 =?utf-8?B?K1g1TjBjYkIrYlV6ZzdLMmlMY0poNUlKWHNidVpUUkh1VmloRG1zZFl3NXFn?=
 =?utf-8?B?Y3c1RXZWdE1TSXJYdmFzQVJVTW1LUFlyam9LcGVwY3hPQUhEVXBhakc3cHc0?=
 =?utf-8?B?VDdaMUJwSFZWYUtkNjBmelJvRk4raFVFWDRBRkFTODdNOW1INUZHWkp4OVpX?=
 =?utf-8?B?L21xVG9SWlE4cXdBTkQwTnEzUXpJOUxCMzEvVk9ZZVdYMjAyL1ZIbWU1MUZw?=
 =?utf-8?B?cWFSQVp0amZzK28xUWpMNjY0K0hOOHQ3RWg3cENEcVBiOEdkbzhqYyt0cDY3?=
 =?utf-8?B?M2hvRnNTalV0ci9iMjdnRytrSGhxWnRjOWFnYlY5LzB5bTRkMDlSQUF5Vysv?=
 =?utf-8?B?OVdEYXZaNTB4QzZhUWNGME81L3dKMUtIa3VWT3N5Z2FYZVJwOWhnWTZmMlhq?=
 =?utf-8?B?RzZXdFpQQ1M0K0hWaHpDdHA1RzRlTTArU2dLcHYwc3ZhTFB0N1F1Tm5vaWFN?=
 =?utf-8?B?V0Z5cGF4RHp0SDRRU3RmQmZPVi9TS2haT212dUlyWVJXVnpHcm9iSHRENVh6?=
 =?utf-8?B?YUpiVEVvVjFOVEVXeHh2bmxsbFA2MjZ0cDBPWTVFQ0tCSTg0MkFaZlFCRlo1?=
 =?utf-8?B?ZURXRE5JanF1STQrN2pUczhqV1ZjM25VTWhhSjVLZHZXRlgzNmVMTkhNQ05q?=
 =?utf-8?B?SjdzR2FFSTdGbHNTTGV5dGV4MVJCdzZKZS9JL1ViVDg5TFdEbzlVRzlaV2dh?=
 =?utf-8?B?TDRkc1luYUpjTzFiYVlkanVudFQxVXdjTktYczMvRlZDOE4razd6R1NKOS93?=
 =?utf-8?B?S1ZiMzJvNXV2dzgwNXphMXdrZ1phUkNSaVY5NU5wR2VHOE5VTTVjQ2g3ZmhI?=
 =?utf-8?B?dUZYTDlrNytkNzZVcFB5WXZmUmdIeUVmNXdDUnAwM2J2Q09JS2NUYWRINFV0?=
 =?utf-8?B?Wjg3WTk5RlBlUnZ3bjBYbUI1SEVhNlQzUXM5MWQ3RDF6Njl0bXJPUDNjY29o?=
 =?utf-8?B?dTFLWDlZZTN4S0lqbnJySU13MlRYOWF2YW9xUmtDRXRGRGVJNFQwd0hHTXlr?=
 =?utf-8?B?Vnk3S1RqUTIxeURkYmd4a2hGRlZMVXd3aDJxb0dUVmFaSitsWVRGMHNhS2Fi?=
 =?utf-8?B?a0l0RDdYWXRadGVXOUVINGVDUXFLR0pkZmdCU0oyQVh3Wk9McGF2QjNVa0pp?=
 =?utf-8?B?a205NUh0YzhWUFR1RU5GWENFelc1dkR3UlFmU3l3RE5pSUllNTJSd1Q4RVJG?=
 =?utf-8?B?bjg2VkhDOU9GVjEzV0RTQjFyOUxENWpCdEM4VzZlRVFCc1g4eW91Q1BjVGdp?=
 =?utf-8?B?aDdOajF1Vml6TnFESjV3QjlkeSt1WDZNTThNV2VHOERubDJBeUJPRFNSZzBW?=
 =?utf-8?Q?ss0s+u3RkVSQG5NZLv9N+27kLGT20Y9sWpDcynDtds=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807fe330-fc49-45dc-f435-08d9b3797d66
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 20:47:42.8996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C162IUvUXfYs1p/osugN2VrTUwtEYx/x+lCuFs3cr5a03+xT4V6+zyY+faKL8LY5x3IvAMnwYrZwNrWEAdgWB0yj4ugfWuvYs1mYKFkC1uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5043
Received-SPF: pass client-ip=40.107.22.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.317, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

29.11.2021 20:34, Eric Blake wrote:
> On Wed, Nov 24, 2021 at 03:09:51PM +0100, Vladimir Sementsov-Ogievskiy wrote:
>> Reconnect feature was never prepared to handle server options changed
>> on reconnect. Let's be stricter and check what exactly is changed. If
>> server capabilities just got richer don't worry. Otherwise fail and
>> drop the established connection.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>
>> Hi all! The patch is probably good for 6.2. It's an RFC because I didn't
>> test it yet) But I want to early send, so that my proposed design be
>> available for discussion.
> 
> We're cutting it awfully close.  My justification for including it in
> -rc3 (if we like it) is that it is a lot easier to audit that we
> reject server downgrades than it is to audit whether we have a CVE
> because of a server downgrade across a reconnect.  But it is not a new
> regression to 6.2, so slipping it to 7.0 (if we don't feel comfortable
> with the current iteration of the patch) is okay on that front.
> 
>>
>>
>>   include/block/nbd.h     |  9 +++++
>>   nbd/client-connection.c | 86 +++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/include/block/nbd.h b/include/block/nbd.h
>> index 78d101b774..3d379b5539 100644
>> --- a/include/block/nbd.h
>> +++ b/include/block/nbd.h
>> @@ -157,6 +157,10 @@ enum {
>>   #define NBD_FLAG_SEND_RESIZE       (1 << NBD_FLAG_SEND_RESIZE_BIT)
>>   #define NBD_FLAG_SEND_CACHE        (1 << NBD_FLAG_SEND_CACHE_BIT)
>>   #define NBD_FLAG_SEND_FAST_ZERO    (1 << NBD_FLAG_SEND_FAST_ZERO_BIT)
>> +/*
>> + * If you add any new NBD_FLAG_ flag, check that logic in
>> + * nbd_is_new_info_compatible() is still good about handling flags.
>> + */
>>   
>>   /* New-style handshake (global) flags, sent from server to client, and
>>      control what will happen during handshake phase. */
>> @@ -305,6 +309,11 @@ struct NBDExportInfo {
>>   
>>       uint32_t context_id;
>>   
>> +    /*
>> +     * WARNING! when add any new field to the structure, don't forget to check
> 
> adding
> 
>> +     * and updated nbd_is_new_info_compatible() function.
> 
> update the
> 
>> +     */
> 
> Odd that one comment has WARNING! and the other does not.
> 
>> +
>>       /* Set by server results during nbd_receive_export_list() */
>>       char *description;
>>       int n_contexts;
>> diff --git a/nbd/client-connection.c b/nbd/client-connection.c
>> index 695f855754..2d66993632 100644
>> --- a/nbd/client-connection.c
>> +++ b/nbd/client-connection.c
>> @@ -37,6 +37,10 @@ struct NBDClientConnection {
>>       bool do_negotiation;
>>       bool do_retry;
>>   
>> +    /* Used only by connection thread, no need in locking the mutex */
> 
> s/no need in locking the mutex/does not need mutex protection/
> 
>> +    bool has_prev_info;
>> +    NBDExportInfo prev_info;
>> +
>>       QemuMutex mutex;
>>   
>>       /*
>> @@ -160,6 +164,67 @@ static int nbd_connect(QIOChannelSocket *sioc, SocketAddress *addr,
>>       return 0;
>>   }
>>   
>> +static bool nbd_is_new_info_compatible(NBDExportInfo *old, NBDExportInfo *new,
>> +                                       Error **errp)
>> +{
>> +    uint32_t dropped_flags;
>> +
>> +    if (old->structured_reply && !new->structured_reply) {
>> +        error_setg(errp, "Server options degrade after reconnect: "
> 
> degraded
> 
>> +                   "structured_reply is not supported anymore");
>> +        return false;
>> +    }
>> +
>> +    if (old->base_allocation && !new->base_allocation) {
>> +        error_setg(errp, "Server options degrade after reconnect: "
> 
> degraded
> 
>> +                   "base_allocation is not supported anymore");
>> +        return false;
>> +    }
> 
> Do we also need to insist that the context id value be identical, or
> can our code gracefully deal with it being different?  We don't ever
> send the context id, so even if we retry a CMD_BLOCK_STATUS, our real
> risk is whether we will reject the new server's reply because it used
> a different id than we were expecting.
> 
>> +
>> +    if (old->size != new->size) {
>> +        error_setg(errp, "NBD export size changed after reconnect");
>> +        return false;
>> +    }
>> +
>> +    /*
>> +     * No worry if rotational status changed. But other flags are feature flags,
>> +     * they should not degrade.
>> +     */
>> +    dropped_flags = (old->flags & ~new->flags) & ~NBD_FLAG_ROTATIONAL;
>> +    if (dropped_flags) {
>> +        error_setg(errp, "Server options degrade after reconnect: flags 0x%"
> 
> degraded
> 
>> +                   PRIx32 " are not reported anymore", dropped_flags);
>> +        return false;
>> +    }
>> +
>> +    if (new->min_block > old->min_block) {
>> +        error_setg(errp, "Server requires more strict min_block after "
>> +                   "reconnect: %" PRIu32 " instead of %" PRIu32,
>> +                   new->min_block, old->min_block);
>> +        return false;
>> +    }
> 
> Good...
> 
>> +    if (new->min_block && (old->min_block % new->min_block)) {
>> +        error_setg(errp, "Server requires new min_block %" PRIu32
>> +                   " after reconnect, incompatible with old one %" PRIu32,
>> +                   new->min_block, old->min_block);
>> +        return false;
>> +    }
> 
> ...but why is this one necessary?  Since min_block has to be a power
> of 2, and you just proved that new->min_block <= old->min_block above,
> this condition will always be false.

Ah yes, if they all are power of two, than that's an extra check.

> 
>> +
>> +    if (new->max_block < old->max_block) {
>> +        error_setg(errp, "Server requires more strict max_block after "
>> +                   "reconnect: %" PRIu32 " instead of %" PRIu32,
>> +                   new->max_block, old->max_block);
>> +        return false;
>> +    }
>> +
>> +    if (old->context_id != new->context_id) {
>> +        error_setg(errp, "Meta context id changed after reconnect");
>> +        return false;
>> +    }
> 
> Oh, this answers my question above. We should put this near where we
> check above.  And this check should only be performed if
> base_allocation was supported in the old server (if the old server
> lacks it and the new server supports it, the ids may be differ, but
> that's an upgrade, not a downgrade, and we don't care).

OK. I think, I tried to follow ordering of fields in the structure, but logic is more important of course.

> 
>> +
>> +    return true;
>> +}
>> +
>>   static void *connect_thread_func(void *opaque)
>>   {
>>       NBDClientConnection *conn = opaque;
>> @@ -183,6 +248,27 @@ static void *connect_thread_func(void *opaque)
>>                             conn->do_negotiation ? &conn->updated_info : NULL,
>>                             conn->tlscreds, &conn->ioc, &conn->err);
>>   
>> +        if (ret == 0) {
>> +            if (conn->has_prev_info &&
>> +                !nbd_is_new_info_compatible(&conn->prev_info,
>> +                                            &conn->updated_info, &conn->err))
>> +            {
>> +                NBDRequest request = { .type = NBD_CMD_DISC };
>> +                QIOChannel *ioc = conn->ioc ?: QIO_CHANNEL(conn->sioc);
>> +
>> +                nbd_send_request(ioc, &request);
>> +                qio_channel_close(ioc, NULL);
>> +
>> +                object_unref(OBJECT(conn->ioc));
>> +                conn->ioc = NULL;
>> +
>> +                ret = -EINVAL;
>> +            } else {
>> +                conn->prev_info = conn->updated_info;
>> +                conn->has_prev_info = true;
>> +            }
>> +        }
>> +
>>           /*
>>            * conn->updated_info will finally be returned to the user. Clear the
>>            * pointers to our internally allocated strings, which are IN parameters
>> -- 
>> 2.31.1
>>
> 
> Looks like it is on the right track.
> 


-- 
Best regards,
Vladimir

