Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DF3510BD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:19:12 +0200 (CEST)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsXn-0004w3-R1
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsW4-0003c9-HE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:17:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsVz-0001d2-Fh
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:17:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so440968wmi.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JPj/cn18UH0lUzak0XFNbxnrcENkMTUL0/ogIROXkzg=;
 b=ln43nrVbxtA4HJallNzH6Y/xgWXCBgdPcrbpH09/kHAVRur/aenE4x2Q8sTikNAb6w
 xLc5eb+N8Eb7nBzt/Vtb29X9YSYA+kZUw+7xvMEWJrlgSghBVpag5aMDo4JIxFIa+0e5
 QXUFSwD7wqSQRUb17A5Wz9H8o13Enhr6uRysC9pHcp6jur/Rfxqq+lgt696j4aaiA0ci
 +0fS4B81VVmsLMiXYOaW2Ws2C8YG2J5AgkQzwToaDRSMs4lOJzZ281a7NrwAViHYnfvH
 Wihrb9eXFn4VB+H7i2Hux6jQksn2KvibVRQTLzfjrIEGNzvKzzjMBQT1RZClPMQwPeeM
 RP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JPj/cn18UH0lUzak0XFNbxnrcENkMTUL0/ogIROXkzg=;
 b=NPckzWQYnzatTHrdXrt4uc9vOsUIySAJlT86sK8LQsigMemz/nbZN1gw6FI3N3fzfj
 YA8M4r55zpJXwOPZq12Ju/KhpT2b99CEPO5S+4WpRFdQvooXlQ6wvhIBg0RX3VT6R1wt
 85FLeNVHy1s4TToywRgOqNKW+GGNP22NriEfp0TRM94ej8StmCDOR970eBIExJBH1Xn1
 3++c3BDQKjwNTCrj0gNEn7CvQh3L3JwBsf/cI28i7Wk7X1ryIHTGhDpjBMQ9BQL9041r
 BRysp3U+NvtjvaGI+UiVquBE6vK9Le62JYAuqkSjps7D1m5B52LYC5yF7dmgZmn1NTeB
 c8FQ==
X-Gm-Message-State: AOAM530HEDHtkjYiRosXHgVNXZocq00zBHwPTWGf09M9eqadi6oDkgEQ
 Ildwx63FL/AY6mFNs7MrWsw=
X-Google-Smtp-Source: ABdhPJwv5npsIcwb+Fne1gqWZqFgOlg0/I8uGAB7VSFQZrtsmCvEPbLcRI692Azrwi9oCauosRgcNg==
X-Received: by 2002:a7b:cdef:: with SMTP id p15mr7026931wmj.0.1617265038024;
 Thu, 01 Apr 2021 01:17:18 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a17sm6980207wmj.9.2021.04.01.01.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:17:17 -0700 (PDT)
Subject: Re: [PATCH v3 06/11] esp: ensure cmdfifo is not empty and current_dev
 is non-NULL
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-7-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5db508a4-7da8-6707-2b9f-875c54da9efe@amsat.org>
Date: Thu, 1 Apr 2021 10:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401074933.9923-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
> When about to execute a SCSI command, ensure that cmdfifo is not empty and
> current_dev is non-NULL. This can happen if the guest tries to execute a TI
> (Transfer Information) command without issuing one of the select commands
> first.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910723
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

