Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB34F3EDCBA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:00:53 +0200 (CEST)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFguq-0007Vo-PN
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFgtg-0006kw-CE
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFgtc-0001zR-Ne
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629136775;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9o+lHjjshxyBhBcbNvUpoALJHhKQ7nK6oS+s5mzjjI=;
 b=aqZXNLrFQu3MVjzcPu/U/n5g8KE20IQDqV7rfIUnkivuY+7mzV7XNNMUXsbD+OhuRo4YmT
 Jcppb01JtS5xkRL9Frnjy0cgqdmvUUhRT7hhsWnm9+PgeGbc6tiNCQyxDmmmhs4yqyZneA
 gBjmg5MAkujTsBSErIS1UGLywPxTbCQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511--r6X6p0qOIeWa47RHQNUUQ-1; Mon, 16 Aug 2021 13:59:33 -0400
X-MC-Unique: -r6X6p0qOIeWa47RHQNUUQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 o23-20020a17090a4217b02901774c248202so17549612pjg.9
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=K9o+lHjjshxyBhBcbNvUpoALJHhKQ7nK6oS+s5mzjjI=;
 b=kCAgYNBRDZ1D5ABVuIF6vIz8IBz5ZiBEvMD8VzzAlSaHEDjympVbaU3rV9zEkldV9B
 pH4n7FksRIYO7VvPmd2mu7RuN/1M/HWoAg7quVAM5OcxqP4V4FON5ige9c1ptOcoNifu
 8KtywgXIgNiLZjHFDmT5CCi0WfpILTidrgpdafY06KybizQ6ZEbs4Dg3qcXwjECVdjaf
 qH1A0ZL02dF86tL8ozeggd04om+7qfmksXDYqs3mgMIyMa01TosnaGrEXReDCYaG6zY/
 qk4hS1pjCfN+9hhadx7XuO2NPAJJrCvgXLqWLHvcgPqpu3mnoHuaFdGAfBC1zgeJpVzd
 X/fA==
X-Gm-Message-State: AOAM533rZQCNOK4Kistc226qeMg9Nq9gOJUe5bh3uN1o8vST7nk8Ztt8
 Oi3pdV7MmYtGlj+YZGNl+qojvI4t2QVvL4+E44mjtRlwJcJ4YciZLDCNtpDaiafNRlhs75MWTmJ
 9J44abF/7s7jo3Jg=
X-Received: by 2002:a17:90a:17a6:: with SMTP id
 q35mr384521pja.86.1629136772879; 
 Mon, 16 Aug 2021 10:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkEycaDQRY8G6BLCx+daaIs0H/T+/YRMks6Si8BalUym+St0abs4Dhl55y6jBJEA6yzu94+A==
X-Received: by 2002:a17:90a:17a6:: with SMTP id
 q35mr384497pja.86.1629136772648; 
 Mon, 16 Aug 2021 10:59:32 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.241.196])
 by smtp.gmail.com with ESMTPSA id u24sm53081pfm.85.2021.08.16.10.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:59:32 -0700 (PDT)
Subject: Re: [PATCH 2/2] Acceptance Tests: updates to the MAINTAINERS file
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210803193447.3946219-1-crosa@redhat.com>
 <20210803193447.3946219-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <03be2ab6-84eb-8806-c992-458abedc50fe@redhat.com>
Date: Mon, 16 Aug 2021 14:59:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803193447.3946219-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 8/3/21 4:34 PM, Cleber Rosa wrote:
> The tests/acceptance directory is currently lacking a maintainer
> entry, even though I've been performing that role (of course with help
> from many others).  Thus, its status is, even more now, Maintained.
yay!
>
> This also removes the currently broken Trello board link, which was
> make unavailable unintentionally by a third party.
I can still access the link. Anyway, maybe we could migrate the cards 
(not everything, just those which still make sense) to the GitLab's 
Issues tracker?
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b1a8e442..d35b948e8d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3418,11 +3418,11 @@ F: tests/tcg/Makefile
>   F: tests/tcg/Makefile.include
>   
>   Acceptance (Integration) Testing with the Avocado framework
> -W: https://trello.com/b/6Qi1pxVn/avocado-qemu
> -R: Cleber Rosa <crosa@redhat.com>
> +M: Cleber Rosa <crosa@redhat.com>
>   R: Philippe Mathieu-Daudé <philmd@redhat.com>
>   R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -S: Odd Fixes
> +S: Maintained
> +F: tests/Makefile.include
>   F: tests/acceptance/
>   
>   Documentation


