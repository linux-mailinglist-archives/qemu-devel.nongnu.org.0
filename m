Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DFA4C4F57
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:13:20 +0100 (CET)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNgxq-0003B9-Gi
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:13:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNgwg-0002Ti-1B
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:12:06 -0500
Received: from [2607:f8b0:4864:20::1035] (port=42961
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNgwU-0006yc-BG
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:12:05 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 q8-20020a17090a178800b001bc299b8de1so5823293pja.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=cdrLkdMwmUEqoYu0OQad7N92eCrnGAaLvj+otSN8TKE=;
 b=hn9WRSh4WirgFVgzNCPMDxTLnUc2+JnkHOYe9W16QIQBXHZIbqglQgWREraUmPRd3d
 i1VnlxKg1t/eM8IltlOFg+RyDNICqx2qyd2eWqfGloQqzC2w/HhEyjAq62oTyr3Tc05S
 61YypzdoBUQowCjRkN/qoPpO4yhNea6qLes7PTmbvSb4xvrLVLO+pnKx3emEEU+JUPXV
 7of4CIt8Px5wqrVLuXvveHHifVCdNok5djdEQs2ASkKs2oV7RBzRmIrh+aDE+h9Rjuhz
 aeAzSsCK4/G/+pbqZBJpSX9V77j58PfsS/GcGKzrkLOlj8LWocS6IJ9XjqsFFiwTkOBz
 4j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cdrLkdMwmUEqoYu0OQad7N92eCrnGAaLvj+otSN8TKE=;
 b=7zfjtxXwFFbrtKkUfKHM+AI4sEZsxjm557opzOKrILIQhgJ3+aH1drc0o25rPUvCL2
 xcIp2QE/R8ZDPYRhMHKTEuNB7LtbVQlK3L4yh94qFwHyTDXIcqjkk3g3qoH/AtPjsDwD
 An+NEE40/7wnZK/3BXXACoMQc5RKpoz85LtkrOgAXOFBNhxE6f2abtI9yFl5RpmVQza7
 GZLgFSPtXxKbD2OAzAg1xGAbvyFyRjSbkHsfH+hhmrXfajr0XaAWA4jr2MsTIF0+TyZd
 YDYvLR3AAnJYcy4YwqKW80ZFNqfTNZu8DnhHBPqPtH63fhyA8T7+1bSnbCwAHqwyUP4L
 JZbA==
X-Gm-Message-State: AOAM533UNlslIXE/ZLbvtDWFfHorTcGHre589jSVFASwyFaOEApB7kYZ
 NybCoTFwqg29Si3ImbKTA8jjFQ==
X-Google-Smtp-Source: ABdhPJygua+Cd1g2JQ8efOaSwzKKSTXpUKDBFOskm0cUrQu2dZTHy7XVkTHkr5p4Ba76Kgs+muxQHg==
X-Received: by 2002:a17:90a:7107:b0:1bc:89df:f6ce with SMTP id
 h7-20020a17090a710700b001bc89dff6cemr4763566pjk.69.1645819912688; 
 Fri, 25 Feb 2022 12:11:52 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 ng5-20020a17090b1a8500b001bd1316e872sm450pjb.14.2022.02.25.12.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:11:52 -0800 (PST)
Message-ID: <46c59d04-4ff3-bb08-2b5f-db348a21e7ae@linaro.org>
Date: Fri, 25 Feb 2022 10:11:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/18] tests/docker: restore TESTS/IMAGES filtering
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
> This was broken in the re-factor:
> 
>    e86c9a64f4 ("tests/docker/Makefile.include: add a generic docker-run target")
> 
> Rather than unwind the changes just apply the filters to the total set
> of available images and tests. That way we don't inadvertently build
> images only not to use them later.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reported-by: Alex Williamson<alex.williamson@redhat.com>
> Message-Id:<20220211160309.335014-2-alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

