Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2663BE08B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:22:23 +0200 (CEST)
Received: from localhost ([::1]:33452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wGd-0001O6-1t
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wFn-0000WB-0l
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:21:31 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wFl-00051O-CV
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:21:30 -0400
Received: by mail-pg1-x535.google.com with SMTP id 37so608003pgq.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p4YUaGyKEovYejYPOWkDLL8hDwZcVolhUOJwnZV+Jlc=;
 b=zfPFK13G3URAMlpq/CPsGV8ETqsh7kh7QBYgiq0fjul5o2KM39fR4FBfaiwhyTa59H
 oZzXKJ+9o0sz5CgHKUJec5g2b5kBhmijgQgC/p1EoWDyYseDKR6kpM0Uc+YjOL4XfOIm
 +oBCqzw9c07Lc90zHYnvQqS5ZSBwmJDVnXa0x/B+TVY/nQ6Q2eXrhxi3yDnSiHHkyese
 Vwvo8i1RpYTsAVc52jar2DmFDmB3fen2iockKz4gaSpp20GncwkXOse1nDY/um0xNLi/
 zlgXThyXsYivjczIlfV5B0yBqxCx3ASqWmpVfzyBCByGqfbw1aIGPFMv6mJzGPhI0Q3o
 NKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p4YUaGyKEovYejYPOWkDLL8hDwZcVolhUOJwnZV+Jlc=;
 b=qdSSVzl7rIcBf+I62c8WRCYCRyqAEVApEuVOdyKbzlF4X93cnRwt6F8PlhY0RlEN96
 yGE10waFLuBm5rGZ6l/EtaTLOBZbn3ZEybSJJwV9S5p49rnVcBmSeJoGpNAznlXHR1Aj
 w0JbDjTxlQSdqKWwkBELhdiqgg4qlGiBYdbVyHWejvb8qpfylQWi/b9B8c7mZj24eW6n
 88riKaEPvDB7rx6KaPn74IgsPoHJC3SjPBFR009c87On59BU3lIWWrZbkhzmjX23lPOn
 rUa++nqRnX2r1SAgQyulkGrLdDJEO6C2Khoz+CyQwEFbg78dJsHIlXFlGv0rSI6jPduj
 QJiQ==
X-Gm-Message-State: AOAM531PfgPkpqd36HWWf2uPJqkCt4Q7zMJfWhllEWlNcpGYtDtATpF2
 mdCaRiRmsob7aC6AEgDzXZa/HQ==
X-Google-Smtp-Source: ABdhPJxhmSY/xM0LCdd0ooRO3PvhrifnBlAcBfhyQsLNoDgFIELFaq7ch6/Rm7T5XvhzZmBiW2NAUw==
X-Received: by 2002:a62:6444:0:b029:321:2f4f:b03 with SMTP id
 y65-20020a6264440000b02903212f4f0b03mr10466202pfb.60.1625620887994; 
 Tue, 06 Jul 2021 18:21:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g12sm4334173pjk.25.2021.07.06.18.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:21:27 -0700 (PDT)
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd71af0c-ef7e-4a4f-9e6b-aff09d05be34@linaro.org>
Date: Tue, 6 Jul 2021 18:21:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-4-peter.maydell@linaro.org>
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 3:40 AM, Peter Maydell wrote:
> +    case 0x52c ... 0xfcc: /* Reserved */
> +        goto bad_offset;

Any reason to not just use default for these?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

