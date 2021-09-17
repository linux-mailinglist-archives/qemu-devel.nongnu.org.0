Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97F40F6A5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 13:21:04 +0200 (CEST)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRBvT-0005ED-7h
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 07:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRBrD-00036w-F9
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRBrA-0003LA-SQ
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 07:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631877394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suKUSBJX+uX4ZzQk519ABpJZgAJZtj8L11YCAaPtR2g=;
 b=Zr/stPPJTGDuoLTtwGLWhE2dJx6PzYxTWOOyhjGw+2L8/b88Bf4+eVZ6uLa73EDoYoPq8P
 NDXW8Dx8C0j+0qD4FGGu3Jgw5Zmuv8NxLoG0QCglQqgaWvIS0dyvUzSXr8M5MpM/I4kNT/
 SkNGLQD/mvCIPuLefa8/ZfDsUPSLsNA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-5B6ScG6UMSypf3JmApahnQ-1; Fri, 17 Sep 2021 07:16:31 -0400
X-MC-Unique: 5B6ScG6UMSypf3JmApahnQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so3603155wmq.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=suKUSBJX+uX4ZzQk519ABpJZgAJZtj8L11YCAaPtR2g=;
 b=5NP0zAFQZg/96BVT8qTF3T3R9RiIyoSuMoO/wYVpw4VIB3gSfLGHLYiyQXw7rIDO+Y
 tUEwahD9FKHDAIyR3Cw753dJvZDbUNWZLjrFrpv6Y0dxmM8FgMPud9u7Oh33s1ctQ5Xh
 Os6RYNbFJkj68wLi5oLgcO8KGGpDweBL7LLV4nmNvKTHdQC1vF34KvMJ1ybn6OtjJeMg
 Rf5suelqzCP3D2+Mb88uLCI79ysm9fkChyn8NnWnnHBVW3+XhAHxUs89qr/XZkE1acDC
 W3WgBnTq4tArDIcEu4YtQ2HUFVN7gZl6D2yci6CbKJr/WoLBrmOs2M3uBElam/9Rse60
 dB8Q==
X-Gm-Message-State: AOAM530XPhAYybN89bRb+DB6t3S2el9UmmE6m5WMJhalyb33PU36qVcF
 OE7F5l3Wd94xIvk/QK5JCUU30+0LyuC8dRJWEsRYazMzKGeZAgfSWEr9g40gF7ke9skhU0dE6xb
 DBT+xU6/aw9RgV1o=
X-Received: by 2002:a05:6000:1809:: with SMTP id
 m9mr11738539wrh.396.1631877390436; 
 Fri, 17 Sep 2021 04:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLYow88XnQqAqojoLRcLqSAsxFF2pI/wpJ5s8RbTyaPbmQaWyk4AJeyScGPNhpCCeTUXDAgg==
X-Received: by 2002:a05:6000:1809:: with SMTP id
 m9mr11738514wrh.396.1631877390220; 
 Fri, 17 Sep 2021 04:16:30 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id b187sm4995163wmd.33.2021.09.17.04.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 04:16:29 -0700 (PDT)
Subject: Re: [PATCH v3 14/16] iotests/linters: Add workaround for mypy bug
 #9852
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-15-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <78ba9506-5c79-8018-3f73-a2701d313429@redhat.com>
Date: Fri, 17 Sep 2021 13:16:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-15-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> This one is insidious: if you use the invocation
> "from {namespace} import {subpackage}" as mirror-top-perms does,
> mypy will fail on every-other invocation *if* the package being
> imported is a package.
>
> Now, I could just edit mirror-top-perms to avoid this invocation, but
> since I tripped on a landmine, I might as well head it off at the pass
> and make sure nobody else trips on the same landmine.
>
> It seems to have something to do with the order in which files are
> checked as well, meaning the random order in which set(os.listdir())
> produces the list of files to test will cause problems intermittently.
>
> mypy >= 0.920 isn't released yet, so add this workaround for now.
>
> See also:
>   https://github.com/python/mypy/issues/11010
>   https://github.com/python/mypy/issues/9852
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/linters.py | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/qemu-iotests/linters.py b/tests/qemu-iotests/linters.py
> index 4df062a973..9c97324e87 100755
> --- a/tests/qemu-iotests/linters.py
> +++ b/tests/qemu-iotests/linters.py
> @@ -100,6 +100,9 @@ def run_linters(
>                   '--warn-unused-ignores',
>                   '--no-implicit-reexport',
>                   '--namespace-packages',
> +                # Until we can use mypy >= 0.920, see
> +                # https://github.com/python/mypy/issues/9852
> +                '--no-incremental',
>                   filename,
>               ),

I’m afraid I still don’t really understand this, but I’m happy with this 
given as the reported workaround and you saying it works.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

Question is, when “can we use” mypy >= 0.920?  Should we check the 
version string and append this switch as required?

Hanna


