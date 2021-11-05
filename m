Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269B4466AD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:05:54 +0100 (CET)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1iz-0006LV-EF
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mj1cn-0001Cj-GL
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mj1ck-0007CV-UM
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636127966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ds15YC6ClXsiNhZwuMcqcFfDV+NtyS3WwwU+lY5kN1c=;
 b=N/kI30attCK2stvsB5/mpSNxvo4vrNzCh+CEn17lEAAW7u3Mj1OO02iZhuJDh1DucVeEi4
 aPsGQf/sd/uCQmMwAwde+nLPSHJiRsJ/d3tCbkpx8byMvdXTRn0jyVl4MKYnSAhvbRJ7YX
 03D5KB48fm5IPu+tXao/F/MvHz/i818=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-tgpIEbR9P5uCqhVE11WFDg-1; Fri, 05 Nov 2021 11:59:25 -0400
X-MC-Unique: tgpIEbR9P5uCqhVE11WFDg-1
Received: by mail-ed1-f70.google.com with SMTP id
 q6-20020a056402518600b003e28d92bb85so9267305edd.7
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ds15YC6ClXsiNhZwuMcqcFfDV+NtyS3WwwU+lY5kN1c=;
 b=T8lQ9X1jWp0WhLQ7hFCtmhb4FdRIgWFCqOBh4VQp7yf9ag0IRFuxe2eb7yrSTAux+/
 dDGXn6VUCKYU8yX4NPezSlgJF6/y+c9MTy4eBIZhi+f5l5PsWDT4cCrje+oKchuT4qqJ
 bnnBKpguFzTlBc1J8n/N1ZUCTderWSQNDg+u/8GRGuAbofTo+suTq8G4pXr6rXk0Xkt8
 VeS1aZ0jep6/HONh47vFrRP6KpW3GQTI/sUtgUn54yjbNIV/Kb8AK9JzAQBd/4GzpI5Y
 DM+nfYfIgiHwHfF3eJ6DeBjbwqJ0vvLmVJLl4sl9nOnvfcmsIdw3neBtV6J6XGpfUmBd
 vQWQ==
X-Gm-Message-State: AOAM532RnqInoTTpPtOKXg9DkEUY7uXwrlQcZsE2/yUGnkGREXwH5vtJ
 Z1dxVwz7x+0AfszbNboQ0iYn6c6Yi9FD74HhMW77Qs3Ige6diJf3kN7VIeeRHyT1TPSdExqEQ5V
 VKjVVE+SQnF1gj9w=
X-Received: by 2002:a17:906:309b:: with SMTP id
 27mr8844739ejv.129.1636127963894; 
 Fri, 05 Nov 2021 08:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFtYq6TbLu2ZzbdX/5AYd0rYisGcxGanYprMC4Ckf0QtlBzTcgoosRHMuRWE8WOt9TmZ6/mg==
X-Received: by 2002:a17:906:309b:: with SMTP id
 27mr8844720ejv.129.1636127963702; 
 Fri, 05 Nov 2021 08:59:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id h20sm4689550eds.88.2021.11.05.08.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 08:59:22 -0700 (PDT)
Message-ID: <e340f7c1-e156-3e0d-553a-8bacb2a0809b@redhat.com>
Date: Fri, 5 Nov 2021 16:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: FW: New Defects reported by Coverity Scan for QEMU
To: Peter Maydell <peter.maydell@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
References: <61844bb6ced54_21aa5f2b09742af98856497@prd-scan-dashboard-0.mail>
 <SN4PR0201MB880836A27E0A0E93CDF7308CDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <CAFEAcA9Tp0t+x+AcfJUJgqJxPMYmH7dTibYHGf0ipvPp71yGhg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9Tp0t+x+AcfJUJgqJxPMYmH7dTibYHGf0ipvPp71yGhg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 16:31, Peter Maydell wrote:
> The loop nest in question is (the index must be < 128)
>      for (int offset = 1; offset < 128; offset <<= 1) {
>          for (int k = 0; k < 128; k++) {
>              if (!(k & offset)) {
>                  swap(vector1.ub[k], vector0.ub[k + offset]);
>              }
>          }
>      }
> Basically, it's looking for elements to swap, and the
> "if (!(k & offset))" prevents "k + offset" from overflowing.

It would still be slightly more efficient however to change the loop to 
k < 128 - offset.

Another possibility is to change the inner loop to

for (int k = offset; k < 128; k = (k + 1) | offset)
     swap(vector1.ub[k-offset], vector0.ub[k]);

Paolo


