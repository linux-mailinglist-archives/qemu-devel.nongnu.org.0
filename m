Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57A4252BA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:11:01 +0200 (CEST)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSEm-0005gy-MM
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mYS9h-000884-RZ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mYS9g-0008UN-Al
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633608342;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mxlCl0tgxBmEC8kDB8eHQNmHaUuW5r0PdP61UaR+8P4=;
 b=T8k/4KhGtdEQObj/gNytZjZQ4I4zJFXem0qQKW6ClP33BF21pYu8Luf3DdGLjnkXTjPEbX
 E+gfS5gM8PxnVyQAtiZNrUSO7XVsF+du3xhE6m25daMV3WQdqZehMpnN3m52yEcytOqUG+
 o9oWieBV9bfmSpIs7e9hJcE70OxHHUA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-p6ccTIPfMuqNEggo4R0Jpg-1; Thu, 07 Oct 2021 08:05:38 -0400
X-MC-Unique: p6ccTIPfMuqNEggo4R0Jpg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so4526433wrg.17
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=mxlCl0tgxBmEC8kDB8eHQNmHaUuW5r0PdP61UaR+8P4=;
 b=oQL76jITHpHbuQQgRQWieMoLJr3zECpyKHHggFM+sYj04VqVWe7ppiVO/wLxF0Ek9g
 eFkGqZ9IrtahzK0Dfic43rjh3XSL/uwY4SXytkpJuUxuZiylJQz2CBVQa6ZWrnlwnB33
 HXuSas1mO0m5x9tAZ+9lmZ5JevbTZN/UaEx8I2QLFuIEITXh5tyDLb+lBzczfwb0tKwr
 v+1IUXX/rmTRRq3tPQkDWEC4FXb3uDIcwMSlDREYjmMWqrRuf04wCspBtU0CpEjw/0El
 gla7WHWIfHVe9BBonQuzQj4PqkMxormJYQ8BPVJVmbXw4aF0lRWEU3dpukJjfs833Vn0
 vjnw==
X-Gm-Message-State: AOAM5305QNtstV8EzkJVt9M/UrhXtoe/FWZliKFeynF7AX7JpeN7n4/u
 z+mfeC/EphiZdtssa846fG+dm4w7s6kFT/UDommeffVq8UUSjpjAnXSt0iZW1M4DgYMd7bdazeg
 txNqfYzCppR0tCVg=
X-Received: by 2002:a05:600c:3393:: with SMTP id
 o19mr3812739wmp.66.1633608337196; 
 Thu, 07 Oct 2021 05:05:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyiyp0i+zTPA2DJFS+TcQPplu2mqMv64b+BU8Ppfo5fzR0aq2sbG/ZJSzJkCCCS7ZsmKDU9w==
X-Received: by 2002:a05:600c:3393:: with SMTP id
 o19mr3812686wmp.66.1633608336791; 
 Thu, 07 Oct 2021 05:05:36 -0700 (PDT)
Received: from localhost (static-168-39-62-95.ipcom.comunitel.net.
 [95.62.39.168])
 by smtp.gmail.com with ESMTPSA id l17sm23991256wrx.24.2021.10.07.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 05:05:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH v3 2/2] migration/rdma: advise prefetch write for ODP
 region
In-Reply-To: <20210910070255.509349-3-lizhijian@cn.fujitsu.com> (Li Zhijian's
 message of "Fri, 10 Sep 2021 15:02:55 +0800")
References: <20210910070255.509349-1-lizhijian@cn.fujitsu.com>
 <20210910070255.509349-3-lizhijian@cn.fujitsu.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 07 Oct 2021 14:05:35 +0200
Message-ID: <87o881doq8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
> The responder mr registering with ODP will sent RNR NAK back to
> the requester in the face of the page fault.
> ---------
> ibv_poll_cq wc.status=13 RNR retry counter exceeded!
> ibv_poll_cq wrid=WRITE RDMA!
> ---------
> ibv_advise_mr(3) helps to make pages present before the actual IO is
> conducted so that the responder does page fault as little as possible.
>
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>
> ---
> V3: Fix FreeBSD compiling errors
> V2: use IBV_ADVISE_MR_FLAG_FLUSH instead of IB_UVERBS_ADVISE_MR_FLAG_FLUSH
>     and add Reviewed-by tag. # Marcel
> ---
>  meson.build            |  6 ++++++
>  migration/rdma.c       | 42 ++++++++++++++++++++++++++++++++++++++++++
>  migration/trace-events |  1 +
>  3 files changed, 49 insertions(+)

Reviewed-by: Juan Quintela <quintela@redhat.com>


