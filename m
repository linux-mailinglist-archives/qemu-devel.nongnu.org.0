Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9483025E0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:02:17 +0100 (CET)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42Rc-0003B9-NC
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l42PQ-0002VB-Vu
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:00:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l42Oy-0006DH-0u
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611583171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GgSSPLhZeHuK9lMqT4HfMe2rqaC7NBLjOIUSBbe1Cw=;
 b=OAwQW9v8m89ZOxukvVuw77jncciHDBKXm4qJ72v+n+hSaS5bT3HV70Pqq+8z+KyTLMh/39
 XCD7KjpNqlrLdkc0CGqOI8Fnw86noHi/s8rCmW3BKhHvVv5/KhlwUOWSoJy34CFmyM7q+F
 1K63sFKS5pLL8dDTsW3ezObBFVMjNdI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-182rvbiDO6aVGcq9JQUG0w-1; Mon, 25 Jan 2021 08:59:29 -0500
X-MC-Unique: 182rvbiDO6aVGcq9JQUG0w-1
Received: by mail-ed1-f70.google.com with SMTP id m18so802799edp.13
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 05:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7GgSSPLhZeHuK9lMqT4HfMe2rqaC7NBLjOIUSBbe1Cw=;
 b=BzWSSOIzm5zdBR1TxRqi/Wxwai5rGSIXX0FCOpCPS+uwOzdXdT5efRMA+2+AJXe90A
 gbQxfqlxXB7YelWtHVG52XGH+w8s3nogE6PJpt4uOp/LnyYjbt08Nmde+WU4+DQnDPrg
 piJpQ0Zf6PrWqoHID//50ox+3fseIRZt+WZ8xMcxY4HInjMkbWUvdIZEATqT4aKLilg7
 EW+J/kGACMSaT3ix7z1mo6NtF0ayBt6o1k8MrQGceVY3sFVx5/39dIXI8SdvnpbgADll
 BctgBS9BAwXW50sU3NpIXwFq/O048F0M0HPlj5FyaslhEI8BxgJKv1feKYvSQo8mAEfD
 8zBw==
X-Gm-Message-State: AOAM532l0ykaoTbjcDjqiYsnRkxh9VsAGUvahlgEGsugJkVlxSHeDwVH
 IxDBm7xw4f3i278vDhnUYYYMd5oiEVNMVMC+5Wn8TmXvGOoO+WfrL91S1TcdNcqr6TuJMpIpxLa
 Pmk5FhSYdxp9qNWY=
X-Received: by 2002:a17:906:30cd:: with SMTP id
 b13mr453049ejb.336.1611583167929; 
 Mon, 25 Jan 2021 05:59:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9WSRNpWcmmlJldmLHqhyh9XLUJ/S8L6gWM2BQlkoFQyTDNQ5XU0sYlEwBBuZkO2tV/kuhHA==
X-Received: by 2002:a17:906:30cd:: with SMTP id
 b13mr453042ejb.336.1611583167756; 
 Mon, 25 Jan 2021 05:59:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b17sm283222edv.56.2021.01.25.05.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 05:59:27 -0800 (PST)
Subject: Re: [PATCH 15/25] vl: plumb keyval-based options into -set and
 -readconfig
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-16-pbonzini@redhat.com>
 <87blddnspb.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0b64ebb3-e512-3b6d-c1a0-646df57add04@redhat.com>
Date: Mon, 25 Jan 2021 14:59:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87blddnspb.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 12:48, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Add generic machinery to support parsing command line options with
>> keyval in -set and -readconfig, choosing between QDict and
>> QemuOpts as the underlying data structure.
>>
>> The keyval_merge function is slightly heavyweight as a way to
>> do qemu_set_option for QDict-based options, but it will be put
>> to further use later to merge entire -readconfig sections together
>> with their command-line equivalents.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Watch this:
> 
>      $ cat test.cfg
>      [machine]
>        accel = "kvm"
>        usb = "on"
>      $ qemu-system-x86_64 -S -display none -readconfig test.cfg
>      Aborted (core dumped)

Probably something that fixes itself later in the series.  I'll check it 
out.

Paolo

> Backtrace:
> 
>      #0  0x00007ffff52f19e5 in raise () at /lib64/libc.so.6
>      #1  0x00007ffff52da895 in abort () at /lib64/libc.so.6
>      #2  0x0000555555c44a77 in qemu_record_config_group
>          (group=0x7fffffffd1b0 "machine", dict=0x5555565fb740, errp=0x5555564ffca0 <error_fatal>) at ../softmmu/vl.c:2103
>      #3  0x0000555555c44bd8 in qemu_parse_config_group
>          (group=0x7fffffffd1b0 "machine", qdict=0x5555565f9640, opaque=0x5555564ff9e0 <vm_config_groups>, errp=0x5555564ffca0 <error_fatal>) at ../softmmu/vl.c:2135
>      #4  0x0000555555eda3e6 in qemu_config_foreach
>          (fp=0x5555565f3e00, cb=0x555555c44af5 <qemu_parse_config_group>, opaque=0x5555564ff9e0 <vm_config_groups>, fname=0x7fffffffe0dd "test.cfg", errp=0x5555564ffca0 <error_fatal>) at ../util/qemu-config.c:378
>      #5  0x0000555555eda5d5 in qemu_read_config_file
>          (filename=0x7fffffffe0dd "test.cfg", cb=0x555555c44af5 <qemu_parse_config_group>, errp=0x5555564ffca0 <error_fatal>) at ../util/qemu-config.c:421
>      #6  0x0000555555c47d3f in qemu_init
>          (argc=6, argv=0x7fffffffdcc8, envp=0x7fffffffdd00) at ../softmmu/vl.c:3405
>      #7  0x00005555558234e1 in main
>          (argc=6, argv=0x7fffffffdcc8, envp=0x7fffffffdd00) at ../softmmu/main.c:49
> 
> Similar result for
> 
>      [memory]
>        size = "1024"
> 
> and
> 
>      [chardev "mon0"]
>        backend = "stdio"
> 
> I didn't look for more.
> 


