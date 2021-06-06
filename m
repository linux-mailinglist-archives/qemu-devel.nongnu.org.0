Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB59539CBF0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 02:42:20 +0200 (CEST)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpgrr-0003Z4-LW
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 20:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpgr8-0002sf-94
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 20:41:34 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpgr6-0000gE-IK
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 20:41:34 -0400
Received: by mail-pg1-x52a.google.com with SMTP id j12so10954893pgh.7
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 17:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tDbtNWiW94A1Em/tSJRpYkm3HCLhmSEx9rRpFyiX2XU=;
 b=c+7meBw0uie+vpQ2q8RJzjPn1onOQdnGDNrUJuvqfgbE2OwGKiAzkKjcyxE+3UHZsh
 PcczFgSksAFJ8qAWneobcnush/sbs2tXJFdjvHrtjtTiuu1E66j5LgujPGcWkyB1Fiyq
 OrARJ+ZY5wLOIU0xTtap5ef3fppdHfExxH6QnP/NEEsPSPcwbnYcXbuEpiFUkLfmC5oM
 mlfzvU6F95C0mjrulzLrrAm4QuFbQ58AoAyi0LKX8r56L9fVjoeptx+4L9XKfEpN/0FX
 lxdzdJYvoeM0C5JnTwp7bc8N9GIzHGSQHFA7Mu43L0JT7JF2um9IN2O3BtgEpjvvKmJn
 F50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tDbtNWiW94A1Em/tSJRpYkm3HCLhmSEx9rRpFyiX2XU=;
 b=U5/Q0z5+sjRwTg215wpl1yDLKoA4ddNKok7qSerWr+CCiMT5JdEmldHObhpk4iTNhl
 OdBTfskBXOuqGuDCz+k9FaqbFiPca4FlG/xBBCNqtMq4hYTPWOnes9hXcXpzPYYSs/OE
 nfzU3FUO5EWVGR1EklgggH+mSlRpgVLGBxNyUQ9akbefRJRFAo0sjdSsUHN91TZpiHe0
 BYv5NT/0Vld/sBcWXoRv6iuOPsnnRH/188pV44hZFvROQ5M/39KDCg5tKedTlFsB7koH
 M2AbWUZzmWTn7EmZGk44jH4xXAG1+T7h/DwWQTD3OB/AL1P89y03y77NoYmgh/0nD2Qb
 1iRA==
X-Gm-Message-State: AOAM533db8k8C/CP9PQVrfSPq+lScscTx5Q4X26PkRf1gW/2v297K7uF
 vj1HEOVl6ifCtOcp0OJ2TtNfaLpMk0SwkA==
X-Google-Smtp-Source: ABdhPJyabeOY6PGYJo8uvnYG2hIhUUHxgU7firMei3vznE3QdLoyvFlAATkwuIEug4R+fJyTdy15xQ==
X-Received: by 2002:a63:5619:: with SMTP id k25mr11874366pgb.92.1622940091135; 
 Sat, 05 Jun 2021 17:41:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j24sm2606092pfe.58.2021.06.05.17.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 17:41:30 -0700 (PDT)
Subject: Re: [PATCH 5/8] Fix incorrect initialization of PCI BARs.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-6-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1ae425c-b294-4aaa-6888-96afedb0ba42@linaro.org>
Date: Sat, 5 Jun 2021 17:41:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-6-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> -	  if ((val & PCI_BASE_ADDRESS_MEM_TYPE_MASK)
> +	  if ((old & PCI_BASE_ADDRESS_SPACE_IO) == 0 &&

The correct test is

   (old & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_MEMORY

Bitwise it's the same thing. I'll fix it up while applying.


r~

