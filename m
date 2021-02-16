Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5F31C99B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:24:56 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByTP-0002Oh-5U
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lByRq-0001mW-7V
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:23:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lByRn-0004zm-95
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613474593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCxEhdc+bYLSnpVfpxkvqnrM4bigMSP8BF9dnnWAkwI=;
 b=ax10l3qZkWjbykmlCHGuZrEl7LVkgNoegaiVOonWr4RYlJbnYo6FSA+1LoNF+3NONZVoX1
 uXyJVI7T8MBCVWoOS0QKMJhMowF9B/PmJ9RqZhdFZS/o0aEBMcuNe65gtImMfZ69APbbcE
 6I6sn7pgdwGC8/As51wtLXxx1E/SwrY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-PIcJeI2UP6KtGPvBwrdbCA-1; Tue, 16 Feb 2021 06:23:11 -0500
X-MC-Unique: PIcJeI2UP6KtGPvBwrdbCA-1
Received: by mail-ej1-f70.google.com with SMTP id jl9so5779893ejc.18
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YCxEhdc+bYLSnpVfpxkvqnrM4bigMSP8BF9dnnWAkwI=;
 b=q6Z63aEyirxO5og9pGg90Mkm6t9P3x/1p2ipGMoAxD06VnBCrJ0eLIAPyyEltN/nU5
 RrPUvDOmnPe6A5SNiH4arfKfz2YrP+JvlbHQj1nmQ11Igm4l7gjyeVtmOxaSxeblECU9
 6R8r4SeUcxkTlL7L+rxq//qmVXipQ5/d8FMvzNYcAaJZLgyotw1e95dCfGp1mkXAq+Z7
 Izhwk6Km99VmrTBt/8Yc7aDOEfNJsaGhyFPro8+e+JMsFtTdOYScY5sbXoFBSrbpBa9M
 4241XWhuTSY8t6CTFSK7uERdZobBHHz0iPAuMpApf919OkHkHCG3UP886BHWjL7iZnZI
 JJjQ==
X-Gm-Message-State: AOAM531VUNDFwp88osPoJoZUsAYA19ugRPWLcy190RuL18elrm3iZ8cO
 XIxS7fRQL3IbRI7enz8T7Td54/wRWtr1bnVXk1wWIcVISJgem5XhlCqtjbFY1JprF24Uu6T2jy+
 aDtHhCisIJWLGBX56HdMbW9SVG5BcFwinJtBTtkRSog3QiRdZ5bS9pA0c3BuoLRMdJ7c=
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr19777920edu.7.1613474590207; 
 Tue, 16 Feb 2021 03:23:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw44c9XV5kBlfBOtGVqsYw9m1vzrlrToQdsGbcfEVsH/+t3OUvn5ZG3xrx7HszFzg6fHXExfA==
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr19777908edu.7.1613474590013; 
 Tue, 16 Feb 2021 03:23:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bm2sm13166274ejb.87.2021.02.16.03.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 03:23:09 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
Message-ID: <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
Date: Tue, 16 Feb 2021 12:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 12:04, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 10:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> For this to work, one would need to have a typed string->QAPI parser,
>> i.e. one that takes the schema as input rather than doing a generic
>> parsing to QDict and then using the schema via the visitor.  That would
>> IMHO be overengineered for the purpose of saving five keystrokes on
>> "server,nowait".
> 
> The point is not that it's saving five keystrokes. The point
> is that "server,nowait" is how we've documented that users
> should select that functionality since forever, and indeed
> is how we're still documenting it today, and therefore changing
> it is breaking the existing working setups of a very large
> group of users.
> 
> Historical warts that nobody much was really using can be safely
> excised; historical warts with many many users much less so.

I agree, and that's why I have no plans to move -chardev off QemuOpts; 
warning is a different step than excising and sometimes years pass from 
one to the other.  However, that doesn't prevent introducing a warning 
so that users slowly move away from the problematic functionality.

Also, "-chardev" is not the way that most users will configure sockets. 
  The more common "-serial tcp:localhost:12345,server,nowait" will not 
trigger the warning; that was not clear at all from the the commit 
message.  It may even make sense to deprecate the *long* form in that 
case (which I am not planning to do, to be clear).   I'll fix the 
documentation for those uses that are affected, though; thanks for 
reporting that.

Paolo


