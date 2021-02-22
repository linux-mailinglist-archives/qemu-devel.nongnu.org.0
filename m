Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A714321B03
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:15:52 +0100 (CET)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECwB-0003tm-6P
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lECu3-00026e-O0
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:13:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lECu2-0001Bq-3s
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:13:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614006816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cY8YIfaYQ1WDKdLu8rqTYk0ShExwbqbrLAUm0OwmLdU=;
 b=iyWB/E6t+UHLI9Q3rPwZTEADcVy0HWC/KilXZ1yKHVLL+R0VoIA8ztgxvQbboecCwBgk5Y
 UqgrhW9Hut3MrJ64ub8eVEEv+VoRcffeZCIpagF4ZPTzq28wh0oufUrD+MoUFOCxceY+8f
 tfkkHfoCjkxTrH0nd+Wsg3hO/LyL97A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-DB10Lh_rOAOw7vhJDnzoJQ-1; Mon, 22 Feb 2021 10:13:34 -0500
X-MC-Unique: DB10Lh_rOAOw7vhJDnzoJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04FDC106BAF2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 15:13:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE21D6091A;
 Mon, 22 Feb 2021 15:13:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 28A771800399; Mon, 22 Feb 2021 16:13:32 +0100 (CET)
Date: Mon, 22 Feb 2021 16:13:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210203163202.GF241524@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > TODO:
> > Enabling modular tracepoints via -trace cmd line doesn't work yet.
> > Guess we need to store the list somewhere for later re-processing.
> > Error handling is tricky, specifically the "tracepoint doesn't exist"
> > error.  Suggestions / ideas are welcome.
> 
> Two ideas:
> 
> Global trace event name list
> ----------------------------
> Build *some* global information about all trace events, including
> modules, into the main QEMU binary. For example, generate an array of
> all trace event names so QEMU can always print an error if a
> non-existent trace event name is used. (This is similar to the
> trace-events-all file, which is a global list of all trace events.)
> 
> Module name prefixes
> --------------------
> Allow an optional module/group prefix like qxl:my_trace_event. When the
> user says:
> 
>   --trace qxl:my_trace_event
> 
> QEMU knows that this trace event belongs to the "qxl" module/group. It
> will not attempt to load it until the qxl module registers itself.
> 
> If "my_trace_event" doesn't exist in the qxl module:
> 1. If the qxl module is not loaded we don't hit an error. Nevermind.
> 2. When the qxl module is loaded pending events are resolved and an
>    error is printed.

Finally found the time to look at this again... 

So, we already have a "group".  Which is basically the sub-directory of
the trace-events file right now, and it seems to be mostly a build system
thing.  We get many small lists instead of one huge, but there seems to
be no other effect.  We could change that though, by giving each group
an (optional?) prefix.

There also is a probe prefix, apparently used by dtrace only.  Not sure
how to deal with that.  It prefix is qemu-<target-type>-<target-name>.
Giving qemu modules its own dtrace prefix looks sensible to me.  That
would probably something like "qemu-module-<name>".

take care,
  Gerd


