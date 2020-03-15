Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07BA185FCE
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 21:38:29 +0100 (CET)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDa1k-0003Qb-G9
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 16:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZie-0006ec-UD
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDZid-0003Uh-VN
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:18:44 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDZid-0003Pv-Oj
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:18:43 -0400
Received: by mail-pl1-x642.google.com with SMTP id w3so6950343plz.5
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tPwZ4NakikcOwfVAMZAy1h09eFvA6fIiEKchL4XH/+c=;
 b=EnV4etukqVd7OmLP+BhkKk8weN8D0vlQZVmEMHx2UrDW+rZucpSJSrh/XBSneukxxn
 ir1riOfWIyVKivQ5ia64PwezK8pVNUAOOJl0Ab1j3JfmoQPCZ/QlwV1YF/mbKh+AmXQy
 QIw4e49PD/gktjD1GyL35NWim+pYdKnFYkeG5CxPUJi7scrnCgsm63oIxM6SoHkKaAD9
 Wkjh/bu8C4kfTTbl99s/kRehq2dhw6EYlJhuiL2luKb3Vi8GOeVuwKkgA68kjJAiMyD1
 gIaMReDynxRKdvNGF6jGWa0Tnt43WiO4yFRKckt6XOeg1ENqOifVdbuU+gasgRZzlpOI
 waag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tPwZ4NakikcOwfVAMZAy1h09eFvA6fIiEKchL4XH/+c=;
 b=Fr16NYV5zha14FXqYZoIsmlwndeFMU4mpaA3HW8RO9xMIMGWM1TUjGpDOB0NVEGwVF
 dJbWVHx/28g9PboAgjarSEgmE9u908CiVV1yH/wo8T7c3LyJM9GqC3NplSTOWRcb1g7K
 AqY+5K+Tab0Za9Q3uTbPC2SAS+Imd00BCvFaqb0CCMv1x/tTIewd9nvh9lOikRxSMAnb
 0BxNrxc6usOa7JL9fuw1EBAkbb6fx4LYwTdO97baOO8rROsLTQ3vFGUK6iF6p1rwAWR2
 0lftYVDFAZ3ZEjU/k1zAunWF2aFl5y2OYcmd4naw/f7Qi6UZBo6dT8DGwm7EQXueW0E1
 RUSQ==
X-Gm-Message-State: ANhLgQ091ZYjjpojWGNm3zKNtXfpJqBLr1u1c/cXGnxw00egY+cvWkW+
 EYj/PCXiV3UVBM92DAumfUdy5A==
X-Google-Smtp-Source: ADFU+vvoMqGceWF21tpQ/ru1JYPityst91oYzA5zXFpXLbhVxqkhKFjGKFGAdvC8Uj0oaFXbnNX6eg==
X-Received: by 2002:a17:902:6bc3:: with SMTP id
 m3mr23984325plt.27.1584303522679; 
 Sun, 15 Mar 2020 13:18:42 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 k5sm17444826pju.29.2020.03.15.13.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:18:42 -0700 (PDT)
Subject: Re: [PATCH 07/14] target/riscv/cpu: Restrict CPU migration to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-8-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ffd75cb7-4b80-f098-59e2-7c24f0e03288@linaro.org>
Date: Sun, 15 Mar 2020 13:18:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/riscv/cpu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

