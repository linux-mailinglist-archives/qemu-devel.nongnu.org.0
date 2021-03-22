Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0D343E0B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:35:59 +0100 (CET)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHug-0000CF-TQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHdX-0000Nt-Mn
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHdV-0008Mx-QH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616408292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afhaqhtCB+SEPaiKG2wDavx+tt3TeOZzCRrQUDXcb88=;
 b=HUEUy4TDnYWJ5UkbmXG0ckEgrJArWcM5RDf7obrLw1efQRXuAZ7aawR74chVEYT1xM7zun
 yukLTZXntBFllUBIasN5bze1kO+uYWA5wCH9V+bzzja1iHYbaN+PIfCBg11r0uLyjnlvtC
 A006sUJjUL13LyeNtWruBW1RQ9BoUZA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-LBYSIG1iNNuHPGGZbNNQSQ-1; Mon, 22 Mar 2021 06:18:11 -0400
X-MC-Unique: LBYSIG1iNNuHPGGZbNNQSQ-1
Received: by mail-wm1-f69.google.com with SMTP id b20so9154595wmj.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=afhaqhtCB+SEPaiKG2wDavx+tt3TeOZzCRrQUDXcb88=;
 b=RxemOppVIp3lFEhQyR/9gQiqYJWw6T8Kw9fCYXfmaEtazgI8AOswb8ZAYy/WBcnf1M
 8DNTWZjaN3NquDvyzwtzFS6dW9RdMAoH0kN7CRkgp03PXMit0MADsc3STJNm0UyuKGJw
 HqmL3kUkxhHs3YZEI8EMLXm6DHC6zbmi6UoKI1V2ydhkYtqUG2vF4LXB6KSNB6gDrciV
 AXzZPh4RRoUw85p1WYrMRKfwJZpnkbnt8D6Ke3AD47Tk0ozAMqLN2AR13UuAhfHW7zlZ
 DEKm7AcV7+r2gMcTgcPLKNuIEW47I7CwH0HxsoztedEshB1EvxRIU9Bbfde2wqTSgJYy
 QYBw==
X-Gm-Message-State: AOAM532SDwKCmjVxs4iocVB59YjWQgP6BqbupxlnONnk25km3exxhrnW
 ccdCX1LknGCSPbOz5Jp/hpjEzGVKpPTHgosoz0y2CXr231zw5z2eJX0ZkrKrLI2424WZIBT6CXm
 CSvUVuL3Alt4hBpE=
X-Received: by 2002:a5d:628c:: with SMTP id k12mr17104270wru.316.1616408289790; 
 Mon, 22 Mar 2021 03:18:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0P106cL8R+MQcx452dP33onJVbLeXFbtzz9/Ke04x74aUGcwnZwz8B8Dm11bQmobtOIHXzw==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr17104255wru.316.1616408289630; 
 Mon, 22 Mar 2021 03:18:09 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b17sm18831973wrt.17.2021.03.22.03.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:18:09 -0700 (PDT)
Subject: Re: [PATCH 0/2] SEV firmware error list touchups
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210218151633.215374-1-ckuehl@redhat.com>
 <cd383ad9-21c6-340d-8821-c151e1b9714e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bde95e1b-86ef-18d4-6864-7bc034d41688@redhat.com>
Date: Mon, 22 Mar 2021 11:18:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cd383ad9-21c6-340d-8821-c151e1b9714e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connor,

On 3/15/21 3:08 PM, Connor Kuehl wrote:
> On 2/18/21 9:16 AM, Connor Kuehl wrote:
>> Connor Kuehl (2):
>>    sev: use explicit indices for mapping firmware error codes to strings
>>    sev: add missing firmware error conditions
>>
>>   target/i386/sev.c | 48 ++++++++++++++++++++++++-----------------------
>>   1 file changed, 25 insertions(+), 23 deletions(-)
>>
> 
> Eduardo, Paolo, Richard: ping

Looks too late for 6.0 now.

Can you repost/ping after QEMU 6.0 is release?

Thanks,

Phil.


