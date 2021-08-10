Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2526F3E7DC6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:48:11 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDUvB-0002TX-US
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUtz-0001UG-JT
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:46:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDUty-00005Z-1T
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:46:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id nt11so10788070pjb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rQ0/qh0GRwwxeETfOVOmaUMHOxG++IFBV29Sn/1S6jg=;
 b=luP4P76REB23Cyrfm4o2J4VBX89Jz8LZYganOk1wcxhkTGEg1AxYK2K8GiieFTfTul
 9OkkY2b4CrHu22saCamcAmf4tttW9Cx8g37IWaE6WXKiJNHbpTnu0qv+xlK/hiFFkL35
 8d0CBFQhGilDbmCFN+ijVi1VZ/o5uazHzOYL7R7yDr3+a4G9wm3d+awXLUjQA3SpPW+4
 QxD+Ed6FZffk2JFbfmFVsB1bbtiUdeoofynt+4RtH0EzAN50GmNkWtj1Id0Fe7jQi7CU
 +LHBrydqV7TlNxCzmx65sjKxb4/oAXEy+pOVzpzibsCW2E/yZdG5Ul3vAjaplbA3hMqH
 H4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rQ0/qh0GRwwxeETfOVOmaUMHOxG++IFBV29Sn/1S6jg=;
 b=NFspaFUt9LsqfRTQ6j1OpdH9rGEZknu1MNgXIxHMLAiwRjzNkAo1xApJZsnOAZkCSw
 dvhA4iuiV4AhciDvpoP4hg/aNGDHhYtS+Fv90n5nLq6G9dOJnICakkQNaJC2ertQDcbb
 A6AYqmKDfdPAgzd5qGZ0igEjt3zTcjTx9XEZTGm9mpa6JVRSzqAii9y4/d+hzb0mgv/n
 v2bp49h0rxBzhQiyIRJBmWgvqJSPQV1RW6fsv26/isdRGpxU7GzZkC3ZKkfVve+X4688
 KraTG10Ppapz7nsAF/64GLLFxt7NH5ymwtwpt3YPh3WzUlYrTOuqZrGZkY8NNIhKrZDZ
 Wf+Q==
X-Gm-Message-State: AOAM530BwSRoV2qUGkEvOjtQ8ygV5Nn1qLn3Z6W6gvgV3HjLqb7mmfNL
 91Kv6EhJH9m8qTIyluMIK5AkHg==
X-Google-Smtp-Source: ABdhPJyTuMcmiJRpUL8CXuiBuRTG6M+bwG9/xTxzV4ZYP4Vdaiz90Hlize0eutjon8G2k+uD/Afkdw==
X-Received: by 2002:a17:902:b084:b029:12b:6caa:7d9e with SMTP id
 p4-20020a170902b084b029012b6caa7d9emr461692plr.57.1628614012149; 
 Tue, 10 Aug 2021 09:46:52 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z18sm20284725pfn.88.2021.08.10.09.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 09:46:51 -0700 (PDT)
Subject: Re: [PATCH for 6.2 41/49] bsd-user: Add target_os_user.h to capture
 the user/kernel structures
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-42-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37a6c8de-70ba-5920-67d1-c67466c8869c@linaro.org>
Date: Tue, 10 Aug 2021 06:46:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-42-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Michal Meloun <mmel@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> This file evolved over the years to capture the user/kernel interfaces,
> including those that changed over time.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Michal Meloun<mmel@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_user.h | 429 ++++++++++++++++++++++++++++++
>   1 file changed, 429 insertions(+)
>   create mode 100644 bsd-user/freebsd/target_os_user.h

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

