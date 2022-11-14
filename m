Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0CE628EBC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouil3-0005S2-FW; Mon, 14 Nov 2022 18:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouif7-0004wo-FO
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oubAP-0000gK-CV
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668438872;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CNBLa2Ad3C6QF1etiP6mfl1gsc3oKQE3MlWZvlXDyZU=;
 b=Gaw9bC02NCsaxj0IkvLCWaaFj3VSWsl8HrXtw1M1ReVCuokvHEesAd4662kTOKk3UFoP2X
 2gYzTZ9sFtoiKt6SiLisLR6ur09J3hjaVuSXplHCtmuUXNiwG5ee5aOjmMvEKUB4M6pkvR
 J0+uj+Qzzhzi25AezQyX7wfMA0+tIIE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-M0hXnAw9NhSUm14bBUIK4w-1; Mon, 14 Nov 2022 10:14:31 -0500
X-MC-Unique: M0hXnAw9NhSUm14bBUIK4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso9070883wmk.3
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CNBLa2Ad3C6QF1etiP6mfl1gsc3oKQE3MlWZvlXDyZU=;
 b=n66TbwL15WAZ/VoXOMSz8lFmEERsWxVd4TeDjhBVtPi00U+8tcnksnRR59+8/YUnZk
 WGELCJJEXw/VY1WpxUGRP0bzNgFDcz+mzAUd0Bk1Xv9aa/HNRu/n9D058Uoxy8BO3cJs
 p2owjM5rjdAG9nG2wVfAK7WMvNRFV37nr4T8zkjpQ4+Vm0OQJSXUXnFnnEobGaQe/fqr
 TiPi4loHp6vKhizfECflJlIFGu1Ehpxe9/t6RnTYBhBlXb/rKnXO5qrw201xO6T1JriC
 1/on3T/1DkeRHwI7hiyQLm4nYBFYqKWOyZS/ddi2eMzNJoB06s6FomuVLOCXB6XBtYGU
 3r5A==
X-Gm-Message-State: ANoB5pmKUtrWhhGhdUD8TF00WZZkdVtJjPT+swVxzp6s9ZTWa2Ib0fG+
 mcziy62++kJ3Nxh1QMlMmGHNzn+sULKG8ta1WZQQbgxjrMERkidXkfG8HN1LDQEZV5ox3awdxTD
 lRtTbFAWVup6MvmM=
X-Received: by 2002:a5d:4f8a:0:b0:230:55fc:5de1 with SMTP id
 d10-20020a5d4f8a000000b0023055fc5de1mr7662310wru.500.1668438869896; 
 Mon, 14 Nov 2022 07:14:29 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6c73BwaZaKlWxR4aGELDWS+YrZaCTTKLS/k323smtc0lNu8O9kwyRtpF3CxzkLaRrnTQpvfQ==
X-Received: by 2002:a5d:4f8a:0:b0:230:55fc:5de1 with SMTP id
 d10-20020a5d4f8a000000b0023055fc5de1mr7662289wru.500.1668438869703; 
 Mon, 14 Nov 2022 07:14:29 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 ca3-20020a056000088300b002366d1cc198sm1852361wrb.41.2022.11.14.07.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:14:29 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,  ani@anisinha.ca,  Leonardo
 Bras Soares Passos <lsoaresp@redhat.com>,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 07/15] migration: Use atomic ops properly for page
 accountings
In-Reply-To: <20221011215559.602584-8-peterx@redhat.com> (Peter Xu's message
 of "Tue, 11 Oct 2022 17:55:51 -0400")
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-8-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 16:14:27 +0100
Message-ID: <87pmdpa7qk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> To prepare for thread-safety on page accountings, at least below counters
> need to be accessed only atomically, they are:
>
>         ram_counters.transferred
>         ram_counters.duplicate
>         ram_counters.normal
>         ram_counters.postcopy_bytes
>
> There are a lot of other counters but they won't be accessed outside
> migration thread, then they're still safe to be accessed without atomic
> ops.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

NICE!!!!!!


