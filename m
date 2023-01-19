Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BB6743BE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:55:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbw1-0005RW-6C; Thu, 19 Jan 2023 15:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbvz-0005RF-GK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:54:55 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIbvx-0002Ny-6J
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:54:54 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 78so2550364pgb.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qAqJhN+YH1QPEp4J/nHqY87NZosZljUHvVOVEhqLIuY=;
 b=HtsECPebBiTizn5GD0k9daMaaGsv0DSWeyw6A/5oIDJDn63nhUtq0t04i03lMrzHUb
 haGHmKF+v1JVAK1D2mwB3Oj/ib8tEQDfaLBi4wkHhOUhpE/nDvN1RwAQyrP4hVdvJOLp
 QwCfIIiyGdw87gJtfODGZG9HrFH+Cgji4uJ8ha6BkbjTKdAsozhif8PYr07jmVgeV/ou
 aDH3VG7s2k75QdyhwoZPQhUg07b/xdBhUPvPxaSip45J8TnsoSlLFZwcHHGmla7m9JuH
 lFzwPxCKV6qJa7NQH6/m1MxXO5CYK99Q0/MFNZDM73xMPfFAWU1CvMTYD1DDhpbzF31p
 tF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qAqJhN+YH1QPEp4J/nHqY87NZosZljUHvVOVEhqLIuY=;
 b=JaeSsnlKFTj960TjtxsmYR3WtyI6bF8zTrE6e8akA6EgCdnixXY56t7OkUyFM/LJRv
 4lF2BDHiC/wm23sosSOR22TQfb1v1SlsSNAxMCVH5ZfbFdseWeSlBA2nCSvHlQcBM4Tv
 Ame1VYNY8UVhHcA9jw05snoUofjt64CQdTi+w6cJ8GxaMsp8EKOLbld2r6eSDsG2WewK
 SGNq1SDkZ5YVfnAvy6x5w/WeaLJDfTlQWyGzfU/KNgKxqypU4NVdzu2RCDjjftXUkc8V
 42Jc6GF9Ksr5o6lC8GXqadVaP2fqvSu9eRRdn1k07zBjuwlf3CmueJGxQ+IhiNt58dYe
 h93w==
X-Gm-Message-State: AFqh2kpPqtkEQKlAfNbZ/A39ONDHL0Y0HnzapkAVudbouk0IgpitNcAZ
 a/aOuB63spEAXADJ8dojBzkEqg==
X-Google-Smtp-Source: AMrXdXtpm/FxpLdaY6WXFqZbUqr8cgVhG67S+quj49Yot0Dkm2ofQFByHcOYS1t6ps5waw/cXU1hNQ==
X-Received: by 2002:a05:6a00:1d83:b0:589:5504:1508 with SMTP id
 z3-20020a056a001d8300b0058955041508mr11991547pfw.19.1674161691580; 
 Thu, 19 Jan 2023 12:54:51 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y1-20020aa79e01000000b005809a3c1b6asm8119895pfq.201.2023.01.19.12.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 12:54:51 -0800 (PST)
Message-ID: <3febf6ab-4217-0d9f-5cf4-ebba1f930d08@linaro.org>
Date: Thu, 19 Jan 2023 10:54:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 01/11] tests/qtest/boot-serial-test: Constify tests[]
 array
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

