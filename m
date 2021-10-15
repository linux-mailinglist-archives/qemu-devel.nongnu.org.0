Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516C42EE2B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:52:46 +0200 (CEST)
Received: from localhost ([::1]:34044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJtN-0007J5-6N
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mbJqH-0003fQ-2L
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:49:33 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:43172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mbJqF-0005gI-An
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:49:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE3B61F770;
 Fri, 15 Oct 2021 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634291369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4cTC7jFMB9pFq9BX74v5xEW5Aitxn1Ul55/PbBe+XU=;
 b=PRw4iCpQAUt6NloZ5lqJ3N33364c20jX2eQT0vIFEtTwfgwuPsop2yRSdt6sHbL8icZhvl
 g6vzQ7NPabjfsBkWdxmuoBVF14qLbha0DfdcF3ICWA430OMdP3lXN4QdetrAIpbfhfw6LR
 GWoxWZDh9gsbW3cyK9+XEUTdGXrRIpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634291369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4cTC7jFMB9pFq9BX74v5xEW5Aitxn1Ul55/PbBe+XU=;
 b=j866S8YIuLNptJjKUt4dt8wVKETTsHQ5AqQVogd1aBAf6N85xxUoUwLiR/znJ7N2JVYeGT
 23lfrBemzKFYpYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4E5F13A78;
 Fri, 15 Oct 2021 09:49:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RBPsK6lOaWGMPgAAMHmgww
 (envelope-from <lma@suse.de>); Fri, 15 Oct 2021 09:49:29 +0000
MIME-Version: 1.0
Date: Fri, 15 Oct 2021 17:49:29 +0800
From: lma <lma@suse.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/3] Postcopy migration: Add userfaultfd- user-mode-only
 capability
In-Reply-To: <YWk7t8Za3l4bhGIB@t490s>
References: <20211014091551.15201-1-lma@suse.com> <YWjAqX13PYhBgbVh@t490s>
 <7c0161fab24b06fa249061780a7f30d4@suse.de> <YWkb2rrrkMLC8BwM@t490s>
 <b17650b7db7bece420f8f1ad2aaa651a@suse.de> <YWk7t8Za3l4bhGIB@t490s>
User-Agent: Roundcube Webmail
Message-ID: <e770ceb9a763a8c921a9f3c96de43c3e@suse.de>
X-Sender: lma@suse.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=lma@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021-10-15 16:28，Peter Xu 写道：
> On Fri, Oct 15, 2021 at 04:16:15PM +0800, lma wrote:
>> 在 2021-10-15 14:12，Peter Xu 写道：
>> > On Fri, Oct 15, 2021 at 01:38:06PM +0800, lma wrote:
>> > > 在 2021-10-15 07:43，Peter Xu 写道：
>> > > > On Thu, Oct 14, 2021 at 05:15:48PM +0800, Lin Ma wrote:
>> > > > > Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE
>> > > > > capability)
>> > > > > must pass UFFD_USER_MODE_ONLY to userfaultd in case
>> > > > > unprivileged_userfaultfd
>> > > > > sysctl knob is 0.
>> > > > > Please refer to https://lwn.net/Articles/819834/ and the kernel
>> > > > > commits:
>> > > > > 37cd0575 userfaultfd: add UFFD_USER_MODE_ONLY
>> > > > > d0d4730a userfaultfd: add user-mode only option to
>> > > > > unprivileged_userfaultfd sysctl knob
>> > > > >
>> > > > > This patch set adds a migration capability to pass UFFD_USER_MODE_ONLY
>> > > > > for postcopy migration.
>> > > >
>> > > > Then it's at least no KVM, no vhost, am I right?  Could I ask is there a
>> > > > real
>> > > > user behind this?  Thanks,
>> > >
>> > > Well, The "user-mode-only" has nothing to do with qemu's user-mode
>> > > emulation.
>> >
>> > I didn't follow why you thought my question was about "user-mode
>> > emulation"..
>> Sorry about the misunderstanding.
> 
> No worry. :)
> 
>> 
>> > To ask in another way: after this new cap set, qemu will get a SIGBUS
>> > and VM
>> > will crash during postcopy migrating as long as either KVM or
>> > vhost-kernel
>> > faulted on any of the missing pages, am I right?
>> 
>> Oops...Yes, you're right. It indeed casues qemu crash on destination 
>> due to
>> fault on missing pages.
>> This patch set and my thought about introducing this cap to qemu are 
>> wrong.
> 
> I can't say it's wrong, it's just that it may need some more thoughts 
> on how to
> make it applicable.
> 
> We'll need to make sure no kernel module will access guest pages, 
> however I
> think it'll be so hard to guarantee.  For example, there can be some 
> read()
> syscall from qemu initiated with guest pages passed in as the buffer 
> (so the
> kernel will fill up the buffer when syscall returns), then if that page 
> is
> missing on dst then that'll also trigger a kernel page fault and it'll 
> crash
> qemu too even if no kvm/vhost-kernel is used.  We'll need to dig out 
> everything
> like that.

Yeah, It's hard to avoid pf in kernel completely.

> The other thing is about my original question on whether it'll be 
> useful in any
> way, and I just worry it won't help anyone, because afaiu any real user 
> of
> migration (I believe it's majorly public/private cloud) will definitely 
> at
> least be kvm based as tcg could be too slow.  Then they'll simply 
> enable the
> unprivileged uffd on the hosts, since even if it's unsafe it'll be at 
> least as
> unsafe as before unprivileged_userfaultfd is introduced.

It seems that this capability is useless for qemu/kvm so far :-)

Thanks for your information!

Lin

