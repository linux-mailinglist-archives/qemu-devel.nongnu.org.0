Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025CE3B4CDB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 07:38:15 +0200 (CEST)
Received: from localhost ([::1]:49862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx11C-0002LY-R8
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 01:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx109-0001hJ-JF
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:37:09 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx107-00026T-LV
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 01:37:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id bb20so6635376pjb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iSE1ed2OESlQb3uo/rTQvXM9eQQ8B9hepKy+qd4nfYo=;
 b=hC6s9Mm7mBP3a+Rcck8Omi2ARx02VSzW0nxH+5UO04CTVdYNzH/Vg8rQzf/8FsbvFn
 CO7CyW046hxZx4d2HfZXUjQXSyozthvl550R84DcavHYJ/Avn3wJsxnSzyVnUKSfvu88
 mOhPmE01WuyDcdvqPNkZmIuFSiGd2TKbbTUpZq8RJAAqFBBBvIXCOaeuO9p6TjTHA2ED
 ng/7TVJUbCmEmr+8kXaenHogeItgBZslHb2yaekn5yz0cPmSbxUa6s/JJBxx+h1kDku4
 WmdUBPMTsUvPkCCSUeVlQQhCHyEekuHvSbKNDrBYowv9j1vKLYVmZg3CNvJzZ6RdJiVs
 +Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iSE1ed2OESlQb3uo/rTQvXM9eQQ8B9hepKy+qd4nfYo=;
 b=e1yS2CdlKbIcwiiOLHu9XZQ66L/YFczu/weInjV3MtlU/yv3GZF4nVYZHhmabnSfV3
 V4/IBNfE8kLtZUZbdB/ohV4edyJqwIDSpY9jJyPxv5GjGAKVLusJ79kkttbT+DBBorHI
 Eh6HNy4ncO1z4wLnB/3dFnWgrxivRDR7WL2GyjfldAXeCa/4hvElRGgMLSI4E6HQqvyB
 QfHB1ayGE0T1u3hycckCP4QZCjJ4cUp2wHsoTmp0yxfXBtcsB0RpMo2YnpOS6tMPV+mF
 dGEL5FdEIYAk0a0hyPXuDBu+b7yy+I2no6RP4hT1M1SUjfUEb7vpU5Vg7b2J7NvqZfQO
 MMhQ==
X-Gm-Message-State: AOAM531rclvbh7f1GvRTPm43pWBqSh6QzSefmu7OTtEU3ZVVGQ3F0iIV
 HIdKseQ4q+rvz+cUs/ZPdw5NrA==
X-Google-Smtp-Source: ABdhPJyrDCHUgQVCYkNg0KoPgFwSkaFvOf7lq3g/YVpF/vx+RCOzN5YCuDWLXMAWgplzx3ydndYS/A==
X-Received: by 2002:a17:902:e845:b029:128:b23b:426f with SMTP id
 t5-20020a170902e845b0290128b23b426fmr2059570plg.61.1624685825455; 
 Fri, 25 Jun 2021 22:37:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u7sm7138872pjd.55.2021.06.25.22.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 22:37:05 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] tcg: Use correct trap number for page faults on
 *BSD systems
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210625045707.84534-1-imp@bsdimp.com>
 <20210625045707.84534-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19adeef6-83be-78cb-402d-3b79e740bd26@linaro.org>
Date: Fri, 25 Jun 2021 22:37:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625045707.84534-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: pbonzini@redhat.com, riku.voipio@iki.fi, Juergen Lock <nox@FreeBSD.org>,
 Mark Johnston <markj@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 9:57 PM, Warner Losh wrote:
> The trap number for a page fault on BSD systems is T_PAGEFLT not 0xe. 0xe is
> used by Linux and represents the intel hardware trap vector. The BSD kernels,
> however, translate this to T_PAGEFLT in their Xpage, Xtrap0e, Xtrap14, etc fault
> handlers. This is true for i386 and x86_64, though the name of the trap hanlder
> can very on the flavor of BSD. As far as I can tell, Linux doesn't provide a
> define for this value. Invent a new one (PAGE_FAULT_TRAP) and use it instead to
> avoid uglier ifdefs.
> 
> Signed-off-by: Mark Johnston<markj@FreeBSD.org>
> Signed-off-by: Juergen Lock<nox@FreeBSD.org>
> [ Rework to avoid ifdefs and expand it to i386 ]
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   accel/tcg/user-exec.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)

Thanks, queued to tcg-next.


r~

