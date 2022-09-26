Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E05EAB05
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:28:36 +0200 (CEST)
Received: from localhost ([::1]:53448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocq27-000393-G5
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocpld-000313-Vt
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocplZ-0002sL-Kv
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664205088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDIb8UrWelyj070ZRZxnkhXTjgYhJU6spA03rIHm51U=;
 b=bRaDebDMUsMrVcE1nu2tN8z3g+7WsKtjcSZqQsJr6nV4RTbhY7hCnsaQH9QE85RNKzIA+v
 UBR/gmHTDMwKWfz0HP2/8YusbNt21QffqpoBOX6cc4tAvniCfijKQA1v4gKgpN73xN9FMa
 g0o8i38+HC89Bmv1HiDnUoabDqlGKJg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-kEMGK1JSM-qJu_DrgKOEZA-1; Mon, 26 Sep 2022 11:11:27 -0400
X-MC-Unique: kEMGK1JSM-qJu_DrgKOEZA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r7-20020a1c4407000000b003b3f017f259so4294055wma.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 08:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SDIb8UrWelyj070ZRZxnkhXTjgYhJU6spA03rIHm51U=;
 b=3jtqaQA/BljozdzUcOcdo94KROIvWhnVNt62Y1q04/aW+A/QTojqo1tB649vMpEM9J
 duJ5tUBfHMXg+/lLl6QivV3Whzw5U4x5khffL5JPdZyNQDLrNLvtRb8n4Y+7c57TWUlU
 n+XmXO8ZgovXeoZJ+tfvhNAb/zK2a3G8yIvGbVpUBZPSnR61rP1Tx1OKiMvYqB/kVv6b
 RS+p9LTwckOC3PJBJhgnPcm0zTvpOQoaOqjTIybiaAq2jXyMwPNmXuP8rNLTgE3ctzmw
 L5UbUyCfQjdS+mLpTtaHuVt0Qfrdfltjz6QCoXgCkq8orje2fbSVAwyJpnQqsh/RtLJv
 woNA==
X-Gm-Message-State: ACrzQf2KWohUDYR+wWrSmFr9V58uG6YqW1ISnTCOPGzX6wYuKw2QBg0t
 L1SY6kqFk3id9qqJxzqIhCywcLZVz+n/VzOFEAcP18FpnRCU9t3VuSuvZOlcMDwuHxGlZAUYCbX
 ur05VtcihwW3e77Q=
X-Received: by 2002:a7b:cb91:0:b0:3b4:75b9:5a4b with SMTP id
 m17-20020a7bcb91000000b003b475b95a4bmr15078682wmi.33.1664205086151; 
 Mon, 26 Sep 2022 08:11:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7S6biuwMZNj/4XTsnqg2LvINg+kGM6cr4sQWUMHpwXvgZZj5qDNvNWcEL3ZCCIZyFcl5GfxA==
X-Received: by 2002:a7b:cb91:0:b0:3b4:75b9:5a4b with SMTP id
 m17-20020a7bcb91000000b003b475b95a4bmr15078653wmi.33.1664205085864; 
 Mon, 26 Sep 2022 08:11:25 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 e2-20020a5d5302000000b0022ae8b862a7sm14253246wrv.35.2022.09.26.08.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 08:11:25 -0700 (PDT)
Message-ID: <1ab81fe3-07d6-28f6-0f34-61eda592e1d8@redhat.com>
Date: Mon, 26 Sep 2022 17:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220921100729.2942008-2-Jason@zx2c4.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v8 2/2] target/s390x: support PRNO_TRNG instruction
In-Reply-To: <20220921100729.2942008-2-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/2022 12.07, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>   target/s390x/gen-features.c      |  1 +
>   target/s390x/tcg/crypto_helper.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)

Seems like this is even working fine with older Linux kernels ... your patch accidentally broke test_s390x_devices in tests/avocado/machine_s390_ccw_virtio.py: This test adds two virtio-rng devices to the guest, then ejects them to see whether /dev/hwrng will be gone ... which does not happen anymore with the prno-trng feature enabled :-)

I'm going to squash this one-liner to fix this issue:

diff a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
--- a/tests/avocado/machine_s390_ccw_virtio.py
+++ b/tests/avocado/machine_s390_ccw_virtio.py
@@ -66,6 +66,7 @@ def test_s390x_devices(self):
                           '-kernel', kernel_path,
                           '-initrd', initrd_path,
                           '-append', kernel_command_line,
+                         '-cpu', 'max,prno-trng=off',
                           '-device', 'virtio-net-ccw,devno=fe.1.1111',
                           '-device',
                           'virtio-rng-ccw,devno=fe.2.0000,max_revision=0,id=rn1',

  Thomas


