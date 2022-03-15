Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08694DA34F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 20:32:22 +0100 (CET)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUCu5-0004uC-Lb
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 15:32:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUCsU-0002t5-Cs
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUCsQ-00060b-SJ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 15:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647372636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TJARIoE2FHjZtWN2mN+qXLV8cL6SHOGZpyd9BxhyjmA=;
 b=b1vWuPzcgqhsRQGX6xsMpguFLBlkxeYuua1BW1dO5zhWmtw9pvjdbagJgoVwDNBMFGaBTC
 fCXY1bwLb78fOJZ9QS8z7u3yOdF8yUcmJLfTbc+EpRh0xwYNAxXXUFCo0YmLKPEqBER/Y1
 sRoi0a7gVki5Q+TbMSzbeOKhHVmp/J8=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-2mSAmZ7tM0KXyoVqEgmDCQ-1; Tue, 15 Mar 2022 15:30:34 -0400
X-MC-Unique: 2mSAmZ7tM0KXyoVqEgmDCQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 j16-20020ab01850000000b003517f6bb1easo43977uag.10
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 12:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TJARIoE2FHjZtWN2mN+qXLV8cL6SHOGZpyd9BxhyjmA=;
 b=1jmerDHrR3I+OGFxuIZ1+qHnunEhXeqzXhR82CH6nSedX+VGN+pm2kWxlWIVLe3B+d
 NmVuzPTvgqexHFstV9zt9RWDdTbnRzsz0nxjGZCanOm1d/ecPAV2tVIwHll1N23wRVkH
 rUQ8Pth1cDi9S6iVA6ReN6o/CB9xlAcjik/EHKjO0fRkCH1AihkZW8vEd1hehIxpjigY
 JsYI0rewy3+eSyt9IQ4gIdG8BMkbo5FSEmAYtjUXJsf/DHwVddA3RsKZvP4DKAG91jFi
 x5683spWnTnBBkEN0IGb+8B2bctLLW31Rksnho0XFqYPIcoCvcNufdrU885q+drkbEuZ
 nElg==
X-Gm-Message-State: AOAM5309Bjskys0aqGBAPEFZLizBIZCaP51Gxpm0a4KBzfY101hEsLUl
 YYctSnhg3E4XfXFs5UuC0+wtkC9Q0J8H2pU+LCkjtXb6OWwWYsEgI6z3E3wUzxfujgR9qU7hPjR
 1FTxY1ReOO4eWNx9MTUOm6NlMjjRT/JE=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr12033463vkf.35.1647372633423; 
 Tue, 15 Mar 2022 12:30:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy6/KEoWOAJlKD1myboZSKUvHgMq+MxzDUuQcQzsvMCr7tNDw8dNgI8/ChS4Ea/rRblf1yK+C61VR1ZtJy9Mk=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr12033440vkf.35.1647372633118; Tue, 15 Mar
 2022 12:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-2-xieyongji@bytedance.com>
 <Yi959Cf+k8z8gOwm@stefanha-x1.localdomain>
 <CAFn=p-bcvfOa+vNGXqaiJbg2CUEALJoMGVHN9NCQv2GRrf_D_A@mail.gmail.com>
 <YjBSp70Ml9p/Z273@stefanha-x1.localdomain>
In-Reply-To: <YjBSp70Ml9p/Z273@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Mar 2022 15:30:22 -0400
Message-ID: <CAFn=p-bkz0prqzjXuoTkCu3eWg6At0QbkjdzZF0+BjypXHFO=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] block: Support passing NULL ops to
 blk_set_dev_ops()
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez Pascual <slp@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Michael Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <mreitz@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 4:47 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Mar 14, 2022 at 03:09:35PM -0400, John Snow wrote:
> > On Mon, Mar 14, 2022 at 1:23 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Tue, Feb 15, 2022 at 06:59:38PM +0800, Xie Yongji wrote:
> > > > This supports passing NULL ops to blk_set_dev_ops()
> > > > so that we can remove stale ops in some cases.
> > > >
> > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > ---
> > > >  block/block-backend.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > > index 4ff6b4d785..08dd0a3093 100644
> > > > --- a/block/block-backend.c
> > > > +++ b/block/block-backend.c
> > > > @@ -1015,7 +1015,7 @@ void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
> > > >      blk->dev_opaque = opaque;
> > > >
> > > >      /* Are we currently quiesced? Should we enforce this right now? */
> > > > -    if (blk->quiesce_counter && ops->drained_begin) {
> > > > +    if (blk->quiesce_counter && ops && ops->drained_begin) {
> > > >          ops->drained_begin(opaque);
> > > >      }
> > > >  }
> > >
> > > John: You added this code in f4d9cc88ee6. Does blk_set_dev_ops() need to
> > > call ->drained_end() when ops is set to NULL?
> > >
> > > Stefan
> >
> > I'm not sure I trust my memory from five years ago.
> >
> > From what I recall, the problem was that block jobs weren't getting
> > drained/paused when the backend was getting quiesced -- we wanted to
> > be sure that a blockjob wasn't continuing to run and submit requests
> > against a backend we wanted to have on ice during a sensitive
> > operation. This conditional stanza here is meant to check if the node
> > we're already attached to is *already quiesced* and we missed the
> > signal (so-to-speak), so we replay the drained_begin() request right
> > there.
> >
> > i.e. there was some case where blockjobs were getting added to an
> > already quiesced node, and this code here post-hoc relays that drain
> > request to the blockjob. This gets used in
> > 600ac6a0ef5c06418446ef2f37407bddcc51b21c to pause/unpause jobs.
> > Original thread is here:
> > https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg03416.html
> >
> > Now, I'm not sure why you want to set ops to NULL here. If we're in a
> > drained section, that sounds like it might be potentially bad because
> > we lose track of the operation to end the drained section. If your
> > intent is to destroy the thing that we'd need to call drained_end on,
> > I guess it doesn't matter -- provided you've cleaned up the target
> > object correctly. Just calling drained_end() pre-emptively seems like
> > it might be bad, what if it unpauses something you're in the middle of
> > trying to delete?
> >
> > I might need slightly more context to know what you're hoping to
> > accomplish, but I hope this info helps contextualize this code
> > somewhat.
>
> Setting to NULL in this patch is a subset of blk_detach_dev(), which
> gets called when a storage controller is hot unplugged.
>
> In this patch series there is no DeviceState because a VDUSE export is
> not a device. The VDUSE code calls blk_set_dev_ops() to
> register/unregister callbacks (e.g. ->resize_cb()).
>
> The reason I asked about ->drained_end() is for symmetry. If the
> device's ->drained_begin() callback changed state or allocated resources
> then they may need to be freed/reset. On the other hand, the
> blk_set_dev_ops(blk, NULL, NULL) call should be made by the dev_ops
> owner so they can clean up without a ->drained_end() call.

OK, got it... Hm, we don't actually use these for BlockJobs anymore.
It looks like the only user of these callbacks now is the NBD driver.

ad90febaf22d95e49fb6821bfb3ebd05b4919417 followed not long after my
initial patch and removed my intended user. I tried just removing the
fields, but the build chokes on NBD.
It looks like these usages are pretty modern, Sergio added them in
fd6afc50 (2021-06-02). So, I guess we do actually still use these
hooks. (After a period of maybe not using them for 4 years? Wow.)

I'm not clear on what we *want* to happen here, though. It doesn't
sound like NBD is the anticipated use case, so maybe just make the
removal fail if the drained section is active and callbacks are
defined? That's the safe thing to do, probably.

--js


