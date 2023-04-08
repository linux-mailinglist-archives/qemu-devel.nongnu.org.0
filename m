Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DB6DB7BF
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 02:20:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkwJP-0005oV-TN; Fri, 07 Apr 2023 20:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwJO-0005oH-EQ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:20:10 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwJM-0007sr-Qb
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:20:10 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 q15-20020a17090a2dcf00b0023efab0e3bfso2631207pjm.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 17:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913207;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h0AMQUjCxtldpfHAeD1rg9lCTkc7fsJtYxu4TaQAE2g=;
 b=Urec4esb1Mrf0yQ6Bwuaz6MOVesVE0SrmAKkK8nBgotE1BD6HoknBf0HfOXwxf08Et
 utBi6IJR1MmBKVlVfvnfd6lD31f/+l86esbWIn40yIbndhN1a5hGZxokuR7K80zBE84d
 Ych9lXXb2tG2cinp2j/iEhWKbxD7ebc96KYL8oebjodf5/Izp7XZJ1Pg0gKh//YT6Tco
 k3BKS5oWV5Uv4k23CcpGlRxWYgISlhCf5X/J/KRb6EN1vyM1/UXQKw1AqnMnBMlvOUt0
 Ktf+zl2Lbkcn0R5+0Zp4cfqPMFRmHxZPDS29EtxfEQZQGBTbwh/68AXqHqygts5vyeKm
 pUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913207;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h0AMQUjCxtldpfHAeD1rg9lCTkc7fsJtYxu4TaQAE2g=;
 b=JDV6YcA6MmTgjxCZdBiHrYvvoKaiAwOw7s50N7jVrwhe7OgObXKNVfZF0Kw8OPmof2
 UgSRbFN5VXyUwKmwfZgrDpNRbl3q9qu/SssHGA8WtpN1k6W7pDsFLGYUqU548lsQmRm+
 /Q0KTipoX/fnugeMJ4fSgiFovVcDiWzJ/S3vJPSreMlr2vtP8M9iLA4Ylc0J7E+MYK/w
 rDdcZpVVHc+zETdqt07FClukmjSBZ0hUnMpU1pw8W0TsVPVlkyoQIFPDU3wFkNtCOjrf
 AcVbt4EvFwUSW8o+n0glZOadEpKlbyGsHw0LSEjOeOAXHY9ykqBJvnXHIYdllfv5av42
 Iozw==
X-Gm-Message-State: AAQBX9cR69y1jaZ5PxFnzaDLdA3I3W8wnripTuEbAZ29B/HfQmHcdGOY
 lV2RfByo6yEppUl23SfY1gLRhw==
X-Google-Smtp-Source: AKy350ZCJRdXihePI0z7v+4mK45Od1zcrSdgXUXdoP6lajYBNurBO22Pra5e2rpRuWoPilSoA5FAqA==
X-Received: by 2002:a17:90b:1d8e:b0:246:681c:71fd with SMTP id
 pf14-20020a17090b1d8e00b00246681c71fdmr2186338pjb.6.1680913207517; 
 Fri, 07 Apr 2023 17:20:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a17090ad98f00b0023d2fb0c3a2sm5198039pjv.46.2023.04.07.17.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 17:20:07 -0700 (PDT)
Message-ID: <268fe6ac-b117-9725-46d2-763e5a5b0c72@linaro.org>
Date: Fri, 7 Apr 2023 17:20:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] accel/stubs: Build HAX/KVM/XEN stubs once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org
References: <20230405161356.98004-1-philmd@linaro.org>
 <20230405161356.98004-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405161356.98004-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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

On 4/5/23 09:13, Philippe Mathieu-Daudé wrote:
> +softmmu_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)

This when is redundant.
You can drop sysemu_stubs_ss and add each stub file directly to softmmu_ss.


r~

