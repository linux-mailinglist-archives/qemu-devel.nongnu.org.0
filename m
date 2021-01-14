Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29D2F6901
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:09:07 +0100 (CET)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l073S-0002A3-Nt
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:09:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06li-00054A-RQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:50:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l06lf-0007Qd-Cn
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1ayf4h0MhZTITrn60XP3iYuOg5RjG+9VwIQ55Y3qV4=;
 b=ArxSsFdvaHG9PGFbXNz9ZjZKJuuUC2zoKaehUzf+bQEPpzFIxtxE12jIQrrCq0044G3IWP
 SsvC1mnVD1rY/avue/Go6cZRHh2Sy2XDZVUxKowLLnYNwaSZovT7qJHGCNb59HdK/DzZ97
 W9/lErcZrohH7n/OXAYvdEhoacMlSw0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-ogJJU_4EN7KWj9dvs-8U_g-1; Thu, 14 Jan 2021 12:50:40 -0500
X-MC-Unique: ogJJU_4EN7KWj9dvs-8U_g-1
Received: by mail-wm1-f70.google.com with SMTP id h21so2159445wmq.7
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 09:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V1ayf4h0MhZTITrn60XP3iYuOg5RjG+9VwIQ55Y3qV4=;
 b=tTkAQEJ/ua8m8QR9XD4k0+Bz+5CHPQxGNOPokSXLA9VaKikXrMNh+olPzMr3e8RARD
 sWzc50nbWR4IBNzM3kc9Whn/o1vpbdDF8MlJ5Ng58TOxH+EHAtDhs5nwl1k6WLNu+//W
 gYIna3DLn9tbKKQ0pFaxB7ug58c46IC8XZNx2x0C3e8SYUCKI787GOzndGpVss/KwveD
 WouQ2GBB2sBP9oD7+hwSMLYIdcw33xQgorjLtWl40J++2a20bK0JlW8qSKW5h52NlS5F
 spfBgqVMOw0GGBKy2qLpyXKfGy9ALnhy8V1c2/MZ+UAuBrXB3E6ciDwxCIrfgYzJfmwF
 9AIg==
X-Gm-Message-State: AOAM532B0zxaNsfS6NWNBSGLN28mJtUlKc+91D/Eaf+W6imrzYz9CDWi
 +pJ6CKxGttkjLR0k7kFUqV44gWc0BhD5e0NFJa/FZd8URx/UuyJyDh51yjeF+pLTaiyN+ex3GV+
 U7TA/ViWUTFhHWfY=
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr4840121wml.56.1610646638545; 
 Thu, 14 Jan 2021 09:50:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwatYPGMkXcr/ECbVG8dekOY2nuO0ZaXfqBgSrDr9EPNCLhaoDfknVDMgv4iwUSAZ3ThV5iw==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr4840108wml.56.1610646638377; 
 Thu, 14 Jan 2021 09:50:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s20sm8964894wmj.46.2021.01.14.09.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 09:50:37 -0800 (PST)
Subject: Re: [PATCH v2 08/12] docker: expand debian-amd64 image to include tag
 tools
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6234da80-d742-fd6f-888c-5d2f5debfea7@redhat.com>
Date: Thu, 14 Jan 2021 18:50:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-9-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 1/14/21 5:57 PM, Alex Bennée wrote:
> This is going to be helpful when we want to both test the tool
> integration and in the case of global generate a xref doc build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/debian-amd64.docker | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
> index 55075d9fce..a98314757d 100644
> --- a/tests/docker/dockerfiles/debian-amd64.docker
> +++ b/tests/docker/dockerfiles/debian-amd64.docker
> @@ -1,7 +1,7 @@
>  #
>  # Docker x86_64 target
>  #
> -# This docker target builds on the debian Stretch base image. Further
> +# This docker target builds on the Debian Buster base image. Further
>  # libraries which are not widely available are installed by hand.
>  #
>  FROM qemu/debian10
> @@ -14,7 +14,10 @@ RUN apt update && \
>  RUN apt update && \
>      DEBIAN_FRONTEND=noninteractive eatmydata \
>      apt install -y --no-install-recommends \
> +        cscope \
>          genisoimage \
> +        exuberant-ctags \
> +        global \

This clash with Daniel's series which seems ready (and harder
to rebase):

'start using libvirt-ci's "lcitool" for dockerfiles'
https://www.mail-archive.com/qemu-devel@nongnu.org/msg772839.html

Do you mind getting it merged before your patch?

>          libbz2-dev \
>          liblzo2-dev \
>          libgcrypt20-dev \
> 


