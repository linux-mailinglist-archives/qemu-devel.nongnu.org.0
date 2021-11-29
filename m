Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E39E460DF9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 05:09:34 +0100 (CET)
Received: from localhost ([::1]:52510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXyv-0005VM-DG
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 23:09:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mrX7B-00062y-Bo
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:14:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mrX79-0001XP-Dp
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638155638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QnmHb2HshmkV78MADnwdXYuHRLVbrLSES0IO+guwfgI=;
 b=LVr2hOI+RTOGqwfNwsgu41YHzmGTxZv267O/KD3oW1yVoxW7WCwew0Hi6KhxPeJbxxmH62
 MVfOLYyqCEbm4M+PVthKaC1KkjLhYnVWrtD7yx1eVCXjlv7r5CG4EtLxhoFoc/6I9Tvqvq
 hpDnu90n9FR3MB9GH0cjCBJ8WFINgks=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-8jFvPbFvMba28z1XpQqOow-1; Sun, 28 Nov 2021 22:13:57 -0500
X-MC-Unique: 8jFvPbFvMba28z1XpQqOow-1
Received: by mail-pg1-f197.google.com with SMTP id
 r35-20020a635163000000b0032513121db6so4732705pgl.10
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QnmHb2HshmkV78MADnwdXYuHRLVbrLSES0IO+guwfgI=;
 b=emVHkoIR/i9u2pBl6ZBkp0ortX5v4QlRRvQKKamQDFLxuYkchIK1HAaRFfxSQJrtbK
 sjINmNUmSWewvmSK+WR3Ux6UwVtxWY9IEvvLqi64ibFpTIsGJu+BCbKmCwjQlNrvTu9D
 btc4clE1yt+TBLGTQYsQVJB08cYx0K3SGabGl9pYKIzwcfRu0o9Vzk1WNvOr35aTjeZT
 x/coXkQ2tdz83VEBbD2bonYzH+9NsrWScQtEgV6dW1/Ht0Lstf5Y1H7bGkiBJUi3CkAo
 COJhE/N5r5OFfmgOcl1cpE3BkVRPyGQpfubFa9BHkhv8kl0xqYpIEA9XKi/2xdUkBAF3
 IKqw==
X-Gm-Message-State: AOAM532TsIRVlFWytacrlxHGTzfawG+eVrzGZ69f4HtRgrDc/P0v8PoN
 hN0AadJrqyc9hAkXCDnk4D4LuVE7oilSOY2IbdaGKeYSpBRfuiG09bbpxloOA9YUfCv8fSI5RV3
 dC3gqY/T995SHsK4=
X-Received: by 2002:a17:90b:1c87:: with SMTP id
 oo7mr34461397pjb.159.1638155636225; 
 Sun, 28 Nov 2021 19:13:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb1/EcrYGt1OkxQWth4V0ncO99p5VETwqXE9v88MIWRkFENfZZzs6kAu9+A722sl8vSsbWCA==
X-Received: by 2002:a17:90b:1c87:: with SMTP id
 oo7mr34461367pjb.159.1638155635965; 
 Sun, 28 Nov 2021 19:13:55 -0800 (PST)
Received: from xz-m1.local ([94.177.118.150])
 by smtp.gmail.com with ESMTPSA id 26sm5932152pgn.82.2021.11.28.19.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:13:55 -0800 (PST)
Date: Mon, 29 Nov 2021 11:13:50 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Message-ID: <YaRFbvwR5Q2U6J3H@xz-m1.local>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8RfrbwXEB2fcJv@xz-m1.local>
 <PH0PR11MB5658E15F420BCBAD2AA58E23C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8pi2ty2Z8wjt9u@xz-m1.local>
 <PH0PR11MB5658CC570A4E5B88CA3464A9C3659@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YaQqjEwDVUGurPD7@xz-m1.local>
 <CACGkMEuz1qyp88igffJM+jQv5DUEnsu2yVmPwW45c8Qxo9hvGg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuz1qyp88igffJM+jQv5DUEnsu2yVmPwW45c8Qxo9hvGg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "mst@redhat.com" <mst@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 10:28:42AM +0800, Jason Wang wrote:
> > I think we can still have Jason's patch continued because the kernel commit to
> > apply SNP bit is merged in v5.13, so we may need the qemu change to let it
> > still work with v5.13-v5.15+ guest kernels.  We'll loose the resv bit check a
> > bit, but looks worthwhile.  Jason?
> 
> Yes, I agree. The only thing that may worry me is the migration
> compatibility. If we migrate from new to old we may break the guests,
> we probably need compatibility props for that.

Hmm.. How important is new->old migrations?  Is that normally for the
old->new->old migration so that users can always fallback to the old hosts?

If that's the case then IMHO we're fine here, since the new binary check less
on resv bits than the old binary, then if the guest code can work with the old
binary already then migrating back to old binary should work too.  Changing
guest OS during migration of new->old can have a problem but hopefully rare.

OTOH - do you know any of the real enterprise user that uses scalable mode yet?
To my own understanding it's still mostly "experimental", then hopefully we can
avoid worrying on that too much?

> 
> And in the future, it could be even more troublesome,e.g there's one
> day we found another bit that needs not to be checked. Maybe we should
> even remove all the rsvd bits checks?

When a real hardware sees any of the reserved bits set, it'll bail out and
raise an error, right?

If that's the case, I'm wondering whether we should always follow the hardware
behavior as an emulator.

Now I'm trying to remember normally how a spec could re-use a bit that was used
to be reserved: should the hardware bumps the version of the version reg in so
that softwares will know what to expect?

So I'm thinking whether the emulator code can identify the version bump by
"scalable mode enabled", if so we know some resved bits are "ignored" now, and
IIUC that's mostly the original proposal to add a quirk when scalable mode in
vtd_init().

But again, I really think it should be the spec owner who should have
considered all these.. e.g. explicitly document "this bit was used to reserved,
but when scalable mode enabled it's ignored and programmable by the guest
driver", or something like that.

Thanks,

-- 
Peter Xu


