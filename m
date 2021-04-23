Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB93698AC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:51:56 +0200 (CEST)
Received: from localhost ([::1]:51746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzy7-0006dd-Lv
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzxI-00063F-Os
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:51:04 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzxH-0003BY-6n
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:51:04 -0400
Received: by mail-pg1-x535.google.com with SMTP id z16so35688848pga.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L+B2VZYSDiHJ2Lzb1rf1gu0HsHxxaDSIMaGwAQ7pHFA=;
 b=DA5eGJx8YCw1ehapSljDgqXVAdFxDzFMKYinzKXYpwhB3MkqVmCMzF8xPpGThk+drO
 PeTPap3Nr+tfry3tRg5hc49Eg+ws3RaJ1cQfLbCRL5zVXEeoEugQBDHjUaH6hkQqGFTl
 onpNbAfniR8pI7cezk7DPnu0tMDEqlCnLH6vWbSMUPQm9IrO7ytO3s4KfIX03l99OYyi
 F4aa7HpndKg/esdoAOLF9Y77nNxB/dhlFzYE8qEscSqsg6SHNI2HnCb6WqHLvCBRKkHJ
 EgGbO0q5jU2HXP2UgoGrNnaG1HpbKKhmXY6y83GKyV2nTIka26GyRaaPD2xqSBl3NE0Y
 jsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L+B2VZYSDiHJ2Lzb1rf1gu0HsHxxaDSIMaGwAQ7pHFA=;
 b=ANMpuMpjP9PNkybH0X8IbJpvnrssuWghycBY8MS/1vb8twDWNsPRaxu9LDwmpsmgms
 UO632ZYaYKqqhugIgPRKi6Rx50H8xbv9BRvMZxgxfqXtlfpCoxC3s70c3MziuVrc8RrD
 yn4T3t2GIFSra+d+SWsVlpHFIn7Y5sFLOBdnriremkSGoKKP5W4sfD4zVlsVyb0PWdwc
 Q0S8iBMquslE7ij8vff9+VT3dEG0oqEuCoX0jFY3FCqLWU+oL1PBKYfYdbjj8AGDFvrf
 zBL18P62o/MhhRrBU6yvxvWQLlKydDITKhycEGd35hc1j3+EXLkOdRqcESVXArxxaCui
 yvxg==
X-Gm-Message-State: AOAM533Ryi/0Y2EMVRX1etkYd4hGzhfhh70myzeHUm85D9yNCBPdy2xL
 HNbrD5Jl2esGWLM/DknrQVqk1w==
X-Google-Smtp-Source: ABdhPJy1jFrLEWQakUX/uxpxhkp4/tfwtCB5RlS6eCLnyv3YMaoQcpE+aAh9AUsumvl9p6QOZT2zuw==
X-Received: by 2002:a65:6a4c:: with SMTP id o12mr4825586pgu.371.1619200261772; 
 Fri, 23 Apr 2021 10:51:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 14sm5126681pfl.1.2021.04.23.10.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 10:51:01 -0700 (PDT)
Subject: Re: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
To: Cornelia Huck <cohuck@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
 <20210423123111.0575608e.cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f84d413f-6f25-eca0-e963-dc11e446f38a@linaro.org>
Date: Fri, 23 Apr 2021 10:50:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423123111.0575608e.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 3:31 AM, Cornelia Huck wrote:
> So, what's the way forward here? I can pick this if I get an ack for
> the arm patch. If someone else wants to take this, I'll just ack the
> s390x patch.

You've volunteered, so that means you get it, I think.  ;-)


r~

