Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21A67F336
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZBz-0004Wr-VI; Fri, 27 Jan 2023 19:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZBy-0004Vy-7f
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:35:38 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZBw-0000Jg-MK
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:35:37 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 e8-20020a17090a9a8800b0022c387f0f93so5209853pjp.3
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=13MYius8ZqZi4woYYxLpVgeITbNSUMDUq3cf0HeqBHQ=;
 b=toQsrNcpNVOKs6JR/IdtkWSPoz1EPvUddEXI3raj6ferH8mgRLdnu/rvX/isamw0eT
 ww5YH6c7XDFzebSGZwr5yE/Nh6pchGZR+EsvA0seeozRV4X7/JcYVO1IMJ7rDDTBIZqM
 dk9L7LnaKs4s4UkZhSKt3FzDtvgDv39yQm6TVoMlMUtbTc9twCz4K18hFWpBkoyEEgDR
 tweWGppl1Vv7EiDSGnLrQULpkY6FcyewiBz1u74ZK97z78UBho9iwdos3vzLhw1GsrvQ
 TNtXVqBGPWO8JrHZu+6v05dJqN72pMipnAcKykXCHbKtghCDSxCEnSULyPes62sRzJQC
 SOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13MYius8ZqZi4woYYxLpVgeITbNSUMDUq3cf0HeqBHQ=;
 b=wT65cpc0uG2VDs1yrgInJiBGUZrufKGQVFl5KfYio2fKEkbZ9IOx7jxLzroDBT7aR8
 BA6epIZXEr7VITc1mbHXWlQ14kP5rtXCEKXwXMTuF+aX5qEkSj/Jwng+6bhcuAvvJjlY
 iT6LH6t2HlboCtVqjBTaDRXCRcAwRHn4UlZ4b4EkI/ZKslsqAW6OzvYw0dbS2KV40VC+
 3mI+oMRrxO2aFau3BvGb9F1xifc5xfey301or00XdQFoUb7JeaKfuQfKqxkpME9vbXa4
 yG1hNZrV5UlW4RT1JyNdYTPcrISs/xZvGK459BIR6XvJEcq1bL1G0LWdP5QuoCH7iLhL
 h7Ng==
X-Gm-Message-State: AFqh2kpGUwHYofDuWQ8wZm+gqu3kcw4EWbsfTFve2eRf0nV6JI7lIxQ+
 gv56F3ckjdvosAjePZyMlgb/pw==
X-Google-Smtp-Source: AMrXdXulNx3skpeDMn8l+pbsSp33YwQPkus7iHjT6AcuAlwSJ/GU4yH9s++VPx91FWU0I8rA+PGeEA==
X-Received: by 2002:a05:6a20:4386:b0:b9:3cb5:99c2 with SMTP id
 i6-20020a056a20438600b000b93cb599c2mr37613946pzl.17.1674866135225; 
 Fri, 27 Jan 2023 16:35:35 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 f186-20020a62dbc3000000b0058a72925687sm3156152pfg.212.2023.01.27.16.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:35:34 -0800 (PST)
Message-ID: <9508d39b-91fa-919d-0bd4-622930eea003@linaro.org>
Date: Fri, 27 Jan 2023 14:35:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 15/16] target/arm/kvm: Disable Realm reboot
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-16-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-16-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> A realm cannot be reset, it must be recreated from scratch. The RMM
> specification defines states of a Realm as NEW -> ACTIVE -> SYSTEM_OFF,
> after which the Realm can only be destroyed. A PCSI_SYSTEM_RESET call,
> which normally reboots the system, puts the Realm in SYSTEM_OFF state.
> 
> QEMU does not support recreating a VM. Normally, a reboot request by the
> guest causes all devices to reset, which cannot work for a Realm.
> Indeed, loading images into Realm memory and changing the PC is only
> allowed for a Realm in NEW state. Resetting the images for a Realm in
> SYSTEM_OFF state will cause QEMU to crash with a bus error.
> 
> Handle reboot requests by the guest more gracefully, by indicating to
> runstate.c that the vCPUs of a Realm are not resettable, and that QEMU
> should exit.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   target/arm/kvm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

