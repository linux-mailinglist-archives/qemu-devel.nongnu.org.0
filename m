Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2610F682F77
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrCV-000675-JY; Tue, 31 Jan 2023 09:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrCI-00065n-5O
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:01:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMrCG-00024u-FE
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCzLvOIX/WUniRn+p0Kn2xtNaVyhknAVBtVLlJFF0Ms=;
 b=COht6Y9tosp+mJFj37RHZyujTPVMRBneISrw4KhsvgdbIokwJXpEwqJDu2xcFFXpHOcS+c
 bV5sMJmLL81muyzwDojlBWLXEx6hsQ6bJDf8UlWTYX7y9K6/1jEcsc2+ZY3/X5DLzFcYTm
 AIUHTUjNni2w+FOSsaY2R41/k8SGzIQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-Bc2kdXGLPFm5eq3ZX2g8Fg-1; Tue, 31 Jan 2023 09:01:12 -0500
X-MC-Unique: Bc2kdXGLPFm5eq3ZX2g8Fg-1
Received: by mail-qk1-f199.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso9253490qkp.20
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 06:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCzLvOIX/WUniRn+p0Kn2xtNaVyhknAVBtVLlJFF0Ms=;
 b=zUnD0XjBSRZqJCoqhWRBvWx9WaKowI9d6qezAkd4FtEUzOHZpjLdy40ToB+itnVlh6
 UqjFM2xEHnFAzLJIA5jFR94rfxM2r+oIOv7j4ooDJleRGiQLpl9QYbvd6s8NLVKoT1M5
 DXoYFK9dArcR0w3zo1TDrh3EVSO9t+J0FaXMJVnbzR7ENXSBKvEiy6zqVcdjrgxRNeaj
 KTywot4jhKf7ZeBMB4Lm2DTRIt+jVnWMlT8gvKpEtX6iRIKPTkRurMVfQSyWTGHsI0Qb
 +npZRxSBk1+BWAXJ0vzrA6oUssuuUW0cE79teNXi1/c2m9ZhGMw2Wq97T0wBJbE9sooE
 kPlw==
X-Gm-Message-State: AFqh2kqop89p7toWG7a9nXT0SqrarSArLY6Y5QYCTIoJGn/fQ/Q/IlJf
 qEcoPuDxNn5If+afKh1fUERL6rXdrD/AUAsMydOa5/ISi8aoaCm4BWbBFYiZZw4vRDSbkFP/9Dm
 XdMX2T3N+wHRKn/U=
X-Received: by 2002:ac8:4703:0:b0:3a5:4064:9fd3 with SMTP id
 f3-20020ac84703000000b003a540649fd3mr74281736qtp.24.1675173662404; 
 Tue, 31 Jan 2023 06:01:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu04YOylhVngO+otxitvQKIVPcVjj+RHD6+yNjBLFDNYDUYpmOyEVADhXtpdF1i/WzzJd5ZeQ==
X-Received: by 2002:ac8:4703:0:b0:3a5:4064:9fd3 with SMTP id
 f3-20020ac84703000000b003a540649fd3mr74281480qtp.24.1675173658635; 
 Tue, 31 Jan 2023 06:00:58 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 b187-20020ae9ebc4000000b0071f40a59fe5sm4097447qkg.127.2023.01.31.06.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 06:00:57 -0800 (PST)
Message-ID: <7d8d8021-0dc7-0e24-f7b9-5fecb3d15d4b@redhat.com>
Date: Tue, 31 Jan 2023 15:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 08/20] hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-9-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 31/01/2023 12.53, Bernhard Beschow wrote:
> The Q35_MASK macro is already defined by TYPE_Q35_HOST_DEVICE, so let
> TYPE_ICH9_LPC_DEVICE have its own one to prevent potential name clash.

Ouch, good catch!

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/ich9.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


