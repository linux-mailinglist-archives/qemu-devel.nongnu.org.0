Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB624D051C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:19:44 +0100 (CET)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRH1K-0004BL-HZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alves.ped@gmail.com>)
 id 1nRGzy-0002mU-Co
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:18:18 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:34786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alves.ped@gmail.com>)
 id 1nRGzw-0004gl-M4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:18:17 -0500
Received: by mail-wr1-f43.google.com with SMTP id j26so14072458wrb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:18:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mrr9PAphP9QqLMYldLByyuPyudFX4OOZvGjK5CMbTF8=;
 b=xM41VdcKeHXdNgKNpbECQhxdVgBCrSnHqrBYKUNxXNmAOBep2BSpVPtprIYCAZ0FSP
 t7PWmDuFWlsd5e/uuMDRlli36NfaLU00dm3FOYHsNfLn3rpFVz4EFKzGsBoiFqEdcBgw
 wj23yyq/lcmsOpJAn4553lPMiCOPKkcQBep471KATBr8X5j+PthVgh5ipb9sUlhyYK9P
 fNGJmVDdQB/qPytLp2BNlxJHemg55C+mXJu9CLdGN5XtaappIzBBWYEX+OJ3KqNBL/je
 Gh1U3zRjOEdRsMIJU0TdPHlPrwPwr60dKArZQBK0svQU8d3ytUmKks7v1B72K5iypaRy
 XEig==
X-Gm-Message-State: AOAM531+Sqxi7/NZejChRMbIdZ79wkfXG8JdeLYTpH0UAdXLoT6E3PHN
 WVSQ3wrXJ6mkDqcSiyLYZBA=
X-Google-Smtp-Source: ABdhPJwQYjJMQ9r9KxZnAyk9Zn978ygvjhtKzT8o35CnKhL+EIq1oWI+R9cFcamRbkNjFex3Cha5Nw==
X-Received: by 2002:a5d:404b:0:b0:1f1:f880:7aca with SMTP id
 w11-20020a5d404b000000b001f1f8807acamr4450943wrp.179.1646673495262; 
 Mon, 07 Mar 2022 09:18:15 -0800 (PST)
Received: from ?IPV6:2001:8a0:f924:2600:209d:85e2:409e:8726?
 ([2001:8a0:f924:2600:209d:85e2:409e:8726])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b0038181486018sm15447722wmq.40.2022.03.07.09.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:18:14 -0800 (PST)
Message-ID: <950cc915-d5dd-dbcb-67a2-9186792af8fe@palves.net>
Date: Mon, 7 Mar 2022 17:18:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: How to backtrace an separate stack?
Content-Language: en-US
To: Tom Tromey <tom@tromey.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <YiCk+NNtAGQPhyK5@stefanha-x1.localdomain>
 <87mti11yy9.fsf@tromey.com>
From: Pedro Alves <pedro@palves.net>
In-Reply-To: <87mti11yy9.fsf@tromey.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.221.43; envelope-from=alves.ped@gmail.com;
 helo=mail-wr1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: gdb@sourceware.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-03-07 16:58, Tom Tromey wrote:
>>>>>> "Stefan" == Stefan Hajnoczi <stefanha@redhat.com> writes:
> 
> Stefan> I hoped that "select-frame address ADDRESS" could be used instead so
> Stefan> this would work on coredumps too. Unfortunately "select-frame" only
> Stefan> searches stack frames that GDB is already aware of, so it cannot be used
> Stefan> to backtrace coroutine stacks.
> 
> I wonder if "select-frame view" is closer to what you want.
> 
> I can't attest to how well it works or doesn't work.  I've never tried
> it.

A backtrace after "select-frame view" will still start at the
current (machine register's) frame.  Maybe it's sufficient to emulate it with
a sequence of "up" + "frame", though.  Keep in mind that you'll lose the view
with "info threads" or any command that flushes the frame cache internally,
as I mentioned in that ancient discussion.

