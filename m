Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABDB69F8FD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:29:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrz3-0004pw-8Y; Wed, 22 Feb 2023 11:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUryz-0004p3-RA
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:28:41 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUryx-0005mb-Ia
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:28:40 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso6878094wmb.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:content-language:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wU6PIsYuUcxJ2xYT9aTsNniwT+i0x2ZvxfLCqL14AgU=;
 b=NZT1YP6aJmqpQ6dZj8FHeAyZBz75nK3fEtg/7aLWmWCmHc8JrHnOte50ldCJE5vBug
 r4bPyVt/PT/sQyQa+5o9hwbZv5CU5KIpoJou2357AYyYc2/Kd16ETP2mE7uPGRxRuZIH
 rsEkaXBwzbD82y/Hk/F7oFh1DJhYA+ZmAO+hdQK/0EQ6X/gb9UYqaMqpwZqi+L+QjICl
 FnIzBrH35wrRbkP1yVNgGw1Kb5ha2MElrUHfWPdkn+Kfqb8bpM+XqGd2l5U8bPuB2bTN
 8I5NkZUO7NCa/0Hij3aHgiIWC00saz/KslPUue4aHGfDza0mq5I6PjM/NY2iAFgJsvzA
 ydaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:content-language:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wU6PIsYuUcxJ2xYT9aTsNniwT+i0x2ZvxfLCqL14AgU=;
 b=1Gl7UBuqCTWowinXqefPBThkSu36HYJWui+UYMIDJDj4IEQT/YEfJlWDNhD1eyQW3n
 ge3gNrNZTy0txP3xxfcso+wtZY5Y422iY1DfpHEoplQR9m3hS9DybAcqXCd4QAh/vOz5
 OYQDCHmALTeRkafeVGmxe0iqOvB9vMHiXdwce8WRySeoLJr5jNGy2f6jdw6dHKvMocCQ
 i10uvw2mEDOb2uuFy/nBBPr2//X9R+hm2ErWK3Ohhg3ySFwcw7bvN5xltkb6Exr4n8eL
 Zq3Gwt8kL8ZPqQdJfAKxs3ITOcq7GdTowIAuwnCqOhK/0rXHvBDXHRX89wDxY5ZcX2S5
 J1Sg==
X-Gm-Message-State: AO0yUKUpIVGX8xg/i3VYJ8Jqpu71SieJ4orE5DQPX4b87Y/Qw2JuHTkc
 EQKTrJpEYh3bmlHy84WTROn//Fi7DzlPYCXj
X-Google-Smtp-Source: AK7set8BDzR43iu5CoNO5VLjPRgkMQORorMPSVEV2JfVuscGtXU/m+LOHAoWpJrjYXk16a3nmWzUzg==
X-Received: by 2002:a05:600c:180f:b0:3e9:520b:4698 with SMTP id
 n15-20020a05600c180f00b003e9520b4698mr1667474wmp.27.1677083317330; 
 Wed, 22 Feb 2023 08:28:37 -0800 (PST)
Received: from ?IPV6:2a01:cb16:203d:61c1:1d6f:c826:249a:2f22?
 ([2a01:cb16:203d:61c1:1d6f:c826:249a:2f22])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c231200b003e20fa01a86sm7710142wmo.13.2023.02.22.08.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:28:36 -0800 (PST)
Message-ID: <7d380f61-b104-0fcd-47af-8712ffa01668@linaro.org>
Date: Wed, 22 Feb 2023 17:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
Subject: mttcg: warning to user about memory ordering
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, bobby.prani@gmail.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hello,

When using multi thread tcg, a warning is emitted to user if models for 
guest and host are not compatible (like qemu-system-x86_64 running on 
aarch64 host)

accel/tcg/tcg-all.c:
161             if (!check_tcg_memory_orders_compatible()) {
162                 warn_report("Guest expects a stronger memory ordering "
163                             "than the host provides");
164                 error_printf("This may cause strange/hard to debug 
errors\n");
165             }

However, in tcg/tcg-op.c, all load/stores are emitting memory barriers 
using tcg_gen_req_mo, which lets think it's already implemented for any 
host/guest combination (was added in b32dc3).

In your opinion, are there still corner cases that are not covered 
correctly? If no, should we drop this scary warning?

Regards,
Pierrick

