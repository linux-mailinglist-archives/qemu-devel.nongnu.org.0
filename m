Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5774975BE
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 22:37:54 +0100 (CET)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkYb-0006Tb-14
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 16:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkXB-0005UX-0o
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:36:25 -0500
Received: from [2607:f8b0:4864:20::434] (port=42514
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkX9-0008SJ-ET
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:36:24 -0500
Received: by mail-pf1-x434.google.com with SMTP id i65so14015891pfc.9
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 13:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HH+n06FBOPnyzUZ2M4Olx8ev+8baGZi0w+g3oeY4rVg=;
 b=PN/j/1w6bExWRaxX5voaczbLP2lChKpGNKjPsFdjKnflg9xMn8+0879THyRcBHXYER
 Hw7DHEvWv9Hrmc1hYpcBFQcvkicxE4llDogggi65TH5e6pmV+VDCVw6/NDGuTIph3Gzy
 z+sMHirxHs3C+f4iTdcNcEeFVsIjyK0XlP7ijbcvbYWULO5NHtOZqqOoZ9YhY7hULg+0
 LBDxsHe4AnlLxbYILntrQqxytzi3hWwAIDmpvurPRb2L/CAibBo0d7uPpFCWAUgmhl5q
 QNCfnljB2xHF6k4iQywS8in2GuzO8O86PfKzyO8yTp58YUNKX1nrpVmSuNrfOLtMHQ0d
 kBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HH+n06FBOPnyzUZ2M4Olx8ev+8baGZi0w+g3oeY4rVg=;
 b=Np+Q7HVjGKYM21szfyYAob/+6zXzXJiIsePXvTNm6tYTp+jW1D/wzs8jtwrrJzEjn2
 YS3B0UX91TVSujn2ZLL+XAPcak2jXJID4CcPU+uug2b8Ecbt2tIrSYeeaFl368dkCUDu
 8Prjx+1SIRuoqe1embJ2eCZcWA0/Yi2bN34m3JwypvRx4ILIs2AFeKEmzx/6wfq37AcU
 48O6P1o06cgcHEG/GBjALtjLeRnFe6/9HJz9I8Pg5WDcUYUIgHKlnGse4tyXc9fwZG7s
 XuulwuixA4WIkvKxzRJm2l7ctGW7p/hWkBqaMAUnNGK1XoYbntWKmHynHlY+Rs26Mfzc
 RcZA==
X-Gm-Message-State: AOAM531CEy1ZpA9EKGrrhlbFK9m91SBduzMQDzBFD4mh37Dfe3n5bVjt
 o9CXc40V7gjYuvtf/YX/QzjfrA==
X-Google-Smtp-Source: ABdhPJwtJ8fYcSx4H6AWzauXikZpxZ7lvkMRh1lyFstVYB+Iq+Q+O+ZPZU1rgBIGoDEJ313RY39zlA==
X-Received: by 2002:a62:6342:0:b0:4bc:c4f1:2abf with SMTP id
 x63-20020a626342000000b004bcc4f12abfmr11791425pfb.77.1642973781949; 
 Sun, 23 Jan 2022 13:36:21 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id e4sm9920511pge.74.2022.01.23.13.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 13:36:21 -0800 (PST)
Subject: Re: [PATCH 02/30] bsd-user/signal.c: implement force_sig_fault
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7ae61e5-dd10-53d4-df9e-12e9aea20b8a@linaro.org>
Date: Mon, 24 Jan 2022 08:36:16 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:18 AM, Warner Losh wrote:
> Start to implement the force_sig_fault code. This currently just calls
> queue_signal(). The bsd-user fork version of that will handle this the
> synchronous nature of this call. Add signal-common.h to hold signal
> helper functions like force_sig_fault.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal-common.h | 14 ++++++++++++++
>   bsd-user/signal.c        | 18 ++++++++++++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 bsd-user/signal-common.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

