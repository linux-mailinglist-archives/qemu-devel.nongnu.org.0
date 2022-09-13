Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB55B6BD7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:45:10 +0200 (CEST)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3Ph-0003ym-K3
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3Jx-0006xD-0Z
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:39:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3Jv-0007g2-8L
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:39:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so9186211wmb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=GYnj/x23gB90I7XeoYXfMbDkonzBTJd5GzaQhiNmzas=;
 b=OSbrVSyrlvR1pNHsVw/AIFHUYoveR+RUhRjPwGbXSVDhAwF8nqPNvsnX3fMEyu9exR
 fkE8HV1g9ZOvjtAAoWj6NMD54LJIwIpCdgAcKwhL4vNN9DesG3b/dP/eDZcj920Hb3Ed
 kaZldGTEjNEURxs3dNxLXAHuo0HzDrKdVYc5k1/tqcdsCnHWXqv1j2i5i05dfyjdKkm/
 J5YGJVLqKCaVK4u0XYj7xrUXj2ILoOqkWU0ofsjWQei277oYZANBqtVV+b1dNy9isb85
 zNH7xzDWcuqiN7lzS+9PZf8tLzUyDxmM0UNUIyI/9lH6gESlWKEfA85DqnI/+H5Szsls
 LMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GYnj/x23gB90I7XeoYXfMbDkonzBTJd5GzaQhiNmzas=;
 b=EDkulGudYeI0VUPgNOAcjrfjy4gJN03ouXQPApo0Y//3lGlpiUTUMh1Gj9Knay56fw
 FBr0v8AKTWeiMcuX0dc7ZW8gcCQiFlme30xklVuLwsq9xnRmfAElkUw4jp7V1YB0jM/R
 ZMt8i5SWDpaJF9NUonlAQNav7PHfAJPmWIYJ6S7n6InZAOIpSep/Ja77x1+qDlzn1LLA
 RM1s3+hvk+6MA0hyrIIsmF1vhiNRCKQJTxpVlwE5pnmq2y3c/MiDNgfPgJL08vij7+us
 bMNLsGN+J7xxZ5lMKMHCIPjPOZnXntugQ1LNzF/YTPafNqKA6dM83GExpZOb9tUwztRO
 ypmA==
X-Gm-Message-State: ACgBeo04qx6H4Sau1rl350yk4VPTrO6RbNA6zmVXTzfDoCWASnX2WXh9
 j8wnGU7lWcNWBEUvdcsb1xuzQg==
X-Google-Smtp-Source: AA6agR5kdSdJKTAQ58BG3t0siuiLVGf8rYphX/dPRh5lUvIQITjFv9aZFQtBEvXEAdvhMQ0EFilFOg==
X-Received: by 2002:a05:600c:254e:b0:3b4:9398:49d0 with SMTP id
 e14-20020a05600c254e00b003b4939849d0mr1812907wma.126.1663065549700; 
 Tue, 13 Sep 2022 03:39:09 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 m3-20020adfe0c3000000b00228d6bc8450sm11941171wri.108.2022.09.13.03.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:39:09 -0700 (PDT)
Message-ID: <33a00aae-ca29-56bd-5352-43d235259dec@linaro.org>
Date: Tue, 13 Sep 2022 11:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 00/37] target/i386: new decoder + AVX implementation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 00:03, Paolo Bonzini wrote:
>    target/i386: remove old SSE decoder

Patch 37 never arrived, but I can imagine what it looked like.  :-)

The series is looking good.  All of the nits were minor.


r~

