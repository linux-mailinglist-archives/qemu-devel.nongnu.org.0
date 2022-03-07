Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE04CFEDB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:35:23 +0100 (CET)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCaA-0002Gn-W8
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:35:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nRCWl-0007pt-OM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1nRCWi-0002dc-1J
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646656307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Qyf9MbJyCiH8z4kDT7piiWSc0/eY799o24iXcIhmkc=;
 b=hCHejM0nH7fsV/vs+l/haqzvYVNuHcB0jb8UZvQZ8AXlMTqWUkRpxl8uZVAnM58aIvIrIX
 itPp5teaY2JddKEKysxXiJdAqRwLD/rYWDEcMZiWIKGThefzZF8xGtpTJDDh2vzsGl/4Kp
 Wk9gzAaAXbl8ZMtd1YJD7olfs242/Sk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-hvmDOt6TPC2NeTsUD7Ly7A-1; Mon, 07 Mar 2022 07:31:43 -0500
X-MC-Unique: hvmDOt6TPC2NeTsUD7Ly7A-1
Received: by mail-ua1-f72.google.com with SMTP id
 67-20020ab00449000000b0034774edf0f1so8081057uav.23
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Qyf9MbJyCiH8z4kDT7piiWSc0/eY799o24iXcIhmkc=;
 b=301CWkPpG6tvWDqpuFgpg0k7jxSKrsVoBvB38Mx5gj13TJhCZaVDauuDR12hUY1gKO
 649VIm0Oxt6g5MoPn6G6ITS2FlDmuyK0i0ZRIcAo3i7XF3SDEvmXk/5sj0M27hO5xaVZ
 3v4+m0vBfF8ZBxbcAFXwB/khpTazmmje4Cms2Sk5gDc09bj6I5l+v5YTfDFdbPMQZ9pJ
 9idTj3tcde2EH4n9m9bMFpYCq0QhskrXVlK7xXDFzxSQKjKoZb+WWWlob8/+s5hCrLwv
 X/UXFzfdwxy5t9u8C92/koYQF22QXI2i9de21USTFeW6RKH4cV/OCg5tzzRJ1z+PdjXT
 YP7Q==
X-Gm-Message-State: AOAM532cFMaAaxW2gpOfXk2kf4rl48U1GbET/FscDya1ix1XoFA9CBy2
 qxzUiPxVgIvVzYBDc66l9bvBSOmCkvGhI/bmXAttaRQL9h33o5u9c+tzlWDzOPU70le6dofDKGf
 pNjjKSYMd6K0U1bc=
X-Received: by 2002:a05:6102:3a64:b0:320:91a3:f093 with SMTP id
 bf4-20020a0561023a6400b0032091a3f093mr3270802vsb.58.1646656303349; 
 Mon, 07 Mar 2022 04:31:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRl/Fuj2GU81xEViIg7zpw4uo1qIxzPQpivIgkzRcUH89rUtUbLD7QdptCnyThfrdnzCYG6Q==
X-Received: by 2002:a05:6102:3a64:b0:320:91a3:f093 with SMTP id
 bf4-20020a0561023a6400b0032091a3f093mr3270793vsb.58.1646656303077; 
 Mon, 07 Mar 2022 04:31:43 -0800 (PST)
Received: from localhost ([191.181.58.94]) by smtp.gmail.com with ESMTPSA id
 e21-20020ab031d5000000b0033ffa5785cfsm2184868uan.16.2022.03.07.04.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 04:31:42 -0800 (PST)
Date: Mon, 7 Mar 2022 09:31:40 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/avocado: Cancel BootLinux tests in case there is
 no free port
Message-ID: <20220307123140.vykrynrmpdybst3y@laptop.redhat>
References: <20220228114325.818294-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220228114325.818294-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Thomas, sorry for the late reply, I was in PTO.

Just in case it is still needed:

On Mon, Feb 28, 2022 at 12:43:25PM +0100, Thomas Huth wrote:
> The BootLinux tests are currently failing with an ugly python
> stack trace on my RHEL8 system since they cannot get a free port
> (likely due to the firewall settings on my system). Let's properly
> check the return value of find_free_port() instead and cancel the
> test gracefully if it cannot get a free port.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Unfortunately, it still takes > 70 seconds for each and every
>  tests from tests/avocado/boot_linux.py to get canceled, so
>  tests/avocado/boot_linux.py still renders "make check-avocado"
>  for me pretty unusable... looking at the implementation of
>  find_free_port() in Avocado, I wonder whether there isn't a
>  better way to get a free port number in Python? Brute-forcing
>  all ports between 1024 and 65536 seems just quite cumbersome
>  to me...

This is something that also bothers me with this method, and maybe we
could get a free port using something like this:

```
with socket() as s: 
    s.bind(('',0)) 
    port = s.getsockname()[1]
```  

I haven't benchmarked both solutions yet nor looked at socket module
code, but I just created an issue[1] on Avocado's side so that we can
evaluate alternatives.

[1] - https://github.com/avocado-framework/avocado/issues/5273

>  tests/avocado/avocado_qemu/__init__.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
> index 75063c0c30..9b056b5ce5 100644
> --- a/tests/avocado/avocado_qemu/__init__.py
> +++ b/tests/avocado/avocado_qemu/__init__.py
> @@ -603,6 +603,8 @@ def prepare_cloudinit(self, ssh_pubkey=None):
>          try:
>              cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
>              self.phone_home_port = network.find_free_port()
> +            if not self.phone_home_port:
> +                self.cancel('Failed to get a free port')
>              pubkey_content = None
>              if ssh_pubkey:
>                  with open(ssh_pubkey) as pubkey:

In any case, this LGTM.

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


