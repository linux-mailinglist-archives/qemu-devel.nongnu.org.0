Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7FC3B48DE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:40:41 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqkq-00016K-Bl
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqia-0007bi-Nt
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqiY-0007oW-Be
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624646297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRzQZcg1ux97nYQkxzfq3wGNgRH73GwAAxMTBxQoM00=;
 b=dCr4K2mMrEr2y7XMlX+5PhEE2uI5LOY+pfUVpg5VhNQBFEFHyWfzrDB1y/m7GBnHBN6W8F
 +PMHRhpu+gYr5P1v6fcMuCwT/kKA6ilSM3+wi8so34QK1xE3Y7XCfhEGS+Wf5YtVQUZGD1
 ZhatNdIh3pFqv7aHCXJYsp2kJP1BkDA=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-Tsgbb1AJM9ia5BchVaxcLQ-1; Fri, 25 Jun 2021 14:38:16 -0400
X-MC-Unique: Tsgbb1AJM9ia5BchVaxcLQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 k13-20020a9f30cd0000b029025e3e26edb8so2692149uab.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRzQZcg1ux97nYQkxzfq3wGNgRH73GwAAxMTBxQoM00=;
 b=i1SQtOxCM64Y7BkOqcAeTtly1rqAR22mo0+Gj0JJih0BIJbjKoSl6A1A+twD14LCVy
 0557VexSJXgX1AHaZxSpCy24+/DD6/MJs91QVaAa55qbqqPkGpjSCWDB8fvmfw2pXwPm
 z5ccw0m6ear1ICE/Y12qbIS3XuyJgKnpWPbOxVuw/LqIaNgRoB6I6oHhBKlI6VBd3lQL
 ZRH8l/6UVlGXcth8x0pFx/pljlOhTjZ3k6egD9DBHLOkQxeu1KbKY89qokKVRXlcBkIz
 /yvmDPCHkI/yUB43pvltoRIqT7GhtdMZwAI7OVotKoU/cLhwapfe5shk2nS+z2Tf6x3T
 v/Xw==
X-Gm-Message-State: AOAM531CWcJ2dSAmee+okmru3Lr3SouTNV1LIC0tX9hbi6LcLgvB9zmk
 HUswM1rcgei/lKvKpttv3LYduhblTB1glk66euVV1eWxqW5ZJ7OD+nP1iOy+JOF0tI8LsBgbW9t
 roI+6Xk+R5dGzXjW6zDnnvVFlmrTNICo=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr10733100vsq.45.1624646296037; 
 Fri, 25 Jun 2021 11:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSZhUMY4X+JgBAmPIqtydRpoEdZOnjEgRk2ffdhDVmtPkWGbLaQD9+3fBM5PApy88jztVVJ6TGYFOhXwx7wDE=
X-Received: by 2002:a67:fa0a:: with SMTP id i10mr10733075vsq.45.1624646295922; 
 Fri, 25 Jun 2021 11:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-11-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-11-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:37:50 -0300
Message-ID: <CAKJDGDa=P15X5d4Yk4hsT2soJg3VhoMgF37nbWEiqK3oaw_37w@mail.gmail.com>
Subject: Re: [PATCH 10/11] python: Update help text on 'make clean',
 'make distclean'
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> Just for visual parity with everything else.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


