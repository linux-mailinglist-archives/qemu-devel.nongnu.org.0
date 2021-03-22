Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36B6343F94
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:24:04 +0100 (CET)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIfD-0005Uz-Qg
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOIeE-00052a-M4
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOIe7-00047d-5W
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616412172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fX5myzmixASVDKbGRInbIjf4D7WcZbQPCn5DylrnqNo=;
 b=T4J55Kg4e3BbWS1ulcpO6+H44mW6kKtAQiFOnVm5YYh97kUAEXXEat3wDT8DAoS6LfPJI5
 1URngez6pxdDn8kMoYjkqtGaisEh8by17AyMdhjnHklP9h4tPcciwRMhjH8rb24Q8MyNjg
 UMJQ5BNYVzp6jckicJWW6RNrzyrw01g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-QuvwSNHvO4a0qTgurcJHHg-1; Mon, 22 Mar 2021 07:22:51 -0400
X-MC-Unique: QuvwSNHvO4a0qTgurcJHHg-1
Received: by mail-wr1-f70.google.com with SMTP id p12so23264542wrn.18
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fX5myzmixASVDKbGRInbIjf4D7WcZbQPCn5DylrnqNo=;
 b=OHdrxPzli10LWtSzAG3ZSCNwApQ8VxIVg3IAhnmstbKvhL7FJsq6IFWf2xa4bw2K7+
 RNCETt9l/cpbNtLIs5Uq0GxqNj04KL4nSBMPje+zECdS9V8CAgHtU1OWzjVBACa9q8Qr
 y1l4P94xQ9l4ofdQ7d7BwYrs7FduVpYZAoicjqvOz4vs6BqsRMHEGhI+/86S1KmbToVy
 vN9bG+5aWXPv0NdXbS5+m5vCDQeVCbB1mvw2/YZk49UxLX7czAwPzv5NqUOdYnskY85U
 po37dgvRThW+lUA+HQRNWsDeqMHAxKmNsj/qB0ToWMv8srTD1enDjkEJSeVmErE2M2R4
 Z0qg==
X-Gm-Message-State: AOAM531uAwURwQxkjLszXfkpCMhG+UF8oDuzj0eek44EPHuWqO3jTN8U
 7EQg+LsBTmjiFsfj0Da8WP/a8J317AatKvydDhKqAN6NpW5QkiwXWUBqtv0ynk01QV3D6ECuXqi
 dP6KbxVcmLfwKKRQ=
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr15234657wmj.43.1616412169906; 
 Mon, 22 Mar 2021 04:22:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHPXlDfIR2Jf4PLf35g2wO7v9DFpR7mH4eA+1H7KMveIgWqhHZIOzuucP3BfBvms6XIUZlRA==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr15234642wmj.43.1616412169745; 
 Mon, 22 Mar 2021 04:22:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g5sm19831601wrq.30.2021.03.22.04.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 04:22:49 -0700 (PDT)
Subject: Re: [PULL 0/8] Misc bugfixes for QEMU soft freeze
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210319143924.2173798-1-pbonzini@redhat.com>
 <76ea5ddb-fc93-c9bf-df87-9d89e92b7d79@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cb8e8320-4b6c-99ca-f0da-d383381e31e4@redhat.com>
Date: Mon, 22 Mar 2021 12:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <76ea5ddb-fc93-c9bf-df87-9d89e92b7d79@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 06:02, Thomas Huth wrote:
> On 19/03/2021 15.39, Paolo Bonzini wrote:
>> The following changes since commit 
>> cf6b56d4f2107259f52413f979a1d474dad0c1e1:
>>
>>    Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210318' 
>> into staging (2021-03-18 23:04:41 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to af05ffffd7fa28010d4df9f5744514b16e71055d:
>>
>>    tests/qtest: cleanup the testcase for bug 1878642 (2021-03-19 
>> 10:37:46 -0400)
>>
>> ----------------------------------------------------------------
>> * fixes for i386 TCG paging
>> * fixes for Hyper-V enlightenments
>> * avoid uninitialized variable warning
>>
>> ----------------------------------------------------------------
>> Paolo Bonzini (5):
>>        qom: use qemu_printf to print help for user-creatable objects
> 
> The qemu_printf patch that hit the master branch looks very funny. I 
> think it should get reverted since that header file now gets included 
> twice there?

Indeed.  Most of the changes in the original patch were done already by 
Kevin's commit da0a932bbf ("hmp: QAPIfy object_add", 2021-03-19), so it 
can be reverted.

Paolo


