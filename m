Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5681269E67
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 08:24:30 +0200 (CEST)
Received: from localhost ([::1]:33134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI4OD-00039N-Qh
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 02:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kI4N8-0002Ei-8L
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 02:23:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kI4N6-0005D0-FW
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 02:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600150999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LGe8y7UV6NAxK0qYvu1cj4SZLFXWkX8Rd7oj3zj+qTw=;
 b=gLjJNUXKwfTPNxLSdOO7QlmV3VAwmpBVKcl8DR14SVOHYVRRqGW/KwWm/D2BuyrCQhHUq0
 /8GUcdxjQ9uRYtKV1UPfgD5NIJTL98H9DAcP3CizluQ3m4mke38aZxBBmxNTxbPoarRw3k
 1I9CMVlLH0j5BCjIVyTJQS2iZVLO6nM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-1VECNi3iPMOOM42GU0logQ-1; Tue, 15 Sep 2020 02:23:12 -0400
X-MC-Unique: 1VECNi3iPMOOM42GU0logQ-1
Received: by mail-wr1-f69.google.com with SMTP id k13so815834wrl.4
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 23:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LGe8y7UV6NAxK0qYvu1cj4SZLFXWkX8Rd7oj3zj+qTw=;
 b=SepWd0eFZYbO18pWOTRLTxEFLzhekt8+PfoEKXqfr7unl2gu3qC5hW4aRIuCVInmQ9
 nDXoRpKr7R8G9m5gvFZyswhHCmfLPk5/r7aDAeBAPSnMzpv6RWcHSvYS5YdIMD450pCB
 OCo8fv/75xzbqWOCND0v9+ygMbAWGbp7WrTT6oOsce8tUKzTErywTBhbLhSn8FGNVkNo
 d+iqVUL/2iS7TWxQmXg2TYqscYRMiKGPBm2uJgKHitk6uka7BbHBdqklXomraX3pvFFR
 QN6xjidWDInlZxFihR3Ba4alYvwkOgHFrrMcFrQPhq77wRiH8x/4uBxqDIQhyQIcreXo
 3wxw==
X-Gm-Message-State: AOAM530bqKk5kihSg88CFPTnaYcahH1vML7cwO/Mmnx/+u+QwXs70QLY
 9N7LB1E9epZdTsNq8IYgC/jP2PQLAX/ZCjmYph50LTuVnevQ7/U4EWmQ8w3OFGZOnWUr+JIfkk1
 rHJbZcS6BPxTP2wU=
X-Received: by 2002:a1c:5641:: with SMTP id k62mr3079723wmb.13.1600150990952; 
 Mon, 14 Sep 2020 23:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsiU7afYJKVDIjcFv/1cC1WAKZxnXAmIVLLDvbeOvFZdrY3P36nhCxzcGrtqIezuO/FTe3Wg==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr3079702wmb.13.1600150990756; 
 Mon, 14 Sep 2020 23:23:10 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id 18sm20922929wmj.28.2020.09.14.23.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 23:23:10 -0700 (PDT)
Subject: Re: [PATCH 3/3] gitmodules: add qemu.org vbootrom submodule
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200909101642.17698-1-stefanha@redhat.com>
 <20200909101642.17698-4-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <03f18324-882c-d65d-b32d-b4610287ed1a@redhat.com>
Date: Tue, 15 Sep 2020 08:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200909101642.17698-4-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:23:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/20 12:16 PM, Stefan Hajnoczi wrote:
> The vbootrom module is needed for the new NPCM7xx ARM SoCs. The
> vbootrom.git repo is now mirrored on qemu.org. QEMU mirrors third-party
> code to ensure that users can always build QEMU even if the dependency
> goes offline and so QEMU meets its responsibilities to provide full
> source code under software licenses.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
> This patch can be rebased on top of "[PATCH v8 00/14] Add Nuvoton
> NPCM730/NPCM750 SoCs and two BMC machines" and replaces the git URL in
> the original patch.
> ---
>  .gitmodules | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/.gitmodules b/.gitmodules
> index b8f8a143bf..5feabf64c2 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -61,3 +61,6 @@
>  [submodule "meson"]
>  	path = meson
>  	url = https://git.qemu.org/git/meson.git
> +[submodule "roms/vbootrom"]
> +       path = roms/vbootrom
> +       url = https://git.qemu.org/git/vbootrom.git
> 


