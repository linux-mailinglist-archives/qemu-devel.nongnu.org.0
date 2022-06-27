Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27B55BA90
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:43:42 +0200 (CEST)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pxl-0002ZH-J4
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o5pwH-0000ZF-VH
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:42:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o5pwE-0004PI-ML
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656340925;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kC5CwercctMrXA2SDXLmR69AMRRI/5Vto/0NUI3KCAg=;
 b=R3gP0CDAVaksD7YNcE13SF6c+cYgBp+jivzh/6bUaLFUQ6azgRpIwAQBErJURnFrLYV8Gt
 l5KwbqZUg3GsbqrjrX6wRCLrBMQUyp8yOi1IKRVxROl/z0IR7z4yhfmgEiYlsxU0fwH4hf
 BZuGOngKhOky1PCi+WA98AScntlcd7c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-RurcjMiNNaezghzLyrs_8w-1; Mon, 27 Jun 2022 10:42:02 -0400
X-MC-Unique: RurcjMiNNaezghzLyrs_8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 181603C11741;
 Mon, 27 Jun 2022 14:42:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 481DC2026D64;
 Mon, 27 Jun 2022 14:42:00 +0000 (UTC)
Date: Mon, 27 Jun 2022 15:41:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrnBtWrjA5D8TlTP@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrN381XWrhTFStlp@xz-m1.local>
 <YrQot90/2gzdh/gt@redhat.com> <YrS7YHglHhhDMvbP@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrS7YHglHhhDMvbP@xz-m1.local>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23, 2022 at 03:13:36PM -0400, Peter Xu wrote:
> On Thu, Jun 23, 2022 at 09:47:51AM +0100, Daniel P. Berrangé wrote:
> > > Hmm, when I wanted to run the whole bunch of the migration-test again I
> > > found that precopy tls test hangs (/x86_64/migration/precopy/unix/tls/psk).
> > > Though for this time it also hangs for me even with the master branch, so
> > > maybe not anything wrong with this specific pull req but still something
> > > needs fixing..
> > 
> > That pre-existing test has been runnnig by default in CI for a while
> > now, under different OS builds, so I'm surprised. Is there anything
> > especially unusual / different about your setup that could explain
> > why you see hang that we don't get anywhere else ?
> 
> TL;DR: I think it's not run in CI?
> 
> Please see ufd_version_check(), as when uffd not detected we'll skip the
> whole thing.

Our CI should be passing that check for the private runners eg

https://gitlab.com/qemu-project/qemu/-/jobs/2641920502

shows us running 35 tests

  2/178 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test         OK             65.57s   35 subtests passed

but yes, the container based jobs are all skipping

> 
> We really need to apply this patch, soon-ish..
> 
>   https://lore.kernel.org/all/20210615175523.439830-2-peterx@redhat.com/
> 
> I can easily reproduce the hang on two x86_64 hosts I have, with current
> master commit (2b049d2c8dc01de750410f8f1a4eac498c04c723).  Or am I the only
> one?
> 
> So I think it also means we don't run migration unit tests on non-Linux
> OSes for sure because uffd was never there, meanwhile it also requires
> (mostly) root privilege even for Linux hosts so if the sysctl knob was not
> set properly (on sysctl.unprivileged_userfaultfd=1) the test can be skipped
> too.

It appears Fedora at least set unprivileged_userfaultfd=1 by default,
hence why I've never seen it skipped.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


