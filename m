Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176EB38E8E3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:42:55 +0200 (CEST)
Received: from localhost ([::1]:39108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBnB-0007fE-Ua
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBlU-00064x-7g; Mon, 24 May 2021 10:41:08 -0400
Received: from mail-eopbgr00092.outbound.protection.outlook.com
 ([40.107.0.92]:17990 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBlL-0002HB-TU; Mon, 24 May 2021 10:41:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ae2ANnCUgAZKNLAnVfgAwoqDnay+ADVNO58lim7WPrQZ6KJajZ4QBx9gKK0y/IyzBbV00aEaTYEjNF04hEbuIk0KoK5w9Jf7XViHfI0Oottqsdyfct6QqTsKaDWUr8t5YS4LNSDVx2423Rlc4FTVIYF3cc+EhKIewAAX82eRE9D1fGN/cwFMiC+19a5RpacIaAYhLiXcdWx68iGeWy3t1d5BIRjVzpyUpPzf4wgLEs3ItAb85T3TJmcnSQ9L6MC/46MUE4qbio9j1IrdvwaSMjqNNL/Y8BrtdQOrFU30/XzugN+9K+A10GuQfq7lj+r8SgyfRgIC7mowdzIls56q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC7YgAqZidyZOZpk4tYvvrWxnDv7SrLIkkMi7zrBOzw=;
 b=SuNEcGFnde8rFnxZ7NTqEMCPgUmmnos8ZqJ3qAXjgPl8GYBbEfIofcuijmvxwZVqSQEJZwnjHZ4sDCKNf8H5F7ghRwaxO9ymD8qCdDiLPor8lRqrS1txu5X3V9Psa3rKt7CrN8ORPOhvctOhwvFoB+yGrM1tmpUA+Ot2MZs8Lce1e4gT/4sXsCX+h7UqBQbdUOdgM140uJwBqQtTYyCYH2aQMzwmEs3RuAqv1eYUhyNKfib+N0TLoXTVnra4htUFUMBk03QnXMgn2lGgnCGceQbO11qZgVtvOtg+L/8hzk/6wQZC8GxS2WkcoD/walMXGuA6gUBo+BGuTYwhVjFaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC7YgAqZidyZOZpk4tYvvrWxnDv7SrLIkkMi7zrBOzw=;
 b=DqIFMSZzpHmWSsIfegAjKewSISBzKT6BQVvez8XoeqXuopVyZAIk1VspzRYlrC7ruPY51QTPlUvOQuLr/BJG7ghVvv0sOCi4DmzNH8kTfwb0aNdPRhRXFXuYznrpJyRZQbdNbltVlQPesbQM5mLOf/M6q9e2VykFT1Ft7HPf9+U=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5127.eurprd08.prod.outlook.com (2603:10a6:20b:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:40:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:40:55 +0000
Subject: Re: [PATCH RFC] docs: document file-posix locking protocol
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 eblake@redhat.com, den@openvz.org, Kirill Tkhai <ktkhai@virtuozzo.com>
References: <20210322182738.60395-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <69357fc0-7c67-ace5-867b-135b6abc69bd@virtuozzo.com>
Date: Mon, 24 May 2021 17:40:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210322182738.60395-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Mon, 24 May 2021 14:40:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66427ab5-a163-42f1-88cc-08d91ec1f03e
X-MS-TrafficTypeDiagnostic: AM6PR08MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB512738BAA1CB2B9F3CE93561C1269@AM6PR08MB5127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SpHkEfIgE/lDILP+l3pJa0Te67GAP8pWU+CpMPM54A416AjjUtJW1yFukH2lbgcQPoRG3cPBNdjxGZgpvI5YOk2P6l3YPQ7ayODC9VlRPchKkPPHEC5yqI4w+kSNPnGdL/zD3aqR2EuYo+DUmqSYlvpB4016UVqHfHecV0+lEzBYGsCuZdsI9F2+bLLSB7QN2lgOuPMoclON5fqwlqht6NZmMb/LEO13YEXtwYlUQdllUu6ZP91ERRiModijQGGjsWIiUeQJExtN+fut1OrCqLaO1ARR9xHY7KKqoKcdU6etn8wqbfQo63CnQ4WY/W821Iv2qkuT7e/4KVKToZc1VGm9MZqqZ9vIqnIewzp7jKmjdXCHuB+U9Jhz2Y7vMw+2GxT9JUOVdKuVdomloGisrm1+H52ZEd8f1yqQtdLnAr9fbz4mThpIdZ+tfVhGJnKuzl8i+pJl1wKPEr68sMkqh9a2uOWJmgFW6PyI9x55NUy2YzuNg0W2Fd360B4Drh027eUOvTueh/TZ+lyOdbWPi2wnzQNvTlASN7JR3WAyHcOzB6bCD88eu6xoBsWFKedNeSEtFk73jqGpJ0CoIBs1IZRjARKfxJtRGKR++V4Xl0TSMBylRhIWUaBAUHEg8Bbf4ipq0k8k5EbWW/FmVcyDTPI0XscTZCJGUk0LQWMc3EWeVoslBKlZvLj1IskFwjDrZwJJ6fhYNSm3E3kKpGKbWEfnvf7emf3JIzl5ZC37uuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(136003)(366004)(346002)(8676002)(36756003)(26005)(5660300002)(52116002)(478600001)(316002)(4326008)(16576012)(38350700002)(38100700002)(2906002)(6916009)(6486002)(66476007)(66946007)(8936002)(107886003)(31696002)(186003)(86362001)(16526019)(66556008)(956004)(31686004)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bEN1ODJTWFVWMTM4UjBkcnk3OG81a3RETG1vclpSM0VUOUNYZm8wTTlCUmhQ?=
 =?utf-8?B?bWZFSTQzRzk0c1hDUWJBV05WaVlMSHFmdzluVWxaRFg5Qkg1NDBmeDI3cmVp?=
 =?utf-8?B?dmtkaGI1em9sZUd4TWd2QU9SZm5PR0E2UUVUcHNGL0Ivb0FPMFc2Y0ZlZ2VL?=
 =?utf-8?B?aStGL2hUampsMFdGZjU2SG5mUUJIbjB2S2dFdTU3UGJuNkpzME8wSEROOHBL?=
 =?utf-8?B?cWxNazh2a2ZkNFdGMTh3L3crTjdGbnlJbG5GU1o1UnVRS2hJTVJkSWlzTlVY?=
 =?utf-8?B?bWoxZ3RMankzUUxrRlMvUFR0RWRaaTBTdmhoRTE0WlRLcitRK3B5dFNabitV?=
 =?utf-8?B?YkwwbU5XVWhQWFlHeXJxS24rRWpyTFJlSUpDVnZ1OUZDU1d1dFpCQStvOGRM?=
 =?utf-8?B?d1FpVnBtNnNpRnF5d1B1dTVNY0kvaHFvU0p6d0JCNFRrYWZsVTFxWi9BT21M?=
 =?utf-8?B?ejVlZWNCRXovNTVFUmpldnhSQ0V2dCtPajkzeGxSQlRFTlBUMEtSazUrYW9Y?=
 =?utf-8?B?ZEZvcFJvZG1nK3dMdjUwaHExbkRGRzMzY3dQK08yaHUrSjd2dU1FM05UN21W?=
 =?utf-8?B?MHJxaUhmcXZXcDYrS2JtMWZuUnM3bDhGdkYyOGN4dkowM05HLzgwaGMvb1lu?=
 =?utf-8?B?bHVydnUwMXIxbHlvUHlsQVpsL3J5dUN3dlQySmc3N2VjY05HZ1o0VVc5WUkx?=
 =?utf-8?B?VFBuNnhKK3BnRjl3dUxSSkoxQ0dBU2F2M2Z0TURUV1l3SmdVR1lzYkUxNVFh?=
 =?utf-8?B?c2VqK052Umx6Rm0vSUNuNkFxbW16NVQwYi9OSGhSNEk4TnhKNTE1cGkwK1ZB?=
 =?utf-8?B?SURvcWNZaVB2bGNXVkdGV1lzcmV6Qi82ckZ1R25wcFFjOCtoYVc2Vlp2aXhy?=
 =?utf-8?B?RnNLNFhmSlo0RjE2UGVxRWNycGU2OEVzdTQ2MzBVaU5BVzlwcDhvVEFUM05s?=
 =?utf-8?B?K2dsSjVUQnp6VU0wMG9RdU03NjRwanB4bDhhSkc4SVJuWitSUkR3ODVQN2hR?=
 =?utf-8?B?WHI5Z1h6U0ZqdWpSdzZVTVczV2RBdS9BNVRCWllpYmVGekUyU2syZ1FjZlJQ?=
 =?utf-8?B?VE5YQkR3RTNQMS84RDZFSHpOZ1ZaLzdqSUt6eFFhZWNDeFhwb0VaRFBXMjhj?=
 =?utf-8?B?aWl6dVVNRlgvVVV3dVZjQ1BUMnJpWTdxa2NtSEVGT2g3c1VONWRYMnJoNGV3?=
 =?utf-8?B?cEQrWGp0aHloS245ZG43ZXk4YmhEd2VmV3B0MTFXcFozOGhUTHgwZnZZam9t?=
 =?utf-8?B?QnBzSWI1Y2hnR1dwbGxSM2hrdW5oMzBDS3Z1RHRneGxiZFFLNE1ka0FxZmhG?=
 =?utf-8?B?eUFOOHMveG52OXVpbEFWNXI4bTZQQ3FXenVpRnZwVEZhc0VTVXdZTEFxNUZR?=
 =?utf-8?B?dHRwRHE3Y21KbHFuN1RDUXBEU2pEdnJXM0JkV0d1clp5RDZ2MjVRNklDMVJj?=
 =?utf-8?B?ano2TW1hc0Z3cnk2Wis5bFJCV2Q3ZTdob1RBaU5PQzJMS3hKZ2h5Mlp2M1R5?=
 =?utf-8?B?TUMzZ3Z5dDZvbHZXMDhSUDNCUWZ4d1c1QUtoQ1hHKzRwWEdPRHllWkFQSkJO?=
 =?utf-8?B?ZmFTaU0zYlpzMnpPd0M4OU05VEpNUW1wNWxxYzBUZnkwdXdLZDBrcitwdDFv?=
 =?utf-8?B?QlVvRkRjSHdxUk15ay81alZMa2M3cUpMKzZIYlIxR0xFcEZCRHYzM2syZEJV?=
 =?utf-8?B?SjZBZ01Wc0xpQ0lISHZYZHF2ZDQ4TVE4WHdtWHNLUzVBeVhOdkVZV0NpRDcx?=
 =?utf-8?Q?coRB5Iw06DfY8ejtS2wwFfRirv/+cfMf96aaj3Z?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66427ab5-a163-42f1-88cc-08d91ec1f03e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:40:55.8743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omhgMxno5xdL4S2mitpBbYG4jTTBGwvlDzm2g0w48W8Qv+uP653y260FFUj5175G7cgAFbgsRCyJtcweZInk/RYRmzet7OrT6wPKy5cEZEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5127
Received-SPF: pass client-ip=40.107.0.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

Ping.

We need to synchronize access to qcow2 images between Qemu and our internal program. For this solution to be reliable, the locking protocol should be documented at least..

22.03.2021 21:27, Vladimir Sementsov-Ogievskiy wrote:
> Let's document how we use file locks in file-posix driver, to allow
> external programs to "communicate" in this way with Qemu.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi all!
> 
> We need to access disk images from non-Qemu code and coordinate with
> Qemu utilities which may use same image. So, we want to support Qemu
> file locking in the external code.
> 
> So, here is a patch to document how Qemu locking works, and make this
> thing "public".
> 
> This is an RFC, because I'm unsure how should we actually document
> different operations we have.
> 
> For example greaph-mod is a strange thing, I think we should get rid
> of it at all.. And at least, no sense in locking corresponding byte in a
> raw file.
> 
> The other thing is write-unchanged.. What it means when we consider a
> raw file opened in several processes? Probably we don't need it too..
> 
>   docs/system/qemu-block-drivers.rst.inc | 55 ++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index b052a6d14e..3cd708b3dc 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -952,3 +952,58 @@ on host and see if there are locks held by the QEMU process on the image file.
>   More than one byte could be locked by the QEMU instance, each byte of which
>   reflects a particular permission that is acquired or protected by the running
>   block driver.
> +
> +Image locking protocol
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +QEMU holds rd locks and never rw locks. Instead, GETLK fcntl is used with F_WRLCK
> +to handle permissions as described below.
> +QEMU process may rd-lock the following bytes of the image with corresponding
> +meaning:
> +
> +Permission bytes. If permission byte is rd-locked, it means that some process
> +uses corresponding permission on that file.
> +
> +Byte    Operation
> +100     read
> +          Lock holder can read
> +101     write
> +          Lock holder can write
> +102     write-unchanged
> +          Lock holder can write same data
> +103     resize
> +          Lock holder can resize the file
> +104     graph-mod
> +          Undefined. QEMU sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Unshare bytes. If permission byte is rd-locked, it means that some process
> +does not allow the others use corresponding options on that file.
> +
> +Byte    Operation
> +200     read
> +          Lock holder don't allow read operation to other processes.
> +201     write
> +          Lock holder don't allow write operation to other processes.
> +202     write-unchanged
> +          Lock holder don't allow write-unchanged operation to other processes.
> +203     resize
> +          Lock holder don't allow resizing the file by other processes.
> +204     graph-mod
> +          Undefined. QEMU sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Handling the permissions works as follows: assume we want to open the file to do
> +some operations and in the same time want to disallow some operation to other
> +processes. So, we want to lock some of the bytes described above. We operate as
> +follows:
> +
> +1. rd-lock all needed bytes, both "permission" bytes and "unshare" bytes.
> +
> +2. For each "unshare" byte we rd-locked, do GETLK that "tries" to wr-lock
> +corresponding "permission" byte. So, we check is there any other process that
> +uses the permission we want to unshare. If it exists we fail.
> +
> +3. For each "permission" byte we rd-locked, do GETLK that "tries" to wr-lock
> +corresponding "unshare" byte. So, we check is there any other process that
> +unshares the permission we want to have. If it exists we fail.
> 


-- 
Best regards,
Vladimir

