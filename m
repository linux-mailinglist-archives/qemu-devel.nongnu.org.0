Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B974D2D7E2E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:39:45 +0100 (CET)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnKR-0005OT-2a
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:39:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knn3z-0000mc-14
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:22:43 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:46154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knn3v-0002Tz-BX
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:22:42 -0500
Received: by mail-oo1-xc41.google.com with SMTP id w9so2357560ooh.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 10:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1c/NkRpy0Z9hC8jdMf/L4qwi/y+KFgzqq7HfbEF76FE=;
 b=Oyk+VYBABQ8n94h9TDEz5m2iJyn+77SpkzlSsmmR1vdAubqX/5iCGArANYwI8xlS9i
 Y1Zl4I0MDKkqMF8kOLigVf9RYnyMk7cqHsJQi7HIfjZlofkEk744g8m89cw2UPiGASJl
 AQ7bu5qVVGuxCvqGKoRG+enlQ5GfdU26RRTz0CEFNq+ao6+5Wg5vrHEZB7gfOzOaCTmh
 Iu+dDiqfkKUSvvZoHdyP6M7yz1/uXrk0O2WrYFxrP9bCfKRzRy0jfm1SeB6qsuzkfFeX
 qF0c2ehJ0RoinCHL6hDQlLDFGOVNA7g85yIYL8yePn+9HgsAickPfApsvuG1SCxtMLd+
 5LDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1c/NkRpy0Z9hC8jdMf/L4qwi/y+KFgzqq7HfbEF76FE=;
 b=oIrXtSi1lZfItino+wfvgLUnrXjpA85OYxXBaoqsW3vsBBt9zWm9JWew+idfdkQXqG
 56fSfa/Kj62tUrRpSFdG0xH1qFWjQ0tOdJsm1wJUsQjcdef7SyU/iiOBeBehnvvkUVv0
 MExv6qkN6ejjr3YQ+PWDbHVhzWf+ed9E+NzXlYKkj2t4BgjdmngtTc0GuhFc+NiF+etQ
 9lsRHvw6EhhMYP47EiipLywaHmwGvA3VUmOP3rdaFTwh5eXHQ1MC8yqgYtQuFrIRXbNZ
 Hjqcfm8jL1GCspHiMGrJM0tYxaNqU3d85vX2yBmyD2JBCwA5JT9Wk14Aa85DGJc0i0i3
 826Q==
X-Gm-Message-State: AOAM5317nd7RCmmJ0/U/Dgjswc7zmBOqZeWstCV1Y6kiHSQq14R8h4lg
 W14eQw7Rq2PWEjvsbmWX/0jmwQ==
X-Google-Smtp-Source: ABdhPJy2n38/Gs7GXnixnYvpXe18PqD+rCvZwSZqIycdM4Rv/y5yu9nWmDDIP+UyB8bkRGgPhqmRqA==
X-Received: by 2002:a4a:9b16:: with SMTP id a22mr11113705ook.6.1607710956954; 
 Fri, 11 Dec 2020 10:22:36 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c204sm1944593oob.44.2020.12.11.10.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 10:22:36 -0800 (PST)
Subject: Re: [PATCH v11 18/25] cpu: Move synchronize_from_tb() to tcg_ops
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-19-cfontana@suse.de>
 <78a7119d-1b4b-47dc-8f16-510708c9fcd4@linaro.org>
 <cca08e8d-9235-46da-3610-8acafbc2de14@suse.de>
 <15b884b7-94e4-1476-f883-e84379b2661e@linaro.org>
 <5d9457df-c7c6-dd61-bbd7-1563d29102f8@suse.de>
 <946cb717-d1f3-5b30-5622-0126437420d7@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7db8e36-f623-a090-a19a-644b02c3cd76@linaro.org>
Date: Fri, 11 Dec 2020 12:22:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <946cb717-d1f3-5b30-5622-0126437420d7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 12:15 PM, Claudio Fontana wrote:
> Should I return this file to the original state (without the extra #includes that pretend it to be a standalone header file,
> and call it
> 
> tcg-cpu-ops.h.inc
> 
> ?

If this header can work with qemu/typedefs.h, then no, because the circularity
has been resolved.  Otherwise, yes.

Thanks,


r~

