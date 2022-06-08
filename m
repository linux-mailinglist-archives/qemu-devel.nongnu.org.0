Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3954215E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:53:21 +0200 (CEST)
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyod6-0002NP-3X
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nyoaU-0001Is-Nx
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nyoaT-0006Vr-1K
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654667436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CiFNgXyGKHW+9a6Xl5mvkh6x2UPl/Hkx0d9XTWCDLw=;
 b=aOV0S3dBZGPvh/4bRJyXMEtmQbrcmgZdHtdF3pLcWbXmdE0WGQAjjuYU/Do6RzuJiWvT7e
 VY0lGwvsVxEMrhK+p32LUvXUQxVF+haQjczxjixlSM3Dc7k3hb25aQHv84AGT2+qnliI8Q
 KP+Z9Mw6H/oSIPyweIUL7xbjFxtuzmA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-B-kbwcl7NK-2ObbpRjNREQ-1; Wed, 08 Jun 2022 01:50:34 -0400
X-MC-Unique: B-kbwcl7NK-2ObbpRjNREQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k15-20020a7bc40f000000b0039c4b7f7d09so3713297wmi.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4CiFNgXyGKHW+9a6Xl5mvkh6x2UPl/Hkx0d9XTWCDLw=;
 b=1pXCI16psDltB42GWDt9G7KPlhOCfhOBZZVjERPMA4N8IBAa5AlnRPj8XZMGG2bjaK
 deSBdf7hOwIG1vTQ639rIezcTH070kHnSpLEC3VD1rGmv8u5eraqp6wor+n0PbrNTP6w
 Wl+uCfxTh/429s8ugREPFts6kIECitcABBDApa/Ti8AbWQD5G8zf9uko42PzO3JtgJR7
 Nkll3VmU3p51NFmGf+GDuiggW149Ycp/+2qYKh0Mk+vzjJt3QTNIJlgTA3VXSa47PNW8
 HS7fF3499NEmFqGDtXk1vSKKL7yexqc8AdrebDCkNNDcu62avahm96HVjVLbIgg0xhun
 DcDg==
X-Gm-Message-State: AOAM533SpLRZp8dqLrt6+1L1kCSoiza+v4dscD+1yOAUT+9DSFNaR3CJ
 t7GycvAdrYLDQYNBGMql1DYukUyhsfHKLXK0lDllb0TbQzpDp4qe4qG4LYUM6iWZiZ3dBFB2fh6
 hObfL1nHTPDVg8SQ=
X-Received: by 2002:a1c:f305:0:b0:39c:4840:ab42 with SMTP id
 q5-20020a1cf305000000b0039c4840ab42mr21375984wmq.148.1654667433584; 
 Tue, 07 Jun 2022 22:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOJiqTN4ZdLvjXPXBNhGPI/NEhrqqtIaSLzq0tjmNa2teMobXZIoHS7PDllX/0tfNthi++qA==
X-Received: by 2002:a1c:f305:0:b0:39c:4840:ab42 with SMTP id
 q5-20020a1cf305000000b0039c4840ab42mr21375967wmq.148.1654667433348; 
 Tue, 07 Jun 2022 22:50:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-66.web.vodafone.de.
 [109.42.114.66]) by smtp.gmail.com with ESMTPSA id
 q16-20020adfcd90000000b00213abce60e4sm16060114wrj.111.2022.06.07.22.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 22:50:33 -0700 (PDT)
Message-ID: <2fca7b7e-f95d-eae1-9973-9ede30cac3c1@redhat.com>
Date: Wed, 8 Jun 2022 07:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/4] Add a new doc "contacting-the-project.rst"
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, eblake@redhat.com
References: <20220606164336.245740-1-kchamart@redhat.com>
 <20220606164336.245740-5-kchamart@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220606164336.245740-5-kchamart@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 06/06/2022 18.43, Kashyap Chamarthy wrote:
> This document slightly duplicates the "support"[1] page here, but
> largely refers to the content in[1].
> 
> This is based on Peter Maydell's feedback[2] in v2: "there is some
> merit in the documentation being standalone, even if it does mean a bit
> of duplication with the website".
> 
> [1] https://www.qemu.org/support/
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05178.html
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>   docs/about/contacting-the-project.rst | 16 ++++++++++++++++
>   docs/about/index.rst                  |  1 +
>   2 files changed, 17 insertions(+)
>   create mode 100644 docs/about/contacting-the-project.rst
> 
> diff --git a/docs/about/contacting-the-project.rst b/docs/about/contacting-the-project.rst
> new file mode 100644
> index 0000000000..83c1c50c48
> --- /dev/null
> +++ b/docs/about/contacting-the-project.rst
> @@ -0,0 +1,16 @@
> +.. _contacting-the-project:
> +
> +Contacting the project
> +======================
> +
> +There are a multiple ways to reach out to upstream QEMU project,
> +depending on what you're trying to do.
> +
> +If you have technical questions on QEMU usage, there are multiple
> +channels for it -- mailing lists, real-time chat (IRC, etc).  Refer to
> +`this web page <https://www.qemu.org/support>`__ for more precise
> +details.
> +
> +If you think you have found a bug in QEMU, please follow the procedure
> +outlined in `this document
> +<https://www.qemu.org/contribute/report-a-bug>`__ on how to report it.

Could you maybe also put a direct link to 
https://www.qemu.org/contribute/security-process in here? ... some people 
still get it wrong how to report security issues, so putting this directly 
maybe helps a little bit...

  Thomas


