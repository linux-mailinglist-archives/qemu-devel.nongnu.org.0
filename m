Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9A66350AE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 07:53:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxjci-0006Nd-Ul; Wed, 23 Nov 2022 01:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjce-0006Mz-FL
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 01:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxjcc-00055L-8p
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 01:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669186355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBEMqOWrWZrRa5uxz3NTQ/ce9gnZt5df5XLXzQMPVbs=;
 b=Bn06pb2/c9v9XgLl7Ev7Z2YDutegUGBOAlUJc7GwyjwbywhcM8fgZses3uTCu8sO3KMWnW
 CFg6wCbH2m/QcVxo37ACdr1vTV/82l63oVtxROGEcAvfrV6gK97xIljM2gXrC9xY+3kQtm
 qtoaoOIbDV3d4wzdXr1SPhdD+a7FgQg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-gW3lHvTxOOW_e2UnT2l0hw-1; Wed, 23 Nov 2022 01:52:34 -0500
X-MC-Unique: gW3lHvTxOOW_e2UnT2l0hw-1
Received: by mail-wm1-f71.google.com with SMTP id
 z15-20020a1c4c0f000000b003cf6f80007cso471225wmf.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 22:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VBEMqOWrWZrRa5uxz3NTQ/ce9gnZt5df5XLXzQMPVbs=;
 b=Gc6b3zE+Bw6mXY6HkIJ7yyJXeQ8fTRDdX+ZTUKfEyda05+L9Nrn5xlpwJ/Ke4gMoE2
 eSeXDt28zyZAChYMPnobUtvSTtyQjFFRrz3XC51X1mLjS/8w6ryDnDEUoFg1K060RxRX
 K5TRuJXC9wIMzOQwB6CUWMY7sewoT3KOMs9uZBmcEtDKamYOTvev8LM1RAFjFE5Qi+kE
 oyAvu9UhvbqEwsozzBdHM18Sem2J9+Man50Y6Ml61IA4CDXDx9HZ7yaR88VG2HHq8L2m
 I8xrDlEcEL8VWDRHK5FWmBlXDSP3mdj85p90hgdb5SVlUpBYfrokEgw8MLRzT0I68/c5
 yuQg==
X-Gm-Message-State: ANoB5pkc9z3Qo9rqla8AxDa4Epmci+PQmrK8ZP2CydP1++XKR3iw/hTI
 p72AqNvH29JoPSwavIDkHSXN6hEkibo5xxKzrqy/utGbXdn4TAqpoUHXA0JodfoJSCx9iHm+/Re
 u2xQKGFkmt5jPrlE=
X-Received: by 2002:a5d:4106:0:b0:241:e8d0:7de9 with SMTP id
 l6-20020a5d4106000000b00241e8d07de9mr2026630wrp.260.1669186353232; 
 Tue, 22 Nov 2022 22:52:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6g5dattWWuEeNYjdwxwE+CHzOVDynMMcLVRZ8dFyo+v8VSDnswf0lY2rQoM2L7Ay7IsNiLPQ==
X-Received: by 2002:a5d:4106:0:b0:241:e8d0:7de9 with SMTP id
 l6-20020a5d4106000000b00241e8d07de9mr2026620wrp.260.1669186352995; 
 Tue, 22 Nov 2022 22:52:32 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b003cf894c05e4sm1180233wmq.22.2022.11.22.22.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 22:52:32 -0800 (PST)
Date: Wed, 23 Nov 2022 01:52:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-7.2 v2 3/4] libvhost-user: Fix two more format strings
Message-ID: <20221123015218-mutt-send-email-mst@kernel.org>
References: <20221105102448.436469-1-sw@weilnetz.de>
 <20221105102448.436469-4-sw@weilnetz.de>
 <4a950024-4758-b328-5968-656d0e72b043@weilnetz.de>
 <cf752a2d-edb7-4b04-0b21-6e2f38112d6d@weilnetz.de>
 <06a55dd7-4d98-8c6c-c9aa-b1f4222829d8@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06a55dd7-4d98-8c6c-c9aa-b1f4222829d8@weilnetz.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 23, 2022 at 07:49:53AM +0100, Stefan Weil wrote:
> Am 23.11.22 um 07:35 schrieb Stefan Weil:
> > Am 15.11.22 um 08:25 schrieb Stefan Weil:
> > > Am 05.11.22 um 11:24 schrieb Stefan Weil:
> > > 
> > > > This fix is required for 32 bit host. The bug was detected by CI
> > > > for arm-linux, but is also relevant for i386-linux.
> > > > 
> > > > Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
> > > > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > > > ---
> > > >   subprojects/libvhost-user/libvhost-user.c | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/subprojects/libvhost-user/libvhost-user.c
> > > > b/subprojects/libvhost-user/libvhost-user.c
> > > > index d67953a1c3..80f9952e71 100644
> > > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > > @@ -651,7 +651,8 @@ generate_faults(VuDev *dev) {
> > > >           if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
> > > >               vu_panic(dev, "%s: Failed to userfault region %d "
> > > > -                          "@%" PRIx64 " + size:%zx offset: %zx:
> > > > (ufd=%d)%s\n",
> > > > +                          "@%" PRIx64 " + size:%" PRIx64 "
> > > > offset: %" PRIx64
> > > > +                          ": (ufd=%d)%s\n",
> > > >                        __func__, i,
> > > >                        dev_region->mmap_addr,
> > > >                        dev_region->size, dev_region->mmap_offset,
> > > 
> > > 
> > > There is still no review for this patch.
> > > 
> > > I added "for-7.2" to the subject here in my answer. How can we get
> > > all 4 patches of this series into the new release?
> > > 
> > > Stefan
> > 
> > Ping? Those bug fixes are still missing in -rc2.
> > 
> > Stefan
> 
> Hello Michael,
> 
> I just noticed that MAINTAINERS has no entry for the files in
> subprojects/libvhost-user, so I did not cc you in my previous e-mails.
> Should that directory be added to the "vhost" section"?
> 
> Stefan

pls do


