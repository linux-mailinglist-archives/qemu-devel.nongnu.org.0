Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F852D76B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:24:30 +0200 (CEST)
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nri0r-0006wE-LH
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nrhxe-0004Uj-Ak
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nrhxc-0006DX-Ox
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652973667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kXd/KXupdtmjxq/4SY395DYkyzm3K35XRINwHe8irxs=;
 b=e6SgHSWK747EKK3eXwqWK4OAvJpCi1VVsR2g5/3JgGo0A9IfdX2Y5E/7x+cTv1y/EOeAJ0
 RDNSHnKiDAJoYMe26eJetfY1PgcriV82VMVwF29/6LLRrMjw7G7Pm/V/joxbfnMoULge4b
 UiRvjUeA8hDrXmFeAXHdWqBPxSbsWU0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-RHWZiZEzMDmRnfnM3Scufw-1; Thu, 19 May 2022 11:21:03 -0400
X-MC-Unique: RHWZiZEzMDmRnfnM3Scufw-1
Received: by mail-io1-f70.google.com with SMTP id
 k2-20020a0566022d8200b0065ad142f8c1so2491449iow.12
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 08:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kXd/KXupdtmjxq/4SY395DYkyzm3K35XRINwHe8irxs=;
 b=XjHaKoSWd8frr9GQBmZesxu7gwv5hh9jHc4D6PMAV8kZOHqnnI2xJzMBxoQfcpaD8r
 FpdLyA4lSFjNeWBbtIC9YNu76wVQdSGNLNDidms1mJT51D3jpPCUiH8sQVug5adGL/eP
 nlVGzaldWxY74b61eHSbIRXJu1cSpkH7N/dw+aGxu3BSnTavDTHnh1TQ9DrrheYeAruE
 Bj9BVu2jCT2mfy6W8xshw9RQJwtuc8XfKLnvYijQgk/CgYcCMi0c8QdJYKMJytFYBOHn
 LBlrYjzi/78LRjtin7LXhhMQ0J2rbpOejj/VX/pf907patOZF8GL3nqeLq2mEPxtD/o0
 XSIg==
X-Gm-Message-State: AOAM531QVWQvC9dxqTE1FHZKg9djHms1IWpZw1/YrGLVGaH7D2R+Q9xB
 +oiISyHGWdGeUT9cXhJwtpNC8uu4zkE3RLnLanjUlqDuyzEF4Rg3cqSClSOU4bNCA8B/FbCj+Wy
 3f0ClPBdSA/d703lCo1axYCAJ4WpjJhw=
X-Received: by 2002:a05:6638:1392:b0:32e:51e5:13fa with SMTP id
 w18-20020a056638139200b0032e51e513famr3017212jad.263.1652973662705; 
 Thu, 19 May 2022 08:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVEJuNBAbP7uNezP2WpklP0FvEPhmrPpG0D9hQTRzYnOAhTSZ27Q+FaJmT8AitFoKl/d1StXHk8iDG86gDIus=
X-Received: by 2002:a05:6638:1392:b0:32e:51e5:13fa with SMTP id
 w18-20020a056638139200b0032e51e513famr3017189jad.263.1652973662496; Thu, 19
 May 2022 08:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220518130945.2657905-1-stefanha@redhat.com>
In-Reply-To: <20220518130945.2657905-1-stefanha@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 19 May 2022 16:20:26 +0100
Message-ID: <CAELaAXxiBSFMnFUzGy8NxCr0GMOrop_43HAvmkj8s4dy3fy0xA@mail.gmail.com>
Subject: Re: [PATCH] block: get rid of blk->guest_block_size
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, John Snow <jsnow@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 xen-devel@lists.xenproject.org, 
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, 
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>, 
 Xie Yongji <xieyongji@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, May 18, 2022 at 2:10 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> Commit 1b7fd729559c ("block: rename buffer_alignment to
> guest_block_size") noted:
>
>   At this point, the field is set by the device emulation, but completely
>   ignored by the block layer.
>
> The last time the value of buffer_alignment/guest_block_size was
> actually used was before commit 339064d50639 ("block: Don't use guest
> sector size for qemu_blockalign()").
>
> This value has not been used since 2013. Get rid of it.
>
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alberto Faria <afaria@redhat.com>


