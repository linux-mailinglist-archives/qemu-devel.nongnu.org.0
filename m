Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ECF58A41E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 02:21:38 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJl5t-0003H4-Pl
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 20:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJl4k-0001dS-13
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 20:20:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJl4i-0005r8-4t
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 20:20:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id l64so1353721pge.0
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 17:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=28K+JLIxMAw/ud6crVH6+SBchG8dHL/Ih0iPmrFKUp8=;
 b=nhZ1kc2lse7ORlH4o7va3TfbnI8sxkJPK4ruS9I2giG+z67v1H1PD96uK7Sa8eu5t0
 vk11ntVZAxCUGVtep/iJ4ybSC7rVFtUJSbsqrAVPp9fveuJmV2WXnboVvvzl7bEeEZl9
 BN060jtJC/0C3/PDfxlagBncDXstozM4t75VRg3qIKtDkncOq5Vyct/+WyKTXrHNzFBA
 KnoOVFN/2qjWf+UwKlfxKnnFmqzExfnMYBY6mfYjJmxuMkYyVDOEBIRDSfJPFuRBrHqy
 HnsiYBdqrTHhfQAP+19HJclsnUbk/FSqplLrQYNQVO/D5N6GGAFLHGgqLQxxp5RdPexF
 BIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=28K+JLIxMAw/ud6crVH6+SBchG8dHL/Ih0iPmrFKUp8=;
 b=7wZsu+tsofzbtpWxVR1Nw4WBHmcwoK/jEOX5z/BNwaO+EV2stmIOQZz3lmDRXeg4v8
 e2pPYzhlzKcmqiBaUOof367O5YAsL/q3xcr+NC5cwxHAzWhhAvg0Ju+hBBdTIdhZ1dRA
 1TH+s35kXbCzcWn8rqCjzO922oAeTl6tBA4Y4vAzI7iRvl3GsWxwa9BiCZeLrr2PQLpn
 2AmAyES2i5uy2CwpbCmK6DGecertTZUjxSljPa/vS8AspYoJKvqfa71mSf1EBFHrVH8I
 TBv/ILUTCLZ6CNzg3rNJ2iMlnf5J4yp81IK3x2ac70IDoA2y0hjNOi3XUosslgOiNWKP
 jDDA==
X-Gm-Message-State: ACgBeo1z/W6J56ZB93HxartSmy1ebugw/hKfJ62K0GFii570EqJNIPHf
 TzKArjp5AnTOPZoUH+wroqBfXQ==
X-Google-Smtp-Source: AA6agR7o3D9kqOFQK/r869NGdkwQ2rEGd5/TMdBKFbuRjIFsfuvF3guANViYEAUJ15w2WVQzhPf6FQ==
X-Received: by 2002:a05:6a00:80b:b0:52e:c38f:f2c9 with SMTP id
 m11-20020a056a00080b00b0052ec38ff2c9mr91361pfk.66.1659658822733; 
 Thu, 04 Aug 2022 17:20:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:7f4d:e9ce:ef99:81bf?
 ([2602:ae:154e:e201:7f4d:e9ce:ef99:81bf])
 by smtp.gmail.com with ESMTPSA id
 gd19-20020a17090b0fd300b001f553d55a88sm1756845pjb.18.2022.08.04.17.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 17:20:21 -0700 (PDT)
Message-ID: <a4688ccf-a8c9-5e7d-f570-001b417a0025@linaro.org>
Date: Thu, 4 Aug 2022 17:20:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL for-7.1 0/1] Block patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org,
 virtio-fs@redhat.com
References: <20220804190258.20226-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804190258.20226-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/22 12:02, Stefan Hajnoczi wrote:
> The following changes since commit 2480f3bbd03814b0651a1f74959f5c6631ee5819:
> 
>    Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-03 08:32:44 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 7b0ca313647532a2c7007379ff800c9a2415c95d:
> 
>    virtiofsd: Fix format strings (2022-08-04 14:44:25 -0400)
> 
> ----------------------------------------------------------------
> Pull request
> 
> - Format string portability fix in virtiofsd


Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Stefan Weil (1):
>    virtiofsd: Fix format strings
> 
>   tools/virtiofsd/fuse_lowlevel.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 


