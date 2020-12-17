Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB32DD18A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:36:01 +0100 (CET)
Received: from localhost ([::1]:57628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsVk-0002TE-Qn
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpsRW-0008Lm-KH; Thu, 17 Dec 2020 07:31:38 -0500
Received: from mail-am6eur05on2103.outbound.protection.outlook.com
 ([40.107.22.103]:40672 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpsRS-0008Hw-II; Thu, 17 Dec 2020 07:31:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGTgfwADh0tqBcSmZwUS5bO7yupVX+oDwgVxR5yBlG9+PvscGPWjC3h0Y7XN5PQnnT1Qp5RJgDQg8t3Sv8SzdrQNKYeQfCh7PK0Uz2CjK+CMsIZmZ7Rp/KD3F1MXAH9/Q3wCIAxFsrsMN/FjXMLRAWaVFuAFglHhZ4vlWPnxQOVr2ZhcE8ISsEhS5Ep22O+/cyIQKUPtMqjn8nc9TtHrW6wsnL4eVVRUHn9F4jRRhKgu6sJ0RFnCiffI0OO5hjQ29jYJam2DdngP0LAts++f1Xtadu14A4UA0XgoqEmGL/HzhpteVTuYT3qqkA/CplwDwkBQXp9C/CVmiNfr9emY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgfnhvsHdDRWEisntm7/av+ZDm7Sh8jJKEKzppf3gq0=;
 b=StuX3LH1pDwcWLDWlZbEfPr31W1jVhBwx9a0posvnR2W5kK52lAoYfL7LYlXkebdBk61Uaa2yoSUsZvDzii0MhFxt2vyITNhJPDlMNxljRNkmsm74xXoeGGELjyOm/qzavfzl/uNS4x2Xp+WmlQE0quSoC3F/a8mRXbGARldLdxb9Vqoz5px1j7W4nr9W2sXkVL9Sig0TM7XDbDwIeB5I/N/2lDhxJBv6qjBEq/4yaZJUHNrPMJinhyqpY90qf/1pRziXEg6iQ+St94RZyd7BaRRmHW5FY3Oyem2yJ3FnYfkG5B20oax7r8Wt4qff2Hugf9WnX4gpgRoNCtH0/bR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgfnhvsHdDRWEisntm7/av+ZDm7Sh8jJKEKzppf3gq0=;
 b=YzCQDJwZy4uoHXu1LkcFaiRRt0YalRdOPA1NlwT9FGfFDrKBDaA7DKraTmin4A8rwbzgdUrc2VQVfyHEnXcEbRYMZxbVQCv8Aq0WDaUsQoRU4ue3FEA4QwUiB0wCEgR5EZQCPgWkSruEAfDrOGVH8j8tvc8qXdyoGWqR+K0RgUs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1906.eurprd08.prod.outlook.com (2603:10a6:203:48::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.21; Thu, 17 Dec
 2020 12:16:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 12:16:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu block <qemu-block@nongnu.org>
Subject: aio-poll dead-lock
Message-ID: <cc1d5eea-5a7a-5d78-5dbe-b10695078c11@virtuozzo.com>
Date: Thu, 17 Dec 2020 15:16:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0110.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::7) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR02CA0110.eurprd02.prod.outlook.com (2603:10a6:20b:28c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 12:16:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9714ac6-1c1f-4d60-79ad-08d8a2859523
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1906:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB190668910AF9AA4BD8952DB9C1C40@AM5PR0801MB1906.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u9DuTKZarFBc2dvZgjiPn9SlwUEAXO4CsrTuRRcNi4PUYEURkVB3RCuK6T2IS/k/gLxaiLo5NXtNwAO43r0wcG2/EEDkdrJhVADjRDd6ct4ferYiHty4vuJRBtIo8XdRi+DSflvri0Tp43tB1+IcCFTL8X6oUSIkIBbDos0OV4SiI9MylFk+j9kNHmOJpwQzwOwCEbVvu6/WKkX0swXqfYZ3LtLnfDpT9+23xdHCVGCGk9lf26CzkhQCcsh3VF964fbWeiAo5Z1npIcMEvL3PSHFpts7c+jGDW708ZLsYAAFKNy/a8JfZYYNrX3jV17ZSmuyqULbdjiNzcf7zx8Lr2l1dYLWhQKNBjJFWlZcZaPpCfASmkul5xQe1D4EkI80wb6iKdf2mFUbBOq1TmE7KFCHrLkMGdO146vKJeFAv9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(136003)(39840400004)(366004)(26005)(66946007)(54906003)(31686004)(8936002)(5660300002)(2906002)(4326008)(66476007)(478600001)(16576012)(16526019)(316002)(52116002)(83380400001)(8676002)(36756003)(956004)(6486002)(186003)(31696002)(86362001)(2616005)(6916009)(3480700007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0NMVERjbGRSOVYwWUl2ZWVvWGFUTXpkdGtTN1B3L3FFRHU2ZVFuN1dPdUEz?=
 =?utf-8?B?Unhwa296Tm5qV2ZVVjlvbWRZTXRPSTRhMzlKYmNVUnpoVlluL3M4YWpUYUVs?=
 =?utf-8?B?QmRUQkZDZHd5eVFtcXRoVzFRRFhZYmZ5Z2xPZEVpMldNYzBXb3E5cFVUQWFw?=
 =?utf-8?B?OEZ0aUxPM2ozeXo3THJaRXArRDBzbEE1akN4M2FlaUJjYmg5VmVoZjZVS2pB?=
 =?utf-8?B?eG1nYXN0Q3VNaWFWcFNiNXg1ZGpZL0lBQ2tzOFRtb1ZpQlNOVWRHcW9VUkYw?=
 =?utf-8?B?ZjFNQWtjNlZFOVR4d2tzWGFadm5nK2NSbmxtTGE2Q1FuYTZscjZyWGZ5bEVr?=
 =?utf-8?B?YzBwRTlNWFZZUlhScnlMcm80Qm5VVi9KT2M4bzBhTGRjU3NxRU5KY1Nha0VP?=
 =?utf-8?B?eHBKdllIa1NPSFlvQ1RMZU1qNnluTVM2WHg4V0kwVU0zbDdIcUNEMkROa2w3?=
 =?utf-8?B?ZTlWZU9ubU1RN0FDMlJDWThDRmdsUE1TYW05cXBkOUFFVTRHWmh2a09WR1JG?=
 =?utf-8?B?NHlZUFIwdE1jZzhYMkVxTEQ3NHc0VFY4RDZobG1hdWZUMlFqcmRLeTIydHNE?=
 =?utf-8?B?VVRVMlo3SmRpUXY5ZG83NjBXQkZHZU5vZWtLWHBjZ2I1Y2JsUlgyd08wNUsx?=
 =?utf-8?B?MTVScHZRc2V5d3huSnNSbS9vcks5OFh1MmZIRUxFaVlyMWlSTWZ5NnJEN0V5?=
 =?utf-8?B?SHF5N2lOSjdiV3A3MVhaY2tsQWxLazR3TVJpenc3b01WMVZucExkUFJ0ZXhk?=
 =?utf-8?B?UTl5Y1N2cmllUnNSbVAyNVVEelNwaHVQUm9wNkVMTXYvbi9XZFhJbXFYejlx?=
 =?utf-8?B?dUU0Y1JUY3RVdi83WCtNYTk2L0VnRklnZzJrRlNIS3ErL1VrUXJGR1RtY01X?=
 =?utf-8?B?c25JK2ptdXZiNFFnV0R0V2h5SFVvMkFjbm82RW41TzhKaGYxajZ1ZnhtelRq?=
 =?utf-8?B?bzliTlJwZFZDU0xJSkg4TXQzL0hiZDVJaTFhd2VNK0NCMHppbXBPTFJZOFNF?=
 =?utf-8?B?U1VUR3dqT3FSaG15K0ljYkFnam4zdGU3V0pNcE9aTHpybll4QmgrVDVaMDlW?=
 =?utf-8?B?ZG1NTHNCOFNYZjZvVFJUVWRzdG5nblU3UFViSTBXVUxPS0ZaanBZb2R4bEll?=
 =?utf-8?B?ZCtRbFF6UHBiTGIwVzE4MWhsZGY4R1dMZlFoZnU2QmpLSDQ0R2V5NjkrMnJL?=
 =?utf-8?B?c0U3ejFuQ21FZU1PTGE4dHRMdkFBM1pYZGd4UVFHTE43RVlMWXhKcU9tZGdr?=
 =?utf-8?B?QjlhTkNZdHdDU01mS0t1NmdTSzhERjY3NkxqNTRNMlgwMnJzS3d0K3FobWZQ?=
 =?utf-8?Q?LELkM+COqyB6joBt33cYHsY8NN1rJGw7Td?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 12:16:28.8340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f9714ac6-1c1f-4d60-79ad-08d8a2859523
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4ggRf9KFj6tJJP8qybbZNyPSL+8XmwJrYU/h7A25vM5qTX1J1Is+oyhgy+4l4nGxKOum3AXJZe9t+VcR+/c5IfkqoE0BQhxpucg6nA5GbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1906
Received-SPF: pass client-ip=40.107.22.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I don't think that it's something new, but just to keep it in mind:

blk_prw do polling with increased in-flight counter.

So, if some bh wants to do drain, we definitely dead-lock in a nested aio_poll loop.

Here is a backtrace (comes from Virtuozzo branch, so I don't have reproducer for master, but probably I'll return to this later):

#0  0x00007f895d751b56 in ppoll () at /lib64/libc.so.6
#1  0x0000558f664e371c in qemu_poll_ns (fds=0x558f6778e630, nfds=1, timeout=-1) at util/qemu-timer.c:335
#2  0x0000558f664bf5a5 in fdmon_poll_wait (ctx=0x558f67769480, ready_list=0x7ffe3d6be730, timeout=-1) at util/fdmon-poll.c:79
#3  0x0000558f664beed3 in aio_poll (ctx=0x558f67769480, blocking=true) at util/aio-posix.c:600
#4  0x0000558f663e8f82 in bdrv_do_drained_begin (bs=0x558f6855bcc0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:435
#5  0x0000558f663e9067 in bdrv_drained_begin (bs=0x558f6855bcc0) at block/io.c:441
#6  0x0000558f66411df3 in bdrv_backup_top_drop (bs=0x558f6855bcc0) at block/backup-top.c:296
#7  0x0000558f6640a0de in backup_clean (job=0x558f6814f130) at block/backup.c:109
#8  0x0000558f66372019 in job_clean (job=0x558f6814f130) at job.c:678
#9  0x0000558f66372094 in job_finalize_single (job=0x558f6814f130) at job.c:694
#10 0x0000558f66370c41 in job_txn_apply (job=0x558f6814f130, fn=0x558f6637201c <job_finalize_single>) at job.c:158
#11 0x0000558f6637243b in job_do_finalize (job=0x558f6814f130) at job.c:803
#12 0x0000558f663725d8 in job_completed_txn_success (job=0x558f6814f130) at job.c:853
#13 0x0000558f66372678 in job_completed (job=0x558f6814f130) at job.c:866
#14 0x0000558f663726cb in job_exit (opaque=0x558f6814f130) at job.c:886
#15 0x0000558f664d48eb in aio_bh_call (bh=0x558f683ee370) at util/async.c:136
#16 0x0000558f664d49f5 in aio_bh_poll (ctx=0x558f67769480) at util/async.c:164
#17 0x0000558f664bf0c6 in aio_poll (ctx=0x558f67769480, blocking=true) at util/aio-posix.c:650
#18 0x0000558f663d357a in blk_prw (blk=0x558f677804d0, offset=0, buf=0x558f67f34000 '\253' <repeats 200 times>..., bytes=65536, co_entry=0x558f663d339f <blk_write_entry>, flags=0) at block/block-backend.c:1336
#19 0x0000558f663d3be3 in blk_pwrite (blk=0x558f677804d0, offset=0, buf=0x558f67f34000, count=65536, flags=0) at block/block-backend.c:1502
#20 0x0000558f66374355 in do_pwrite (blk=0x558f677804d0, buf=0x558f67f34000 '\253' <repeats 200 times>..., offset=0, bytes=65536, flags=0, total=0x7ffe3d6bec38) at qemu-io-cmds.c:551
#21 0x0000558f6637566a in write_f (blk=0x558f677804d0, argc=4, argv=0x558f685600d0) at qemu-io-cmds.c:1192
#22 0x0000558f66373244 in command (blk=0x558f677804d0, ct=0x558f67544a58, argc=4, argv=0x558f685600d0) at qemu-io-cmds.c:118
#23 0x0000558f66377d80 in qemuio_command (blk=0x558f677804d0, cmd=0x558f67ff0ee0 "write -P0xab 0 64k") at qemu-io-cmds.c:2465
#24 0x0000558f6608badd in hmp_qemu_io (mon=0x7ffe3d6bee50, qdict=0x558f68125010) at block/monitor/block-hmp-cmds.c:628
#25 0x0000558f662c76b2 in handle_hmp_command (mon=0x7ffe3d6bee50, cmdline=0x7f8948007688 "drive0 \"write -P0xab 0 64k\"") at monitor/hmp.c:1082
#26 0x0000558f65fb12c6 in qmp_human_monitor_command (command_line=0x7f8948007680 "qemu-io drive0 \"write -P0xab 0 64k\"", has_cpu_index=false, cpu_index=0, errp=0x7ffe3d6bef58)
     at /work/src/qemu/vz-8.0/monitor/misc.c:141
#27 0x0000558f662facb1 in qmp_marshal_human_monitor_command (args=0x7f8948007930, ret=0x7ffe3d6befe0, errp=0x7ffe3d6befd8) at qapi/qapi-commands-misc.c:653
#28 0x0000558f66468ff9 in qmp_dispatch (cmds=0x558f66a9bd10 <qmp_commands>, request=0x7f8948005600, allow_oob=false) at qapi/qmp-dispatch.c:155
#29 0x0000558f662c416c in monitor_qmp_dispatch (mon=0x558f67790ab0, req=0x7f8948005600) at monitor/qmp.c:145
#30 0x0000558f662c451b in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
#31 0x0000558f664d48eb in aio_bh_call (bh=0x558f67594bb0) at util/async.c:136
#32 0x0000558f664d49f5 in aio_bh_poll (ctx=0x558f675945f0) at util/async.c:164
#33 0x0000558f664be7ca in aio_dispatch (ctx=0x558f675945f0) at util/aio-posix.c:380
#34 0x0000558f664d4e26 in aio_ctx_dispatch (source=0x558f675945f0, callback=0x0, user_data=0x0) at util/async.c:306
#35 0x00007f895f6bf570 in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#36 0x0000558f664dcd13 in glib_pollfds_poll () at util/main-loop.c:217
#37 0x0000558f664dcd8d in os_host_main_loop_wait (timeout=985763000) at util/main-loop.c:240
#38 0x0000558f664dce92 in main_loop_wait (nonblocking=0) at util/main-loop.c:516
#39 0x0000558f65fcfe66 in qemu_main_loop () at /work/src/qemu/vz-8.0/softmmu/vl.c:1676
#40 0x0000558f664625e4 in main (argc=20, argv=0x7ffe3d6bf468, envp=0x7ffe3d6bf510) at /work/src/qemu/vz-8.0/softmmu/main.c:49

As far as I know, the only way to figth with this thing is moving things to coroutine. So, I think, moving backup_clean to coroutine is a necessary thing.

Any thoughts?

-- 
Best regards,
Vladimir

