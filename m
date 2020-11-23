Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9972C0F05
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:40:38 +0100 (CET)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDxF-00028Z-RW
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1khDvk-0001Y6-3i
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1khDvi-0005ze-H6
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606145941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKo4CC3BERcplLYNeIJUhNtVwiF0gmpVzPjqG1519AA=;
 b=PImzWr01f3+ErHj9sYKcL+IeKRwGlFc6mLgXSUPioQGuZXEVlksgOLtZhp+70/uSCIyqA0
 gmjUgFfoYcUdKuifYcUvOmETk+rSNqAM51OvjYznCt6Kc02mXYH0xCvcDGDGolR3hR3tyH
 P1VCtGWc59rJyftJW2POdOOyADZXl/w=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-mv2hPGp9OGG28BI2TNwijw-1; Mon, 23 Nov 2020 10:39:00 -0500
X-MC-Unique: mv2hPGp9OGG28BI2TNwijw-1
Received: by mail-vk1-f198.google.com with SMTP id b199so8075971vkf.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 07:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pKo4CC3BERcplLYNeIJUhNtVwiF0gmpVzPjqG1519AA=;
 b=Whtl9/4VwoUed/rDWm2XCXodANLCxbZhMi0ormZSh6tZGGGpqUY3dgNOoldP01p1s8
 S801Ur4ukolw6oolHiZW0wOw5b/k2Gh4unBfxVNTVsqWqI1OY+aT+j6d6m/GFbah16HX
 zKIEN5uSDnNuwXhvxfGLyLPW5ccRJCISTLVwTaL6VzL4IqOafrrUcPz5+jH8XdLEFVep
 0EMBuGUFxW2aPGpNxQMlrsykRNpt/QyCZ8NVPucNoD/IOY0y4QOEiy7Qjdx/0GkLNUt5
 mmQhjgZewcg3+VXJ+pytt9aIRGfkH28W9fTeAiQka+xbrvQ59I8aFsDcJebwyQhfwhto
 wOUQ==
X-Gm-Message-State: AOAM533IbHTID7z6BGAFlx3c4dSAjABicuds5gFv8ARUm13jkxoTjE87
 io4PsN5oj1eAkpe0VDIDpJuUFx/7ItMNdC/iPHHM7TuTHjd+MWIpRFDZVkoWfEZR4YA5Yr7FVCe
 KchN2N5XGj1hGSbxAsofq7EXrcXSkN0A=
X-Received: by 2002:a1f:1cc4:: with SMTP id c187mr368200vkc.1.1606145938477;
 Mon, 23 Nov 2020 07:38:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3FDqL0v9nyGbJaoK49DSrM63jBCggvnaT3vomFI4AEVxmPRQ6JlZ/6vJXNy85ivxsjR648/h89o9yz32RFWU=
X-Received: by 2002:a1f:1cc4:: with SMTP id c187mr368064vkc.1.1606145936797;
 Mon, 23 Nov 2020 07:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20201113133424.8723-1-alex.bennee@linaro.org>
In-Reply-To: <20201113133424.8723-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 23 Nov 2020 12:38:46 -0300
Message-ID: <CAKJDGDYk0qhEqi7Hq-M3VZ7Ai9u=i6TNStoLacek88cFXobyyw@mail.gmail.com>
Subject: Re: [PATCH] tests: add prefixes to the bare mkdtemp calls
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@hackbox2.linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 13, 2020 at 10:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> The first step to debug a thing is to know what created the thing in
> the first place. Add some prefixes so random tmpdir's have something
> grep in the code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@hackbox2.linaro.org>
> ---
>  python/qemu/machine.py                    | 2 +-
>  tests/acceptance/avocado_qemu/__init__.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


