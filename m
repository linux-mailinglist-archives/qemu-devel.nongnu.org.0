Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B069526657
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:40:49 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXPM-0001fA-Co
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXKx-00076s-Ms
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:36:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXKw-0007Ej-2V
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:36:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id 137so7835795pgb.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qPvZqUMUi33V/IMJ9Gkx5FlS8PHYJNYQTstS31rc0hg=;
 b=B/i7jy7mnmwxjK97FpFW8Jbp5E5wl4ixKEb79d2Ww6T109wcoFD5r0n0ToM+Z3abM+
 fwEzox0KcyqRF61DqPnLxEYV3xzh82NnFdA9R+FSnDyPXDuglzqJJU/rl7e/rjKIWAUH
 ZlpJPQbGpcyYySQ1HgOB4L8OKHli4B8zEQpwH9PhwqUpLD8wzEsQcBy7hMufZHoupenz
 OJHhVNRrB+cx+uvg32uY77sctSiRJmduIOHokWWRLG9tVClQ9M89dcsip7vXUd0QOO84
 8DwuVPar3oUntp3EXCzaQK+fOgOHsP+LU8GTMLq2ESn0Eq01rApXkkMN9OmCn/10JCLZ
 GokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qPvZqUMUi33V/IMJ9Gkx5FlS8PHYJNYQTstS31rc0hg=;
 b=bjdiTVbJyIXFQpGggxWQryyZlRnCaT2v8ZlmHQYwCF8LMC+705z4OEpg5jBcH5oNKn
 TfgBJTnos2GDShTOG++rKR8fFmjAaj52G9NmT4Yocir25cUUjNiJw8jTY5aS0rhzwlNG
 rFEwrbc2/68ozM/w6UO5/WiUtfR+vR1fcSwkDhZv1llN/Zl7HdV9So3W7oLJoMaRRxDK
 Q29gZJjtiOWFQk7B9EC5TQoznCfWVAF65cGpByaT985uatw1GhjJanBCIQKdVH1JzPw/
 OpT2kVz7noDZ5GdsKMgcRyQoI3A/6j7AHrCFE34HRL2GCdQut2kH8Kd9oy0EWNBYrdI8
 C/Iw==
X-Gm-Message-State: AOAM533Hkagjr02G8sYTNuNH9kfC2VxofqeoT5jogMkRVPEHDOUGeC/Q
 MCVoFvQVShrwMtYDlKA4zZrcWw==
X-Google-Smtp-Source: ABdhPJzBAYL1DBDFzeO/a4L0L+BDCXfkWFiu+/I5KYMupn20nNFRBhJoLZeE0d+eip8pzlP6HCJkjQ==
X-Received: by 2002:a63:6bc6:0:b0:3c6:b38b:a84 with SMTP id
 g189-20020a636bc6000000b003c6b38b0a84mr4451971pgc.422.1652456172814; 
 Fri, 13 May 2022 08:36:12 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a170902d65500b0015e9f45c1f4sm2000463plh.186.2022.05.13.08.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:36:12 -0700 (PDT)
Message-ID: <2006033e-84db-b977-0550-87612ba579e3@linaro.org>
Date: Fri, 13 May 2022 08:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] hw/arm/virt: Drop #size-cells and #address-cells from
 gpio-keys dtb node
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220513131316.4081539-1-peter.maydell@linaro.org>
 <20220513131316.4081539-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513131316.4081539-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 5/13/22 06:13, Peter Maydell wrote:
> The virt board generates a gpio-keys node in the dtb, but it
> incorrectly gives this node #size-cells and #address-cells
> properties. If you dump the dtb with 'machine dumpdtb=file.dtb'
> and run it through dtc, dtc will warn about this:
> 
> Warning (avoid_unnecessary_addr_size):/gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> 
> Remove the bogus properties.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

