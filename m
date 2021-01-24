Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AED301EE4
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 22:14:32 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3miN-00016g-M0
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 16:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3mhM-0000dx-To
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:13:28 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3mhI-0003Q2-Sv
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 16:13:28 -0500
Received: by mail-pj1-x1029.google.com with SMTP id gx1so1586313pjb.1
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 13:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gefjsTiBX1tWolLfZqIAPIuIPdCXs9pg9DrzJzJYtRI=;
 b=EQGLqYM2mCCjtuCouH1DR2oL/pchtRO7PfHvw0K4sSD6QVQgpGnrthojd5oxKIQS1X
 oY9QsjgqvI47CPIPC6lvcZ/OAHujCf2s+1MiU7q8C9mdxAmB5hq78lRnEKi+4PoPGeFm
 hDaPwnpMAqoeIaVslfIxLyV5cmFYl8/BZrT/03Zy7MW2OWNT1FDaveN7LPyeDTnOG5X6
 ukipjAZwt6bJEKKtB83on8b0UCYZN0iw/9IKnStpPo0V3jz26y03kzytYBwgdtlnGkyU
 PkPlBxna0seXf4Dog6fpj7D35ja9yLv/6bhUYTXTlN/R/rCv8lobylzYVthejLC52SKg
 mqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gefjsTiBX1tWolLfZqIAPIuIPdCXs9pg9DrzJzJYtRI=;
 b=N/iWF+GHuZPzU1f2mKhvu7oR2SKDyg4T7axtJ4k0gQ0mmTfZd5PiN7UWhmw6O8j1Y9
 y5JMMMD142CzI+37ZRzUxrTu7lUuLKtS3rooH5nF6yamnk9uE66cnUJM3WF9scWhoXv6
 xFjEm6E8pSGLK1X4hg8//P3nbCgXFsTY4nO52+Ou1dJGZKvEwsgLsDU9RPMJamJwdtdi
 YhSLetdZWtJvKdsu5UK166esdYc//bJ9AdeVWFoE22IkXUybi8CQ9ZC2b/UvBuGPVXDd
 rHVy++4QuOeiG1SRbr68YjjMjrF/M0eTnT0QtqSaneuGB/fVzt17r6d+dQ6B/n75Ly2k
 lTTg==
X-Gm-Message-State: AOAM533uLjfkUZa4yGkf5kolSoO3SGG6eh4LeWjNMIAoHrOz6L0Qa6Zl
 4JR7fgD7SsX9i4VIPDW1l4+unetPEyQdFQ==
X-Google-Smtp-Source: ABdhPJwYd7NUVELLhMEtdPDuZiCXc0Py1bTHJ+Z+MIxLzHQrTtPzN8XmmKr6kmfVYlMhQykfrLBtbg==
X-Received: by 2002:a17:90a:6643:: with SMTP id f3mr252469pjm.33.1611522803387; 
 Sun, 24 Jan 2021 13:13:23 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x14sm14785049pfj.15.2021.01.24.13.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 13:13:22 -0800 (PST)
Subject: Re: [PATCH] configure: Fix --enable-tcg-interpreter
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210124211119.35563-1-richard.henderson@linaro.org>
Message-ID: <d4c96584-430c-1f34-95a7-0d05808c9370@linaro.org>
Date: Sun, 24 Jan 2021 11:13:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210124211119.35563-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/21 11:11 AM, Richard Henderson wrote:
> The configure option was backward, and we failed to
> pass the value on to meson.
> 
> Fixes: 23a77b2d18b
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure                | 5 +++--
>  tcg/tci/tcg-target.c.inc | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Bah.  Of course the tcg/tci/ hunk is unrelated,
and snuck in with a git commit -a.

