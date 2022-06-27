Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E9755BA91
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 16:45:56 +0200 (CEST)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pzv-0005XW-BG
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 10:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o5pyY-0004lL-W1
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:44:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o5pyW-0004hH-7A
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 10:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656341067;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0xaFchRx8C/zcFGAcw9vcjYkLHrKoJdNjLIIBmXzB4=;
 b=b+9s8rlph9OgZUPvj1TqA/wPAfqcCtJhekq7cRFWZN9kVu5gsfF1S2LscFNrzeXUI7LhZB
 1YSwTTc+/7qXENK5mjXqoYKvNnthJXicdIYcJHGQVQXRjtc10i72GMMUqYgBSLvsIV3EQo
 LiH78i3bU4oSaNDFgaqGQLBrqjVYgpM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-tgmtyR_3NmuuKsdmhSJ94w-1; Mon, 27 Jun 2022 10:44:26 -0400
X-MC-Unique: tgmtyR_3NmuuKsdmhSJ94w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02838811E9B;
 Mon, 27 Jun 2022 14:44:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1DA415F5E;
 Mon, 27 Jun 2022 14:44:24 +0000 (UTC)
Date: Mon, 27 Jun 2022 15:44:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrnCRR5r9x6Io8Ud@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrN381XWrhTFStlp@xz-m1.local>
 <YrQot90/2gzdh/gt@redhat.com> <YrS7YHglHhhDMvbP@xz-m1.local>
 <YrnBtWrjA5D8TlTP@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrnBtWrjA5D8TlTP@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Mon, Jun 27, 2022 at 03:41:57PM +0100, Daniel P. Berrangé wrote:
> On Thu, Jun 23, 2022 at 03:13:36PM -0400, Peter Xu wrote:
> > On Thu, Jun 23, 2022 at 09:47:51AM +0100, Daniel P. Berrangé wrote:
> > > > Hmm, when I wanted to run the whole bunch of the migration-test again I
> > > > found that precopy tls test hangs (/x86_64/migration/precopy/unix/tls/psk).
> > > > Though for this time it also hangs for me even with the master branch, so
> > > > maybe not anything wrong with this specific pull req but still something
> > > > needs fixing..
> > > 
> > > That pre-existing test has been runnnig by default in CI for a while
> > > now, under different OS builds, so I'm surprised. Is there anything
> > > especially unusual / different about your setup that could explain
> > > why you see hang that we don't get anywhere else ?
> > 
> > TL;DR: I think it's not run in CI?
> > 
> > Please see ufd_version_check(), as when uffd not detected we'll skip the
> > whole thing.
> 
> Our CI should be passing that check for the private runners eg
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2641920502
> 
> shows us running 35 tests
> 
>   2/178 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test         OK             65.57s   35 subtests passed
> 
> but yes, the container based jobs are all skipping
> 
> > 
> > We really need to apply this patch, soon-ish..
> > 
> >   https://lore.kernel.org/all/20210615175523.439830-2-peterx@redhat.com/

BTW, I'd suggest re-sending that patch to bump it up in the inbox as
its a year old at this point.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


