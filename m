Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E17244F4D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 22:53:17 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6ghQ-0003po-74
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 16:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6gfz-0003Bw-CC
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 16:51:48 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6gfw-0005s8-O9
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 16:51:47 -0400
Received: by mail-pg1-x542.google.com with SMTP id g33so5093104pgb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ylO/uD0ynXm7SPAWU6BBRL6BmuqEvqAHez9eVkA8mYE=;
 b=ueoc6TbKAjDiOHEsyW6slVTj9+uKfxtPrRBDXCDSLjFBT34kthzmMnjsqVrCLbti08
 hd7Votvaoe/S51uOV+UROQgEXyjKHD4mxdTZPTCReZxdecPbV2H+ahXY8KHEcFu6ZWTJ
 dRIsgX3dew9XJ9n6fQqmcqTDTPqR8cprwohETGQT8xWXOQ3O6yKJ+RWpmjQD9FjCV2dT
 WqC7stsGHhZLACvS9hmI9UrfH9FiDRg2giRuLWsREszQohFPELqxbKA6oT8hQMtypgBz
 FjIQ0dEhrKwpLYq/4TilktG/FUdQgxruXfbqNHDma3D18W1JKuvnNR0FC9ficLCu/9Sh
 FYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ylO/uD0ynXm7SPAWU6BBRL6BmuqEvqAHez9eVkA8mYE=;
 b=onoS61agNTHSWO3+q1ZssHQpj4nqRX8qs/D4ErzAAqflhtBT4p6S+2fL1fSGRRIRak
 FPNEwGYYmp7McDtJBc0VC2uayFczhhII0fL3xthCgGMwTEAJwSgZgLGoeQc0FTKcnFV5
 xmiBTyisMRmx1JewnC4usYsfpCxS8upM4eZ+3WpXtXLDWdblfLq1mutNTf95+E86QEaX
 CIWDi6bth74oXtVerEhb7uzAUSJ5mKJ5tp7G+EZsCr9BVBBDNx0cFqN3rb4t5U75UFIq
 sBRFADvTKj2ASZ2W+LlL/KVvNGiRns/wsFPl9fquHpVDppqbmoGRpJfqe/u+rvjWd3SR
 ypPg==
X-Gm-Message-State: AOAM530ThnKIs3OGcVJcSG4XVlQVucuqdElhH+mjEG7NMfUUrcdKT3/f
 UryGN0OYa/jiII38T1p9lC+4Rw==
X-Google-Smtp-Source: ABdhPJyc3xqjf2lhPbj/KboPZPTlJlXG3P8e32Dm4m/MHErZeR3V6aXdNej1HssxOXV4ZtSl7nwDYQ==
X-Received: by 2002:a62:fc8c:: with SMTP id e134mr3053910pfh.113.1597438303215; 
 Fri, 14 Aug 2020 13:51:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id q71sm9209535pjq.7.2020.08.14.13.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 13:51:42 -0700 (PDT)
Subject: Re: [PATCH v5 08/14] cpus: extract out hvf-specific code to
 target/i386/hvf/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20200812183250.9221-1-cfontana@suse.de>
 <20200812183250.9221-9-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef81606a-91c1-a26a-d7bc-f9366d018175@linaro.org>
Date: Fri, 14 Aug 2020 13:51:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812183250.9221-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/20 11:32 AM, Claudio Fontana wrote:
> +CpusAccel hvf_cpus = {
> +    .create_vcpu_thread = hvf_start_vcpu_thread,
> +
> +    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
> +    .synchronize_post_init = hvf_cpu_synchronize_post_init,
> +    .synchronize_state = hvf_cpu_synchronize_state,
> +    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
> +};

const.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

