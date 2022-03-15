Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122FF4D98FD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:42:04 +0100 (CET)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4cs-0003N5-T9
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:42:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU3L3-0000xy-6C; Tue, 15 Mar 2022 05:19:34 -0400
Received: from [2a00:1450:4864:20::52d] (port=36846
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nU3Kv-0002DS-Rg; Tue, 15 Mar 2022 05:19:27 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t1so23116163edc.3;
 Tue, 15 Mar 2022 02:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9k1wBD4M/z+XyR+a0K3WzfJHizYpUSBuCpRdCyaUu7E=;
 b=T0KPB2YWy+17bfRK0R32tY6OkG8nDF4HwXhrHKaERHSolGa8JDd721PIukLRr8pRLq
 +F6z5O+TWfEvHCA/7f7w9zlwe5FyXy1mSjVv2P6gu2CZMHbh9ojIIHf3/TnT9J5rCELO
 FjjhX5+94I4yyxSlpo++i0W2eGGPzxYMYtvQBCTyQB9CmV2ZJI/kOsH/T0aAKQDyik6k
 U3/n5aQNV9gwXVLFNEdHsLY36wuib0en4aYnjSyQ+Xg/0qvwsrmexhhXPIjFF03w9Ar/
 c8414dlUCw7EkjBY6BmAGGAvk4nlE2U0mO2v/EJn1b4YbbylCkTu0tbzFQTbpwXNmj2c
 Rc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9k1wBD4M/z+XyR+a0K3WzfJHizYpUSBuCpRdCyaUu7E=;
 b=aU2zXiNsn4v0bKj/9z3gqsi7bprP1R7ZpOUvk7MeNTSsygsEHGVK/RRlxsQ0gdkbvx
 w29h48HKf/3cB1tQ2fSwmJphMBmzUbL0bxBav7DpFiK5TVkYUO8IY1Z4jsmbtla4LRKy
 HcWcaBaXZS8MNHCnIWjE55RUzWLYrQpL3dY7yOctEBilUmlZLJjpfbvfoyz2Py1pZ16q
 MCATZxooXnSxozmwLdBMz/iEzHRm7JK3z7RM8AXhlteqULhwXt8O8EdAG5JWwCAugQJZ
 KvEQxzyJDXAmOL8wFEQ6NWeWE0IgJtxDvRajnZQ6On4/vKWzBCsp2ydAR2VyMpkAhC2G
 DoMA==
X-Gm-Message-State: AOAM530mLcL1xN206PJTlpq3vrmGF0+yafDzfhdmXRxG2xNAaogGKlXf
 zPumRKyfehPPRvH0I1A4JYw=
X-Google-Smtp-Source: ABdhPJxqkabVGPviJNNrvOXxk0Z0SuxqMgvywYRlq1fQG7tP3ZeMv3kR/bDSqhZ8COgbE+s/mLxwyQ==
X-Received: by 2002:a05:6402:518a:b0:416:b50e:3c7d with SMTP id
 q10-20020a056402518a00b00416b50e3c7dmr22431015edd.177.1647335962177; 
 Tue, 15 Mar 2022 02:19:22 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 c17-20020a05640227d100b00416bbe8ca69sm7951217ede.89.2022.03.15.02.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 02:19:21 -0700 (PDT)
Message-ID: <921d2ca3-7f90-9c7a-bb10-27a5c06a4c4e@redhat.com>
Date: Tue, 15 Mar 2022 10:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0?] meson: Update to version 0.61.3
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220315083521.280024-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220315083521.280024-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 09:35, Thomas Huth wrote:
> Meson 0.61.3 contains an important fix which helps to see the
> output of failed qemu-iotests on the console again:
> https://gitlab.com/qemu-project/meson/-/commit/7534cf34f83b9c43
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson b/meson
> index 12f9f04ba0..5cf5575a7c 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
> +Subproject commit 5cf5575a7c76746935dcd9a9e380803c85023c04

Please update configure as well:

-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.59.3; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.3; then

The bump would only apply if --python is specified or if --meson is not
specified; therefore, it wouldn't change the minimum supported version.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

