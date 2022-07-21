Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7457C77C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:23:32 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oESP4-0004hD-VA
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oESLV-0002ou-1c
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:19:50 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oESLQ-0005lH-B5
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:19:45 -0400
Received: by mail-ej1-x62b.google.com with SMTP id tk8so2090471ejc.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQ9lI4so5xsuzIA84iYen7qlMEeThAAchgC+Mtb8Bp4=;
 b=cjeTye4jbzD5o8eSMyaVtNO4BCSqYcuc9WaEXG9Qx6l3kFoYTwSDK0Q93MfdL1loLH
 f6dZeUh0uihMhuqjNMxLSg1r2R2SLJpR7JfvLZNs2OmI/XjcpRKLrzoESkF1m+I7MWwL
 g8I7JfGjUBFKnwV/juheCdi7Pz5EiFkXsCIXS01tBktsuXRjdZNyypx7qO3sRe60OGl0
 abku2EXdYC3j3DOXZdt4Zd+1RJCp2QjD4RAsv8z/a/qwpIJ7BvGS7+WTcxXisJIZmK0F
 UweURehnC9rsdzSDZv6HXCokGfMh2KnMiF3+0bM/YFq2ApABdoiYlQKcEY4pJ/DCqVUs
 XDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eQ9lI4so5xsuzIA84iYen7qlMEeThAAchgC+Mtb8Bp4=;
 b=WJuPNXCPwOKQrIml5OqrIiDDj/X9e3sWTeqUpx52rntaQT/efPYLsfBrageS1JFUIy
 euv0notprlXCJM1A53FzyZA8k5Izyx0hsjlIHGLC5ecyOeJFV9EuvJkx7o/m5YUdtfGd
 VqK/5oRaRyIY30zUt5dGCjtLmFkz6Fus7XQpW3R7i6HJ9j8hPXeqAcaXSB6+pYyZc3c/
 elGLR1wIpy9NwnzQih+JehRd7kfGdQVEPdzutUl1FV+7OUIbbd0iXrZLdbMVpRVr+mFi
 S1eB/SkL26yAFCxxSLEo9WmmYGXboX9IWzKddH9lEEalOlLvkE+IKn8U14+AkNWvnq8K
 XGlg==
X-Gm-Message-State: AJIora9gqzxdbhHnKwNEeuVa9l7bjyzK9/j1yzGZYlFFVX0y4z8rZLVC
 q6IdyNktuXjTzISYrYRFl1o=
X-Google-Smtp-Source: AGRyM1uTGEmD7xrb+ShOvgYSXip68XlrJvVU57494E6VrdO9U8PjufD7aWF37j3IFp81VaEmanwQNA==
X-Received: by 2002:a17:907:1c0c:b0:72e:dd1f:a230 with SMTP id
 nc12-20020a1709071c0c00b0072edd1fa230mr35510471ejc.8.1658395181943; 
 Thu, 21 Jul 2022 02:19:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 hw17-20020a170907a0d100b0072f1d8e7301sm618986ejc.66.2022.07.21.02.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 02:19:41 -0700 (PDT)
Message-ID: <06e60181-2f77-6f02-5015-fd14153efff3@redhat.com>
Date: Thu, 21 Jul 2022 11:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH resend v3] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
References: <20220711145432.56704-1-Jason@zx2c4.com>
 <20220719115300.104095-1-Jason@zx2c4.com> <Ytf9KVQNOZBI5u8f@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ytf9KVQNOZBI5u8f@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/22 15:03, Jason A. Donenfeld wrote:
> Hi Paolo,
> 
> On Tue, Jul 19, 2022 at 01:53:00PM +0200, Jason A. Donenfeld wrote:
>> Tiny machines optimized for fast boot time generally don't use EFI,
>> which means a random seed has to be supplied some other way. For this
>> purpose, Linux (≥5.20) supports passing a seed in the setup_data table
>> with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
>> specialized bootloaders. The linked commit shows the upstream kernel
>> implementation.
> 
> Having received your message in the other thread hinting, "I think
> there are some issues with migration compatibility of setup_data and
> they snowball a bit, so I'll reply there," and being a bit eager to get
> this moving, I thought I'd preempt that discussion by trying to guess
> what you have in mind and replying to it. Speculative email execution...
> 
> The SETUP_RNG_SEED parameter is used only during boot, and Linux takes
> pains to zero out its content after using. If a VM is migrated or
> copied, the RNG state is also migrated, just as is the case before
> SETUP_RNG_SEED. For that reason, Linux also has a "vmgenid" driver,
> which QEMU supports via `-device vmgenid,guid=auto`, which is an ACPI
> mechanism for telling the RNG to reseed under various migration
> circumstances. But this is merely complementary to SETUP_RNG_SEED, which
> is intended as a very simple mechanism for passing a seed at the
> earliest moment in boot, akin to DT's "rng-seed" node.
> 
> Hopefully this answers what I think you were going to ask, and sorry if
> it's a total non-sequitur.

It's not entirely what I was thinking about but it is interesting anyway 
so thanks for writing that.  Sorry it took some time to reply but these 
live migration issues are subtle and I wanted to be sure of what is and 
isn't a problem.

The issue with live migration is that the setup data changes from before 
to after the patches.  This means that a live migration exactly _in the 
middle_ of reading the Linux boot data could fail badly.  For example, 
you could migrate in the middle of reading the DTB, and it would be 
shifted by the ~50 bytes of the setup_data and seed.  The size would 
also not match so, even though probably things would mostly work if you 
place the seed last, that's not really optimal either.

Now I understand that this would be exceedingly unlikely or downright 
impossible, but the main issue is that, roughly speaking, we try to 
guarantee unchanged guest ABI on every execution with the appropriate 
command line options.  So the solution is to add a machine property 
(e.g. "-M linuxboot-seed=...") that allows enabling/disabling it, and 
then making it default to off with machine types like pc-i440fx-7.0 that 
never had the seed.

In turn this means that the "shape" of the linked list changes a bit and 
it's better to abstract the creation of the setup_data struct in a 
separate function.  And then you've got to move the various local 
variables of x86_load_linux into a struct for sharing.  As I said, it 
snowballs a bit, but I should be sending out patches later today.

As an aside, QEMU tends to only include code after Linux supports it, 
but it's in your rng tree so the timing is right; I'll queue the FDT 
ones for 7.1 since it's nice to have feature parity across all FDT boards.

Paolo

