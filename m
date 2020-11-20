Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13E2BB0CD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:41:52 +0100 (CET)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9Tr-0006lH-QQ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9RM-0004u7-VQ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg9RL-0000W2-Aw
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605890354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3h5o4PI+tliYstnq3a+1AtkwxFg9rwdaVJnHtQAk1Fg=;
 b=bpjqQdewu/ZOf7dIWLzY8LQtftndO/FvQ26b5XnvGJxXAUD/WbjjZhl+kjSTzOfdh6XZte
 DrRngoeDVGRh6PsMWt9xMDg2BnP2uNo5dIeJ2nKL272RklKCWE9SyxQPDt18OvIbxWNKht
 xsMDS4vBqIDSmXKh1OtLYDkOdOU382c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-2dePSS8RN8aVGt5_WjkFQg-1; Fri, 20 Nov 2020 11:39:12 -0500
X-MC-Unique: 2dePSS8RN8aVGt5_WjkFQg-1
Received: by mail-ed1-f70.google.com with SMTP id n16so3957910edw.19
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3h5o4PI+tliYstnq3a+1AtkwxFg9rwdaVJnHtQAk1Fg=;
 b=QzPrNf/5bEydsv9950K9++mPRrOinkznkEVv8plA2famZddpKr1efFLdRhycXGqIR7
 gYgaSW5KJ4aZHll6Ad9txJz9fyI4gB4daOxsWntiO09TVHDmke8xuFbQT1c4xvqIqyED
 CKQFXSwgM3klQbCJQPiVO8bbEeoEp0a6fCp58yKvR+4IOOb8n+Ur/Qi5kJJGmwgXtAWY
 qVlW1tYwf8MXvEleziNUIv9xayBjdQQNWwHWbcuC3t2HtL023ixHSkOwMY0PLwox/o20
 v9DxOpMrpG5hasPG6zDDEUuv3bhC/yX99HL/RWH54l55T9JziOmeEeWTEyhKWeRnUHmr
 Y+rA==
X-Gm-Message-State: AOAM532tiblgWTuBqsXgu8Ny6oJemzHKeWVXgUt6hZiNaZlGWazormdS
 TRenpbvLDhhUQoWuxJSFjLzET7A4+HRWc3ClTkJgMhjlJ/0KaE049eN1h6EVLAm9acPRHA7CIjF
 B/yGg5+jqoVZSkiymZECeD7Pj5ZVEOjL83TDfxyJiYsMLXhLJ+xOnUaxXbRz4tBSB8TE=
X-Received: by 2002:a17:906:17d1:: with SMTP id
 u17mr32411415eje.229.1605890350933; 
 Fri, 20 Nov 2020 08:39:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2NRan/LzGRSJFgEha78jEnafB7KBZcjyNwH52fX9TH6D7JriLWZm8ifHtcecC2EcC4AVY4A==
X-Received: by 2002:a17:906:17d1:: with SMTP id
 u17mr32411400eje.229.1605890350688; 
 Fri, 20 Nov 2020 08:39:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m26sm1345239ejb.45.2020.11.20.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:39:09 -0800 (PST)
Subject: Re: [PATCH 28/29] vl: remove separate preconfig main_loop
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-29-pbonzini@redhat.com>
 <20201120172631.4f5f93fb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c3bdcff5-b219-e742-1e96-720fd3f19551@redhat.com>
Date: Fri, 20 Nov 2020 17:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120172631.4f5f93fb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 17:26, Igor Mammedov wrote:
>> +    if (!preconfig_requested) {
>> +        qmp_x_exit_preconfig(&error_fatal);
>> +    }
>> +    qemu_init_displays();
> given that qemu_init_displays() were called in both cases,
> shouldn't it be called unconditionally at [1]?

Yes, makes sense.  In fact, it would be nicer to also call

     accel_setup_post(current_machine);
     os_setup_post();

before x_exit_preconfig, but it's left for another day.

Paolo


