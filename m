Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8165E505
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:20:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIfO-00015U-QK; Thu, 05 Jan 2023 00:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIfK-00014h-Eu
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:19:46 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDIfJ-0000Gu-2D
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:19:46 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so984061pjd.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zlWWI91i6rQkNBj1sgrfBtYBFXYAAqNcoNe266kSgvA=;
 b=fekFMaffFrmRP5RDYTpjBME0o465xwT5qO3ifL4oV0l65nHgCmPF6S0g3VgM9QMUXp
 8/zZqSP9zjwqcJkcE36XVEGTkcLHEkSuCYzJfb75J/SO9IRITmGBZ3ewExLmxDHK4cvD
 O2k3SjnarnAkmXmsf0AlSTuUu4WaS42RKT3KTsfPglk0RymlxpNNHkBO2o3KTRFVLeJC
 746OIxTjxXIsAPvkzDMKgbDxVznX3kAjCOnRo/LqfXF9SPI3YNj7IT4YD3hwaLeAPnZd
 Qpn7baDguQ0Gm85NZsQ9v6gPXArGRdjNgl7BIvR1TG4hqkktCNnz7Eqha+l297G8jAn/
 gpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zlWWI91i6rQkNBj1sgrfBtYBFXYAAqNcoNe266kSgvA=;
 b=vcJlf24V54F5+8ztQUbMA2QZVbcRZbDzzx70nuIVwqHTII745jIEv7Nj7NnByZrgfb
 YOD7DFl71+BdzuHShqzz6Yi7GiTOmfXSLrY7fgSxzA9Z72B+8kRwbKfKmcz/TyUrKUw/
 1ZQJ/PraWNOFPEHjQynJbpHt3OCYLNpAuSYzpVgxrqutaH2Xe+iHNF7k7u+wCPHTCPWp
 exic77KH+sGzIBdXW+Ijr0gYhGxGZUs7/q1ob2yj6bweXDOloF+m+D/j+Bm5br2uoicj
 NPkzQO/4SfF47eKt9JQg/I1QN94JDwozZX24xX2yv+62dLrKbEmmaLNEjweQazwRJsuC
 VDAA==
X-Gm-Message-State: AFqh2kqCe4Uj6e6voIwW/J3DWQQHKmyXpXqPgBzM0Rd/gXiA8sAZQ6zW
 ro8Rq6PfuifpZuvM75ELsavTKQ==
X-Google-Smtp-Source: AMrXdXsj/Im8lHWYaOWRYHormgRNXgzPoBUb2t9f2A36eS2rejbVPOLf326tex69LvlRQYxVd72cVA==
X-Received: by 2002:a17:90a:a4b:b0:225:d285:acd4 with SMTP id
 o69-20020a17090a0a4b00b00225d285acd4mr42635636pjo.32.1672895983209; 
 Wed, 04 Jan 2023 21:19:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 ha24-20020a17090af3d800b00225d92d69b6sm441580pjb.29.2023.01.04.21.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:19:42 -0800 (PST)
Message-ID: <6cf2f6fc-fdc6-6903-4594-3f9b7be3befa@linaro.org>
Date: Wed, 4 Jan 2023 21:19:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 27/27] target/arm: don't access TCG code when
 debugging with KVM
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-28-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-28-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
> When TCG is disabled this part of the code should not be reachable, so
> wrap it with an ifdef for now.
> 
> This allows us to start using CONFIG_TCG=n (--disable-tcg in the
> configure line).
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> As I understand it, only a small part of the ptw routines should be
> necessary for use with KVM+gdbstub. But I don't know enough about arm
> MMU yet to make that distinction.
> ---
>   target/arm/ptw.c | 4 ++++
>   1 file changed, 4 insertions(+)

If we ever hit the assert (and I can't imagine why we would from kvm), we could adjust the 
preceding test vs in_debug, which would take kvm back to the setup we had prior to the 
rewrite.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

