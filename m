Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B764267984B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:47:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIgN-0000PN-Fh; Tue, 24 Jan 2023 07:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pKIg9-0000Nj-SH
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:45:37 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pKIg8-00043h-5l
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:45:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AB0221890;
 Tue, 24 Jan 2023 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674564330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=stDpayr/qf7PRjWmUDXwF4Y4dHWePSHmZuIn1KPBt/E=;
 b=Fo5ZSBgxo8UHsoXW+1fH9ZvxPs370Ztu0PFXpOoLfFBqj/OitfTyDPE2S862jIoKAdYrIH
 A5hrdca8TpmulnVmErPn+YsvHi0t5YaahAgyVusC53PCJP+D7EubxiI4U5SEWcb2UNN7dO
 e1kusjHaFHvnq57AmlR+I7jqqfhA+dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674564330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=stDpayr/qf7PRjWmUDXwF4Y4dHWePSHmZuIn1KPBt/E=;
 b=JjiXKQa0pL/Jl9n4LSmnccEoTVIm01qoYodcjHBCB7RU2Bm/mOEpkTfOp/jAny7FLEuC6M
 VgINP0RiYDIIDVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C18DD139FB;
 Tue, 24 Jan 2023 12:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lGb8IOnSz2MRSAAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 24 Jan 2023 12:45:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests/qtest: Plug memory leaks in qtest_get_machines
In-Reply-To: <de042a7e-f9eb-8fe0-cad6-b3277e79b9c6@redhat.com>
References: <20230120194435.29796-1-farosas@suse.de>
 <77fcbf0a-0f9a-d3bc-c1cf-0ec3e21399c9@redhat.com> <877cxdcr5l.fsf@suse.de>
 <4dd2d0d8-d2a3-7636-a422-6b99b7e24e07@redhat.com> <87r0vleykh.fsf@suse.de>
 <de042a7e-f9eb-8fe0-cad6-b3277e79b9c6@redhat.com>
Date: Tue, 24 Jan 2023 09:45:27 -0300
Message-ID: <87v8kw5cew.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> On 23/01/2023 22.22, Fabiano Rosas wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>> 
>>> On 23/01/2023 14.32, Fabiano Rosas wrote:
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>>> On 20/01/2023 20.44, Fabiano Rosas wrote:
>>>>>> These leaks can be avoided:
>>>>>>
>>>>>>     759 bytes in 61 blocks are still reachable in loss record 56 of 60
>>>>>>        at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>>>        by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>>        by 0x4AA313E: g_strdup (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>>        by 0x12083E: qtest_get_machines (libqtest.c:1323)
>>>>>>        by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>>>        by 0x11556C: main (test-hmp.c:160)
>>>>>>
>>>>>>     992 bytes in 1 blocks are still reachable in loss record 57 of 60
>>>>>>        at 0x4034744: malloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
>>>>>>        by 0x4A88518: g_malloc (in /usr/lib64/libglib-2.0.so.0.7000.5)
>>>>>>        by 0x120725: qtest_get_machines (libqtest.c:1313)
>>>>>>        by 0x12098C: qtest_cb_for_every_machine (libqtest.c:1348)
>>>>>>        by 0x11556C: main (test-hmp.c:160)
> ...
>>> (Also, it's valgrind that you used, isn't it? - I wonder why it's
>>> complaining here at all since the pointer to the memory should still be
>>> valid at the end?)
>> 
>> valgrind is complaining about the memory not being explicitly freed at
>> any point. I guess "leak" was not the most precise term to use in the
>> commit message.
>
> How did you run valgrind? For me, it does not really complain about the 
> non-freed memory here since it is still reachable. The only difference that 
> I see is in the summary. Without your patch:
>
>      still reachable: 27,471 bytes in 152 blocks
>
> with your patch:
>
>      still reachable: 25,713 bytes in 88 blocks

valgrind --leak-check=full --show-leak-kinds=all

> ... but that IMHO doesn't really hurt, since the memory is not really 
> leaked, i.e. the memory usage won't increase during runtime here. So I fail 
> to see which problem you're really trying to solve here, could you please 
> elaborate?

You're right, its harmless. We could just not bother with it.

