Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91375582068
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 08:49:27 +0200 (CEST)
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGarG-0002gF-6a
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 02:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGaaw-0004eg-99
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGaas-0008MQ-MH
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658903547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwOttoZHv3w7q24ptUThjbhOVf3i4HkuYnqwbIGWlfA=;
 b=aZXsxiLHoZzavmqXrBpjFf/ViBxBIN+HE0v7CA5DTxpj2mO7hYrVcSJ3yaDnG+CeU/C9a6
 jKyJP5sLaX5Mj7dh15xoaxHSQW9/LpRLJRUaKEjDBLtUZv8usS4uNXeCqxaaAPx9XQH22g
 A0sLspu55tIr+e1NBpY2DMwZ1oD58Ts=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-6KoT2dOhOTu5hwONCWlqNw-1; Wed, 27 Jul 2022 02:32:25 -0400
X-MC-Unique: 6KoT2dOhOTu5hwONCWlqNw-1
Received: by mail-wm1-f71.google.com with SMTP id
 130-20020a1c0288000000b003a3497306a8so695166wmc.9
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 23:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lwOttoZHv3w7q24ptUThjbhOVf3i4HkuYnqwbIGWlfA=;
 b=mHvwZOQqXEJKVO/W6UYy0F+wNw6uUhs8xZ5VKPNpacRStVmeqIh00TZjHgzKsvCcDy
 Ie9zPgWM+QjkWGFfMZITMqOQPL2clKeUJUpFiT86hFDCeQWjMiTvZPv5lrMVU0TA5S0u
 F6cMgpTTfun2TdGaFdSxmv9jTIXKFRu/DAgOpJClD5oq32Xm+/HrRfQF/nLe6TG2jETp
 Em++pxgIfK1kmXzQMTmC7fJfd1cBqzx5rIoKGNXis3Yoqb5DHASxPzGZ7klX8U0FGK1y
 MzvwaM9reoNl1JCqmqkhc+YPWHYJufqCsqtfIWwi3x2JkeDGUYQm3AR7bmNRmFWD3HoF
 u45w==
X-Gm-Message-State: AJIora/fn70iCryVFAiprUfQJhC7yHg0tpwjto4JB2AkZTCM48LLPADC
 rIF3S2GrhHaEb4fDwBk5CE7HuXJfZdoiQ1V+uVTHMZ2PcoHp4xoyDKfQOKPePSb+ncQ+/EJxPgr
 74QqWiiacmMi7XLA=
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id
 bj4-20020a0560001e0400b0021d7ec3fe5amr13565286wrb.116.1658903543807; 
 Tue, 26 Jul 2022 23:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1syPl5z8sagHGuR+4AIGCC9FntIXmAZmpcrB+ZIbRTo03OrXTLB4J8EH6K8dtUgWA7X/hM0hw==
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id
 bj4-20020a0560001e0400b0021d7ec3fe5amr13565273wrb.116.1658903543595; 
 Tue, 26 Jul 2022 23:32:23 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-164.web.vodafone.de.
 [109.43.176.164]) by smtp.gmail.com with ESMTPSA id
 v62-20020a1cac41000000b003a31f1edfa7sm1159766wme.41.2022.07.26.23.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 23:32:23 -0700 (PDT)
Message-ID: <6abac561-2a13-433b-bd97-740fdce08314@redhat.com>
Date: Wed, 27 Jul 2022 08:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <c61e0119-24e8-c1a3-d1c1-cd57b3feca02@redhat.com>
 <YuCWRaEqrF2XwlsQ@zx2c4.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YuCWRaEqrF2XwlsQ@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 27/07/2022 03.35, Jason A. Donenfeld wrote:
> Hey David,
> 
> On Wed, Jul 20, 2022 at 08:41:48PM +0200, David Hildenbrand wrote:
>> I did not review the doc in detail once again, maybe I get to that later
>> this week.
> 
> Did you ever get around to merging this patch? Is it in some tree
> somewhere?

QEMU is in the freeze phase now, so new feature won't be merged before the 
next release, see:

  https://wiki.qemu.org/Planning/7.1

Maybe we could use the time to implement the missing SHA512 stuff to avoid 
having an inconsistency between the Principles of Operation and the emulated 
machine in QEMU?

  Thomas


