Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1480B3BADCC
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:20:43 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m04rK-0002q0-0s
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m04qP-00026B-3t
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:19:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m04qL-0000qf-Hm
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625415580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/4g7hUGwRWtgz8udW76AeyQTylPdI9djEklbrUQsw8=;
 b=OqY5vgoQzWlmohvUDD6d55PafL4OOto3TnZ62IF6C4QDhYfVWHZ00UXaZAwexHJyWYxG/Q
 J4yA2E3Wb1VSspfG50oiiYVW3qEqoLataNL9YjM2ODUwVVaEWVxghX133Ib3IXqn3TduMs
 zsEYEpT4hcpoXGpzTsIAF4FjIK15OQ0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-21Pf3R8PNnSyeWObZUuiyg-1; Sun, 04 Jul 2021 12:19:39 -0400
X-MC-Unique: 21Pf3R8PNnSyeWObZUuiyg-1
Received: by mail-ed1-f71.google.com with SMTP id
 n13-20020a05640206cdb029039589a2a771so7803191edy.5
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 09:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/4g7hUGwRWtgz8udW76AeyQTylPdI9djEklbrUQsw8=;
 b=eX06ThZZfbJwNxz8KzBOPnzvDwR8gg5EsoMkhjN1FpSjT/b6jTYVl8tt/dwQgRyyjp
 PMPrUelli5hcQ3nnxcWDDrx+tcWhwQZ+Bc4coS/x4HgkIe1Ac8F9jpeibCO7sV+mpXcy
 2VNSE6fUk94yVOw8Sxni3CQ+onbZqURTCkqFgJCKSBbPAjUwn95ONpgp6BKfprFI465/
 faX6v064lDjP6MSHlLkZNW9FHs5jNE+O2ILBdD8Tb6smuO5bo+6nO0IGtkFUlhMunwTa
 8ADPXWuiCrD7tH/Utpmat+sxHxC8DhPKfFbaS3fRAhwgP0TH/+fMZAQkagsOFNTt4xKz
 0Czw==
X-Gm-Message-State: AOAM533PDLnTqTUo6HHVwHJWDyuQ9Ri2EOHkPTlSSfPM9zQe02DNqaR0
 jfw77zKNSItB3i9LISm6bjhd+7nxorXm5tPwsDOIXiZZCkdnFnDzhs7yc8fhtVhWFj2KLXGauuS
 lOrZEmLPkD/Bn23s=
X-Received: by 2002:a17:906:c241:: with SMTP id
 bl1mr9304378ejb.536.1625415577993; 
 Sun, 04 Jul 2021 09:19:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGKVJDft9eOeloa6/X+y1RkVzUWdHwoqUXUMFDXoddzEprpA04PIY2qQUevPHY6yEJCaNLnw==
X-Received: by 2002:a17:906:c241:: with SMTP id
 bl1mr9304363ejb.536.1625415577788; 
 Sun, 04 Jul 2021 09:19:37 -0700 (PDT)
Received: from thuth.remote.csb (p5791d89b.dip0.t-ipconnect.de.
 [87.145.216.155])
 by smtp.gmail.com with ESMTPSA id c9sm489263ejs.28.2021.07.04.09.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 09:19:37 -0700 (PDT)
Subject: Re: [PATCH 2/2 v2] Fix SHELL variable in Makefile for Haiku
To: Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <CAOakUfM6HED-01ntpHTGXuQVg8XX4QnwacE=+eho_NOdQsKfvw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a48db2b4-fda6-1de9-1eb5-e4388a693bf3@redhat.com>
Date: Sun, 4 Jul 2021 18:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfM6HED-01ntpHTGXuQVg8XX4QnwacE=+eho_NOdQsKfvw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/07/2021 16.28, Richard Zak wrote:
> Signed-off-by: Richard Zak <richard.j.zak@gmail.com 
> <mailto:richard.j.zak@gmail.com>>
> ---
>   Makefile | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 30f19d33bb..37124410da 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -14,7 +14,13 @@ SRC_PATH=.
>   # we have explicit rules for everything
>   MAKEFLAGS += -rR
> 
> -SHELL = /usr/bin/env bash -o pipefail
> +# Detect Haiku by checking BeOS variable for host CPU type
> +ifneq ($(BE_HOST_CPU),)
> +  # Haiku doesn't have the /usr directory
> +  SHELL = /bin/env bash -o pipefail
> +else
> +  SHELL = /usr/bin/env bash -o pipefail
> +endif

Why not simply:

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -14,7 +14,7 @@ SRC_PATH=.
  # we have explicit rules for everything
  MAKEFLAGS += -rR

-SHELL = /usr/bin/env bash -o pipefail
+SHELL = bash -o pipefail

  # Usage: $(call quiet-command,command and args,"NAME","args to print")
  # This will run "command and args", and either:

?

  Thomas


