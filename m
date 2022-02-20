Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97EB4BCFF4
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 17:51:34 +0100 (CET)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpQr-0006c0-FP
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 11:51:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nLpMZ-0004QP-5M
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:47:07 -0500
Received: from [2a00:1450:4864:20::633] (port=36804
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nLpMW-0007pf-Ua
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:47:06 -0500
Received: by mail-ej1-x633.google.com with SMTP id a23so27149624eju.3
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pskRV1cS07kWdOeYvrJkZOeWdKqMBSKy/mz9Lq2cz9Q=;
 b=Op+pmnKjle3XmFkwty3OPDSgIXyqval6sVJ28qKIHT2fkLSHvExwSocxcl3FMnU29r
 K3duYj2MKz9DPPT8NjfKL0D/lxQuPIpzM3+QUrYHp3EZ4oiNTYaUeezFjiuSpW0kEO3K
 2Y2HYiG4sVogRFf1d3ZbBwfR53HQ6tlNsKq5TNjM4If29GitlzEroaAYaFMT7KkiHExN
 AhFU1FKu8gjy/Naw4bmmvh3t67GhFqQznjKsRSV9zqQelD/OT9kOfs9bPf1L5n80R4VA
 L8SrAl1zUfDMNXUpV2TQFWtr3kMqQl2P/Vbj/OFwmxrErJ6FjupXi352wwkkXZg/i8eY
 HLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pskRV1cS07kWdOeYvrJkZOeWdKqMBSKy/mz9Lq2cz9Q=;
 b=YI0tFXMIWQuFlhAevcxY/J4E+4G87O1UYX8HALLlkijTne1Dl9Jkll0PeUz+xuX4cc
 gwT9RGli1mVPu7H38jqb7KLNCe5lSgZERHbd7lYNfoyjeREJ8Vp4HGxk6u2kL/EsWPKI
 rMpvo/Y5Ax1T/3r6eJptfOa3RL4T7eTWndVWP3rpff0kwVE3K9ZHYPNWbwH+iOzxCuSb
 l/O9My00G+pBAlbpA1c3055J7HC4gN9id1D/0T6bLyAmCbZXear1X2rQMh3SA3VSSSTt
 ImeQfxp6Y98pHKDHueKMd3hhib/GzcpexF9AijLrRHcPa8SgW8O0u4m2vtiQdwhlyEzt
 IMKw==
X-Gm-Message-State: AOAM532k0GHBG5ibGoPj8CyZGXMq28TAJM3IyiSmy1AcZsQo/lPXlWUT
 24gDdHBfAmc1p0mQtXRE8cw=
X-Google-Smtp-Source: ABdhPJxaRjgwiMq0siA43YIlI784/5X2o4GzbdBib5kqxzwUa9gcE8PiYt8pUt4FqfAubatF6lDjJQ==
X-Received: by 2002:a17:906:7e52:b0:6b6:bc81:eae9 with SMTP id
 z18-20020a1709067e5200b006b6bc81eae9mr12886575ejr.273.1645375622479; 
 Sun, 20 Feb 2022 08:47:02 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id y22sm4245581ejm.225.2022.02.20.08.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 08:47:01 -0800 (PST)
Message-ID: <37ee69c4-885d-b94f-fa57-b8b17363ebaa@redhat.com>
Date: Sun, 20 Feb 2022 17:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: configure: How to pass flags to the Objective-C compiler?
Content-Language: en-US
To: Joshua Seaton <josh.a.seaton@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <CAPbYy+_XEvLYuPa5jgMde7YAgk2Cx4wDi=QnJiLn9zT5ALjROA@mail.gmail.com>
 <59b4fb65-10b6-8d4b-e257-cea50381f168@amsat.org>
 <CAPbYy+9ksqwk04EfiFGcebsgwGjjJz9GO48oekYVbybbJZUiSQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAPbYy+9ksqwk04EfiFGcebsgwGjjJz9GO48oekYVbybbJZUiSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/22 20:17, Joshua Seaton wrote:
> Is that accurate? If so, will there be follow-up patches?
> If not, could you clarify how this amounts to affecting Objective-C
> compilation steps?

This entry in the machine file affects the compilation steps:

+  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross

Paolo

