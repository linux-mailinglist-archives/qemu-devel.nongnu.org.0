Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B83A209CB8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 12:20:28 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joOzb-0006l3-FO
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 06:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joOy7-0005ga-2V
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:18:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34721
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1joOy5-0004b1-Eq
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 06:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593080332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BYfyxwH8B4OmTB/AZfIPNmDyfSFBH5zqBt+BCao1KxI=;
 b=CJXQ1c/fBFebMgLcO05KaqhA+/HoQhZp7mYyrTUdskvzA01XcxM3DSiApf5AoYlU5/5no0
 Y/Gl2vdjzuhjnRAqxtduUy/fS5zZoha8Mgs6VQ7zZX8ZdYIbQw4nLZHOC7S6QR/Cm9budw
 FvsgEdzrnJji2WcF3tBrv+WQMvbjSbA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-BXFWZCJ6P56z1o3jlnsc3g-1; Thu, 25 Jun 2020 06:18:48 -0400
X-MC-Unique: BXFWZCJ6P56z1o3jlnsc3g-1
Received: by mail-wm1-f71.google.com with SMTP id v24so6734431wmh.3
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 03:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BYfyxwH8B4OmTB/AZfIPNmDyfSFBH5zqBt+BCao1KxI=;
 b=XJ6WPQZ5QGHoxuw47vO7aUmdTtwDAXLEn3kRfLHtO1TZc3c2AcqimbtvuTgVU/1iBJ
 GwAaPsmN6HWHrZjgwhl47MavwIi6osm5pCCzX93KmzFQbPzMMgZxBPsiNTfkQTFIrByR
 0hAi4IWWMuVteCA6mmpr28MQStJgm7b01ctpQ8PZ15b5v9X5sGpvBZ8ZSFpA8RFX2SkB
 fzQybviQDy7coKIDcGNf0a+8n00ak2Ik2WLCJCi4ZtQ7fZRn7n+ScGTBVpJrW8ONeMHO
 ymkhnjDOCn68+DVHof/MJJ+ce2bZBr504IWoxgqwvu6YAqE7Meyrrv/Dn+I+W8T2zSWR
 76Gg==
X-Gm-Message-State: AOAM532Nr7hZqNtv2oWxyvPApsRk/1TfOv0eNGDY6gMKrspX8bcYsJg7
 81y0J8MGUCBSfn+sEsCLd3keJxB52KkxTkxdQtZfVwWbEGWVCp6y4o6CKMocZnPCPpOEum9/kCN
 wcARN49nUyyvdQeY=
X-Received: by 2002:adf:f542:: with SMTP id j2mr21719520wrp.61.1593080327318; 
 Thu, 25 Jun 2020 03:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlQ3IliyIPwf5ku6BQ566y5wzQSnRE+UUNGb8+wkTzjeOCYzQzNnkfMFCxh40YVN0OSYKeWQ==
X-Received: by 2002:adf:f542:: with SMTP id j2mr21719498wrp.61.1593080327049; 
 Thu, 25 Jun 2020 03:18:47 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r1sm30491595wrn.29.2020.06.25.03.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 03:18:46 -0700 (PDT)
Subject: Re: [PATCH] hw/virtio/virtio-iommu-pci.c: Fix typo in error message
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200625100811.12690-1-peter.maydell@linaro.org>
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
Message-ID: <f847f16f-ab78-24ac-3071-b2ed3b8950a0@redhat.com>
Date: Thu, 25 Jun 2020 12:18:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200625100811.12690-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/20 12:08 PM, Peter Maydell wrote:
> Fix a typo in an error message in virtio_iommu_pci_realize():
> "Check you machine" should be "Check your machine".
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/virtio/virtio-iommu-pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 632533abaf7..32e3215d1df 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -48,7 +48,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>                     "%s machine fails to create iommu-map device tree bindings",
>                     mc->name);
>          error_append_hint(errp,
> -                          "Check you machine implements a hotplug handler "
> +                          "Check your machine implements a hotplug handler "
>                            "for the virtio-iommu-pci device\n");
>          error_append_hint(errp, "Check the guest is booted without FW or with "
>                            "-no-acpi\n");
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


