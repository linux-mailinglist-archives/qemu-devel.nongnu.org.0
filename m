Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA662D48B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovZoE-0001Br-R7; Thu, 17 Nov 2022 02:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovZoD-0001BX-QZ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 02:59:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovZoC-00041D-8x
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 02:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668671979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyA421Tvv3Oyb9M+FFZH3DI5Jt12pXv59WnDZRJFImY=;
 b=hwWK4g48mX6bnxbNktmjVr2ULHJG/N0c0ubnze5aWDl0OkakVmVb8nGx69OszKYgv/9f5r
 RV3vxYYQ40NuSJ/13YsFU1NgrazP9diq/BS18bwAhhdClXlyxY5dnwMjnRrLW+dKC4ZQlk
 AT59C2oS35dVNZB6i3ixMpDVmHPCO6s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-HrCLsSbnNuOAML-We9lrvQ-1; Thu, 17 Nov 2022 02:59:38 -0500
X-MC-Unique: HrCLsSbnNuOAML-We9lrvQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u13-20020adfa18d000000b00236566b5b40so358329wru.9
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 23:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dyA421Tvv3Oyb9M+FFZH3DI5Jt12pXv59WnDZRJFImY=;
 b=rIyLdRB+Y9TNP+F3jVQrIpKBdZiWU/OO8wXTg3io37Cz35oyDZt9Oe9LJVEPgCbucX
 I7HQdB2eYOB1LvFYF+ArnIGmvTbv7WKkiOkjCKjFWchTyICwQ09PqQGAzPce+P+B1ogA
 XPpF0GGFXAl8Fk9W5CFmJ8LgJsVzfdGOBGgKPJ2TOZWWRkoRpVwONd/Ekn0/3D+Rj4xs
 dT8e4pkh3qn/yQC6hqc7mveiheIYF2kan31EDFaSrC7riWyfz7PH2IarUeo6UNVmt3x6
 uifwF9GDlWyztCLnvSh1hIwhjdVi0edXJpvaYGiqfqpW3uqru6PMCCzE3TLZO4giASKN
 O38Q==
X-Gm-Message-State: ANoB5pmYmINrSQOdbsmNW4t4AOyuxALkEk1+JIJ0nIHNmtV25SnZChL6
 6P3YkDsS3yte2m4EWKGKKgaLnU8VbBaLcmSm4VmYuQheDGiIu4V4tAIPmwnjXTpMI7Ct8FS2W6T
 IFvcISitztFCOz5g=
X-Received: by 2002:a05:600c:3d08:b0:3cf:e84d:6010 with SMTP id
 bh8-20020a05600c3d0800b003cfe84d6010mr796708wmb.197.1668671976921; 
 Wed, 16 Nov 2022 23:59:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf481+uDpiPsnHUvdX8H2mnAUVwmMxO+QKHZsZy5L4lyKxscxztZIiMawc9LowqAjCOsQS985A==
X-Received: by 2002:a05:600c:3d08:b0:3cf:e84d:6010 with SMTP id
 bh8-20020a05600c3d0800b003cfe84d6010mr796696wmb.197.1668671976726; 
 Wed, 16 Nov 2022 23:59:36 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-4.web.vodafone.de. [109.43.177.4])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d4dc8000000b002366c3eefccsm178153wru.109.2022.11.16.23.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 23:59:36 -0800 (PST)
Message-ID: <640d43d0-f39b-af8b-697c-117451fda0d3@redhat.com>
Date: Thu, 17 Nov 2022 08:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5] acpi/tests/avocado/bits: some misc fixes
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20221117053644.516649-1-ani@anisinha.ca>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221117053644.516649-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/11/2022 06.36, Ani Sinha wrote:
> Most of the changes are trivial. The bits test timeout has now been increased
> to 200 seconds in order to accommodate slower systems and fewer unnecessary
> failures. Removed of the reference to non-existent README file in docs. Some
> minor corrections in the doc file.
> 
> CC: Thomas Huth <thuth@redhat.com>
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/devel/acpi-bits.rst   | 12 ++++--------
>   tests/avocado/acpi-bits.py |  3 +++
>   2 files changed, 7 insertions(+), 8 deletions(-)

Look fine to me ... if nobody else is planning to pick this up, I can put 
this into my next pull request (I'm planning one for later today or tomorrow).

  Thomas


