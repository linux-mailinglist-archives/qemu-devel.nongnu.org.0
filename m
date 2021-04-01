Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1473510CA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:23:55 +0200 (CEST)
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRscM-0002H6-W4
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsUU-00021f-F8
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:15:46 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsUT-0000aS-1f
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:15:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b9so881158wrt.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ixhH8+tpc7+EjgYKOszroB8cW7uLwr6qZZnKdi7Z2RY=;
 b=O1t7Nt6NjK+iUfoejpUSEJ3bZJguykKPHP8LkXqLc2G1p3ktJ/Dr2nwKlTSWzzNhSA
 9bo8Aai0wKkiplPJJV+W4hzDM0XSVdJHsx1HEK+Cuhha5StjA1rtGoAxaa5TORAtO6fr
 zn/Z7qR4Dia8WQYg1Sqaq1B4BFWFN2zHaqh3X8roJ6n6H3mkiiuL9y7V8h8ahDAUym9I
 203N0jwM/DsmqCiuusQd9buFZm/xZZS1iNzQaQpPycAIffg/MFui3hCPzaeXEF4GPIP+
 ao0meGxGFR0PWAT35G+2/RaJn5q1qWZNWPeqlajtuhFKNPxtPlnWesagnVgU7OGjgbRs
 5Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ixhH8+tpc7+EjgYKOszroB8cW7uLwr6qZZnKdi7Z2RY=;
 b=QDthZKdlXjUC6AHtZymEw7/YtrG0IibIVhfNKz4QCgOjXrowMJxkzrEzkAIjAqiJqi
 BMkoK0fXaDAJj51WWUx02MSaIl2aj7xtOi70v91ebdD0ruIXvUJXJ+n+5JFXrPKefCGq
 bOaDQyZQq486eBVCKxQmi2PvFNDRAUpjP+o4Ci+9Hv2OVkiuzLenutWn4jaDkJRHttFN
 z7OZZBD1dsa7ti1TWU1fhmOxu3jTvjKOuv6DSHt5vFylVuWPy9x632A04wa7q0ABJbC+
 BRKOS6YVj6zW435ME/5PvReuwksbyn2ioCb9YkvfTqdXUPLxqeA1LWn7AUsLEKbcyNc/
 fYZA==
X-Gm-Message-State: AOAM532J8wPuyHi3qzs2db0Y5juEjbWHv9i3gz4eMCX31y07h+z1q3Bu
 VZStv0vDD7mYRjHGxCkxkEVm++biNSOphA==
X-Google-Smtp-Source: ABdhPJwSNgY41TVZ60/Fdw9eb8OHE5BVblxYtqFWuGEXxJ3I6Y/saDtkqlxAxwVa9wiDgyPa0FmIKg==
X-Received: by 2002:adf:f190:: with SMTP id h16mr8178640wro.187.1617264943781; 
 Thu, 01 Apr 2021 01:15:43 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b65sm7229993wmh.4.2021.04.01.01.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:15:43 -0700 (PDT)
Subject: Re: [PATCH v3 04/11] esp: consolidate esp_cmdfifo_pop() into
 esp_fifo_pop()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff28c72d-caf0-709c-7743-7c49fc5f6865@amsat.org>
Date: Thu, 1 Apr 2021 10:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401074933.9923-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
> Each FIFO currently has its own pop functions with the only difference being
> the capacity check. The original reason for this was that the fifo8
> implementation doesn't have a formal API for retrieving the FIFO capacity,
> however there are multiple examples within QEMU where the capacity field is
> accessed directly.
> 
> Change esp_fifo_pop() to access the FIFO capacity directly and then consolidate
> esp_cmdfifo_pop() into esp_fifo_pop().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

