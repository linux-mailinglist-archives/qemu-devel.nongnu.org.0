Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E455A610BC7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 10:03:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKKA-00081o-9M; Fri, 28 Oct 2022 04:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooKK7-00080Z-2J
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooKK4-0001hd-NA
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 04:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666944154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OvoftJKuxUA2F3B7RY9vguJuTJcXlzm7qV33NzN8fY=;
 b=hb2NTu7/ewJQja14xLthCarP3TYFs5/0xZUF9YPou+wtRe/Aqk97APTas8ZjUwpQAOR2Ey
 jWM4meTCdIOwLaOsPMwoENc9iT8Ih8edjXHpAKYwTSpZv3UAkUa8KcIyRfzjiJOR281kGo
 MpXcsDdfwfZr3FgnBQKTPiw7p0Hfo3U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-QpZ_Bib0N6yljepAsyWC1Q-1; Fri, 28 Oct 2022 04:02:23 -0400
X-MC-Unique: QpZ_Bib0N6yljepAsyWC1Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 az35-20020a05600c602300b003c5273b79fdso4034858wmb.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 01:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6OvoftJKuxUA2F3B7RY9vguJuTJcXlzm7qV33NzN8fY=;
 b=zKUhRLOb+vC/7SO0mmCG8efFlRj/4JDZNmof8imbVVYlOnGuba5T1r6tbaR/Q48msQ
 jJGeANCXudsxoY0dbObEd9SKZbK8BWebdu6IhurJY03ra7gvnqF7uAt4v70muiWQL1Ux
 va8mwR4p5BAEe0NugejoJVIlmOozC2bOJQBx9c5tRr0fDmh3PtRxhb6gBcr+7SvkZUxs
 SHZut26qUYR9ieq2uLm8H7LoyjKVXcRXPKcCnlAVpxxImIjJNSqAvPvd3aeBCm3WNVAx
 MknNRMH6Y7WdFltD4hnBAuZEq3xhaq7CqLjh9M7jjcAhUvkThDMcbzFl9goBDRYRDcUo
 w+sA==
X-Gm-Message-State: ACrzQf0IA36GxMEHb6FEjuJP38QuN1S4kscVOyrii3E9zS6frqlZJ20W
 DxHGcEc8GcQh4u07ijeq3KG0uCOAPwVTzARQ69nNjL3MR6EdTbx2vJa45vNnakF8VC4QwhzTP2O
 7vwf0u2XNAFDPZsA=
X-Received: by 2002:a7b:c34a:0:b0:3c6:e069:d41c with SMTP id
 l10-20020a7bc34a000000b003c6e069d41cmr8535783wmj.180.1666944142863; 
 Fri, 28 Oct 2022 01:02:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7DQzI7xI5YGugr21hyc3UxXSkafiW5+csepYpagQB6Wv6yRFgxtVlxCHxC38/iU9/q6lwd/A==
X-Received: by 2002:a7b:c34a:0:b0:3c6:e069:d41c with SMTP id
 l10-20020a7bc34a000000b003c6e069d41cmr8535760wmj.180.1666944142602; 
 Fri, 28 Oct 2022 01:02:22 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600001d200b0023647841c5bsm2952468wrx.60.2022.10.28.01.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 01:02:21 -0700 (PDT)
Message-ID: <89ee8024-a003-0de7-2f44-379462fa3e18@redhat.com>
Date: Fri, 28 Oct 2022 10:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 05/11] tests/qtest: Use EXIT_FAILURE instead of magic
 number
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-6-bin.meng@windriver.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221028045736.679903-6-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 06.57, Bin Meng wrote:
> When migration fails, QEMU exits with a status code EXIT_FAILURE.
> Change qtests to use the well-defined macro instead of magic number.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v6:
> - new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"
> 
>   tests/qtest/dbus-vmstate-test.c | 2 +-
>   tests/qtest/migration-test.c    | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


