Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FA1559D44
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:28:10 +0200 (CEST)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lE9-0004JR-Ei
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4lCV-0001RM-RC
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4lCS-0006b0-GD
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656084380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSEKYOFtyRN1L0qTB7i20oQSSJeAR9fV3qwMI1Nzwkw=;
 b=gL9jWizY1DZeqBFx9v/lv7dlFJYHV+iGE+rblCyLCPgSQX1+WX8Hu9LGb1n4QmxbsRfD65
 RzNQRWDZkZeJ8Npat8ofnPO4FSch/1VSRg4xENyt04rERINFmMGs/8KLXCW7lC7pbDoPOd
 IX09TDvy6JyStCY0r69bD5m7dbxDgJ0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-z7SUatZ_OOm98GktCl0ccg-1; Fri, 24 Jun 2022 11:26:16 -0400
X-MC-Unique: z7SUatZ_OOm98GktCl0ccg-1
Received: by mail-wr1-f69.google.com with SMTP id
 m7-20020adfa3c7000000b0021b94088ba2so421316wrb.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nSEKYOFtyRN1L0qTB7i20oQSSJeAR9fV3qwMI1Nzwkw=;
 b=Fu9K3Bu+VjJrRgwYyxwxijR2MCWOZWxUpmJ/sb/VFLCYIs/el+Y9PpVhhTIYEon35h
 5w9w7fcg8/o0aN+k9duR8iwGE5tnMdUGKGjM3ExiissxlI8VRgnMc8vmrGPrxlTgzSlo
 p0HgXI62AGc88RBXEGGav/Axq+Idh+1Hsec4aByIDeyzgtIO8WJ3XM5FsPaTLk9tpV3q
 qb6FaEOJXuGEWlj1m4SILUm4t97yLYKDOE19682TnrAyqIUCFc4EcWQnqimPj7RlmJPd
 mBrlrdoU8RoUHClpqndBo64WJJvKeZLSnZUFU8wTKnlvMfTBGLwa2gYSk6QfRr9BS2tC
 fBeA==
X-Gm-Message-State: AJIora8TqZAOLe8UAmE2mfxFMkIKv3Yd8Cn4ldoleFZuDcCTkaC7nh1v
 WWSm2GoUPirM4SMcom0ijq4fvIaI1bI/soygcqFX9mjAbbiDX6hZeHwEUew8BWO4Nnp73jVHsI2
 gcJQEp5/dNzpymPo=
X-Received: by 2002:a7b:c450:0:b0:3a0:32ec:efa9 with SMTP id
 l16-20020a7bc450000000b003a032ecefa9mr4457726wmi.12.1656084375643; 
 Fri, 24 Jun 2022 08:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbuJmBd+FQJ6QE1o8OCUtnbzSFsDyIStoACUT7QDh2UuI+zg1cwrBXTN5uLRzaRCLsD1nczw==
X-Received: by 2002:a7b:c450:0:b0:3a0:32ec:efa9 with SMTP id
 l16-20020a7bc450000000b003a032ecefa9mr4457690wmi.12.1656084375375; 
 Fri, 24 Jun 2022 08:26:15 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b003a03ae64f57sm3044661wms.8.2022.06.24.08.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 08:26:14 -0700 (PDT)
Message-ID: <a70890d9-6a1b-709c-f672-1e7473ac7804@redhat.com>
Date: Fri, 24 Jun 2022 17:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 2/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20220624145039.49929-1-akihiko.odaki@gmail.com>
 <20220624145039.49929-3-akihiko.odaki@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220624145039.49929-3-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/06/2022 16.50, Akihiko Odaki wrote:
> Developers often run QEMU without installing. The bundle mechanism
> allows to look up files which should be present in installation even in
> such a situation.
> 
> It is a general mechanism and can find any files in the installation
> tree. The build tree will have a new directory, qemu-bundle, to
> represent what files the installation tree would have for reference by
> the executables.
> 
> Note that it abandons compatibility with Windows older than 8. The
> extended support for the prior version, 7 ended more than 2 years ago,
> and it is unlikely that someone would like to run the latest QEMU on
> such an old system.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/build-platforms.rst  |  2 +-
>   include/qemu/cutils.h           | 18 +++++++--
>   meson.build                     |  4 ++
>   scripts/symlink-install-tree.py | 37 ++++++++++++++++++
>   util/cutils.c                   | 68 +++++++++++++++++++++++----------
>   util/meson.build                |  1 +
>   6 files changed, 105 insertions(+), 25 deletions(-)
>   create mode 100755 scripts/symlink-install-tree.py
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index 1958edb4305..ebde20f9815 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -88,7 +88,7 @@ Windows
>   
>   The project aims to support the two most recent versions of Windows that are
>   still supported by the vendor. The minimum Windows API that is currently
> -targeted is "Windows 7", so theoretically the QEMU binaries can still be run
> +targeted is "Windows 8", so theoretically the QEMU binaries can still be run
>   on older versions of Windows, too. However, such old versions of Windows are
>   not tested anymore, so it is recommended to use one of the latest versions of
>   Windows instead.

Please update _WIN32_WINNT in include/qemu/osdep.h accordingly.

Thanks,
  Thomas


