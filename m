Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5224DD9A9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:20:39 +0100 (CET)
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVBaw-0002tf-Ug
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:20:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBSi-0004Xp-UF
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:12:08 -0400
Received: from [2607:f8b0:4864:20::b35] (port=43620
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVBSg-0005xp-Ke
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:12:08 -0400
Received: by mail-yb1-xb35.google.com with SMTP id v35so15440370ybi.10
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9WcgEF3o17QyADp+qFzE/ssFGdlXU+facX/VOe3YFtc=;
 b=S4sDk4/DSd4tpwFzMqgghRWD9kac8eB6E2O98+TSROEq1s+9lFDOrjlou4rhqNSvmC
 bd5OGLxOHUqgLaY4UHBm9nKufGHheQJsAInuHkCK7Cj/7C3TddRCQuZFp6/Zw1OyDQQK
 6ElFiy4gSDSB7/k7HVDgZfmR4UzxQD60PC481ClCfBEpkNht/JF7DDYSdV61kxQmWoWq
 hJTKUsI7aawNdsnsOGr+N1PfY1O7zK6b+kizH5kvqJgxmAT1UKxCCFscVZqC82WxDx+H
 weQUfYCo/gUjapBosvsDkzPwkhIbJVrSZrHaQFZeCB7T4wlprHiLserA1D9sWzYMhsWk
 b6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9WcgEF3o17QyADp+qFzE/ssFGdlXU+facX/VOe3YFtc=;
 b=0dob9gLSthb6Ra+UfuJIEC916T6CD4B/sdPWURKGPORiRFU+CbGLA5XE9ZpXAvwil1
 Os5hSTfGlyQUpHr/6hrpvE0FewInWMTbvs2xaZYGl1G5dVsiViXrdAvWATLXxnl/oLt/
 kmQqgiB6KaoBCRiYE2LygNWzy94q3TKS1Hc2MV4CPX/yQY9xEx7fq3Z5tMsDGxUG+eiF
 UThpovQIFIfUkg7El1rxbSxeqyzzVdg2BUkmTr1uyHAJDu8MnZwQpJ2f/ZEIChczIot9
 7rBziYgHWZe1pV/qCMkksQxBI09MDO4r/HNWfUPL4STcoPRqvrBZuQX3Mae1JCjleaaP
 HnQQ==
X-Gm-Message-State: AOAM531LXda3P8zedCM8JEqSxVxl8/kNAxf/TZcbgQ8GAhpADsWGrC4c
 XZauJwiMW9a/sztMB87ZX58mcore+y1GPC2Fx8M+qw==
X-Google-Smtp-Source: ABdhPJytV4HBKF1TL67nY5pHkdFHUMWquZ26tIIFgMhexeoeSMm7CEhIKaDaOLvuHaVOwMpQXM3jycQtMukBAm431fI=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr9654125ybf.288.1647605525785; Fri, 18
 Mar 2022 05:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220302130417.18551-1-ubzeme@gmail.com>
 <20220302130417.18551-7-ubzeme@gmail.com>
In-Reply-To: <20220302130417.18551-7-ubzeme@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 12:11:54 +0000
Message-ID: <CAFEAcA89+KEcg1eEQLsETNhAJ5AO51J6SRT0L0T6_K_twnu+Bw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] hvf: add a lock for memory related functions
To: Yan-Jie Wang <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 13:04, Yan-Jie Wang <ubzeme@gmail.com> wrote:
>
> We follow how KVM accel does in its memory listener (kvm-all.c) and add
> a lock for the memory related functions.

Could you outline the race condition or conflicting access that
adding this mutex is fixing, please ?

thanks
-- PMM

