Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8FB4CF0C2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:53:06 +0100 (CET)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR5Mm-0002P7-Js
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:53:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nR5Ly-0001kW-SG
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 23:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nR5Lu-0004wH-VK
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 23:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646628729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1uGEzT4zbW5co4R9fJQRqlSLrtHsWWqF87+G5FAHIE4=;
 b=Ht0aPmBt97P43U2PD+EKLHBMgQDgvMjiLksoPvT+9A7tbDSbcAfXdNk2L93MMSZEJbw1+c
 gfNcw/f7C0WRuzZQDNUchRCNGjW44/RQVDT3EgNKJB6CC+QqoAqDQ5wjNwbXVG1303w9xd
 FGwGzK6li7FuKF0PKVWQE57JsSX3uQg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-h03XAnm_PeGJ7Tmo56NoJA-1; Sun, 06 Mar 2022 23:52:08 -0500
X-MC-Unique: h03XAnm_PeGJ7Tmo56NoJA-1
Received: by mail-lj1-f197.google.com with SMTP id
 20-20020a2e0914000000b0024635d136ddso6019268ljj.22
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 20:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uGEzT4zbW5co4R9fJQRqlSLrtHsWWqF87+G5FAHIE4=;
 b=gpO9iCe+2YpjOoFy9yHkqa4Rj31Bc8c6EMOc3RKKw3+v0n8mqEs2onB7WHb4uxkW++
 EsZWqQ+PvoZ7+aXhsYhtsYtwJ+gL+IntLcNc9GNIvT49Qqpy3GzokQb/0WKFZ1n3dXx/
 cme4dbxEa50fsHrLJlOTh05f4o13EEO1FKnX7rJdvkVX4+7p/jtZ+b1xlgJQ5w9p7RNE
 o6tl/OhtoKKdW5mAMypB2Mcd1U86W8YznvS6G9VSPeVyU0kmY0qDP3Rwiqa8NGpNt2ER
 s6pUUGKx4V5Bh9gG+Wy6YE3hmyIgFy/SF0LDB8dKpw+NQnkr9+sJyf41IDOD8028NSAx
 oHAw==
X-Gm-Message-State: AOAM533jGrMlY+6LLLqHOjAKC+1Fj65dI1rh3dxN/v62zCxmgGPRAfFg
 r4JsweT0qDF/zrrW3c2cMvGw/jTMLC32BdbZ93/t2mBgSJgLaBfwDNyv9DxF7FJAztsUd+a3t+Q
 PRldWrq9J29uyUSlUpBEKFDFlfNIOok4=
X-Received: by 2002:a05:651c:90b:b0:244:c4a4:d5d8 with SMTP id
 e11-20020a05651c090b00b00244c4a4d5d8mr6275110ljq.97.1646628726568; 
 Sun, 06 Mar 2022 20:52:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBLwYG5AnRLClNm+lVrqcrHaBMEKITCUdTU8waPqQZWokVtAfY6d5o0Q85MtWrJeuH+Oy29opo442kgqz3cMc=
X-Received: by 2002:a05:651c:90b:b0:244:c4a4:d5d8 with SMTP id
 e11-20020a05651c090b00b00244c4a4d5d8mr6275083ljq.97.1646628726283; Sun, 06
 Mar 2022 20:52:06 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
 <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
 <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
 <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
 <7b4e06fe-4d10-0870-5d6e-d2e70d7eb3a2@gmail.com>
 <CAGmdLqTqcESsiyTMavKZ3U8=5yPtqdq2tunZTH-tfrzwfUMGug@mail.gmail.com>
 <e5302fba-e773-c56d-388f-a3593bacd977@gmail.com>
 <CAGmdLqRCSYzjWBT7OhfP-hZHYwP8F3=4hpwQ+E76ShxjmRTO5Q@mail.gmail.com>
 <CACGkMEsgqUzm+30jxRCq1Jce6Pu=1+Jw_Q08KzoBviSb-CO6Kg@mail.gmail.com>
 <b3279a3c-6951-8016-617a-81abb04bd137@gmail.com>
 <CACGkMEuzqhVNGo2btM3rWAhaxfFSpAvPqWjjnPqGbSPa=K68bA@mail.gmail.com>
 <CAMVc7JVS8VjqfJjucRu=if5LiwXeq+3eGe+bSNWT0--EZ==tCw@mail.gmail.com>
In-Reply-To: <CAMVc7JVS8VjqfJjucRu=if5LiwXeq+3eGe+bSNWT0--EZ==tCw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Mar 2022 12:51:55 +0800
Message-ID: <CACGkMEsq_dCqG10rbx2CTzbJiFvtLaZdiL7hfrq3eeJP_s1SQQ@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>,
 Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 7, 2022 at 12:25 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> On Mon, Mar 7, 2022 at 12:59 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Mar 4, 2022 at 12:37 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > >
> > > On 2022/03/04 10:37, Jason Wang wrote:
> > > > On Thu, Mar 3, 2022 at 11:43 PM Vladislav Yaroshchuk
> > > > <vladislav.yaroshchuk@jetbrains.com> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On Tue, Mar 1, 2022 at 11:21 AM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > >>>
> > > >>> On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:
> > > >>>>       > Not sure that only one field is enough, cause
> > > >>>>       > we may have two states on bh execution start:
> > > >>>>       > 1. There are packets in vmnet buffer s->packets_buf
> > > >>>>       >      that were rejected by qemu_send_async and waiting
> > > >>>>       >      to be sent. If this happens, we should complete sending
> > > >>>>       >      these waiting packets with qemu_send_async firstly,
> > > >>>>       >      and after that we should call vmnet_read to get
> > > >>>>       >      new ones and send them to QEMU;
> > > >>>>       > 2. There are no packets in s->packets_buf to be sent to
> > > >>>>       >      qemu, we only need to get new packets from vmnet
> > > >>>>       >      with vmnet_read and send them to QEMU
> > > >>>>
> > > >>>>      In case 1, you should just keep calling qemu_send_packet_async.
> > > >>>>      Actually
> > > >>>>      qemu_send_packet_async adds the packet to its internal queue and calls
> > > >>>>      the callback when it is consumed.
> > > >>>>
> > > >>>>
> > > >>>> I'm not sure we can keep calling qemu_send_packet_async,
> > > >>>> because as docs from net/queue.c says:
> > > >>>>
> > > >>>> /* [...]
> > > >>>>    * If a sent callback is provided to send(), the caller must handle a
> > > >>>>    * zero return from the delivery handler by not sending any more packets
> > > >>>>    * until we have invoked the callback. Only in that case will we queue
> > > >>>>    * the packet.
> > > >>>>    *
> > > >>>>    * If a sent callback isn't provided, we just drop the packet to avoid
> > > >>>>    * unbounded queueing.
> > > >>>>    */
> > > >>>>
> > > >>>> So after we did vmnet_read and read N packets
> > > >>>> into temporary s->packets_buf, we begin calling
> > > >>>> qemu_send_packet_async. If it returns 0 - it says
> > > >>>> "no more packets until sent_cb called please".
> > > >>>> At this moment we have N packets in s->packets_buf
> > > >>>> and already queued K < N of them. But, packets K..N
> > > >>>> are not queued and keep waiting for sent_cb to be sent
> > > >>>> with qemu_send_packet_async.
> > > >>>> Thus when sent_cb called, we should finish
> > > >>>> our transfer of packets K..N from s->packets_buf
> > > >>>> to qemu calling qemu_send_packet_async.
> > > >>>> I meant this.
> > > >>>
> > > >>> I missed the comment. The description is contradicting with the actual
> > > >>> code; qemu_net_queue_send_iov appends the packet to the queue whenever
> > > >>> it cannot send one immediately.
> > > >>>
> > > >>
> > > >> Yes, it appends, but (net/queue.c):
> > > >> *  qemu_net_queue_send tries to deliver the packet
> > > >>      immediately. If the packet cannot be delivered, the
> > > >>      qemu_net_queue_append is called and 0 is returned
> > > >>      to say the caller "the receiver is not ready, hold on";
> > > >> *  qemu_net_queue_append does a probe before adding
> > > >>      the packet to the queue:
> > > >>      if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
> > > >>          return; /* drop if queue full and no callback */
> > > >>      }
> > > >>
> > > >> The queue is not infinite, so we have three cases:
> > > >> 1. The queue is not full -> append the packet, no
> > > >>      problems here
> > > >> 2. The queue is full, no callback -> we cannot notify
> > > >>      a caller when we're ready, so just drop the packet
> > > >>      if we can't append it.
> > > >> 3. The queue is full, callback present -> we can notify
> > > >>      a caller when we are ready, so "let's queue this packet,
> > > >>      but expect no more (!) packets is sent until I call
> > > >>      sent_cb when the queue is ready"
> > > >>
> > > >> Therefore if we provide a callback and keep sending
> > > >> packets if 0 is returned, this may cause unlimited(!)
> > > >> queue growth. To prevent this, we should stop sending
> > > >> packets and wait for notification callback to continue.
> > > >
> > > > Right.
> > > >
> > > >>
> > > >> I don't see any contradiction with that comment.
> > > >>
> > > >>> Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if
> > > >>> calling qemu_send_packet_async is allowed after it returns 0?
> > > >>>
> > > >>
> > > >> It may be wrong, but I think it's not allowed to send
> > > >> packets after qemu_send_packet_async returns 0.
> > > >>
> > > >> Jason Wang, can you confirm please?
> > > >
> > > > With a cb, we can't do this. All users with cb will disable the source
> > > > polling and depend on the cb to re-read the polling.
> > > > (tap/l2tpv3/socket).
> > > >
> > > > Without a cb, we can. As analyzed above, qemu_net_queue_append() can
> > > > limit the number of packets queued in this case.
> > >
> > > vmnet can read multiple packets at once. What about such a case? Isn't
> > > calling qemu_send_packet_async for already read packet and stopping
> > > reading more fine?
> >
> > It should be fine, I remember I've asked whether or not the source
> > could be disabled but I get the answer that it can't.
> >
> > Thanks
>
> It can, but there could be more packets before disabling the source
> because vmnet reads multiple packets with one call. The procedure is:
> call qemu_send_packet_async with a callback, and if it returns 0,
> disable the source and keep calling qemu_send_packet_async with a
> callback until all the packets already read are queued. Is this kind
> of procedure allowed?

So it might have several issues if we do this:

1) there's no guarantee that the following call to
qemu_send_packet_async() will always return 0, this could happen if
the device has some rx buffer after the first call to
qemu_send_packet_asnyc(). Then we may end up with out-of order
delivery.
2) calling with a cb may suppress the queue limit check, buggy driver
may cause unlimited number of packets to be queued under heavy traffic

It looks to me we'd better store those pending buffers in the vmnet,
and when sent_cb is triggered, start from those buffers first. (Or
simply drop the packets)

Thanks


>
> Regards,
> Akihiko Odaki
>
> >
> > >
> > > Regards,
> > > Akihiko Odaki
> > >
> > > >
> > > > Thanks
> > > >
> > > >>
> > > >> Best Regards,
> > > >>
> > > >> Vladislav Yaroshchuk
> > > >>
> > > >>>
> > > >>> Regards,
> > > >>> Akihiko Odaki
> > > >>
> > > >>
> > > >>
> > > >
> > >
> >
>


