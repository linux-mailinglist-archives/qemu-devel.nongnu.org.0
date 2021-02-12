Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956631A5E9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:18:26 +0100 (CET)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAetU-0004tU-JE
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAequ-0003De-Av
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lAeqq-0003Ov-CE
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kjH46/1g0SpJPUv6r8tiEExu7j+01hAVcKlCNxOL7Dg=;
 b=GUGt1w23Qn90qUqJMUEcguvwNEPCqfO1n4zALoCp/2YDJ0Tjy01+cQ+H9LyYHZj+mpUVHv
 ZgLiDvkQSIwESY/d6OzBOV1dDTXstfUG/+lE33L2U4hgtXuyI9LUBWPMr6TiT4SMg04gUI
 M+pnnxeZASitMAMCBDY3vXp0epqLfEM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-1uFLpn4rPE6icG2oLTO3Dg-1; Fri, 12 Feb 2021 15:15:30 -0500
X-MC-Unique: 1uFLpn4rPE6icG2oLTO3Dg-1
Received: by mail-ua1-f69.google.com with SMTP id u6so231857uaq.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjH46/1g0SpJPUv6r8tiEExu7j+01hAVcKlCNxOL7Dg=;
 b=A3dWNsFyCQOg2quk8U0kir9/7mhmFG39wLa0ulpfLi2OL7BudTLZfL/GIY3mjqyJTp
 4w5NvwE+iGz2fy2t0t9ncnbPEFKBUJAwgP3K3XKfNQ+ymuiARjk0ojzQMioIwULoLPgm
 ET8zvY7JP8c7mJ0jieKtk5RmEQanGsaJ6HVK6pDaJx/3ZTxPppvChmo3PZIvffYrDCOB
 36DH3tcuTEBA+/YyY/1TDkyyYiHaefv2TSgxrGI3KORwNq25LJcYc/xV8QiqH33w3RdD
 Bxrlplr0U/GAlDqbOoj1ikhsaA/I5QG0O73WaACLAONSHkSUwvMUXSjo+rknglqdbrmg
 r+cA==
X-Gm-Message-State: AOAM532eF8biDbgOUhcoMUjlEqUlH3dJDiA1t3ObFKMExGYnH5D0aFoo
 fCqaYGiv+fuuRepryz8tDzmoiLpZ4XC1gzx8mw/ACiYox8dZmlFj8Hs2uTGZ5vjwFqtVgmynbij
 GmzU5spBYTt+UwVe5ZnYcPwn+jNMP2zI=
X-Received: by 2002:ab0:3901:: with SMTP id b1mr2961202uaw.5.1613160929678;
 Fri, 12 Feb 2021 12:15:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy10ByNYF8bR7yng1zSuiZzGYVT4v/xMCFhX1/kgC4AZ836b1mr1DXlD9bObs3X3wlEYqlyEfdACP5ywBV6qOA=
X-Received: by 2002:ab0:3901:: with SMTP id b1mr2961180uaw.5.1613160929487;
 Fri, 12 Feb 2021 12:15:29 -0800 (PST)
MIME-Version: 1.0
References: <20210211232835.2608059-1-crosa@redhat.com>
 <20210211232835.2608059-2-crosa@redhat.com>
In-Reply-To: <20210211232835.2608059-2-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 12 Feb 2021 17:15:03 -0300
Message-ID: <CAKJDGDYKYZ6hfEx75q8qxQyE0fYHs3_pUoyVz7kGp75vVnwbAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Acceptance Tests: bump Avocado version requirement to
 85.0
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 8:28 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> This version (and 84.0) contain improvements that address specific
> QEMU use cases, including:
>
>  * Being able to download and use Fedora 31 images and thus
>    re-activate the "boot_linux.py" tests
>
>  * Being able to register local assets via "avocado assets register"
>    and use them in tests
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/requirements.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


