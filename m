Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD84462293
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:52:24 +0100 (CET)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrndP-0001hZ-Uk
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:52:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mrnav-0000P3-G0; Mon, 29 Nov 2021 15:49:50 -0500
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:25089 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mrnan-00065H-9U; Mon, 29 Nov 2021 15:49:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejt7wDvj8EcSyLdi9Nx9dJhEDCX6CSTfkjZU/sa2dtBA2HOEfwviYyOV82UiojpDSNTkdV6bDl3R83KddHhiIlSF+y5nJVXH57h8sCU9OMXlKnX6iHGC6J45cUPlXpz3Emph2wpG3+p5upRfCA43Tw+Jnkk21D/5gwMBft/I9ro90VlADsmzoN7UVBHTHTxjRcAKt/AWxR2LpptYHTsoYzq0noLJqtVvZHrpsLd4eY9Nl1+PwEelwfeLlyqvZgV8B+Sty+36y/aKwvuat7xbyHXs+cBycfzJHZq4IwjchcJ8tAw8d0hjqfrv7fg95YF29L9xkfImuvycJ/y72WY8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EUap4ZhDT/cjKwSpB/Aow8E1ZyGdktSwTHRBNMXS1Q=;
 b=fEMur+l1cd2+MQQH1ttIqdWtl347UdG9qws3JxDRzgCDSkn22E2CukYWatxY9b6b9N8+E3PaULqmGL68fUcQNSYNqs2r/w5FMDw+jy/qt1WT+2A+Bo+xyRw/iDSkbIksJGxpxXfU8FZxmiSbmDsD01GZMQQdDQOICUGyR1zFGBGZequZWJCqZYI3bvuDHOb2htVLwdr+wwqGh5o+4kmaFe7ertIqf6e41Ac+qB53iqNExXi9tID1X9WmOqO15B/cJyrUebL9LEYznk4gGw8KLMG1bYhlJZ3wCxde8we8bJmr2Lu3gztEsxlz6nDDlY0uIFKRTrucz+bIMjJdfCiUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EUap4ZhDT/cjKwSpB/Aow8E1ZyGdktSwTHRBNMXS1Q=;
 b=TSLuV+NevR89kTffltuAAbX3enhOd+31SfTpKUKhsIa+9oNTVfXeUvM66heYmPfZezHfSO8M3aiNnH5f1fv+BFLEJtPAAU11/k90Lk0S/0rrNSGMOYQtfE9Gc/miJ3tQ5t0M/4HTJ/GNAmplBnfJYwf0p4Imf0rfZlHvXssjZ8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5683.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 20:49:34 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Mon, 29 Nov 2021
 20:49:34 +0000
Message-ID: <671e28a1-b7cf-d0a5-ff7f-c8f0d323d0a8@virtuozzo.com>
Date: Mon, 29 Nov 2021 23:49:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC for-6.2] block/nbd: forbid incompatible change of server
 options on reconnect
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com
References: <20211124140951.439684-1-vsementsov@virtuozzo.com>
 <20211129191606.4cnbnjpsoywgxeq7@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211129191606.4cnbnjpsoywgxeq7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0014.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.234) by
 AM6PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.21 via Frontend Transport; Mon, 29 Nov 2021 20:49:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2420ad2f-6ca7-44d0-6031-08d9b379c02a
X-MS-TrafficTypeDiagnostic: AM8PR08MB5683:
X-Microsoft-Antispam-PRVS: <AM8PR08MB568360D1D6F47FDEDC3929C0C1669@AM8PR08MB5683.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HuCZ4phnv6HAIUmWw1Ol4lW2FQcC9soIfojvlruXd+8ENBuKLknnyhT01LSvFhV4+z7DDRU0N5AWD/HNKMA0T9QIOYccEWxMGW8rNl1KBqslj9JyacnxBO/fHU2cQvx2xBm48IB1ZQldGfAZWMfTrubWJ6mhtIH0vaT280z8wWCX84H2n6hwS0Y9Ys/wdCpjmfvIcvvA5m28u4rjGcSjblb2TO8/q6ARLl9oD5bLATsTeubCIcox/Qyq1VCtW6AYRP+b/jBPN2Khl9KnzjjOuQXb7l1hhluJ9SQMySJx4iozgeTcpH2YXdJwOiWU2pZQz4LsEz2IuSqyELmMGL296C/DsT4z8fI3c7pSv3kXtSPnyByUqlJvnm9K0bVUEtbD6+i+r2+S44Lj6PqJHl/3IdAl+UwzwDqY0NpxO002Ad+BglXcIYBpoTqvNO7AaI/DGzLaRdq75BGy1nklbNARuuhE9jOlHVLuv38F8fCFTsxuzYpbpMdM0nDSqsQavO8oza+qt2oMivaabO8ucMI1U+LEG7jrVlO+BeCdsQKgobcwqCGKLqSiL8MEdQln0rOPT/tFFZVvgpYSL5tSODetO2qJu+Cccf6ScJ9ySFMCzIcECBXypwPuA/RempVEN3+p9vad9RqmPaLuhl/qnK5+yJWxG2Yf2ZBCgMqArdeKJ8pMNtboNdcjrlbVs5rZxjWY4Iep8oTN1cEoLt+vRRbCedtcmN1eRybo05wyLPceWjXPkp4aiTPxM4NdWyXWyOX4K4tretZ0QYqN5p7i8Klu0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(2616005)(38350700002)(38100700002)(8936002)(8676002)(316002)(6916009)(5660300002)(16576012)(83380400001)(2906002)(4326008)(86362001)(36756003)(66556008)(31686004)(6486002)(66946007)(66476007)(186003)(26005)(956004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0U4QS85NlZtUlpvbXQwVHNjRjRRbE5veVpGRXF5VGlEa2JpQmJKMkZKSmJ2?=
 =?utf-8?B?bGVQSUxmOEZpNXlXaWNUSUNpb3hkWUZpNUVjRUdydUJuODlkTnNrMUoxNnl4?=
 =?utf-8?B?T0lRaElVUGpTcU1IMEtBVE5qOXY1d2VOWHhCc0N0RFdHNi9VOFpBNkpmODUz?=
 =?utf-8?B?cm1DVHBwblJxd3BEc3ZTK1RKR2RNNGp1VlgxMjYxVG4xWTd3eXB3djZvTlcv?=
 =?utf-8?B?OEUzaCtTZjdHMXlSQUNoQVZKbE5XK1o4WThMcTFmNENhOThUZFBnNUlpL3d4?=
 =?utf-8?B?ZXdRTXhlbmxIbDhVK0JHM0dvU2dTZ2hXMklwb2lVMzY4RzZsdUZmK050dStl?=
 =?utf-8?B?aUtuYVgzR2NjTm1RNTFVOXRrYVVUdkRFdDNTTHF4akRoSkkzMjRNVE1TV3pP?=
 =?utf-8?B?OEF3ekE4NGtPMUZTRDI4dDdkZzR4b2RkMFczdmZ0YjNHeENOM1NadkE0UXYy?=
 =?utf-8?B?eUVxeHZjejZXUGZROGprYnE5TVc3Vkw3M2g3VW9vR1B5b3lrRGdzU1RhMlNp?=
 =?utf-8?B?bDA0UUNqWUl1M1BQT1BZZTVJaWYyQTMzWGoxL2hROWNqK0NqdHlyOUV2UTN4?=
 =?utf-8?B?WG5tTEc4OFFXNnpWQjArN2pISStTVWtBNGlucVlhTUxJaTREQ21ERGtlcTJG?=
 =?utf-8?B?WDlPU3dwaWtzM0hkSno0bnRzcDJmSXhoUkhPWTdCbEd4SXZEU2xtL0FTRGJx?=
 =?utf-8?B?aVlDTVB5WllmN2pydFBDYXBYd0xxVzJDRzUzd2RpSGV5VjM5MDJhZWlRQVZG?=
 =?utf-8?B?RDV6YTlibVh1dHZFUDlOMXZsN0NDbEo3Z2tOdHRDaEtGWWZuWlJnZ3JwaWIw?=
 =?utf-8?B?QUZkN0NhSGdVUkczbm5hL3g2TVplSjhTRjBrKzVZMmJJUC9pcloxNFYzcUdL?=
 =?utf-8?B?TmFQQm52aGpMUFYzNEZvQ3gxTndTTFRtOTIzeUdWSzZCY3VBWDZPcGw0UVBE?=
 =?utf-8?B?TG1xa0VHYjRBV1haMytxTk8xb2R0b1pIRW1IQlE0OUM3MklVbWFORk15MU8v?=
 =?utf-8?B?cmdJOHppS0phUWg0SUpEQk9lQVRYY0xOQ3E2dVgwLzQ1c1dURnFKZEkwTWda?=
 =?utf-8?B?RTdOSEU4c3hkRThlbm8ydHYvbG1oNWtVUi9ZeXh2S1g5dWg4RkgxOU9TNlBu?=
 =?utf-8?B?SExtSDZYM2RHMVZzaUtFblNNcSttQi8reVYrQjJuYytvQ09ReXFDdXJHMXRB?=
 =?utf-8?B?bW5hWml2Y1NNVzNEUWYwU2pSQ01OZW9lRnNqVE1NRnRTTE1LVDYwRHJYZmlF?=
 =?utf-8?B?VEhFTG1NOHlnMTAwbU9iMWNIOCtqNmtqSDVtNllDVkhyOHk5OEpaVGVycWYy?=
 =?utf-8?B?ejl3a2VtTEJJcW82K1FkYzc1WmJXZFJBVDRmbG5STWxiY3gyVmo3OWdxaFRR?=
 =?utf-8?B?YmQ0SVJFaFdBZkZ6ek40V1pQVmdVRDhFL0ZoSDZLaExsSkVLdTViY1loamRw?=
 =?utf-8?B?R3hPVDJQcCtvUVZvTy9NbXZWNlJielQvY05LZnY5VEd6OHorZTYyQnNaR0JC?=
 =?utf-8?B?VG52YWE0eGJFOExEQzh0N1h4UmYvRTRSc1ptWGlnU21BcWQ5dk1MWEdzQmpV?=
 =?utf-8?B?Z1F5TnlNcEpBRDFKUmpSQVpKZElJcW1ySW05L0xPeExJNkxER3F1OCt5cEp6?=
 =?utf-8?B?WUloamVLU2pRRTFvRmwrNm9hRGFoZnlKb05ZdVNZWTVHQ1pyZzY4Qk9UTm1S?=
 =?utf-8?B?eFFNenVRaTgxbVBSL2h2cW8vS05pd2FEejJYQ0p3NkdoR2xtWEtGOXlKR3Y4?=
 =?utf-8?B?dVJYSUlmZExFYUcrMU5odG1JNjc5dzRFMUVhajl3TmZmZ1NZVlNpSG1JK1FG?=
 =?utf-8?B?WUhqSmptdG8zZEFSaVFNNHBVMHhYTG9IN1VDVWo5d2RHaFVWU1Q0azlMSllj?=
 =?utf-8?B?QW1Dbnh1RjZnNzIwYWFhTnNsTTRacjJXZE5UMzRYdWo1akZDT1JncGhWWWFD?=
 =?utf-8?B?U0ZoNlBZMVl0VGd5RFBhYU9DVlZUZ1R0L1FaRWNnWVprQThTU25DRmgvRUwx?=
 =?utf-8?B?VDc0SlhwSlprSGtVRzQ5dVE1TWxnejRORDRYWVUvNVNEcTFtaDZDWGZva2c0?=
 =?utf-8?B?TzVSZEFKY2UyQnhMdXVMMTFGa0JwM2xBYzZ3cEJoR002Y0xCVDdlM1F0TnB1?=
 =?utf-8?B?NVRUWHZmTGlUbytpZ0kwdGpDNTdYUjZUZHJOTDRsMjdYRkpsRGcyaEFOWTZl?=
 =?utf-8?B?dTJGdGlXTVR4QmVCN3JQWWU3V1JQazJVQWQ2eTA0am43cURjbGVsMHB6eXZH?=
 =?utf-8?B?RWpITFFNZmhlWWt1alB0RXVkL2hRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2420ad2f-6ca7-44d0-6031-08d9b379c02a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 20:49:34.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfTJV575g0FGoHnuyp4LOSVyjDcYxvITH72VTNlRp56lb8mbPVWMddcMqSUEsSjFRt4vwi+RJjcH5UXsTlNt4fxFcbbGdAIw1J2sI+98owE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5683
Received-SPF: pass client-ip=40.107.20.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

29.11.2021 22:16, Eric Blake wrote:
> On Wed, Nov 24, 2021 at 03:09:51PM +0100, Vladimir Sementsov-Ogievskiy wrote:
>> Reconnect feature was never prepared to handle server options changed
>> on reconnect. Let's be stricter and check what exactly is changed. If
>> server capabilities just got richer don't worry. Otherwise fail and
>> drop the established connection.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>> +    /*
>> +     * No worry if rotational status changed. But other flags are feature flags,
>> +     * they should not degrade.
>> +     */
>> +    dropped_flags = (old->flags & ~new->flags) & ~NBD_FLAG_ROTATIONAL;
>> +    if (dropped_flags) {
>> +        error_setg(errp, "Server options degrade after reconnect: flags 0x%"
>> +                   PRIx32 " are not reported anymore", dropped_flags);
>> +        return false;
>> +    }
> 
> Your logic is good for most flags, but somewhat wrong for
> NBD_FLAG_READ_ONLY_BIT.  For cases where we are only using the block
> device read-only, we don't care about changes of that bit, in either
> direction.  But for cases where we want to use the block device
> read-write, the bit changing from clear in the old to set in the new
> server is an incompatible change that your logic failed to flag.
> 

Oh right! Will fix it and resend soon.

-- 
Best regards,
Vladimir

