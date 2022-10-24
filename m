Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5E60BD86
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 00:37:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on62X-00061Q-TQ; Mon, 24 Oct 2022 18:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on62T-00061E-AV
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:35:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on62G-0000Sp-AA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:35:10 -0400
Received: by mail-pg1-x534.google.com with SMTP id 78so9834423pgb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RqRsRg3JTj2eLILv/f6DUwhHjb/VUS1cRCK2PjuP9N0=;
 b=kCLv9RBpjx347s5GS2vbdM9nf7flJ15yo4rwK1M4SQYK50rl2+csYbXp1algJAtNYr
 llCWb7lg22Zx4DSyGe3o2Z8QWW538y3umlUoU3GL/2hZw/AlkoGh5ixLYWvskUhtX7g+
 /7bEhDhPGHfRyKpUhdbAqllDhWjOUztv/tYiny4nlje6Si8ZY//hOM57YNW26XAZUsiu
 kYP8znZuslS+pf7+7CdhWYqXe4L3/4Kx5djgdukNFPDUnIzpPx2sbCbkmsfNmqT7UMdN
 Fw/ue3sXpZ1xLojjNWzcVZwoMilpdwFa66+bjkqkShzbZgccmoRJvAthU7Zokn777XML
 n7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RqRsRg3JTj2eLILv/f6DUwhHjb/VUS1cRCK2PjuP9N0=;
 b=XlQH0H06dlKZ0R3V85fl7UIhhxWGUKvoa/N1jn437cM+AH1mdUHHnmxCoGnOcq90JN
 4ww2Ql5GSy+QNJ3XqF44f11+cAdKeYuU8RMvdUcrtF348e6zWSmUt8vSXPT1lQvSf36Y
 etpnXN+GIKnK/KNQfDaYc88aZYcJFAMbyCWGqIutOeH/1j2smjQ4HLu65jBTnvID/5Cx
 ikqh521SpRmZ9FTHoXr9AbUaIlep622Vu4sRivrOjjghmmQGPgkee1E4l8nAm57zhkem
 XLQnDFiNeYdqoe9FQsAb4Xp6WqYkElC0kCAguyy7S9cawh+U1Wt/XTkanFe/WTRKtIjC
 ELag==
X-Gm-Message-State: ACrzQf3lBkIP4gWnLJWVdhe2LSqs8+GAyk9Fu4OMOH+XQmq69pTNXGu3
 +Kap08YWIb1ogBwtJWLLz0GACg==
X-Google-Smtp-Source: AMsMyM5AV0Hf7dp6GJwcPZXCVLj1IBHUbcGBOwENFgeDgSyW/APvrxrnJA3KBKOhq7I/1HMSM6wzKA==
X-Received: by 2002:a65:4c0e:0:b0:46a:eeb1:e78a with SMTP id
 u14-20020a654c0e000000b0046aeeb1e78amr30183062pgq.193.1666650906796; 
 Mon, 24 Oct 2022 15:35:06 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a17090acb1800b00212d4cbcbfdsm345109pjt.22.2022.10.24.15.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 15:35:06 -0700 (PDT)
Message-ID: <8c348149-6edf-c6f7-f539-d40a4479c46c@linaro.org>
Date: Tue, 25 Oct 2022 08:35:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3] linux-user: Add guest memory layout to exception dump
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <Y1bzAWbw07WBKPxw@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y1bzAWbw07WBKPxw@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 06:18, Helge Deller wrote:
> When the emulation stops with a hard exception it's very useful for
> debugging purposes to dump the current guest memory layout (for an
> example see /proc/self/maps) beside the CPU registers.
> 
> The open_self_maps() function provides such a memory dump, but since
> it's located in the syscall.c file, various changes (add #includes, make
> this function externally visible, ...) are needed to be able to call it
> from the existing EXCP_DUMP() macro.

/proc/self/maps has all of the qemu mappings in it as well.

The page_dump() function provides exclusively the guest mappings.


r~

