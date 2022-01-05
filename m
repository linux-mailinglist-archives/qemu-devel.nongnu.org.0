Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313AB484FD5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:12:30 +0100 (CET)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52LN-0002aT-B3
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:12:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n52KP-0001Fb-F1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n52KM-0005pR-OQ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641373886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bCVGrYrWL+zaOiB5cIk4D/kwpzRTiyOFTQ0agWJ2oOE=;
 b=QNGq3s4ZN0NLWLZtlU/m3nXZVxK+N7wia4QFQlqLJMmX4IkL4e0P9o3Bf0F224e2NLGbwu
 Mgdvuu5zbrlFHWjOpGm1Tr1mVR0lln0EqtBy5tO0x8f3gcgvMRqyi27MoiR7DgLMsjO8VG
 tJ/XwNbhg8TcqlDQOTw035jlDroZ7uM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-tEgqK29gNeaUbU9FiwWPPQ-1; Wed, 05 Jan 2022 04:11:21 -0500
X-MC-Unique: tEgqK29gNeaUbU9FiwWPPQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m19-20020a05600c4f5300b00345cb6e8dd4so10010426wmq.3
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=bCVGrYrWL+zaOiB5cIk4D/kwpzRTiyOFTQ0agWJ2oOE=;
 b=2G3vhrIlzvWqZGNVv5axuT7xOVMlCdGi9i60KEX8TOubCrNdvIy+niJ+XTHoqutV4u
 rTNzWaEoYs/gMpEbf3ZX5Fkhf8nX4WuN+CdJ/t1uhOuPF9xWCC5IIlRD0OYTXmyXnbcJ
 hOROSLNr+htieWgvH3qoQ4WNqokqDbMr+xsMpfr+cB2fpbu+mok0kv5cbS5zqK+8T1/X
 hwXm/n4GUfJuqv+Jd6HcTaqWs1FWPPzncA4+cQP9DBlJxiKGFbWiz8r0JfXHh2qYr3Vp
 +kkf+J2r6icdzdJmdiswRJ1FsXKpTRaKwfJ4GM8l0ifnm2d9Nf/MbYqN1udIv3D1bUvt
 0FOw==
X-Gm-Message-State: AOAM531knvA1lhQnAZdLqpX5uTxLvMkYJzJfeAh+9UQNZ4JF+UEXWaLb
 De4IxMMiNPaL1llHtfWWA/A5S0lA5e/i3m0NEGv9h3Oj1udpNqkAgQqrMxfuU+n4jbbVJXZDNEq
 FJ47yniqGWlRbxfI=
X-Received: by 2002:a1c:c915:: with SMTP id f21mr1971942wmb.39.1641373880107; 
 Wed, 05 Jan 2022 01:11:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7MF5zEsdb3ccoumTOpCo+m4EVQRNUnLswQ0iucb+RofNvBjt+nt2ubg0e0KtyZlYersli1g==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr1971922wmb.39.1641373879889; 
 Wed, 05 Jan 2022 01:11:19 -0800 (PST)
Received: from [10.33.192.229] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id y8sm44644169wrd.10.2022.01.05.01.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 01:11:19 -0800 (PST)
Message-ID: <9311d288-22bc-fb94-ad64-ddbd1c5e32f8@redhat.com>
Date: Wed, 5 Jan 2022 10:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: oxr463@gmx.us, qemu-devel@nongnu.org
References: <20211217212146.2573-1-oxr463@gmx.us>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs/can: convert to restructuredText
In-Reply-To: <20211217212146.2573-1-oxr463@gmx.us>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Lucas Ramage <lucas.ramage@infinite-omicron.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2021 22.21, oxr463@gmx.us wrote:
> From: Lucas Ramage <lucas.ramage@infinite-omicron.com>

  Hi!

Thanks for your patch! This looks like a good idea, but I think there are 
some minor issues which should be fixed...

First: Please check your mailer setup. The mail has been sent via @gmx.us, 
but the Signed-off-by uses @infinite-omicron.com ... not a big issue, I 
guess, but it might be better to use the same address for both.

Second, it does not work here, at least not with Sphinx 1.7 which I have 
installed on my system:

  docs/can.rst:39:Enumerated list ends without a blank line;
  unexpected unindent.

Does this render correctly on your system?

Also there are paragraphs in this file which should be clearly marked as 
pre-formatted text (use "::" for those), e.g.:

diff --git a/docs/can.rst b/docs/can.rst
--- a/docs/can.rst
+++ b/docs/can.rst
@@ -122,7 +125,7 @@ is setup according to the previous SJA1000 section.
      -device ctucan_pci,canbus0=canbus0-bus,canbus1=canbus0-bus \
      -nographic

-Setup of CTU CAN FD controller in a guest Linux system
+Setup of CTU CAN FD controller in a guest Linux system::

    insmod ctucanfd.ko || modprobe ctucanfd
    insmod ctucanfd_pci.ko || modprobe ctucanfd_pci

> Bug: https://gitlab.com/qemu-project/qemu/-/issues/527

Please use "Buglink:" instead, it's more common in the QEMU project.

> Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
> ---
>   docs/{can.txt => can.rst} | 14 ++++++--------

While you're at it, I think this file should be moved into one of the 
subfolders as well, likely docs/system/ I guess.

>   docs/index.rst            |  1 +
>   2 files changed, 7 insertions(+), 8 deletions(-)
>   rename docs/{can.txt => can.rst} (97%)
> 
> diff --git a/docs/can.txt b/docs/can.rst
> similarity index 97%
> rename from docs/can.txt
> rename to docs/can.rst
> index 0d310237df..995134d079 100644
> --- a/docs/can.txt
> +++ b/docs/can.rst
[...]
> @@ -196,3 +193,4 @@ Links to other resources
>        http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd-driver.html
>    (11) Integration with PCIe interfacing for Intel/Altera Cyclone IV based board
>        https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd
> +

This look like an unnecessary addition of an empty line.

> diff --git a/docs/index.rst b/docs/index.rst
> index 0b9ee9901d..beb868ca7f 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -18,3 +18,4 @@ Welcome to QEMU's documentation!
>      interop/index
>      specs/index
>      devel/index
> +   can
> --
> 2.32.0
> 
> 

  Thomas


