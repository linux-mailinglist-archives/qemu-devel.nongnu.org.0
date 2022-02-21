Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6D64BDBD7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:41:08 +0100 (CET)
Received: from localhost ([::1]:54042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCgN-0005R2-DN
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMCTU-0005EX-Vf
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:27:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMCTP-0008QU-DD
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645464457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YlT+be2Qzmti0mrL2oGUYGR7btgmbTqO7dWF4MID/JE=;
 b=g0bc8IcijR/EOjEcEVbjd8UxGzZKhPcsiO8RHC1oIq43xJsrPQO9ANJDDkFziDa2RS5/EA
 1tZBjboRzVlDHVuJ7zzC0xodb3OwRrhbK0E4Tm6fsjWgaPsSzgePVweYtA5p/HKO/lYNMq
 xGHs1Wi8Xj3zc1zatMaCK3GOUL7fBLk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-9w1FTQASM4Sb1Tb12ensCg-1; Mon, 21 Feb 2022 12:27:36 -0500
X-MC-Unique: 9w1FTQASM4Sb1Tb12ensCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 q127-20020a1ca785000000b0037faac72dcbso5164wme.1
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YlT+be2Qzmti0mrL2oGUYGR7btgmbTqO7dWF4MID/JE=;
 b=e97c1gCvM5Ua2S4lFXVdoKCIJCQRBw+bmwA5XDhTFWKkACscvKCp6wczYX8cDMr1Oh
 sOAL42IbN/4lmmDLbMrvuTCT7dGSkCViCn+ajP9jsLHyh79fNF2M+uWY1HRXSqONJ9OR
 Zkmxloq3As/c95jiJpYJY6RAlApMMqCF2PgoQ7S8Aun1xknTZho3Mi2qoPq5w4g1oxdB
 34gx20ZdJSXJSOadYjhIHWTcQwP0aOBhGm+51ofCBD29hHaD5zOj2viEj2UXvOb7q+NR
 c9IzJkrGuXeJ3ZdIchBHtNeMeluaQaLYeKRu1+xAE3UICgtNo+c4+difCKBFAjUk14aM
 5kZQ==
X-Gm-Message-State: AOAM533saDsQ5t2hvlBiVIrJ/1m+RpnFCDPeqOeMW0OkxMzCuhQOwj4C
 01WcpqAInkW5hW1+HHCx+1UZR6hYjjf6mPoftDmVaA5FA5vXUko/BdeC5TwpE9LiDNfmrvUHRnH
 1q7tQxEZKpSnVYQY=
X-Received: by 2002:adf:fdca:0:b0:1e3:eb0:f472 with SMTP id
 i10-20020adffdca000000b001e30eb0f472mr16484470wrs.291.1645464455170; 
 Mon, 21 Feb 2022 09:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX1i/txoTtpBmoBzFvkdrpKM4EPMJE5ft8zwEu6f+nJUvdHnCKbQkV+Gn4VZibMaa1FPD10A==
X-Received: by 2002:adf:fdca:0:b0:1e3:eb0:f472 with SMTP id
 i10-20020adffdca000000b001e30eb0f472mr16484410wrs.291.1645464453945; 
 Mon, 21 Feb 2022 09:27:33 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 a17-20020a05600c069100b0037ddbe6da71sm2546wmn.20.2022.02.21.09.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 09:27:33 -0800 (PST)
Message-ID: <ef080ac8-d1ae-b295-e5e9-d3766a3bf698@redhat.com>
Date: Mon, 21 Feb 2022 18:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] iotests/303: Check for zstd support
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-3-hreitz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220221170845.628429-3-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/02/2022 18.08, Hanna Reitz wrote:
> 303 runs two test cases, one of which requires zstd support.
> Unfortunately, given that this is not a unittest-style test, we cannot
> easily skip that single case, and instead can only skip the whole test.
> 
> (Alternatively, we could split this test into a zlib and a zstd part,
> but that seems excessive, given that this test is not in auto and thus
> likely only run by developers who have zstd support compiled in.)
> 
> Fixes: 677e0bae686e7c670a71d1f ("iotest 303: explicit compression type")
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   tests/qemu-iotests/303 | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
> index 16c2e10827..5a3efb4ba3 100755
> --- a/tests/qemu-iotests/303
> +++ b/tests/qemu-iotests/303
> @@ -21,7 +21,8 @@
>   
>   import iotests
>   import subprocess
> -from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
> +from iotests import notrun, qemu_img_pipe_and_status, qemu_io, file_path, \
> +        log, filter_qemu_io
>   
>   iotests.script_initialize(supported_fmts=['qcow2'],
>                             unsupported_imgopts=['refcount_bits', 'compat'])
> @@ -55,9 +56,15 @@ def add_bitmap(num, begin, end, disabled):
>   
>   
>   def test(compression_type: str, json_output: bool) -> None:
> -    qemu_img_create('-f', iotests.imgfmt,
> -                    '-o', f'compression_type={compression_type}',
> -                    disk, '10M')
> +    opts = f'compression_type={compression_type}'
> +    output, status = qemu_img_pipe_and_status('create',
> +                                              '-f', iotests.imgfmt,
> +                                              '-o', opts,
> +                                              disk, '10M')
> +    if status == 1 and \
> +            "'compression-type' does not accept value 'zstd'" in output:
> +        notrun('zstd compression not supported')
> +
>       add_bitmap(1, 0, 6, False)
>       add_bitmap(2, 6, 8, True)
>   

303 was failing on my system, too, but I did not get around to investigate 
on that one yet - so thanks for fixing this pro-actively! Now the test is 
correctly skipped on my system.

Tested-by: Thomas Huth <thuth@redhat.com>


