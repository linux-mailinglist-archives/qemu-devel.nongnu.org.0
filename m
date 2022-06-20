Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50F55220B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:15:06 +0200 (CEST)
Received: from localhost ([::1]:48860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3K3N-0003s2-Lf
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Juk-0000M1-83
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:06:13 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3Jug-0001Nm-Kv
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:06:07 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso12349838pjb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sfk6QxtXCfue4wKaqWdmhQAkwVYI3LaX+XngGR2LzaQ=;
 b=cMq5zOyNH7NZ/v7ogXGAhnJTLRTK5H9R/ICLJzZD2mXIK4yMRkBLSjvl/G9TKGtZt/
 XjRLL1ohGStuydV4a0vqMWY9ESfP5wZKmey/6ThcXMXa9cPrzN8CFryj3yPyIeDsU7+i
 iVImFAF8EDBs1lTbsLc9urumgDkYYkkb0pOeY6ohlSlSY9KIz1ph9rUeGF5OcfjgtLix
 kfZCM+4Hw40WgoCXxIUpZZ2yFHQ1Y3dDlGhLkef0LDJ0HwIOXrd7XXq+RR+qUH74Vy12
 e6Wgvj1T6mDy2+H4+8bSXovSe9pgTGs1AKULl6yF1RENFEcBYQTo+MbD5z0VXyPqooiP
 1CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sfk6QxtXCfue4wKaqWdmhQAkwVYI3LaX+XngGR2LzaQ=;
 b=jEKRkmLw0fLQbqPCR+Eaz8wIkm68c64ub8btwU7GB2ASP9yjcxpmk4e3L0E5awPQHD
 hllBBzi5xC/trfgu/NNGW00QLMFo6RvfAMF6caYw1Lk+Hv0GDBa5yNrnnDoBtVkr7zqc
 HGISns6udPvdISEYi96t1gY1UcHa3ropvZqFi5y+XgVd0fjujuP5E8V3cBYSfT7u46tt
 EJPJhwZKtrdqiv6Q/+efLHwS15gwlqEpzT1MddgChI/ytPzTrBaJypmUfSkcHIc1xKPe
 CBj7o8cGOabufcQdmZ4w1NewQmj7PA+KmIOdEiRQKT2dr/mbWP6nD6Q7/D5MKW5YjXjg
 mXgQ==
X-Gm-Message-State: AJIora8hmmXwucLJqVcQw5ndHne/vOODRzzxLjHfRUQMIDtK3o5k7O3t
 tepTti+0ArCFXEg+h16O6iRGzA==
X-Google-Smtp-Source: AGRyM1s+k7Kvpb08eBgC3rt9yxiV2hdEfJPwLpkQD2x2TiVn+s2XNJMBE/IZAjCXHmADFuGx79r25g==
X-Received: by 2002:a17:90b:350b:b0:1e8:46b9:5bc5 with SMTP id
 ls11-20020a17090b350b00b001e846b95bc5mr27729426pjb.100.1655741164464; 
 Mon, 20 Jun 2022 09:06:04 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 ij11-20020a170902ab4b00b0016a0bf0ce32sm5781703plb.70.2022.06.20.09.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 09:06:03 -0700 (PDT)
Message-ID: <12113b4b-5a3b-831d-22a2-e4d5c5eb0566@linaro.org>
Date: Mon, 20 Jun 2022 09:06:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 3/4] target/mips: implement Octeon-specific arithmetic
 instructions
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
 <165572673245.167724.17377788816335619000.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165572673245.167724.17377788816335619000.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 6/20/22 05:05, Pavel Dovgalyuk wrote:
> This patch implements several Octeon-specific instructions:
> - BADDU
> - DMUL
> - EXTS/EXTS32
> - CINS/CINS32
> - POP/DPOP
> - SEQ/SEQI
> - SNE/SNEI
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

