Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3410B5FED6F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:48:23 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJAs-0001p8-0e
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ojIuN-0000ka-6w
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ojIuK-0002Ef-Rl
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665747075;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dca/ONSSCQfcCJorZDmmvEGXwD0D+h9s79Vz+dXhsto=;
 b=h6cR1LWGImO334FBu7N0NMvl0lXyFNNegamQwoQ9vI5YwTpQJ/gCxYJjBbWqOaZ28QMoDi
 1t/JHfCb1/eLoFTy8OJAi1yR32cQ1BkK/NPRm28JBl8WoK+6QMkJJsompu4n2DKiOWFM/P
 lzVE7f5NKk5/+4d0if6d1T/CE+aLEco=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-08gwYXacOpivoyE0QpjFaQ-1; Fri, 14 Oct 2022 07:31:14 -0400
X-MC-Unique: 08gwYXacOpivoyE0QpjFaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06DBA185A792;
 Fri, 14 Oct 2022 11:31:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77C8B207B31A;
 Fri, 14 Oct 2022 11:31:12 +0000 (UTC)
Date: Fri, 14 Oct 2022 12:31:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, michael.roth@amd.com,
 vsementsov@yandex-team.ru, marcandre.lureau@gmail.com
Subject: Re: [PATCH v3] qapi/qmp: Add timestamps to qmp command responses
Message-ID: <Y0lIfTS4/5UMItkk@redhat.com>
References: <20221011153408.495401-1-den-plotnikov@yandex-team.ru>
 <87tu47vkdx.fsf@pond.sub.org> <Y0gxfqMXi3gLH/3H@redhat.com>
 <8735bqu4ym.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8735bqu4ym.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 14, 2022 at 11:31:13AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Oct 13, 2022 at 05:00:26PM +0200, Markus Armbruster wrote:
> >> Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:
> >> 
> >> > Add "start" & "end" time values to qmp command responses.
> >> 
> >> Please spell it QMP.  More of the same below.
> >> 
> >> >
> >> > These time values are added to let the qemu management layer get the exact
> >> > command execution time without any other time variance which might be brought by
> >> > other parts of management layer or qemu internals. This is particulary useful
> >> > for the management layer logging for later problems resolving.
> >> 
> >> I'm still having difficulties seeing the value add over existing
> >> tracepoints and logging.
> >> 
> >> Can you tell me about a problem you cracked (or could have cracked) with
> >> the help of this?
> >
> > Consider your QMP client is logging all commands and replies in its
> > own logfile (libvirt can do this). Having this start/end timestamps
> > included means the QMP client log is self contained.
> 
> A QMP client can include client-side timestamps in its log.  What value
> is being added by server-side timestamps?  According to the commit
> message, it's for getting "the exact command execution time without any
> other time variance which might be brought by other parts of management
> layer or qemu internals."  Why is that useful?  In particular, why is
> excluding network and QEMU queueing delays (inbound and outbound)
> useful?

Lets, say some commands normally runs in ~100ms, but occasionally
runs in 2secs, and you want to understand why.

A first step is understanding whether a given command itself is
slow at executing, or whether its execution has merely been
delayed because some other aspect of QEMU has delayed its execution.
If the server timestamps show it was very fast, then that indicates
delayed processing. Thus instead of debugging the slow command, I
can think about what scenarios would be responsible for the delay.
Perhaps a previous QMP command was very slow, or maybe there is
simply a large volume of QMP commands backlogged, or some part of
QEMU got blocked.

Another case would be a command that is normally fast, and sometimes
is slower, but still relatively fast. The network and queueing side
might be a significant enough proportion of the total time to obscure
the slowdown. If you can eliminate the non-execution time, you can
see the performance trends over time to spot the subtle slowdowns
and detect abnormal behaviour before it becomes too terrible.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


