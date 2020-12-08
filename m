Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F42D20D9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 03:32:17 +0100 (CET)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmSnY-0005y8-Er
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 21:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1kmSm9-0005Ju-QC
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:30:49 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1kmSm4-0004dT-Dj
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:30:49 -0500
Received: by mail-pg1-x543.google.com with SMTP id n7so10829219pgg.2
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 18:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b25jymT2pzjlnhcw8EDs+hZnnxvKyVxp8uST1j0t0Bc=;
 b=uT6TSbHOGgSbJPHwSZuiCUNdbWwnt6ecO5ZTfdfN2wIAhCwdHVs3SD+Y/c42UyN+08
 rWLZd89QUunsVah2PyP0FX/kP+BQRUNr/yuXNJSEamSvlK62an6CvDwTs2dHmXKYJc/1
 DkIrmXe3f/3UiTZXGxQkPwSmSyJ/Kj6GoAmbMnXSYBSm2L1DM5rjAEf1eadn38F+bfO9
 SuVICLILh9P1aidHXSkMOZdDYlFaq0AzBZJLGE65oDIg4H+YW+ygRdbwej/B+/6DVvJM
 Ldjd5ELhF61XoNsGk23n47tbVcVtbj75qBQ3iw30dq2Z5d0JJPaB1zMM+8geHJfBRhJb
 EW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b25jymT2pzjlnhcw8EDs+hZnnxvKyVxp8uST1j0t0Bc=;
 b=bxM7zF0r/Nd1tb4ylOwCPQ9AHfidY2Ws7YfSTJNNYboIs3/AmqOTF2fQGnDC9hQZl+
 LZgPptPcjJ0DV3depE2k0og2q3khzJG+AAnUrgvOyGQfhPJxvHUobclTM6+uPGw2s42Q
 i+7wIW2u9+NUVKO+m8d4Ec6vKw97sIazQr3iCpzYmRoByekbrPDiJGK9Bx8udz4Jl0qW
 h1e4yrBdUMGEFYjnToncAUOCj8Mzws+/RHvovchUzHqRz08ysyEde2aQviGaO6oJsxuK
 AfTQTYtm0MJufhR8mh6XG7NLW27KRYugAyoEJkGCdKst35z/OYJIUGJejyRZ6LHgml6f
 aXZg==
X-Gm-Message-State: AOAM532GVqqVMNpzAxC+44IxVFGRMeJCGiO62ZHIznVEnYjPmZY58Xcr
 tQQElYlTZLJEUj2xJ0XebSrLwA==
X-Google-Smtp-Source: ABdhPJyT6389dkeyxe/HDMN8h2VRSRzT9ZVGnAswT2XLc32LZTjdxnhR7zvUkV4YNsdnqBZ1ej8TPQ==
X-Received: by 2002:a63:5315:: with SMTP id h21mr20883587pgb.43.1607394641869; 
 Mon, 07 Dec 2020 18:30:41 -0800 (PST)
Received: from [192.168.10.153] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id l197sm4355932pfd.97.2020.12.07.18.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 18:30:41 -0800 (PST)
Subject: Re: [PATCH qemu v11] spapr: Implement Open Firmware client interface
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20201207073327.33367-1-aik@ozlabs.ru>
 <14ffa53d-30cf-2f5f-d7e-90774bfe8eed@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <8ebff33c-8eba-17b4-b3ac-e5ba7bd2b8f9@ozlabs.ru>
Date: Tue, 8 Dec 2020 13:30:35 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <14ffa53d-30cf-2f5f-d7e-90774bfe8eed@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x543.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/12/2020 22:48, BALATON Zoltan wrote:

>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 2e89e36cfbdc..048bf49592aa 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -175,6 +175,13 @@ struct SpaprMachineState {
>>     long kernel_size;
>>     bool kernel_le;
>>     uint64_t kernel_addr;
>> +    bool vof; /* Virtual Open Firmware */
>> +    uint32_t rtas_base;
>> +    GArray *claimed; /* array of SpaprOfClaimed */
>> +    uint64_t claimed_base;
>> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
>> +    uint32_t of_instance_last;
>> +    char *bootargs;
> 
> Are these really state for vof so is it better to place them in a 
> separate of_state struct instead of adding to the machine state? I'm not 
> interested in spapr but interested in using vof as a replacement 
> firmware for other machines so clear separation of what is spapr 
> specific and what is vof specific would help me (and maybe also other 
> reviewers to tell how much impact this really has on spapr which seems 
> to be a concern of Greg).

This is a very good point, I'll separate VOF from the rest, may be even 
at QOM level. I was also thinking of adding a pseries-vof machine type 
but this is probably an overkill.

Out of curiosity - how are you going to use this VOF anyway, for what 
machine type?


ps: I'll keep the braces ;)


-- 
Alexey

