Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E24062A27D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 21:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov2Cq-0007u9-Ne; Tue, 15 Nov 2022 15:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ov2Cl-0007td-4g
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 15:06:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ov2Cj-0008NC-89
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 15:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668542804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v31ltKFzqAUneYBsE3bYMw79yZCJ5MhRDD9m7YOii30=;
 b=AnQnBhZeeN7SYkCZBEI5v6n8F7OQ6FzJ8V/RSExmzP1JcSHu+fpZC4I3lysHYS7v3nQIzj
 yLYL/U1z2/1yj10DVKUpcozEaA9OBoZa9a09xbk1anP/UVTMw0DGnR0v/GqbrjP4d6KDo5
 nEbLWMTQ1Ck85oSlgQkqsMHhMzmFj8o=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-370-VpDLYIlYPh6xjLo8EZgU8Q-1; Tue, 15 Nov 2022 15:06:40 -0500
X-MC-Unique: VpDLYIlYPh6xjLo8EZgU8Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 do17-20020a056214097100b004c6183e6ce4so9697213qvb.11
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 12:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v31ltKFzqAUneYBsE3bYMw79yZCJ5MhRDD9m7YOii30=;
 b=HTojtY/cFToZr+Yozt6XDuOV+LbphZh22h/9ojx+zMHx4KKfEmTtqSxy4RF30VpfXn
 uQjHAd6a309AaEtV05T6F+jUuFf5tVt3ltNIbdiaBA+19SUs60JQlfBW+5pihVAZF4N/
 UdO4zCQ1KeHLEPaMHhyhkD4rCRQ+UcRsXvz0F90ekQE8MgwtpcvgkwDUAmStUvvBNSrA
 Tmf3Icbor32cY/95YMf7HVSKoCXpFj/medO2ICnDpA5K9yv6iIR0nTgOCgmJgDcPOfN9
 pw0Z5M3WTXF5pbXz6roi1N6UQHZ26Bjlc0LtpV8tleb5fuwP8MG2jAtEtGFmHuJMbkwe
 I4cA==
X-Gm-Message-State: ANoB5plxkqCm/qgvmwXRaavgz/uDEFn7bPUiYnQpyqmzghn2hv/LUcXd
 SSXQ/fhfG1ZbsOU2VHMWHvEEE7sDBSMve0qjp/eQUItFwYBFmHJ+ItpzSIofOegcYc1IHfcCRup
 whqyu/zWPuXdEzQ0=
X-Received: by 2002:a05:620a:4449:b0:6fa:d2f3:76fc with SMTP id
 w9-20020a05620a444900b006fad2f376fcmr16461864qkp.252.1668542800320; 
 Tue, 15 Nov 2022 12:06:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4SYiVDeTaQILJRb39J5iz6I8lIZbtckdEfDRVVJicObflHWPsmvXPEPhKgokSkLxyNA9VnEw==
X-Received: by 2002:a05:620a:4449:b0:6fa:d2f3:76fc with SMTP id
 w9-20020a05620a444900b006fad2f376fcmr16461851qkp.252.1668542800081; 
 Tue, 15 Nov 2022 12:06:40 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a25cb00b006ef1a8f1b81sm8842578qko.5.2022.11.15.12.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 12:06:39 -0800 (PST)
Date: Tue, 15 Nov 2022 15:06:38 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com
Subject: Re: [PATCH v2] migration: check magic value for deciding the mapping
 of channels
Message-ID: <Y3PxTgrkU96ir000@x1n>
References: <20221107165159.49534-1-manish.mishra@nutanix.com>
 <Y3POFd+LFuxW8w21@x1n>
 <a027006d-48f7-4d8d-465a-a726bbdc6fbf@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a027006d-48f7-4d8d-465a-a726bbdc6fbf@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 15, 2022 at 11:29:13PM +0530, manish.mishra wrote:
> > > +   while (bytes < nbytes) {
> > > +       bytes = klass->io_read_peek(ioc,
> > > +                                   buf,
> > > +                                   nbytes,
> > > +                                   errp);
> > IIUC here you need to accumulate bytes rather than directly reusing it, so
> > e.g. two reads on 2 bytes each will satisfy a 4 bytes read.
> 
> Actually peek always reads from top so even if there are multile reads it
> does not accumulate.

Fair enough.

[...]

> Thank you Peter for review. I see this patch is included by Juan too in
> some other patch series of 30 patches, so how it will work. Do i need to
> send a independent V3 for this? Or it should be reviewed in that series.

From what I see right now, feel free to rework on new versions.  Please
also consider copying Dave (dgilbert@redhat.com) and Leonardo
(lsoaresp@redhat.com) on future posts.

Thanks,

-- 
Peter Xu


