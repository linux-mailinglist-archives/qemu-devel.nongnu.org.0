Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755755F5948
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 19:44:53 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og8Rv-0008Ln-VE
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 13:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og8OC-00059U-5C
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og8O7-0004mS-ER
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664991653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xBtyPQpEOCYHe4fRhlSzXWi3lehS2JjNNbm33oK+NDo=;
 b=N0IaxpsNCOT40RHf5zRZZOIP4ou2xz6J1D4HEftXXoHwyuTE4/qcFdOVFKg5JyRozJETac
 wfK29PZTazpoJY0wTwXh53DA7S+fcteI6WNduhsqmMcpJ0J2rmY8InF6cTMYwSRG80Noj8
 lrNzIzfNWcUPryPZNF9ZMGJuD3fSR4Q=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-oY2vghUTORutgaJKdIaMoA-1; Wed, 05 Oct 2022 13:40:51 -0400
X-MC-Unique: oY2vghUTORutgaJKdIaMoA-1
Received: by mail-io1-f70.google.com with SMTP id
 y10-20020a5d914a000000b00688fa7b2252so11398307ioq.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 10:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xBtyPQpEOCYHe4fRhlSzXWi3lehS2JjNNbm33oK+NDo=;
 b=hY2WacF98STNJBVyA4rdqYOuqo7f9TJGA0AGY7uFz9LxTcQgMtr32c5/IEnk1ZDsEr
 RpfEpSzwQnAi7Uz71JO2+KShI1zTmp814apBmy3xYibDUpSnYOuYRaCkc271ZosPDCdc
 3jCWB4t8BD7+4IJH/m+aRY2VM0Mcc4nhe27Rfipzce9PnNPvzDYd0sqarixxP/OGyLzr
 5EWuzqRKvVdNb9Hd5qZb9YMglSTlyvdHC/++FlA/1hhmDqrQ+21GrYqXI+uzPzWW8nqa
 9zOj4uc5uQcDXkWiM4Dw7iUY+nys+OdPh3uyEjcJAAs0P3imkxznHsLQcZyGZ/6eqwRg
 F+eQ==
X-Gm-Message-State: ACrzQf3uB7Rpf+x/mLmlfi4z8kb+i3+bV1yBMNAvsKJD7TU3hAeZFqzc
 sRIqCc+tclEDsSGWsSl3aC71KNvGa9z/o5n/vTRpmQLiJ5/pN5+wQ7kGwk78wt/M2SaJ1HhbMmX
 fChV0hKtcdt8EH+5o7oDCQJEROZzHyBQ=
X-Received: by 2002:a05:6638:22c5:b0:35a:88fa:3d3a with SMTP id
 j5-20020a05663822c500b0035a88fa3d3amr359563jat.115.1664991651107; 
 Wed, 05 Oct 2022 10:40:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gPwMkaB1ernsQJad1AomLDAs4IJU1OYEo8Hdxa96HUZGhravxOgMHZb8U9J9g8TkKD6wfQbzLVWrlPHSKn3A=
X-Received: by 2002:a05:6638:22c5:b0:35a:88fa:3d3a with SMTP id
 j5-20020a05663822c500b0035a88fa3d3amr359557jat.115.1664991650909; Wed, 05 Oct
 2022 10:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221005142006.926013-1-afaria@redhat.com>
 <Yz2yAWVMUrkaCNYY@redhat.com>
In-Reply-To: <Yz2yAWVMUrkaCNYY@redhat.com>
From: Alberto Campinho Faria <afaria@redhat.com>
Date: Wed, 5 Oct 2022 18:40:15 +0100
Message-ID: <CAELaAXxDapn09+5teCewrOHe3WUDS2eTB+wVFaHZv2eOs5YYAA@mail.gmail.com>
Subject: Re: [PATCH] coroutine: Make qemu_coroutine_self() return NULL if not
 in coroutine
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 5, 2022 at 5:34 PM Kevin Wolf <kwolf@redhat.com> wrote:
> The coroutine_fn annotation for qemu_coroutine_self() is wrong, but I
> think it already works outside of coroutine context, and consistently in
> all three backends, by returning &leader.
>
> Changing that to NULL makes me kind of nervous because the callers might
> actually access the leader Coroutine object, and after this change they
> would crash. (And even if they didn't crash, they wouldn't be able to
> distinguish the leader coroutines of different threads any more.)
>
> Do we have an actual reason to make this chance? That is, do we have any
> case that was broken before?

No, I just wasn't sure if the current implementations would return a
meaningful value when called from outside coroutine context, but it
seems they do. I'll send a patch only dropping the coroutine_fn
annotation.

Thanks,
Alberto


