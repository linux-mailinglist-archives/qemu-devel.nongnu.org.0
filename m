Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D686B80C6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 19:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbmxq-0001qJ-9b; Mon, 13 Mar 2023 14:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pbmxm-0001pi-Nl
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:32:02 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pbmxl-0007HZ-4d
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:32:02 -0400
Received: by mail-lf1-x130.google.com with SMTP id r27so16888345lfe.10
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 11:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678732318;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vZ2lCdhoxWj/iJLpwwtuJdyIKt6gN/U0KcC6uwF5h0A=;
 b=fOP0gUucLG1SOPQYpyFkm3t6x8T5XKZDPtsOIv3XlKdh6HJK0GRpDqmJ+ACiVsFCUX
 Sm0E2xPLVi2QjxIdDtxgNEKanMZ5nPlFrB1up/hnkDlFAfqmmvNF51S7iZ1egJvCNa4Z
 2e4lHyc/8oIxNnw18j20iS2f8N4dGCeL52A6Y5zEjwp2XLzl6VroVI+jNtjmSSMhafpZ
 x0xtPFZDCvQMN/m0EZUydmUc3L3cGJdJoO85uwjXnVMxYQYS1zkk9Kq+oSLgh9QJ2VqJ
 DTYUec3sia0uGuo3aJmgLqXAJaqpRDG1AJNRqzqPKyJGOEZXT6EUt30JeIaBw71WXvlc
 G4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678732318;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vZ2lCdhoxWj/iJLpwwtuJdyIKt6gN/U0KcC6uwF5h0A=;
 b=O7hKSN6bQSjZTZRfpIdmN3IzzAeZvUqu0Hl7oZDCaE0vqCExV5PWm/q8BHh9uFS5zC
 CqdW8VWTQ4a8bvooipUip9B84zNc6QlXx4GY3UQtwI3frx/8JU1x5mccP43vyeyH19gF
 1sqNDEqRbI1UJSkzdwz3UkfYbCjfrz97qd9sX+p8FkbWSL5hxlZ58g5ctq9VwKMJyKSy
 klwrS4PXvv9LILSCAMVFEIhfJDksG2pczQaLHL6+Cse+wAekgVG9Nqw5+VwMNPgUO4vl
 j2vO0475sjvVRthiMMXUVV5RyUNrnpniomt0P6V72ec4vPV45TXxTJvaMXkLRN2QB5yD
 rtKg==
X-Gm-Message-State: AO0yUKWfLIDISs+9ftuZIactDp6BnrOIQkJXQYllub8ANNUf9xeHXvTN
 dRlI6bsXBNHVGjDb/TDA6CinXw==
X-Google-Smtp-Source: AK7set/zMfOCiEtOl7NP0aN1cd18g6EgGqlxvhU/fQcGbLb8WZe5FRMpnpFdYcJZ5BR+K2zXyVDVBQ==
X-Received: by 2002:ac2:51ad:0:b0:4ac:b7bf:697a with SMTP id
 f13-20020ac251ad000000b004acb7bf697amr3698950lfk.4.1678732318544; 
 Mon, 13 Mar 2023 11:31:58 -0700 (PDT)
Received: from [192.168.200.206] (83.11.21.111.ipv4.supernova.orange.pl.
 [83.11.21.111]) by smtp.gmail.com with ESMTPSA id
 e19-20020ac25473000000b004e83f386878sm51266lfn.153.2023.03.13.11.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 11:31:58 -0700 (PDT)
Message-ID: <a828d259-3682-958f-1bd5-cfb571554df5@linaro.org>
Date: Mon, 13 Mar 2023 19:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] target/arm: Add Neoverse-N1 registers
Content-Language: pl-PL, en-GB, en-HK
To: Chen Baozi <chenbaozi@phytium.com.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

W dniu 13.03.2023 o 04:39, Chen Baozi pisze:
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
> 
> Signed-off-by: Chen Baozi<chenbaozi@phytium.com.cn>

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

~ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 125.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics 
fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x4
CPU part        : 0xd0c
CPU revision    : 1

