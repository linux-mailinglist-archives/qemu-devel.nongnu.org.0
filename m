Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EDF41BA92
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 00:49:47 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVLv0-0005u4-7T
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 18:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVLu7-0005Ds-NL
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVLu4-00045B-MG
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632869327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhabiSftK+0nUDgTE/dk0IZeq0j//+z/RQxhmENVtBY=;
 b=N4ayaifn4oQ/3bpLIJAigt+7f1yqxkbbmJ35t59npXsgalKojgVuvoZNwaQadX/MkY2lvn
 VgZ37EEuHjNaxXT7YiizS2E3KzQwY3uIce2MOtvtfP1IegkPNF90bxIeX/PWniLnICBVuk
 wdmnzHzqXx25AQvhgkfhSs85iL66JGc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-OFGGZoYxPs2GZj1pAdH86Q-1; Tue, 28 Sep 2021 18:48:46 -0400
X-MC-Unique: OFGGZoYxPs2GZj1pAdH86Q-1
Received: by mail-il1-f199.google.com with SMTP id
 c11-20020a928e0b000000b0024eb114af51so554071ild.22
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 15:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LhabiSftK+0nUDgTE/dk0IZeq0j//+z/RQxhmENVtBY=;
 b=i3Tm8q9sOdZUYRu6jYKCG6cFz2bzVzMwBhhTqwNkEAQvYOMEyVcTEpfsgLBqmDzAEH
 xkk8Ach5cThA+ptba7kBHH1cCUcMW42P82S+uYysdkwj+xtnO8o7mNMQvdvIguk6FwrM
 Tt+H+lCc3hRGhl2rOx5Y4o3liE0359fnisPmIcaJQxd8utCeFzP81LvDYgMQuwIfO+8A
 NTxIfrVu6PNxcErL+BvJJ/oY+G5RJ2OR4SsbwNr5fM0G7P56CyFqlNTyh9b+0GswDMXv
 gYQbqySezGQJx/jtuGqUIr51I/BbN6E4FGDQCWj0DEu35ISl2qbeXsP+UDGCCfA9cEDT
 zPrg==
X-Gm-Message-State: AOAM533xjcXJr0oV2GPV3JWym1nHyDKrQrsJ33hFYg9OFx8FNA6D8qzR
 WPSPcYNRWPg+kbi8Ki62egqn7qHTNovvwgaRJ0REymJt2mj8myMMMigduTezNkcqE7OYyQw9tFd
 7tXtFQymzCm/0WAY=
X-Received: by 2002:a92:c0c4:: with SMTP id t4mr6231862ilf.235.1632869325637; 
 Tue, 28 Sep 2021 15:48:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/DaBWaO7BmNXQQksBa+J9IkLnNQeILmQfnCKXspiNTu0vENgDbENHVLmQwMmlTi2MMzswGw==
X-Received: by 2002:a92:c0c4:: with SMTP id t4mr6231853ilf.235.1632869325439; 
 Tue, 28 Sep 2021 15:48:45 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id z20sm229680ill.2.2021.09.28.15.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 15:48:44 -0700 (PDT)
Date: Tue, 28 Sep 2021 18:48:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 3/3] multifd: Send using asynchronous write on nocomp
 to send RAM pages.
Message-ID: <YVOby/PvqPuXRqSH@t490s>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-4-leobras@redhat.com>
 <YU4OVZLo8oSpGrdI@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YU4OVZLo8oSpGrdI@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 06:43:49PM +0100, Daniel P. Berrangé wrote:
> > @@ -546,6 +546,7 @@ void multifd_save_cleanup(void)
> >          MultiFDSendParams *p = &multifd_send_state->params[i];
> >          Error *local_err = NULL;
> >  
> > +        qio_channel_async_flush(p->c, NULL);
> >          socket_send_channel_destroy(p->c);
> >          p->c = NULL;
> >          qemu_mutex_destroy(&p->mutex);
> 
> This isn't reliable beucase qio_channel_async_flush will return early
> even if not everything is flushed.

Right, though I think the problem is in patch 2 where we should make sure
flush() will only return if all data sent.

And at the meantime we may also want to move it to before we send the devices
states for both pre/post copy.  multifd_save_cleanup() is called only until
migration completed and we're cleaning stuffs, I'm afraid it's too late, so
potentially the device states can arrive and dest vm running without the latest
src VM memories.

-- 
Peter Xu


