Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4112310B85
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 14:06:31 +0100 (CET)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l80og-00059o-7Y
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 08:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l80mH-0004S4-0z
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l80mD-0008Sd-N5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 08:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612530236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96htHRhshsWeCA5TkZVO1dA4434YdbQRfCp/KdBRqac=;
 b=bz6+LWbqbXzDaA7A/WwfkSWDPR7aRRCgynq5HTMpnkFbs0ZRyIF1gtHICstTzGXwg6eAz/
 96wNt2X533jgXZ4mbJ426Gz32kZZwsFkfB6cai17hY/cXZJ0NcHQS/Q9lDQoE7MyE9T2me
 gMzqhBm58lpUXxKrLvM0Z5VH1+RO7NM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-D4IhBB34NJyDAfxKZ2PuOw-1; Fri, 05 Feb 2021 08:03:55 -0500
X-MC-Unique: D4IhBB34NJyDAfxKZ2PuOw-1
Received: by mail-ed1-f71.google.com with SMTP id ck25so6881326edb.16
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 05:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=96htHRhshsWeCA5TkZVO1dA4434YdbQRfCp/KdBRqac=;
 b=V9b5Fkvcjb/t2AmBbnlfThfWukfrfImvleauPbIOl+5KWBFXLlCEmycOCGAxEg7rFd
 BtzdayPGVQv7hI5yaqJatFK0ginAnB0srj4pRHn7fdgalnlJtn1vZtKUok2amY2RBAwA
 G/tZsKUzuGRppDxRvdOWEVXulAlNmeatwCf9uafe6VmrkQ12iu0KLoUYk7Na8EGKujJ6
 wciZljpVJTPxDL+/ecb32IszLYxPZEWfL73fNUp/mJRBoassMhJ+2e+/92Ft6DeSB2xd
 rcQjFkwczW7+YmIGMS2y6beFOXkwjLI9bZowmnPtPcCmG5Pck/nCN6fCe/NyZUPDmvq5
 rY4Q==
X-Gm-Message-State: AOAM5323J8rdcdnMXXioUGPfP/sjWJbzGuBROBcVmeO+1RI8IRnaK9zZ
 Ee/6JsfrHoJmPRD7ZiredDk/ymJ3SgzeoGaJFW04YAH5EI/GsJURimTDDdJbNp/LEBfBNECtEgg
 e6ifbJrR79p3zfCM=
X-Received: by 2002:a17:906:442:: with SMTP id e2mr4017620eja.9.1612530234210; 
 Fri, 05 Feb 2021 05:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOZI4ScSpdZejLGMq06zoAlzF9pG2laEW/AyrSy3viB09RZiJ97oplR4W7pbKHQHcUgOagug==
X-Received: by 2002:a17:906:442:: with SMTP id e2mr4017590eja.9.1612530233859; 
 Fri, 05 Feb 2021 05:03:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l1sm3837016eje.12.2021.02.05.05.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 05:03:53 -0800 (PST)
Subject: Re: QEMU v5.2.0: object_new_with_type: assertion failed: (type !=
 NULL)
To: Bharat Bhushan <bbhushan2@marvell.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <DM6PR18MB2698B10216D8BD1ED5DE8809E3B29@DM6PR18MB2698.namprd18.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a9fe645c-5737-a004-a8e6-2e0f9cdf6908@redhat.com>
Date: Fri, 5 Feb 2021 14:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <DM6PR18MB2698B10216D8BD1ED5DE8809E3B29@DM6PR18MB2698.namprd18.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 12:48 PM, Bharat Bhushan wrote:
> 
> Hi All,
> 
> I am using QEMU version "v5.2.0" and getting below error when running on arm64
> 
> $ qemu-system-aarch64 --version
> 
> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> 
> Running GDB give below information.
> Is this something known.
> 
> (gdb) run
> Starting program: /root/qemu-system-aarch64 
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib64/libthread_db.so.1".
> [New Thread 0xfffff703ed90 (LWP 5212)]
> **
> ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> Bail out! ERROR:../qom/object.c:711:object_new_with_type: assertion failed: (type != NULL)
> 
> Thread 1 "qemu-system-aar" received signal SIGABRT, Aborted.
> 0x0000fffff73e380c in raise () from /lib64/libc.so.6
> (gdb) bt
> #0  0x0000fffff73e380c in raise () from /lib64/libc.so.6
> #1  0x0000fffff73d0bcc in abort () from /lib64/libc.so.6
> #2  0x0000fffff7b7c058 in g_assertion_message () from /lib64/libglib-2.0.so.0
> #3  0x0000fffff7b7c0b8 in g_assertion_message_expr () from /lib64/libglib-2.0.so.0
> #4  0x0000aaaaab2b880c in object_new_with_type (type=<optimized out>) at ../qom/object.c:711
> #5  0x0000aaaaab2b8870 in object_new (typename=typename@entry=0xaaaaab50a668 "container") at ../qom/object.c:744

How can you not have "container" registered? libqom is a core part
of QEMU... Cc'ing Gerd for the module initialization.

> #6  0x0000aaaaab2b9ec4 in object_get_root () at ../qom/object.c:1674
> #7  0x0000aaaaab2a4c0c in get_chardevs_root () at ../chardev/char.c:50
> #8  0x0000aaaaaaf9f2b4 in chardev_machine_done_hook (notifier=<optimized out>, unused=<optimized out>)
>     at ../chardev/chardev-sysemu.c:45
> #9  0x0000aaaaab3d4ae8 in module_call_init (type=type@entry=MODULE_INIT_QOM) at ../util/module.c:106
> #10 0x0000aaaaab235000 in qemu_init (argc=1, argv=0xfffffffffcb8, envp=<optimized out>) at ../softmmu/vl.c:2916
> #11 0x0000aaaaaad9e084 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at ../softmmu/main.c:49
> (gdb)
> 
> Thanks
> -Bharat
> 


