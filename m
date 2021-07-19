Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7A53CD17C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:03:16 +0200 (CEST)
Received: from localhost ([::1]:43132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Q7G-0006j5-Q7
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5Q5M-0005N4-L3; Mon, 19 Jul 2021 06:01:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5Q5K-0005i4-AG; Mon, 19 Jul 2021 06:01:16 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so11134186wmf.5; 
 Mon, 19 Jul 2021 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rQnUfk30Kw7sdWTuryxGKrqz7QlO8Uzhqo5UZ0LtXFQ=;
 b=pUCCIN5F5C1asInR3JSgowJjY+B6zQ3J/dQ03CSb7LAB8PevYUko2EVyKBw2NHL3qe
 hZCgp87DS26Xbji2W1CS1Ok7kMb+q7Z7XUaP2a8Zt9CjsDFkYPRQSycNbi+akkOZ+5S/
 /2ptS1LQfqzlFf1ds5fXNWZh39/EKINuLem5lpIX/lE63hot5cKunu/HGHqT+ymXpTyR
 FpBMt+Kdlvw4HZRqwL8vGKVNz19YVYXkQMET3KHtIJduTBOh8pC/Hk0DSvjiOzX4QQRt
 Zxq1FqS0OnN8onGT+r9ww1ip2uwSbybOYmNPHzlIjVrSc9NgdPyiF+RF3zmpXnSxDDJ1
 oDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rQnUfk30Kw7sdWTuryxGKrqz7QlO8Uzhqo5UZ0LtXFQ=;
 b=Kmm2bVXneSQb7nY7vZhdgtWdispUV5gKiHDOdKybZbPLPJFzLWsWxaBZ+zl/lXmFgF
 rFyh/JFP1FHRyJIhK1pEnYwLQX7iv3yXOfCUBbVpae7vr5rOyjdL5y2u4R1+VRiIxZhU
 ZNJMJyZJ8CTqxgB1lis0EVweIHbnFGZb3jo8Jqdnt0RMB0VUezEMHWYbKQpCVybRev8C
 /MY73O9P/YeMiANxDTNFxIq4tCD2Q/22ki+J4/XeFDhsI+4hD0DmW+rQH3tUvIsSCInC
 rrehlYdv742MVOJuGXxSGMaqZZHRdYqHQ4LFoBpN+D+7a3Eh8FRfViRu2/7iiqpxU8EJ
 Z+Zg==
X-Gm-Message-State: AOAM533Oq4fereB4dlQ9tgke/qtAdTCo0SezmndY6c4WbTXSiLetBuw6
 MjrTCUb2j9TJXlz9lw4jXF0=
X-Google-Smtp-Source: ABdhPJxG6UZiPscOlIP16UEzAmsTzjCOtRObVeGJIIvuWoahDkUGpnnioqYjJlwrVpdzNWGPrMiMag==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr31481846wmj.128.1626688872448; 
 Mon, 19 Jul 2021 03:01:12 -0700 (PDT)
Received: from [192.168.1.33] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id p5sm21666889wrd.25.2021.07.19.03.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 03:01:11 -0700 (PDT)
Subject: Re: Initialize RAM from a file and save it to the file
To: Hiroko Shimizu <hiroko07168@gmail.com>,
 qemu-discuss <qemu-discuss@nongnu.org>
References: <CACproumcn8Dba=Mt7ww-uFtb2kHpLsF36j0DiKEKQSVDtMPpcg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a3af9417-d743-bb3e-2e46-597b728d1574@amsat.org>
Date: Mon, 19 Jul 2021 12:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACproumcn8Dba=Mt7ww-uFtb2kHpLsF36j0DiKEKQSVDtMPpcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.07,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Hiroko,

On 7/19/21 11:34 AM, Hiroko Shimizu wrote:
> Hello, 
> I'd like to initialize RAM from a specific file when RAM is created.
> Then,  I tried using memory_region_init_ram_from_file(). 

To load a file after the machine is created and before the VM is started
I use the 'generic loader device'.

> I wonder what file format is necessary. I tried using a binary file,
> however the contents of the file wasn't recognized and file_size(defined
> in qemu_ram_alloc_from_fd()) was zero. 

See the doc in docs/system/generic-loader.rst:

  The loader device also allows files to be loaded into memory.
  It can load ELF, U-Boot, and Intel HEX executable formats as
  well as raw images.  The syntax is shown below:

    -device
loader,file=<file>[,addr=<addr>][,cpu-num=<cpu-num>][,force-raw=<raw>]

> Could you tell me what I need to do or another way to initialize RAM
> from a file?
> 
> Also, is it possible to save RAM's value to the file when a value is
> written to RAM which is initialized memory_region_init_ram_from_file()?

2 years ago I was using -mem-path /dev/shm/ (and maybe -mem-prealloc) to
keep the ram sync on a file, pause the VM and analyse the memory, but it
stopped working after the global memdev refactor. I don't think my use
case was the expected one. Maybe I simply need to adapt to a new command
line format :)

Now I use 'pmemsave' from the monitor:

pmemsave addr size file -- save to disk physical memory dump starting at
'addr' of size 'size'

If attached from GDB:

(gdb) monitor pmemsave 0x20000000 0x1000000 /tmp/ram.dump

There are other commands and probably a clever way to do that.

See also the VM snapshot feature, described here, which might be
what you are looking for:
https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu-savevm-snapshots/

Regards,

Phil.

