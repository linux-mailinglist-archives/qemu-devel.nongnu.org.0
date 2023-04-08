Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA96DBC93
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:13:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDzo-0006Wj-AA; Sat, 08 Apr 2023 15:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDzm-0006QO-BI
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:13:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDzk-00049v-ST
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:13:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id c3so1804019pjg.1
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lNwYkSXYHFCQ+PRxz+kRpEpFRxNbjp/Yw+D01FWEiGA=;
 b=vqzudRLMQhg/yy6usfmCauZpzCZoY0uRp9+4qVSLKE4gnWM52gWZGguQPABiJqoGmq
 BiVtkck2MGRbGmRacauf0Uu1yjGxur+6R/SKwpHF5QVADx1/z3o/hhd07IM1uSzdgF+6
 cM/z7QOd48B6eLfhSrcNlVXl2IKqwY7hGRR46tni4Aon/NvxeleFceTJgx4MB65jShji
 C0Ia+fGm+F0t4KOE3+XD3hnNsAaEBCRR6m/oua31hVvCydl/wl0aMt2jyHMpQrwVIIyy
 DNxo32lH9WnR92o7+QTar8JDbksWdXHEjU2oOsn1sZdhqYkA5nLqi9KBcH3U51rPq9gR
 aNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNwYkSXYHFCQ+PRxz+kRpEpFRxNbjp/Yw+D01FWEiGA=;
 b=6vC1/jHs7ovbGOADoAnEnPj0I1M2v8Te7/I0IJ9PexTETqC6wzDjbdwsJ7Dxc/66tH
 9O6M8qTtXrKTZv9KiZ7u4TB5HZiPmE9fxHYJU9MR1K49fYyrRvPeSi7QGPx+tvkEJlBk
 B1DxmdSfWZAcxPh1ihOTyPFFAkUhtNFLc6JnHOWcfENGkpbvBhjcvknJmmq+CzqaJQJY
 8i2yY7rTcI2swygR2fjkfvp3zyzAejMQrffeDc1nBEbR9ct4RCe9Ul0L+n5oZ9nJvX7+
 UCr/4JfPZLf8EbmWNA4HE6uEkKMdGweNAZlhVkecZsafRB9Mvwjucc/WsVuRtjquozqd
 5JMw==
X-Gm-Message-State: AAQBX9e+QkOMl8qWl4x7wjhGnRbmmGPcMXNna8FBkVydVF4xr+YujEbx
 h53X+El/sudPe7v93+gGhkKwYg==
X-Google-Smtp-Source: AKy350Y6gkx+bokb+p3Zu6h3xrPkPST05RMh9KqRy2xFabsSN4cmkZULSgdcMXWDIoSluDS/00hz5Q==
X-Received: by 2002:a17:90a:68c2:b0:246:8b88:f4d3 with SMTP id
 q2-20020a17090a68c200b002468b88f4d3mr900139pjj.5.1680981183411; 
 Sat, 08 Apr 2023 12:13:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090aea0500b002340d317f3esm4535081pjy.52.2023.04.08.12.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:13:02 -0700 (PDT)
Message-ID: <3949d4b1-7416-790e-9d7f-e9ee859fe62b@linaro.org>
Date: Sat, 8 Apr 2023 12:13:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 13/16] bsd-user: Implement sysctl kern.proc, except
 kern.proc.full_path
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>,
 Stacey Son <sson@FreeBSD.org>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-14-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/5/23 14:36, Warner Losh wrote:
> From: Stacey Son<sson@FreeBSD.org>
> 
> Use the recently committed conversion routines to implement all the
> kern.proc flavors, except for the full path (the prereqs of which aren't
> yet in qemu-project's master branch).
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

