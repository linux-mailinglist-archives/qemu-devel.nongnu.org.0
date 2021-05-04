Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2ED372971
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 13:10:19 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldswU-0003po-QO
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 07:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ldsvL-0002fg-6C
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:09:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ldsvJ-0007M5-BM
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620126544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iJWAkLSe8YVYM1k9ZuDObxctbEVfpCrcccqLfbjGCrQ=;
 b=e1PImBJXk7XccE0q+glflRIxIj6A5bZyudyTOw9I5q2LAsan6aQnTtpms4Cs9ZV04YpySO
 /3zTzbSHOFfmcngZl0VABmsftmf9mlHPhZ0M5NKHa4+zSPxrXy3aTLSXNBceV/tgObIGfO
 5wbYe4u21TyYYE/i33dgduK15/CWt/4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-xD5khNwIOAyABU08KIUd1g-1; Tue, 04 May 2021 07:09:03 -0400
X-MC-Unique: xD5khNwIOAyABU08KIUd1g-1
Received: by mail-wm1-f71.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso258734wml.6
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 04:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iJWAkLSe8YVYM1k9ZuDObxctbEVfpCrcccqLfbjGCrQ=;
 b=K7gxi5TxWHDMlvZMPAP2/TsdiEYyerfJy+GRo7H5GWg3uBPpLic2imQLCYdbCB4Z/Y
 8Pi//boSTJHmoxrlaCBt9okpiF1KszBkMCeSFZkgCCnv2vMy/6ZqozwUDeTvQVMrcbvE
 j6dKD/yBcdvHVRBTm3040R34Qb4fOnUGgl2FhbENr2SMGEAu7JEDfGGjc3LrIITVZean
 G9SOhdgsVYyjLAa93SmHb0Ogsmj6Gr/QMLHn1q0zmhSunu+ovoTt1WxdZziKS29DU6/f
 w834g5rJnTFOFn5jM4g7ei0yqPVzKnOXcRFUJ4L853gAMDpneiYkQSWjBdz7/UDe3IQT
 f68w==
X-Gm-Message-State: AOAM5308Yi3dlwkHTYRan+gnRnIwPvD1G6PT4UoB0BTONYYxtVEP5Dbp
 q7gEevV20kB4Odeb2fh0v4ETKVLuJpfGtUmXHc87onA1wxnV34euF4pBA1bo5YHlZXW9uaKPMDO
 6kz32E/aTiUX2uLk=
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr31736652wrq.304.1620126541931; 
 Tue, 04 May 2021 04:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyamkKE/eQxjpOUZnzAMXkjyIIIhLx4MMqm2TJnCoiiozHWAwcAqDnkH0NLKZrrdFKa2jSNHA==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr31736623wrq.304.1620126541683; 
 Tue, 04 May 2021 04:09:01 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id f6sm18396680wru.72.2021.05.04.04.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:09:01 -0700 (PDT)
Date: Tue, 4 May 2021 07:08:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/6] vhost-user-blk: Don't reconnect during
 initialisation
Message-ID: <20210504070518-mutt-send-email-mst@kernel.org>
References: <20210429171316.162022-1-kwolf@redhat.com>
 <20210429171316.162022-3-kwolf@redhat.com>
 <20210504044050-mutt-send-email-mst@kernel.org>
 <YJETcFAyQUHB13N6@merkur.fritz.box>
 <20210504053719-mutt-send-email-mst@kernel.org>
 <YJEomcoHdjFlSwC1@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YJEomcoHdjFlSwC1@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: den-plotnikov@yandex-team.ru, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 12:57:29PM +0200, Kevin Wolf wrote:
> Am 04.05.2021 um 11:44 hat Michael S. Tsirkin geschrieben:
> > On Tue, May 04, 2021 at 11:27:12AM +0200, Kevin Wolf wrote:
> > > Am 04.05.2021 um 10:59 hat Michael S. Tsirkin geschrieben:
> > > > On Thu, Apr 29, 2021 at 07:13:12PM +0200, Kevin Wolf wrote:
> > > > > This is a partial revert of commits 77542d43149 and bc79c87bcde.
> > > > > 
> > > > > Usually, an error during initialisation means that the configuration was
> > > > > wrong. Reconnecting won't make the error go away, but just turn the
> > > > > error condition into an endless loop. Avoid this and return errors
> > > > > again.
> > > > 
> > > > So there are several possible reasons for an error:
> > > > 
> > > > 1. remote restarted - we would like to reconnect,
> > > >    this was the original use-case for reconnect.
> > > > 
> > > >    I am not very happy that we are killing this usecase.
> > > 
> > > This patch is killing it only during initialisation, where it's quite
> > > unlikely compared to other cases and where the current implementation is
> > > rather broken. So reverting the broken feature and going back to a
> > > simpler correct state feels like a good idea to me.
> > > 
> > > The idea is to add the "retry during initialisation" feature back on top
> > > of this, but it requires some more changes in the error paths so that we
> > > can actually distinguish different kinds of errors and don't retry when
> > > we already know that it can't succeed.
> > 
> > Okay ... let's make all this explicit in the commit log though, ok?
> 
> That's fair, I'll add a paragraph addressing this case when merging the
> series, like this:
> 
>     Note that this removes the ability to reconnect during
>     initialisation (but not during operation) when there is no permanent
>     error, but the backend restarts, as the implementation was buggy.
>     This feature can be added back in a follow-up series after changing
>     error paths to distinguish cases where retrying could help from
>     cases with permanent errors.
> 
> > > > 2. qemu detected an error and closed the connection
> > > >    looks like we try to handle that by reconnect,
> > > >    this is something we should address.
> > > 
> > > Yes, if qemu produces the error locally, retrying is useless.
> > > 
> > > > 3. remote failed due to a bad command from qemu.
> > > >    this usecase isn't well supported at the moment.
> > > > 
> > > >    How about supporting it on the remote side? I think that if the
> > > >    data is well-formed just has a configuration remote can not support
> > > >    then instead of closing the connection, remote can wait for
> > > >    commands with need_reply set, and respond with an error. Or at
> > > >    least do it if VHOST_USER_PROTOCOL_F_REPLY_ACK has been negotiated.
> > > >    If VHOST_USER_SET_VRING_ERR is used then signalling that fd might
> > > >    also be reasonable.
> > > > 
> > > >    OTOH if qemu is buggy and sends malformed data and remote detects
> > > >    that then hacing qemu retry forever is ok, might actually be
> > > >    benefitial for debugging.
> > > 
> > > I haven't really checked this case yet, it seems to be less common.
> > > Explicitly communicating an error is certainly better than just cutting
> > > the connection. But as you say, it means QEMU is buggy, so blindly
> > > retrying in this case is kind of acceptable.
> > > 
> > > Raphael suggested that we could limit the number of retries during
> > > initialisation so that it wouldn't result in a hang at least.
> > 
> > not sure how do I feel about random limits ... how would we set the
> > limit?
> 
> To be honest, probably even 1 would already be good enough in practice.
> Make it 5 or something and you definitely cover any realistic case when
> there is no bug involved.
> 
> Even hitting this case once requires bad luck with the timing, so that
> the restart of the backend coincides with already having connected to
> the socket, but not completed the configuration yet, which is a really
> short window. Having the backend drop the connection again in the same
> short window on the second attempt is an almost sure sign of a bug with
> one of the operations done during initialisation.
> 
> Even if this corner case turned out to be a bit less unlikely to happen
> than I'm thinking (which is, it won't happen at all), randomly failing a
> device-add once in a while still feels a lot better than hanging the VM
> once in a while.
> 
> Kevin

Well if backend is e.g. just stuck and connection does not close, then
VM hangs anyway. So IMHO it's not such a big deal.  If we really want to
address this we should handle all this asynchronously. As in make
device-add succeed and then progress in stages but do not block the
monitor. That would be nice but it's a big change in the code.

-- 
MST


