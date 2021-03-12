Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C34338869
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:17:15 +0100 (CET)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdv0-0001EY-UN
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdkx-0006Q8-10
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdkv-00039g-Cf
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615540008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OiBm9NEUVeB8/YnYDXgZaCnBIddAzE5H+i7j3Te2Hdc=;
 b=EYppLv/id1CFkI52APtPpC/23Eglmf3S0dClSOSsPz8ZrIXoPHgHrSnU3phxGkev1e1aat
 qi6vc6e3Wzq3XlfM7u7Ne6NFb/Z387pFOlTBaGW3zggnw6OsnGnedkC1eTWNB+nQ2sPZc8
 TYLxh/dm1nLFViRcB4FQk+4lPQZ0tkA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-d1lVdi-YNT2lU5j4yD-ReA-1; Fri, 12 Mar 2021 04:06:47 -0500
X-MC-Unique: d1lVdi-YNT2lU5j4yD-ReA-1
Received: by mail-wm1-f72.google.com with SMTP id a65so1860466wmh.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OiBm9NEUVeB8/YnYDXgZaCnBIddAzE5H+i7j3Te2Hdc=;
 b=ED6EQzqHOTRE1bnkG7DIL2/2vYmdFTAFUJnrEZsO/NI/TLfIxihJLmEE0hX81876AD
 F1ROeybaR6rhNKxo5xDMr7t6xcEYfnvUguJEQUlDMUV6E6uwQMw8qgayNAJ8MMWxD0aP
 MP+8dsjcvWUuCaJ1fzkadbN1rGS3H/UYw92cyK5P+OP2l4g17vIQ6B6EcCqPa3CP3DLh
 gUsNN11Klmjs53rejJXoBxUmnJf3v4rtu8lM5UTLcyNlr8CG0J74zlRsafRyxh3xx4Dl
 OUql53MZNsig409kY9R3x4XbQlhBQxwUtxOl+OHwCwjxNR6A2RWZwZEP1gXTUWb7ktvP
 BgQw==
X-Gm-Message-State: AOAM532htQJiYyLFtxRma87K9puzv3hU4loILis9rbfcB2PivLaOi+5w
 gxuFujqBYc7Q5aLFrXhb2yOvToFCoi+dysi3F07JD5tIKPhaIO1Xf2fa6FDO+TZK09i+GMYFj86
 i5Q0+VLpysr2swis=
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr12792631wrr.274.1615540005794; 
 Fri, 12 Mar 2021 01:06:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz2bemVdqAPz1NjZjmBtClPzDXzuVv09N2/2whjl+QVgmvE/pYf1rQsthiO9dmhQ4kZU9OUg==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr12792603wrr.274.1615540005613; 
 Fri, 12 Mar 2021 01:06:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id 12sm1403925wmw.43.2021.03.12.01.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:06:44 -0800 (PST)
Subject: Re: [PATCH 6/6] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-7-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <24b4b31c-8e38-edd0-567e-1ab7f9b1b56e@redhat.com>
Date: Fri, 12 Mar 2021 10:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311231202.1536040-7-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/qtest/meson.build | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 2688e1bfad7..405ae7a5602 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -170,14 +170,13 @@
>      'boot-serial-test',
>      'hexloader-test']
>   
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \
> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \

I don't understand, has aarch64-on-ARM TCG been fixed?

Paolo


