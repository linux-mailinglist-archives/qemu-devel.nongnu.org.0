Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5045FB98E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 19:29:44 +0200 (CEST)
Received: from localhost ([::1]:40144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiJ4Z-0002sd-Ax
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 13:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiIqM-0000Ac-Ik
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 13:15:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiIqK-0002Fj-Jl
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 13:15:02 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so12734699pjl.0
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/w0wg4h5X+YX0/pZxjVdy+bed7jUHprcO/EWc5Qn974=;
 b=Esm+sGBnz35Zoq4yv6g3jOlFJ5YH0ckDsIb3BuLSGnfBrBo4PrjEgojFpiyASyOO8a
 uzOSxM4JBSbyy0ny9YnQDayTrqSra11mMpVp6Sc03YQ7cPsmljdaoKjWfsabRY6rCoqa
 4kbtLIM2y7OvLnZEkMfiNnVz93hrGoFr1SaIRzxSmfZzXyyilEVXmT/uKQ4Q9XIOO/qE
 UcnkRSPNf5F0OYW/J9xhKJxUJ9PavQ69Sh3fJxZ3TvVkIaGsA4HlJma6YiS3d7bVi7XJ
 3pP1I5/yDzNcJnPqIN+8z5cWrsgANzmNKk0mgbARvhD43uQ6ZBl1kBJgJcOu65dsXUOC
 9d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/w0wg4h5X+YX0/pZxjVdy+bed7jUHprcO/EWc5Qn974=;
 b=dZzEYL/xrOiUklzLqd/1DaotYC/R8+ewM8P2GXp33qN/BD8PVinCNCjWOSX2bl79p7
 /zaliOG3Vj8svrxXc4RMoCjVmMilrFiYc1CAWzmBsKaFEeofkHoI+XphI7pqLWa40gAO
 VLSl0KEiAxyn6JcE87uYzyIu7Paz/xMaToWuudu6n2tb5lXt6QFwSY1dpW1RKoF3W0/W
 MYvGHnZ/u2BeXwrZL8qie2pYuJnr/VNLmvP4yJxNtUn+P2O8nrh+6y+JnfygUesSvP2V
 aiFtC4JEFq2xaUReLlO5kUuKKkEBd5MxxIVf1e9RCRsPmkiVFYYQRboJv6Uc6PmUZ/XZ
 fbng==
X-Gm-Message-State: ACrzQf2VTZV/vfZw0ror2iXy3D1LD64GlE4VTYgXZN1M3Wtl0NQDAs7M
 OxGhb6zbGhUFxwDvPs7vje42cVJUG7edGQ==
X-Google-Smtp-Source: AMsMyM7cBu9OVz7OIKUo6t8HppkKvImaLCuv9SV7iS2vL8723PSYlNPkASG/LtBtKuYT7TvKWuF9Lg==
X-Received: by 2002:a17:902:ea03:b0:180:b53f:6da with SMTP id
 s3-20020a170902ea0300b00180b53f06damr19402885plg.69.1665508488317; 
 Tue, 11 Oct 2022 10:14:48 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:67e1:640e:ccb8:1a4a?
 ([2602:47:d49d:ec01:67e1:640e:ccb8:1a4a])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a170902b59000b0017e232b6724sm8867204pls.69.2022.10.11.10.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 10:14:47 -0700 (PDT)
Message-ID: <1361f358-98b9-3c1b-b80e-016de278aa69@linaro.org>
Date: Tue, 11 Oct 2022 10:14:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/s390x: Fix emulation of the VISTR instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20221011101401.81849-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221011101401.81849-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/11/22 03:14, Thomas Huth wrote:
> The element size is encoded in the M3 field, not in the M4
> field. Let's also add a TCG test that shows the failing
> behavior without this fix.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1248
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   tests/tcg/s390x/vf.c                | 50 +++++++++++++++++++++++++++++
>   target/s390x/tcg/translate_vx.c.inc |  2 +-
>   tests/tcg/s390x/Makefile.target     |  6 ++++
>   3 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/s390x/vf.c

As far as the translate and contents of the test go:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

