Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C834BD00
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 17:45:26 +0200 (CEST)
Received: from localhost ([::1]:56162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXbR-0006WO-Ab
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 11:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXZv-0005uL-Dc
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:43:52 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXZt-0002dz-Tz
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:43:51 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so9967654otn.1
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rI3KSSsqN5SwSR/ImLPNi3JV3tuLpyza2Oy/7gUGb5o=;
 b=uTvWIhj8fdsGfDXDFE5/1LJyiPI9+G12zsdBHRf67S3SmlFX2FeVaKJU8cPBBPf+4g
 PC/38eoKiV76P8t7FRl3XreOBzp3tBPAHtuCTL8jk02aO8VR1C8cX3eXzJWPN6q0Heh2
 VQRXcKu3nCZOYObt7sdg180trqKUf7qvQGXYI/nulm+xfio4LrsAGggCXfsmz0kTSEe/
 KtTl4A5NGU757R9+RJjMM3QrQ22zDP71KLoN6NbvwBLcdq/s4n+69ce3YVuRY9JgjHB/
 Zg4hugQ45PBZpltnGeMxIsKQIPM0rOP4ejOPle5fJuynfD2LRivky+ZdkbgXbAiTuCKF
 Jh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rI3KSSsqN5SwSR/ImLPNi3JV3tuLpyza2Oy/7gUGb5o=;
 b=glT4Eu2SxIo+is5sj48XQ+/2lmAZGu5cWx/Wu2xQRauxjneM9Y008jaETgZ8Z/y1c3
 I6aM/cALhuMVZYiz3gtljfNGU2KRTYUdy4cTqSLkUJ3I/I28/kGR87UBf+ohB6OrMazM
 alGaEQj5pJIlNyAmePVTzD+l0KtdknmngPoBOY5oDnTRwL2MPfjwhdejw/eg8zuJZwh+
 ka9GcCFaJk/lRondFlgm/fyKFS2F5LtzB4eutx600MqzUMkypqr+xIKeYd+kUCdBND8J
 Fe26mxVRskPPUMiWC5vN/HTG1FZEnkwdTf/YW5aQzxPf+sWakmtg9u4qjSbXikwXVgdM
 xzuw==
X-Gm-Message-State: AOAM532bAsLL1u5UtIxu8iG4Yv+0vSWtobR1ZAce3jkBafy38yj/h3k1
 HdxiZD89nccx5lSjOgGCdWFIXg==
X-Google-Smtp-Source: ABdhPJwaubWbx0mRd7JXbLH+fNZk1BN/HdJLzzvXe9K6x5wZSxd1w+EnFRZfZPeoSCqEsXRqMrS2eg==
X-Received: by 2002:a9d:6d08:: with SMTP id o8mr19022600otp.214.1616946228871; 
 Sun, 28 Mar 2021 08:43:48 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id b22sm3634825ots.59.2021.03.28.08.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:43:48 -0700 (PDT)
Subject: Re: [RFC v12 09/65] target/arm: only build psci for TCG
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-10-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e37282c8-dc04-09f2-8e90-d7a06b125994@linaro.org>
Date: Sun, 28 Mar 2021 09:43:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-10-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> We do not move psci.c to tcg/ because we expect other
> hypervisors to use it (waiting for HVF enablement).
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Alexander Graf<agraf@csgraf.de>
> ---
>   target/arm/meson.build | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

