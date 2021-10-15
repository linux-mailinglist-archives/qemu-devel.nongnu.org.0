Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE342E872
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 07:40:20 +0200 (CEST)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFx5-0005jx-Vx
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 01:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mbFv2-00051b-LG
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 01:38:12 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:53776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mbFv0-0007gb-3P
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 01:38:12 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2D9721969;
 Fri, 15 Oct 2021 05:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634276286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=On2XPk4f/qSBpclEHuEOCSgzh1aS796y+eR37yE5W08=;
 b=xXjWz2xoCNC0nJl8h13sKE0iwgjxtoqDZ5/nTnvnGqcf97+Xs6s6qG94+RdDcJMD86vAtw
 Cue4IusdC2FAV977jTKehDnQERrZVOqmMeR0BFpcS1615Jgpo95nrv3IInfp323jEkN4BT
 DZCp2aHdPa1+1KxreuNXFnxGCe2azng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634276286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=On2XPk4f/qSBpclEHuEOCSgzh1aS796y+eR37yE5W08=;
 b=bYPMRT6HoOZEk8LG0PtnoVwyJmBP76p2N8aru05zVpkwvq50hPhFGe+p+k0zqutKbFd6WP
 5ER1fM7oJEmqvFDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C895413481;
 Fri, 15 Oct 2021 05:38:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5X63ML4TaWHIQAAAMHmgww
 (envelope-from <lma@suse.de>); Fri, 15 Oct 2021 05:38:06 +0000
MIME-Version: 1.0
Date: Fri, 15 Oct 2021 13:38:06 +0800
From: lma <lma@suse.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 0/3] Postcopy migration: Add userfaultfd- user-mode-only
 capability
In-Reply-To: <YWjAqX13PYhBgbVh@t490s>
References: <20211014091551.15201-1-lma@suse.com> <YWjAqX13PYhBgbVh@t490s>
User-Agent: Roundcube Webmail
Message-ID: <7c0161fab24b06fa249061780a7f30d4@suse.de>
X-Sender: lma@suse.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lma@suse.de;
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, lma@suse.de,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021-10-15 07:43，Peter Xu 写道：
> On Thu, Oct 14, 2021 at 05:15:48PM +0800, Lin Ma wrote:
>> Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE 
>> capability)
>> must pass UFFD_USER_MODE_ONLY to userfaultd in case 
>> unprivileged_userfaultfd
>> sysctl knob is 0.
>> Please refer to https://lwn.net/Articles/819834/ and the kernel 
>> commits:
>> 37cd0575 userfaultfd: add UFFD_USER_MODE_ONLY
>> d0d4730a userfaultfd: add user-mode only option to 
>> unprivileged_userfaultfd sysctl knob
>> 
>> This patch set adds a migration capability to pass UFFD_USER_MODE_ONLY
>> for postcopy migration.
> 
> Then it's at least no KVM, no vhost, am I right?  Could I ask is there 
> a real
> user behind this?  Thanks,

Well, The "user-mode-only" has nothing to do with qemu's user-mode 
emulation.

The unprivileged_userfaultfd sysctl knob controls whether unprivileged 
users can use the userfaultfd system calls.
  set it to 1 to allow unprivileged users to use the userfaultfd system 
calls.
  set it to 0 to restrict userfaultfd to only privileged users (with 
SYS_CAP_PTRACE capability).

If host's unprivileged_userfaultfd sysctl knob is 0(The default value of 
this knob is changed to 0 since host kernel v5.11):
Qemu must pass the UFFD_USER_MODE_ONLY flag when creating userfaultfd 
object for postcopy migration in case qemu runs as unprivileged user.

Before host kernel v5.11, If host's unprivileged_userfaultfd sysctl knob 
is 0, Then postcopy migration is not allowed in case qemu runs as 
unprivileged user.

Thanks,
Lin

