Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930795B9131
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 01:53:13 +0200 (CEST)
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYcBs-00059M-8U
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 19:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYc9N-0003YX-BV
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 19:50:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oYc9J-0006Jt-Ro
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 19:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663199432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayO1F4YbfKP7PvUXgVPkjQFzknqvDlg070WB4DSANdQ=;
 b=IxeVddoAQTIQaVxnT+b35DI5+7FGgpQJgeQz6n33Ah8uEsA0Mo7PCAHQOkGpsWVf8g6/1T
 J6GjfFXT67MyqsrwyOw9AdJcELd1hWtPGOPyxHG5++kexo5dUzKKRZBt9tPTHHHl/18KYh
 kexb0HMPZ0UsK+y5f7Uzy3ru6obmfZ4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-2rcO7H3zPLmrzk0X6KyAIw-1; Wed, 14 Sep 2022 19:50:31 -0400
X-MC-Unique: 2rcO7H3zPLmrzk0X6KyAIw-1
Received: by mail-ed1-f70.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso11995654edc.21
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 16:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ayO1F4YbfKP7PvUXgVPkjQFzknqvDlg070WB4DSANdQ=;
 b=N2e9A0bKNiDVnlPS8qGFRQmd9thAGvBtnsO+FhkJngDraFpucZARWKjbDtR7qzwB0p
 SKFHCtsNO54u12Etm6dt86Dx+ikFQjKliP99xT8QwArP/ELyPcFfhENnKFxvAR6gxHrD
 ZKh19uDQuogBMu2cAGNvwHdCvIrKFUNM1seSzeSUy09L0qfAWSFbl3OiNzm7Mz9TTlYn
 8Afbq4C0UVy3YOPnv80PD/iVrMT3G/g9shli2/1+Wrh0ZChVnehgcVn1dDmfelKDkEUX
 dEjC1auamB6xCMH4K5mrA7O4R/DgYkITrO5t3bbNrWkTq7WDBZdgFFVvZuoBwHlmYh3M
 7D8w==
X-Gm-Message-State: ACgBeo2UUtI18wXdrCJHRi3N+fOVlxd1j6DbRrPnhKoshseuive8JKrT
 fgdKjyLVWnl5jq8gxHqAs8TUvrH2x8HmWJ8aJRb/bcpoMbZXKz2DLID66QR60y+UYT2pwoqk9zl
 U51oNDvigr0VdCVg=
X-Received: by 2002:a17:907:ea6:b0:77e:156d:b07b with SMTP id
 ho38-20020a1709070ea600b0077e156db07bmr10879430ejc.435.1663199430120; 
 Wed, 14 Sep 2022 16:50:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5rz2N0C8Y61eEDXl3S19F1ZuLb3zkv5VsC8QcqhqQW8thwu5FKKS9JiSSnYGXw8wJC5Plmlw==
X-Received: by 2002:a17:907:ea6:b0:77e:156d:b07b with SMTP id
 ho38-20020a1709070ea600b0077e156db07bmr10879421ejc.435.1663199429918; 
 Wed, 14 Sep 2022 16:50:29 -0700 (PDT)
Received: from [192.168.77.248] (93-38-132-84.ip70.fastwebnet.it.
 [93.38.132.84]) by smtp.googlemail.com with ESMTPSA id
 p8-20020aa7d308000000b00443d657d8a4sm10369053edq.61.2022.09.14.16.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 16:50:29 -0700 (PDT)
Message-ID: <ed0fa748-5560-9ea5-ea06-bc8213b9942f@redhat.com>
Date: Thu, 15 Sep 2022 01:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/2] target/i386: fix cmpxchg with 32-bit register
 destination
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220911222630.338330-1-pbonzini@redhat.com>
 <20220911222630.338330-2-pbonzini@redhat.com>
 <91fe80d5-724b-6adc-ef74-60655c8a25cf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <91fe80d5-724b-6adc-ef74-60655c8a25cf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.583, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 09:55, Richard Henderson wrote:
> 
>   * Compute...
> 
> Why bother passing NULL, and fixing it up at each use...
> 
>> +static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, TCGv 
>> t0)
>> +{
>> +    gen_op_deposit_reg_v(s, ot, reg, NULL, t0);
>>   }
> 
> ... when you can just as easily pass in the register here?

Because dest can be fixed up to either cpu_regs[reg - 4] for high-byte 
registers, or cpu_regs[reg] for everything else.

> We have an outstanding bug report that suggests that the move to eax must use the deposit in both cases:
> 
> https://gitlab.com/qemu-project/qemu/-/issues/508

Ok, so that's two bugs.  But both of them can indeed be fixed with 
gen_op_deposit_reg_v.

Paolo


