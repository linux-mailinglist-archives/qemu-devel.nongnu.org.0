Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A614834A2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 17:16:23 +0100 (CET)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Q0U-00048Z-5t
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 11:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4Pyl-0002Ld-5h
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 11:14:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4Pyi-0006Sz-4h
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 11:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641226470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vatypZsgtsjKl7k5RfWjAxRDGWbsasp9XiiBdYutPg=;
 b=bKXHl18wdGIbCkkjFLMxgYqkeFP10OmYTU0t/jkhN59JpGf731TQC7LnrRqF4tOqQZYvmT
 YVTGnsZESFBHWrvmNSyDDzpeHsR/A/2y97v5h+dbLUkwLNox5hlsaZjQIRX/uvQ5vYuyvz
 SxvXMWdJIlHddEW7QX7/EyonNFyMwmo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-pTAnkSArN8qCoaVX2Tyq0Q-1; Mon, 03 Jan 2022 11:14:29 -0500
X-MC-Unique: pTAnkSArN8qCoaVX2Tyq0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 b20-20020a05600c4e1400b003457da1c91eso8905265wmq.4
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 08:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6vatypZsgtsjKl7k5RfWjAxRDGWbsasp9XiiBdYutPg=;
 b=5mq+OA6FkxzVa2CK7quugNYnsnW56AeMeCpa3geuERjcjfSbIseiuviC+YBaaeiXcH
 nC4sWw8iQhaY0y7p6KnKt7xNV62bzz2HwFNcqqZmLFMOJVuE13heOQI4pBQs2bYDpHyK
 vCMetuPOKGNVa2x85G3qGshq36GkuNViKIQ5i49mha38tmdIAAw4QIUXIccb/0LztpTY
 iy+YMhnBkhv5UDjyqiowl6EMlFfSX5RNb5emgkbpIvxfNOwMNdNcuezVwNH/f+5JFYYP
 2+/oz1KaZKe1rLtBEvTGsGrcYMGYWTeUaIaTmQPGzzGmC4L+gYL69rlWxK3FstxN0iKQ
 1D1Q==
X-Gm-Message-State: AOAM531RQvydmc0kQJzb4XCDzsCTrR75B2Oa60v7g1YwCRjc7fsusVWY
 XTCEXk+UnsBy/Z2ClMywPPTTdzVMniw8GmfhwR+qMmOLjaR4H9sxMZFJrMwx/GG9rB+Wjeb6V0x
 cBH0kRGoJ/q5ZShQ=
X-Received: by 2002:a5d:4563:: with SMTP id a3mr40565933wrc.371.1641226468766; 
 Mon, 03 Jan 2022 08:14:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuiayleX3kqjkENqzEfZKFR7SqAXL1z9HhIziqHJ1ATccXbXoAR1qVTT4NhYGbPj+xUJui9g==
X-Received: by 2002:a5d:4563:: with SMTP id a3mr40565913wrc.371.1641226468509; 
 Mon, 03 Jan 2022 08:14:28 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id bk17sm4971743wrb.105.2022.01.03.08.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 08:14:28 -0800 (PST)
Message-ID: <4fad54e5-f22c-277a-4264-59995ae52390@redhat.com>
Date: Mon, 3 Jan 2022 17:14:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <45780114-34ab-a0c6-87ed-3b26ba4cbbd2@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <45780114-34ab-a0c6-87ed-3b26ba4cbbd2@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.12.21 17:00, Vladimir Sementsov-Ogievskiy wrote:
> 22.12.2021 14:41, Hanna Reitz wrote:
>> We want to add a --daemonize argument to QSD's command line.  This will
>> require forking the process before we do any complex initialization
>> steps, like setting up the block layer or QMP.  Therefore, we must scan
>> the command line for it long before our current process_options() call.
>>
>> Instead of adding custom new code to do so, just reuse process_options()
>> and give it a @pre_init_pass argument to distinguish the two passes.  I
>> believe there are some other switches but --daemonize that deserve
>> parsing in the first pass:
>>
>> - --help and --version are supposed to only print some text and then
>>    immediately exit (so any initialization we do would be for naught).
>>    This changes behavior, because now "--blockdev inv-drv --help" will
>>    print a help text instead of complaining about the --blockdev
>>    argument.
>>    Note that this is similar in behavior to other tools, though: 
>> "--help"
>>    is generally immediately acted upon when finding it in the argument
>>    list, potentially before other arguments (even ones before it) are
>>    acted on.  For example, "ls /does-not-exist --help" prints a help 
>> text
>>    and does not complain about ENOENT.
>>
>> - --pidfile does not need initialization, and is already exempted from
>>    the sequential order that process_options() claims to strictly follow
>>    (the PID file is only created after all arguments are processed, not
>>    at the time the --pidfile argument appears), so it makes sense to
>>    include it in the same category as --daemonize.
>>
>> - Invalid arguments should always be reported as soon as possible.  (The
>>    same caveat with --help applies: That means that "--blockdev inv-drv
>>    --inv-arg" will now complain about --inv-arg, not inv-drv.)
>>
>> Note that we could decide to check only for --daemonize in the first
>> pass, and defer --help, --version, and checking for invalid arguments to
>> the second one, thus largely keeping our current behavior. However,
>> this would break "--help --daemonize": The child would print the help
>> text to stdout, which is redirected to /dev/null, and so the text would
>> disappear.  We would need to have the text be printed to stderr instead,
>> and this would then make the parent process exit with EXIT_FAILURE,
>> which is probably not what we want for --help.
>>
>> This patch does make some references to --daemonize without having
>> implemented it yet, but that will happen in the next patch.
>>
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
>> ---
>>   storage-daemon/qemu-storage-daemon.c | 37 ++++++++++++++++++++++++++--
>>   1 file changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/storage-daemon/qemu-storage-daemon.c 
>> b/storage-daemon/qemu-storage-daemon.c
>> index 52cf17e8ac..42a52d3b1c 100644
>> --- a/storage-daemon/qemu-storage-daemon.c
>> +++ b/storage-daemon/qemu-storage-daemon.c
>> @@ -164,7 +164,23 @@ static int getopt_set_loc(int argc, char **argv, 
>> const char *optstring,
>>       return c;
>>   }
>>   -static void process_options(int argc, char *argv[])
>> +/**
>> + * Process QSD command-line arguments.
>> + *
>> + * This is done in two passes:
>> + *
>> + * First (@pre_init_pass is true), we do a pass where all global
>> + * arguments pertaining to the QSD process (like --help or --daemonize)
>> + * are processed.  This pass is done before most of the QEMU-specific
>> + * initialization steps (e.g. initializing the block layer or QMP), and
>> + * so must only process arguments that are not really QEMU-specific.
>> + *
>> + * Second (@pre_init_pass is false), we (sequentially) process all
>> + * QEMU/QSD-specific arguments.  Many of these arguments are 
>> effectively
>> + * translated to QMP commands (like --blockdev for blockdev-add, or
>> + * --export for block-export-add).
>> + */
>> +static void process_options(int argc, char *argv[], bool pre_init_pass)
>>   {
>>       int c;
>>   @@ -187,7 +203,22 @@ static void process_options(int argc, char 
>> *argv[])
>>        * they are given on the command lines. This means that things 
>> must be
>
> So, --pidfile already breaks a bit this comment. Still would be good 
> to adjust it now..
>
> may be, s/options/QEMU-specific options/ or something like this.

Right, makes sense to make it match the comment above the function.

>>        * defined first before they can be referenced in another option.
>>        */
>> +    optind = 1;
>>       while ((c = getopt_set_loc(argc, argv, "-hT:V", long_options)) 
>> != -1) {
>> +        bool handle_option_pre_init;
>> +
>> +        /* Should this argument be processed in the pre-init pass? */
>> +        handle_option_pre_init =
>> +            c == '?' ||
>> +            c == 'h' ||
>> +            c == 'V' ||
>> +            c == OPTION_PIDFILE;
>> +
>> +        /* Process every option only in its respective pass */
>> +        if (pre_init_pass != handle_option_pre_init) {
>> +            continue;
>> +        }
>> +
>>           switch (c) {
>>           case '?':
>>               exit(EXIT_FAILURE);
>> @@ -321,6 +352,8 @@ int main(int argc, char *argv[])
>>       qemu_init_exec_dir(argv[0]);
>>       os_setup_signal_handling();
>>   +    process_options(argc, argv, true);
>> +
>>       module_call_init(MODULE_INIT_QOM);
>>       module_call_init(MODULE_INIT_TRACE);
>>       qemu_add_opts(&qemu_trace_opts);
>> @@ -335,7 +368,7 @@ int main(int argc, char *argv[])
>>       qemu_set_log(LOG_TRACE);
>>         qemu_init_main_loop(&error_fatal);
>> -    process_options(argc, argv);
>> +    process_options(argc, argv, false);
>>         /*
>>        * Write the pid file after creating chardevs, exports, and NBD 
>> servers but
>>
>
>


