Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBE304993
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 21:10:00 +0100 (CET)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ueu-00061G-Qr
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 15:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4Ucu-00057o-FQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4Ucm-0007QE-M1
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611691659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13AkCue67Y/nuraXEDrcO1lNCVkIKf/X5vh9tOyl5aE=;
 b=eyGVTHXbN12e3YCLN25UOfUCBGl5bmf8JRH9AODRp2GkXee3NVITDanU3PLnfWVa5s17gN
 oYOnGSJHqMNPwETbLwka8zXRm4YWaY8XZARghaXw9Ln/aZZhY6MRlCksAR/T9iPDAtQRJR
 svLdF8x890MTvAf0Q8rUq3mG5aFVtfw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-C5RkYToPPLC6k3o8lYZmrg-1; Tue, 26 Jan 2021 15:07:37 -0500
X-MC-Unique: C5RkYToPPLC6k3o8lYZmrg-1
Received: by mail-ed1-f69.google.com with SMTP id y6so9938132edc.17
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 12:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=13AkCue67Y/nuraXEDrcO1lNCVkIKf/X5vh9tOyl5aE=;
 b=V+bxL1s4JI/cEH4TFN5+ZQacxTfOTTznkjViUaTSM5g23ShdgIpbzwtAy3OXflbS3s
 eADwXiNZK8zZfqjVbpcfIbUv/7+pPpHTWFTPvAnfk7jBFrmVtY/wmWPtmcu4a8yMbuys
 4VbbPEpywFREbNR2XyGfmF9hj/59cAhUABwhMYlr9Liqm8cRvuN40m2CEIvF2nG5vY0u
 oT1iYBQIJ/hCxI84aghoHtuNE/IQkwhuKf+UvoVTggyj3/n8OBJDWKA6SGCnxxOazqWf
 a4x0E0+W2sV0rI64UX7C3mnMG0JJ/pLnq7b3aqmN7YBwsEvLIT6GFN1f8cK+yy2Zi1Ml
 gPUQ==
X-Gm-Message-State: AOAM530TBb3WVtFY/VZRKR+X697M3Muk64/vpUCtb6nuFxafMrACy4hI
 8ri6igyIRrXnr3MoaK2SYPhiudKTruhdgKzq/ZonlPdW6eaQJ10WdJGfGLnQsLFtpvlRrJg49Ju
 IhO3PfxpdqlY4APf1GcgIwZ2zR3aHW63gbdqXcPOkJUQeEqYEYGT2mGYn4D5vl4g7pYQ=
X-Received: by 2002:aa7:c2ce:: with SMTP id m14mr5704562edp.76.1611691655969; 
 Tue, 26 Jan 2021 12:07:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFyqJOH/RwKQArFGxE1PA/oeeU/dK0ul91Oc0rwdLM4iMLEw53TXHscaP5ra7WtMHFMqEviw==
X-Received: by 2002:aa7:c2ce:: with SMTP id m14mr5704543edp.76.1611691655781; 
 Tue, 26 Jan 2021 12:07:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n20sm4943280edr.89.2021.01.26.12.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 12:07:34 -0800 (PST)
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4bc4d16b-22a2-c24a-b712-810db421a069@redhat.com>
Date: Tue, 26 Jan 2021 21:07:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 20:44, Stefan Weil wrote:
> 
> Yes, I tested with latest git master and did not notice that 
> --enable-tcg-interpreter was broken.
> 
> Paolo's patch fixed that.I could reproduce the fatal assertions which 
> were all caused by the same missing TCG opcode implementation.

My patch _broke_ that.  Richard fixed it.

Paolo


