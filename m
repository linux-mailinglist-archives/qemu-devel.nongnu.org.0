Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA6B515F52
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 18:42:29 +0200 (CEST)
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkqAu-0008Fx-7f
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 12:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkq9b-0007St-Ig
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 12:41:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkq9a-0006iV-0g
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 12:41:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso12995782pjb.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=bFiea51DdvlwtGLMQYXRO/jmZSqt9m/JMUR7qivV8eY=;
 b=ywyIwpipGsVNG1P+q2wFa2yoycEBB0XpYYrvA5ybRD12vDo7jsOdy0jX6op7BUUX92
 CTAlMmoAqXZGOx365J9K38rxuWHHusuE6NgzGLuZnc6xqLSgEDAK1ePVY5gY0VMfTeiJ
 zitp312HX/S56LhsU+ua9zQrrJOp6eRHU7f9462p42qm1quWryoyiQ0+xvMRquQCOc5M
 H7VMYXrrPBZV4+U3taD6HCCxHxbcABJx0Ij4mQ+qFw+T0Islm8aNVNcsfjBCe/a1plNE
 nW1WnjiRPZk/XNp9GonR/IqvFvVxr6q8FMpeuklizOXg46F2DgTiQn24OGa+bnUqiMFA
 JnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bFiea51DdvlwtGLMQYXRO/jmZSqt9m/JMUR7qivV8eY=;
 b=CDzSYpm3dytLpcZwVm4+htZmAHO/iLZQaSI3TXv5VfktfbX7jUAI4ZSh/OFTABbXqp
 Ov4ZI0nD4kEgcRcbipIL8EROVLVCDCOQAY95JS+4gWbSiT7qMJ/NUPawXPA1zVoJnpfc
 Aj9oCBUZkUhmIdIQ0GOFb5ZiycubER5mkmphFnqbGXyF1/OBjqFI+La4ffZCrbg1H8n3
 b7XGStEW9RPhvadi+2hgPmg4dPpO4EZzYjTrXlCkpuaN9bcyF2xPlVVFpnmIwHkZxE8W
 lFd1duhcpYgmFX4z7+zB2CzJFZKIp0PKvify5YCn2Kx/94ozNS05L32ccQtr6qtju6jE
 q6EA==
X-Gm-Message-State: AOAM531St0+w2sk1/LQKOqe3O5v3pNAc75KR/+VXpPHlKuUoQXeg4o3/
 hSZW3a8adIP5Lk4LPjAVwZmbDQ==
X-Google-Smtp-Source: ABdhPJzbAqlJpGdqD7ogOnqWV4Q9LhFI7mZKHcO6xRO5L6WGjW7U8M0QtDLlEBDwFS8vjTXO0tjuFA==
X-Received: by 2002:a17:902:e890:b0:15e:7f0c:8b83 with SMTP id
 w16-20020a170902e89000b0015e7f0c8b83mr4563010plg.17.1651336864394; 
 Sat, 30 Apr 2022 09:41:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 j20-20020aa783d4000000b0050dc76281afsm1735096pfn.137.2022.04.30.09.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 09:41:04 -0700 (PDT)
Message-ID: <dcc61df1-205b-860d-3928-a2b77ce67983@linaro.org>
Date: Sat, 30 Apr 2022 09:41:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v3 00/25] Misc patches for 2022-04-29
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220430140517.460997-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220430140517.460997-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TRACKER_ID=0.1, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/22 07:05, Paolo Bonzini wrote:
> The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:
> 
>    Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging (2022-04-29 08:46:55 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 189fad0006dd4f2f336e05a99d981cc1ecab1b33:

This is the same hash as v2.  I presume the new hash,

62927ca5e1042eb422ff545bec3028213a94ed17

is correct for v3?  Putting it through its paces, anyway.


r~

