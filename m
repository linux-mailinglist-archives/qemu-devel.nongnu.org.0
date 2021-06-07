Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8E639DD56
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:10:45 +0200 (CEST)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqF1g-0006yY-Ki
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqEys-0004b8-A9
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqEyp-0005k2-V5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623071267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOQN2e4mcLDUJ+FFgwXMgyNzY8zHjv4RlqJIYxabbfY=;
 b=EpSKSvdcVHzKAoX5W3hS/Ho9tXNC4+msvR0u1t20gltS1F41UiN/gV/wGhbk0GOp2SmDoN
 1XqtsmUMGA/Bn4yTu9/nZyZrsW/Ae+tOgMOtnspA8WVSVfWuhLYXG1u2qxAZ749Yn3IYom
 UQn60hO5/jLwr8SiIlwyBwmWJZ36Abw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-1U-jZyaHOSOKqScEJAdl7g-1; Mon, 07 Jun 2021 09:07:45 -0400
X-MC-Unique: 1U-jZyaHOSOKqScEJAdl7g-1
Received: by mail-wr1-f72.google.com with SMTP id
 h10-20020a5d688a0000b0290119c2ce2499so2917752wru.19
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BOQN2e4mcLDUJ+FFgwXMgyNzY8zHjv4RlqJIYxabbfY=;
 b=CvSht2pgRH9ScbatM5/Yu/G3oAx6JMVmCJl9ulLqz27Yc62CRp9rW7nYVULReEc8XY
 UEUt33WIB0fG1YeWoRjKf0u0rhBist+nSdF2GZS91wR/w0ED200HP24JLbLkk/Lhapqy
 4CurZgZj9tmdUQbunLDgzpFv8MDGf5DBykjh/cPrPf3YKL6VA3hhJv8N3S84lWh3Sx37
 Wmg5RAynyy5Jag6Bzk0Jb//ic8Tf9E6Sj38GI3XAnlTywcYfn7zDcLVmoHAkYbH93CBu
 T1fEZlPxB+KlHylMhuLtMls6ytiX8fAJkrhVmBkCzkqUpX5aNFRpEHLTdYBujjPRchOG
 1kpw==
X-Gm-Message-State: AOAM532dc8hfTkFBCdiyLTPT38qRGKQuV4eayZJEhT8hNACdO3RFpYuL
 1g47Aqzj8AyCNgmuQFmeEvCdmv8iWmYPdOAhMOb6mMcUpHtIrPAOspgaCPyorIauMrJ5/MN3eD6
 68nN4E1A1/lUOUTM=
X-Received: by 2002:a1c:2384:: with SMTP id j126mr16631529wmj.59.1623071264789; 
 Mon, 07 Jun 2021 06:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9TskX3JH27N0WDDs5Olyh2Q4XF+fB6L0I6wDnzqHESRvl1E4iM2fGiPKTJDxRor+Sao4+BA==
X-Received: by 2002:a1c:2384:: with SMTP id j126mr16631497wmj.59.1623071264579; 
 Mon, 07 Jun 2021 06:07:44 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id v17sm7192977wrp.36.2021.06.07.06.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:07:44 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 02/99] accel: Introduce 'query-accels' QMP command
Message-ID: <14b256ef-4fc2-302c-45b1-295c26aa76ce@redhat.com>
Date: Mon, 7 Jun 2021 15:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
> 
> - Accelerator is a QAPI enum of all existing accelerators,
> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>    specific information. Currently the common structure base
>    provides the name of the accelerator, while the specific
>    part is empty, but each accelerator can expand it.
> 
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
> 
> For example on a KVM-only build we get:
> 
>      { "execute": "query-accels" }
>      {
>          "return": [
>              {
>                  "name": "qtest"
>              },
>              {
>                  "name": "kvm"
>              }
>          ]
>      }
> 
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-3-philmd@redhat.com>
> ---
[...]
> +static const bool accel_builtin_list[ACCELERATOR__MAX] = {
> +    [ACCELERATOR_QTEST] = true,
> +#ifdef CONFIG_TCG
> +    [ACCELERATOR_TCG] = true,
> +#endif
> +#ifdef CONFIG_KVM
> +    [ACCELERATOR_KVM] = true,
> +#endif
> +#ifdef CONFIG_HAX
> +    [ACCELERATOR_HAX] = true,
> +#endif
> +#ifdef CONFIG_HVF
> +    [ACCELERATOR_HVF] = true,
> +#endif
> +#ifdef CONFIG_WHPX
> +    [ACCELERATOR_WHPX] = true,
> +#endif
> +#ifdef CONFIG_XEN_BACKEND
> +    [ACCELERATOR_XEN] = true,
> +#endif

Nit: Use alphabetical order here, too, just like you did in the enum?

Apart from that:
Reviewed-by: Thomas Huth <thuth@redhat.com>


