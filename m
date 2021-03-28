Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1C34BD8E
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:25:28 +0200 (CEST)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZAF-0004Rw-9J
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZ84-0003Se-MA
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:23:14 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZ80-00082K-V4
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:23:12 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so10089397otk.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1vayAisEQ08btdUvfGUVTKxfDJP2RAZROHcfdkykRCQ=;
 b=TT0Enn8mdbnkxA8MykKzQn+Yvil3GG3HO0zAWZ7VtpsTWhFfIFZhVjfIZdAk/bXWZe
 NkeABYocJgrfB0YzK6D0TtcKwch3PpFCyknpEoXhVs8BTNuDxvy57KVyrqKk1r3bhHdG
 zGWYkCsAi01g3VM80KDS+eWw3QgVS/IdZS507JSwMGorUAmjk+OFtRaPvjDvn2R7sOER
 Djx/Wmr0i2H0b/svpy/H0fiKk9k3VylzOrBLOxHEKmbXipLUmCUyZX0Qz2y4CV30cymS
 dn9ahliOSCwHNcoophrOXBeU99QqM+/rKNAS4bz1RY9bNKFuIPEdWr0vlU/kMxx95lni
 Ffog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1vayAisEQ08btdUvfGUVTKxfDJP2RAZROHcfdkykRCQ=;
 b=XM3nb7tOYQ9SqRfQmHsDu5Jm8HeBOja4yvkCgWQ645w81UfT/gsNetf6Jra6uRpkJE
 22HixigmGsio04KC5fSmeugFd7U+8QTNSrqRf6zUu0B6/oFx9DPhpdJO+kErE9fUOjaV
 zmH0SHvYyrKyc+DRb44NmzJfa6ovcJSpgI1yjJgQoF4IzU1F78vSnQL+MGHvGQuPyM/Y
 7hLGKyT1++jfsVQZx0MISOgdOfolr568ZbzVrRHD3NjJ5N/z2qaz5fNdK1SiBmnyICIV
 q4OSBnFGER81bIC8p6v1copGwDUIwqTF8W7OZmiDBZyWUjV5dZKK3YanWWQ705qxAznK
 k2TQ==
X-Gm-Message-State: AOAM531HBGasgFayi4DABG3BvvfW5OlMzEAsDHlWdrUA6K+pmbrq5YaA
 1/fsg3hz1X1tiwOFLuF52mDf6w==
X-Google-Smtp-Source: ABdhPJzBF5UPeKbFNRILpohIFuahLau0Ld1I/pzk87V4OTKTIg+l2l1LK/S9R+sV/7w5vIegeoRtkA==
X-Received: by 2002:a05:6830:10d6:: with SMTP id
 z22mr19852458oto.190.1616952184166; 
 Sun, 28 Mar 2021 10:23:04 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id a6sm3736945otb.41.2021.03.28.10.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:23:03 -0700 (PDT)
Subject: Re: [RFC v12 41/65] tests: restrict TCG-only arm-cpu-features tests
 to TCG builds
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-42-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd7785bc-5457-bdab-14a0-8a82f929be02@linaro.org>
Date: Sun, 28 Mar 2021 11:23:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-42-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> sve_tests_sve_max_vq_8,
> sve_tests_sve_off,
> test_query_cpu_model_expansion

The final two confused me before I realized there are separate tests for kvm. 
I think we should rename them to *_tcg, so that it's clearer next to the kvm 
brothers.

> +#ifndef CONFIG_TCG

Also, tcg_enabled() again.


r~

