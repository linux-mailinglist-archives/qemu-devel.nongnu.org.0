Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2ED3F4E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:37:29 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICwy-0001Ow-My
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mICt8-0003Nf-1l; Mon, 23 Aug 2021 12:33:30 -0400
Received: from mail-eopbgr60107.outbound.protection.outlook.com
 ([40.107.6.107]:62637 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mICt2-00017N-D4; Mon, 23 Aug 2021 12:33:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYi+R7Sr5WI9eNjtRYwxX66eibCJKE3PN+FJs3G9rCNrNeCnPi75h9GHDkLjw5xUWiu3IOTwxALNCUGH/tld7Zch0h8hG49C4VvJmji+GM5O1NK4lmcX8mXI1capw8UXKL6VwZ5h/5wrZ5E1Fb/JD9OlEPZAYCGSdYaVHJxvTkjmGo1TUHPFPPDZDSyteLYibyJcn53aVukdUzyrTrk2KjzMYbKXmMUZ2JBNnYwdRrwlQuKRTvTarZZ7QM1kVmOgJMRl2QH+to4gt7fIwQLLeRW9lr60V/+LO4Wxr502rzFVRrE7ZIS6mDNnDAad0mtnzlB5ONhZUaDvew3sndvzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciDJeg+HcVrxn7rYdVAXHSb9k/8pG8IwE7jv+P5ERg4=;
 b=Umy7yV2bU4CkwPsa02+9XiRflQWmGG89B+PPCZBi0H0oipvmEQxG+VKjMmHnFgLf3tjFRQjxlZwCK7vCDzn432bYuHUKSJlOK7mwJYBmBwNE1fYn9BZzkg7siEta9EXnZVIveuFQwkn1ZBOmhrpx5NJMwiCpAbQ8vdujkhM8JMBcxo8RFQnmoyRh4J/f/i5+o9oBfhyyBuh6qYMGmDK2zTf8RWZo3hhY2fd59IFlmVUbexbkBA46TMVWmpqra45jGH5dsn3IJ+exVZV1F7O/0xIq2Wxr8eO1iJU4yCq8Aa1IH8VBBFP/gG0UzHY6/TwB35KNcrqv1lzinOh5ef8vPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciDJeg+HcVrxn7rYdVAXHSb9k/8pG8IwE7jv+P5ERg4=;
 b=E0XeNIKWpm10SbCAmFd7aWF+WME+QVLlxibW11jweIjwrdG0SETLXZi0HMSkLnBcLucTI6qERzWEfOMt+xjymkkuvKODbw3KSKybTNmNwcx6hqYg+bRiMrNtZjUXB2TkMsC+2jybYchxUtJGTLzgNB5yN9gQJi+BLSLN+IjBhGw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 16:33:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 16:33:16 +0000
Subject: Re: [PATCH v7 17/33] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-18-vsementsov@virtuozzo.com>
 <1e854286-82df-8eb9-4b3f-85cb2aacab60@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <6e31ee81-edb4-758c-ddfb-87936d645651@virtuozzo.com>
Date: Mon, 23 Aug 2021 19:33:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <1e854286-82df-8eb9-4b3f-85cb2aacab60@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 PR3P189CA0037.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 16:33:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86491b80-301b-48d8-5cbc-08d96653b525
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-Microsoft-Antispam-PRVS: <AM7PR08MB53351900EEEBE28CD99CD9EDC1C49@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:131;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QTxoGRqHoWZxKSZSsJg3QfJRBlE2jDJuuw48gFtvnnf5E7PV2tJtjtvcZ05sKAv6CHGy3f+aqtCiofbkiUM4rfI2ILYyyQ+J04HqOojA0px+QpO1PR1BPtHCcwDGAs62w2pA/YzmXboKhs2MSF5Cx6z+G83hvBjELZOY/PHr1IH4hIc6gf8ZXXqhRb+WL1n7ZxUClsgpGg9lMsnzGDmLhouf+XPCC0EJWKRK0R+dPEHrekbmtBdoxWE/ZBiZoPsM/veOJRycEppubfcIUvie2ANGBqWaDP2oq29IFuOqVRiwsDFfySVywzB3DmgLKTRQEW5du+sOGzj1DY4TXSYGq6nxsk816QMmF4YCkPCa0xkClr44OhxvoVWOMvrLh2BKAoaoZfmPMBuuV1KC/6xNc4oRvklUhyMaYa/pzE0aNbEgnPaARMbeSkhSSj10EaFoxw6Sp/OJdmfF4l4p6eQapeqFaCxlxrBByZPy8BQz5ETOJI7+S2NmtGSbu1m9k7YUVg1gbjrOitnYFfLeNGZMZkuFb2nAZ6QAP28X0UcbkIEej/SJ7XmzJw/9lmwOlNuT36djleNZgRILnX6xHXLQ4NPmLE37IID6wx7K8vl3/DB2BxeiLkDm+pr8isFJwrEnUrlyqrMDJ8O36YG5oOkT+mDxzeghRzgoUYW9NmIB1eRo5O4Q+pJkwOMvVnJmCd1KygjkzjIx+OwotqAxZYWVzA8M8nycRjENe/AQp4+MXQV/wnK98DyiOrnCxknW0owqc5OwgjwbxCjNaITx0ksf7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(39840400004)(136003)(66476007)(8936002)(316002)(66556008)(4744005)(2906002)(66946007)(16576012)(4326008)(52116002)(5660300002)(53546011)(26005)(86362001)(8676002)(38100700002)(38350700002)(956004)(6486002)(31686004)(7416002)(31696002)(186003)(36756003)(83380400001)(2616005)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZyWkJON2FPN3Y4NlF1TG1mZm4zcElxbWdneTRBQWpvV0w0OHVBTHQ3MytN?=
 =?utf-8?B?b3FnNlNLcTlhSFZoSWRWRjhlV3Fzc1NCbGFIeUUwL3NlcWF3TDlOQUw2eTJh?=
 =?utf-8?B?d2lhTklvSmVyU0hVUDdwV1E4VnY1U25zMmlKU1E0UVBKdkN4dndmSEhuSjRC?=
 =?utf-8?B?NjJlMEVhTUtMaDRxR3ZGcWd3MDQrVytNTVhhbFlJN2dSZ0lmdFJWSlBReHZz?=
 =?utf-8?B?M3VxbXZpRFIvVjQ4djN5ZmdpaUIvVVNvTXNTU21lb0lPdUZ4dWZkT0l2ekg3?=
 =?utf-8?B?U1V6K1B5RFRRL3JtQlFFRWtjMitDTElRZzdwSFNGdkdkalBqMVQxelpSWTBY?=
 =?utf-8?B?SGJNK0puSWZtcEw0UG8rbUV6VjhUQXh4UklIejc5ODJZS3JDMHdDR0Z6dkV2?=
 =?utf-8?B?UGlsMVRIdTJhZldKZXUxTS9aWVQ2Z1haTnZMWitTb2hCMWJic3JZVGxLQkNZ?=
 =?utf-8?B?VmhOT3lGaHY5ckJxOWx5NGRWSlQxMzZCbkRpSFJCcmZ6T1AzT2prQUU1Wkx2?=
 =?utf-8?B?SFJ5NWRNeENKeWJkSHBEWmpvNTMxSC9QRDdxTnZFV0l3MWdyZkxuZFZtOWlo?=
 =?utf-8?B?anB1WDdiZzh1dEFpZkxYelArblhhZlFBUVNxY1MyR090d1EwL3o5NHRjc2lP?=
 =?utf-8?B?WEFkNGJmOHNNL0NvdHB4dDZySUxvN3BlMmZERjY2aXFmWXRIaWtiQ0dVMjUx?=
 =?utf-8?B?Z3lNRGVCK2ZsWTB0OEE0QWFTQWVyQ2ttaWo0YXBxRTBZSFFtZWhsUTFybUJM?=
 =?utf-8?B?bFZoN3R3OXlZU1gva0ZxRXJ3c1ByRXhBQkhidStGRVZETHRSZzVCajhMU3o0?=
 =?utf-8?B?K3RST1Q5dnB3cEtFQ1l5Q085YjJ4aVlIK2pXZUdxT1RDbmUrUm4rbmZPWW5y?=
 =?utf-8?B?d3lRVFFKd0lGMkcrbjhsbml3cElvaFlwTUN4QzBNTGVMc0lQb0tybjkvazY4?=
 =?utf-8?B?Q1Z4N1pLWG9TUE9DODlOVDBZUXRiTWN5TFNXLzl2eHYyU0N6NnBnZlpkbGNV?=
 =?utf-8?B?bVBVQjlsTDBjTUMvT25CdEtjazl1UzRiVlAvV0tHK1NvYzdyNUZ0ZHg4eGlv?=
 =?utf-8?B?eGc2bFdrMlpCWlJKeXhVajZoeDlOSm9jNWlhUHZjazlvbGRzSE1aSk1nYjVM?=
 =?utf-8?B?cVRCU0NqQTB2bXlWOUNXNzlmeDVOVUZmNWtMclNiUDNDTTdBY09UM3RQZmN3?=
 =?utf-8?B?Sm04RUE1OXZtWTBUUkFFdVZBK1dYUE9MQjZQZUNsT2YvNVF0cElrZ29YbkRw?=
 =?utf-8?B?M1Q5eEU5TjdyWFpNZmpwa1I1ckRzNTFBZjVHcUJiOENsOHF1MXorbDdCL1Y3?=
 =?utf-8?B?QmJ2VzIwd29UanJpSVNuTUVjcUhTVEp4UW9pWmpZUWg3bzJEaDZXOGlQU3o3?=
 =?utf-8?B?U24wbEZUS1V0U2dieWMydjFLdUdYU2RQb1dUL2pkNEc3b25QTVV1a3VZQmlU?=
 =?utf-8?B?c0VOQitsWHpRb3h6VENMQkhSajd1amRpUTE0Nk9wdEFCbnE2QVJxVGtDZEdz?=
 =?utf-8?B?ZG1DVDkzOWI0OHdoMHYvNy9WdUNJLzR6TmFPa01MT1E2ZkM2TDRUazl2Nk1a?=
 =?utf-8?B?dE9ES1dtckU4cUNMMWJWMWczbkVYYmdlbCtNSXdrZC92bUpkblAxRFY5LzJa?=
 =?utf-8?B?N0tWcU8yWVpmY052MVFDaVRWc0xyZVZBTUNtZnpERU1WejVwdDRlOFAyM3ZV?=
 =?utf-8?B?LysvcW0xRERRNHpXTHdHbStiVWpKdFBBK2FuSVJWZGxZalpzTXhXWWxrNE1K?=
 =?utf-8?Q?xC0XOdNYEdnDzHPbJLZTK+m7gm3IB5Zu4Nn07rW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86491b80-301b-48d8-5cbc-08d96653b525
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 16:33:15.8224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcCS23lRdVV0jZehFqUvfNszwoKgvx9Nl9vm96pAP1lFFqOdyUM4Jb56gxGETABbSAUE4PBbRTIfjV1waPOvV286ngcPtEnXwu26DQJlevc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Received-SPF: pass client-ip=40.107.6.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.08.2021 18:17, Hanna Reitz wrote:
> On 04.08.21 11:37, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/copy-before-write.h | 1 -
>>   block/backup.c            | 2 +-
>>   block/copy-before-write.c | 7 +++----
>>   3 files changed, 4 insertions(+), 6 deletions(-)
> 
> Well, I mean, it isn’t exactly syntactically unused before this patch; it’s only unused because this patch drops it from cbw_init(), too.
> 
> It definitely is functionally unused, though, so:
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
> I wonder whether we should drop @use_copy_range and @compress from block_copy_state_new(), too, though.
> 

Yes they are useless now.. I can add a patch.


-- 
Best regards,
Vladimir

