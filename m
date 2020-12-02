Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660D42CBB39
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:08:18 +0100 (CET)
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPzd-00066A-F4
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPRs-00085q-Gs
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPRl-0000R9-3v
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606905195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EeqZUEePbYaf2RxMRIfh9ZTuI16E8C330zKdNMn1HnI=;
 b=S/O+pe0q24PoJ23P5rdRzSL/t85sni3YHWg7upbwEHlCXX+gIZ6BL74xng8YNNfCqZkM6k
 Qq/9bZGln+eRjXWokyLoeyr5CwA/ZZISbIpebMtVaBbi7YsiFPjm3SXZZRcveaLge4YkMe
 j9mNPDEL5ZtFVjRvlR5ThOujiMK2cy0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-N8EZkwn4MCSjjNhaAVfqvQ-1; Wed, 02 Dec 2020 05:33:13 -0500
X-MC-Unique: N8EZkwn4MCSjjNhaAVfqvQ-1
Received: by mail-wr1-f71.google.com with SMTP id z13so3112276wrm.19
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 02:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=q/rhGj5XNis5rIiqmmh15s2ARXWJVU5aL06Avlr1LbU=;
 b=uN5dyy2pQFhWCBPUnNnhIU30FAnkEviaDolmLTTXPutofrA/96m+4dbwJK2ygW5qV6
 76xq2ApI9Jgdv6CgteNBSFP7XnmH/uVdG047oLNW+qB7vFLfiMCGvg6zKNbxqg8bW3l/
 PWZix7lhQ3KyVY2EtxTi5gwiRIUJMAz2lfJOFZo7itwMZANVnjmXFmkeXYN4Y5j5OhNa
 nrET7huSjnbEy9xqFS0UQOp/15d/iFrdgZK6qRf8UwoEj8II09x79CI55MrvCkEKxKBG
 cd04YmXpsyg7HL9ModsO8Dn5N11ylSzy+IbXcNZKfGLarNC5nLuKBGi5EnZ5JM43wUIa
 1ZpA==
X-Gm-Message-State: AOAM531oaE8NQwTxUi8QQUzlJRRM6PdkthWTBvrYjl0QfjAgHLKyKtRh
 es1o0uxHtaedTT8fI2F2ME+BdJO92uS3mEJkq60TStUbpY20jYRsV/OoHM/b3Nc5+H8nwTOTbX4
 dddHC3b0ywFw74Zc=
X-Received: by 2002:adf:f0c4:: with SMTP id x4mr2565171wro.322.1606905192233; 
 Wed, 02 Dec 2020 02:33:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza6MjKtC+/wKxI198e4A+FxgjYlKVClbb4fWqZBOkqReAKBK0+yojmVsnzE79YEfSQ3IOzUQ==
X-Received: by 2002:adf:f0c4:: with SMTP id x4mr2565154wro.322.1606905192056; 
 Wed, 02 Dec 2020 02:33:12 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id j14sm1543655wrs.49.2020.12.02.02.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:33:11 -0800 (PST)
Date: Wed, 2 Dec 2020 05:33:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201202053219-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
 <20201202050918-mutt-send-email-mst@kernel.org>
 <20201202102718.GA2360260@redhat.com>
 <20201202053111-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201202053111-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 05:31:53AM -0500, Michael S. Tsirkin wrote:
> On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. Berrangé wrote:
> > On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
> > > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> > > > If we have a paused guest, it can't unplug the network VF device, so
> > > > we wait there forever.  Just change the code to give one error on that
> > > > case.
> > > > 
> > > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > > 
> > > It's certainly possible but it's management that created
> > > this situation after all - why do we bother to enforce
> > > a policy? It is possible that management will unpause immediately
> > > afterwards and everything will proceed smoothly.
> > > 
> > > Yes migration will not happen until guest is
> > > unpaused but the same it true of e.g. a guest that is stuck
> > > because of a bug.
> > 
> > That's pretty different behaviour from how migration normally handles
> > a paused guest, which is that it is guaranteed to complete the migration
> > in as short a time as network bandwidth allows.
> > 
> > Just ignoring the situation I think will lead to surprise apps / admins,
> > because the person/entity invoking the migration is not likely to have
> > checked wether this particular guest uses net failover or not before
> > invoking - they'll just be expecting a paused migration to run fast and
> > be guaranteed to complete.
> > 
> > Regards,
> > Daniel
> 
> Okay I guess. But then shouldn't we handle the reverse situation too:
> pausing guest after migration started but before device was
> unplugged?
> 

Thinking of which, I have no idea how we'd handle it - fail
pausing guest until migration is cancelled?

All this seems heavy handed to me ...

> > -- 
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


