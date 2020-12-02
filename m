Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D052CBB82
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:24:09 +0100 (CET)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQEx-00073E-Un
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPQV-0006BQ-JL
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:31:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPQT-0008NS-Jo
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606905116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ToZelNgTpkRnm23H/fEvLQ+1ADHZeLHJJ6yEGa53Aho=;
 b=aICPHKt+mGeELxWEwAzbj2owMZEDujDrJ4PwfGFqGLSa3GTZZp4ScfLdfsDRuPFLja+l6f
 fty4fqNNVcMExaKbac5s6XwtepMALsIj0eq47HQ4Fnl4nZtxbmenvv5/dJSnGHW9HHi64+
 redJHfbnch68U8F7WItD5rV8EU4V5LU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-0tfY62CaOVKNg0n1goFKMQ-1; Wed, 02 Dec 2020 05:31:55 -0500
X-MC-Unique: 0tfY62CaOVKNg0n1goFKMQ-1
Received: by mail-wm1-f70.google.com with SMTP id o203so2902911wmo.3
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 02:31:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g1l1GN0kmNOVSRgFxR1uWmmt7fhbnqJswwlIP4ZbqZo=;
 b=GKeL2eTFoENNJOyk+dEkjKOW/Gb4IfKqNS2rxq6nZA4uFYpRGX418p8Z09ojMCP2WC
 UGw37e/GN20WIBdJkfCo/2rKJA0XU5cdhAXfnxJ0pHv/bLwhzSIx5aMJ0akhmhCUD6Nn
 vApX4qnEXwmKw4WZ9q4nY/xyqIbWJbURzfXVFpW+qwsjwxMqF+3GEzNA5OVGEPEAMLM8
 qlyrxcbZbZCsBNoCW9GSIWXKwMAgoIvVvcKTThbyFHnPd8JiV/naK/iPHhmHFSEnmjvO
 ja3NbN0vZFwzA41UAgu/5Oq8DFIXKMWjJrq5HBgoHKYKsZAJdDtpp/gPLyw/VEvuo4xb
 2eRw==
X-Gm-Message-State: AOAM5330cKSJR0wNbkroJgcyzoRZ1uoz6C1C7OdADQArhTooZ1cHbNB2
 A7ZT+a7xQhNpLHOasS4GmYYblOj/VhlDb2wBWueam4CPmJmkavEht7XoAWCfhy3//7UzrW2YZBf
 5Q+lK3ux7Ua3OpSY=
X-Received: by 2002:a5d:474f:: with SMTP id o15mr2471458wrs.377.1606905113751; 
 Wed, 02 Dec 2020 02:31:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi2XamHdvJ5otFu+kaSXLGs0sjF9MQw7hII2GDHIu3AQ8UepKqMorHX93lHt496n2fFAtgdQ==
X-Received: by 2002:a5d:474f:: with SMTP id o15mr2471435wrs.377.1606905113514; 
 Wed, 02 Dec 2020 02:31:53 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id g192sm1499679wme.48.2020.12.02.02.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:31:52 -0800 (PST)
Date: Wed, 2 Dec 2020 05:31:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 01/27] migration: Network Failover can't work with a
 paused guest
Message-ID: <20201202053111-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118083748.1328-2-quintela@redhat.com>
 <20201202050918-mutt-send-email-mst@kernel.org>
 <20201202102718.GA2360260@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202102718.GA2360260@redhat.com>
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

On Wed, Dec 02, 2020 at 10:27:18AM +0000, Daniel P. Berrangé wrote:
> On Wed, Dec 02, 2020 at 05:13:18AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Nov 18, 2020 at 09:37:22AM +0100, Juan Quintela wrote:
> > > If we have a paused guest, it can't unplug the network VF device, so
> > > we wait there forever.  Just change the code to give one error on that
> > > case.
> > > 
> > > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > 
> > It's certainly possible but it's management that created
> > this situation after all - why do we bother to enforce
> > a policy? It is possible that management will unpause immediately
> > afterwards and everything will proceed smoothly.
> > 
> > Yes migration will not happen until guest is
> > unpaused but the same it true of e.g. a guest that is stuck
> > because of a bug.
> 
> That's pretty different behaviour from how migration normally handles
> a paused guest, which is that it is guaranteed to complete the migration
> in as short a time as network bandwidth allows.
> 
> Just ignoring the situation I think will lead to surprise apps / admins,
> because the person/entity invoking the migration is not likely to have
> checked wether this particular guest uses net failover or not before
> invoking - they'll just be expecting a paused migration to run fast and
> be guaranteed to complete.
> 
> Regards,
> Daniel

Okay I guess. But then shouldn't we handle the reverse situation too:
pausing guest after migration started but before device was
unplugged?


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


