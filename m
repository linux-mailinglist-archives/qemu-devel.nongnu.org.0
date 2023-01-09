Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F4661C2E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:59:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhRg-0008CU-Dp; Sun, 08 Jan 2023 20:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhRd-0008CK-Gp
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:59:26 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhRb-0008Er-Aw
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:59:25 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v23so7287309pju.3
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lVAiNBVZAn9/8dc7Wygd/6js0yB815Une/4/QJY5rI8=;
 b=osIMxAF6FYjofZfCTP0m+dVFac49of1dPC00ZisAv+D4j31u8L2KobvVZEt4urBXuY
 DvQbSGqw2b0RwVKnBjIOaiGh3AplbufNsGP9bPF1v4qdYuMtRVF40O0OvyHsEh6PM4As
 Gf6Q048Ikj0VZTbw7UXNOInyWbusytVI6ljnRhzFwMCw6LeMPqSzGcHZlQqPQmaMU2M2
 4V3+AC6TOgDUMRodQDj2hqxOGAQAUd+BrKSPQfpO+lIyzHijwINDCO0rpC1S1iIbq4OC
 Kus7TqHcg3TkdwiKe0DdE7CIuHlBfzs6haHLxMUSYkw1vdVzMb7Bn+EbVn9vpsMS3VD8
 B34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lVAiNBVZAn9/8dc7Wygd/6js0yB815Une/4/QJY5rI8=;
 b=UzUEvP3kjKlEaGIDXmlJ/fULDJnJ73YKedaG6dFdsLq591b9Js6Tsbaurg2Puox6DN
 gjDD1lc1q6XaVL5a570+7Xk6jaSc2RyObCL8KJ49c2830+sQ8FCOs2KZeR84K3ldmg39
 QhCy8sfa9vV3avrI5lnpJc0U2u8SSiTerA8UkkdM7Qfh446svCfGY9TOZ+Z79pA6CDSd
 ZQVfa2ijQf592VB/G30ZxKfejqCSjSTy8hmyl3OM46HmGujkJBcb9z3X1OBrePyj7gs6
 oe9/1NeHvvxznSZ5UF4CuQFHSgfWYi3pvZ4xjNlFcjugskHe+7yshl8dMKHQCgTiXunS
 ZJhQ==
X-Gm-Message-State: AFqh2kpdvABjGO9G2jSPgHnOsl3+T9L0kojv8it5g4PFV5kNkgufAfsl
 lit4xhztEmZKVtO9Z9Nm9BHpqg==
X-Google-Smtp-Source: AMrXdXs/ancvXqlRWsNU24NFpA7bsYGi68mcZXNSkzExElSIqqV4zz9mqv+y0C7sKrL4rL/ptqt9mQ==
X-Received: by 2002:a17:903:260f:b0:192:4b1b:6cdb with SMTP id
 jd15-20020a170903260f00b001924b1b6cdbmr64137896plb.7.1673229561723; 
 Sun, 08 Jan 2023 17:59:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a170902da9000b001769206a766sm4658915plx.307.2023.01.08.17.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 17:59:21 -0800 (PST)
Message-ID: <6f26d23b-007e-2eb0-395c-0f46fa0fc316@linaro.org>
Date: Sun, 8 Jan 2023 17:59:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Anton Johansson <anjo@rev.ng>, philmd@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20230102104113.3438895-1-ale@rev.ng>
 <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
 <20230103162603.74f631aa@orange>
 <CAJSP0QUd9Q25pT3OXst4V-1FKLo65jJnn-6-7d_O5hkPeJfPyw@mail.gmail.com>
 <20230103171149.3bcf0526@orange>
 <CAFEAcA8XY0Ks1mxMasZ9U4m-CNPsuLFU+9ercmb10kscP3iYSw@mail.gmail.com>
 <CAJSP0QUWxTbpyfuQhKQ33BKHKOWTTMrCo5QASSqjag9wz9a=gA@mail.gmail.com>
 <8cf1e1ee-1e2a-d53f-3f8c-e870fe51f75d@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8cf1e1ee-1e2a-d53f-3f8c-e870fe51f75d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 1/7/23 10:02, Paolo Bonzini wrote:
> On 1/3/23 20:31, Stefan Hajnoczi wrote:
>>> The other problem with this file is that it appears to
>>> be generated differently depending on the host distro
>>> (specifically the default value for the --libdir option).
>>> That also would seem to nudge towards "don't commit a
>>> generated file".
> 
> I wasn't aware of the libdir default that Peter mentioned, but the same issue would happen 
> for release tarballs so "do not commit it" would have to be extended to "do not ship it", 
> that is do everything in Python.
> 
> This in turn goes back to the reason for the buildoptions.sh approach: the path to the 
> Python binary is not known when "configure --help" prints the help message.  If the user 
> does not have a python3 or meson binary in the path, requiring "configure --meson=... 
> --help" or "configure --python=... --help" is not hideous I guess, but not pretty either.

I think an extremely early error message for missing python (and pointer to --python) is 
perfectly reasonable.  I imagine it would be very rare, a case of forgetting to install 
all of the build dependencies into a fresh container.


r~

