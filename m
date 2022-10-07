Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1B5F7B48
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:18:12 +0200 (CEST)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogq38-0004rB-SF
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogowT-0003Id-Cy
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:07:16 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogowN-0003Sv-7I
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:07:13 -0400
Received: by mail-pg1-x52a.google.com with SMTP id a23so4877872pgi.10
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3NmEpfxd68QaPVEoyF1BWl9n9rzCz0X9Ceq14r+tYdk=;
 b=oeilsTaMVXhw+OMrgMgliqKBh49E+1GcQ0Rk80IT5lw9QiExcAXADacC1uH8ooeZ3E
 tmmEyFhUATO2sRUVrP047s6P3KA1xx+ffeFgQeYaJ76we94G9Uv58K/C3fZ/N7ERKosx
 cwilRMgK06dtweFTksNv1qyNuWPN3HiXgQI3O1VSIpYUcDsGlyn24V69BwCtwBzShryv
 WCDwDcBNsBq5wjuJGrCph6t4Gz/uJxzkQ5PiYIiFkg+BGKvO1wpfmpZPfra6Ei3WgamC
 FZ4oecVb525UQ7G5NIaqh9N6WDxXqDog3bS4/1HtUu4cxaWjyY8frESgiOfxY5/AiQSJ
 cphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3NmEpfxd68QaPVEoyF1BWl9n9rzCz0X9Ceq14r+tYdk=;
 b=3Ng6tiIxWUq6KFiaFPCvjerQzmXNuG38J6yQM1739surXLqeoOKFD75jCap1BjtOXf
 xR6kp3TSdJvV2jbf/a4AHmMG7WGgdYhcF1unDg0oNVJA4Phe3cBS1gPpYpXgizEjEjyX
 lJor6B5CGP7zkAt3tQElcqy/GW9MhCFDg+f3ayc4CYm7FuCrCzRKYsh02PoBcTwRBGEC
 RfKu8huOuGsLwMWcHGN1PnOz64AL1pNvLx0h1yatMPE/yYV6833Wf7SyfOiA24Mrwwmm
 gwphaEnedzZyZu6OvFiqDxUKl+mUZPA9M+kfZuYWn6B6uaPJJCH4EZQgdVpTCILbaogm
 qPkw==
X-Gm-Message-State: ACrzQf2LQr9tJiPVhf/rLwbQJbZ6voEpvfk4pMB1AdCVjmfez4V1lHBN
 WU7TfXdJ0qAhI9t1RI3fncVaqw==
X-Google-Smtp-Source: AMsMyM70SbPd0ncJ6bK9cmb6kQyxVLhbE2OYwrLObBkufV6X5/7HuqhL3SwqrhgLLCrj6kkQNIYe1w==
X-Received: by 2002:a63:5fc5:0:b0:45f:5c7a:8007 with SMTP id
 t188-20020a635fc5000000b0045f5c7a8007mr1513314pgb.10.1665155224996; 
 Fri, 07 Oct 2022 08:07:04 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a628606000000b005601e974993sm1740950pfd.25.2022.10.07.08.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 08:06:58 -0700 (PDT)
Message-ID: <037f23ae-5ab9-32ce-0ee2-94f54c41d954@linaro.org>
Date: Fri, 7 Oct 2022 08:06:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/4] Idea for using hardfloat in PPC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 aurelien@aurel32.net, peter.maydell@linaro.org, balaton@eik.bme.hu,
 matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
 <f78ab23d-6cab-9b60-37c4-7486546c6a0e@linaro.org> <87a667iw84.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87a667iw84.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 10/7/22 06:42, Alex Bennée wrote:
> Is ppc unique in not persisting the inexact flag from previous
> operations?

Better phrased as "having an additional per-operation flags for inexact and 'rounded'", 
because ppc also has the standard ieee sticky inexact flag.  But yes, as far as I know ppc 
is unique with this.


r~

