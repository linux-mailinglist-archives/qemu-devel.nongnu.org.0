Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CB2F623D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:44:36 +0100 (CET)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02vT-0002eZ-9N
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02r8-00058C-Mm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02r7-0006a1-2g
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610631604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0xULxtY7J3Rxq50WNXFE9fYB8FuCoEBOy3wrxf6QXU=;
 b=Vs23UPvxzmvuD8f7kn/KUq5ofobAiNGmIKzayB4kKnCsoV/8G+8SzXhsKYDe7PcKiFq/1q
 Q4TNhbFfdnkrSlBh5tspWVRvy7uCzTh0W9cqAQEIgb60lBBxZLzdzx0jMZCc8PKh3efnk4
 zAu1aRh+PoAeoOhOwVTnhA/KBQh/u8s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-yQETq0tQMrOwLAsinPfPTg-1; Thu, 14 Jan 2021 08:40:00 -0500
X-MC-Unique: yQETq0tQMrOwLAsinPfPTg-1
Received: by mail-wr1-f69.google.com with SMTP id z8so2619908wrh.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y0xULxtY7J3Rxq50WNXFE9fYB8FuCoEBOy3wrxf6QXU=;
 b=JBm++Mch1NlP3FElTb1lxTA3jmWU6e66ReAV1ImfvHnAxhFbhr+TGKpAr5F9aGAqSF
 xY0OrWMwBsFU1u9S/qpYYMgDDqSI9+LKBRqr1ndQgHdoa7w6ojaasoD9VuRQ39KT1Akk
 hA/CkeTwq+itnw6rSCRYgdZ6ayYBnX5SzExvWYEz5Arfih1gbmvG3GJBved8T5wRH48c
 h6Bm8EzdbVWPke7XVo6C+XGWc8N5c9A3/wNyVO/MhA0o7BB2M5EfZQ6kxDWzqc74Eq4b
 9RGOVXmFed+eci1S4Hm+c8nEQ79Z0nUQSiqyHUTmy7xFFloi8t+uLmJ8miVDi3gb/e0J
 5xVw==
X-Gm-Message-State: AOAM533gvYDBW4w+u5XKd/0FUGz7K5DTKw3MtzgXe8GmUnioRxTX6NAJ
 zsfrbBmA3QE+q/kudFNYmPQ0S2hHAy9cSPMAoM5yXrxkjuYuYS9otLeKzuaDVhv7fEtUMTIJofg
 tuiu1KucBiOk9FUs=
X-Received: by 2002:adf:d201:: with SMTP id j1mr8045265wrh.212.1610631599377; 
 Thu, 14 Jan 2021 05:39:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7uYTwnfcfnliXw7H2DXdpAvxc6mPgVB+6CBGtHtY85S+mszHWA3ldjmFXo6kmGg5Wcon2/w==
X-Received: by 2002:adf:d201:: with SMTP id j1mr8045235wrh.212.1610631599129; 
 Thu, 14 Jan 2021 05:39:59 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w17sm8131969wmk.12.2021.01.14.05.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:39:58 -0800 (PST)
Subject: Re: [PATCH v2 22/25] tests/docker: auto-generate ubuntu1804 with
 lcitool
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-23-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79f134ba-6a20-0f89-94b9-d660b8dc2ba8@redhat.com>
Date: Thu, 14 Jan 2021 14:39:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-23-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 2:02 PM, Daniel P. Berrangé wrote:
> This commit is best examined using the "-b" option to diff.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/refresh           |   6 +
>  tests/docker/dockerfiles/ubuntu1804.docker | 235 +++++++++++----------
>  2 files changed, 135 insertions(+), 106 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh
> index bc7d8dd5f0..ab1d00fcf8 100755
> --- a/tests/docker/dockerfiles/refresh
> +++ b/tests/docker/dockerfiles/refresh
> @@ -51,5 +51,11 @@ try:
>     generate_image("centos7.docker", "centos-7")
>     generate_image("centos8.docker", "centos-8")
>     generate_image("fedora.docker", "fedora-32")
> +
> +   skipssh = ["# https://bugs.launchpad.net/qemu/+bug/1838763\n",
> +              "ENV QEMU_CONFIGURE_OPTS --disable-libssh\n"]
> +
> +   generate_image("ubuntu1804.docker", "ubuntu-1804",
> +                  trailer="".join(skipssh))
...

>  # https://bugs.launchpad.net/qemu/+bug/1838763
>  ENV QEMU_CONFIGURE_OPTS --disable-libssh
> 

I forgot to mention, the 'trailer' argument feature is very nice!


