Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970B67442E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:20:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcJn-0000IL-Pl; Thu, 19 Jan 2023 16:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcJk-0000HX-Q4
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:19:28 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcJi-0006nQ-4V
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:19:28 -0500
Received: by mail-pl1-x62f.google.com with SMTP id k13so3576224plg.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6EdajB0ZvjP7Zu9Iyb4IL6EwU+QpucYA288YltO4usc=;
 b=SMVaAf7fcvynyQdT9R+2j7oiiL84Xq1+qoeuI8mQ2kFXfjFZXB0hIG+frx3MiX9wYW
 ZCQ/ntIzuvhAyzz7oBkLvIOn2VKoAlnnzl8PMAtFVHcjueUPFCY8qkMnrjUQZ1NohhQ5
 vnpUpZdpUa8Go3C7kavkIOLeOLQ87Vjy5G2ZQrc+RmPq+h2hw1PJfhhFH97L3NUtZSs2
 Pom/OCdJxQZNozLhAZxrrg4P6WDj+5/Hcd3D7hM/HHrNhWr7zJeVxEA48bElSOmiB2dw
 UZcwtBs97UqBFkpj20vXFiLEkUHi9Vf1XwjDbTG2O6pxVQBomEY6IV4hnKwyHd03oyP2
 x6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6EdajB0ZvjP7Zu9Iyb4IL6EwU+QpucYA288YltO4usc=;
 b=wcb9xQkejP13zOF8jwqwWvGZ2k8av7dbBgCoaQ3CJMEzWoSSxjQjkcVE9X3GTcVQ4B
 I3SW5GEs5QOIlSyGbfUN9q1nDu4rkK/fcIWZdSUeKraGH408bqcVP51UVTtTugrSK+9N
 Vin53FvnBa7zlLZsab7WL4qoI0vZ3ywAJ9OAyRb3/qgQssbQjzpGw6nR1+MTzje8oS1D
 z+jzfjDkgFqnnSMcu6yCt6kpPGCqQTcweOxpDs0rY6N0FmimdgdMWhUCfzVTQp1bfBU2
 OauAT/fw43rULE0oY1d/r3azKwMVuPGWU8f/vykSZG/dChLxlnMqXnYXoHu0LMvRLrDu
 HR0Q==
X-Gm-Message-State: AFqh2kqoweMY7rAavSlBEKIqpiuDSEZnCbRj27db/Xiq3okgI9VBi6xD
 OTMwcoJ48/LH6JjP0cNVdqo6DA==
X-Google-Smtp-Source: AMrXdXtQyGu1lZzOPmc+UzD5dG2izB1bwwvbrsq/TvZOw+nLcuuYSBzksUMO5sJ3rk/vzOBvKMi3OQ==
X-Received: by 2002:a17:902:cf4b:b0:189:76ef:e112 with SMTP id
 e11-20020a170902cf4b00b0018976efe112mr14500713plg.41.1674163164065; 
 Thu, 19 Jan 2023 13:19:24 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j6-20020a17090276c600b00194b37940edsm539919plt.268.2023.01.19.13.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:19:22 -0800 (PST)
Message-ID: <a4e3d2dc-452a-a924-7504-a295f6ad7abd@linaro.org>
Date: Thu, 19 Jan 2023 11:19:19 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/11] tests/qtest/migration-test: Build command line
 using GString API (4/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
> Part 4/4: Convert rest of options.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 50 +++++++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

