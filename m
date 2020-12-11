Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1246E2D7B4D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:48:50 +0100 (CET)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlb7-0004Yj-2e
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlY1-0003EZ-5D
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:45:37 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knlXv-0001P6-9p
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:45:36 -0500
Received: by mail-ot1-x342.google.com with SMTP id j20so4283920otq.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ysikXxN075lEXoFXHRuamoANeEWSx7QZzrDiDktgCDk=;
 b=dP/HjMQUkVxMUsvyd9Qmy0w0FVtSm88NNxUuEMiooxhh31+8r0KyWARBqYPG1sXHSL
 JZuwnpQ+KPzDdqFTl6bToVtGnyKG9LlxdoJuL1UaF7xp3lb6xlJWR7WpFvCjreRcP5Zm
 G/Y7eaFzw73JmXQ1LSguzXdSMp5qUt6946IgmvTEkmgiGTeeDcyrMBrmgehG9iySzbAP
 mcinyRDUPiLxBbYo4DpYqXG430dlH/DaxAVLEj0Kf8rxGZdRUMVFTivvMz8SD1J7NI8X
 37h8jWAytIxJhe7bgstEZa3GRXfEt96+G1YnSPa002JTTDLfxsIE7oemfznZe709R0gL
 gFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ysikXxN075lEXoFXHRuamoANeEWSx7QZzrDiDktgCDk=;
 b=D0hGRZynoRKrQ+Tbp/KAHaz0In8VsXFd0bJBUTi+/glRGWEUwg2I3hoyW7SulL+fTt
 7/0c4Jz2aIdbyDP/wAdBoL+2axJck6byuv9WYqSCtglQI3eLxzx/UND5heo9S1+rg7Ux
 U63P4QzI73IC6bZcAV2l5rGxa2tQlc+c/wz0m/PhJQXANmO/K7SednsUEM7aZtwYsbJY
 WeMu9tTzvVIcVzbNg9HGyT/hPRkCgg50oH6+hE+1t9/48Qpe3PFElbkUtuMYlusV3Pnw
 dN9qbtXIUdhaIXP3QxrBsijvhDPHc251hjFsKf9WGIpk4VF2RvA2qiiGtDS+Zqx26tqE
 obpQ==
X-Gm-Message-State: AOAM531CWoMHT81i565meTUne32GRw45oN3uS8dEgvYftEA7xmwpA+Dh
 JQOU/SWtcauJDOd7Bexiy/6BQA==
X-Google-Smtp-Source: ABdhPJxMIJ+BfYEBmx/hD76TbHV41WQPN/LchG9/H7qqbZEvxJZdnTLT30GGymheKwTjD8iN22P2rw==
X-Received: by 2002:a9d:170d:: with SMTP id i13mr10520474ota.106.1607705129993; 
 Fri, 11 Dec 2020 08:45:29 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m18sm1889428ooa.24.2020.12.11.08.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:45:29 -0800 (PST)
Subject: Re: [PATCH v11 11/25] tcg: cpu_exec_{enter,exit} helpers
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-12-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9096147-e918-5536-aede-aa993c425318@linaro.org>
Date: Fri, 11 Dec 2020 10:45:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-12-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> From: Eduardo Habkost <ehabkost@redhat.com>
> 
> Move invocation of CPUClass.cpu_exec_*() to separate helpers,
> to make it easier to refactor that code later.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


