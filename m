Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097216638AD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 06:41:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF7O1-0005Iw-95; Tue, 10 Jan 2023 00:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pF7Nx-0005IP-Oo
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 00:41:21 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pF7Nv-0002cc-7T
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 00:41:20 -0500
Received: by mail-pl1-x62a.google.com with SMTP id jn22so12038963plb.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 21:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CMcsgO4s+upnfvngtEhHPVefgeFSugrU4khaEdbHlnc=;
 b=yQHZ+czk58zJJGchc5mLwAEWKKhsGwPReAMdEB3g2peL6Msf7vEz5l651EdlKLfqiN
 dh5j3cdddo4rI/3P6AieaV7AYJUmXHrTmuHQZFrVbIqYhCBlvf0G/IWZqgzucIB6gYCO
 n0TXYWIqkoUPfXirKfHuJNkb9j/zaO1mn2Q9CAqborOLKwJG7mrrWtbBVQBs2ouFv8Ta
 IN1xbnzQg24S3RvXooCUf+55CDa2hDx/g83b4SxJABCq+yA+5QAaZEdWG6/cVyg84Y75
 ocxhzd6kT95ScBom3j+tLr3dLCF5zmK91pSVDirJv1OXWGSqQly5U9KfFkDVDe2wBfxe
 Tvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CMcsgO4s+upnfvngtEhHPVefgeFSugrU4khaEdbHlnc=;
 b=v8XBDNGuO/qeZdpl5ph4+KZCXgv6DCNY6o8cfYBQC6Gzgh+nxjYrfJaLvsGQof4pXL
 IkUk9DEADgw7t4F3cUezp4gitid3VDyEwjwoc12FRuY6Q4RUa8tmk29kqNotNCLDIDQl
 gbaiZWN42cAOnCJg1bj/+aBNoNWGJLRd8OQUnshP+OUcuhOTl/ksQ3m2G/3s9n+Bo53N
 mBnEdpLwVkucszbgJu8oZxC9nbXTxrccfhF0wVuW0yaoDs/5cV/i7gkOgncG5Dp3NavT
 Pqh2OLcevm+ThH8aPP4UIK5DkFUNgAfomQ1niTQ/gbSHQX+v5LIIG/Uev+ZsofDg+/J7
 ELKQ==
X-Gm-Message-State: AFqh2kpFkflLYw4ri+Z2JD/8ftBRiyZACb7lu4Xeg6PT8uX0FaI1b4I8
 SlppgI2SqwQfHRmhXfkXBfTwqQ==
X-Google-Smtp-Source: AMrXdXt2AHtBPOJpDiZyY+Bob8LdzQH6gsfMJFzZhaNVymZCbb9yt5WDlGUKbyex8eiNpm0l4o2Zdg==
X-Received: by 2002:a17:902:d491:b0:192:ad82:dc98 with SMTP id
 c17-20020a170902d49100b00192ad82dc98mr52769018plg.34.1673329277425; 
 Mon, 09 Jan 2023 21:41:17 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:fbd5:d294:fb18:71f9?
 ([2602:47:d48c:8101:fbd5:d294:fb18:71f9])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902d2ce00b00189c26719cdsm7033852plc.272.2023.01.09.21.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 21:41:16 -0800 (PST)
Message-ID: <4e758b11-9de7-ab44-d400-8457a3f51262@linaro.org>
Date: Mon, 9 Jan 2023 21:41:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 06/19] target/arm: Move define_debug_regs() to
 cpregs.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109224232.11661-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/9/23 14:42, Fabiano Rosas wrote:
> -    hw_breakpoint_update_all(cpu);
> -    hw_watchpoint_update_all(cpu);
> +    if (tcg_enabled()) {
> +        hw_breakpoint_update_all(cpu);
> +        hw_watchpoint_update_all(cpu);
> +    }
>   

This and the other tcg_enabled() addition don't belong with code movement.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

