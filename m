Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D736D5361
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 23:21:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjRb9-0003VP-JY; Mon, 03 Apr 2023 17:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjRb7-0003Rz-Mc
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 17:20:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjRag-00073z-BF
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 17:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680556789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mZpoiDE/1O/to4scl5azAq937rqkicDP8woUOwMVabM=;
 b=P4ItGDR2zvR/nwyC35nUArixjg8J9KS+EXm8SyyYoujoZGToIP4rKoTzoGdogIjTpRM1TP
 IUdYBxXmNNsAREd5iREYzj11OXr/2993u9BXROZecwgRV5c+4KBFKoFtbsjz/+yNoT4+Em
 iy7DTf1dPDW0Pu2HrS9lafyl7/2llcA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-RvkKZ4zrOnqKyreH4MbY8Q-1; Mon, 03 Apr 2023 17:19:48 -0400
X-MC-Unique: RvkKZ4zrOnqKyreH4MbY8Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 y10-20020a05622a164a00b003e38e0a3cc3so20604365qtj.14
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 14:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680556782; x=1683148782;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZpoiDE/1O/to4scl5azAq937rqkicDP8woUOwMVabM=;
 b=Hiv/B1p1bGdzhM82erxU29j5Anh8qSOHKnE4x3rRBiK3EdB5PIDGJTU1IASUGoqdPv
 UZhKfZ+YmgMhz9S8gxj1IwvSmvPfKFqWMLl7Y4x7+SlbizLqPS11PTNcV7PTw5gVmMRL
 D1VIwie5SHdDYEtuLo2UOk3WnbyLin8vtFJlTlQHSpLYZUScRrz/uuvvgwjaVOylNLkZ
 kpdwpwZY0JQi3Um3KshNnsXjUUQcgoA+X0nMzx0GXjq//rJx0vq0SHd99loBdlOtnCZG
 iNUlZmsM3ylf2RMoZIiCHK6jCahi/u4WdhOkSGnVLqu3bMmBNvpdqVYYZGAEWr5I145X
 lrHw==
X-Gm-Message-State: AAQBX9d8asw8Zc3Mn1ztZevheNVqihr4ikOdN6c+Ju6/UwbScUUQpKES
 XdRC7aYTez8ilF5iePQrkn+exj2NobbqowWPTu2xouj8+ruCntrVTETjOy7nvXifwS/mJ65PPMN
 NMqs4fKG/jj6IXApSvc6cED0=
X-Received: by 2002:a05:6214:4106:b0:5df:4d41:9560 with SMTP id
 kc6-20020a056214410600b005df4d419560mr387537qvb.0.1680556782643; 
 Mon, 03 Apr 2023 14:19:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZZN3R/sp/+0gINIgrbyTMT2INOghFHyzPmKLA8UE8EH8aYEbb6OZzWSBaDTTv7ll365J7/dA==
X-Received: by 2002:a05:6214:4106:b0:5df:4d41:9560 with SMTP id
 kc6-20020a056214410600b005df4d419560mr387509qvb.0.1680556782353; 
 Mon, 03 Apr 2023 14:19:42 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 ea7-20020ad458a7000000b005dd8b9345a7sm2883258qvb.63.2023.04.03.14.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 14:19:41 -0700 (PDT)
Date: Mon, 3 Apr 2023 17:19:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH RESEND 2/2] migration/ram.c: Fix migration with compress
 enabled
Message-ID: <ZCtC7OTHLg0u9c09@x1n>
References: <af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de>
 <f0cbd720150d72951e1cafe88ba75e853993f359.1680457631.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0cbd720150d72951e1cafe88ba75e853993f359.1680457631.git.lukasstraub2@web.de>
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

On Sun, Apr 02, 2023 at 05:48:38PM +0000, Lukas Straub wrote:
> Since ec6f3ab9, migration with compress enabled was broken, because
> the compress threads use a dummy QEMUFile which just acts as a
> buffer and that commit accidentally changed it to use the outgoing
> migration channel instead.

Sorry. :(

> Fix this by using the dummy file again in the compress threads.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Peter Xu <peterx@redhat.com>

Let's also add a Fixes tag to be clear:

ec6f3ab9f4 ("migration: Move last_sent_block into PageSearchStatus")

Even though it may not need to copy stable.

I think this is for 8.0, am I right?  It should be very clear if so,
otherwise it's easy to get overlooked.

-- 
Peter Xu


