Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8F34508D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 21:17:02 +0100 (CET)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQyz-0002XW-EO
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 16:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lOQvs-0000TB-Hl
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 16:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lOQvn-0003ky-Ck
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 16:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616444021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Tjsy0TRG9F/748Z7nhr2t0JTajHETw6ZbWrsy8kovU=;
 b=cI7g+N8TiHChuGzP4o4Ox7Lm/V9/UVs670mo5Pn5UNvihBF4gwFyewYKJTJ7icoKOz4CgC
 GQNPbV2UKE13w5vL3aOyv/QwTzfW9fN7O6InmTZ+5tIjRb8PhZWZdtAgGRs//45xVT3T92
 qwkgzLFJhsCmoL3D0MfvR16MRlLkNmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-gK9ZrbZ7M4qd2tPiCPm4RQ-1; Mon, 22 Mar 2021 16:13:38 -0400
X-MC-Unique: gK9ZrbZ7M4qd2tPiCPm4RQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E82612A2;
 Mon, 22 Mar 2021 20:13:37 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-132.rdu2.redhat.com [10.10.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 799B41007606;
 Mon, 22 Mar 2021 20:13:27 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C9791220BCF; Mon, 22 Mar 2021 16:13:26 -0400 (EDT)
Date: Mon, 22 Mar 2021 16:13:26 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Virtio-fs] [External] Re: [RFC PATCH 0/9] Support for Virtio-fs
 daemon crash reconnection
Message-ID: <20210322201326.GH446288@redhat.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAJ+F1CLZ4VtgKp5fEdC70m22PgV2VHvRHunR-nPOWDnJPFvqqg@mail.gmail.com>
 <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
 <YFHUbEdszo4nursr@stefanha-x1.localdomain>
 <CAFQAk7ia5HsX0e4WBrhDtytGKnd5LsPrUSz9DJVFoo+ShDRP7Q@mail.gmail.com>
 <YFh45AUkh1OzbE6H@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YFh45AUkh1OzbE6H@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 virtio-fs@redhat.com, Xie Yongji <xieyongji@bytedance.com>,
 Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 11:00:52AM +0000, Stefan Hajnoczi wrote:
> On Wed, Mar 17, 2021 at 08:32:31PM +0800, Jiachen Zhang wrote:
> > On Wed, Mar 17, 2021 at 6:05 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> > I agreed with you that a virtiofsd must be launched by a software like
> > systemd. So we are planning to define more generic persist/restore
> > interfaces (callbacks). Then anyone can implement their own persist/restore
> > callbacks to store states to proper places.  And I think in the next
> > version we will implement default callbacks for the interfaces. Instead of
> > vhost-user messages, systemd's sd_notify(3) will be the default method for
> > storing fds, and several tmpfs files can be the default place to store the
> > shm regions.
> 
> Okay, great!
> 
> I was thinking about how to make the crash recovery mechanism reusable
> as a C library or Rust crate. The mechanism is a combination of:
> 1. sd_listen_fds(3) for restoring the fds on restart.
> 2. sd_notify(3) for storing the fds.
> 3. memfd or tmpfs for storing state (could be mmapped).
> 
> I'm not sure if there is enough common behavior to create a reusable API
> or if this is quite application-specific.

I am wondering what will happen for use cases where virtiofsd is running
inside a container (with no systemd inside containers).

Do container managers offer systemd like services to save and restore
state.

Vivek


