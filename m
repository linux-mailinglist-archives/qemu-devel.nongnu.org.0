Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CC365E4FE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:13:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIYd-00073g-LB; Thu, 05 Jan 2023 00:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIYb-00073M-Ge
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:12:49 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIYZ-0002Hr-VB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:12:49 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c2so10745433plc.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WyIGvcwADA/FqyWombW+s1KNMFJ+ilMNg7bcoMpcjtw=;
 b=ahbEU2NoIPfQMx6if7IpeB2siLtjOd6ej5df1sqO+C/FvoQVlWZteyr9bJlap2cqCi
 KSpJEQP7qqwqwEeLFOWHbWDj/FeSMCECLWaAe1zDfWmPH/YT9+7Bxaij8ESs4ChMFiyW
 9xfZO2Ocwaoau6RkzJIkkuivaiJ3p4Dp4Sl/Rl3ZK+V+yAqiaCjLx4ReXT+QXpsQh60e
 XgnT1h6SBEnNLLVgf3RZOSI1OkB4Vh2vCuN1xGxbjeXA3UHjbEK6bc5BE9cIhh139smT
 3KNjS9SgvX5nfpTZGC7pDY0m3+vtTsYgCmKpFvQM69N56fhGTiwCzXKiV306Y0vd0Iyf
 Vz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WyIGvcwADA/FqyWombW+s1KNMFJ+ilMNg7bcoMpcjtw=;
 b=3NhJQ8pV7qdkunMyqfZxay5c9okLAtiesx/DYj48HOIOnEvsrkfmUPr6oBU0Qr65nh
 mQrQPSM/TP4SHcJvEALeW1Q/RPJxF9IOZLJtcbgW4SoY9uem+oX4XrU5CZihnHxyFhxf
 GzgLXAxElaR/tadOs9eku5zdlWQK4iv0dTAZ1mHnlZqftZXQS3x73IO+YmUDglW3XY8P
 6FRtQfSminPLAkhNiQuJqCx5NLveNdJ03AI4IQGLFq03wBVRYCFbaJFBDe9mk19JC8/M
 +C8C2KsWN02qf4B5hhRCnMUd7FGwWateYnDlUKyjBNpa5zAunKA3WDv+q/PCcdV4lg/n
 LPUQ==
X-Gm-Message-State: AFqh2kqGAX58yIo+h6qj2udCt2HvK4NpxXmzWvdfiRJD2fFupQKsty+X
 bHg3uGGX4Pl+vPvNVC8fL9CjBA==
X-Google-Smtp-Source: AMrXdXuajSgUQ3j3n1L4ajCWjSUX3KHq/m9TYvd5qrs7tlXIhjwS23UjjMJUmUe2CJjbYHNCL96F0w==
X-Received: by 2002:a17:903:32c6:b0:189:df3c:1ba1 with SMTP id
 i6-20020a17090332c600b00189df3c1ba1mr70485336plr.38.1672895566507; 
 Wed, 04 Jan 2023 21:12:46 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a170902d0d400b00192fc9e8552sm481990pln.0.2023.01.04.21.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:12:45 -0800 (PST)
Message-ID: <326b71c7-dfa5-25d3-89e0-b3fbf50c1e26@linaro.org>
Date: Wed, 4 Jan 2023 21:12:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 26/27] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG
 code
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-27-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-27-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 13:58, Fabiano Rosas wrote:
> This struct has no dependencies on TCG code and it is being used in
> target/arm/ptw.c to simplify the passing around of page table walk
> results. Those routines can be reached by KVM code via the gdbstub
> breakpoint code, so take the structure out of CONFIG_TCG to make it
> visible when building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> This is the least painful way I could figure out of doing this. Let me
> know if there's a better way.
> ---
>   include/exec/cpu-defs.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Nack, I think we can do better than this...


r~

