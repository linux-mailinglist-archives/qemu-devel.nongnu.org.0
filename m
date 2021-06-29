Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C43B700B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:22:45 +0200 (CEST)
Received: from localhost ([::1]:35426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9x6-0007ld-8p
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ly9vO-0006eH-96
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:20:58 -0400
Received: from mail-eopbgr50111.outbound.protection.outlook.com
 ([40.107.5.111]:41198 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ly9vL-0006tA-8R
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:20:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzafXgBhcCw7VSDksKO2RTwHFK/CsLwirrFf+6O3iWBMXY9yOtu5NVGk+1NC7qJofrhDB0javpEdXzfkbrsyRiZTMdYygKor8C/W6FZNyEnWtuJo0s8zd61pNn4V0WIRgsleDOdP2WtMnV0iAvGlPEh9bCX1lxBdSrLBwMWuGbIGyziiQcLDWtC6k9RpXPkAKLe70B8iwEkOqO6ZG5X6YyHgWo2Zo6ElK/Nyt8KPsoJryK2mZHlXdgFPDN9HSSeHjNcjJSqis33sFKc8hDiOLQg+zy00BHJXL59vFRLX/aFxbdGOIxiJIBV4q5H8rVMGjPx+DOirbzP8k6Wyjc3Mnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jvdZ6oV8t66hcoaKoBYcvhCiattkGaukwvEccbg/cA=;
 b=CFyVwQTN6ZgKbuenGHbmorIEjIBbH60ILI3RJzBfescMxOBkWswXfAnarOjfKkArgFyvMQkvj9UedvMJBOAajzZxJQuE70sbSjzGw9WmwwANQKrhK5GVV1hgw/wOtUP0G0IboJEeYI48bSzgjw59XbtAmTZNHt171K4SFJXybpCkdtHB+uPgF27G+Jx9kGKQaZCDgYePlb06zfPPzw/YiyURUxqdQnHf8GSVAFE1fLSzu6Ugz+/Bj6Gh5ibNq6yNQuS6LNfOMejrNi0a6+hJ8aagts4dxsz6lujSmfEsFCc4aiV4BgT2jKPKFkPZaD6qPxohPJ2pE1RUbUXsjl4EZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jvdZ6oV8t66hcoaKoBYcvhCiattkGaukwvEccbg/cA=;
 b=KVusilFFmBsw/WATkNcdugcNSdRBPynfvFTIVWOOyjv6ByPwoPQYHWG2TrBvkbjo3RbqclcglKurVpFId4bERQtpzx7b9dd5r7K4bsTiVjl2cGMXXPXLy/vRI97N/EVa9aeA3kK3JQyz1ZEUdGwkju5aoVnZPFiWwvftby8JeU4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 09:20:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 09:20:52 +0000
Subject: Re: iothread_instance_finalize -> aio_ctx_finalize crash
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel <qemu-devel@nongnu.org>
References: <3b564579-e468-b47d-f608-d683d4a4bf18@virtuozzo.com>
Message-ID: <aa72e210-1cfe-546e-cd03-80ae5559d9ef@virtuozzo.com>
Date: Tue, 29 Jun 2021 12:20:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3b564579-e468-b47d-f608-d683d4a4bf18@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Tue, 29 Jun 2021 09:20:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce500cf5-bc2d-4c46-5592-08d93adf3109
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6946897A4CAD37087C9E6FE3C1029@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vb+cKo4952qu7MeXTMsG7gkg8SKn0hvqZQZQWYwUL4D3i+CN5aupa56OZ02VPr+jHMTEOQk/woAbZ4w8MkvxOPWbXbd79G5FQ2pH7rapyMGLG8YBeEcoXxdNR21cB8IghXMEgJHig5BWDUomTcq1nGvnal8p1ewbQlrH+it6Ro/kEBcXonQFFtaxVW5f8VlZ5d+peLMMt0Yz9TBq3X8IwkTyZGWxbY9qPDfzijzlq2Sm/nweCGEvlYyLUEp7lx7Xrhcq24Edsvtl9A3gaML18MQEngeNbhnLVu25jbcNzia4UDVszU+smLePL6E5ZsT0m7LQA6XfuiP09couSnKQXlpy4jRWJQi4YLMH7tQDqkRmePeNDdNA18pLY6KSe4PZL5EL8nD6KSwhD7qydKCLRhRKLkYp9JvFtcv3cZwhJb6D6Q6XXW6N9OzjW30bg/095dfo8zi+6szanIds91u2Bl2NWYcdZjdBLxrL6VV9Czue/316uYC8wQZJR8P99Mgk0MbFFNFWIS4rl6uDI+Gazz+EUZefG/81Ljmd+gRaGay6aJhm9+JkyI9S+Lyia+w9U92g+HAo2HjzKNDAWGcrMDkeFjZ8oF19jv9a9QwKD9fLm5/alw8nVbYNJtc3TtU2vjJTsamNZTwU8TfFpC3yJHnSZDSud+8/czV51fJkMmoxb/h+VDZNXNhI86rQ+15JDOmjeRREF0orP/MqeQX4hxwWZwVKzQ7IKcnwzTsDqg/W74bMs0tmtFSszEd5Vzi5k8hAPkbVjFoova7MIu21vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39840400004)(346002)(396003)(376002)(36756003)(83380400001)(2906002)(2616005)(956004)(52116002)(31696002)(86362001)(38350700002)(38100700002)(5660300002)(316002)(66476007)(6486002)(66946007)(66556008)(31686004)(8936002)(8676002)(26005)(186003)(16526019)(6916009)(478600001)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXRUZjFYS0ZFS3pmVmtGS3BDekZKOVkyWnVZSnlJeTZnUGVBQXV1TzlmVzN3?=
 =?utf-8?B?NXFUeGhmU3plWXZHcWJCMkF0OEN3enhCWitqQ0Njb0EvRmd6T3ZVdjJFZXVz?=
 =?utf-8?B?OXpPSkVqSXN5RmU1WG9qOVVESFphM2c2VFFRZnB5TXR6bzJMYVJ5UnN6UnRM?=
 =?utf-8?B?NkYyRXJza1VwZ3JOUUpua21PM0EzeTFSZmpGU1dmUUxybnY5RTNDVmRVKzZo?=
 =?utf-8?B?bURKWUFoUis5KzBDTERUMTRselVYdnBDanJ5bTRidVRtblJWRDdBVUhXdC9T?=
 =?utf-8?B?UmVhTmYxRDBWOUVNS2xWc1Z5NVlvQWw4ZUFYV293U2EwM3dwaGFNWS9pN2M2?=
 =?utf-8?B?OHByaXJWRzBjSXM5Yng2WkM1eER2YUluQ25oZ3Nwa1kwTHMzUXlUMmUvSTVI?=
 =?utf-8?B?L202T2pwT1VPY28xVTczZ3ZOSk5vaVNDc05rZkQ4VncrdklnTWlKbTdvTGNo?=
 =?utf-8?B?U3dWL0dtYnpsUExiZ1daVkNjdm0yN1R6akwvR1pxUkN3d3RIQUovdlJocHZM?=
 =?utf-8?B?R0ZuTDU3aTVmVFFpQkRYaGcxSFhnaThROCs1L1c4ZzNld0ErNGlVY1lHcDYx?=
 =?utf-8?B?dFNUK2RyaFFlVDlsbXlhQTVNNVlGWEZQRGNMQnZkaUlIYjRsZkpuVS9pNXgr?=
 =?utf-8?B?K1FRZlBrSDZySEswTGd1YStmeUMxTUxMejVrTi8vejFjTGlyQStndGFCYzJB?=
 =?utf-8?B?ZlZoeEhKZytxL29IOTI3cHROdFlMNXFuYk9KOUQ5ZnV6SGtLSXhaTEdabWgy?=
 =?utf-8?B?Z3k2VVUweWhuSlgvemVzdXF4dkkzVFNraHJBMTkvS2c4SGxWOFZObEdWdEwx?=
 =?utf-8?B?cEdJWkxqSU9RdTRDWmo4bG9qT0MwZTFEUm9kMlpZaEdZeG1OVjF1U09ZNko5?=
 =?utf-8?B?b1JWRng4UlZ2ZEZ4b0VLOXBrNjFlQkl3TjNBWVVwamdiVGpnSUJHLzdueTgx?=
 =?utf-8?B?bGRBNlNLN0FlQTBUMTV6azBVQ0ZZdjBNQmRaQ0UvcVlXVnA2UUJBSWR1TWlh?=
 =?utf-8?B?STkvaXUwZHphVzdXQTByV0RhYThjRmErU0RoeTN1d2hrVkdvRHNtcVlNdUpi?=
 =?utf-8?B?QWpSZHdFdTdFUTQ0RXU0ZUpxZEtjUzVoK0ZyOXRmWWFQVHVka0g0TzE4aUUv?=
 =?utf-8?B?YlBPRW8wa0ZMNHg4a2tmVnlvY29pejllbWcwNHNuMlYwOUpLQnh3RjFUMk9K?=
 =?utf-8?B?TFRZNFZERkFGdHlBZW5CdXFjYmNpZWhKdCtjcnMzQzUyT0ZFS2RUdHJOU0lI?=
 =?utf-8?B?TUppdGdjTm90SmFNeGxjSzlDSHIyMmRaWnhocFJ1OEViY0hKWWdDSkFzem1t?=
 =?utf-8?B?eDdFOUNlOUdaM2dXaEdiMGxOWDJLSmgxOXQ1OEtwUEc2Ym05azg5bVdEZ3hT?=
 =?utf-8?B?RDgybzdaRmVrTkgzbUxSQVYxK0RmeFM0WkV0ai92d01BQWxrWTU1R0ZCV1M3?=
 =?utf-8?B?M3lnU0I4cndJaE5SVFVCa0pDU2RlWW1Md2F4N1M4Z0tzZ0pUSHFzSUlMbFpy?=
 =?utf-8?B?K1FpQ0svUFZsVEVDWkpHSWlZRzdLb2M5WGJmUms1TWloZ0Zqdk1WLzE0Q2FC?=
 =?utf-8?B?QUovaWRJNldHREcrWjcyT3ZSVDNPMkI3S0NuOC81VTNzdm1ocDFFZnlPNkxW?=
 =?utf-8?B?YlZDTXdsVEpkZnV5YW5Pc0ptUXVTaUd3d3Q0TTFCNG45MmVIK2tpRnhIYWIr?=
 =?utf-8?B?Y1FwaWladW5iQWsvOHRDbWpLbnNqMWZXd2RmbWZlbjVkRno2MzVnZ1BOSGw0?=
 =?utf-8?Q?In04vLOCgVze/3DYud1sBFeafUdMpRkk4mtsREa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce500cf5-bc2d-4c46-5592-08d93adf3109
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 09:20:52.5614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y17Jk3KBk4aMjzA5UOpRvUdx2DlmktogAirFbdQIdrvZnk8Df2maVUMl1qgUsnlQ5yyvQ1CGfTu5dyqgdgvUctQDw4WLyy3RvqCx0Atv4sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.5.111;
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

24.06.2021 15:59, Vladimir Sementsov-Ogievskiy wrote:
> Hi!
> 
> Could someone help me with the following please?
> 
> We have a crash in v5.2.0-based downstream branch. I don't have a realiable reproduce, neither can find significant differencies with upstream code in touched functions.
> 
> #0  0x00007fc2a8dbfe7f in raise () from /lib64/libc.so.6
> #1  0x00007fc2a8daa8b5 in abort () from /lib64/libc.so.6
> #2  0x00007fc2a8daa789 in __assert_fail_base.cold.0 () from /lib64/libc.so.6
> #3  0x00007fc2a8db8576 in __assert_fail () from /lib64/libc.so.6
> #4  0x000055fc1d76e195 in aio_ctx_finalize (source=<optimized out>) at ../util/async.c:343
> #5  aio_ctx_finalize (source=0x55fc1f9cebf0) at ../util/async.c:311
> #6  0x00007fc2aa335789 in g_source_unref_internal () from /lib64/libglib-2.0.so.0
> #7  0x00007fc2aa335a0e in g_source_iter_next () from /lib64/libglib-2.0.so.0
> #8  0x00007fc2aa336b35 in g_main_context_unref () from /lib64/libglib-2.0.so.0
> #9  0x00007fc2aa338d9c in g_main_loop_unref () from /lib64/libglib-2.0.so.0
> #10 0x000055fc1d666094 in iothread_instance_finalize (obj=<optimized out>) at ../iothread.c:145
> #11 0x000055fc1d644e19 in object_deinit (type=0x55fc1f7db490, obj=<optimized out>) at ../qom/object.c:671
> #12 object_finalize (data=0x55fc1f88da00) at ../qom/object.c:685
> #13 object_unref (objptr=0x55fc1f88da00) at ../qom/object.c:1183
> #14 0x000055fc1d643365 in object_property_del_child (obj=0x55fc1f9a80e0, child=0x55fc1f88da00) at ../qom/object.c:645
> #15 0x000055fc1d644618 in object_unparent (obj=<optimized out>) at ../qom/object.c:664
> #16 0x000055fc1d6661d9 in iothread_destroy (iothread=<optimized out>) at ../iothread.c:369
> #17 0x000055fc1d6ec5d9 in monitor_cleanup () at ../monitor/monitor.c:670
> #18 0x000055fc1d63584b in qemu_cleanup () at ../softmmu/vl.c:4562
> #19 0x000055fc1d374307 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:51
> 
> 
> (gdb) fr 10
> #10 0x000055fc1d666094 in iothread_instance_finalize (obj=<optimized out>) at ../iothread.c:145
> 145             g_main_loop_unref(iothread->main_loop);
> (gdb) list
> 140             iothread->ctx = NULL;
> 141         }
> 142         if (iothread->worker_context) {
> 143             g_main_context_unref(iothread->worker_context);
> 144             iothread->worker_context = NULL;
> 145             g_main_loop_unref(iothread->main_loop);
> 146             iothread->main_loop = NULL;
> 147         }
> 148         qemu_sem_destroy(&iothread->init_done_sem);
> 149     }
> (gdb) p iothread
> $24 = (IOThread *) 0x55fc1f88da00
> (gdb) p mon_iothread
> $25 = (IOThread *) 0x55fc1f88da00
> (gdb) p *mon_iothread
> $26 = {parent_obj = {class = 0x55fc1f92b4e0, free = 0x7fc2aa33e3a0 <g_free>, properties = 0x55fc1f9ad980, ref = 0, parent = 0x0}, thread = {thread = 140473870030592}, ctx = 0x0, run_gcontext = true,
>    worker_context = 0x0, main_loop = 0x55fc1f9a8300, init_done_sem = {lock = {__data = {__lock = 0, __count = 0, __owner = 0, __nusers = 0, __kind = 0, __spins = 0, __elision = 0, __list = {__prev = 0x0,
>            __next = 0x0}}, __size = '\000' <repeats 39 times>, __align = 0}, cond = {__data = {{__wseq = 3, __wseq32 = {__low = 3, __high = 0}}, {__g1_start = 1, __g1_start32 = {__low = 1, __high = 0}},
>          __g_refs = {0, 0}, __g_size = {0, 0}, __g1_orig_size = 4, __wrefs = 0, __g_signals = {0, 0}},
>        __size = "\003\000\000\000\000\000\000\000\001", '\000' <repeats 23 times>, "\004", '\000' <repeats 14 times>, __align = 3}, count = 0, initialized = true}, stopping = true, running = false,
>    thread_id = 10141, poll_max_ns = 32768, poll_grow = 0, poll_shrink = 0}
> (gdb) info thr
>    Id   Target Id                         Frame
> * 1    Thread 0x7fc2a4a19f00 (LWP 10134) 0x000055fc1d666094 in iothread_instance_finalize (obj=<optimized out>) at ../iothread.c:145
>    2    Thread 0x7fc2a4a16700 (LWP 10136) 0x00007fc2a8e8002d in syscall () from /lib64/libc.so.6
>    3    Thread 0x7fc29e9f8700 (LWP 10143) 0x00007fc2a8f5e65c in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
>    4    Thread 0x7fc29e1f7700 (LWP 10144) 0x00007fc2a8f5e65c in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
>    5    Thread 0x7fc2027ff700 (LWP 10147) 0x00007fc2a8f5e65c in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
>    6    Thread 0x7fc29ffff700 (LWP 10137) 0x00007fc2a8f5e9aa in pthread_cond_timedwait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
>    7    Thread 0x7fc20301a700 (LWP 10146) 0x00007fc2a8e7a541 in poll () from /lib64/libc.so.6
> 
> 
> So, it's about mon_iothread, and it's already finished to the moment of the crash (this seems correct as earlier in iothread_instance_finalize() there is iothread_stop() which does qemu_thread_join())
> 
> 
> Now, what crashed:
> 
> (gdb) fr 4
> #4  0x000055fc1d76e195 in aio_ctx_finalize (source=<optimized out>) at ../util/async.c:343
> 343             assert(flags & BH_DELETED);
> (gdb) list
> 338         /* There must be no aio_bh_poll() calls going on */
> 339         assert(QSIMPLEQ_EMPTY(&ctx->bh_slice_list));
> 340
> 341         while ((bh = aio_bh_dequeue(&ctx->bh_list, &flags))) {
> 342             /* qemu_bh_delete() must have been called on BHs in this AioContext */
> 343             assert(flags & BH_DELETED);
> 344
> 345             g_free(bh);
> 346         }
> 347
> (gdb) p flags
> $1 = 11
> (gdb) # BH_ONESHOT | BH_SCHEDULED | BH_PENDING
> 
> 
> 
> So, there is unfinished BH in the context when thread is already finished..
> 
> Does iothread has own aio context or it may use qemu_aio_context?
> 
> 
> Looking at iothread_run(), I can't understand, what prevent creating bh after iothread finish?
> 
> So, what prevents such situation:
> 
> 1. iothread->running set to true, so we leave while loop in iothread_run
> 2. exactly after it (from some other thread) we schedule a bh into aio context of the finished iothread..
> 
> 


Answering myself:

To fix that, take Kevin's series "[PATCH 0/2] monitor: Shutdown fixes", commits in master:

c81219a7dd36a815bd   monitor: Fix assertion failure on shutdown
b248e61652e20c3353   monitor/qmp: Stop processing requests when shutdown is requested


-- 
Best regards,
Vladimir

