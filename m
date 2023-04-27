Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FC6F0660
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:06:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1Ia-0000rO-Jf; Thu, 27 Apr 2023 09:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1IF-0000nS-JC
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ps1IB-0007B5-Bb
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682600650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxAYtP33oSJz90CS8J4nQtz5FjwI4kqFxvtCzPjdRow=;
 b=DnhJpmY1CqGntCoJ58x18lffT0xJw8zPVe7l9AsGZSNmErUzkRVWXh+fvlg3XOb8wEHkvr
 kAhHGy5GGQ7lNUNJWQ060DABHhtOaxjU6FE1OnkZJDnwHmdnn13BsqahCD1WjlMzTv+m/g
 yH5aZIuC+Krw+Mz8YDD1CHn04BBM0K0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-TA3IaKZ9PtmnL9k75qtKDw-1; Thu, 27 Apr 2023 09:04:08 -0400
X-MC-Unique: TA3IaKZ9PtmnL9k75qtKDw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f170a1fbe7so51804995e9.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 06:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682600647; x=1685192647;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sxAYtP33oSJz90CS8J4nQtz5FjwI4kqFxvtCzPjdRow=;
 b=XN5aob5iK4C2Q2U0gZXeOZkLBMT7PmekbkK78DwGWJsbzhWzEVbkeouEZOvsktjc5i
 9dLfb5PZS6ldEbdL5InwNiI4G303zk9EsXt/gJN2EZLkhJ7BSij/k9wi6er0pGhcgRXG
 lcvLJTGcrbeIIZim0G3ppua4tC9M/xoG5GB2fAJZFLmvsNgPNC3jle+m2aBTe2ZiWJzq
 4ogtqxi9u0z6r1m2cVWTN/EV5ilmyCM9gleg5tP0o0TZYjw5W8jLFGN00rcsv8Dkq0er
 4LBPN6hPgqGQXxlq9rdNFXSHrhUUY3zUrtiTwLR1WdbqyeQnlORxxlflVphHGAqZdOIc
 JLYw==
X-Gm-Message-State: AC+VfDy3e3ZNPqp6jMmdHXnYv3oryXB26Cfs9lXtNY4tM8BX2o3TsrsI
 rI9GbNB0y51qHocWgjzDcvqXh7ZBl5YRz45rA32lOXT66PsvWI6/bS7zrpgJYGIypv1ow1v2XPr
 ulnSc4ht8FTKXR6E=
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr1471350wma.36.1682600646975; 
 Thu, 27 Apr 2023 06:04:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Y+emsQnCcLHigUNtvy1q9hSW3PDQHYfrpZTlmAbntw9O83ta3mWr6Gk74PHTDPydokgeF4A==
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id
 p20-20020a7bcc94000000b003f169cc475bmr1471322wma.36.1682600646648; 
 Thu, 27 Apr 2023 06:04:06 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c228b00b003f1736fdfedsm21283728wmf.10.2023.04.27.06.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 06:04:05 -0700 (PDT)
Message-ID: <4761c580-ca69-bfbd-0501-999fa7bc4059@redhat.com>
Date: Thu, 27 Apr 2023 15:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20230426161951.2948996-1-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v9 0/8] memory: prevent dma-reentracy issues
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/04/2023 18.19, Alexander Bulekov wrote:
> v8-> v9:
>      - Disable reentrancy checks for raven's iomem (Patch 8)
>      - Fix non-bisectable disable_reentrancy_guard patch by squashing it
>        into Patch 1.
>      - Fix trailing whitespace

Sorry for not noticing earlier (I think the test is not run on gitlab-CI), 
but I just noticed another failing avocado test:

tests/venv/bin/avocado --show console run \
  tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_x86_64

... seems to hang now (and finally gets "INTERRUPTED").

If I got that right, the test is basically more or less doing:

  wget https://storage.tuxboot.com/x86_64/bzImage
  wget https://storage.tuxboot.com/x86_64/rootfs.ext4.zst
  unzstd rootfs.ext4.zst
  qemu-system-x86_64 -cpu Nehalem -M q35 -kernel bzImage \
   -hda rootfs.ext4 -m 2G -append "root=/dev/sda console=ttyS0" \
   -serial stdio

Then log in as "root" and shut down with "halt".

The "halt" works fine with git master, but it fails for me when I have your 
patches applied. Could you please have a look?

  Thanks,
   Thomas


