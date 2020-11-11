Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC02AF4BE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:31:36 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcs5v-00056j-MB
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcs40-0003tM-Ss
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:29:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcs3y-0007Mt-SX
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605108573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICSH68e6Oaap+8fqOu0X8B4A5o/Yro1Ri75qG+5iN/M=;
 b=dZRweZQy4my+daRiQCKASmyVxpaM7HhRdIWatXLCm29oAxr2EIeye+d7BtWk3xdKzHQHGM
 tPdkEnlOd3WNjjn5X90JO3SJgHBpjfqrIeP/tmeJq99PmV1cvVDjmaTnSjBC6IIEe9vTtR
 /mjX4TQ7BrEOH/VCp92e2XP+8SXYcDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-2sNs2e2KMsCMChv_Ai-CfQ-1; Wed, 11 Nov 2020 10:29:27 -0500
X-MC-Unique: 2sNs2e2KMsCMChv_Ai-CfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E734E101F7DB
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:29:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A58BE5DA6A;
 Wed, 11 Nov 2020 15:29:25 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:29:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
Message-ID: <20201111152923.GD3898@merkur.fritz.box>
References: <20201111092423.GA3898@merkur.fritz.box>
 <20201111101407.GD906488@redhat.com>
 <20201111103550.GB3898@merkur.fritz.box>
 <30bdf162-5b29-6725-f5a5-fb5dcc85abee@redhat.com>
 <20201111125307.GC3898@merkur.fritz.box>
 <0471d35c-6fbc-c3e8-a2c3-b627a1ec2ece@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0471d35c-6fbc-c3e8-a2c3-b627a1ec2ece@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.2020 um 14:06 hat Paolo Bonzini geschrieben:
> On 11/11/20 13:53, Kevin Wolf wrote:
> > QDicts are one step closer to the final result, but would also have to
> > be processed separately as they need only half of the processing that
> > command line options need. Eventually, qobject_input_visitor_new_str()
> > is what we want to use to parse strings directly into QAPI objects, and
> > QDicts are only an internal intermediate result there.
> 
> To be clearer, the processing would look like this:
> 
> - both qemu_config_parse and qemu_read_config_file call a static function
> qemu_config_foreach
> 
> - qemu_config_foreach builds a QDict and passes it to a callback
> 
> qemu_read_config_file receives a callback argument from vl.c, while
> qemu_config_parse uses a default callback that does qemu_opts_create and
> qemu_opts_absorb_qdict.
> 
> The callback in vl.c does this:
> 
> 1) for a keyval-based non-mergeable option (e.g. -object) -> do
> qdict_crumple and store the QDict for later processing.
> 
> 2) for a keyval-based mergeable option (e.g. -M) -> do qdict_crumple and
> merge with previous command-line options using a new function keyval_merge

Ah, I wasn't even aware of this type of option, so thanks for mentioning
it here. (It makes sense to me.)

> 3) for non-keyval options -> forward to the default callback used by
> qemu_config_parse.
> 
> 
> Later on, keyval-based options are parsed into QAPI objects or QOM
> properties using qobject_input_visitor_new_keyval.

Yes, no question this is doable, it just requires some extra code for
each option instead of reusing something existing. But it's not too bad
as QDicts are at least slightly more natural for a QAPI based interface
than QemuOpts.

> > So while it's even uglier, maybe what we should do with -readconfig is
> > convert it back to strings and then run the result through the normal
> > command line processing? This would get rid of the special cases.
> 
> That would be more or less doable but there are two problems: 1) the
> -readconfig code is used for blkdebug too, so you would need some kind of
> callback anyway

Whether it's a callback or an iterator shouldn't make a big difference.
blkdebug can easily use either.

And whether the data is QemuOpts, QDict or a string shouldn't make much
of a difference either because it can just run a visitor on any of them
and get back the QAPI BlkdebugFoo types that it should be using anyway.

> 2) converting to strings is not entirely trivial due to e.g.
> different spelling between the "-boot" command line option and the
> "boot-opts" group.

Hm, where is the difference between both? The QEMU_OPTION_boot case
seems to just directly parse optarg into "boot-opts" with
qemu_opts_parse_noisily(), which should be the same as -readconfig does
with its input, no?

> > Both options are probably only hacks for the short term, so either way I
> > think I'd still prefer deprecating -readconfig now, in favour of command
> > line options as long as we don't have a QAPI based config file.
> 
> "Now" is a bit too late for 5.2.  I would like to deprecate "-set" for that
> matter too, but it's so obscure that I'm thinking of just dropping it in
> 6.0.

Even if we queue the -readconfig deprecation only for 6.0, that's still
fine. I just don't want to discuss one year from now how we should have
deprecated it long ago.

Kevin


