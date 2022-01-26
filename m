Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1749D4A9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:42:00 +0100 (CET)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCq3D-0003lA-QM
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:41:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCq2G-0002zX-Rv
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:41:00 -0500
Received: from [2607:f8b0:4864:20::102d] (port=43887
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCq2B-0001ep-U1
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:40:59 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so884428pja.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5y6HldDMu6Y0NqM40qc8oFUxfOc6vqzzsY77NBKDHDE=;
 b=oppVAknpTQk3wmWQoIgYilLaU7W4eaasyUby0Vnc+vaLZUFIwxieIf3w5IPBGzz1ZG
 svsuZTUzc6YSh9eCF5sZbeTh6baK3D6B5be8/BJAkM48SVkHg7Zjp/BG6WELbPsTpN7u
 s6vUqdf16X17Ct0Ik/KC+WhosgdjZW5xhpTSLm2FVOiFHqNKNVU4cJLRqTjdjNOJInsW
 kkaYpKQdQKPXodCzXvnu+B0/RMowd8PcG09LetSVfjQP5axj82LWVLA7DBrTkYXrLe+U
 dT+albBFHD7FYYox5is5IH0BjamxdtJ9r5h1QVhvwvnC2yimrzy8egZjiRUVR6fY4v/6
 qI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5y6HldDMu6Y0NqM40qc8oFUxfOc6vqzzsY77NBKDHDE=;
 b=Ge3IGvoVoCkubapSXjsdhoGYhejPvcVzQPlSj0U2wqiXHnIvDABPHDKs4WqYVNi4hC
 pPUo0nizQRb9ENCAti34niXpXiJ60mspZUUnWfxRtOCl2LNu10CMBd089yr6QuiXBvNf
 mC1GGcL5Ws9Qp1l1AobzWOC+m41xJvd+uBaMAaDDN5YKgcFaFas3rYGpfM/DynyI5kWs
 Oqvki35WlC9K9CYyay08OLkr1QGjZgzeObrIiEPEUcgWDZVs17n7GtBYXB3cFeNocdb1
 TQvYn5oni06GwYb1Yvam82rtJ8YHXT9bIxMERVqKYNWYvHctNdXWM2OSoHnG78ZlMY4L
 Ju9g==
X-Gm-Message-State: AOAM533CsDRpf5T8MoHiJoZ5A/lD4zPsXrh7kchvfHgWywBa7ANSEymV
 UnX1yIG2DH94yStsbjuEXPuTvQ==
X-Google-Smtp-Source: ABdhPJyXsRGUt2oJrHN9tUJJ8DS/6WnQu4asxrPqvG1Wht+vy+8u3vJyz9XVOyflR6ePZJ0iyrIwFw==
X-Received: by 2002:a17:902:d485:: with SMTP id
 c5mr966624plg.148.1643233249702; 
 Wed, 26 Jan 2022 13:40:49 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id lr8sm3982366pjb.11.2022.01.26.13.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 13:40:49 -0800 (PST)
Subject: Re: [PATCH 1/2] softmmu/cpus: Check if the cpu work list is empty
 atomically
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
References: <20220114004358.299534-1-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c467b27-2471-2f54-b9ce-3282190378e9@linaro.org>
Date: Thu, 27 Jan 2022 08:40:44 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220114004358.299534-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 11:43 AM, Idan Horowitz wrote:
> Instead of taking the lock of the cpu work list in order to check if it's
> empty, we can just read the head pointer atomically. This decreases
> cpu_work_list_empty's share from 5% to 1.3% in a profile of icount-enabled
> aarch64-softmmu.
> 
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   softmmu/cpus.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Queued to tcg-next.


r~

