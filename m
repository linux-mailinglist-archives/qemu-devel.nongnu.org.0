Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52102406C6A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:48:47 +0200 (CEST)
Received: from localhost ([::1]:46968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfxV-0007X7-Tw
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOfoI-0006es-Nk
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOfoE-0001a6-Qa
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631277548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KGgbPt7TYI+deQRk/fVbLkFt3x6fGa4E0TiCQAmHDE=;
 b=PDrrMNX5fAc4AVy4ZLi6brw8nhKGsgOiTr2KHOF/Ka9EnVFPdYVZlNvij9AJXyT0LXPJ8w
 pDQb7sAYe/cmF8YPDbQ5wTL+2I8i8W6Ci2dIveRrqgG2fXbkLqeFPhaLeHmrQR2yFgDI55
 ackkzRLQLekOgvdxK9ZXtnxmb3gaBEk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-fmKV0GxzOfuUbU39hcmZzQ-1; Fri, 10 Sep 2021 08:39:07 -0400
X-MC-Unique: fmKV0GxzOfuUbU39hcmZzQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u1-20020a05600c210100b002e74fc5af71so772384wml.1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4KGgbPt7TYI+deQRk/fVbLkFt3x6fGa4E0TiCQAmHDE=;
 b=TFG/QI+clGJtd+S3FmoPNUXwsujWd9SttrLkCbF6gEfcYYi/agT4U3ZxJ60y1pKU+M
 rIx8WQhS3Z5HicxIia3EX3ZhfMkYmMCEDeSqtHVoCYCXv2jkIBsbAs/T/RgORoKQnvw6
 oBlNE4xy3Ps5Dm3x4ltuk+hzEa2bQslj2sDw9+vDJjdZEq+YVHBRqCHcFdd1x/LEM8QU
 2JZ1Xxq8DaXQmrUZXRzcaPbUe/X1QwUqmdpEKvb0qg9Vk4ooIcbTBMZdtXppVjQTXXmB
 ZUfKSjbqQ2uAPPM0KK/cXFJBUCjVw/GqSWQmhFh49f7pcqm+6Yr/pego8YFA2SLnxhpC
 H6cA==
X-Gm-Message-State: AOAM533K7fdBhghl8Xb3ZnnQ+weuvYs9IlT+shHGnfVDnZ1YOrrpJ4zm
 /5Gsh+m77BxUT2rAxdDRdKPGMdpTrn/70c+buprldyX6WOyjTbPlJfwdvoSEQu6mKmumC+laNY/
 5f+DnWtzL+cECohI=
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr8241923wms.81.1631277546398; 
 Fri, 10 Sep 2021 05:39:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt3oxi0VU6tmjjIp4oNoHaWDD2w4rDN0cCv/meRbv4jl7Hlw2OfBZcjhRi22W977HTVOX3kg==
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr8241905wms.81.1631277546210; 
 Fri, 10 Sep 2021 05:39:06 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id v28sm4622168wrv.93.2021.09.10.05.39.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:39:05 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fb7d360d-80b5-9bc2-0f6f-f48e04dc08f9@redhat.com>
Date: Fri, 10 Sep 2021 14:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910102258.46648-2-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, eblake@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 12:22 PM, Yang Zhong wrote:
> The QMP and HMP interfaces can be used by monitor or QMP tools to retrieve
> the SGX information from VM side when SGX is enabled on Intel platform.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hmp-commands-info.hx         | 15 +++++++++++++
>  hw/i386/sgx.c                | 29 ++++++++++++++++++++++++
>  include/hw/i386/sgx.h        | 11 +++++++++
>  include/monitor/hmp-target.h |  1 +
>  qapi/misc-target.json        | 43 ++++++++++++++++++++++++++++++++++++
>  target/i386/monitor.c        | 36 ++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c   |  1 +
>  7 files changed, 136 insertions(+)
>  create mode 100644 include/hw/i386/sgx.h

> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 3b05ad3dbf..e2a347cc23 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -333,3 +333,46 @@
>  { 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
>    'returns': 'SevAttestationReport',
>    'if': 'TARGET_I386' }
> +
> +##
> +# @SGXInfo:
> +#
> +# Information about intel Safe Guard eXtension (SGX) support
> +#
> +# @sgx: true if SGX is supported
> +#
> +# @sgx1: true if SGX1 is supported
> +#
> +# @sgx2: true if SGX2 is supported
> +#
> +# @flc: true if FLC is supported
> +#
> +# @section-size: The EPC section size for guest
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'SGXInfo',
> +  'data': { 'sgx': 'bool',
> +            'sgx1': 'bool',
> +            'sgx2': 'bool',
> +            'flc': 'bool',
> +            'section-size': 'uint64'},
> +   'if': 'TARGET_I386' }

Is it possible to restrict it to KVM? Maybe:

     'if': { 'all': ['TARGET_I386', 'CONFIG_KVM'] } },

? (I'm not sure).


