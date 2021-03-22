Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8B3443F0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:59:02 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOK97-00073Q-Cl
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOK7X-0006a1-EG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOK7U-00087A-GH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616417837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2HExmfu/eRKNSuBK1450fAaB6tWFPZuzzGPsOpr722U=;
 b=dQukdNjtZCulDsZ1EZwC85+VLTzuOnhcZMSigTFi1pDvmnE0ZLFtEmVEY+Asrs34qIrA5L
 9VO18XHhKPXRmcA/8AmNVFnffR0Z85yfclca6eLtqnJhHcVfZP4nFeOO2yetn/Cfgm2KeK
 T2ziNlMx0inewGALPzm4qVaL38fEL2U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-F6_C7SY2OGOEufaDjQbbrw-1; Mon, 22 Mar 2021 08:57:15 -0400
X-MC-Unique: F6_C7SY2OGOEufaDjQbbrw-1
Received: by mail-wr1-f70.google.com with SMTP id h30so26016426wrh.10
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 05:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2HExmfu/eRKNSuBK1450fAaB6tWFPZuzzGPsOpr722U=;
 b=baHqhWTUd8izI9wyn5SjbwWVGRDT4T6Efm8UK6iBqfpvIawd0XS+5hIL2kCpwc0Yon
 jFGyW6MLgTFkKuS6iXAKkqm+S5mmjiymbHvpUzQV5goURUPrVOIW/E93DPO1l7e5NFPa
 E9+jvoF04TRKTwSxyXL3r+nKpHdS43WxFPVCpDwMW6VLgOjEOmQZLAlQrQv7kTODfB1o
 UlgGKKPyb9gDN9w3s4y+6m/ltl29Ky2owBfFRdmiVr3oYFtCPwYbkeCPi/Iphm5jgFpb
 Ar1+Kz3gynABOX2lpjfMCUMpMVzxYZp3/Yo2HWQqWqCVty0ohpckFKnF9EX1Lkd8dd3F
 sHsQ==
X-Gm-Message-State: AOAM533he7Fsp/rxWCQVr+zjcl8tdhAsZCQBtfSDnRC2xcG8C6dSggtB
 lOBtKZC5nSvpVbhoQMe8prDrQWGyuy7Li+SzsABbfQqJQdJrYAEDZR2TsFc2Om7HACVQTr7igju
 4VUmnTGIS33oXSiU=
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr18788798wra.250.1616417834165; 
 Mon, 22 Mar 2021 05:57:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL7BZIwr6Rv4cAepg2WQUpV0D7vv533xdeirFDeFFCEYH94vtQBw1sM8rr+BhkbznfR7wMQw==
X-Received: by 2002:adf:a2cf:: with SMTP id t15mr18788783wra.250.1616417833961; 
 Mon, 22 Mar 2021 05:57:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u15sm15423111wmq.4.2021.03.22.05.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 05:57:13 -0700 (PDT)
Subject: Re: [PATCH] tests/meson: Only build softfloat objects if TCG is
 selected
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210322114739.4078408-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4962691b-b5fb-535e-2aec-55eaa0cfa9a9@redhat.com>
Date: Mon, 22 Mar 2021 13:57:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210322114739.4078408-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 12:47, Philippe Mathieu-Daudé wrote:
> The previous attempt (commit f77147cd4de) doesn't work as
> expected, as we still have CONFIG_TCG=1 when using:
> 
>    configure --disable-system --disable-user

But there's no change in behavior with this patch, right?

I would rather first start removing CONFIG_TCG from target-dependent 
files (such as tests/qtest/bios-tables-test.c and 
tests/qtest/qmp-cmd-test.c), and then just remove the

   config_host += { 'CONFIG_TCG': 'y' }

line that is not needed anymore.

Paolo


