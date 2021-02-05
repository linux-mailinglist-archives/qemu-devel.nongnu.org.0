Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90074310A3D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:28:36 +0100 (CET)
Received: from localhost ([::1]:53516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zHv-0001MV-Li
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7zFx-0000SA-Ls; Fri, 05 Feb 2021 06:26:33 -0500
Received: from mail-am6eur05on2136.outbound.protection.outlook.com
 ([40.107.22.136]:52358 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7zFw-0006DF-4t; Fri, 05 Feb 2021 06:26:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMnxJlSDF4E6bkZEKtTX3pNAUa8DkRo4Nwe6R+R89lby2GmDPGX/3WhO2t2hVkSuvNrpbLuVpVlsAx+ABO+wwa/QjQ+IYezad0vBgHgOPWFGjSY+IIRl0sHVcm45uXOfbxA7X8QkissjkYkd43bIZJ/r+WAOknJCXElzC+sbEpQlfnJAfWpvMn5xFfAbP6LkMD1fpd/3twvElDLdR5XDCgtHbIFvd1pBf6UY+cQ1St8AmyC0p8kwRLwoNHqqoWs5+A9KmvOhU0joglYPUSYn454P3edQpxE6pAb6H1LDNExvlDIpi0glNL1pECwHPpEHrTU+IA30BDbRiuL7ov9weQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gQSWnL7nL5Z2Eyb8v94Z8cxRklqY6W/B3gc7gLXOm4=;
 b=Dy/xLPM6m7RI63dHgS5PviFYqTLdmh5YanycHd85l/YCNxEvMkVW8hLkjMo+SoBBx5vwxM9u+fOeedPo9awPw0CAu/6ducwHfIqfEzd6qI/4p/NfhkV7UkdWOVEFV1tu1TIoP6SLfaYCJlEpDS7WvEQE7zfrYbgyrxLZEHj79E6YFpnIuD40PBHXm4QNA0YT6TnaPzKq5dmL5jjnT8q5PQ3o2uoD3ac2v3FsTxsQmn8nqjC6s72gvqFa7PlK//HaA+nM9JKrnIb/WBl7KeeF3XoYiKSrae3ocGVTBM0UfA09xinxnXu7ZaW3COWu5cPku78WdRHEmpbHVPfta22tWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gQSWnL7nL5Z2Eyb8v94Z8cxRklqY6W/B3gc7gLXOm4=;
 b=L19dKWocNPbrDJZVm6Nf0xwQWGewqDDsvZ5zz8sm+e8K/8S29Fy6Zzt/s1e1ZD9AEXDIUNyWzH2j1CYQ229NIV5V/eh1og8ylZQM8mIxF7+iuWUZdrpDkyfam1v6VZHvNj39vWCkdDUoThsu/Sm5rQDesNzDqYkcbnun4zPcnqE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 11:26:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 11:26:28 +0000
Subject: Re: [PATCH v7 01/14] block: return status from bdrv_append and friends
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 jsnow@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 pavel.dovgaluk@ispras.ru, ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-2-vsementsov@virtuozzo.com>
 <w51o8gybw8i.fsf@maestria.local.igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9a41a7ee-77ee-4ef7-f395-4016608a91c5@virtuozzo.com>
Date: Fri, 5 Feb 2021 14:26:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <w51o8gybw8i.fsf@maestria.local.igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM9P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 11:26:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41770a4c-8bcc-47d8-de86-08d8c9c8e0ea
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-Microsoft-Antispam-PRVS: <AM6PR08MB37659D705A3E8B86BAE1B801C1B29@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTuD2wd7A1olDb88y69SbrqxVkyNyQ1idCR7bqQR7M2zrstQ+q2nGkdf1H0Ugf3lLob/agxT7Itah9NaedeYsCoCbcN1WK+rBiombZkNd/329WBRpgKNKmpXRNdnyEuFCbY045yJy80AmdX/fIQ0TCecHTiGMk12QusTEMJOMMAbekQcIiJv4HQ55RS9BRWYTrQUzFGfpQ1UthVQa6QyoGcZdb6qam/EIui9i4EvracafNwW52SMWk93dwRYe4+TVLVUbvvdcqEZ2JuM6K37hUIXOON6sNZdhpyjHlBxCRNglphRP+trmiGBwJy3/CWo9VtAXLpryqbIs1aq8LamLK8fC2teFApm8mKzKuGZlqax6gp8j88HNBmOoR5w+TechWjZWMQVfvwugE3xBQqAyOal1xjj54gyk9w00RuFTMUivldKYsDN7Fb30FRnUHKvf4xtDYZ7TwPBq0/hkFevzL6/xaXUM4QW7HaY6cuQlQCzmtuxzQiy7pvLEoKg4g0yNtMVA+OtX1zYMEM2wPjW23BlKnN50a9NuNWEM9q9MTGOaiJjy9prZ4gG07jRyEp02TcK3IRD3n8NdbXUm0fuOSS7egNGK5NUbjnAPggds4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39840400004)(316002)(478600001)(4326008)(36756003)(31686004)(16576012)(7416002)(956004)(66556008)(66476007)(8936002)(6486002)(2616005)(26005)(86362001)(2906002)(186003)(16526019)(31696002)(5660300002)(8676002)(66946007)(4744005)(83380400001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHVkUkMyTGlmUmE2WVZwbFNVMXZwaG5QblA5NHdKRktaVlBYWDhzd1ZtdVhW?=
 =?utf-8?B?cVozK1IxTFRRZVNjbDRLSjhsNWFQL01veWJoN1R1WU1PUnYwUUtEdlN4S1Bn?=
 =?utf-8?B?b251ZGp1NXRhUFc5RVlMY2haMWRSQWkvYWFUUys3SFY3VHBpbmtZVXp4YitS?=
 =?utf-8?B?MVVTdUtJTHBxWXdGZWRVbzV2YTBIc0FBeG13MlgyZ0FNUGNCNzVFek8reUhR?=
 =?utf-8?B?c05CQXRsNC9TZ0VQUUgzb2NVaXpiYWNZQkpwSkVZTmc3VTZYMFdpWWYzWlBZ?=
 =?utf-8?B?dGUzS2EzejJ1RXdxZWI0UTdTNzhqRm9pM3NKcjduQUwrSjM2SUxRMklNOC9w?=
 =?utf-8?B?R1pOd1VETXJ0K25JWTlqRGYrSmhqNWtOY1kwcjhSb1Y2YU90OVl0NWZBbmVY?=
 =?utf-8?B?K0JmWktncFVHbFhCRzA3ajJYdnI5aEdtZHRRTVppai9nTS9qVnlHM05ER0lF?=
 =?utf-8?B?MWx2eUtlcTRuNFVYMTB6dWVidFpRb2RobUNiWE9GN25WeVE0WXNnNnNyM0tU?=
 =?utf-8?B?S3djdjVrZ1dwc1NyNGUydS9MMERyaFQ5QUxnTmRvUXJJT2YyOURHRTZydUJh?=
 =?utf-8?B?bCtrU2M2c3dTQ3RWd1Z1bURWc1NtRVBQdTBsaGdEN3IwSU5vTE96TGxjTzFD?=
 =?utf-8?B?WW9yNDVNdWh5NUdIck9xUHU2MTNNL0k5UkxQTCs0TWhHMGo4U3NXT2QweXFt?=
 =?utf-8?B?Y2dBV0pKQUlYV3V5OHlYQXdSdU5sL2ZhNDczSE85WEZmM1VkMk1xbkR2bndQ?=
 =?utf-8?B?VHQ4Z2VHVVJMbThoU3lwWTRHM040S3prdExkcmwwcnVGQWFNcmdSeDJEbTgv?=
 =?utf-8?B?Qm5VaDQ1MFNVdFZKKzJSMG1NTEJqVm9iRzN2cklaTTFKczdHcnZQNWtZelgy?=
 =?utf-8?B?emdvS1lycDR6cURUZ2lSWWN4eXdLUjNxSXpVb0pnc1ZMNkdoM3NKZ09QbUt3?=
 =?utf-8?B?RzRIUlhrSTNxYmovU0dpTi9pZkdXelBYVHNHalJmSHlBbXNzOHlITXhOOWZB?=
 =?utf-8?B?QXJVbXVNZzFBcEJhVWovNUllVlBPVG5TdzYyWXBXelVmaGoxZElpSkozRTZv?=
 =?utf-8?B?SUxlekp1bG1pKzh4UzNvaG0vM293cGkycFBBcDNaaWJEQU9ES0F3dVBzRUFn?=
 =?utf-8?B?aE5mUC9pUHR0S2lYR294Kzh0K3RmQjBFK3c5bHFHNm0yUlptOFZGWUtTemt3?=
 =?utf-8?B?SjV4NUxra0dZQ25YUDFxeFpzTjZhSzFYZENzQ3ZlWWY1enpYMURiYzAwRGky?=
 =?utf-8?B?Ykk5bks3NTRkQUtpSXZJOVdYVk9kQy9SU1RqNTRQV2VkRnJrTlJSVG9tdHVn?=
 =?utf-8?B?czA4K01ya3J6TVNycTR6OHNWZUtGaFBmNUdyMWR1akFPNlRxMWZWNTZLOVNr?=
 =?utf-8?B?R29sTkJCZlowclNmNWxTa0ZQRFpxRDJjY0h2blhZcmZyd2N3V2IvQjBaSUox?=
 =?utf-8?B?VmtFY09DdG1QL3dRcVRCalJ1d0tObHUveUZxOFZYejJuWWsxdFc4S3ZuUzBH?=
 =?utf-8?B?Z01paFNKZnVJZDg4bzhtZ1FzUXVVQkVJWlJSaUpNMTJjVmhXTzh3RGhEOEJQ?=
 =?utf-8?B?aGNMdG83VjdncHJobG8renVHVkwrMDJSK1BUaEJDNWFKSXowbVhtYTZ4VUZS?=
 =?utf-8?B?Tnh1V1FHTGdkYlVBclRSTzhyNldNZHlSVGt5U1pUVVBaMzZOOTdoa25Eb25o?=
 =?utf-8?B?TWVWSE83QU0yUG5NUW5VMU00MVRUOFpMM0xjcG1yaTNBUTJzcWM4MTBwZnZm?=
 =?utf-8?Q?B9A1j+rV1HTJMjqvBaz2lb//uJoZGMshzu4WSeY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41770a4c-8bcc-47d8-de86-08d8c9c8e0ea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 11:26:27.9754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHd3ONN3fFxec4AssEWKp4EZcZ/bbOdU4MN/Ky0PBBdL3mW7bLRLBkJjOnKTnvk9OLnGaOzCYuE2YEELXDC/sJq6j5wJGHxaU22ky0DJK6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.22.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_NONE=-0.0001,
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

05.02.2021 14:16, Alberto Garcia wrote:
> On Tue 02 Feb 2021 01:49:43 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>> The recommended use of qemu error api assumes returning status together
>> with setting errp and avoid void functions with errp parameter. Let's
>> improve bdrv_append and some friends to reduce error-propagation
>> overhead in further patches.
>>
>> Choose int return status, because bdrv_replace_node_common() has call
>> to bdrv_check_update_perm(), which reports int status, which seems
>> correct to propagate.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> I had already reviewed this one, hadn't I?
> 
> Reviewed-by: Alberto Garcia <berto@igalia.com>

Oh right, sorry.

-- 
Best regards,
Vladimir

