Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6E6511AD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 19:18:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7KiQ-00020G-4B; Mon, 19 Dec 2022 13:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Khx-0001y4-6t
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:17:53 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Khr-0007Ml-N7
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:17:48 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x2so9791788plb.13
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 10:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kede+k90nt+g8rrNoz3LyHBHIGT642ORAAmGVcb0CVE=;
 b=xT7LWPPmUtnZ7BEJ+LzhBJlOjHL2zaPrxRa2D/tWHTzYSIBs8rP22rnvsyhV2zInTR
 ALm/YMq3ZJ8YU30RRwmdcioi8SiZcvchJ1nVqJ61Tp2eYGVOvS9J/OU5r6O7/EkJBfrs
 Dqzd3P3SqpwzOomYdgveg9QYDtSlLTOnYnj5Akybyb5zvlnttK6p9+2khN5rhY5lsXD2
 xC9qNJwgcc0yBi2P/Y35AKzEfInQI8KdPaL54Yj4G12RBWZMVD3WbzHHKfTSoM/VKfie
 mFbJncetg+jbPAF8J8c1RG6KbROayR9imtthhft8YgVCtbsa3U4gkaWuy8dIjK3DTVI4
 aRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kede+k90nt+g8rrNoz3LyHBHIGT642ORAAmGVcb0CVE=;
 b=MrPMKctueHVczS1xpsCADrhUA0mvzw5Z3rmBFbRH8D11S7/GXmsF3MruT8wFlAqJKD
 UUVdDOvkCb5YK4b7mNO9yWd72wvjn4vZ2F6ejaqlc2ddvaswZ+guACLtLOOKvO9+HxdO
 mdCDKcVzEmrlF9q2P97oDG1C1nS3X9cyNlTBXpL5sfdJxTQ7UWnYiuBczik0NF/hLice
 b2Y2J9o92pOe/zzkvYgdJJp7KLT3SMrkOikcdFuuPpS8aK+Grsg3M4DpX0vDH5cRWngu
 5taxPAeSmYaZ5Py9WGlaydbHuw98U0ur/60fk8ZqS2OapaZlGbXGtghMpAC8Mdno0EUT
 swRw==
X-Gm-Message-State: AFqh2ko/j5s7EmC93pOXFkAPkCJy5pKdzYGmPDetMnC5mv35zCBRM9NV
 QyMp+HBS58bNmrFXy9Fwe09ZrQ==
X-Google-Smtp-Source: AMrXdXv7rB0DPM/iGtoN9nBBkfAV+KARIqhcjYbJgGH3bRmPKfyaSyP0M9tusQ9//z1m50jVKZgZXw==
X-Received: by 2002:a17:90b:88d:b0:223:9b0d:15ab with SMTP id
 bj13-20020a17090b088d00b002239b0d15abmr12756365pjb.12.1671473862198; 
 Mon, 19 Dec 2022 10:17:42 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a63f30a000000b00470275c8d6dsm6572918pgh.10.2022.12.19.10.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 10:17:41 -0800 (PST)
Message-ID: <28e7c49a-88a9-0268-9c21-859a1f5b643f@linaro.org>
Date: Mon, 19 Dec 2022 10:17:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 01/27] tcg: Fix tcg_reg_alloc_dup*
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-2-richard.henderson@linaro.org>
 <87y1r3jsr5.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87y1r3jsr5.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/19/22 07:49, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The assignment to mem_coherent should be done with any
>> modification, not simply with a newly allocated register.
> 
> What exactly does mem_coherent mean in this case? Is it that our
> register store is potentially out of sync with live values in temp regs
> or that we have memory loads and stores in flight?
> 
> I think it would be useful to add a doc patch for TCGTemp do specify
> what the various fields mean. It would certainly help reviewers that
> don't have it committed to memory ;-)
> 

mem_coherent means that the register value and the memory value are the same, so that if 
we must release the register we do not need to save the value back to memory.


r~

