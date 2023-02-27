Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9196A4AE9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWjF1-0008Hh-RQ; Mon, 27 Feb 2023 14:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjEw-000870-77
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:32:50 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWjEu-0003j0-Hn
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:32:49 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so11257315pjb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 11:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zdX2Qv+6NhUA5AuuuyN8kpw5vDSMVMAbrcuiOGPbQGg=;
 b=wkmYTOvmiGlQxFDC1XzD2Fdol93hyJQEz0IxX1WuQbrvbMmQbpOpOfWcbcmJEztSZB
 i/xLDVygRnxifDG7+arQq0tAizM4exzqvNnbskSeNnAh+7jNMzShB0yTy2jHlA1RKIu4
 +NkUzdo6F7oJlV5xyfgfQShWqq3fzOpJ6CqgX4Qt78pcnZIKaH3Y0McRqVHUuAzD86Lz
 ZpY9FGIvwkSp11jkNUWQRmLhASL4xjB5Ho4BoRXu1Xzj3TeYnVF1EkplpWQ4byrciQXo
 u8M+ls3/p6amxND+YApWL1qGqGh202heywT3NVTUtNfbGIqcU3qxpsZgoguTLSuJlbyX
 dR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zdX2Qv+6NhUA5AuuuyN8kpw5vDSMVMAbrcuiOGPbQGg=;
 b=2cYF5ic6U7bARAlPP5f5xoZ+3SF8YFqw+Fw6iwhFsxrh48T0CfagDCnqu3kQf8anXW
 XYw0xZC1n8nUCAdY1ZHzW3pefBju0unTcYYBKtOWRAkC/u8t/PVUVxuyEYuLwyYy+OmV
 gjbnta6LXd9lHOOPwwKw06tNkNRyLsa/vpL7K4q7HvP/QozoEhZ58jQEQ9a2oiirWQgQ
 OaUxG5kXkXkchtke5UYHqrNZ8Y0QER9uCxrVib8e5DEoR0T1STME9oEGJpsxn1AUo38d
 YWgSDbw5KChGf9B7qedGiCG68VHPHET78XQHG/4cxBu5l0/+41NWESstUujh6LL68/TY
 +Dtg==
X-Gm-Message-State: AO0yUKUyhzZs0S2Z1OcqZG66qojqdCZyXKp7ROJ0kJ4cioxIa5pdYMMg
 zqEKam0ohDNehE9xIYQOhJySyw==
X-Google-Smtp-Source: AK7set9aU/jfjq7Ib8Cco+E+GGrPIEY3m/tZYfuBpjpV0Kk4sq7pjAZhbFRI8E/hloPxwQ/OrA1OWg==
X-Received: by 2002:a17:902:e750:b0:19c:dc25:dbf5 with SMTP id
 p16-20020a170902e75000b0019cdc25dbf5mr13329140plf.67.1677526367097; 
 Mon, 27 Feb 2023 11:32:47 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 1-20020a170902c24100b0019a8468cbe7sm4522749plg.224.2023.02.27.11.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:32:46 -0800 (PST)
Message-ID: <63d28071-d933-b7c8-5879-a6a78f9ad985@linaro.org>
Date: Mon, 27 Feb 2023 09:32:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/4] target/i386: KVM: allow fast string operations if
 host supports them
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, xiaoyao.li@intel.com,
 chenyi.qiang@intel.com
References: <20230227101332.636203-1-pbonzini@redhat.com>
 <20230227101332.636203-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227101332.636203-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 2/27/23 00:13, Paolo Bonzini wrote:
> These are just a flag that documents the performance characteristic of
> an instruction; it needs no hypervisor support.  So include them even
> if KVM does not show them.  In particular, FZRM/FSRS/FSRC have only
> been added very recently, but they are available on Sapphire Rapids
> processors.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

