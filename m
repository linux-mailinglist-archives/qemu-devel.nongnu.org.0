Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D532B8D7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:09:04 +0100 (CET)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHT7X-0008FG-E4
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHT64-0006ee-H6
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHT60-0000dx-F1
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614784047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=akgiJ1zEdbhJmXdgz4mSDTYkdPBB3VzLA2Zh2dLBJLA=;
 b=SG0PzQRPpLTTR2mGmHISIjVHGdqegGbvR8xq6QqC0nC1eEaLA3pCIUuvDxpfirjt9up7dG
 snLElKA/c1aozztmaV7NOhpdC25p8pgmhu138FNZ6kU2pIrUVXXZ9HpzXsCTuTvY6u3ABf
 d2LWITUHDCpbwpcY1HkQ/HE8GDCqpL4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-1MoGZiMyNxK9gObnPadvYA-1; Wed, 03 Mar 2021 10:07:26 -0500
X-MC-Unique: 1MoGZiMyNxK9gObnPadvYA-1
Received: by mail-vk1-f199.google.com with SMTP id b21so6451417vkf.22
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 07:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akgiJ1zEdbhJmXdgz4mSDTYkdPBB3VzLA2Zh2dLBJLA=;
 b=KeqMXGcPONytZUj1qITnSslvm8ug5ybVKx2FtYrxBH3NQvlaIHDs4ALU09bGbqx/qv
 9HBYfK0G0vS3Vt0oLIfEKcfDUyeUgtO706u9spT9QvMUc1I+1NjI8sO05P2UdDOOk09/
 Fq6bMxfrVf9vG3kNr/eT632TbxnLYPuZ/sqwcoX4ZTdZL1drU5tbSJ24UhLUCclaKING
 Vp2rw+SPwgN7GmOh7alOXHoiGKUmpuze+CXE4Bddp2CyCz5tKotRe5FfOBA77hTOWWKx
 ZwYrvBScxIyQLBT5qVfqR/woM+eVUGu9DiOlQJz8gjWyus9gCkcCTJDM4kz47f8M6wQS
 Mspg==
X-Gm-Message-State: AOAM531e/Oap4/aQ3ES7o/QkZoOLcFTiphKj0SuwEBiC5Q22+WZ0GpSw
 Je3tJc6lcylkFcxL9furCTQgAsp4s2y50djNf/onKpNg6U9eZBLYbu1Z4A5zyJ/u5jV9UrRHzp/
 ivbH2/2tqnfPcTp0mjWAqF+nl6OSRm+w=
X-Received: by 2002:a1f:fe89:: with SMTP id l131mr2084241vki.1.1614784044197; 
 Wed, 03 Mar 2021 07:07:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLSbSKiWlk3Dq6CFIvo3gouFEulfoOPmHsXR60H7SxWaCX3GHPrCw1rBYblJr/fV0Nj15euDA/Ax9osylimo8=
X-Received: by 2002:a1f:fe89:: with SMTP id l131mr2084076vki.1.1614784042561; 
 Wed, 03 Mar 2021 07:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20210225232122.1254879-1-crosa@redhat.com>
 <20210225232122.1254879-2-crosa@redhat.com>
In-Reply-To: <20210225232122.1254879-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Mar 2021 12:06:56 -0300
Message-ID: <CAKJDGDbKP-dWDqxCbG-cccUiCxHdND=8zLC_yCLxW=KZdJSULw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Acceptance Tests: restore downloading of VM images
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 8:21 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> The "get-vm-images" target defined in tests/Makefile.include is a
> prerequisite for "check-acceptance", so that those files get
> downloaded before the Avocado job even starts.
>
> It looks like on c401c058a1c a TARGETS variable was introduced with a
> different content than it was previously coming from the main
> Makefile.  From that point on, the "get-vm-images" succeed without
> doing anything because there was no matching architecture to download.
>
> This restores the download of images (that match targets to be built)
> before the job starts, eliminating downloads and their associated
> failures during the tests.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/Makefile.include | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


