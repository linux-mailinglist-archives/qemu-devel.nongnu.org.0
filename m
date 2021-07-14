Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB923C9374
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:57:41 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3msu-0003Fy-Cq
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mrQ-0001fg-RI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3mrO-00057C-VF
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626299766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ohlZxsLCklnfM4qpO2gUAQvpwj53tEL9qZVK24EqcZI=;
 b=gw9hISUzAqrSmf765PrURcxlSe8to6V1kAc9fGD+QSlOgJK6mTpkldyzC5whtN2vN+/roK
 BXuIv4rMlq2kBjFa8zeYFHIrTdtPZjvL5TWGouq1BgWyefMOkf6TfoD0Rkk0fh82lF3ibI
 FASOjVO0h2zC5eX8zR2PSH3NBe+cm40=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-wXuiPlqHNPKC48gbz464Zg-1; Wed, 14 Jul 2021 17:56:05 -0400
X-MC-Unique: wXuiPlqHNPKC48gbz464Zg-1
Received: by mail-ua1-f72.google.com with SMTP id
 e14-20020ab037ce0000b029029e1110eeaaso748957uav.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohlZxsLCklnfM4qpO2gUAQvpwj53tEL9qZVK24EqcZI=;
 b=EnImrOOgAP9/InQyduJEojp8XvmZbjB2yefergESxUvZEWEY9GwyIUwH0uNZpHnuHe
 bgdibhvaYad+Ek9caWnOaGryN50diS6qJRWGJfdSMHIy1SZaFA9IVl+hPJp61gkE0QDU
 /z9iPmfIQ423C9gKqYP+CJxAsdSbQvc4XwZDdaSq1UTBSp8hBG7XdI0ubptpU75uM2UX
 EDQCb0ykHk5IRUwlY44iMJ0GduBqZNjESnroCtvfqJbbaZksXZdifbi2F4WiwD151ue1
 lSV82QnWjR7gj7OoDC18w8A02mGvE+3sNLrFrvP7USclL31e8kYlPPrdlsYWpkhdCcBv
 BZPg==
X-Gm-Message-State: AOAM533kGwomCA6Oo4JohUtUyBiPxvBXUvqLunKSMUM8bljDRAaPm8U2
 kwybBQBsyKCNPMF82K2OOustjD+2+MScFk+oxEu/YHlBWmzbXPNWPAfeNSqF8GTuaXKGrGVrNAe
 VBMyvAZOr7KOGlZJ9A8bXxk+r/PZBFPo=
X-Received: by 2002:a67:31cd:: with SMTP id x196mr400684vsx.50.1626299764915; 
 Wed, 14 Jul 2021 14:56:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrE/LlCxnnlagd2DXMw5ViQxAYCpTtFq1N2hjYg5ZcKqj/gbsDnKdmtVBGrudfk//C8JZhg37JR3XlwRlc1po=
X-Received: by 2002:a67:31cd:: with SMTP id x196mr400671vsx.50.1626299764761; 
 Wed, 14 Jul 2021 14:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-6-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-6-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 14 Jul 2021 18:55:39 -0300
Message-ID: <CAKJDGDZpneuWxV1RZDx3N8YEdkRN7sT2OoAJzEj3mM3YgXKfXA@mail.gmail.com>
Subject: Re: [PATCH 5/6] tests/acceptance/virtio-gpu.py: use virtio-vga-gl
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 2:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> Since 49afbca3b, the use of an optional virgl renderer is not
> available anymore, and since b36eb8860f, the way to choose a GL based
> rendered is to use the "virtio-vga-gl" device.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


