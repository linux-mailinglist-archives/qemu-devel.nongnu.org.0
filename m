Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1F310D74
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:56:44 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83TP-0003Ym-2N
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l83SW-0002yB-Ra
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l83ST-0008IE-BK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612540543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBOHPTaHlVcdxCJUmkboBJ4j8trrCSUtNP+rvlcQ5Wg=;
 b=NrCOcnGA8dd74hXiagpvym/W+NJ6hXX8yiYpxuuLtn4JyJlJaINClZDs07kfOEWYjyGYTb
 SnR5qS+byBFN98rZlGFQ1Q1uUAeZkF+fCZvUEI6fTwXhg7WCd8dhOYFxO9owwT7x0MvIjs
 9Ar8uv/M0jiKURv1FM/pEmCh/9K1bps=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-6tCD-0HPPz-PE_4JOue_sA-1; Fri, 05 Feb 2021 10:55:41 -0500
X-MC-Unique: 6tCD-0HPPz-PE_4JOue_sA-1
Received: by mail-wr1-f69.google.com with SMTP id o17so5617249wrv.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBOHPTaHlVcdxCJUmkboBJ4j8trrCSUtNP+rvlcQ5Wg=;
 b=gW4tUiiaty3szDf+zJl+2LQOZ0LTZxmUUqu72Sn3A+ErtV/mTfR/B/+zKKlvxnEp4Q
 iPQVTz74VgMkg/QSyxlGXX1xOnuvhYj3Fudik+L2ylIGHYhkotCp93mHyJ1TDpvsOmi8
 uePIq//zAcvnGs3eB2j+7mKyOJtYC2fxMWgwkEXEYcP/zHqgCzOxHEbnRJBCQEr3GDS7
 2xcXNVWDW8ca5Dt66Sxui0Jt0Oli3MusschXJZbkl/fe0yndfc4MLHZAgoBBHw79f3Ma
 MyutbS4iP+6qxNMaiw1Sjis+1fFA+jut1IFzCHkYUjI9TNnR7ntXMsyyS5pzfHnMK8gx
 U8kw==
X-Gm-Message-State: AOAM530mtrTlwmlocRX5QdKY1qPHWrQ472bzPy1s7oD9WjM8VAoHTJpf
 OhAuS3iMh+CkhwgDR1fFRfLfIYsBVJ4/c4QIO/KPndaep7fCbJzahfFE1ac1uAX1NcLW46kKIQD
 CcC3T09KikOziy9A=
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr5815633wri.77.1612540539739; 
 Fri, 05 Feb 2021 07:55:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwe17bOiVlrUKXBlhT+fdk3saKR8iXVNjtS4YrfevDfzZzBuaA7KUBAyR4ao9YqOODx3dnXA==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr5815613wri.77.1612540539547; 
 Fri, 05 Feb 2021 07:55:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z4sm12368776wrw.38.2021.02.05.07.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:55:38 -0800 (PST)
Subject: Re: QEMU v5.2.0: object_new_with_type: assertion failed: (type !=
 NULL)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <DM6PR18MB2698B10216D8BD1ED5DE8809E3B29@DM6PR18MB2698.namprd18.prod.outlook.com>
 <a9fe645c-5737-a004-a8e6-2e0f9cdf6908@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3b4137a2-5409-e021-1edd-a9dc0a69c2aa@redhat.com>
Date: Fri, 5 Feb 2021 16:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a9fe645c-5737-a004-a8e6-2e0f9cdf6908@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/21 14:03, Philippe Mathieu-Daudé wrote:
> On 2/5/21 12:48 PM, Bharat Bhushan wrote:
>>
>> Hi All,
>>
>> I am using QEMU version "v5.2.0" and getting below error when running on arm64
>>
>> $ qemu-system-aarch64 --version
>>
>> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>>
>> Running GDB give below information.
>> Is this something known.
>>
>> (gdb) run
>> Starting program: /root/qemu-system-aarch64
>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/lib64/libthread_db.so.1".
>> [New Thread 0xfffff703ed90 (LWP 5212)]
>> **
>> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
>>
>> Thread 1 "qemu-system-aar" received signal SIGABRT, Aborted.
>> 0x0000fffff73e380c in raise () from /lib64/libc.so.6
>> (gdb) bt
>> #0  0x0000fffff73e380c in raise () from /lib64/libc.so.6
>> #1  0x0000fffff73d0bcc in abort () from /lib64/libc.so.6
>> #2  0x0000fffff7b7c058 in g_assertion_message () from /lib64/libglib-2.0.so.0
>> #3  0x0000fffff7b7c0b8 in g_assertion_message_expr () from /lib64/libglib-2.0.so.0
>> #4  0x0000aaaaab2b880c in object_new_with_type (type=<optimized out>) at ../qom/object.c:711
>> #5  0x0000aaaaab2b8870 in object_new (typename=typename@entry=0xaaaaab50a668 "container") at ../qom/object.c:744
> 
> How can you not have "container" registered? libqom is a core part
> of QEMU... Cc'ing Gerd for the module initialization.

The problem seems to be that chardev/chardev-sysemu.c's register_types 
is not exactly a QOM hook, it calls qemu_add_machine_init_done_notifier. 
  And for some weird reason machine_init_done is already true when it is 
called.

Bharat, you could try to set a watchpoint on machine_init_done and see 
who sets it to true.  Alternatively you can try to backport 
5a1ee6077b89ee9a803aaf8d1c98004701f63684, which gets rid of the code 
that is involved here.

Paolo

>> #6  0x0000aaaaab2b9ec4 in object_get_root () at ../qom/object.c:1674
>> #7  0x0000aaaaab2a4c0c in get_chardevs_root () at ../chardev/char.c:50
>> #8  0x0000aaaaaaf9f2b4 in chardev_machine_done_hook (notifier=<optimized out>, unused=<optimized out>)
>>      at ../chardev/chardev-sysemu.c:45
>> #9  0x0000aaaaab3d4ae8 in module_call_init (type=type@entry=MODULE_INIT_QOM) at ../util/module.c:106
>> #10 0x0000aaaaab235000 in qemu_init (argc=1, argv=0xfffffffffcb8, envp=<optimized out>) at ../softmmu/vl.c:2916
>> #11 0x0000aaaaaad9e084 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:49
>> (gdb)
>>
>> Thanks
>> -Bharat
>>
> 


