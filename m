Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F575EFD21
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:36:08 +0200 (CEST)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odyOF-0006O1-Bc
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odxRz-00024C-SB
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odxRt-0006Mr-31
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664472947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6QvssFP6fElsinFmtORISS+XoH9LM/qj79vCQgHmORo=;
 b=NU82S2u3GGINBAwtGDEXxYnqVTUkybJMIn8W7vXEnZrBGx7A5WkgNszGANGMB6bXtKLYWU
 1TiwNq+OGEo9CkjFIOQjRWj9qOogo0d0D0JVvjZMXfrV6kt6kYYJN4HcZgIpNWcbXbK1+l
 Sy/N+rXOs/covVy9LLqm3y3uQjtLpTM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-xYJxP-GRPwmq3SEqId5K6w-1; Thu, 29 Sep 2022 13:35:46 -0400
X-MC-Unique: xYJxP-GRPwmq3SEqId5K6w-1
Received: by mail-ed1-f71.google.com with SMTP id
 c6-20020a05640227c600b004521382116dso1775855ede.22
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 10:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6QvssFP6fElsinFmtORISS+XoH9LM/qj79vCQgHmORo=;
 b=GcdTeabS5ujvhc4q9lfUENXXlYP/iWcu/bhadTP6erFyySJFzZL403MtB0cGuL9YFX
 aXc8ff7mSGSwqEScfCl4vNKP6L2NlKNzOuhH/bSFC0h2WOxeNOGCphdKC2G+A1Jt5KM4
 zz9iaMZ8t/pTksIZxmU2+JYhm8zUzoCEl/SND9HlsuUqLmuLAEZlmLm89hYq28XjHOqM
 ksUmuGz8i/mr+HUxz7j6QfO1dCAzDFtKjUVi1HJyt8TX5HWuczH7vgcFP733laGM/sr3
 znCfq0mU9ApxjoUa+eQKQE883kRPHmK3dj1lf66sA+z2GiYh7P+g5WFIpBZ5UBl5IioG
 l9mg==
X-Gm-Message-State: ACrzQf162CKPVDBaDIfpbrt9qiPIcap/dM3UnqWEfr1x7QYMqqQLgSyh
 /ly6bzMAR4CM9/RLvzzO+rUwDztHbvXGWTEqQ4iLjcPLAo1ne5+a1aCjiW/QzkJn2SiIYjEUwqn
 vyLaL8JWQ+pZ943c=
X-Received: by 2002:a05:6402:5110:b0:450:c196:d7b1 with SMTP id
 m16-20020a056402511000b00450c196d7b1mr4360248edd.117.1664472945483; 
 Thu, 29 Sep 2022 10:35:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4A74v/Mt3k+wNZ3JdUTgnnAt+nGzICSWWKg87i5m1tJ9DRruLO3VYyV2zBao0y66SzFcmaDw==
X-Received: by 2002:a05:6402:5110:b0:450:c196:d7b1 with SMTP id
 m16-20020a056402511000b00450c196d7b1mr4360230edd.117.1664472945244; 
 Thu, 29 Sep 2022 10:35:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 l13-20020a056402124d00b00456e98b7b7asm67429edw.56.2022.09.29.10.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 10:35:44 -0700 (PDT)
Message-ID: <32db4f89-a83f-aac4-5d27-0801bdca60bf@redhat.com>
Date: Thu, 29 Sep 2022 19:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Kevin Wolf <kwolf@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
 <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
 <a2825beac032fd6a76838164d4e2753d30305897.camel@redhat.com>
 <YzXJwmP8pa3WABEG@kbusch-mbp.dhcp.thefacebook.com>
 <20220929163931.GA10232@lst.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220929163931.GA10232@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/29/22 18:39, Christoph Hellwig wrote:
> On Thu, Sep 29, 2022 at 10:37:22AM -0600, Keith Busch wrote:
>>> I am aware, and I've submitted the fix to qemu here:
>>> 
>>>   https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00398.html
>>
>> I don't think so. Memory alignment and length granularity are two completely
>> different concepts. If anything, the kernel's ABI had been that the length
>> requirement was also required for the memory alignment, not the other way
>> around. That usage will continue working with this kernel patch.
> 
> Well, Linus does treat anything that breaks significant userspace
> as a regression.  Qemu certainly is significant, but that might depend
> on bit how common configurations hitting this issue are.

Seeing the QEMU patch, I agree that it's a QEMU bug though.  I'm 
surprised it has ever worked.

It requires 4K sectors in the host but not in the guest, and can be 
worked around (if not migrating) by disabling O_DIRECT.  I think it's 
not that awful, but we probably should do some extra releases of QEMU 
stable branches.

Paolo


