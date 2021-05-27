Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290E392FAF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:29:23 +0200 (CEST)
Received: from localhost ([::1]:41370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmG4g-0004Zy-3w
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lmF44-0000kN-36
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lmF3Z-0001rX-QD
 for qemu-devel@nongnu.org; Thu, 27 May 2021 08:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622118238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrbQPiXPoUcvDVip73kKyaFZN0GxDCHhNNN5tDEDjDQ=;
 b=gwWPFmc4W6x/7mOkI6HDA8nBNWg58yvnt5fBkufJUPV5BZgmdk6Eli/7+iktfCjrlICVbf
 TuiKb8UOW+J7TukIEZ3aRgsw13bfKagmD0ZjJkxhaKRUwdkLIHMonBac5KO9QXqQcbWKur
 EeZKpWHMHedwJbb2atqKBxUGEUk61aY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-GUnu6LcEOHWLHkf4FWdHxw-1; Thu, 27 May 2021 08:23:55 -0400
X-MC-Unique: GUnu6LcEOHWLHkf4FWdHxw-1
Received: by mail-qt1-f198.google.com with SMTP id
 b17-20020ac854110000b02901f279c73d75so23629qtq.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 05:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wrbQPiXPoUcvDVip73kKyaFZN0GxDCHhNNN5tDEDjDQ=;
 b=n4EadJvMq97dZTyzFjkhvWhzoalItjScSJa5geSE1IoZwCNGCYQ7/5VLSA4pjWW8SE
 gLgbazPIBS0jRLf4S/7m93QLCfMJOcC8c1tBJrXVqZJFqooc0QyS4+ewi/gTKh2XP0BZ
 0S7DXWK2FyMod5KM1u1NTzaychtlkTHSRnYZiahAepeOMVpB9XUl4Hb8Z4vHlz0yn7L6
 M+HkTNEwCQKFYoO4pjVAO4WQP5LDiZU6PUIeyw+7DBMWNGMYg9UCHy6zXuVyMlEWt6oV
 psw4htd/dXzqHHGqcel6u/eVYrxYeh5mww+ixKDypOQ9h4w7XqUiHZ+fOncKV7/qAC1R
 TO8g==
X-Gm-Message-State: AOAM530YPt8QQQ0849S2PxyjuQF2rQC5YsBOpT2/LlR1bjh4vPpjsWU+
 Kbh/zbnZupV2s50Pk7R9a7BV0RqOqxmbLdgdb0uKc5egsQSNBnHlnw0IEm0oANSnF4NxVEy0An1
 AQuyY4WAXz1umFKU=
X-Received: by 2002:a05:620a:1593:: with SMTP id
 d19mr3119228qkk.211.1622118234488; 
 Thu, 27 May 2021 05:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGWrAjQHvRKjNq16ZZFwrCM8/lsaL8iw+ThFXGroqUvP3OAZfCrOVu9ijR9516mUMSvvSlAQ==
X-Received: by 2002:a05:620a:1593:: with SMTP id
 d19mr3119201qkk.211.1622118234118; 
 Thu, 27 May 2021 05:23:54 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id d200sm1244714qkc.44.2021.05.27.05.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 05:23:53 -0700 (PDT)
Date: Thu, 27 May 2021 08:23:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <YK+PWHzpmnQqgYAw@t490s>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
 <YK6yQ9EVNlVPDMaS@t490s> <20210526232103.39e2a7d0@gecko.fritz.box>
 <YK7EotQbx/F9avls@t490s> <YK9cfiUx+vk/yxtf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YK9cfiUx+vk/yxtf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras.c@gmail.com>,
 Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 27, 2021 at 09:46:54AM +0100, Daniel P. Berrangé wrote:
> On Wed, May 26, 2021 at 05:58:58PM -0400, Peter Xu wrote:
> > On Wed, May 26, 2021 at 11:21:03PM +0200, Lukas Straub wrote:
> > > On Wed, 26 May 2021 16:40:35 -0400
> > > Peter Xu <peterx@redhat.com> wrote:
> > > 
> > > > On Wed, May 26, 2021 at 05:05:40PM -0300, Leonardo Bras wrote:
> > > > > After yank feature was introduced, whenever migration is started using TLS,
> > > > > the following error happens in both source and destination hosts:
> > > > > 
> > > > > (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> > > > > Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> > > > > 
> > > > > This happens because of a missing yank_unregister_function() when using
> > > > > qio-channel-tls.
> > > > > 
> > > > > Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> > > > > yank_unregister_function() in channel_close() and multifd_load_cleanup().
> > > > > 
> > > > > Fixes: 50186051f ("Introduce yank feature")
> > > > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> > > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>  
> > > > 
> > > > Leo,
> > > > 
> > > > Thanks for looking into it!
> > > > 
> > > > So before looking int the fix... I do have a doubt on why we only enable yank
> > > > on socket typed, as I think tls should also work with qio_channel_shutdown().
> > > > 
> > > > IIUC the confused thing here is we register only for qio-socket, however tls
> > > > will actually call migration_channel_connect() twice, first with a qio-socket,
> > > > then with the real tls-socket.  For tls I feel like we have registered with the
> > > > wrong channel - instead of the wrapper socket ioc, we should register to the
> > > > final tls ioc?
> > > > 
> > > > Lukas, is there a reason?
> > > > 
> > > 
> > > Hi,
> > > There is no specific reason. Both ways work equally well in preventing
> > > qemu from hanging. shutdown() for tls-channel just makes it abort a
> > > little sooner (by not attempting to encrypt and send data anymore).
> > > 
> > > I don't lean either way. I guess registering it on the tls-channel
> > > makes is a bit more explicit and clearer.
> > 
> > Agreed, because IMHO logically the migration code should not be aware of
> > internals of IOChannels, e.g., we shouldn't need to know ioc->master is the
> > socket ioc of tls ioc to unregister.
> 
> I think it is atually better to ignore the TLS channel and *always* yank
> on the undering socket IO channel. The yank functionality is intended to
> be used in a scenario where we know the channels are broken.  If yank
> calls the high level IO channel it is potentially going to try to do a
> cleanup shutdown that we know will fail because of the broken network.

Could you elaborate what's the "cleanup shutdown"?

The yank calls migration_yank_iochannel:

void migration_yank_iochannel(void *opaque)
{
    QIOChannel *ioc = QIO_CHANNEL(opaque);

    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
}

Where qio_channel_shutdown for tls is nothing but delivers that to the master
channel:

static int qio_channel_tls_shutdown(QIOChannel *ioc,
                                    QIOChannelShutdown how,
                                    Error **errp)
{
    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);

    qatomic_or(&tioc->shutdown, how);

    return qio_channel_shutdown(tioc->master, how, errp);
}

So I thought it was a nice wrapper just for things like this, and I didn't see
anything it does more than the io_shutdown for the socket channel.  Did I miss
something?

Thanks,

-- 
Peter Xu


