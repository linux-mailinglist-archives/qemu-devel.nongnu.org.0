Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E712BB0E5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:47:56 +0100 (CET)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Zj-0006eE-AI
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg9VZ-00029J-CZ; Fri, 20 Nov 2020 11:43:38 -0500
Received: from mail-eopbgr50102.outbound.protection.outlook.com
 ([40.107.5.102]:55975 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg9VW-0001X2-5P; Fri, 20 Nov 2020 11:43:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbq6oVZq44Iz5lytPO9olxTxwOErLXhhfww7s5PbsA5AvdEQA00GwVf4zvq25tsYpBVu1TemRfQLP3joyxNWa4F3tmQGJkWjlRKQ36SEKbo0EbAWsdq7CTW9tAyICQ3HI+Ljt1QSTU7MZz4ovYa+Bmwvyb31hgASh+F4Lc+BZusLSYZiZtKIOiKG/v4ljeftj654qmn02gTEyHm0R6yXNEd1zXJKSs5dVaf9VQvQkjaNwTmp2bHAZ48VU0JKsf5bmhPecTtybnstZVItqqYHHsqJOxTWcFJXjFWlssJSCQNiFHUBBQOTdBOOlnyr+xQn13PlvPpjV4EOqAmhazvMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7d7tZYaDrXNMihxrp2aB/kmYRciFBjsoWJOnGmxn5Q=;
 b=bi44PaMSdfB3CEMDPwncfN6++B0cGlOkhSKSgo4Ayep6vAa6RE4xIA4UzE13e+FGs89k6e7uXRTbmF/CkWm8ifzf0gzwKcWwLDsTdNnEzQBCAnPDj2cjT7C7+LPsjPv5rkpzv28b+ifMwGw5AD2QGE/9WTpAsjINe+qbmyk8Ci4PoTEDNLE5ZwB0qXXLeHVidAt2rc5j/ZiJSxKPOYuJv8qCM2Zm5peKY+S1RZWQJs9FVvwcFfkuUHdfksHDwK5icbZpO3R/xAFfcbl1mxRXITykr4Yd5JzE7SGd9ygaLX7faetRAUSJWLjCNF2kDSj+Koa7TgZGQfRKRFGb8qQuhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7d7tZYaDrXNMihxrp2aB/kmYRciFBjsoWJOnGmxn5Q=;
 b=l7JNmfdHyWv+nTd6iMFlimDUVNYT1HByunxAEEc3V15/DZHbRpqvgpFhlyZBqYbb8lwfNhU7Y+rXYjqVclxeiiIGKJfGXtci0uSSkdHQND+p6nk2pgFFzHRNYyiTOfr8f72sXEcGtHyadrEcJpi0Vjs+IG60fq/ZZMQBlecJKiU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Fri, 20 Nov
 2020 16:43:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:43:24 +0000
Subject: Re: [PATCH RFC 0/5] Fix accidental crash in iotest 30
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, jsnow@redhat.com,
 mreitz@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com, den@openvz.org,
 eblake@redhat.com
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
 <20201120163627.GD5599@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e72b2129-0e65-5f8f-a90b-baf03757b1c9@virtuozzo.com>
Date: Fri, 20 Nov 2020 19:43:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201120163627.GD5599@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: AM3PR07CA0098.eurprd07.prod.outlook.com
 (2603:10a6:207:6::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.108) by
 AM3PR07CA0098.eurprd07.prod.outlook.com (2603:10a6:207:6::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 16:43:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b81406ef-785e-4ad4-7e09-08d88d73662b
X-MS-TrafficTypeDiagnostic: AS8PR08MB5944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5944B81AD794B85E9BEBD7BAC1FF0@AS8PR08MB5944.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FI//94PxPnlqn1sBU6K4GlQLEa5yn4L11jfin+Qh8SQwdDjNGJGTiA3o/JHRUfbxoYlPt+1jAWVNSqejuLxPeRuhY/afSyL6CWwnyn6Jpey+JMa5KbLm18rdSQcyinsCyDjFWfn4r6qIHqTl8FwNE+I5GcmNFGFAMa3EZqJ/Znqrpk7oUYI7EdtdH2PJFCfi72ngXnuM7KprXLesdq269mlRAgtCGNEGaCDTlS8rHvw0dSo0Pyb3mgOAXCRIaLABTXvpS0y2AUFCapRUQQs8l/GwFP3e20/xawJLH0J53QKUSTFNdfvbFiDzrrnSbNXzkJFDbb7IoP6IHoN/JsD/eUH9rK8StHNWcQrJPDGGHKZhmQgNM/949BhC0QsqdKjd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(136003)(376002)(396003)(346002)(16526019)(478600001)(16576012)(316002)(86362001)(186003)(8676002)(6486002)(26005)(83380400001)(8936002)(31696002)(31686004)(2616005)(2906002)(956004)(4326008)(66556008)(66476007)(7416002)(66946007)(52116002)(36756003)(5660300002)(6916009)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ytdHPA8Pix9t0P7XD3RQkbTTI5poClGEkg4tWrR+PB13uSdYO/36MMxcohxMiB+AT99Ka1q1TeMfPEaEVf4t1No2YbN4hzruKCLXYbw3YjDFB1+eylpvH0MEMIVFujC+gSrpJGDLPpKC3lUbvAuP6Ig+BrByYriNs5/whyY3j4ZCYUFk9/q/LZdvmsSgeka3cvufGWu2mcqYt1dImMIjBvKCXYnGllFS6pMCG9YnfcJxQg9Igxu85fl9UAKW9Tq7k1ymOyfhLYVMZDKLsYWHCGJuH2miGA3lgZKprBd9cA9WD+tAgtxO0QyTH2kwE1KA5SYOSZlLz6n0jzWJ/yXgNaK62HJSYgxVawtpA1w0DLRYsnfYOZApDzor91PCQwYZwgmBDluOrPv5B/BN6yAnroGcFEAL07zZWETGqtsLQnJ6bxfshDxmcdIg2jgsFA8obr0Y/71zgEDr+6hGaHtuQwvwkmNaU3QCzrDoylWAMH9cb2nIDd3TbcgiG4sCMieZCnZcx6H8rIa7/J2g1giZDIMBV0CChl9r2IJ8tq/ImBTKpWHasuobITnWTrorcbfuQrpYGUbAFiLs478RiKiyUz8Ya51fhNN9nYjn1mI5qGmKO3GHqrQTfUYvofqyzJR049lRwC8LVsNmqzQKEWR2Mg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b81406ef-785e-4ad4-7e09-08d88d73662b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:43:24.9210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2TlrBxAplIMa7FxKTwraivd6NMHiJx/5ZWQg/cZUed0ZIHcfHBoM6a9/qZuMt45xYCUa78RRgIUP0RIBZ1ds9s2JdPUFbNRwUdYzLsEny8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
Received-SPF: pass client-ip=40.107.5.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

20.11.2020 19:36, Kevin Wolf wrote:
> Am 20.11.2020 um 17:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Hi all!
>>
>> As Peter recently noted, iotest 30 accidentally fails.
>>
>> I found that Qemu crashes due to interleaving of graph-update
>> operations of parallel mirror and stream block-jobs.
> 
> I haven't found the time yet to properly look into this or your other
> thread where you had a similar question, but there is one thing I'm
> wondering: Why can the nested job even make progress and run its
> completion handler?
> 
> When we modify the graph, we should have drained the subtree in
> question, so in theory while one job finishes and modifies the graph,
> there should be no way for the other job to make progress and get
> interleaved - it shouldn't be able to start I/O requests and much less
> to run its completion handler and modify the graph.
> 
> Are we missing drained sections somewhere or do they fail to achieve
> what I think they should achieve?
> 

It all looks like both jobs are reached their finish simultaneously. So, all progress is done in both jobs. And they go concurrently to completion procedures which interleaves. So, there no more io through blk, which is restricted by drained sections.


-- 
Best regards,
Vladimir

