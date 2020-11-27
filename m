Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE02C68B1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:28:04 +0100 (CET)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiffH-0008LB-OG
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kifd3-0006yk-HA
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:25:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kifcz-00006L-Qw
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:25:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606490740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvLDQ5+gnoMeBZl9WxWP5Pfz+I+IRwV3Azx/NQG38JE=;
 b=DxqKalkaleIv6COY21W0wYcw+AAt/i9Xd/wV3eLlPbJctcd8RAZw+uVAiwNGcdA9zFBLEy
 HXrgO/JvrYLIPL+rI2JAcweA3XDPSCwUmOtQnw32i+/bJV7iGSkxCBH1c3SYeNE7ncejqA
 UWgp3H/iSi82kXDaGTRd0eSfA/e+NM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-erjdYplQPJC9Vh4UdtFjuA-1; Fri, 27 Nov 2020 10:25:38 -0500
X-MC-Unique: erjdYplQPJC9Vh4UdtFjuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79C4D56C8A;
 Fri, 27 Nov 2020 15:25:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-250.ams2.redhat.com [10.36.113.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33AFB10023AE;
 Fri, 27 Nov 2020 15:25:36 +0000 (UTC)
Date: Fri, 27 Nov 2020 16:25:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: ImageInfo oddities regarding compression
Message-ID: <20201127152534.GC4736@merkur.fritz.box>
References: <87r1ofru4z.fsf@dusky.pond.sub.org>
 <20201127101405.GA1596141@redhat.com>
 <20201127103216.GA4736@merkur.fritz.box>
 <87ft4vq9c1.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ft4vq9c1.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 13:21 hat Markus Armbruster geschrieben:
> >> I fell down this (thankfully shallow) rabbit hole because we also have
> >> 
> >>     { 'enum': 'MultiFDCompression',
> >>       'data': [ 'none', 'zlib',
> >>                 { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> >> 
> >> I wonder whether we could merge them into a common type.
> 
> Looks like we could: current code would never report the additional
> value 'none'.  Introspection would show it, though.  Seems unlikely to
> cause trouble.  Observation, not demand.

Forgot to comment on this one...

Technically we could probably, but would it make sense? Support for
compression formats has to be implemented separately for both cases, so
that they currently happen to support the same list is more of a
coincidence.

If we ever add a third compression format to qcow2, would we add the
same format to migration, too, or would we split the schema into two
types again?

Kevin


