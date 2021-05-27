Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8355D39245F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:34:11 +0200 (CEST)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm4uY-0002k1-3j
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lm4te-00024v-J7
 for qemu-devel@nongnu.org; Wed, 26 May 2021 21:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lm4tb-0000OD-PC
 for qemu-devel@nongnu.org; Wed, 26 May 2021 21:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622079190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ZlyVcJ7m90SU1oPMVuSpqEtH3m2W0qz/tGMRd8CIUA=;
 b=PkZflkbW8z5ypbgbHy2qPHRORmVbkMZTNOX7CPDRFtitCxBFOlrVyBuagcScfBbNA4KZok
 IryY6EcRIJYa2KxxZpjxyMuXaObJbrE7GEk7YhgTN7E/blN7x1UsFaqDwmCK0p1O5SqNWS
 rwIMaXsqu2HGYpMkk3+jgQPAUd4um3g=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-LdM71ZJ9NEWm7227klXAKQ-1; Wed, 26 May 2021 21:33:07 -0400
X-MC-Unique: LdM71ZJ9NEWm7227klXAKQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 n12-20020a0c8c0c0000b02901edb8963d4dso2711464qvb.18
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 18:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8ZlyVcJ7m90SU1oPMVuSpqEtH3m2W0qz/tGMRd8CIUA=;
 b=DfBiSybKBBc0RaGlQjtX2tvlaN2tovv0C3TQA7PBqj4Mzocfj0fIlNu2Yi9eBpRTdY
 1louqbdwx655rCOHsrJUI+fxGVfEmqW1jltI+k5huECN8aibQZziYsvafk+KXMKNlKtO
 ibR2OXs37i9CoVbGF7mQuiSLlw0GkGDzc6iY7cDIk00malEJCocz43JFuf5jhLdriqkJ
 45e2zNTs3G0BCFo27yE1XM0ms9Paj2JaMaJgTTo6QOSkR0KHOMgl0rn/OTA9hsxcFlIh
 C/bIzZqhqKtsOf7ptjF9jeH6Pkv7Ixzg9K5F39ykEs6HbSvz7fe07H/v75Fpl75aPWOy
 etQA==
X-Gm-Message-State: AOAM5315RvC5YAINMoCHXAxPs3w2fD+G1X32uGvsGsmFXVm8zfThYc0M
 LfjikZiT9F+xo+YW7RDQKwRW7jwahSIXKpoq8CDwC6CE5vZczUBE06Z5HSlgbPo5/KMWKnqYxwm
 VNXmWKsBC7rFPl7k=
X-Received: by 2002:a37:e205:: with SMTP id g5mr1091354qki.449.1622079186408; 
 Wed, 26 May 2021 18:33:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKT5yq5RWhKuGfHwWqcIM+LF4O4rrH4MDWXbUlMsunSM5pXuI3UHgwzyT8yGM1B8k8dt3SeA==
X-Received: by 2002:a37:e205:: with SMTP id g5mr1091334qki.449.1622079186163; 
 Wed, 26 May 2021 18:33:06 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id p11sm496181qtl.82.2021.05.26.18.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 18:33:05 -0700 (PDT)
Date: Wed, 26 May 2021 21:33:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras.c@gmail.com>
Subject: Re: [PATCH v2 1/1] yank: Unregister function when using TLS migration
Message-ID: <YK720N1znLyjCJlm@t490s>
References: <20210526221615.1093506-1-leobras.c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210526221615.1093506-1-leobras.c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 07:16:16PM -0300, Leonardo Bras wrote:
> After yank feature was introduced, whenever migration is started using TLS,
> the following error happens in both source and destination hosts:
> 
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> 
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
> 
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and multifd_load_cleanup().
> 
> Fixes: 50186051f ("Introduce yank feature")
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Assuming you'll post a v3 soon trying to drop all references to ioc->master as
we've discussed. Meanwhile it should possibly be b5eea99ec2f ("migration: Add
yank feature", 2021-01-13) for the "fixes:"?

-- 
Peter Xu


