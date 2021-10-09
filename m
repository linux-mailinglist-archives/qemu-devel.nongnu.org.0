Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A908A427BB5
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 18:07:07 +0200 (CEST)
Received: from localhost ([::1]:43768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZEsL-0004Dt-Tb
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 12:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEnE-0008RV-JE
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:01:49 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEnC-0007Qf-QD
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:01:48 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q7-20020a17090a2e0700b001a01027dd88so7225545pjd.1
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 09:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4ZnxMcRFXRqF1AWVy66zEtgRk4Sf+0u63Ewnlrj2eVA=;
 b=Ix0kLadaU8dRUCLDPg/4GDe1m1yMQVNy0YhmXkPX4289Qchq/OhczSZwR+csBIFLO4
 DVgqPlP/tni/1vXVzPHL5H2JfRQ63qnnDc2UdMWZV/nr3QuKbJLTVWNJBIWxqNPsYMk5
 gbk2eXVGU+U06ZbO/jbh2+FucLiHN3I/5YyBTa9bGjtOhPdrhgyKwgu/0B7lzIN6/duU
 UFj7sQLmLOkaUkL8E22HOD+05dtEQY+73R/SzBZx6QCeQVabaHz11UMr2l92zaIFnKHx
 2wiD4AIjavbkDs/lo2yLNyyf0v9BRMQFipAQ4b91mZtbY0/N3N6kkF/aKdqevJ6RDtLW
 4j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ZnxMcRFXRqF1AWVy66zEtgRk4Sf+0u63Ewnlrj2eVA=;
 b=kD6zWfgu+OIbqXeZyrHhthoq/8+9Dlw0V+GjxbyrCwMLUGexaMj71nTzvEyXYZR/v+
 4mjgU6DXja53nCk/IDeBX2jtsONDz4IsxQlHG35Kd4NWx8y0BXNxC+KP5O9T2lXP+jxw
 j9TSWUpET/mx3hPEtmrWBmf2xQ3IwdgiYJzjItCRLlYBc6Ix2o5cpQem7wuj6LssNHcc
 FISWAaaE3Wv3bg6ygjk5igReqUVmcrqIij2Dhkw8ivhMjqCchLJx69FagIdxN1QIsozB
 PsoGRXpgBkiUnevHS6KmXV8/Ih4iMiWWLHvwpUKJKDQxv1lScjTpibb4GqquKPayY7Za
 OsCQ==
X-Gm-Message-State: AOAM530thP6JkwnGHjfW/bb8ZoGwERWNipPQB/26ifUgPxuaar1tE2g2
 XfWfdpA3BIDrGrTpjoNE6qxvaQ==
X-Google-Smtp-Source: ABdhPJwK8clSccKQAXyjG8H831ORHp2drsucxjyTq7c12dX/KXrK9tM0PBdCKufAj7/70YJe9nX7jw==
X-Received: by 2002:a17:90a:b391:: with SMTP id
 e17mr11678863pjr.137.1633795304390; 
 Sat, 09 Oct 2021 09:01:44 -0700 (PDT)
Received: from [172.16.83.58] (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 22sm3043221pgn.88.2021.10.09.09.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 09:01:43 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] bsd-user/mmap.c: Convert to qemu_log logging for
 mmap debugging
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a184459-83d8-0eb2-9de4-bea2b0aaa5f9@linaro.org>
Date: Sat, 9 Oct 2021 09:01:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008212344.95537-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: kevans@freebsd.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 2:23 PM, Warner Losh wrote:
> Convert DEBUG_MMAP to qemu_log CPU_LOG_PAGE.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 53 +++++++++++++++++++++----------------------------
>   1 file changed, 23 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

