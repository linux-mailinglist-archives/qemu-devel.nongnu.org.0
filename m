Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F638765A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:23:17 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwse-0001uG-Nn
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwUn-0002zk-1g
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwUl-00021H-Cs
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:58:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NzuYTxcvGMlL43PLhRx+/PDRwW5Zps5j/b6oOy2Fbw=;
 b=NWus+J876E7LKB0SqqRBOwnFRiH1rLOS85CVhFzOZsOeUG8k7xBx/RO61cN1r0KPiZVO8Q
 lhvxD8fNv3UryGuTBu8dAEav/p1yhKewGG1wcD/2ofjMTlATwqEogCMlAk4uHiQ/hBXDQY
 LfTyFh25mZGOngbNFcAWKLCSk8WQg5Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-uBFcB5bIPh6A0XMaNb0WDA-1; Tue, 18 May 2021 05:58:33 -0400
X-MC-Unique: uBFcB5bIPh6A0XMaNb0WDA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t5-20020adfb7c50000b029010dd0bb24cfso5349815wre.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4NzuYTxcvGMlL43PLhRx+/PDRwW5Zps5j/b6oOy2Fbw=;
 b=fiFNWubAXAkfQhVIj3gHAg6mmslvbhDEyh5zZ3sA+A3IyMuVwmHgBLUNcsk0MfoTRq
 HwbE0X5B3w4NwXGFZYTxLt+1JGJGXom5XIQkqV7Wv7IFCRCM4Jai76ULWLJ2i/76UEta
 M6Hw1q+hufgCk/jm+4IfSVvEyyVtxjKfKM87e8fmLawptedhMd9bY87MGWWJY8baP8gG
 iN6Z2bSCWtVr+LmTYdOK8SE4dckrcPzDBllPQQA6Bv+N/npgH+1bTILoMkYmsOuqZ49o
 MOJIO6wUrT2S0SIeF9XvFOx/kMb0BP0EK245rlPHSBmSYBm61kribhXoxX/f+8/2vwvM
 cnUg==
X-Gm-Message-State: AOAM533afwcaB4qKe0R5KRo/8G4aEgdN+tNl6hGz68Qs6FPD5FGu5P9P
 Em9+PYozsxosqjVPYd8ZBzx7qRisGkZUgG7PlUWRmpIIaY7RMkeDsaGcCx4y7sZYR8v6l3dCINl
 iKh7jMozq7yot+kU=
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr4504292wml.81.1621331912046; 
 Tue, 18 May 2021 02:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3gito8XXyylCb12NrrWHVPMlpIKf8RFZ9SWxe3+rDlPR4m5KZMNNssX4dDNLAfosQp5zetQ==
X-Received: by 2002:a7b:c8ce:: with SMTP id f14mr4504277wml.81.1621331911902; 
 Tue, 18 May 2021 02:58:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f6sm24092329wru.72.2021.05.18.02.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:58:31 -0700 (PDT)
Subject: Re: [PATCH v2 37/50] target/i386: Remove pc_start argument to
 gen_svm_check_intercept
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-38-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <03a90eee-d789-1a40-8628-6a3aad70b5a1@redhat.com>
Date: Tue, 18 May 2021 11:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-38-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> When exiting helper_svm_check_intercept via exception, cpu_vmexit
> calls cpu_restore_state, which will recover eip and cc_op via unwind.
> Therefore we do not need to store eip or cc_op before the call.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 45 +++++++++++++++++--------------------
>   1 file changed, 21 insertions(+), 24 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


