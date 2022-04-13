Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E805B4FFFDF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 22:17:42 +0200 (CEST)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nejQr-0001gL-Qc
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 16:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejPN-0000Tc-Tx
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:16:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejPM-0005CH-En
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:16:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso4683937wme.5
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QixFRQSFHTlIkWfcEizc6WJab9YgVKALiyNyg0E4jVw=;
 b=OdUtl5U0WwuPTw3bMhR0QqyGzaajqBAZmuuZqKovmAaQ7BAXKpH0zsBJglqG0Vj1MJ
 If5fUi9AvtjjdSTxwYgG3g+ijKlWlGUPA54+86r+cmJMEy5yQQ0zsY+J2OyNe1AB6TQA
 F5LlMPFaaXRoXR7b1doN00HZnjnwce9cUBhMhaAWKqcCcyU0lD8VipgyXZWclP/M6LwC
 tengbTtTh96rQuQpNTAQSC3mKGPFQB9NEpLkCTNLN7nYXIHmLJ4/dxtJxO7/yOkHYkk4
 vK7rv7qN9JYHIoz2SD8q9N4rE9Re62Yt0IjtlVgoPSYmuxmLD670p7agmfziJq0lbGjC
 vujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QixFRQSFHTlIkWfcEizc6WJab9YgVKALiyNyg0E4jVw=;
 b=dpAIDeCGUfHaTiufSVbMolD/AU/awbwimf4op6DVCKhP93Im3Hzbql6lhLtERMO0P2
 fSIZtIjlPnXb8ABEwp7/awJoktvxgFEihgwrDCTo4Znk4QyEDVDgR+Zai10RXCEXeMmc
 QlfgHqmpgqykiMcj7s19kJG2KcUAN3/c00a5/ZO1WjEdSLy4CgXNgsxCFFGggXM5+zyU
 3pZCDLrXL7AcziFl6W1XREcOufONdecgV1YNvUZ85Uy7+JBuzOWcffLxZHzrqqNoFIs7
 AW8aS+r9j0n2Ujaz5BewBS+WzkhDNcpkioQpEUvTJk7ep5qBPnX1I3415pncXbDvjp6C
 qjMg==
X-Gm-Message-State: AOAM532m5fZX90cFjyFD/uDx/Jvjsk0v1Rvw5c2r9W1wI/+ZY26dB4f2
 zk+ciwWObdbu7lJvNp6wB0v0VI2fgmIQtQ==
X-Google-Smtp-Source: ABdhPJwfFzBEQ3+zKgNoMZXM2V2RSeEz3oDtReJL+nHC3Y02sQIIiQZD+uZenVNIO8ppk4wyoXEPZw==
X-Received: by 2002:a05:600c:1994:b0:38c:48dd:23ba with SMTP id
 t20-20020a05600c199400b0038c48dd23bamr339518wmq.206.1649880966519; 
 Wed, 13 Apr 2022 13:16:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a056000144f00b002079acb2349sm33305wrx.1.2022.04.13.13.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 13:16:06 -0700 (PDT)
Message-ID: <7a7c0e0c-2e17-c1e5-4afe-a601cf77b46b@redhat.com>
Date: Wed, 13 Apr 2022 22:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 5/8] nbd: use a QemuMutex to synchronize
 reconnection with coroutines
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-6-pbonzini@redhat.com>
 <20220413155534.otfxvsfzhgasefmw@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220413155534.otfxvsfzhgasefmw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/22 17:55, Eric Blake wrote:
>> -    g_assert(qemu_in_coroutine());
> Why is this assert dropped?  Is it because we've marked the function
> with coroutine_fn?  If so, should we drop it earlier in the series,
> when you added the label?

The label doesn't guarantee much, but in this case it's pretty clear-cut 
that we must be in a coroutine, the code just doesn't make sense otherwise.

We're also about to take a CoMutex (and before the patch we had already 
taken it) so if anywhere the place for the assertion would be 
qemu_co_mutex_lock().

> Otherwise, the patch makes sense to me.


