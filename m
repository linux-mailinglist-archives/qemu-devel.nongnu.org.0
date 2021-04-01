Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B34351BF6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:13:57 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1pK-0001Ss-Kn
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS1l9-00086C-3a
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lS1l4-0000cO-5H
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kx9DbhVSJrB9vI9FErGrA8bAvmekmul4UBa7pJXLaoE=;
 b=KSxeA3FlRIZPvY8hiFFDAd2FK3zLMCI9ahbY7Je/hW3q0mB9twcgtn09+GIcZQN2v69hdR
 kH0Lvh3r44DBffs66FAcgUFSWDh+g4V27KYQYUaA7dKGhbb3NXRrcrpl/bKTAI1Qn1cJLb
 jDoffooj9ksZMesFzVRh42V9nX2dpHc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-Lu0iXlNNPay4XlWhysZ3aQ-1; Thu, 01 Apr 2021 14:09:27 -0400
X-MC-Unique: Lu0iXlNNPay4XlWhysZ3aQ-1
Received: by mail-ot1-f72.google.com with SMTP id 45so2872175otg.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kx9DbhVSJrB9vI9FErGrA8bAvmekmul4UBa7pJXLaoE=;
 b=NbdcuqFDl+68pBd2qPvyH9aci5/H8rmbMF0+tE6tYs+STF3IdmTs0CN264EsvGSx2P
 bcF06E+l0fFjTESWNUwl5jvXu0aNe6HeDbhdLkqqtOjZFTnALTqRQpOwZu9oodaihLW5
 FI4I7wWgL75lEzjzEfVJ+iFZXxsegp1bJepR8sNo2JwqSUsXoB5zwGBW5iVWo4phaA/Q
 UAY/qEadT82Ob44xb/paYe7xYiVGfF1c0cSfdurKhmO8nwCgJWIgB01lWjXmu/FjqUnP
 nUsMzmYSHSZBgTmo3kPQ8Z5XFu+Tbd4oXlDwM9re1N3ztCO6NiZNrURad3a5KpHfhEer
 st+g==
X-Gm-Message-State: AOAM531LyHUuti2N5QDKshh7siWR5Mq1VGT7al9Tz9ForyOwtbHXOWpn
 AHQgTQP1lgIPeZT/tPAn8aZzhD5QE8VIDVjyv0K2PgsN7DABKrCVyPcMELqfJnKMFLQ2bpXxt3z
 YKkMCURuXptVxZA4=
X-Received: by 2002:a9d:21a5:: with SMTP id s34mr8307607otb.240.1617300567121; 
 Thu, 01 Apr 2021 11:09:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwce7ltC5rlzdmjefW4iZnoG2mF0fmXP4s9gEyZSKWw97K6P7O6Tuo077wW3p+a103CDJR8Q==
X-Received: by 2002:a9d:21a5:: with SMTP id s34mr8307599otb.240.1617300566924; 
 Thu, 01 Apr 2021 11:09:26 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 z3sm1199604oop.41.2021.04.01.11.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 11:09:26 -0700 (PDT)
Subject: Re: [PATCH 2/2] block/rbd: Don't unescape in qemu_rbd_next_tok()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210401155211.2093139-1-ckuehl@redhat.com>
 <20210401155211.2093139-3-ckuehl@redhat.com>
 <c8a21743-6264-fe4e-294f-82f74766a5e7@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <c7d42197-b874-9c81-e8dd-ef0ebf8e784d@redhat.com>
Date: Thu, 1 Apr 2021 13:09:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c8a21743-6264-fe4e-294f-82f74766a5e7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 12:24 PM, Max Reitz wrote:
> On 01.04.21 17:52, Connor Kuehl wrote:
>> That's qemu_rbd_unescape()'s job! No need to duplicate the labor.
>>
>> Furthermore, this was causing some confusion in the parsing logic to
>> where the caller might test for the presence of a character to split on
>> like so:
>>
>> if (strchr(image_name, '/')) {
>>          found_str = qemu_rbd_next_tok(image_name, '/', &image_name);
>>     [..]
>>
>> When qemu_rbd_next_tok() performs unescaping as a side effect, the
>> parser can get confused thinking that it can split this string, but
>> really the delimiter '/' gets unescaped and so qemu_rbd_next_tok() never
>> "finds" the delimiter and consumes the rest of the token input stream.
> 
> I don’t fully understand.  I understand the strchr() problem and the 
> thing you explain next.  But I would have thought that’s a problem of 
> using strchr(), i.e. that we’d need a custom function to do strchr() but 
> consider escaped characters.  If it’s just about true/false like in your 
> example, it could be a new version of qemu_rbd_next_tok() that does not 
> modify the string.

I went back and forth a lot on the different ways this can be fixed 
before sending this, and I agree the most consistent fix here would be 
to add an escape-aware strchr. Initially, adding another libc-like 
function with more side effects wasn't as appealing to me as removing 
the side effects entirely to separate mechanism vs. policy. Your example 
below convinced me that this patch would split the token in unexpected 
ways. I'll send a v2 :-)

Thanks,

Connor

> [..]
> Should it?  I would have fully expected it to not be split and the 
> parser complains that the input is invalid.  Or, let’s say, 
> "foo\/bar/baz” should be split into “foo\/bar” and “baz”.


