Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0F562887
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 03:45:17 +0200 (CEST)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o75id-0007so-41
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 21:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75fr-00064B-Vy
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:42:24 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o75fq-0003xt-Ex
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 21:42:23 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so818479otk.0
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 18:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nGhS/AztTnJYpCndyUZZC0ocGyMmtWcMSaaM1Fcob78=;
 b=qb54KI0VLBIE3PeIhyhmnwLcRM5eITFx3z0fy5jAL7TY/DB3zYxqmY/PXLzEmBGwe4
 5co5NrvugA4L7E1Bhq5v4dmiJSsMdX0aDylNBHWjLy6Z3D/x/LOnNJmeFsofMo6A9n1u
 wizhIFNxE1emBLobPrhGlRH1pbZCghL1LPQy9RvXe0DxCjiZGa/U9Q8BMM2+JhzFW5D4
 io3YUaOkjOXx2p0IEYRIt3EYKAqFvMZVHcB0tTK8iSEl/CKAk34F6FDiSRCDrslFqWXp
 XMtCvQ+Tn6HEw2TzK5ED1bczqlHoIAPmVkJPu6qJ3JKeZMlJ9NOPyKHZ0Bqr8Ux4jAJy
 Y7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nGhS/AztTnJYpCndyUZZC0ocGyMmtWcMSaaM1Fcob78=;
 b=KEnj7N/JKVAe4mdJo/3DEMyNbvKqm6pVhQWFwXPxuO4AByWf+J6z5wUJzkFpOa5cFD
 uf1XwDqoP41+27vlVvpkcb1+f2c9RtyxxiQrv/AU4WpcOnW0O2a6W7J+PPVwadGb/Hdq
 5EM3R9cFSBeIPvU1ZYiDsITGjpaegZrmCLbA7r5O7nuRaPeYgsn6h3FOMpE2MucAjy2K
 qSHSMK1nZ9F/dLsdLjpHt/6+75/IWcqNmsONxKPyDDcsLiyBoEjYDOQmpszBd+Blgo6B
 Kqge/DkI7pe1ECm/p8t6PkLMZiw+mCM+lgztQGRQ7mGDp7E6B5MZWTDF7B4JqT4MGOXD
 3i2A==
X-Gm-Message-State: AJIora9rkrVJxLLQOLvLwcJkSLxdXhNLmRajswdQtthpmf2/SGu8O4vT
 pcfGv5wPlP6svzWOUfOmg5cuhg==
X-Google-Smtp-Source: AGRyM1uAb7GJynHWlT0wkhv1l4OskaJCquwZt956Eyqn7lD/79A989dt8zoVwWASSuPOPfodp1JXAA==
X-Received: by 2002:a9d:76d8:0:b0:616:937e:8c7d with SMTP id
 p24-20020a9d76d8000000b00616937e8c7dmr5280160otl.189.1656639740921; 
 Thu, 30 Jun 2022 18:42:20 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e8:1685:38ec:3484:7cff:725b?
 ([2605:ef80:80e8:1685:38ec:3484:7cff:725b])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a4ad1b7000000b0035eb4e5a6b6sm11573444oor.12.2022.06.30.18.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 18:42:20 -0700 (PDT)
Message-ID: <69ccf1c8-1fe8-237d-8c99-a58f607536c6@linaro.org>
Date: Fri, 1 Jul 2022 07:12:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] gitlab: tweak comments in edk2/opensbi jobs
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220629170638.520630-1-berrange@redhat.com>
 <20220629170638.520630-3-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220629170638.520630-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/29/22 22:36, Daniel P. Berrangé wrote:
> Get rid of comments stating the obvious and re-arrange remaining
> comments. The opensbi split of rules for file matches is also
> merged into one rule.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   .gitlab-ci.d/edk2.yml    | 14 ++++++++------
>   .gitlab-ci.d/opensbi.yml | 15 ++++++++-------
>   2 files changed, 16 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

