Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C63459833F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 14:42:39 +0200 (CEST)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOer5-0000Un-5D
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 08:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOemz-0005cw-Sg
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOemw-0006EY-9U
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660826296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MKjkl/GHEk4NfTCwM9YwkqsYuNGDPvrZZwadW/tams=;
 b=LcLIIx97rI8WVRzG+otSIVutCgu2W1M/rXfofyWuIMl6BHm4lNbSU8K4tuop0zkl66sQmP
 YDZFhVsDq+0PxwuzEhb5daIk9G7MeGMeDy1W5VlwB2cT2Rb5VhOsoY6Im839MlrNzCPuJS
 xnECtTNR7jVEBwnuECu84okapyp+muE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-T6d-tyZSPXW7X5u23VD9Tg-1; Thu, 18 Aug 2022 08:38:15 -0400
X-MC-Unique: T6d-tyZSPXW7X5u23VD9Tg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c64-20020a1c3543000000b003a61987ffb3so897471wma.6
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 05:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc;
 bh=5MKjkl/GHEk4NfTCwM9YwkqsYuNGDPvrZZwadW/tams=;
 b=03zFRjq6VipmpM/hFvlXsVTTyRp/Fvp9qmo5hnNsEvm36WjrgXRuvmhf9SpnU8CpFb
 iUlYvgs5X+CL9gCIJCq9AhWtniJkxBLIYmdx90/mWZ8E0nftOmSUp92BXMVbNB+i2q2r
 /XsnqvRY330TW8cl70IYo1xtq6NB1hCxpzzNYspMDNSJslUlDzryHhKqJWtZR0Z37u/C
 LlsfrcCoqh2o3JZsd7EUe2DZVzjCOA3zoHtlJ0W6vzcN1ZSYgXNTQxCpJE92aLTEAPqs
 duOeLA/FmA8RJ2zhTxyWVeAGJ565XOSyPojEHTcF++U3NMsha2ZyFSeWZZY/Mv+dSSG8
 bmWA==
X-Gm-Message-State: ACgBeo1a7LA7tWWJ6rkgzT8yDPdoolLDowEe7f8P0+PNABowdGkI/NR/
 o75PWhuSwjMjLMTsbkxxHbGoDrRoy4lxpJX9jgeCC+1ZKV8j3Wh2QyPQgzCSolLG+EV8vFRjbmk
 upQdNiowlZ4AMOk8=
X-Received: by 2002:a05:600c:3d19:b0:3a5:c6ef:a875 with SMTP id
 bh25-20020a05600c3d1900b003a5c6efa875mr4871473wmb.66.1660826294301; 
 Thu, 18 Aug 2022 05:38:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5TAxV04jAfPJQ1aNLmpH4qB0LOBP0oh+vtCbC8rPGJn3qDALCtS6QLYk/lJllVPP6A8ZB64g==
X-Received: by 2002:a05:600c:3d19:b0:3a5:c6ef:a875 with SMTP id
 bh25-20020a05600c3d1900b003a5c6efa875mr4871458wmb.66.1660826294050; 
 Thu, 18 Aug 2022 05:38:14 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g12-20020adfa48c000000b00224f5bfa890sm1440040wrb.97.2022.08.18.05.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 05:38:13 -0700 (PDT)
Date: Thu, 18 Aug 2022 13:38:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>, berrange@redhat.com
Cc: qemu-devel@nongnu.org, Claudio Fontana <Claudio.Fontana@suse.com>,
 Jim Fehlig <jfehlig@suse.com>, quintela@redhat.com
Subject: Re: towards a workable O_DIRECT outmigration to a file
Message-ID: <Yv4ys6e0kK/2BMFk@work-vm>
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
 <6f8a6a33-5a68-0eeb-d278-9397b1fd0015@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f8a6a33-5a68-0eeb-d278-9397b1fd0015@suse.com>
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

* Nikolay Borisov (nborisov@suse.com) wrote:
> [adding Juan and David to cc as I had missed them. ]

Hi Nikolay,

> On 11.08.22 г. 16:47 ч., Nikolay Borisov wrote:
> > Hello,
> > 
> > I'm currently looking into implementing a 'file:' uri for migration save
> > in qemu. Ideally the solution will be O_DIRECT compatible. I'm aware of
> > the branch https://gitlab.com/berrange/qemu/-/tree/mig-file. In the
> > process of brainstorming how a solution would like the a couple of
> > questions transpired that I think warrant wider discussion in the
> > community.

OK, so this seems to be a continuation with Claudio and Daniel and co as
of a few months back.  I'd definitely be leaving libvirt sides of the
question here to Dan, and so that also means definitely looking at that
tree above.

> > First, implementing a solution which is self-contained within qemu would
> > be easy enough( famous last words) but the gist is one  has to only care
> > about the format within qemu. However, I'm being told that what libvirt
> > does is prepend its own custom header to the resulting saved file, then
> > slipstreams the migration stream from qemu. Now with the solution that I
> > envision I intend to keep all write-related logic inside qemu, this
> > means there's no way to incorporate the logic of libvirt. The reason I'd
> > like to keep the write process within qemu is to avoid an extra copy of
> > data between the two processes (qemu outging migration and libvirt),
> > with the current fd approach qemu is passed an fd, data is copied
> > between qemu/libvirt and finally the libvirt_iohelper writes the data.
> > So the question which remains to be answered is how would libvirt make
> > use of this new functionality in qemu? I was thinking something along
> > the lines of :
> > 
> > 1. Qemu writes its migration stream to a file, ideally on a filesystem
> > which supports reflink - xfs/btrfs
> > 
> > 2. Libvirt writes it's header to a separate file
> > 2.1 Reflinks the qemu's stream right after its header
> > 2.2 Writes its trailer
> > 
> > 3. Unlink() qemu's file, now only libvirt's file remains on-disk.
> > 
> > I wouldn't call this solution hacky though it definitely leaves some
> > bitter aftertaste.

Wouldn't it be simpler to tell libvirt to write it's header, then tell
qemu to append everything?

> > Another solution would be to extend the 'fd:' protocol to allow multiple
> > descriptors (for multifd) support to be passed in. The reason dup()
> > can't be used is because in order for multifd to be supported it's
> > required to be able to write to multiple, non-overlapping regions of the
> > file. And duplicated fd's share their offsets etc. But that really seems
> > more or less hacky. Alternatively it's possible that pwrite() are used
> > to write to non-overlapping regions in the file. Any feedback is
> > welcomed.

I do like the idea of letting fd: take multiple fd's.

Dave

> > 
> > 
> > Regards,
> > Nikolay
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


