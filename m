Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701566A5B6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 23:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGSEd-0001Zv-BL; Fri, 13 Jan 2023 17:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSEa-0001Z9-Tb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:09:12 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGSEZ-00047o-C4
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 17:09:12 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d3so24769841plr.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 14:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qcq2EZLOb5aNSFGz2N0m4y4IHwpRjOcqwcp5ceuj9ZI=;
 b=e4cBYqrDJY548Y1oc4368J+PR5a+EEgomx0RjlfpLROOzk0iS8T8qm2LkA5twJa2al
 5+U8GSZaAZI4++NebkH5iIoaeYJ4HNwkpljb4HwsQku0iYH26s1urdrqXMA0mRHCLipD
 bG1VRFHW/x4lZkumGGMOpHai4jkbqY9z5nFL0lShNwHEwecD8c01Y7slRoEXCWYNvMpc
 ddJio7WGAaRcb+20VgnWl27Oe+GCIoKnV0k8TzwbDeKECt0RQCqLlVvFdNLcSb6vOXXy
 E2tojrbenGFnvG2O2pETIjJKDoANJUVjDxPj1UHgmnc1IKFKa1HmmFxvZN3LZvoBCA1w
 RIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qcq2EZLOb5aNSFGz2N0m4y4IHwpRjOcqwcp5ceuj9ZI=;
 b=zFk/xJavhUqRkTn5wDcdhKFQLOUU656wdycb0tyTUlfyj36tPOr0o1OPvm7Cl08ADA
 mQMKxTO6g5yc4csp+0Npgg+LUgqXZLHMjtM29FKKeoEDeEJDJXYzovFa7SE18JvP03Lh
 BfuJ6LlIhb8RD8IUpjwtsiEXy0a+WrtRb4Su73nhi5j/Oy/PbExPzRp8LK+Yhz1KoZtS
 06rICfJVxDQKoizFeHzSU9TDcP2LgmLyjxVwJSgzFfmmkLTTe236vdmdup4TfRHXY0AQ
 +Ab2V/8m7ep4LScDmNZCHdXJyI5WP4AQNzQ/CD75wCNR1Hbequt7OJmbgbaTyUZNJ3tI
 prXg==
X-Gm-Message-State: AFqh2kq8Hnql43o2IERTCglwCnibtApJiG+EngnEmIJdIQTDiLmU3BWv
 pR7auhUz8bE6dc9DwhAz/TDHpg==
X-Google-Smtp-Source: AMrXdXsFW58kXI8hYxFScDNsPipI1sflCdpIbXbgSf9NSgZXqRutJomnQctg1OKpzpyhzgtEeJHh5A==
X-Received: by 2002:a05:6a20:7b0a:b0:b7:cdfd:9415 with SMTP id
 s10-20020a056a207b0a00b000b7cdfd9415mr1616033pzh.32.1673647749891; 
 Fri, 13 Jan 2023 14:09:09 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f127-20020a623885000000b00588cb819473sm9854339pfa.39.2023.01.13.14.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 14:09:09 -0800 (PST)
Message-ID: <870053e2-f9e1-3048-c80e-687a13ccdf9f@linaro.org>
Date: Fri, 13 Jan 2023 12:09:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-22-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 1/13/23 06:04, Fabiano Rosas wrote:
> @@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
>   {
>       QTestState *qts;
>   
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support is disabled in this build");
> +        return;
> +    }
> +
>       qts = qtest_init(MACHINE "-cpu max,sve=off");
>   
>       /* SVE is off, so the map should be empty. */

This should work with kvm as well.
It should always be ok to turn off an unsupported feature.


r~

