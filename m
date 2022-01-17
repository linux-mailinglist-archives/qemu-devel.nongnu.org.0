Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216434905C5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:17:59 +0100 (CET)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9P5J-0005uz-Js
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:17:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9OxL-0001XN-VD
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n9OxI-0002wL-FJ
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642414172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+OsCZcsbHHBvzxvdjzOtQE2Z3Ee0wfoYmMF8rHDXcY=;
 b=GvmYteQ596VuLBpx0TMnrygm2PM09oLKX7Gy5Io0jh/J0QBqX9AGMqL6wilc2gQLo8SxjC
 30iK5QuM7kWE0WKh6MFZWDYIShXLY5abrreA72Nb3cXy+6Ll7Dyz3cKcZj4CwdEYckMDSZ
 llvwZCwqwg2bZesC1uiL2Y1Ssp/CdKk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-8z3KXzrJMYiRk6XpmNxu9Q-1; Mon, 17 Jan 2022 05:09:28 -0500
X-MC-Unique: 8z3KXzrJMYiRk6XpmNxu9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso3533377wmz.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 02:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f+OsCZcsbHHBvzxvdjzOtQE2Z3Ee0wfoYmMF8rHDXcY=;
 b=dHGTcjhjige3kdSg3x8ehXXiT8Z4JaDHhM34Vkv/c9Msh5z8/64EnnVSX5eRHr5QOe
 MPLkKcaLL1H43gzX+FWTSrP+amw2wuZwgzUfKdWVdODZWz4yUO9qGBtokBj12VqGtybl
 SZSsYtxgR3cOYuP4sEILE9J7OQ5SOR4nO6qhzuTafvIAmKixDC6XbzM5MLlORYf45cnB
 dma+PVOfXv8EqH8tByBQgc3nZVyRapGWIDMctQSTOJdQ+NmH0JKKSILIgDcMOIJNY7mY
 nNJcQi4rFawgv4ehjdYcfDVdkshtDlFRjNGpTvrFjU9Zf5U16RMOwQeHy6EY4aO+SpoV
 ap9A==
X-Gm-Message-State: AOAM532udFyYQZn/2ucAOcG2PJdp2tx3vCKmXmpMqPdFh25iviZyCJwd
 05H4tuL5+sc1asy62jJDoMA1N1mQX8KWBr8QbrjDO+60cxeKPtoNhJm1pEKxbN7GxogU5kSr+P1
 IohHnG4oLvL1D6Vs=
X-Received: by 2002:a05:600c:5c1:: with SMTP id
 p1mr26550611wmd.1.1642414166844; 
 Mon, 17 Jan 2022 02:09:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTxCK2BUsGHxV72Ydouioefajpx8DZ3M3cTOmOowcQlYukNiwioeHzQGsoB3Cld2DasyxNtQ==
X-Received: by 2002:a05:600c:5c1:: with SMTP id
 p1mr26550593wmd.1.1642414166592; 
 Mon, 17 Jan 2022 02:09:26 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-68.customers.d1-online.com.
 [80.187.98.68])
 by smtp.gmail.com with ESMTPSA id o4sm8801369wmq.41.2022.01.17.02.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 02:09:26 -0800 (PST)
Message-ID: <7d7acd1b-5144-4ad5-102a-7517b43b1ac5@redhat.com>
Date: Mon, 17 Jan 2022 11:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] build: make check-block a meson test
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220115222154.341628-1-pbonzini@redhat.com>
 <20220115222154.341628-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220115222154.341628-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/01/2022 23.21, Paolo Bonzini wrote:
> "meson test" can be asked to run tests verbosely; this makes it usable
> also for qemu-iotests's own harness, and it lets "make check-block"
> reuse mtest2make.py's infrastructure to find and build test dependencies.
> 
> Adjust check-block.sh to use the standard exit code that reports a test
> as skipped.  Alternatively, in the future we could make it produce TAP
> output, which is consistent with all other "make check" tests.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build                    |  6 +++---
>   scripts/mtest2make.py          | 10 +++++++++-
>   tests/Makefile.include         | 16 +++-------------
>   tests/check-block.sh           | 28 +++++++++++++---------------
>   tests/meson.build              |  1 +
>   tests/qemu-iotests/meson.build | 29 +++++++++++++++++++++++++++++
>   6 files changed, 58 insertions(+), 32 deletions(-)
>   create mode 100644 tests/qemu-iotests/meson.build
[...]
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> new file mode 100644
> index 0000000000..94f161d59c
> --- /dev/null
> +++ b/tests/qemu-iotests/meson.build
> @@ -0,0 +1,29 @@
> +if have_tools
> +  qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
> +  qemu_iotests_env = {'PYTHON': python.full_path()}
> +  qemu_iotests_formats = {
> +    'raw': 'quick',
> +    'qcow2': 'slow',
> +    'qed': 'thorough',
> +    'vmdk': 'thorough',
> +    'vpc': 'thorough'
> +  }

I think the default behavior for "quick" should be to test with qcow2 - most 
iotests require that format and that's what we're currently using with "make 
check-block" by default... i.e. please swap raw and qcow2 here.

  Thomas


