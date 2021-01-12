Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC02F3339
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:50:26 +0100 (CET)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzL05-0001o9-UL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzKy9-00012A-Fa
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:48:25 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzKy7-0001zB-RB
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:48:25 -0500
Received: by mail-ed1-x529.google.com with SMTP id cm17so2601820edb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 06:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M+WfNZmH0ME3aVfDYNJrXGUEucMfV7oFnceo/f9Rmvc=;
 b=j4yAmf4ETP6kp5VpUsIUrmDtjo6WBGNKt0/hWr5xXY+00qgkxfqnCq4vMNGehXxSbr
 ECgffV5YIbnUJqUOpIFgD3iJBFOxHieQmo5hGEdT6G7II7D124BRoaHYZgbvaOd8POZE
 NG2Pb5wgCve7vxwCkmsphZwUaPUkANXmjHPWB3yGOwuTBTymNAIzcorLVldQo3eVv0ID
 jtV9iEUIfcO1tCgTYFGcubCYKQp64BylayobA0wlIr+bnG+/SdyrlqSJGH7zRlAHq4fJ
 j+dmhqaJHLH/aWPYSsfGZ3liwaepJoLu+wQOkgKXwYoet1+5vgbipzhE0nX2Vuq51kdA
 8jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M+WfNZmH0ME3aVfDYNJrXGUEucMfV7oFnceo/f9Rmvc=;
 b=euTp5g623TjYViGrTGGqozXKY92Kf8kygnkNYE/v+QCDl8KVm9+Jx3DdCIZOlqCygW
 UoZjR+adH5lsvODfvCoA9MC/v2NCIHshjmcqbxJmXCbGUMi8TFVw5YQxBdRg0t3C6U/i
 OBAF7d14d9i9YygPFeGGjMaO6UDEzS6zVaaIzNKuBIqnPyF1W7kKKpTC77sbS2zZzQ2S
 WDRdCjC//vz8hi30NReq9K9rCOe8DPMqXRvtOaPoeQApy/jV8Co0+1TvqjASQeRmWq2m
 nSwrShgW22k2+J4LM8mUlc3VC9ozi5OQUd4i4oPx6yC1GzDc+bfUcm1hFrvOcF69fnyC
 66AA==
X-Gm-Message-State: AOAM531RN2uNUVzpYhbyhrHTnmtIDz8xRRwr2GxmcgzOiYvO9L3OWmEU
 jRVFjorLJf6OX9noI6lkW9coM100jedJPQ==
X-Google-Smtp-Source: ABdhPJxr8FzEeDxPzkC1kfm8y+BN7N9xTzEk187XEMtxB49fKy1B9x6knaPvA/Z5cdm7lmRcy+J6aQ==
X-Received: by 2002:a05:6402:1d3b:: with SMTP id
 dh27mr3792847edb.238.1610462896569; 
 Tue, 12 Jan 2021 06:48:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id i13sm1287409ejc.57.2021.01.12.06.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 06:48:14 -0800 (PST)
Subject: Re: absolute firmware path made relocatable in qemu 5.2.0
To: Dave <dave@0bits.com>, qemu-devel@nongnu.org
References: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c9b36f34-8783-9c11-ffb9-afd25fdf9ac0@redhat.com>
Date: Tue, 12 Jan 2021 15:48:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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

On 12/01/21 15:05, Dave wrote:
> Is seem that absolute firmwarepath compilation option is converted  to 
> relocatable in 5.2.0 qemu.
> 
> # QEMU configure log Tue 12 Jan 14:46:41 GST 2021
> # Configured with: '../configure' '--prefix=/usr' 
> '--sysconfdir=/etc/qemu' '--disable-bochs'  
> '*--firmwarepath=/usr/share/qemu:/usr/share/qemu-firmware*'
> #

Yes, all paths within the prefix are relocated.  The workaround is 
simply to configure the intended prefix with configure:

./configure --prefix=/root/qemu ...

or if you don't know the prefix:

./configure --prefix=/nonexistent ...

Because /usr/share/qemu and /usr/share/qemu-firmware are outside /usr, 
they will be treated as absolute just like /etc/qemu.

Thanks,

Paolo

> And trying to run the executable
> 
>     bash-5.1# ./qemu-system-x86_64
>     qemu: could not load PC BIOS 'bios-256k.bin'
> 
> If i print out the resultant binary paths
> 
>     bash-5.1# ./qemu-system-x86_64 -L help
>     /root/qemu/../share/qemu
>     /root/qemu/../share/qemu-firmware
> 
> So there is no way to have a absolute path for firmware /bios and all 
> qemu's that we test need to be at the right directory nesting to find 
> firmware, bios etc or else they all need their own duplicate firmware 
> files. Firmware path needs to honor the absolute paths i believe.
> 


