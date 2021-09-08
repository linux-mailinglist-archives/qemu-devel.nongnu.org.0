Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8C4033FC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:59:35 +0200 (CEST)
Received: from localhost ([::1]:35080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNqcQ-0003Lj-M4
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqbd-0002hH-J7
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNqbc-0007LR-3I
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631080723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0M7VbO+9M0QgJBAQ4ZzMj8Brp3VqoXg2nLdj3mDzAhA=;
 b=avV9J2Lt9gwidbtM26kEmJQgMLwd1qrOhn4tQoBNAGQswRrttIFDNbUoqnJi9GbJCvreDZ
 JGqqhkYOaRUTHhZqo9YxyqkMIVvKi1vA6bpz02naF4awuxvURBp5wrMyD/u7y47WVbh//N
 i6oXFEI326zCCcc3ggYwjSnvURrxc6E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-701Oaq7KPzGrJqSuxkNL6g-1; Wed, 08 Sep 2021 01:58:39 -0400
X-MC-Unique: 701Oaq7KPzGrJqSuxkNL6g-1
Received: by mail-ed1-f72.google.com with SMTP id
 s23-20020a508d17000000b003cde1d7562fso43662eds.9
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0M7VbO+9M0QgJBAQ4ZzMj8Brp3VqoXg2nLdj3mDzAhA=;
 b=fwFkHaDUgq5D9x1HkOMCWF1/6xOBhhpSOjhafRSS06xPOyglXPYOrQToSdf1tdVf/3
 brrefgKTiVg7EpFUopHbeZ88jIO8zksPP0gz/gjell0bGGbHq2clajYvuLWy12tS16++
 1jVoPfs3MsN5LD8A6zW1xANIt9en3iFAwLwFPmgv90ARx/HXIXaF3WCKPTdIT3vThUkx
 gUVwvMYwpvKSXPZ9KenxEEwURipXOv4VL+eG4X/cLoYjdOKjykEby5ENPByJqAqR9Huw
 rQkNL7JiGl7pOnuM8RTvHKqhPlYL+lIkUO5RYskXjzP3GmGI7M9FO6qWj+3FkJZpstE9
 Iygw==
X-Gm-Message-State: AOAM533KAiiC1GaYKNYd+dUSL8yonlmf+lHA66OOrsRHCPiVUQb66cMa
 6iI3Cl0SYM76mmpWBmxLbNdhKy5lXBX2k5H2szO9ZaPBd+1shr+taAlKhdC+OKVXLTtljEcZ5/0
 SSAJ9ZJTTCYVBSo3eekODIhBCHTZuZA3SBX/ECqnFJnS9rBDQp44J0t3Adal3Snp0xzs=
X-Received: by 2002:a50:ed09:: with SMTP id j9mr2106340eds.164.1631080718447; 
 Tue, 07 Sep 2021 22:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7Bu7gNhLNnk5uDwy5DCXYlwqh2tkMae3Bw/yvr+6qmP5XYWHkmrnQ+FAAMJ8oVmkVrrCjXA==
X-Received: by 2002:a50:ed09:: with SMTP id j9mr2106331eds.164.1631080718230; 
 Tue, 07 Sep 2021 22:58:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d22sm414568ejk.5.2021.09.07.22.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 22:58:37 -0700 (PDT)
Subject: Re: [PATCH] qemu-thread: avoid false positive in pthread_cleanup_push
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210907125120.145068-1-pbonzini@redhat.com>
 <477f7de5-7977-4dd5-38e8-8130149e3570@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <04eec17e-52bc-88a9-3278-7f2a97a83cd8@redhat.com>
Date: Wed, 8 Sep 2021 07:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <477f7de5-7977-4dd5-38e8-8130149e3570@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 07/09/21 16:20, Richard Henderson wrote:
> On 9/7/21 2:51 PM, Paolo Bonzini wrote:
>> +#pragma GCC diagnostic push
>> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>       pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
>> +#pragma GCC diagnostic pop
> 
> I had a patch for this that didn't quite get applied for 6.1.
> You can't leave the pragma unprotected for clang, unfortunately.
> 
> https://patchew.org/QEMU/20210803211907.150525-1-richard.henderson@linaro.org/ 

Thanks!  I queued your patch instead of mine.

Paolo


