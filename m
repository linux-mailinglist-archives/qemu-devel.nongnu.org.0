Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C885840B3BA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 17:51:31 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQAiW-0005i6-9o
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 11:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQAGC-0004PM-6h; Tue, 14 Sep 2021 11:22:12 -0400
Received: from mail-eopbgr70103.outbound.protection.outlook.com
 ([40.107.7.103]:16602 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQAG4-0002ND-R2; Tue, 14 Sep 2021 11:22:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5saCdqtFXM7hSNin2dRoU+vR9sIC9c5uRKkZDypc+QArq24MpX2svzwsUjqfuMg7/wh1xzLYH6CxHl8+5CvSsdcWAMLreDhVCX6cDlWrv4ZWe/Z9tLleSPmEf7WQ3gnFIwWmus/zgigj5F1ATDJdpfXRc+IQZn9T2mrafTGYHdHKVMOI5arVR3J9K5WMuScvLvi0N1MgWBcoiWOAhsszg66RHpK+Fw+jgHwfLEaNOJGczOo6ZQ4uxtq2sAGUSAeKOHIY3UdUK4IToxrZIbYTj+q+Ltn00Zoyti6mBfsco+JsAOpdT6rOmT381Wvz5/iMZlUngRJ9ZLdJDqlZB6JBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=uP+WXMd/nsx7yc75BZgoORp5Eo6EX9qLY32phURiUDA=;
 b=nHUEIklTejvmclsnHlkVZ7BMq4TOuUyyCVdnFFsjPogWOajKMPdU1d76KMQlpq0u+shA/Ea5ls5ZrUrF74IEnT3ivyLKtpDfW/3Yr8Km2k/qRdcc0Mr1I/9g1eT2tzuBOBaN+QT7o5ntVZ9uwbbsYeT3LKrm2nV9OESNSl8plIHDJqpaoDcLidZm8yZwMILDhwFxLqBgElct5QhCR2yrL6lHYrZOJHvQWbJFEKovgHS7zAkTr48ZlFVkNuw0JsszyBdcZlLYilXkV0M7D4IajybIaf6vix26YtnBKIVPMu/xeGFYvQEVVjMr94iWJOJDFVeFnba3KFUe3pEc6taKJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uP+WXMd/nsx7yc75BZgoORp5Eo6EX9qLY32phURiUDA=;
 b=CATbrf3BXPsJjze00ybTpvBgR+AhAXXkes+q58dmCeV0kpMkaXiTgQZpu2glhWCM0aaw0TN/RTIuFQnNFJ1N/xIL4r0P1s6EF023Xb4ns5Pg4M/ohzz0/I7+in7v0hDg1BO47/E2iTQxn6f4DjL5j87W62PyIDC+PoKqVk6RO8s=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 15:22:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 15:22:00 +0000
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 eblake@redhat.com
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
Date: Tue, 14 Sep 2021 18:21:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210914145200.GJ26415@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0255.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::27)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0255.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 15:21:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d1fef88-d4dc-4e9d-0120-08d9779365f6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-Microsoft-Antispam-PRVS: <AS8PR08MB629351A62EFF97B0D60E0CEAC1DA9@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9HfpEMZ5+XMoCuLLTLUSlyWGg3ODtFbZZKuwUsBNs0xJ2UGJ2m8NmTujE9NKZM8m+bbjVN+gHFbPFNBZngWH52BBVTx37RxCDJKpXekUQ1c6oLclmVUIp3WkGyltloWtGA+Umlk7401MYk6p+ZHGj40C+cHlB3gxZ7fmYH8oE5BsGdmW26NyBnEwQzqrtrq4W0sHlC48XBXIXRPCTAvDrIV4CqoCkky7yWbWdMchMdfPesLJ/8VO3TRf+yw0uwoLiCWNkWjbRFlsc7Ei643WU232cst9QD77yY871POlohnsmltLNKoujlqXjdAH5Z6+rzsIrAnM4Wp3JnmCm2H5vHpzD94jLnzGH4Odl+3Yqdr+sb+vSOnKETMmRDjW02umaLFBnNsB2nsyfTsnHSW0K5iJ8qeGlHBlWZ7t+3RyORCrew9cAdJ5I9JJPh/oaASwvpa3AcfIa/zztLrLpHKPjIDzRCjr+YVQQvMlIp+wCUpM+UREEu7p4R7WkK1Hg0QBE8F9GdHigVyMhipUdEUP487VmWexFMt+Uv81BiNQaekmvVSaXaoJ1gODzbH7YWUPRSuqGnY/HDWzINiEIApsVngjwJU4TkhwC83lS0RZGB0M6egJVQiFReZrXS3V4+FgQD/cd1iOYQPHjIDNVh60Z6P1U/PQ8nuuTz+WU5Af4SNxF3ESzH/NfyjOh2FQQPcDg80c+3oU1vmXFr6pXJ5IwEG/1TVJwYSZYZeN3O7HLC/3dys4+4NvHrRuC2El8CJ9/hX2I081PgFrVuvlDjjqzMzogcfYmZAbt01EqwR8+8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(956004)(2906002)(86362001)(31686004)(478600001)(186003)(8676002)(2616005)(31696002)(66556008)(5660300002)(83380400001)(6916009)(36756003)(66476007)(66946007)(16576012)(52116002)(26005)(4326008)(6486002)(8936002)(38350700002)(316002)(38100700002)(33290500001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UExtYnpCRU5XZU5uZmNrU3B4VThwK1JobnNkSzRtZTIwaEZkNno1cVlBQU5B?=
 =?utf-8?B?cWw0bTJuSElManpJZWs4Ri9GUG8zTkRBRU90c3Y5aGlsTW1sMU1Ra2k1K2Ew?=
 =?utf-8?B?QTYralg3cnJOOS9pZ0M2WlBZZGZTbmI1N2NTS256a2NrWGRsNG5EbWs2L0I1?=
 =?utf-8?B?NnlLTjZjc1U0MkdMZDFBQ3IzY3JCWkEwQWJROEVqKzYvSmZFbDVuMHkzcjVk?=
 =?utf-8?B?QmdydWo5M2U3UnpCdGtlVUZHN2tjT1JvUFBGUjFtWFRzdzhVNFJiVVFuZUpL?=
 =?utf-8?B?U21KOHFSejVkdXpKWXdGa2htdUgxcHdMbXVCRnE5dkxKRWJybVlsZ24zV011?=
 =?utf-8?B?NURHL3VKN3J3RDFuSXZ1M2Vab3pabDEwNTcvWVhlV1VGMEZ6NnZ6Qk9qUFR1?=
 =?utf-8?B?WXVUeEM2ZzZMS2J6MGtoM1BaSkpIUjNMeWlBczZvcGFwMmRxM1ZHV01KK3ky?=
 =?utf-8?B?OGtBY2M5endkSHhrYmwyQ0FSUjloNjlPekFsYkxkeEY2VE5VZnMyaU1BTUZr?=
 =?utf-8?B?UTRaK3ZBWERxYlAvUVdlWkYwbDhvbjIrcC9GS3k2WjIrWGNiT0t6UXlRS2JU?=
 =?utf-8?B?WXpieWtydWE0cWtsNjhTcTdrSjhCT0I1Ry9COENXUEUyRlZEYklnMEVhaWI0?=
 =?utf-8?B?RkJpMVdyWGt2MmlaWVl6MFM0OWtqR2JCZzZrRTFoTXBNSGVJcS9HeitFcWdq?=
 =?utf-8?B?Q29naU4zZ0wyU2lkUnlQK3c4T2N1VUplRTVybVRIMkNBUzFJYVY0b2wwQUFJ?=
 =?utf-8?B?K0xQSGZlc3o1VVdiR0U2Zld3bE9HSFdWRnljblhwakxsL0NXSGNZdWU1NkJW?=
 =?utf-8?B?M2xGMzBHTTRFUlFWV1Q1eDJWK2VKYnROWmNzZndDcktDWGRDTjUvYnBSWlBy?=
 =?utf-8?B?OVlrZVcrUzlnRVVEYjQ4dVhTOUFzSU10dW44R0R2dVR5RExSejNpZEdINHRs?=
 =?utf-8?B?bm1aRWlaSFdKSk5yaEFNWHpTRkVxVjdmT1dhMk9VWmF6QjdHbDBjUzBacHU3?=
 =?utf-8?B?V3pydWZCNk9QZmlwajQ1K2x2bHFTeFlhbkc2NXFyQmFqOHJHamNSSDcxZUw1?=
 =?utf-8?B?SitER0ZxdDhvOE9XWlZqV081bHJwQ1RaWUhyODN4WnVGWGtYUCtja3ZQN004?=
 =?utf-8?B?TnBRMG9rOCtDb1pwclBhV2dxV0JaVnV0VWtuVjJVcmJ6NDZQbXpVU1MxWnVV?=
 =?utf-8?B?VHNCY0xESEZDQWNoMytmODFwdFQzN1JJK0lpd3B2Q0MxYnBIT3kybjJKdmk2?=
 =?utf-8?B?Uk1zaU1KQ0dWU3U4RDU0ZGRTdkUwZFBMZWExTksycERJenpGYVd1dWxObHdD?=
 =?utf-8?B?aERTd0FFTFdLM1duNmRJNzVBbWtwQWx4Qnk4aG5mTnM2a2dTRlV2bmFheXpw?=
 =?utf-8?B?RW9aTVE1b1dEOEVjd2VqZzJ3b3lnbWk5NDV3WDBGN0NVQlY0M2RPZmJOVm9l?=
 =?utf-8?B?dk1TZTlqYUVDc1RTWi9PejdkZVR0MjRYSDE4U2NJTG0xZWcrMmEzR0hrczQ3?=
 =?utf-8?B?UHZpd0ZOKzBHdzZlc2ZSSmU4cldCdHc0bTlXMHk2RGNXTG9kNnFiaWZaRXRv?=
 =?utf-8?B?dkNsVFZCWjh0ZE5tdjlpdmNiMzlESkwxMTVqamdUcStOTzVUUm0yek5yMVpm?=
 =?utf-8?B?bjg2UjQ0a0o5cXY4SmQvdGFwRzZxcTFIdTBFVG5WS2RVTFNreWxOUWphTGRW?=
 =?utf-8?B?bDlJWjNTMW15N1FzTTlnU21EQU04dGlyL2ZrdEhJU081ajRQUG1iWFBMZ25h?=
 =?utf-8?Q?/Ffua8FSnUfe4bYuFHGpg4U2s5dcxs0pksSG9wo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1fef88-d4dc-4e9d-0120-08d9779365f6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 15:22:00.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58vx0yUQ4TwST3z0exTbU1wq0lwNnb9SQPsCFSH9PrCo9LcczaUAXxL5Jak9bm7kTLmUnbjiOnAPA+PZfvCl5hdchLhn8W7zNIjBi+cQOEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.7.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.09.2021 17:52, Richard W.M. Jones wrote:
> On Tue, Sep 14, 2021 at 05:40:59PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> 13.09.2021 18:19, Richard W.M. Jones wrote:
>>> $ rm -f /tmp/sock /tmp/pid
>>> $ qemu-img create -f qcow2 /tmp/disk.qcow2 1M
>>> $ qemu-nbd -t --format=qcow2 --socket=/tmp/sock --pid-file=/tmp/pid /tmp/disk.qcow2 &
>>> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()'
>>> qemu-nbd: Disconnect client, due to: Failed to send reply: Unable to write to socket: Broken pipe
>>> $ killall qemu-nbd
>>>
>>> nbdsh is abruptly dropping the NBD connection here which is a valid
>>> way to close the connection.  It seems unnecessary to print an error
>>> in this case so this commit suppresses it.
>>>
>>> Note that if you call the nbdsh h.shutdown() method then the message
>>> was not printed:
>>>
>>> $ nbdsh -u 'nbd+unix:///?socket=/tmp/sock' -c 'h.get_size()' -c 'h.shutdown()'
>>
>> My personal opinion, is that this warning doesn't hurt in general. I
>> think in production tools should gracefully shutdown any connection,
>> and abrupt shutdown is a sign of something wrong - i.e., worth
>> warning.
>>
>> Shouldn't nbdsh do graceful shutdown by default?
> 
> On the client side the only difference is that nbd_shutdown sends
> NBD_CMD_DISC to the server (versus simply closing the socket).

Qemu as NBD client always send NBD_CMD_DISC on close() (if io channel is alive).

>  On the
> server side when the server receives NBD_CMD_DISC it must complete any
> in-flight requests, but there's no requirement for the server to
> commit anything to disk.  IOW you can still lose data even though you
> took the time to disconnect.
> 
> So I don't think there's any reason for libnbd to always gracefully

Hmm. Me go to NBD spec :)

I think, there is a reason:

"The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances."

And the only possibility for client to initiate a hard disconnect listed above is "if it detects a violation by the other party of a mandatory condition within this document".

So at least, nbdsh violates NBD protocol. May be spec should be updated to satisfy your needs.

> shut down (especially in this case where there are no in-flight
> requests), and anyway it would break ABI to make that change and slow
> down the client in cases when there's nothing to clean up.

Which ABI will it break?

> 
>>> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
>>> ---
>>>   nbd/server.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/nbd/server.c b/nbd/server.c
>>> index 3927f7789d..e0a43802b2 100644
>>> --- a/nbd/server.c
>>> +++ b/nbd/server.c
>>> @@ -2669,7 +2669,12 @@ static coroutine_fn void nbd_trip(void *opaque)
>>>           ret = nbd_handle_request(client, &request, req->data, &local_err);
>>>       }
>>>       if (ret < 0) {
>>> -        error_prepend(&local_err, "Failed to send reply: ");
>>> +        if (errno != EPIPE) {
>>
>> Both nbd_handle_request() and nbd_send_generic_reply() declares that
>> they return -errno on failure in communication with client. I think,
>> you should use ret here: if (ret != -EPIPE). It's safer: who knows,
>> does errno really set on all error paths of called functions? If
>> not, we may see here errno of some another previous operation.
> 
> Should we set errno = 0 earlier in nbd_trip()?  I don't really know
> how coroutines in qemu interact with thread-local variables though.
> 
> Rich.
> 
>>> +            error_prepend(&local_err, "Failed to send reply: ");
>>> +        } else {
>>> +            error_free(local_err);
>>> +            local_err = NULL;
>>> +        }
>>>           goto disconnect;
>>>       }
>>>
>>
>>
>> -- 
>> Best regards,
>> Vladimir
> 


-- 
Best regards,
Vladimir

