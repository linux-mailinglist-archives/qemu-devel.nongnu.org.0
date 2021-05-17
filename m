Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A2383B17
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:18:56 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligtM-00047p-0C
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1ligQp-00078U-V6
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:49:29 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1ligQn-0004e3-Sx
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:49:27 -0400
Received: by mail-qk1-x734.google.com with SMTP id 197so6363360qkl.12
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tVQisrYTgXm8GmYvmbYkgLuCiJ6/F3f/L5/Dh+QMk+s=;
 b=ES6728U63DAYrRtuvPQnyOM0G1yNJb+bLvkb1MFWgprEXAn0pOY5nal8cQnV/auIZo
 XAjrjXG60V/jRL1GJigFXO7M0L7xtcqMFeTaqFhxr6D/+qULJYmAq3Pno9u30m6IAxNa
 lTKPFzcEfC4ILKO5btg0aIyISQN4UpJBaCjoR2jmQiKpa5VKi0nxt/XL5TXlGd8naQxS
 lYna5oMvVliDJo6wE3I4TtDZ9FXat/r/wUxu6h2p0aHZYqB/dzmXN7fvX0ysLCZ4gLVT
 vjj45p0+ZASSstqEZn1EY3Nka2imAdOMKcDy+bU0XRKu0rP+7vIc1JrfXLrv77OrnKmJ
 r7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tVQisrYTgXm8GmYvmbYkgLuCiJ6/F3f/L5/Dh+QMk+s=;
 b=RaaOd0JOrfMjdSkEPEluR/NJXJWSaes7hl5gPFYycG1Inx3u86yFvhXrQPvAVgYIoN
 Q9RZ3ACqeTrIm8rkzUCPNxLAXVmssBRVi+hUtLYy0j4dGz0Ww9JabClotr2oPCSNwDHA
 sF1pvkDS/9K7xFl0yOgSzdNOge1fThmVuPuvYpBgpSsUNZpuML2MccZTdiKzZy875GEK
 2mYhKtB+kP5FYxOWeuM09lXUqU1GVfumPlqxodsleNJFn1120sE7nFPMzEIKqTmrYsbQ
 elg6J9IH1QFzr7xAKQCjIA9Wf8s6RWoYLm+Yw4n9/5t/RTjQ1XTy+nsEIHnmxw/GhQPb
 RCJw==
X-Gm-Message-State: AOAM532BB9qXsB4PG0Kg9opHUw1xJTD68w0Q8BHDmLqdy4Ko33wXcp92
 oHy1phsodQ4yrO5uZafkEbGGqQ==
X-Google-Smtp-Source: ABdhPJwfz2fXkvrEjBkRkTYlZ3FXWp0Vbm0LvE/G6zd1KA6NtS8tBq7n+aFUvre2hTStq7HeJZVGJg==
X-Received: by 2002:a37:745:: with SMTP id 66mr764705qkh.5.1621270164205;
 Mon, 17 May 2021 09:49:24 -0700 (PDT)
Received: from ?IPv6:2804:7f0:4841:40ad:6091:b08d:7dd2:84b1?
 ([2804:7f0:4841:40ad:6091:b08d:7dd2:84b1])
 by smtp.gmail.com with ESMTPSA id i10sm10883391qko.68.2021.05.17.09.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 09:49:23 -0700 (PDT)
Subject: Re: Best approach for supporting snapshots for QEMU's gdbstub?
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, gdb@gnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
References: <87y2chjmsf.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <6c8845b7-cc60-c8ba-3ada-6d0c6e65d8a5@linaro.org>
Date: Mon, 17 May 2021 13:49:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87y2chjmsf.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=luis.machado@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 5/14/21 1:06 PM, Alex Bennée wrote:
> Hi,
> 
> I've been playing around with QEMU's reverse debugging support which
> I have working with Pavel's latest patches for supporting virtio with
> record/replay. Once you get the right command line it works well enough
> although currently each step backwards requires replaying the entire
> execution history until you get to the right point.
> 
> QEMU can quite easily snapshot the entire VM state so I was looking to
> see what the best way to integrate this would be. As far as I can tell
> there are two interfaces gdb supports: bookmarks and checkpoints.
> 
> As far as I can tell bookmarks where added as part of GDB's reverse
> debugging support but attempting to use them from the gdbstub reports:
> 
>    (gdb) bookmark
>    You can't do that when your target is `remote'
> 
> so I guess that would need an extension to the stub protocol to support?
> 

Right. We don't support reverse step/next/continue for remote targets. I 
think this would be the most appropriate way to implement this feature 
in GDB. But it is not trivial.

> The other option I found was checkpoints which seem to predate support
> for reverse debugging. However:
> 
>    (gdb) checkpoint
>    checkpoint: can't find fork function in inferior.
> 
> I couldn't tell what feature needs to be negotiated but I suspect it's
> something like fork-events if the checkpoint mechanism is designed for
> user space with a fork/freeze approach.

Checkpoints are an old mechanism for saving a snapshot from a process, 
but they don't support threaded inferiors and they need to be able to 
call fork.

> 
> We could of course just add a custom monitor command like the
> qemu.sstep= command which could be used manually. However that would be
> a QEMU gdbstub specific approach.

That would be an easy and quick way to allow GDB to control things in 
QEMU, but I wouldn't say it is the best. Monitor commands are basically 
a bypass of the RSP where GDB sends/receives commands to/from the remote 
target.

> 
> The other thing would be to be more intelligent on QEMU's side and save
> snapshots each time we hit an event, for example each time we hit a
> given breakpoint. However I do worry that might lead to snapshots
> growing quite quickly.

GDB would need to be aware of such snapshots for them to be useful. 
Otherwise GDB wouldn't be able to use them to restore state.

> 
> Any thoughts/suggestions?
> 

