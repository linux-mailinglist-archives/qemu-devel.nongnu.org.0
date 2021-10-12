Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5473142A443
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:21:59 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGn8-0006Zj-6m
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maGHw-0007IK-Ab
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1maGHu-000494-Mj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634039381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p8+bfNwTS/Sj1m2ZFxEhNggdvYM8bxlcKl5k7MkEvmY=;
 b=OZigl735xI6JSFDy7ojxIMspa+9N6dBlaPop78NxnAm2rh/AyBYg3wfbO6WoSZ4PxNd27z
 IemmaUR9iKmvf9wvqv0ylQJzHcqGPB4oFZyk34ux0KUUT69dJroXKweasd0EnP3V7i5vMi
 P2BRSB4/TTeWijqBao8tM0oZeuMWAYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-vAhHIgJQNw28qK4azzuJQw-1; Tue, 12 Oct 2021 07:49:38 -0400
X-MC-Unique: vAhHIgJQNw28qK4azzuJQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EAF8802588;
 Tue, 12 Oct 2021 11:49:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4F7019C79;
 Tue, 12 Oct 2021 11:49:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D611113865F; Tue, 12 Oct 2021 13:49:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/5] trace: inroduce qmp: trace namespace
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
Date: Tue, 12 Oct 2021 13:49:22 +0200
In-Reply-To: <20210923195451.714796-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 23 Sep 2021 22:54:46 +0300")
Message-ID: <87czoa8nul.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: libvir-list@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, pbonzini@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Hi all!
>
> We have handle_qmp_command and qmp_command_repond trace points to trace
> qmp commands. They are very useful to debug problems involving
> management tools like libvirt.
>
> But tracing all qmp commands is too much.
>
> Here I suggest a kind of tracing namespace. Formally this series adds a
> trace points called qmp:<some-command> for every command, which may be
> enabled in separate like
>
>   --trace qmp:drive-backup
>
> or by pattern like
>
>   --trace qmp:block-job-*
>
> or similarly with help of qmp command trace-event-set-state.
>
> This also allows to enable tracing of some qmp commands permanently
>  (by downstream patch or in libvirt xml). For example, I'm going to
> enable tracing of block job comamnds and blockdev-* commands in
> Virtuozzo. Qemu logs are often too empty (for example, in comparison
> with Libvirt), logging block jobs is not too much but will be very
> helpful.

What exactly is traced?  Peeking at PATCH 5... looks like it's input
that makes it to qmp_dispatch() and command responses, but not events.

Fine print on "input that makes it to qmp_dispatch()":

* You trace right before we execute the command, not when we receive,
  parse and enqueue input.

* Corollary: input with certain errors is not traced.

* You don't trace the input text, you trace the unparsed parse tree.

All fine, I presume.

Existing tracepoints in monitor/qmp.c, and what information they send
(inessential bits omitted for clarity):

* handle_qmp_command

  Handling a QMP command: unparsed parse tree

  Fine print, safe to ignore:

  - Out-of-band commands will be executed right away, in-band commands
    will be queued.  Tracepoints monitor_qmp_in_band_enqueue and
    monitor_qmp_in_band_dequeue provide insight into that.

  - This also receives and queues parse errors, without tracing them.
    Tracepoint monitor_qmp_err_in_band traces them as they are dequeued.

* monitor_qmp_cmd_in_band

  About to execute in-band command: command ID, if any

* monitor_qmp_cmd_out_of_band

  About to execute out-of-band command: command ID, if any

* monitor_qmp_respond

  About to send command response or event: QObject

For input, --trace qmp:* is like --trace handle_qmp_command, except it
traces late rather than early.

For output, --trace qmp:* is like --trace monitor_qmp_respond less
events.

The main improvement over existing tracepoints seems to be the ability
to filter on command names.

To get that, you overload the @name argument of QMP command
trace-event-set-state.  In addition to the documented meaning "Event
name pattern", it also has an alternate, undocumented meaning "QMP
command name pattern".  The "undocumented" part is easy enough to fix.
However, QMP heavily frowns on argument values that need to be parsed.
But before we discuss this in depth, we should decide whether we want
the filtering feature.

Management applications can enable and disable tracing as needed, but
doing it all in QEMU might be more convenient or robust.

Libvirt logs all QMP traffic.  I doubt it'll make use of your filtering
feature.  Cc'ing libvir-list just in case.

Another way to log all traffic is to route it through socat -x or
similar.

Opinions?


