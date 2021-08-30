Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7E3FBE9C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:55:57 +0200 (CEST)
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpG0-0008FT-Bn
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKpCK-0005hI-R2
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKpCG-0002GO-8D
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630360322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SVQWlF5ZlhNdWDlLoeaGAIVdNamQKrduPRpmYO7kRJU=;
 b=iN5Ob9Gjuo3idyyA9Yzv4BlXGQ2hjQbcgKaQq52og60jh+9Evds8sBKGhc2AmeLiCab15K
 fsuVEI7EFOlm0hwbUsY5mazBk8J+ONZNA2hdB+6dL9Zl1uRO/E4ISk+t94o13oe2CRJOkK
 9BawHB9fwpBPZ3fcpWtPR7yloi1gwJs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-tbxJsWRoOR6Nurp_UkZUyg-1; Mon, 30 Aug 2021 17:51:58 -0400
X-MC-Unique: tbxJsWRoOR6Nurp_UkZUyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so493056wmr.9
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SVQWlF5ZlhNdWDlLoeaGAIVdNamQKrduPRpmYO7kRJU=;
 b=Ba6956XycJRELhC3Gpb5IMfMwuuapmg9Jupz7TlrP/u7p0KarpGECNFjOf41OhDeX8
 2liDthkgV6+0d7dzboRX5rQJ6m1GtiJbTo250KVmX65RNdO//1Dkpg/6wUAp6Xd2L73f
 6u1cel7be0g8ddu9ZIiCGThDHx28m19p4lyJw4kT0pSThQr1g319eZxA22+V+LXv3d0X
 lCanIWbucS1sLSZbxan29nWID/AY33HWHel4NjYObQyOFjiSQ2ymOj2JrKiQyQmsXbKR
 WKzF8WG0IK5E3kkCGpNKdNjJ+cLt2kwznUGJXy4CrbbWsP+4ZICoDHk2Ab+n7A+cgVpH
 5g1g==
X-Gm-Message-State: AOAM531BQx7SxRO1Rc7IMeBmA1FCUBiOGZ9CPuEpfqyyTAMsIgsi0iVv
 Pi1dadV25vC8bS9YEQqDDZrxBPVXVLosQJagyr42P3phgeRiD8j1Uae5FLHXgcbfh5UkW0m0Ele
 hKhtnvn0AeYQEM+E=
X-Received: by 2002:a1c:a793:: with SMTP id q141mr983685wme.157.1630360317292; 
 Mon, 30 Aug 2021 14:51:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHvqkzyIcQC2u+Rf7dUUuwPPaiXHu91O/OaywPG/fmOcvbSDEkvFL8kPdTiXz0163VAHUYqQ==
X-Received: by 2002:a1c:a793:: with SMTP id q141mr983673wme.157.1630360317130; 
 Mon, 30 Aug 2021 14:51:57 -0700 (PDT)
Received: from redhat.com ([2.55.138.60])
 by smtp.gmail.com with ESMTPSA id a129sm719722wme.14.2021.08.30.14.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 14:51:56 -0700 (PDT)
Date: Mon, 30 Aug 2021 17:51:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "eblake@redhat.com" <eblake@redhat.com>
Subject: Re: [PATCH 1/2] storage-daemon: add opt to print when initialized
Message-ID: <20210830175137-mutt-send-email-mst@kernel.org>
References: <20210827164954.13951-1-raphael.norwitz@nutanix.com>
 <20210827185148.m6lvdrceygr6iz6y@redhat.com>
 <20210830155611.GA23709@raphael-debian-dev>
 <20210830160535.e65icwcf4bbvq333@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210830160535.e65icwcf4bbvq333@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 11:05:35AM -0500, eblake@redhat.com wrote:
> On Mon, Aug 30, 2021 at 03:56:16PM +0000, Raphael Norwitz wrote:
> > On Fri, Aug 27, 2021 at 01:51:48PM -0500, eblake@redhat.com wrote:
> > > On Fri, Aug 27, 2021 at 04:50:35PM +0000, Raphael Norwitz wrote:
> > > > This change adds a command line option to print a line to standard out
> > > > when the storage daemon has completed initialization and is ready to
> > > > serve client connections.
> > > > 
> > > > This option will be used to resolve a hang in the vhost-user-blk-test.
> > >  
> > > Doesn't the existing --pidfile already serve the same job?  That is,
> > > why not fix vhost-user-blk-test to take advantage of the pid-file
> > > creation rather than output to stdout as evidence of when the storage
> > > daemon is up and running?
> > > 
> > > Therefore, I don't think we need this patch.
> > >
> > 
> > Sure - that make sense. I didn't use the pid-file because I didn't want to
> > risk leaving junk on the filesystem if the storage-daemon crashed.
> 
> Ideally, storage-daemon doesn't crash during the test.  But even if it
> does, we should still be able to register which files will be cleaned
> up while exiting the test (if they exist), regardless of whether the
> test succeeded or failed, because we have control over the pidfile
> name before starting storage-daemon.  Put another way, the task of
> cleaning up a pidfile during a test should not be a show-stopper.
> 
> [Side note: A long time ago, there were patches submitted to make the
> iotests ./check engine run EVERY test in its own subdirectory, so that
> cleaning up all files created by the test was trivial: nuke the
> directory.  It also has the benefit that for debugging a failing test,
> you merely pass an option to ./check that says to not nuke the
> directory.  But it did not get applied at the time, and we have had
> enough changes in the meantime that reinstating such a useful patch
> would basically be work from scratch at this point]


Yea I had that thought too. Pity it got lost.

> > 
> > I'll send a V2 using pid-file without this change.
> 
> Thanks, looking forward to it.
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org


