Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0253C936E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:54:37 +0200 (CEST)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3mpw-0007Ip-Nu
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3moV-0006Cg-1k
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3moT-00037E-O7
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626299584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ecWMW3vbMt1HAIZNlAT/dd8BXp5Mh+gtspAnm1AfciY=;
 b=KlcfEYXtc+nNFYcY22jnZ1jzeN50LJ2jUudancf82p2Jk8Jm3dzSdXMqzCuifpJxQAs7cW
 TbipBEJTDzCimz2cWyR2h8+cMSPIjT/flASMrNkET4MgNfHkSpIUzRqcIuEw+MmEpNIoQ6
 nif15RBK51Uiimdu8a1qkCUQ8Tx8aOY=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-5Nni_ilUPUaDk9c4TZ8bSQ-1; Wed, 14 Jul 2021 17:53:01 -0400
X-MC-Unique: 5Nni_ilUPUaDk9c4TZ8bSQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 x1-20020ab038010000b02902a206a03857so750299uav.3
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecWMW3vbMt1HAIZNlAT/dd8BXp5Mh+gtspAnm1AfciY=;
 b=WotyNv3XpLTiuN09lur7WjxHR5zMUj2ydBcLtc1Zf7ne3LXW155ofNINokUk6ZRTrJ
 rZi54pwg/vAxNSMOLE+OXqQX9crPye9wiS+0U8edq5OLe3f6TO2fBjLoBcZgQCbKodEJ
 yNDWGbZIL1uIaV52BLFtKkkVNgll79kai8k33UNu/p7ooWMS+FCY/mtESGdSiTMjYGHd
 0ZtrTAmN3C5wnhELo7IWAWFSeEqKO5Mi6MEwQpGgldHzk2N8EvpjG8+S89L3H2OiP7yk
 fEc2S2jCA7SBXZ5VbNVyBAyw6Lzb80CHz6OSwdugt6/DyrU48iBOU6uiXfYOammkk0fI
 k70A==
X-Gm-Message-State: AOAM531WH7P0zZc49JfknT2YY0NLgu8kLbIHnTJYpfYGJPP4Dz04osZE
 h8Odrko/v154mIRIVggMO1dsom9ue7+W0s4PhKzb1nfIpmNrvUXPtiYUBGoki4kw5UoTQlr7i8s
 MbgjfPK3lye8I9c3M9/iE/hFLUcrgViE=
X-Received: by 2002:a67:31cd:: with SMTP id x196mr392451vsx.50.1626299580838; 
 Wed, 14 Jul 2021 14:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOWFzui3hjshZmu6LfgF5RxkLgUVU7ljQeasJkbuihFDhcj8Uium5/vdPUOLt47rA4BW+6M5cgIYH+V51C+zg=
X-Received: by 2002:a67:31cd:: with SMTP id x196mr392444vsx.50.1626299580715; 
 Wed, 14 Jul 2021 14:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-3-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 14 Jul 2021 18:52:33 -0300
Message-ID: <CAKJDGDZ9SkpS9N23fMt_WeHEP9ZX9TsNEzv=2UMYXvt=t39POg@mail.gmail.com>
Subject: Re: [PATCH 2/6] tests/acceptance/virtio-gpu.py: combine x86_64 arch
 tags
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
> The test class in question is x86_64 specific, so it's possible to set
> the tags at the class level.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


