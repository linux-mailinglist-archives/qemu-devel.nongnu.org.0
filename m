Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D6434E41
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:52:29 +0200 (CEST)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCxA-00056B-Vj
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdCvE-00042V-UG
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdCvB-0002k5-Gi
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634741424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CIKmSfDXQQfNP7KXSiGMwbtWhNA4WNqBbfed1ZVJz5Q=;
 b=HHnp3wyqp7qWMKGZ/Eqt7+99IqM3IGW1JNcjA0Q1IlqdtPeCQKMV8aaf90BjAN8elWXKbI
 AfJHBObZL4Hj6pqI7DFW2L9pUiHp50FhbtuVfZE6gikd/Xdioew83jJKaJFHNL1imDE2I3
 I1UDS1r1H94ZvBoSuzjeHAGNXKkAZew=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-hURWxD7vPfOV_JWQRXSfyg-1; Wed, 20 Oct 2021 10:50:22 -0400
X-MC-Unique: hURWxD7vPfOV_JWQRXSfyg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so4362004wmc.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CIKmSfDXQQfNP7KXSiGMwbtWhNA4WNqBbfed1ZVJz5Q=;
 b=8Fw6vukzmlTERspymX1nakSZfq/cdEVdgTW6pDoKMHkA/blV6YJRETAwsCKuBtHnzz
 y1ypQNjdMnW76SuzlK+Llb5t+T+xbwv3LsN2H89HFNGculRa1PHCBIaIDZDdmTLiGEGj
 Hm1hFmpUKkkcPw43pPvwKvmF7izbmf+cGES/jVDBuGVeUoSLrlXfckBg4IsG2/EcIdSg
 NbQqWw/NvKka7ASyvWoYmbHK5wb2A8TY/Qv0JGlWRf5G7KfZP0FtnhlJPf54UXOdKB9v
 smmog67/GFm5JbQeVT2Oyq6eSPdTzTM4t2E/DRe5CqSDZKhJPh4VcPqziEh7FdPz/1VB
 L3zA==
X-Gm-Message-State: AOAM5329RChiLS+EJv0Fm8LqTrvox5tvPdGpLqMu6lUnm5k3pKwB2EHo
 guOMbHYGjDA3B2bX1oX0JxBS+bMqeXt9x6SVo8KwW/DukNmVPYSmiqAgqBllmOD7Y+o5M7bY5wh
 efdLMhSHH1UtVCTY=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr216594wrb.336.1634741421651; 
 Wed, 20 Oct 2021 07:50:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5tTtEeMU4JEsb7YYHXLDSV15w16n/1adMD/FnPyiLz8VmltRvKAWiS0ZLzKKqIwF214wSGQ==
X-Received: by 2002:adf:a3da:: with SMTP id m26mr216557wrb.336.1634741421383; 
 Wed, 20 Oct 2021 07:50:21 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id n7sm2206113wra.37.2021.10.20.07.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:50:20 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:50:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] replay: improve determinism of virtio-net
Message-ID: <20211020104507-mutt-send-email-mst@kernel.org>
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
 <a0210fac-af32-8f1e-ae5f-237d773c32bf@redhat.com>
 <91370f34-5a37-1cb1-fa7e-c95e3b7521c4@ispras.ru>
 <8735ovx0zd.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8735ovx0zd.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: pbonzini@redhat.com, Jason Wang <jasowang@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 02:40:18PM +0100, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
> > On 31.05.2021 07:55, Jason Wang wrote:
> >> 在 2021/5/17 下午9:04, Pavel Dovgalyuk 写道:
> <snip>
> >>> @@ -2546,7 +2547,7 @@ static void
> >>> virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
> >>>           return;
> >>>       }
> >>>       virtio_queue_set_notification(vq, 0);
> >>> -    qemu_bh_schedule(q->tx_bh);
> >>> +    replay_bh_schedule_event(q->tx_bh);
> >> Not familiar with replay but any chance to change qemu_bh_schedule()
> >> instead?
> >
> > It would be better, but sometimes qemu_bh_schedule is used for the
> > callbacks that are not related to the guest state change.
> 
> Maybe that indicates we should expand the API:
> 
>   void qemu_bh_schedule(QEMUBH *bh, bool guest_state);
> 
> or maybe explicit functions:
> 
>   void qemu_bh_schedule(QEMUBH *bh);
>   void qemu_bh_schedule_guest_update(QEMUBH *bh);
> 
> And document the cases with proper prototypes in main-loop.h.
> 
> While I was poking around I also saw qemu_bh_schedule_idle which made me
> wonder what happens if a guest change is triggered by this. Would this
> be impossible to make deterministic because we don't know when the bh
> actually get activated?
> 
> My concern with just adding replay_bh_schedule_event in the appropriate
> places is we end up with a patchwork of support for different devices
> and make it very easy to break things.

Right. In fact I think the default should be guest update,
and some kind of new API to be used for things that are
not guest visible.

We really need static analysis to enforce this kind of
constraint, too.


> -- 
> Alex Bennée


