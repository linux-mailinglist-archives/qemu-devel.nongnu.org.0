Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5316F586E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:00:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puC51-0006fC-4E; Wed, 03 May 2023 08:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puC4z-0006el-OA
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:59:33 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puC4y-0005du-6k
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:59:33 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so6746843a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683118770; x=1685710770;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhkjGCjqsQrQhA4tw25U2zqq9v/r2QPCO3/uIbH6iYY=;
 b=lI9Nw+1UlnPkhtbKWbkp+HSihlGFIQrsPiNCFhzEXAMo8YpUHf3aZY2jiginBebbQh
 ScacajAxqFjQNVLEt+2+K+6kU9jbFpNkNXwkmncXsaFyKPK2UGI/HggLOvpLAsrFqV+M
 w/AdI8oSsdPrzEdDEF96LIQWMRpMrArmcxFnogRU+7880Tu2Fjuu+9JtqIJMiP4CElh8
 dqRsBk2R78FmX6oG1kobsHVOIfj6QVW4U6nYRzRVQjoJ884OM61KFvSvbTA4uuqNsPO7
 39X3n2O586++D2iyHIAG/1biLPopt+YNGKScr3NptSzWjXllLDF+/Mxm6JARYr4KNCT8
 N7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683118770; x=1685710770;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZhkjGCjqsQrQhA4tw25U2zqq9v/r2QPCO3/uIbH6iYY=;
 b=igPKZ6Eme9DtIXcH6jFceYlnCqT5Opt9e4erP7ott+TYBqfoQidgLgIljMyuMNBu2b
 AyPDKVrRw2lFsMdQ1UwpzGubM2i/DOdT99DJYfv4Y/3s2PD4wzAZ0LNda4ZyB8Mr8tbC
 K7afAie8Rni6vXIqfDXBtS5w4WBaCD1GDmg3PX5YWKd2cBjWxg+xToUfZk6FwfVdeifu
 mzRlIt5RsTQKEmpLC/ua8OeOIcMWCOXbx/Y68xTzbfbavYzsJgGX/M1L5Vwyf19IelSl
 PZacHD6waWdQO73tPatYC9Wf6gW4OJiIctwZPqJVsXCiOxeA8l08M+jlhVzRk3g8iYaq
 jeEA==
X-Gm-Message-State: AC+VfDyAqVm8C5FuWJ0RG5y/wNQVFG66XEoG8XaXq2Yo3aa4OtQLNTtU
 FG2VjnsKdetLco2/PT+tOzshDRnXttvztYL7ifXU7A==
X-Google-Smtp-Source: ACHHUZ6QVmt4yhpvRMo4CuTFVNltMofp5D6Gi36UQVkTzlQ4zBJSjzU7HF9SiH7jTSQjjcHCy4TB3qJUdyif2Fq+8AM=
X-Received: by 2002:a05:6402:543:b0:4fd:2b05:1722 with SMTP id
 i3-20020a056402054300b004fd2b051722mr10575423edx.7.1683118770470; Wed, 03 May
 2023 05:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230503115437.262469-1-pizhenwei@bytedance.com>
In-Reply-To: <20230503115437.262469-1-pizhenwei@bytedance.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 May 2023 13:59:15 +0100
Message-ID: <CAFEAcA-rXQwFAj9pz9vtqdk3i5KYDcf_w2-s78VtF7NYQJvsvw@mail.gmail.com>
Subject: Re: [PATCH] cryptodev: fix memory leak during stats query
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 12:54, zhenwei pi <pizhenwei@bytedance.com> wrote:
>
> object_get_canonical_path already returns newly allocated memory, this
> means no additional g_strdup required. Remove g_strdup to avoid memory
> leak.
>
> Fixes: Coverity CID 1508074
> Fixes: f2b901098 ("cryptodev: Support query-stats QMP command")
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

