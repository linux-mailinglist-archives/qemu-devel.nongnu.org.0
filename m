Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944172FEB48
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:15:04 +0100 (CET)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Znj-0002yp-J8
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2ZlL-00021T-5s
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:12:35 -0500
Received: from mail-eopbgr30136.outbound.protection.outlook.com
 ([40.107.3.136]:18407 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2ZlH-0004rI-Oz
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:12:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c++rmS30gvzPXjaZQV9U5pp8D3UV3+0yZYehDdoJaORsfe3btyhzrktFGEUu7RxhwxhUwfH604rDKIn1lNrylPe4bwe/+pEsA4a6HxhutGnpP1u1wiqMSmopVzdZCx0T+SjGjEtZVCDAmND1YuiFqBlab1N9XuG799luC7+Ykpv13+beipC8EQMmnriZMzrkTitpxvuGrqVTAxFXPoH5VB4RGEMNNS4/l9V1ydQ3wtDdxrQo/xOBtt/Ktz0rRHYNgKo4VQVHvH8vYH66eeNArQ+3fRVdiygGa0hVfijyaYMA5quUNYpUBKmim1MAhE+j2QlQ5xVsk8ueXY10s4OPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVJgXEb1KTJW36w4X44IXP9B8s+OjrNMCo6ELwB1Kik=;
 b=FWAdwJQ92lsyaSZqZda8QR/5cETknVAm9UDuk7AemyQ+TCY3HqKNJdfD444bkM1Ppispe9078ixUCdBc6TTaut0PbikCgf6zw71wVwSVl5Xge4fgqUpR2I0W+2EJ0JAsrdgIad917YnqnKMqNw+3fe5f7w6SZV4n1oCQNuEGc2Op2qTrFDmFhurQCIvYoh1OF07LbFbCdbZj5IOAaHMJPU8mWQ7x5C7BdDf5QyYYzAn6K1+icBgP8sStQy7MoVzJIYtIIH4HM+HkU/IptXST8P/JdI0tQxQwqLVvzUuqN7EQfL4pEIUNKw3TsBqu1XIswSxs4aqv2VjsHpiQPltNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVJgXEb1KTJW36w4X44IXP9B8s+OjrNMCo6ELwB1Kik=;
 b=Ai3iOBsnFNIQA8FWRQ1Fx6KIhcxni1HXyEfOzGvpv+vW7uMomZY0RuiMU23/SOacWTJOGC2Qcql5L6QQ868OzjdoFZDqQH+2C3lngUTGqpewm+lAsoplwkYGl8UQTtYPqIyXDI/R6IdH2Q88ngXWgrkUsPV9bOVm2IKF77W2Yhs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB5572.eurprd08.prod.outlook.com (2603:10a6:20b:1db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 13:12:25 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 13:12:25 +0000
Subject: Re: [PATCH v11 5/5] migration: introduce 'userfaultfd-wrlat.py' script
To: Peter Xu <peterx@redhat.com>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-6-andrey.gruzdev@virtuozzo.com>
 <20210119210122.GA215736@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <b51af344-856a-cb27-5aa8-c25e6aaf536e@virtuozzo.com>
Date: Thu, 21 Jan 2021 16:12:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210119210122.GA215736@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------25FF047DE4792840F7C25315"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:208:1::17) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:208:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 13:12:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c2f9990-8892-4c12-7599-08d8be0e3227
X-MS-TrafficTypeDiagnostic: AM8PR08MB5572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB5572F87DCEFADE9BBD7DF52B9FA10@AM8PR08MB5572.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcoGmkTzuYibZRbD5nqCn2Gaa1apeQXGO7/A+fqPssP8QLRG+4QP4nHas0NcgUhHrOnvy1gQzCLwSNscuB7wmf27HEkY+QZAMiMCEDHWZVTGyu2DHrzY+r+Eh3ajZQX4kcZwIM5Vios7HzLvMyJ/BS21vnVTiSNShGTb1K09DVg20ZX/YJHnowMdj8rz7pCoAvFfZ7AVFWemxTll9MbpVBgFY9cXpbls4d6+xBqUpL7sPqAX9orOGO8zUA8QvkcYM44DX2/csRGLfXcP/f2+0P7jjqUdz8IHsEAucUrF27Mz5eC1ImFeaQissvssxKP15i6AV4JC2b/Kwi/s4vVzbtke+Vfz0fdt69w7hbzyGtTioD0+D4bjbUFqYMpjwhXdRJysQBmlx8jreIPh6rmE+VHCb7KiR1lxZIa+mNP4c4+zMcdETqkoSttWyZo/5rQ3m9N84wrMckpEeofH2EV5SfAsPsHo7jJvvCUqb72AsDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39840400004)(376002)(86362001)(16526019)(31696002)(44832011)(8936002)(31686004)(36756003)(956004)(2906002)(186003)(16576012)(2616005)(26005)(6916009)(6486002)(4326008)(53546011)(66476007)(52116002)(66556008)(83380400001)(478600001)(8676002)(33964004)(66946007)(5660300002)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2YxWjRMemtIV0FkaEpTMklkS3djdWdmbU1DQktLcXh4eHZETHZxMDlHdW5x?=
 =?utf-8?B?Tm9aQkxISWpsRVR2ejVqN1F6UzdXMmp6YUhKT1ZXTkdqclVycjZ0ektlMlM4?=
 =?utf-8?B?dURBRS80bTErTGpNR2NldW5rTmoyK2RsMUY1ZjlZMm1LK01Za1pkL0N0VWpY?=
 =?utf-8?B?MklpZjZjWUZ1WjdreTVWTVdTUEoxMEFDcE9BQ1JhMlhWSUdxSlBVc05CTzRU?=
 =?utf-8?B?OWtMNDg0dnIwVG9ZM3FEVnZIeHJwakwwN2FkTG1LWkVrbkYxNjR1MGJwVVVz?=
 =?utf-8?B?YWpHNWdFRG10OVhsY2pCTmZNbVFzQk1XZ2JJLzFqYlFWUlc1UGdXTkw2WUlX?=
 =?utf-8?B?ZGlwdWpXbkMvUTBoVG9ZdjkyZkNQWS80alRHRmlsWGd3RDdoUXE5aTVtSE5p?=
 =?utf-8?B?emJLS0x0TWQ1YVZIQitXTkhtZEwvSDdzd2sxWm1pUHE0TUM4aDNZYklXc2x1?=
 =?utf-8?B?VHFibWpXU2R5cVdqWEJJUkdCVjdBekJPL0pETTNmRVdiREJCcFEwVlhSUVJz?=
 =?utf-8?B?RVVLVFk1MHZTQ3p2eEVYa0ZFV1BSMDB1ZCtpVUdNRFZnSC9yS2YzRFhtL09N?=
 =?utf-8?B?M1RMSjJST01zNmw3am5lS0Z5TG1JUkRyZEtxOXd0UUdwc21zRXFsSzdxbEZa?=
 =?utf-8?B?dmVpUGJGNmpPT0FaQzZiQkIvQXNVdTZubFg5UklhN0tncUhrWFYxTnBLRXQr?=
 =?utf-8?B?S1g4bEZIRWorY1MxeHBzS1Z4Q2RXL1FvZ1EraUVIU0NiY0JLOUVnVjhBb0dK?=
 =?utf-8?B?MDA0LzBia3cyNnRpZldCOHVqLzBMenArNFpDbVUvMGwzMlRaeU9aWkdOb0J0?=
 =?utf-8?B?TXJuYWRWRnlXcVVybEUyRkZpcGNIZlJMaVB5RGJzaVFPTnI4M3AwU3BEb0dG?=
 =?utf-8?B?NzlPUE9vUlRWSVdlbDlhL0VLMnR2eWdlR0FvdzVMcjcyQWhrWDYvcU5sYVpr?=
 =?utf-8?B?R1ZZM0t4eWwzUEw3cGUxRUtvRm5TUmVZYWtUbmxqRjQyelJqOWxQSTVHYTRC?=
 =?utf-8?B?ajZ0MWNRb1lEWXhQSS94bHhyNVlXVXNtSUtXRHhMUTI0ZnpEZ1ozNWpPVlJy?=
 =?utf-8?B?bzlPa3NrMnBuZURnZTZ0dTFwaXdMcTBVK3VwT1dBU1JxdFFybjlOZnF2Nzlp?=
 =?utf-8?B?MVFra3RheWd4SGdWTTJtYlE1NjRnMlZiRys2N1VoUzBNMTM5RVRabW40dXV0?=
 =?utf-8?B?NTY1dXZmNEcyRnlHZGxma2JoN0tHbFZYTDUwMy9zbFF6UCtQUFhycVdOUWZv?=
 =?utf-8?B?NVhXOXE4WUQ0TmVEMDFoUkhlQW9Pck05aHdja0ZIaytZME1sWDhtclJrOEJa?=
 =?utf-8?Q?TorqucYXSqqsY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2f9990-8892-4c12-7599-08d8be0e3227
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 13:12:25.5900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aX5iyL7ueN6agH+GkNAGCL6JqvLXXY/rTec9ghQxcacgaI/dhScyMM11PbbCGhqCkfitUqRy2X9jESN6UZUKRPFWn+T3K2k5TDQb9wnDRwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5572
Received-SPF: pass client-ip=40.107.3.136;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------25FF047DE4792840F7C25315
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.01.2021 00:01, Peter Xu wrote:
> On Wed, Jan 06, 2021 at 06:21:20PM +0300, Andrey Gruzdev wrote:
>> Add BCC/eBPF script to analyze userfaultfd write fault latency distribution.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> Acked-by: Peter Xu <peterx@redhat.com>
> (This seems to be the last patch that lacks a r-b ... Let's see whether I could
>   convert my a-b into an r-b... :)
>
>> +BPF_HASH(ev_start, struct ev_desc, u64);
>> +BPF_HASH(ctx_handle_userfault, u64, u64);
> IMHO we only need one hash here instead of two:
>
>    BPF_HASH(ev_start, u32, u64);
>
> Where we use the tid as the key (u32), and timestamp as the value (u64).  The
> thing is we don't really need the address for current statistics, IMHO.

Agree, that's a more appropriate way do that. Address here is not really needed.
Thanks!

>> +/* KPROBE for handle_userfault(). */
>> +int probe_handle_userfault(struct pt_regs *ctx, struct vm_fault *vmf,
>> +        unsigned long reason)
>> +{
>> +    /* Trace only UFFD write faults. */
>> +    if (reason & VM_UFFD_WP) {
> Better with comment:
>
>             /* Using "(u32)" to drop group ID which is upper 32 bits */

Yep.

>
> If even better, we'd want a get_current_tid() helper and call it here and below
> (bpf_get_current_pid_tgid() will return tid|gid<<32 I think, so I'm a bit
> confused why bcc people called it pid at the first place...).
>
>> +        u64 pid = (u32) bpf_get_current_pid_tgid();
>> +        u64 addr = vmf->address;
>> +
>> +        do_event_start(pid, addr);
>> +        ctx_handle_userfault.update(&pid, &addr);
>> +    }
>> +    return 0;
>> +}
>> +
>> +/* KRETPROBE for handle_userfault(). */
>> +int retprobe_handle_userfault(struct pt_regs *ctx)
>> +{
>> +    u64 pid = (u32) bpf_get_current_pid_tgid();
>> +    u64 *addr_p;
>> +
>> +    /*
>> +     * Here we just ignore the return value. In case of spurious wakeup
>> +     * or pending signal we'll still get (at least for v5.8.0 kernel)
>> +     * VM_FAULT_RETRY or (VM_FAULT_RETRY | VM_FAULT_MAJOR) here.
>> +     * Anyhow, handle_userfault() would be re-entered if such case happens,
>> +     * keeping initial timestamp unchanged for the faulting thread.
> AFAIU this comment is not matching what the code does.  But I agree it's not a
> big problem because we won't miss any long delays (because the one long delayed
> sample will just be split into two or multiple delays, which will still be
> reflected in the histogram at last).  Or am I wrong?

Mm, not really sure about comment.. I need to read kernel code again.

>> +     */
>> +    addr_p = ctx_handle_userfault.lookup(&pid);
>> +    if (addr_p) {
>> +        do_event_end(pid, *addr_p);
>> +        ctx_handle_userfault.delete(&pid);
>> +    }
>> +    return 0;
>> +}
>> +"""
> Other than that, the rest looks good to me.
>
> I'd think it's fine to even merge the current version since it actually works
> nicely.  Andrey, if you agree with any of my above comments, feel free to
> repost this patch (since I see Dave provided the rest r-bs).  Then I think I
> can r-b this one too.  Thanks!
>
Thanks!

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------25FF047DE4792840F7C25315
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 20.01.2021 00:01, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210119210122.GA215736@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 06, 2021 at 06:21:20PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add BCC/eBPF script to analyze userfaultfd write fault latency distribution.

Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
Acked-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
(This seems to be the last patch that lacks a r-b ... Let's see whether I could
 convert my a-b into an r-b... :)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+BPF_HASH(ev_start, struct ev_desc, u64);
+BPF_HASH(ctx_handle_userfault, u64, u64);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
IMHO we only need one hash here instead of two:

  BPF_HASH(ev_start, u32, u64);

Where we use the tid as the key (u32), and timestamp as the value (u64).  The
thing is we don't really need the address for current statistics, IMHO.
</pre>
    </blockquote>
    <pre>Agree, that's a more appropriate way do that. Address here is not really needed.
Thanks!
</pre>
    <blockquote type="cite" cite="mid:20210119210122.GA215736@xz-x1">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+/* KPROBE for handle_userfault(). */
+int probe_handle_userfault(struct pt_regs *ctx, struct vm_fault *vmf,
+        unsigned long reason)
+{
+    /* Trace only UFFD write faults. */
+    if (reason &amp; VM_UFFD_WP) {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Better with comment:

           /* Using &quot;(u32)&quot; to drop group ID which is upper 32 bits */</pre>
    </blockquote>
    <pre>Yep.
</pre>
    <blockquote type="cite" cite="mid:20210119210122.GA215736@xz-x1">
      <pre class="moz-quote-pre" wrap="">

If even better, we'd want a get_current_tid() helper and call it here and below
(bpf_get_current_pid_tgid() will return tid|gid&lt;&lt;32 I think, so I'm a bit
confused why bcc people called it pid at the first place...).

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        u64 pid = (u32) bpf_get_current_pid_tgid();
+        u64 addr = vmf-&gt;address;
+
+        do_event_start(pid, addr);
+        ctx_handle_userfault.update(&amp;pid, &amp;addr);
+    }
+    return 0;
+}
+
+/* KRETPROBE for handle_userfault(). */
+int retprobe_handle_userfault(struct pt_regs *ctx)
+{
+    u64 pid = (u32) bpf_get_current_pid_tgid();
+    u64 *addr_p;
+
+    /*
+     * Here we just ignore the return value. In case of spurious wakeup
+     * or pending signal we'll still get (at least for v5.8.0 kernel)
+     * VM_FAULT_RETRY or (VM_FAULT_RETRY | VM_FAULT_MAJOR) here.
+     * Anyhow, handle_userfault() would be re-entered if such case happens,
+     * keeping initial timestamp unchanged for the faulting thread.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
AFAIU this comment is not matching what the code does.  But I agree it's not a
big problem because we won't miss any long delays (because the one long delayed
sample will just be split into two or multiple delays, which will still be
reflected in the histogram at last).  Or am I wrong?
</pre>
    </blockquote>
    <pre>Mm, not really sure about comment.. I need to read kernel code again.
</pre>
    <blockquote type="cite" cite="mid:20210119210122.GA215736@xz-x1">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+     */
+    addr_p = ctx_handle_userfault.lookup(&amp;pid);
+    if (addr_p) {
+        do_event_end(pid, *addr_p);
+        ctx_handle_userfault.delete(&amp;pid);
+    }
+    return 0;
+}
+&quot;&quot;&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Other than that, the rest looks good to me.

I'd think it's fine to even merge the current version since it actually works
nicely.  Andrey, if you agree with any of my above comments, feel free to
repost this patch (since I see Dave provided the rest r-bs).  Then I think I
can r-b this one too.  Thanks!

</pre>
    </blockquote>
    <pre>Thanks!
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------25FF047DE4792840F7C25315--

