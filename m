Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0841D4D00BF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:09:15 +0100 (CET)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE30-0004LN-1h
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alves.ped@gmail.com>)
 id 1nRAw5-0003bP-T9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:49:53 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:40820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alves.ped@gmail.com>)
 id 1nRAw4-0001pN-7E
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:49:53 -0500
Received: by mail-wm1-f50.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so5307050wmb.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fqNtIGBI9CdfY2KtLoBrsUJJUf8N++JGIl4B+xgJ5Dg=;
 b=0uWCXywTVnSTzAgFOZVb1K1QZgW6XEWQSS4GJzy7BZe+dcIU0IkPbvuAB1WScYt7dO
 e2eiQvNznNB2D7dFL7veYNT9aVVjAia0iifpV316pxVVo2ZS9i0TWVBsHHGwUL+jkmPR
 L246gSC0JXGsdmoTrqCmrX9hND6Fk5/MPHYO6L3kuMjuddwisvNEZK03MrKtG945zoHn
 X8GhnyFl23CK05UjfxvVPBC9X0lzYoN0Ft2K3wzNzUJMsLqqlJfx/r0CORUWMvoZNWAF
 MEWEa3e3CKK0Kv0cQxDkCf6TLGJNGgoAAurfC1OQ8JiafcBte03pwv9vfFvZi/CmdY7R
 x/Ww==
X-Gm-Message-State: AOAM532W9lz6w94U8jAywHlnuRDOhwgPLsvG8QpUakErPdaNh6BtVyLV
 GFlY4kCDrm3YWf3ASzRK6K8=
X-Google-Smtp-Source: ABdhPJyNIyFvw1MciCQLRROo4paTn6DKwQdIA385TQgJ91sMNuH3kb9Fc6hU6UVoBX3DN6+jexsF+g==
X-Received: by 2002:a1c:f315:0:b0:381:1f6d:6ca6 with SMTP id
 q21-20020a1cf315000000b003811f6d6ca6mr17817059wmq.25.1646650190299; 
 Mon, 07 Mar 2022 02:49:50 -0800 (PST)
Received: from ?IPV6:2001:8a0:f924:2600:209d:85e2:409e:8726?
 ([2001:8a0:f924:2600:209d:85e2:409e:8726])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm18552271wma.25.2022.03.07.02.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:49:49 -0800 (PST)
Message-ID: <bb91b504-aa47-49fe-9382-2b366449293f@palves.net>
Date: Mon, 7 Mar 2022 10:49:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: How to backtrace an separate stack?
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, gdb@sourceware.org
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
From: Pedro Alves <pedro@palves.net>
In-Reply-To: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.128.50; envelope-from=alves.ped@gmail.com;
 helo=mail-wm1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Mar 2022 09:06:33 -0500
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
Cc: tom@tromey.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-03-03 11:22, Stefan Hajnoczi wrote:
> Hi,
> The QEMU emulator uses coroutines with separate stacks. It can be
> challenging to debug coroutines that have yielded because GDB is not
> aware of them (no thread is currently executing them).
> 
> QEMU has a GDB Python script that helps. It "creates" a stack frame for
> a given coroutine by temporarily setting register values and then using
> the "bt" command. This works on a live process under ptrace control but
> not for coredumps where registers can't be set.
> 
> Here is the script (or see the bottom of this email for an inline copy
> of the relevant code):
> https://gitlab.com/qemu-project/qemu/-/blob/master/scripts/qemugdb/coroutine.py
> 
> I hoped that "select-frame address ADDRESS" could be used instead so
> this would work on coredumps too. Unfortunately "select-frame" only
> searches stack frames that GDB is already aware of, so it cannot be used
> to backtrace coroutine stacks.
> 
> Is there a way to backtrace a stack at an arbitrary address in GDB?

I don't think there's an easy/great answer.  Maybe it could
be done with a Python unwinder [1]?  See gdb.python/py-unwind-user-regs.py
in the GDB testsuite for an example you could probably start with.

As for something built-in to GDB, this reminded me of a discussion a while ago
around a "frame create" command.  Here were my thoughts back then, I think
still valid:

  https://sourceware.org/legacy-ml/gdb-patches/2015-09/msg00658.html

[1] https://sourceware.org/gdb/onlinedocs/gdb/Unwinding-Frames-in-Python.html

