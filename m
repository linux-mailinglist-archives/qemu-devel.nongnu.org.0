Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A0680973
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:28:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQRh-00044K-TX; Mon, 30 Jan 2023 04:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMQRf-00043v-2k
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMQRc-00062P-OQ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675070839;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mo8Rj0bbiRTGMHwGl/aBCyaZ2MzYHnyuYY8wVZeQb3M=;
 b=V7YduH+ueLXgfnGQ04Cdar/2ZR+lWtMaJnS4dmnkG6jPHPxcbydF3p5g1UYNQnDtU1doBX
 +DCfMXMvPvdr2uPBzUO+8h7GX65HZm/4+gVktzu9E7EOO4RiqbXv7P3oMTbQZapJEbFBfj
 YkU8GQoE1CwrXUHjekWzBef+Q05XQz4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-0IL9D-bvONmoOiUQR7Npog-1; Mon, 30 Jan 2023 04:27:15 -0500
X-MC-Unique: 0IL9D-bvONmoOiUQR7Npog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1E7E1C07547;
 Mon, 30 Jan 2023 09:27:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8CAB175AD;
 Mon, 30 Jan 2023 09:27:13 +0000 (UTC)
Date: Mon, 30 Jan 2023 09:27:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] tcg: use QTree instead of GTree
Message-ID: <Y9eNbnL+TgONAMPM@redhat.com>
References: <20230111035536.309885-1-cota@braap.org>
 <20230111035536.309885-3-cota@braap.org>
 <Y76s1VNBUYwlpIGo@redhat.com> <Y9FRoUI3I5LfQsjW@redhat.com>
 <Y9b1UHyyPux7FKV5@cota-l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9b1UHyyPux7FKV5@cota-l14>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Jan 29, 2023 at 05:38:08PM -0500, Emilio Cota wrote:
> On Wed, Jan 25, 2023 at 15:58:25 +0000, Daniel P. Berrangé wrote:
> > On Wed, Jan 11, 2023 at 12:34:29PM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Jan 10, 2023 at 10:55:36PM -0500, Emilio Cota wrote:
> > > > qemu-user can hang in a multi-threaded fork. One common
> > > > reason is that when creating a TB, between fork and exec
> > > > we manipulate a GTree whose memory allocator (GSlice) is
> > > > not fork-safe.
> > > 
> > > BTW, I just checked latest glib status
> > > 
> > >   https://gitlab.gnome.org/GNOME/glib/-/issues/1079
> > > 
> > > it appears they're pretty close to deciding to delete the
> > > GSlice impl and always use system malloc.
> > 
> > They have now merged the code to delete the GSlice custom allocator.
> > 
> > So glib >= 2.76.0 should not exhibit a hang
> > 
> > > So if we do take this patch series it'll hopefully be a time
> > > limited thing to carry. 
> > 
> > So the question is whether the issue is critical enough that we want
> > to carry a workaround for a while, vs telling users to upgrade to
> > newer glib  (once 2.76 actually gets released)
> 
> That is great news!
> 
> Since this is a correctness issue, I think we should ship with qtree
> and use it when configuring with glib <2.76.0. For later glib versions
> we would just use gtree, e.g. via typedef + inline functions.
> 
> Once the minimum glib required by the configure script is >= 2.76.0,
> then we'd remove qtree.
> 
> If that sounds like a good plan, I can send a v2.

I'm fine with it, but be good to have an opinion here from the TCG
subsystem maintainers, CC'ing them


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


