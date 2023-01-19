Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7CA674145
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZzi-0006iX-1X; Thu, 19 Jan 2023 13:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZzg-0006i0-1b
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:50:36 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZze-0004l4-7m
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:50:35 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so6722359pjg.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jGeO7ShSUWU9mLVjGUsUvc6XjVNAG03JJ8rZkWUxAZM=;
 b=lfxMxYb7aBcAI/CKnsd4he1HbHQldi4X+Wcd+qmjUQoSQ9PUdak/7+ohpYRacNepnr
 VjiZYz4tTSc/MPP39Dez91JlJ03s1XXz3MXeYTd4/EM1w+C362dCPIlKvSDA1btkg3N+
 rpKfrTa0v0Rlik6WTe3+1GGnsKiomvU1rt2li+3S45KntX01h8Lj1mlj+j52IMTLp3oX
 ilCjnUSL1+tX2vXnxIapPe5N2fozbbXTOPXJNh3wE4kYaXi6TwpwwH0ETNPUDE5ujt3M
 64Tms3cB6Tz07cCMTwyh9iqkSJsZT+ox5i3ZPIsoBkrK4ZDZtm/GoZWwWQBXZ47V8MpK
 JQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jGeO7ShSUWU9mLVjGUsUvc6XjVNAG03JJ8rZkWUxAZM=;
 b=fYDe/B5WwJeh/N0QoffcAhn0SPll9l6Z7N1u7R8yrvlEQ/ft5NDVDsnaVF7NKjAVR4
 8XoSQ41Wy0F7hurxLtlEU7AOUlMt5L8t9G3HHVvI+SlbSbNEOToYy8u6B+nwfruFqYvS
 As3JjmkYgaIzu2oMOw5ZdLOZV7OC7n5hESX9/V8z7462upy0RNSYcizWZk6Tw56n5mo5
 f2NT6wvRASCk9xGoz47iLDpid2ltL7cJ+RVs1bmAYjYl2AwteEUaCfQXmgWohHV8wV9t
 Z0kezw0nf521FsLI1ha3O12B1ZycygRGVDG1bKrkc9GJYLAGdk2oqS0Rxlw9bsbxTUQ7
 eQkA==
X-Gm-Message-State: AFqh2kqJzIwsdpj3ojWsr4v+Y2CkS5W3Pq+h66w/qlHt48GuW+Bj7q9S
 g6nk/plpDLeFebdNlMl5geRJtA==
X-Google-Smtp-Source: AMrXdXuaNQhiPeYd9Tk3evNFSar5odLm+eU5fiNKWs7yMch2AYoNOdW4p70b68U/NpIZY1eLX/0ERw==
X-Received: by 2002:a05:6a20:438a:b0:b8:6583:b654 with SMTP id
 i10-20020a056a20438a00b000b86583b654mr14219591pzl.28.1674154232651; 
 Thu, 19 Jan 2023 10:50:32 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z18-20020a63c052000000b0049f2c7e59f5sm20943880pgi.27.2023.01.19.10.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:50:32 -0800 (PST)
Message-ID: <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
Date: Thu, 19 Jan 2023 08:50:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 14/15] arm/Kconfig: Always select SEMIHOSTING when
 TCG is present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-15-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-15-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 1/19/23 03:54, Fabiano Rosas wrote:
> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
> default.mak anymore. So reflect the change in a Kconfig.
> 
> Instead of using semihosting/Kconfig, use a target-specific file, so
> that the change doesn't affect other architectures which might
> implement semihosting in a way compatible with KVM.
> 
> The selection from ARM_v7M needs to be removed to avoid a cycle during
> parsing.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> The linux-user build does not use Kconfig. Is it worth it to add
> support to it? There's just the semihosting config so far.

Probably not.


r~


