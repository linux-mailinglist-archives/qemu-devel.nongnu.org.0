Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B9484B39
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:36:16 +0100 (CET)
Received: from localhost ([::1]:51726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4tLj-0001SH-Al
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4tJd-0008VW-7i
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:34:05 -0500
Received: from [2607:f8b0:4864:20::430] (port=44627
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4tJb-0007k9-MI
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:34:04 -0500
Received: by mail-pf1-x430.google.com with SMTP id t187so20017036pfb.11
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u9rhy/1awaCTqNnG60NtA3t74HXGmUBaoEStDzLuJdE=;
 b=hd9R6hOqe+Tk7EvBzhu7Yp62MhSuRTTCocgJWT2uMgCbiZZToSoaqXo+WT3MnHBCWf
 NH7zg3egcrgbzZ2kGCWsIPynvCIZpY+wl5NhbXwedzZHn/7dOrGYhC49WE4wtIMJcokO
 7+m2NHCAZIwgwkLs4BXA5X/U3nRCbmOv4wc2fAnrg69uKYxM3B5MDkO3sdRNrwuvtWbJ
 GnN8xsw44x0XU0Wg4KJnft5+Jy9VmGwycqAnW+qlHkzyduq8eVMP9aM4Ojg3YZoINxlm
 DFDKIJQk+wpJXfkZyM5qli1uKhoDiYXk2bBpC2Uf6iHPF1zSie1VClPieIUuh6vPjH9P
 Ws+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u9rhy/1awaCTqNnG60NtA3t74HXGmUBaoEStDzLuJdE=;
 b=HaYcWOAvBRCD3Lr45KiBJc6ybqDbOu8yMZfL6iS3eePnkg2qqurQj4FsdzV+Cixn2q
 4MNV0iDt5kjhrE3Pke3QC8FlsLtNwbQfke2KEKyYeTagAYFqSubHHfn1VGEaBR39J34k
 AMObp5HjWaZ0g7adMDThVmUON8aVLnOJlpdRNXvUXhRUSgWSRz9EpOXSPdpBngBXWyu6
 kAJeIQFkCOPgKycDAfoLlELwcDFPk4cGxXjJh4NLJbovmC+5jYMOo+5zhXjcIqkawzeY
 pA0gQUiFFo2cWNiiBUj90Y4JvH8nMIBPx3uo0KE1gE3+jESKXwGf87hCBsYvPmsSIGaD
 o6+A==
X-Gm-Message-State: AOAM530w5SNJazrJAa/xc/89S1vjtAk0gARYHKC/KDz1udYUk+lWWSc8
 J3STAerGGIs3mHUbzL3jYG9mf0aAZT+bhA==
X-Google-Smtp-Source: ABdhPJy0HjCKNd+MToxcTSiVjwGrQS+GiG6SaWT8UaYSiGc0htiT9dxtVUhDOg5yBNGttgIug3LN4g==
X-Received: by 2002:a63:7408:: with SMTP id p8mr41897746pgc.73.1641339242439; 
 Tue, 04 Jan 2022 15:34:02 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id u35sm9491337pfg.157.2022.01.04.15.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:34:02 -0800 (PST)
Subject: Re: [PATCH] sysemu: Cleanup qemu_run_machine_init_done_notifiers()
To: Xiaoyao Li <xiaoyao.li@intel.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220104024136.1433545-1-xiaoyao.li@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <672a788d-ab9d-dd04-5de6-842ecc1d9e88@linaro.org>
Date: Tue, 4 Jan 2022 15:34:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104024136.1433545-1-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 6:41 PM, Xiaoyao Li wrote:
> Remove qemu_run_machine_init_done_notifiers() since no implementation
> and user.
> 
> Signed-off-by: Xiaoyao Li<xiaoyao.li@intel.com>
> ---
>   include/sysemu/sysemu.h | 1 -
>   1 file changed, 1 deletion(-)

Queued to tcg-next.  Thanks.

r~

