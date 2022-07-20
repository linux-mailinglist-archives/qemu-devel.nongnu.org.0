Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AAE57BAF9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 17:58:51 +0200 (CEST)
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEC66-0007DH-2L
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 11:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEC4k-0005pc-EJ
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEC4h-0002nI-0m
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 11:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658332641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qITKOQm5E2KhzTf7JhIxkz4CH6e8Ws8N67riv+5muDs=;
 b=WL53fuY/q+5GiyA0cfDzZdUciiIszgaDcw/47wQ8vPT97oDCgy03ihOO0bzADK+VWoS/MM
 wgGnGpNpUfgdglxcsIPe4MTJZnpAB/HRJbdrk9m8JlYuP7BCbaZJB5TouOwOvtNhOZBXi7
 OSvlaEtTxYkzNYGVzsSZoiqAlf/0qlU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-JQMj8K9VPKKNuB64ElYKjw-1; Wed, 20 Jul 2022 11:57:18 -0400
X-MC-Unique: JQMj8K9VPKKNuB64ElYKjw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so969368wmj.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 08:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qITKOQm5E2KhzTf7JhIxkz4CH6e8Ws8N67riv+5muDs=;
 b=DNsDAgxbeUUdHKfvVLs8smMhSfAN5ZXU7RuHwwlfSUtGu34c6nMV2QYYIoJnqKQVhX
 zMsFKjbA3nkFBiCGjobGiQ5Ygbe3DksCWofz/DSVLZOofPD2n3DA7z4HBGz9ru1lLj3Y
 /FafGDyk9Fx175w9IrTiSFX5EGhLibBNhnCB1jH1AihjDXEpXSt2MLi0Qzqz5WNaGY2i
 U4w/5C7rjUqrjDZfznn11Y8er40Cm7zY/zbkdTu5gowpgTiaKY8iZ/IHWtlG4IoJmZ0f
 CAA+Ehdq1aUjMqFE3DI2eURwGvPfEveHO/YKsDVBI8EfAAuTs9PMvnj+fWz2kttt+UEv
 GZYA==
X-Gm-Message-State: AJIora+Sjhb+ZTG4EG/vsHa3q8Z3WYH7HuNTueTIS41hhWq+sml90Rax
 nqxjSTg2wkTiuyITRZkDC0ePja4Oh5aplDcblLkVmIWOZiDSkH1m9v+Xo7ZEpDXWNYgBLcid9v4
 0gPAbdB/VhaV40vU=
X-Received: by 2002:a05:600c:1c0f:b0:3a3:188b:cb47 with SMTP id
 j15-20020a05600c1c0f00b003a3188bcb47mr4474834wms.45.1658332637483; 
 Wed, 20 Jul 2022 08:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfGInLWeKxwatT2Y4SjgDXjOEMEQoT0W4eil+xCwo1T7Sq7PgYVzQqQc4LwIg3TESNr0g05Q==
X-Received: by 2002:a05:600c:1c0f:b0:3a3:188b:cb47 with SMTP id
 j15-20020a05600c1c0f00b003a3188bcb47mr4474814wms.45.1658332637246; 
 Wed, 20 Jul 2022 08:57:17 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b003a2f2bb72d5sm4321808wmq.45.2022.07.20.08.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 08:57:16 -0700 (PDT)
Message-ID: <6a172a8a-af34-8af7-f516-d79b09db3ac0@redhat.com>
Date: Wed, 20 Jul 2022 17:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/5] configure: Don't use bash-specific string-replacement
 syntax
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-4-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720152631.450903-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2022 17.26, Peter Maydell wrote:
> The variable string-replacement syntax ${var/old/new} is a bashism
> (though it is also supported by some other shells), and for instance
> does not work with the NetBSD /bin/sh, which complains:
>   ../src/configure: 687: Syntax error: Bad substitution
> 
> Replace it with a more portable sed-based approach, similar to
> what we already do in quote_sh().
> 
> Note that shellcheck also diagnoses this:
> 
> In ./configure line 687:
>      e=${e/'\'/'\\'}
>        ^-----------^ SC2039: In POSIX sh, string replacement is undefined.
>             ^-- SC1003: Want to escape a single quote? echo 'This is how it'\''s done'.
>                  ^-- SC1003: Want to escape a single quote? echo 'This is how it'\''s done'.
> 
> 
> In ./configure line 688:
>      e=${e/\"/'\"'}
>        ^----------^ SC2039: In POSIX sh, string replacement is undefined.
> 
> Fixes: 8154f5e64b0cf ("meson: Prefix each element of firmware path")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   configure | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Thanks, this fixes "make vm-build-netbsd" for me!

Tested-by: Thomas Huth <thuth@redhat.com>


