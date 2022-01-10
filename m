Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6867D48A1C8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:20:54 +0100 (CET)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7261-0003wt-Ht
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:20:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n71wy-000582-05
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bleal@redhat.com>) id 1n71ww-0005Vi-B8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLzPyl+0YkKdQeJcryzeq/QQ4o8XR+eNCPg6Ie1gvXk=;
 b=BfM6iO2xN/bsQ9A0oij1aagdYqwLK6UY7ZQL66GlUJyD4JZMcpQwyGiz8AnnW+cLSW5GSX
 damqYnXjYrEgPuLKp2HfmLCK/L4OGS7yl2HwNlqyKT/WjvEr/GOhqsqbkkWcReqUS2vsGb
 Ic7dMY1cGOV+Vk/z8wn3onHHDQaPpwI=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-Xt3rOwHJPbeO2tmTpAscRg-1; Mon, 10 Jan 2022 16:11:28 -0500
X-MC-Unique: Xt3rOwHJPbeO2tmTpAscRg-1
Received: by mail-ua1-f69.google.com with SMTP id
 w14-20020ab055ce000000b002fedc60272fso8356588uaa.21
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cLzPyl+0YkKdQeJcryzeq/QQ4o8XR+eNCPg6Ie1gvXk=;
 b=Lh9/mznDjKsrSwr6zecRM7/1mCKNHKlB8WHCPFhFbYPQoyO9kXtifBvHpyLN02hqAs
 Um1TBjYbZUQYIOVdGvmK8ChLEVLtnWkCB0PbqT+HxhvKTT8FaQ3uWEKPQXcHQAOSonZd
 2Ss0F4G68UUGm2GZEKv0mUAAAwXk0YD/I4nz5eKQAA1Zm7xMg7fGs5Z3r8WvW89UnQO7
 /VjVW9gV4GgUcXvVbUrO4NUM0gwhOa2EEIljZdyDzBFZUpc0wmEpjciItuKnFNz4BgOW
 nXBcTlJ4Fd++v0ntNRZvkp1v2ef7diJvW6j2U9kcHYqmzVw0wnXBjxOuZgyLI/+UTz8u
 ILvQ==
X-Gm-Message-State: AOAM533rImMa4YSi1SwK5aMzV3ZSOL0dSeIRHX3R0CMRm+Xm/ItpBWHJ
 fYEon2+QusE6B8ELKmYBXCfWL23A1WCVV2p0rZr122iTN9OB3w/Z0dhknp+Iw1eoXBAkE25Xp2K
 yQ0WoZxTeEcDkbag=
X-Received: by 2002:a05:6102:50a1:: with SMTP id
 bl33mr906340vsb.29.1641849087744; 
 Mon, 10 Jan 2022 13:11:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx39L8yvkq0zumgVPbs66tx32p+FM0mZlfCNIgMPQBItK1wv9by8q8tgEvqHuykQ51jR4fAqQ==
X-Received: by 2002:a05:6102:50a1:: with SMTP id
 bl33mr906331vsb.29.1641849087466; 
 Mon, 10 Jan 2022 13:11:27 -0800 (PST)
Received: from localhost ([181.191.236.130])
 by smtp.gmail.com with ESMTPSA id t123sm4346941vkf.48.2022.01.10.13.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:11:27 -0800 (PST)
Date: Mon, 10 Jan 2022 18:11:19 -0300
From: Beraldo Leal <bleal@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 27/34] tests/avocado: add :avocado: tags for some tests
Message-ID: <20220110211119.old6o6rwqqadqjck@laptop.redhat>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-28-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220105135009.1584676-28-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bleal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=bleal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:50:02PM +0000, Alex Bennée wrote:
> This stops a bunch of tests failing because of a lack of
> "./qemu-system-x86-64" in a build directory where you have configured
> only one non-default target. I suspect what we really need is:
> 
>     :avocado: tags=arch:host
> 
> to be properly multi-arch safe.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/avocado/empty_cpu_model.py | 3 +++
>  tests/avocado/info_usernet.py    | 3 +++
>  tests/avocado/migration.py       | 1 +
>  tests/avocado/version.py         | 1 +
>  tests/avocado/vnc.py             | 1 +
>  5 files changed, 9 insertions(+)
> 
> diff --git a/tests/avocado/empty_cpu_model.py b/tests/avocado/empty_cpu_model.py
> index 22f504418d..ffe27780a3 100644
> --- a/tests/avocado/empty_cpu_model.py
> +++ b/tests/avocado/empty_cpu_model.py
> @@ -11,6 +11,9 @@
>  
>  class EmptyCPUModel(QemuSystemTest):
>      def test(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        """
>          self.vm.add_args('-S', '-display', 'none', '-machine', 'none', '-cpu', '')
>          self.vm.set_qmp_monitor(enabled=False)
>          self.vm.launch()
> diff --git a/tests/avocado/info_usernet.py b/tests/avocado/info_usernet.py
> index dc01f74150..bafbc0e23e 100644
> --- a/tests/avocado/info_usernet.py
> +++ b/tests/avocado/info_usernet.py
> @@ -16,6 +16,9 @@
>  class InfoUsernet(QemuSystemTest):
>  
>      def test_hostfwd(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        """
>          self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
>          self.vm.launch()
>          res = self.vm.command('human-monitor-command',
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 584d6ef53f..4e5516f425 100644
> --- a/tests/avocado/migration.py
> +++ b/tests/avocado/migration.py
> @@ -22,6 +22,7 @@
>  class Migration(QemuSystemTest):
>      """
>      :avocado: tags=migration
> +    :avocado: tags=arch:x86_64
>      """
>  
>      timeout = 10
> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
> index ded7f039c1..be794b9354 100644
> --- a/tests/avocado/version.py
> +++ b/tests/avocado/version.py
> @@ -15,6 +15,7 @@
>  class Version(QemuSystemTest):
>      """
>      :avocado: tags=quick
> +    :avocado: tags=arch:x86_64
>      """
>      def test_qmp_human_info_version(self):
>          self.vm.add_args('-nodefaults')
> diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
> index 096432988f..1f80647414 100644
> --- a/tests/avocado/vnc.py
> +++ b/tests/avocado/vnc.py
> @@ -14,6 +14,7 @@
>  class Vnc(QemuSystemTest):
>      """
>      :avocado: tags=vnc,quick
> +    :avocado: tags=arch:x86_64
>      """
>      def test_no_vnc(self):
>          self.vm.add_args('-nodefaults', '-S')
> -- 
> 2.30.2
>

Reviewed-by: Beraldo Leal <bleal@redhat.com>

--
Beraldo


