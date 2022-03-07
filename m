Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF64CF08E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:01:07 +0100 (CET)
Received: from localhost ([::1]:33892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4YQ-0007KP-JA
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:01:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nR4XE-0006cX-1w
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:59:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nR4XA-0005aO-LP
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646625583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q2DqF4fz7ZnlV3JNcRrxyeQkIngRSd+uipfqFU8NtS4=;
 b=ZYO7XI5Z71nYcK6ElgnxBSFJsTtpcRrcl/rnl0V0g4g1LTSou6A22CTF6AOERj8uYgmOSR
 a3gRAQ1bB8Y76GQbKw6L4l/jRwIBazqY9tELMiSAOfg5SRY8zAZ7qzzzo9LzgRwTNSocrJ
 TtiqCvwFOvm4/+wyijhgjQ2f5ilCPnI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-NRbtw38ePJuOiepaokD_jA-1; Sun, 06 Mar 2022 22:59:42 -0500
X-MC-Unique: NRbtw38ePJuOiepaokD_jA-1
Received: by mail-lf1-f71.google.com with SMTP id
 j22-20020a05651231d600b0044830cff16fso84635lfe.12
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 19:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2DqF4fz7ZnlV3JNcRrxyeQkIngRSd+uipfqFU8NtS4=;
 b=pb5RYQ8XCcahtq/4VSP/klvNj3pctWdKBzUO4orPzcTlZ0lcZk82zDfjyldEdlRwii
 3bmwA/W8tYxnvH8jaFWYjE+glKfrnpSVkdk6Q09xwIhtC+Yap9LRSagA6Xz15AGAN0Oq
 cM9dcWdXUeg7lIcFr/5Pla4nXngkMa68vNGw4OaPY7w1+j1F7nANo6Nw71g9feByipuL
 zgTOU3/LuiZq1S7zBmPuiZ/dUvmNhwJy3a3zjTkEmc4TxgvuPz5pilVUE5m1xcob+0cl
 p9P9iSf+wUaXq2LnmiqQsBRXvPac+BWcwRWPt4gOn8R874Ryg4ldoC6e0lit6odE9r7e
 gchw==
X-Gm-Message-State: AOAM5326X0Jd3CUInbgkEO2u75X16Qiln3S+qUzlpyTaBgVV+QgmiRJ0
 NUelKbDExasKCGN2VkLWij4KvsSFOuc+ItIq3AQzDDsByPv8rpujYFOINl2OX4h/qP7sTMjExIV
 1UMR9h3SvByNyzuceN+Km88dJNhwlqQA=
X-Received: by 2002:a05:651c:516:b0:247:a27c:60fd with SMTP id
 o22-20020a05651c051600b00247a27c60fdmr6358253ljp.73.1646625580539; 
 Sun, 06 Mar 2022 19:59:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk7JCtdCeXxKvgKpavgxkukaKu9yMku6naRBAz/oY41WNlptnsreTA47GkAt/psFBeyVaHlc3qB65WzD8RETs=
X-Received: by 2002:a05:651c:516:b0:247:a27c:60fd with SMTP id
 o22-20020a05651c051600b00247a27c60fdmr6358227ljp.73.1646625580268; Sun, 06
 Mar 2022 19:59:40 -0800 (PST)
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
In-Reply-To: <b3279a3c-6951-8016-617a-81abb04bd137@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Mar 2022 11:59:28 +0800
Message-ID: <CACGkMEuzqhVNGo2btM3rWAhaxfFSpAvPqWjjnPqGbSPa=K68bA@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Mar 4, 2022 at 12:37 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> On 2022/03/04 10:37, Jason Wang wrote:
> > On Thu, Mar 3, 2022 at 11:43 PM Vladislav Yaroshchuk
> > <vladislav.yaroshchuk@jetbrains.com> wrote:
> >>
> >>
> >>
> >> On Tue, Mar 1, 2022 at 11:21 AM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >>>
> >>> On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:
> >>>>       > Not sure that only one field is enough, cause
> >>>>       > we may have two states on bh execution start:
> >>>>       > 1. There are packets in vmnet buffer s->packets_buf
> >>>>       >      that were rejected by qemu_send_async and waiting
> >>>>       >      to be sent. If this happens, we should complete sending
> >>>>       >      these waiting packets with qemu_send_async firstly,
> >>>>       >      and after that we should call vmnet_read to get
> >>>>       >      new ones and send them to QEMU;
> >>>>       > 2. There are no packets in s->packets_buf to be sent to
> >>>>       >      qemu, we only need to get new packets from vmnet
> >>>>       >      with vmnet_read and send them to QEMU
> >>>>
> >>>>      In case 1, you should just keep calling qemu_send_packet_async.
> >>>>      Actually
> >>>>      qemu_send_packet_async adds the packet to its internal queue and calls
> >>>>      the callback when it is consumed.
> >>>>
> >>>>
> >>>> I'm not sure we can keep calling qemu_send_packet_async,
> >>>> because as docs from net/queue.c says:
> >>>>
> >>>> /* [...]
> >>>>    * If a sent callback is provided to send(), the caller must handle a
> >>>>    * zero return from the delivery handler by not sending any more packets
> >>>>    * until we have invoked the callback. Only in that case will we queue
> >>>>    * the packet.
> >>>>    *
> >>>>    * If a sent callback isn't provided, we just drop the packet to avoid
> >>>>    * unbounded queueing.
> >>>>    */
> >>>>
> >>>> So after we did vmnet_read and read N packets
> >>>> into temporary s->packets_buf, we begin calling
> >>>> qemu_send_packet_async. If it returns 0 - it says
> >>>> "no more packets until sent_cb called please".
> >>>> At this moment we have N packets in s->packets_buf
> >>>> and already queued K < N of them. But, packets K..N
> >>>> are not queued and keep waiting for sent_cb to be sent
> >>>> with qemu_send_packet_async.
> >>>> Thus when sent_cb called, we should finish
> >>>> our transfer of packets K..N from s->packets_buf
> >>>> to qemu calling qemu_send_packet_async.
> >>>> I meant this.
> >>>
> >>> I missed the comment. The description is contradicting with the actual
> >>> code; qemu_net_queue_send_iov appends the packet to the queue whenever
> >>> it cannot send one immediately.
> >>>
> >>
> >> Yes, it appends, but (net/queue.c):
> >> *  qemu_net_queue_send tries to deliver the packet
> >>      immediately. If the packet cannot be delivered, the
> >>      qemu_net_queue_append is called and 0 is returned
> >>      to say the caller "the receiver is not ready, hold on";
> >> *  qemu_net_queue_append does a probe before adding
> >>      the packet to the queue:
> >>      if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
> >>          return; /* drop if queue full and no callback */
> >>      }
> >>
> >> The queue is not infinite, so we have three cases:
> >> 1. The queue is not full -> append the packet, no
> >>      problems here
> >> 2. The queue is full, no callback -> we cannot notify
> >>      a caller when we're ready, so just drop the packet
> >>      if we can't append it.
> >> 3. The queue is full, callback present -> we can notify
> >>      a caller when we are ready, so "let's queue this packet,
> >>      but expect no more (!) packets is sent until I call
> >>      sent_cb when the queue is ready"
> >>
> >> Therefore if we provide a callback and keep sending
> >> packets if 0 is returned, this may cause unlimited(!)
> >> queue growth. To prevent this, we should stop sending
> >> packets and wait for notification callback to continue.
> >
> > Right.
> >
> >>
> >> I don't see any contradiction with that comment.
> >>
> >>> Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if
> >>> calling qemu_send_packet_async is allowed after it returns 0?
> >>>
> >>
> >> It may be wrong, but I think it's not allowed to send
> >> packets after qemu_send_packet_async returns 0.
> >>
> >> Jason Wang, can you confirm please?
> >
> > With a cb, we can't do this. All users with cb will disable the source
> > polling and depend on the cb to re-read the polling.
> > (tap/l2tpv3/socket).
> >
> > Without a cb, we can. As analyzed above, qemu_net_queue_append() can
> > limit the number of packets queued in this case.
>
> vmnet can read multiple packets at once. What about such a case? Isn't
> calling qemu_send_packet_async for already read packet and stopping
> reading more fine?

It should be fine, I remember I've asked whether or not the source
could be disabled but I get the answer that it can't.

Thanks

>
> Regards,
> Akihiko Odaki
>
> >
> > Thanks
> >
> >>
> >> Best Regards,
> >>
> >> Vladislav Yaroshchuk
> >>
> >>>
> >>> Regards,
> >>> Akihiko Odaki
> >>
> >>
> >>
> >
>


