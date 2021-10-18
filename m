Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A64326F7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:57:54 +0200 (CEST)
Received: from localhost ([::1]:42378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXpZ-00041m-V8
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXmw-0002r1-9z
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:55:10 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXmu-0005MY-Qf
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:55:10 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so736917pjb.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A5ju/9Mm2agt7JdEvwUW+dCD80jPJRBeNNT0Td7QnJA=;
 b=r6JtfY/TjtXPnjAwTA8J45C8kOB8AgwKfx/tcRoBo6Vxt/UBGFY6H2ZF8nEoiD7wlJ
 57B98nK0bXQoFj2lv7/XFK81yKa/F5WxPO1skqxaMei/Lsq67VrWYyZFxYND7uz5fOV4
 D/Zh+M1noJ+x+Hu6+U/aXAPTPvYoj7Q4oha9ikiVy8tuD2g4Kh1du/sJJF9dcOBwGdLy
 rFpDxh3xAukm/nz3DVnh0TfCLy+BEOSRFbbxdAW8toikRb16yefyTCSkKBwAHoDvx7yy
 90ApXSwUM2InYK4Gd1dX/vaDhXIFBTqgC2TE1W+rAUgrOB4LvRZvY9HlRwmlzyXLwG7T
 e/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A5ju/9Mm2agt7JdEvwUW+dCD80jPJRBeNNT0Td7QnJA=;
 b=2O2pH8E6LdaljWTr6vt9ByQZPcXEU7dvXJIX5VoYGej+Gj/CUQSoRsRv8enISj879r
 Dz6F8BfEAphpVrOQLFq/rafYXCQ8/5BBODMigxVoUrLm9+SE+pXypO3/Vp6+crxGXdn+
 0eSPFKMhMODRuqtVqaPdL116CzuIIk3iU9+S+a9IUDC9UZMlpinqTBamo9sDZ6VWZfAW
 9sdydnvXqHRyBNX0J+YXU0P9RAiNJYjZV3cqoLW6lD2jxQPLvSJ6McdHfu7noyiCxeGZ
 az0ZZS8WDS/JJbMD/TWOQOEFnxidGDNMr8VDuatYiJj+pkfCQ/bV0J1F/6n5Hq0IbbvO
 TWeQ==
X-Gm-Message-State: AOAM532KG2jh3fEOMhz1BdmL2ehzAHQwjo1T/VCN2Tija+hhehG6mjbC
 8m3GQWVAHF/WdGdeWVUd+zeByQ==
X-Google-Smtp-Source: ABdhPJx/Pv6UYrK2Y99mp+BkAeM9lxevjQUSjcQRGPxA6ViRaC13YGHYK76wwB2Nz5xNVNaauOtgWQ==
X-Received: by 2002:a17:90a:e7ca:: with SMTP id
 kb10mr719630pjb.139.1634583307133; 
 Mon, 18 Oct 2021 11:55:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c27sm14548176pgb.89.2021.10.18.11.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:55:06 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] roms/edk2: Avoid cloning unused cmocka submodule
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211018105816.2663195-1-philmd@redhat.com>
 <5c870452-03d2-6d1e-a49c-ca2201d04972@linaro.org>
 <0a381361-56b5-3fdf-e405-702f5d90aaf3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0a251ef-fc80-1e5a-4e08-33be2451316c@linaro.org>
Date: Mon, 18 Oct 2021 11:55:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0a381361-56b5-3fdf-e405-702f5d90aaf3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 11:53 AM, Philippe Mathieu-Daudé wrote:
> If you don't have anything in your queue I can send a pullreq
> tomorrow, otherwise thanks for taking care of it.

I do have a few other patches already in the queue.
I'll take care of it.


r~

