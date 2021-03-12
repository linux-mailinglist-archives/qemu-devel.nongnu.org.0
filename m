Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E31338D37
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:39:23 +0100 (CET)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKh4b-0000mY-TH
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKh0v-0006vK-49; Fri, 12 Mar 2021 07:35:33 -0500
Received: from mail-eopbgr10102.outbound.protection.outlook.com
 ([40.107.1.102]:8222 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKh0t-00075B-3M; Fri, 12 Mar 2021 07:35:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKfoNOiR7krGSYMF6PDW0PzLSpONZQRnKlU29hBrzUGtFeOJiyO99NlzUUJKg++ATqMnoax/r6iAWLfSbWV3SQLh7DpLTrknsSX1QA/A2xYpwJMhyaLN3SriUAQ3kqEDORH728i5jVGAsyjEsFUHFjTMtw6L730JEEF0Lvif4jXnhTn+polezc38sNN9Hu3nDi51g/pFWnaQ4/U7p7bICNh0nHj63LJ89fRVI7gkUY53/gCLnCy1hDzrzjfSzThsydHvNw74S3GckuayW1uWEqJk2q3nT4fWPbhSAW6VmoH+HskTqOn8tOrmFBdd1BVGcfVlDHtd7p5SEwY6ihC8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0akp1hZGD0DsuuPCWzAuLMv0C+ltmGwp6UsvgEEfz18=;
 b=d24P2kv7nPwHIgmHT97znB7RbOCr8RU4tuGonI6C3j1k11EbP9UDvpuqMzpAA+XYV/n7AC5BP/kYQQiftsx3RHKBFJYqf2aJWYEIqJKylfKEfrOvh/yxmupQ0/Fdg1B6cshgi3EvRn1NxQdBZkOjVTwiljNlsgmymiuSlN68vREzczzMxDdTW8565w436LIuXBuPKYmx9dwm7gaHZg6UCDAhfaF8JAAs92Spy6x6o04w6SBGY9IBygeNs/wHXuezY+g7rmVWEcHAZsI1ZfWtb1nc2sulWgsZVXy0w71Evp68S4wkYSnhmOBp31DnkOnzht03iZxM6waZZcuyphfS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0akp1hZGD0DsuuPCWzAuLMv0C+ltmGwp6UsvgEEfz18=;
 b=Mi02J+l382UNUein6SIgPovlnJ+YeBA2Gj2/my1Qes5ESvTF2wfSQg1BIxDpFanA3lBcuVbPmhmRYwHaVKuEpFw/aaG0LBz9mmVbDHKjCn5YXIOFgqQXcHldYqBzf3ClhLpJcQL/5uZh/C2t65urc5Ziu/BnbUwpHUCFpLEQ3uU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 12:35:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 12:35:27 +0000
Subject: Re: [RFC] nbd: decouple reconnect from drain
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, Max Reitz <mreitz@redhat.com>
References: <20210310093232.519585-1-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a1d202b2-ddb6-e173-c0a7-e3199b641499@virtuozzo.com>
Date: Fri, 12 Mar 2021 15:35:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210310093232.519585-1-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR07CA0101.eurprd07.prod.outlook.com
 (2603:10a6:207:7::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR07CA0101.eurprd07.prod.outlook.com (2603:10a6:207:7::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.11 via Frontend Transport; Fri, 12 Mar 2021 12:35:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1756708b-7468-4dc6-ac06-08d8e553508f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6806513CFB50734811B18214C16F9@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEjdlG1bLu1cv2AfEHRwWGuGU2GHjoTiY7OS2AnqzDG4KgbaFHDo5asQYJhaX2SbB1F3eBJnyt6jxrgLL+MbW1FENlrgNjt0jo09uCZx+FQ4NTx3GbFp2oTzcIlIF9cqc1ZdCnH5MIjguZdvuCduTSlDZFueStwJGyGoQVAhLa85EeCY8eZteikpZk+WzxevR8EE716WLs6W+gyoJepSb5/mPhnKFgomhZL8xevH4DF5LUFG2Kn00tbMdU8CXdmEo3fum4vS6hDa0FxvTISH5rcDjmFBqzTztbQJTASUA5eRV3s/02ck7z3wvtzJERaEdjPsbPGF0XOsNuitGq3cDivtZPdHopS0DPpk5ZkJKFJ0uSBECAbs63o1SxokK1RVQBTvEHqP6SUiIrZVoI5PwzIKKKC9L2R4V9014onDYHKU1b/d0xXO4yYH1XWVIB+YjYwfCKTu1VaY6tMG8NilHMSo+731nN0+jsIuTw69lW6uoGCvjN/CtrEA5G0k0XX+xN0vOtlIjsgIV9xGeY+mDlw2Fl+ROLI/JdB9gqn6T9qeps9lpTPgpc1zSBBmgwEnsV9eZOPzw1NTi5FPBlWkSfRDgD5GwTDh3HKN+qYzGw5N+Pd44ZGWmUgpPd7r70+RTSDrv/tAowCaWSt8hMbtvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(396003)(136003)(346002)(376002)(8936002)(66946007)(478600001)(66556008)(8676002)(66476007)(5660300002)(956004)(2616005)(16526019)(4326008)(186003)(2906002)(26005)(31686004)(36756003)(31696002)(83380400001)(86362001)(54906003)(16576012)(316002)(6486002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: cHGRoPnoAGcrBfIkr3yoLr3in80xu7+3ltIj+uYuq5cl3jz00G3Fj62Ny4CWLPpIivPQyL8mo2SUHuWP4JGhU2fs4UUULYTBVkY3LyAR1j9FwiCd6Zf5TZz++pKxnmjQd3UK7GDly2da1XnwbViLHrCV/W75zlj2xqzZfOW+u9qyxVsn1i3IPKzrn6ImHpC2kA+mMyDpMLXJ4ZeXyLG4yAPT22afkV087g7ZETnkHObFrT/dFr3tciAPfg+msCvZOymronRFZwLTql0O0kpGI23FObJvpCBDEOB8yeaC41AWOhS45BZHfIDOBW7pShWTM9Ltfn/W5VcLQXkv4dJQdWE0Zo4EO2sjNBELEr4yhvVNdZLooz7ttsnekpE7h5fNOB76OTmms6H/qhrj4XLB9VfXWL3JIdydjaBlfZiK7bn7SBvlCSWTtSD4agVeJk4obnWqYzIuFo74paUaCzl+tPDlQL4hMVzTyiQpjn1IxCFrr+J6Cq9/qQpfLh/t/OIrkHFNkleg5XjW4CaVvWGMiqFigtqRj+9z/XADt4NQncwffb/VL/09YB02Ruvq/CKxuVI+nsUdyNq39Lbj3Psx66uFvNLu7ntX5oUI6B+hwXrFXWmKWXTZt2/75cSUCvzW6D5P30E2MxFtnYRuO3npyZw4jfRl4HPbSo4Tz/Ts//YA7iZEC0vDAJHwVVDKHeBy8d9ctdkyYtdTG2oAZV8LAmKC7G+/EDu1H8EqYzTgXqj3IFGXZG5/I23w4IzKwesC
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1756708b-7468-4dc6-ac06-08d8e553508f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 12:35:27.1316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EkfBsmR15gUA3Xb6tCLIbnaSKHivQMycyz5L0em0e9housHCKl3qWBxV+He5Dlw7moprY5y1Td5GZlhBTSClo0mR+OqirDjfzYLSHiDvok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.1.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

10.03.2021 12:32, Roman Kagan wrote:
> NBD connect coroutine takes an extra in_flight reference as if it's a
> request handler.  This prevents drain from completion until the
> connection coroutine is releases the reference.
> 
> When NBD is configured to reconnect, however, this appears to be fatal
> to the reconnection idea: the drain procedure wants the reconnection to
> be suspended, but this is only possible if the in-flight requests are
> canceled.

As I remember from our conversation, the problem is not that we don't reconnect during drained section, but exactly that we cancel requests on drained begins starting from 8c517de24a8a1dcbeb.

This is not a problem in scenarios when reconnect is rare case and failed request is acceptable. But if we have bad connection and requests should often wait for reconnect (so, it may be considered as a kind of "latency") then really, cancelling the waiting requests on any drain() kills the reconnect feature.

> 
> Fix this by making the connection coroutine stop messing with the
> in-flight counter.  Instead, certain care is taken to properly move the
> reconnection stuff from one aio_context to another in
> .bdrv_{attach,detach}_aio_context callbacks.
> 
> Fixes: 5ad81b4946 ("nbd: Restrict connection_co reentrance")
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
> This patch passes the regular make check but fails some extra iotests,
> in particular 277.  It obviously lacks more robust interaction with the
> connection thread (which in general is fairly complex and hard to reason
> about), and perhaps has some other drawbacks, so I'll work on this
> further, but I'd appreciate some feedback on whether the idea is sound.
> 

In general I like the idea. The logic around drain in nbd is overcomplicated. And I never liked the fact that nbd_read_eof() does dec-inc inflight section. Some notes:

1. I hope, the patch can be divided into several ones, as there are several things done:

- removing use of in_flight counter introduced by 5ad81b4946
- do reconnect during drained section
- stop cancelling requests on .drained_begin

2. 5ad81b4946 was needed to make nbd_client_attach_aio_context() reenter connection_co only in one (or two) possible places, not on any yield.. And I don't see how it is achieved now.. This should be described in commit msg..

3. About cancelling requests on drained_begin. The behavior was introduced by 8c517de24a8a1dcbeb, to fix a deadlock. So, if now the deadlock is fixed another way, let's change the logic (don't cancel requests) in a separate patch, and note 8c517de24a8a1dcbeb commit and the commit that fixes deadlock the other way in the commit message.


-- 
Best regards,
Vladimir

