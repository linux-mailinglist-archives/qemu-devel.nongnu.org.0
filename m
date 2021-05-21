Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4345638CBA3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:11:58 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8gn-0007u8-B8
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lk8eL-00052Q-14
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lk8eI-0000JD-0M
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621616961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izI7g3pdWKrAP0zeIUlnI5415htYwPxUQ59uVWTfPKU=;
 b=dI6JydGW6/0TvrbNlhDhZ779JKss/7V1Hr6q87pEURAzVfUMZxJyu1EPDEaXa+C3M5Icc9
 jY/pnV4GATIF/OZUzjahgmTx2bfb9bpjqxZ3XtuynymseBUP9zCHIny1jNFzln5td8vq/Y
 /9Zw8/znRYtGHtq8SaIM1XFN6z94f44=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-Iyj2CHcIOXWJU76k1ZKHCg-1; Fri, 21 May 2021 13:09:20 -0400
X-MC-Unique: Iyj2CHcIOXWJU76k1ZKHCg-1
Received: by mail-qk1-f199.google.com with SMTP id
 s123-20020a3777810000b02902e9adec2313so17179815qkc.4
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 10:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=izI7g3pdWKrAP0zeIUlnI5415htYwPxUQ59uVWTfPKU=;
 b=ZQazU1xzZJHReaE1K8/5l6LWRK/+T3byc2mKpN5t08wTAFpoVArtboaqJS+d2cRp2y
 xMrF5uH23IDr6Nd206WQJIIkYb1l4z7Vl5Q0guW+jm056Mv3wAwJqdsRnah7B7iDngvc
 ZsfzxgukRPeHs8TpRa8flGh4f3LUAgJhYru+QvL9b0BIw3UW/UXuYHTGcLAbXxrwi50/
 XMD0aOzNRVAdZJzrnZF8cvgOYbA0jMwGbtfZTGLFOQmxtBEr5d3yHtehI+yPuC6sQIiG
 zCmuNbAPJIkHa4Yn3tdZXqqIzYnzi3I95NFgYdV46ZMsT7q+Kx2khOWKGrdt0q9I8Zme
 vEyg==
X-Gm-Message-State: AOAM531lIT+YZefPK76gFi13l3iVfM51FcDV1PAySXhT4UZNAyr4JXWN
 LK8k8lqd8pq89ZQlTy8FlVVByh+L8eeMy6J27vI3J0/kqRAYm/yQcWhhb+Xv7OjffFyNqyLUcJF
 l4wPMz8s2nkx9ufs=
X-Received: by 2002:ac8:7096:: with SMTP id y22mr12607701qto.94.1621616959391; 
 Fri, 21 May 2021 10:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxua+gbUCS1QOnQaEcVy5BZwg/QOHirczEA1R0WXnWjktjBff8r4kikCFOhEYwNulMHdJB7DQ==
X-Received: by 2002:ac8:7096:: with SMTP id y22mr12607672qto.94.1621616959047; 
 Fri, 21 May 2021 10:09:19 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id c185sm5251504qkg.96.2021.05.21.10.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:09:18 -0700 (PDT)
Date: Fri, 21 May 2021 13:09:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: A bug of Monitor Chardev ?
Message-ID: <YKfpPYQbAgZgQU08@t490s>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com> <87lf88pmyn.fsf@dusky.pond.sub.org>
 <YKfHGC79w0uv41Zd@t490s> <YKfg6j4mPjvjSrcF@redhat.com>
 <YKfmLgz59nv5Ef5u@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YKfmLgz59nv5Ef5u@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: chenjiashang@huawei.com, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 05:56:14PM +0100, Daniel P. Berrangé wrote:
> On Fri, May 21, 2021 at 05:33:46PM +0100, Daniel P. Berrangé wrote:
> > On Fri, May 21, 2021 at 10:43:36AM -0400, Peter Xu wrote:
> > > 
> > > I think the original problem was that if qemu_chr_fe_set_handlers() is called
> > > in main thread, it can start to race somehow within execution of the function
> > > qemu_chr_fe_set_handlers() right after we switch context at:
> > > 
> > >     qemu_chr_be_update_read_handlers(s, context);
> > > 
> > > Then the rest code in qemu_chr_fe_set_handlers() will continue to run in main
> > > thread for sure, but the should be running with the new iothread context, which
> > > introduce a race condition.
> > > 
> > > Running qemu_chr_be_update_read_handlers() in BH resolves that because then all
> > > things run in the monitor iothread only and natually serialized.
> > 
> > The first message in this thread, however, claims that it is *not*
> > in fact serialized, when using the BH. 
> > 
> > > So the new comment looks indeed not fully right, as the chr device should be
> > > indeed within main thread context before qemu_chr_fe_set_handlers(), it's just
> > > that the race may start right away if without BH when context switch happens
> > > for the chr.
> > 
> > It sounds like both the comment and the code are potentially wrong.
> 
> 
> I feel like our root cause problem that the original code was trying to
> workaround, is that the chardev is "active" from the very moment it is
> created, regardless of whether the frontend is ready to use it.
> 
> IIUC, in this case the socket chardev is already listen()ing and
> accept()ing incoming clients off the network, before the monitor
> has finished configuring its hooks into the chardev. This means
> that the initial listen()/accept() I/O watches are using the
> default GMainContext, and the monitor *has* to remove them and
> put in new watches on the thread private GMainContext.
> 
> To eliminate any risk of races, we need to make it possible for the
> monitor to configure the GMainContext on the chardevs *before* any
> I/O watches are configured.
> 
> This in turn suggests that we need to split the chardev initialization
> into two phases. First we have the basic chardev creation, with object
> creation, option parsing/sanity checking, socket creation, and then
> second we have the actual activation where the I/O watches are added.

When we are still running the monitor_init() code IIUC the main thread is still
occupied so it won't be able to handle any listen()/accept() even if there's
event already, so IIUC race can only happen when main thread started the event
loop then run concurrently with the BH in the other iothread.

So, besides above split of chardev init (which sounds like a bigger
surgery)... would it also work if we let the main thread wait until that BH
executed in monitor iothread?  Then all pending listen()/accept() event will
directly be done in the monitor thread.

> 
> IOW,  qemu_chr_new() is the former and gets run from generic code in
> the main() method, or in QMP chardev_add.  A new 'qemu_chr_activate'
> method would be called by whatever frontend is using the chardev,
> after registering a custom GMainContext.
> 
> This would involve updating every single existing user of chardevs
> to add a call to qemu_chr_activate, but that's worth it to eliminate
> the race by design, rather than workaround it.
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

-- 
Peter Xu


