Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12A2D7FC6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:06:50 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knogj-0007Tu-RH
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knoAL-0007cY-Mk
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:33:23 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:32793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1knoAB-000702-RW
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 14:33:19 -0500
Received: by mail-pf1-x442.google.com with SMTP id p4so7616997pfg.0
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 11:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4ck8LWiseUlRS2fPXnswLkY1AKaKzqxKQ0EJF+oa5Lg=;
 b=WwEi2Z8zd41piT/pvK9zejFmDLl04AToTS4jkCqTGYXRUUGurSIn5t5hd1zZgooQUX
 wlfJvVb9giyo9ykh2pLYxeliu8LTnygTcNnXHseuzwy2dBDNXgu3H2GYBah98EZ9qUUV
 PKRmTLDKnBe7EztBviclQa7WjJfNHleVX05OkfOeq++5PJcJFg1DZjvEXwhY7Lk4nlkZ
 mgL+dSCbrV6Z/UdZbxLKxNwBLvbCx3CMmKTMRCB5ik74joS01W4OFZuzsRhgGxG+le/E
 MLthO/QRrTB9gaxtyEkhxeS1t1hzTOKBQyEVhUkaCyRJ9P2V6bnrqmy0T31KgDOeisnV
 bEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4ck8LWiseUlRS2fPXnswLkY1AKaKzqxKQ0EJF+oa5Lg=;
 b=dzXx0elZSwUYp+8SQQ6/S788LP6FniVJkiygawQ+d/JSvWqDFy1EOz5F/h9UYHz0eL
 xzckEXu4Ejz96nIJQg4ZsFGEJPNdOxaL/4cx+3HjzlbuT9CrPxNcia4pkKvIXTOYcTli
 W/jaYYcsc0xFxXKsLGDGXzDLUH8v0Biqu+hZZBIe8j+w18rKPBbFgIRSdhs58GRlJmrg
 Kc1rb8Jnb2CCpkqpc6QKB83jbPzQEczA2oKzFoHfW5dctd5O5GVO+wODEF6IQ2bQhRGC
 ppf7PV3/F1W3D95ZEe3HoyCJHTRbh4SMvH0+ISV1t1hXSxjkCj7gv+FAmJXYdAXHQMQu
 t8qg==
X-Gm-Message-State: AOAM5304G90eU4vP2XCmE6es0eOvoaFIWgbBHBHB3gBbenAbJfbUUVeP
 S6h1lR2JlRoX88IoIkVzMat3uA==
X-Google-Smtp-Source: ABdhPJyVTBEGLXi2u4Mjz823lROsl98UPMlUBppq43fQ85IRz9XOMflFQlTQQs7zEu/CyNgPCDR0vw==
X-Received: by 2002:a05:6a00:230d:b029:18b:9cb:dead with SMTP id
 h13-20020a056a00230db029018b09cbdeadmr13029976pfh.24.1607715190024; 
 Fri, 11 Dec 2020 11:33:10 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z65sm12101371pfz.126.2020.12.11.11.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 11:33:09 -0800 (PST)
Subject: Re: [PATCH 1/2] target/arm: add support for FEAT_DIT, Data
 Independent Timing
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201211051359.3231-1-rebecca@nuviainc.com>
 <20201211051359.3231-2-rebecca@nuviainc.com>
 <6dd32a22-e3a6-db57-fc5b-9a3da4e1a709@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <284b9f4e-55b7-81a3-f1c5-7f7b6d0c9784@nuviainc.com>
Date: Fri, 11 Dec 2020 12:33:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6dd32a22-e3a6-db57-fc5b-9a3da4e1a709@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=rebecca@nuviainc.com; helo=mail-pf1-x442.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 7:08 AM, Richard Henderson wrote:
> Alternately, or additionally, TCG is outside of the security domain (only
> hardware accelerators like KVM are inside), and so we may implement this as a NOP.

Thanks for the feedback, I'll send a v2 patch next week.


Is the comment in target/arm/op_helper.c:397 still relevant?


uint32_t HELPER(cpsr_read)(CPUARMState *env)
{
     /*
      * We store the ARMv8 PSTATE.SS bit in env->uncached_cpsr.
      * This is convenient for populating SPSR_ELx, but must be
      * hidden from aarch32 mode, where it is not visible.
      *
      * TODO: ARMv8.4-DIT -- need to move SS somewhere else.
      */
     return cpsr_read(env) & ~(CPSR_EXEC | PSTATE_SS);
}


-- 

Rebecca Cran


