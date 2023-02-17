Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116569B1EC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:40:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT4gq-0006WZ-2B; Fri, 17 Feb 2023 12:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT4gn-0006Vl-Hj
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:38:29 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pT4gi-0004xz-6p
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:38:29 -0500
Received: by mail-pl1-x631.google.com with SMTP id b6so2101901plg.11
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JiAIoWCxGKN9q2nSlccbDSNena4L+eMkKJCOCr7z9q0=;
 b=Vx+9UkZfzWlb5+Ma794cMzAio6LZDlJZG6kQn71C+GrVzViaqMU7WzqvQycwTc9dcn
 wElRYq7Xp6treFUx+RGYpONu4BrbzaY4pb3zZ4HtUP3+YAJaPw1pgzp2vtcJhUZIefdB
 jmO0Adl0YJKbN5x3Ia9wD/oYdfDlsx+Gu4ztkqJ0ljtvM9/IvTNtgST1FRFfDM2KnQ9q
 34U7rATp9bV96dv669oIiibUSMWHM6zxfkHCQClr9S5Ikj2nVU5Rs5nYvYTul6YsbF77
 8kGdEszcLbFha+Q84DnSfBzYySxvPiA0EPGmujIlX7FRpj3F3PeeZej+wrpIGAu2gtn6
 nBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JiAIoWCxGKN9q2nSlccbDSNena4L+eMkKJCOCr7z9q0=;
 b=tOkbmlbiCi5jeiBRNZgIpn0NdYyyLEr6myqprS8ro8crhFiTo4to122gjCePKz0h3O
 jY9JluInK5JUVnmS+EIhRdewY7Db3y2hmgxQGo+LYAQOM0WVbhgUkZinhqJM3aMpwVxq
 zipJfZsPC3kTU4hU2glHzRBrPIBNkR2J5P+KmW7Hd4q4EY/XAe6bllbhIMoeMEMo/a4i
 BHvIQlD0U6rNYnyVMvFXZ0X5+fSdG9lsACMHprUiri5ZlOi8F+Um9SExqwhoQZ4G60mi
 jfnVEONiMoTkVnRlgn3qeRhH/5Pb1tS1G/IaEnXYxI4FFifyuDykfLWJvoVwThz783LJ
 D/oA==
X-Gm-Message-State: AO0yUKXc6tjHIs67gpT9PtkDxUZIxeAFxZ6ibp95NfHdRnEDai7BYmZu
 eXNA9Q0lxhB1J61VvzYngiGZqw==
X-Google-Smtp-Source: AK7set82GqfNjQ9IT1++v5JwGvcotcLCTq7JT2vF9ApRuyM6IjnY+8EjbGdE6Egv+1SQV4tBFD7P6w==
X-Received: by 2002:a17:902:d2c9:b0:196:56ae:ed1d with SMTP id
 n9-20020a170902d2c900b0019656aeed1dmr2080361plc.69.1676655502232; 
 Fri, 17 Feb 2023 09:38:22 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 jd7-20020a170903260700b0019956f23fc1sm3385845plb.302.2023.02.17.09.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 09:38:21 -0800 (PST)
Message-ID: <031c4132-2e0c-1fa0-9767-00e9f3392808@linaro.org>
Date: Fri, 17 Feb 2023 07:38:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 04/11] bsd-user: various helper routines for sysctl
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230216233353.13944-1-imp@bsdimp.com>
 <20230216233353.13944-5-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230216233353.13944-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/16/23 13:33, Warner Losh wrote:
> cap_memory - Caps the memory to just below MAXINT
> scale_to_guest_pages - Account for difference in host / guest page size
> h2g_long_sat - converts a int64_t to a int32_t, saturating at max / min values
> h2g_ulong_sat - converts a uint64_t to a uint32_t, saturating at max value
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-sys.c | 86 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 86 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

