Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5109B348497
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:26:32 +0100 (CET)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPBxP-0001Yg-0K
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBvo-00012Q-92
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:24:52 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:39646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPBvm-0004qV-PD
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:24:51 -0400
Received: by mail-oi1-x22e.google.com with SMTP id i81so95616oif.6
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KzgjC41GlGUgEcW4EtZgEnaDTou5lwE8of8dnjiCXfk=;
 b=hquR4eNgekfeTRjV6ka4AgK5o/3DRevvSDAGQD+uflmIZwcbTEYK5HNFHIsrsJTz+O
 iQzxHeiXZRfl7Pntu/rDEluO1Ly/zfJ/FBxRzZpCuOO3IGT+Jjr00u9YsiZ0HskZtQAQ
 jNoU/nX6uonjes5qqULcxB4Vi2i/n/sgcpynqqC4JfQZLS3MfJl1K/ig7pa59+jejIpD
 rm5cN4ZKFUwZgMplcQsCz77zaLwMEjaA7K1jdpS0EeWuf86gXaDNAutlr9UO+fxj3sA2
 +zmuwf0vfs0QNbDt5xJRF5TkyFH8fhNtxniYmNk0o8K+9kIz/iAVkOsJoA1lL4FbUk0W
 QRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KzgjC41GlGUgEcW4EtZgEnaDTou5lwE8of8dnjiCXfk=;
 b=IGnhnhcKcNP4iD9BiOCjoNZzpyVqNvNePaZwnanYNFcyIUU4lAC6NuHZNzYJc8t33q
 c2HREhd3BC38zbUf8AEHeqKhF+zj6awrFtq+MiwQof3yG9MD45yiGsG0+1ZHbhnPLpqu
 XX5ZgfPSR7Ppi3uP0EikGtwF1A0wvm+W8ZTz3Zg86isqwYxwUPThpmsnsbd0M9ekN5uO
 Nod/6LunY/8K69QQz+xoZQtSQmiNd5z2oAFmeY02QFSWNDPgW/0f9HPW1GxI50RbU+Wm
 AGDSHjBvrZWOD3shLJPGZ8Nw4nffWmB2bONzjZZB/5kCs3w4kY9sRr89bdLRpm0Tuqi0
 ILFA==
X-Gm-Message-State: AOAM531yQXVTPgRce3VNCXuKvOpArnFmTci+P5ykMT67vuDnrlAfpMEB
 JYsIXKUC/kyqmFh3N3jXDUSr0w==
X-Google-Smtp-Source: ABdhPJwj6NV5Tlu7787uXcPKkqyxmiNPWNvSP5sfUBe7CfywI9uilK8nHznGkMDkATVHQ0Ork5DbcQ==
X-Received: by 2002:aca:d907:: with SMTP id q7mr3943146oig.17.1616624689608;
 Wed, 24 Mar 2021 15:24:49 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id e18sm890074otf.2.2021.03.24.15.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:24:49 -0700 (PDT)
Subject: Re: [RFC v11 27/55] target/arm: move sve_exception_el out of TCG
 helpers
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-20-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9617488a-76f4-920f-591d-2c0527109833@linaro.org>
Date: Wed, 24 Mar 2021 16:24:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-20-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> we need this for KVM too.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-sysemu.c | 60 ++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu-user.c   |  5 ++++
>   target/arm/tcg/helper.c | 61 -----------------------------------------
>   3 files changed, 65 insertions(+), 61 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

