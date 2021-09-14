Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CA40A620
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 07:46:17 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1Gq-0000nt-DC
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 01:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQ1Cj-00078l-9a
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQ1Cg-0004W1-NC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631598115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeHAviR8ChM6Qp+7jZgh9dktLLqP58FqSare2hTeZGc=;
 b=B6kJtqgVst2tRnYTULklTF3SqTG5L/jkGj3opDsjpp8hlJhDR0GUvwI5XIbWe1g9q+iAJT
 hAhu+uh9vMnj6Sfj5deESse2zG5Ja6j7oZmWaLk0lcSlrO4GUxdpbFK2vnAbDhFLzYm5ML
 zTAhxBgWsIRvnpv6XuZgRCQ+sETEu4s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-zd5RblM-MIyEqzpzTnd90Q-1; Tue, 14 Sep 2021 01:41:50 -0400
X-MC-Unique: zd5RblM-MIyEqzpzTnd90Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 j193-20020a1c23ca000000b00306cd53b671so2455555wmj.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 22:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aeHAviR8ChM6Qp+7jZgh9dktLLqP58FqSare2hTeZGc=;
 b=ESgOyboa3ciugBQzX8NHq+yTqHUeQ9Bq+s5Ts22n7nCv/GK6a2LPQxZyOaz4ahnpxx
 BRaWISd/KbL66W8Vc0a4ct5nKpQykptfcMWkHo6iNLtfV1IjWQZM2BK/RdLYASo3Xbjv
 ANZuRAK51YujWprMw2DV3w4K11FZsIAO9lubbz2/2iZFZtw4cYqaBWAeQc3ZcbMFM4yp
 9M6YRFoiHJqkxBxAWaFMM00+S4sRngBYvtShvxx1dV1/a//O00cxVtLoMI77h7MVhNSO
 TmbjjNVIkV1aBY74EIpsxe3quUoOw3nM2Nn/qR0mFXYoxgmQQ6lbWTMYFv4Qdt1IMhL1
 6AjA==
X-Gm-Message-State: AOAM532rgtyyelKHhaCCaZ8O3eZPLnWjmmjOeMoyyMbvzuGhMoSZ5Hhn
 T1CjGhvmjK55brgKkMgaS9h/4i/DRqHJZRh+fOgwne7iFBje7HrGDZeUqJtBp05Zq5JIfQ+Od/p
 8xfCrD36KDRCJUNM=
X-Received: by 2002:a5d:4803:: with SMTP id l3mr16770235wrq.61.1631598109507; 
 Mon, 13 Sep 2021 22:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6sSJGQcT4izW/sDH7+lDKY/B/ZggT8fndu2fBRdoXCawTx2Gp2zLcRbN78NfNBoX/quUMwg==
X-Received: by 2002:a5d:4803:: with SMTP id l3mr16770224wrq.61.1631598109303; 
 Mon, 13 Sep 2021 22:41:49 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-144-112.46.114.pool.telefonica.de. [46.114.144.112])
 by smtp.gmail.com with ESMTPSA id h16sm9346092wre.52.2021.09.13.22.41.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 22:41:48 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210913182512.1021618-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [qemu-web RFC PATCH] Add Sponsors page
Message-ID: <d57973da-49ac-f231-1652-cf78769e884a@redhat.com>
Date: Tue, 14 Sep 2021 07:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913182512.1021618-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2021 20.25, Philippe Mathieu-Daudé wrote:
> Add a page listing QEMU sponsors and displaying their logos.
> 
> Logo sources:
> - https://www.rackspace.com/es/newsroom/media-kit
> - https://developer.arm.com/solutions/infrastructure/works-on-arm
> - https://gitlab.com/fosshost/assets/logo
> - https://www.linkedin.com/company/cip-united
> 
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> There are probably more, but I'm not aware of them.
> 
> Maybe we should list past sponsors, precising a year range?

I think we might have a hard time to compile a complete list, so I'd rather 
not start that job.

> ---
>   _includes/nav.html      |   1 +
>   sponsors.md             |  22 ++++++++++++++++++++++
>   sponsors/cipunited.jpg  | Bin 0 -> 10607 bytes
>   sponsors/fosshost.png   | Bin 0 -> 18251 bytes
>   sponsors/rackspace.png  | Bin 0 -> 7363 bytes
>   sponsors/worksonarm.png | Bin 0 -> 9965 bytes
>   6 files changed, 23 insertions(+)
>   create mode 100644 sponsors.md
>   create mode 100644 sponsors/cipunited.jpg
>   create mode 100644 sponsors/fosshost.png
>   create mode 100644 sponsors/rackspace.png
>   create mode 100644 sponsors/worksonarm.png
> 
> diff --git a/_includes/nav.html b/_includes/nav.html
> index 73b39b3..49ad4cd 100644
> --- a/_includes/nav.html
> +++ b/_includes/nav.html
> @@ -8,6 +8,7 @@
>   			</li><li {% if current[1] == 'contribute' %}class='current'{% endif %}><a href="{{ relative_root }}/contribute">Contribute</a>
>   			</li><li {% if current[1] == 'documentation' %}class='current'{% endif %}><a href="{{ relative_root }}/documentation">Docs</a>
>   			</li><li><a href="https://wiki.qemu.org">Wiki</a>
> +			</li><li {% if current[1] == 'sponsors' %}class='current'{% endif %}><a href="{{ relative_root }}/sponsors">Sponsors</a>

Not sure whether we need that link on every page (i.e. in the navigation 
menu)? Maybe it's enough to put the link somewhere on the home page?

>   			</li><li {% if current[1] == 'blog' %}class='current'{% endif %}><a href="{{ relative_root }}/blog">Blog</a></li>
>   		</ul>
>   	</nav>
> diff --git a/sponsors.md b/sponsors.md
> new file mode 100644
> index 0000000..da1bf19
> --- /dev/null
> +++ b/sponsors.md
> @@ -0,0 +1,22 @@
> +---
> +title: QEMU sponsors
> +permalink: /sponsors/
> +---
> +
> +QEMU has sponsors!
> +
> +The website is hosted by [Rackspace Technology](https://www.rackspace.com/).
> +
> +For continuous integration and testing, hardware is provided by:
> +- Arm and Equinix Metal via the [Works on Arm program](https://www.worksonarm.com/)
> +- [Fosshost](https://fosshost.org/)
> +- [CIP United](https://www.cipunited.com/)
> +
> +
> +![Rackspace Technology](rackspace.png)
> +
> +![Works on Arm](worksonarm.png)
> +
> +![Fosshost](fosshost.png)
> +
> +![CIP United](cipunited.jpg)

Some remarks:

1) Could you please use the original URLs as source for the pictures instead 
of copying them over into our website? Some folks don't like it when their 
images are copied...

2) Could we have a short description about what the CI hardware is used for? 
I can figure out  that worksonarm likely provides the hardware for the 
aarch64 gitlab runner, but what are the others good for?

3) What about the s390x gitlab runner?

4) Shouldn't we mention gitlab.com here, too? They did not actively offer 
hardware to us, but we're using their free gitlab infrastructure a lot, so I 
think we should provide a link to them here, too.

  Thomas


