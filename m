Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8EB32653F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:07:44 +0100 (CET)
Received: from localhost ([::1]:45766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFfeZ-0001s3-43
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfZe-0005xp-Vc
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:02:39 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lFfZd-00055G-AV
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:02:38 -0500
Received: by mail-pg1-x532.google.com with SMTP id l2so6485280pgb.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vrzKYIDbPLwVy7Z/q2B0QZ3ZYwo73JicKSEsEF3QBsA=;
 b=V4IvqpjoyN0/EjmN7lMI/yGLgbjZjUZ8lB7Th7UWKKuWB18D3nOr7L7Ue5ogNROJm1
 qoyCjNFwMrHJHFL1ilNu5bhvh3YrROxATuUbdV8vLXnQ6dBkxusdC20fb6zyE2LJi5qm
 e9GlC8NXJ/+NHRNHVRlY6ffdU3eQo8+uw0cv2qQb//KMWVZo66E8Wx3hjiEjsRgDvRDq
 VUzqVLmvUbuKljEc39ibSJmomfz8iS2Bszbfqilp3W/uDwvX1m2oRdQ7d3JtSFJ9ph1/
 MRCq59FSoSu4bBsd7V73PmjK8QNOQtbmeGCy5oiHX/0FGaYyUFhA6byokLcHJ/wSHQpP
 HrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vrzKYIDbPLwVy7Z/q2B0QZ3ZYwo73JicKSEsEF3QBsA=;
 b=kfxtLcV8NK8YQ9Ck6sHWu23DgRjDDi+91xfdsO9pWJ1gLjxJKU6EaqAZFz9Voz8mia
 qMX7kpSPCPnAs4ZvMeWAF+HI0eTpZTj3Jrj4VjkjlnJRYehiA8kmNkFjIx3DK388v9jv
 n3GGTHkyH/O+6p5pJzu9O2ip1U32nRkVBjQ44EHywf7KdtJrie6pBhHkWjtvuz7/Aljb
 xbZ2wwZqcIv3mzA4Tab4Ot3/6aEIsfhoUqVTnC0BlDt44Bol+Ea6PzmZsqrY4hfmb/oO
 KCorgU9lEldmVOUEZuojMsgX3BevezDW/dWQjM1A4KxXmLMPSwVmAZsc00y2zArjSIB1
 U+6g==
X-Gm-Message-State: AOAM532HcN66Nuv4TtkyVcW1XiWUYcf1486026nzf8nKqNqtZkyeYxJh
 Wt1g8IiWwtlNk6S2JwJnJwA8/gO5+NTZHg==
X-Google-Smtp-Source: ABdhPJxmqDmELa2NBuqX76DAsf0gbflSBkWMxmZEDQdZRpDjaPLEPCSKwTgTOVGDqGaSGju4p7edgQ==
X-Received: by 2002:a63:490e:: with SMTP id w14mr3417457pga.369.1614355355874; 
 Fri, 26 Feb 2021 08:02:35 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id v26sm9731041pff.195.2021.02.26.08.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 08:02:35 -0800 (PST)
Subject: Re: [PATCH v24 18/18] i386: make cpu_load_efer sysemu-only
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210226094939.11087-1-cfontana@suse.de>
 <20210226094939.11087-19-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cfdbcd36-b08e-c854-3fff-f2407a3cdd7f@linaro.org>
Date: Fri, 26 Feb 2021 08:02:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226094939.11087-19-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.349,
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
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/21 1:49 AM, Claudio Fontana wrote:
> cpu_load_efer is now used only for sysemu code.
> 
> Therefore, move this function implementation to
> sysemu-only section of helper.c
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/cpu.h    | 20 +++++---------------
>  target/i386/helper.c | 13 +++++++++++++
>  2 files changed, 18 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

