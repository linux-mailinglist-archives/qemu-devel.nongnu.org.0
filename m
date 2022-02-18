Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958314BB8CB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 13:01:45 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL1xG-0001Wh-It
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 07:01:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1vC-0000mR-8k
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:59:34 -0500
Received: from [2607:f8b0:4864:20::b30] (port=45748
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL1vA-0002BC-A9
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 06:59:33 -0500
Received: by mail-yb1-xb30.google.com with SMTP id v73so6711503ybe.12
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 03:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=Dvavysd93dtZzz8blXXEabiIijNoVKOXj2uwIUltIT0=;
 b=LbB3NAZNJbbRG3EQmdXZharaGCn43Ms79GfeKyiw6gdRIW44wvDx1cAJchljNJQpv6
 ffax3jtOMI4DGJGmCsXtS2CGBxdr6qMo51RcEF/+/wGz6kp+AZKT/yL5HWAyLQyq2QOp
 62rbLrggjsMNRh25ohM4I3aQEzGfFrJEzgyB5w8EY1v5mnTh8Lbl1NvGETkIqJqNUqwa
 4WFwVuNM0jNBHllez1JDOMsdXtIBbGvxX/fX5IZr2nxG1Shn7a/GN8QMWKVcPAZ7JbB6
 g2Fukrtzh2VAepKa0gePrntKk7UxuxYWSAop0zJ+zbWM0+8I7170IcUxTk8JS3FAmsj9
 0HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Dvavysd93dtZzz8blXXEabiIijNoVKOXj2uwIUltIT0=;
 b=6Ew/dM+EMgFNa3dq1MTY/WaRrlZJsTvzTnnA1ZGRZWlgCTZgP95GtFsSPeUtIScMD2
 ykFtZOxRxiNWlPR6C9rqhUw0PgdrWMawT8CNe8ZEsu/NBM0YkQveJyyoe6vEPBt7mbvd
 MH8auhQo0/rchTWbQqfF/2P+Xw5ZGTkh8/I3dKKGLua28AIUtKz/R0RQxSy5YaXa2CrW
 0KLxN1YOcfCwnayJP40hZZx/Ax5SJ5wYORU8uA9inuOY6Wx24C25xNsc8+ywnO1gWPqH
 mQChR1GpkNWE/G9/RJxi3ljKVhLk0LB4Z6N4v0PQVtDj3tDg0gbXXbUu4wmzD4suZVRd
 +Zdg==
X-Gm-Message-State: AOAM531xXFtHdDOsjk9w5CGGxuaxZC2kNh1VkwJFsdvhYby3tiOcBQ5v
 8/Z3i0J+k3+N46aoVtXdT41nLLIdh6U21d39jkhlN8dVG1SWKw==
X-Google-Smtp-Source: ABdhPJxTPkDrlUdStUAEp2sdM7nYqVJJguwwAzFUhDkrSg+uoVJOA4yN8gBFQoBtOFOWWkxFJBV3W/rsBDIvmBRsaXg=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr6918235ybq.479.1645185570981; Fri, 18
 Feb 2022 03:59:30 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 11:59:20 +0000
Message-ID: <CAFEAcA8nyOuQ_HziMVxgjFZYer9LUv-_QsKxzQY50By=6YUO=w@mail.gmail.com>
Subject: meson incremental build doesn't handle config file going away
To: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've noticed that the meson incremental build doesn't seem to
cleanly handle a config file going away, as ppc64abi32-linux-user
has recently. The build fails with:

../../meson.build:1941:2: ERROR: Failed to load
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/targets/ppc64abi32-linux-user.mak:
[Errno 2] No such file or directory:
'/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/configs/targets/ppc64abi32-linux-user.mak'

where line 1941 is
  config_target += keyval.load('configs/targets' / target + '.mak')

Rerunning make doesn't help; you have to manually re-run
configure.

Something here should figure out that "config file deleted" means
it needs to rerun configure, I think.

thanks
-- PMM

