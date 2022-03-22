Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF14E443A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:31:36 +0100 (CET)
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhPy-0003LF-G3
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:31:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhOB-0002K8-4y
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:29:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWhO9-0007AZ-N1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647966580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Fv1aEGCgRDGilCAJzXkXWRWfAs6e8ZUjyL2OfTaFdE=;
 b=APMHbetnAZmZtMN72NXg0YotZPXpGzQCF9SditnIAMfS6Gbk4XEo6aEDZbrHtM7+GdLglc
 D23kjOzfAw+Zp86ALSsFWEd2xeLWnSuvCxK78Rei1VDpwPV7++jC8OSwuVjRJt80QXNq/6
 yqsJqRW4HGJ5EkrorRtQyjoCLUXcXns=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-uuK0tAiQMFm7EkQRpBLjVA-1; Tue, 22 Mar 2022 12:29:39 -0400
X-MC-Unique: uuK0tAiQMFm7EkQRpBLjVA-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020a509549000000b00418d7c2f62aso10829269eda.15
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8Fv1aEGCgRDGilCAJzXkXWRWfAs6e8ZUjyL2OfTaFdE=;
 b=Aks1d63nRkT2OVN17E2UpSD+Kn78/ltgkkjK72NYtULseHVkL4j3EzR95EaIRY2zaj
 I3f5uW77NCtmpuVy5belB5eDkmlJJE2ZRLAnWF9lexvia8bxEfNqbvkNf+LTi4HBofuK
 Y6uW1i6VgW4vEcJGTbhcx3/nfiHpES/QIfi28ES4r8fIwJ2EU9opsp9+rSAEtjIYnaY4
 nZJRquoRv/B8njDdXQ+Vt5Qf4u1UpaI48c0aIQVBWpd2QW69hgm9H7ShCex63eyjUtJ4
 AhBy8nV73A7lxN5bVD1S6uXILtMMMt6W5aSNKL40/My6EShISyACgu8rB4BM/hB8/SWF
 f4fQ==
X-Gm-Message-State: AOAM530ROw9PYEtehtx2N6RsP7cRjBTR0tFqjFr0SLj6XPjwKQVkabX4
 7FLIhF4BW7MZcFxz8tl5p5/IxfoblODuBQ6Ynsv2NCFR83d0k3bz/h8Ig0EeS0uu7c6MvCLd9ks
 d8PtvCdAplTMRy3k=
X-Received: by 2002:a05:6402:26cc:b0:416:4189:f65e with SMTP id
 x12-20020a05640226cc00b004164189f65emr29111162edd.228.1647966578299; 
 Tue, 22 Mar 2022 09:29:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOswG2MWnQBVhZD94R6adVp3z5+0SxdPckiHhxWKkIhdQquyv/r1IxGUm8P8Q/JUp1cv7UMA==
X-Received: by 2002:a05:6402:26cc:b0:416:4189:f65e with SMTP id
 x12-20020a05640226cc00b004164189f65emr29111136edd.228.1647966578077; 
 Tue, 22 Mar 2022 09:29:38 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm8577864ejc.161.2022.03.22.09.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:29:37 -0700 (PDT)
Message-ID: <8588aea9-05c3-67ae-09f4-4b3ebf1a1119@redhat.com>
Date: Tue, 22 Mar 2022 17:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/15] iotests/149: fixup
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-9-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220318203655.676907-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 21:36, John Snow wrote:
> (Merge into prior patch.)
>
> Notes: I don't quite like this change, but I'm at a loss for what would
> be cleaner. This is a funky test.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/149 | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

I mean, looks fine to me, fwiw.

Hanna

> diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
> index 9bb96d6a1d..2ae318f16f 100755
> --- a/tests/qemu-iotests/149
> +++ b/tests/qemu-iotests/149
> @@ -295,7 +295,8 @@ def qemu_io_write_pattern(config, pattern, offset_mb, size_mb, dev=False):
>       args = ["-c", "write -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
>       args.extend(qemu_io_image_args(config, dev))
>       iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
> -    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
> +    output = iotests.qemu_io(*args, check=False).stdout
> +    iotests.log(check_cipher_support(config, output),
>                   filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
>   
>   
> @@ -307,7 +308,8 @@ def qemu_io_read_pattern(config, pattern, offset_mb, size_mb, dev=False):
>       args = ["-c", "read -P 0x%x %dM %dM" % (pattern, offset_mb, size_mb)]
>       args.extend(qemu_io_image_args(config, dev))
>       iotests.log("qemu-io " + " ".join(args), filters=[iotests.filter_test_dir])
> -    iotests.log(check_cipher_support(config, iotests.qemu_io(*args)),
> +    output = iotests.qemu_io(*args, check=False).stdout
> +    iotests.log(check_cipher_support(config, output),
>                   filters=[iotests.filter_test_dir, iotests.filter_qemu_io])
>   
>   


