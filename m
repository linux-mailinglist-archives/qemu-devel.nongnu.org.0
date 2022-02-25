Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B14C4F66
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:17:14 +0100 (CET)
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNh1d-0006h8-P3
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:17:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNh01-0005Yk-NO
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:15:33 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42698
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNgzz-0008J0-C8
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:15:32 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p17so5702129plo.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=D0MHdxULwpDMn/wHVgTX66hXwZZfJQR/xxxu/Jb0cnU=;
 b=gytodPZy9BCNOVgG0mTw1ZqldD6zuj1hwxDz24xg1HW7r17wDYPV4BNkBzHrHuUJB9
 0z934+TxkD4FsJJW8eppAyn71SVOr6g4wiIsau39ZokxFDkBAmSRRKNsLhutlOzGVRw0
 MvE7dVKxpM6gftscdaTauSShhhFHXgDuqzydjVgJlCHIwl/k26Xz4F989jEe4fckl163
 5Ua9udjULGuxq8ALZvDt7rRu32YJkYluG7RSQipGFlKsU0UJSVdUw2cbpQ2M21bEFGMB
 ibD8lGIhIVm9nmS6+zWPpdU2J1tTHRZBo2rY5VpP/Uh6j34C2daRyxVJWmfw19/p+jeS
 p0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D0MHdxULwpDMn/wHVgTX66hXwZZfJQR/xxxu/Jb0cnU=;
 b=OcQeBzD46amRn7uM/0tj9eYDnqJ/JfmbN0gvktaZiM/y2A4W0j+a07y2cxVYIvq0xY
 eyl+PcgBYjA0TlViQxgkH/KDalW0zZIevtWO6y34bIWhdJ4NsO/CgOK85QTfatIBl7NB
 ADdza2x0Qg0QCWKR1NJh+0xju8f5W1btPKnS2nDV5dpsgItvaT+DlqZ1figVnJQu9nd/
 nuhR83urPs602nrWxvBnlCz368X4AjT5QB+m6tGj94VgmYJS3Lypdi+ggle9t/xw+afn
 +rEtu1Od/JOBVZAs5MjrhDDHCss35WHLAfAKcJjGIYL+458fNd5pluqULmfAxhlTyEhF
 0sfw==
X-Gm-Message-State: AOAM530ftyqpmPr1eErH/ixBMZCk1sKKGwK4jakdKgc78t3Y/qYaaE9b
 SL2e/D60mOjo98J5T+yAbGLDQjoxNPMkHw==
X-Google-Smtp-Source: ABdhPJy90BmGL7BDtTTkF9UD+mF5A8/2aIwLzdCkvojaMYmvtBZ6d19pu+mmEane8xVNgXn2+M/hJA==
X-Received: by 2002:a17:902:ed93:b0:14f:c84d:2448 with SMTP id
 e19-20020a170902ed9300b0014fc84d2448mr9348644plj.64.1645820128358; 
 Fri, 25 Feb 2022 12:15:28 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 k12-20020a635a4c000000b0037852b86236sm1336749pgm.75.2022.02.25.12.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:15:27 -0800 (PST)
Message-ID: <b90dd1f3-b2c1-4b1b-ebfc-b81c15d0caab@linaro.org>
Date: Fri, 25 Feb 2022 10:15:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/18] tests/docker: update debian-s390x-cross with
 lcitool
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 2/25/22 07:20, Alex Bennée wrote:
> A later compiler is needed for some upcomming tests so we might as
> well migrate to an lcitool generated docker file.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: David Hildenbrand<david@redhat.com>
> ---
>   .gitlab-ci.d/container-cross.yml              |   3 +-
>   tests/docker/Makefile.include                 |   1 -
>   .../dockerfiles/debian-s390x-cross.docker     | 181 +++++++++++++++---
>   tests/lcitool/refresh                         |   5 +
>   4 files changed, 162 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

