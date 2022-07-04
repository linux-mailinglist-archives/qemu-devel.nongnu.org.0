Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42B65653F8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:44:29 +0200 (CEST)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KVA-0001HG-FZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8KR8-00073e-EL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8KR5-0001LA-Dn
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656934814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5AjJMC+6tbv/DadabEpJznfytLXGl0dQuj7tjE2lQA=;
 b=X1A9yEQ999kRpll0GzhVfQtSjhVcQRwgloxKHMS+/h8ZHpLVm4e0+Z5pSrHMGueV30XyJQ
 M8maxk7iJLS8eMjWX0CT6ETzDa/FPTWkEQtmxkR/yk2ygaDxIetlY10nmxIvJ2cOvtWFqT
 X3YuKmFZ0S/E+1geZSTJXxrJ0Fn6UTw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-ItLpN_EoP0a-OvN-HxeNVQ-1; Mon, 04 Jul 2022 07:40:13 -0400
X-MC-Unique: ItLpN_EoP0a-OvN-HxeNVQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 be8-20020a05600c1e8800b003a069fe18ffso7257595wmb.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=f5AjJMC+6tbv/DadabEpJznfytLXGl0dQuj7tjE2lQA=;
 b=2XxLNg93QE3VIWTAA2thADTI5smcgGAm43086bBF71XrORIxEsNdTjOFjT3rWw1ovn
 O1mzRPd0U8VvkTx4nwlyD3sfeDmvydQXrj3Gk921qrbfVOEu2m8fz/gIgaVsQhtqhOng
 Ta7C6vhXIt68YCFgonVf1svWzt1p5SG5lrXJAy8e3jY35g82TGGBKPzZA6Rfx9M0iEPy
 WnLGj+rcI7xbeJ35QE0Urft/r+vOJgyeSyqH2jfA3nrMHhby2KFeH6RaxiHmnQIA+blb
 wpwZGWs3e8nVJjK56A5j9hzivrC30y2N3qeo0y9i48IvZIYEO9Igf6JnxTNS5fVXpx0o
 aSfw==
X-Gm-Message-State: AJIora9mKux7U45xnTR69Xv8iu3hR8BgKc3i6mL6vV8XJu86j9fwazVI
 puiz0A5VNF+HfCiNTGOg2rm9NGUPH+Z/9XMdAltpv1+j/srOuVGU4afuS/Phb1SjsHiwREqBl77
 iarT6kVTnRL/rIHI=
X-Received: by 2002:a1c:2902:0:b0:3a0:2a05:c639 with SMTP id
 p2-20020a1c2902000000b003a02a05c639mr31779968wmp.31.1656934811948; 
 Mon, 04 Jul 2022 04:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqaGDfkga6ScsQGj1+o2X5v8PwcX9nODkMKzVL7XfzJpGqwUETIZuDKzGR1J3ThYLuZgtf2A==
X-Received: by 2002:a1c:2902:0:b0:3a0:2a05:c639 with SMTP id
 p2-20020a1c2902000000b003a02a05c639mr31779939wmp.31.1656934811740; 
 Mon, 04 Jul 2022 04:40:11 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bq12-20020a5d5a0c000000b0021d54a16344sm6351852wrb.92.2022.07.04.04.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 04:40:11 -0700 (PDT)
Date: Mon, 4 Jul 2022 12:40:09 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/3] Add zero-copy-copied migration stat
Message-ID: <YsLRmYjFpdGw0AjK@work-vm>
References: <20220701155935.482503-1-leobras@redhat.com>
 <20220701155935.482503-3-leobras@redhat.com>
 <877d4tz9gx.fsf@pond.sub.org> <YsKtm2O8+d5d0p/N@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsKtm2O8+d5d0p/N@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, Jul 04, 2022 at 08:18:54AM +0200, Markus Armbruster wrote:
> > Leonardo Bras <leobras@redhat.com> writes:
> > 
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  qapi/migration.json   | 5 ++++-
> > >  migration/migration.c | 1 +
> > >  monitor/hmp-cmds.c    | 4 ++++
> > >  3 files changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > index 7102e474a6..925f009868 100644
> > > --- a/qapi/migration.json
> > > +++ b/qapi/migration.json
> > > @@ -55,6 +55,9 @@
> > >  # @postcopy-bytes: The number of bytes sent during the post-copy phase
> > >  #                  (since 7.0).
> > >  #
> > > +# @zero-copy-copied: The number of zero-copy flushes that reported data sent
> > > +#                    using zero-copy that ended up being copied. (since 7.2)
> > 
> > The description feels awkward.  What's a "zero-copy flush", and why
> > should the user care?  I figure what users care about is the number of
> > all-zero pages we had to "copy", i.e. send the bulky way.  Is this what
> > @zero-copy-copied reports?
> 
> MigrationCapability field @zero-copy-send instructs QEMU to try to
> avoid copying data between userspace and kernel space when transmitting
> RAM region.
> 
> Even if the kernel supports zero copy, it is not guaranteed to happen,
> it is merely a request to try.
> 
> QEMU periodically (once per migration iteration) flushes outstanding
> zero-copy requests and gets an indication back of whether any copies
> took place or not.
> 
> So this counter is a reflection of how many iterations resulted  in
> zero-copy not being fully honoured.
> 
> IOW, ideally this counter will always be zero. If it is non-zero,
> then the magnitude gives a very very very rough guide to what's
> going on. If it is '1' then it was just a transient limitation.
> If it matches the number of migration iterations, then it is a
> more systemic limitation.
> 
> Incidentally, do we report the migration iteration count ? I
> thought we did, but i'm not finding it now that I look.

Yes we do; it's dirty-sync-count

Dave

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


