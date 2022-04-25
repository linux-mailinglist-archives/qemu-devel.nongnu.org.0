Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D97C50EB69
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 00:06:45 +0200 (CEST)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj6qy-0005CM-0y
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 18:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nj6or-0004EQ-H9
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:04:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nj6oo-00031U-Ix
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 18:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650924270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gsBaHGrNJ9kyiRZniutDwGHGIBab4hTeTCFxe/6fp5k=;
 b=be6EcsYn7rSC2BOHNWahs5HxP05VGBzb740RqCOFsG3QSqvFTGFeG8jBnOXpc1/eIP/9/D
 vIUYkkzdOjxJPmQe5U3IWr6g/dKrLcbjulYyevsdeM/6arE/ri58XteZkeB1+VFKP54A2q
 8pwm46KjPO/VczWgA1DKiOLmKznJuYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-PxXEkmpxPLmTHd5EZlyqDw-1; Mon, 25 Apr 2022 18:04:26 -0400
X-MC-Unique: PxXEkmpxPLmTHd5EZlyqDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54CEE18E536D;
 Mon, 25 Apr 2022 22:04:26 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E62552166B2F;
 Mon, 25 Apr 2022 22:04:16 +0000 (UTC)
Date: Mon, 25 Apr 2022 17:04:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] Only advertise aio=io_uring if support is actually
 available
Message-ID: <20220425220414.seud4bu4kojxeajd@redhat.com>
References: <20220421165048.12608-1-dmueller@suse.de>
 <20220421192755.eksb7rfapjsw7qmb@redhat.com>
 <20220422203046.dd6mc36buja3eusm@redhat.com>
 <YmaDrJF95PnDP+IU@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmaDrJF95PnDP+IU@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Dirk =?utf-8?Q?M=C3=BCller?= <dmueller@suse.de>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 12:19:08PM +0100, Daniel P. Berrangé wrote:
> On Fri, Apr 22, 2022 at 03:30:46PM -0500, Eric Blake wrote:
> > On Thu, Apr 21, 2022 at 02:27:55PM -0500, Eric Blake wrote:
> > > On Thu, Apr 21, 2022 at 06:50:48PM +0200, Dirk Müller wrote:
> > > > Change --help output for aio option to only list the aio backend options that
> > > > are actually available. io_uring is an optional, linux only backend
> > > > option so hide it for cases where it isn't there.
> > > 
> > > As pointed out by Dan, this commit message is not quite accurate.  It
> > > hides only one of the two conditional options, but 'native' is also a
> > > Linux-only optional backend (CONFIG_LINUX_AIO).
> > 
> > Stepping back a bit - we already said that making --help
> > machine-parseable is a non-goal, and so the intent of this patch is
> > for human readers.  But adding an #ifdef ladder to show all 4 possible
> > combinations gets hairy; adding another option turns it into 8
> > combinations.  Is there a better way
> > 
> > What if we just document ALL strings possible in at least one build
> > (no #ifdef ladder in the help text), but add --aio=help as a way to do
> > a runtime list of which aio modes are understood by THIS build?  It
> > would match how we have --device=help for qemu proper, and may even be
> > able to reuse some of that framework code (for parsing out when help
> > is requested).
> 
> Did you literally mean '--aio=help' ?  'aio' is just an option
> for disks, and I don't think we want new top levelk options. So
> would have to be '-drive ....,aio=help', or '--blockdev ....aio=help'
> the latter gets tricky with nested json syntax though, so not sure
> it is nicer.

For qemu-nbd, it literally is:

      --aio=MODE            set AIO mode (native, io_uring or threads)

so adding --aio=help is already a top-level option there.  But for
other utilities, you are right that it is a per-device option, and not
a top-level thing (qemu-nbd is weird because it exposes exactly one
device).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


