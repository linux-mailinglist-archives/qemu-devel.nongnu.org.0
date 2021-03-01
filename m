Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03583283B6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:26:07 +0100 (CET)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlN0-0007NF-Qf
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGlLM-00063e-Dx
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:24:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGlLK-0007U2-Mh
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614615861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBe9/7eI6zhUsqxLc0YnWF1IvLGcvh13UBQze4VzE4I=;
 b=CyblsC/gZlWQwvCs0uLBha1TnckFAnq2M8KtLBJI1UJ3KZmqYyPEwLwUOFZfEALdeuSKma
 niUqgfcH1r5gdL1Jr5CgbNbPHY3teQGFPX79JuKjoEXM6ht2nuXGLXet7h9IY++iJI1tcT
 +wK96vHIXEc8TPFko3zLj0tccH836+g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-GVzkOax-MfuckiPgLnij_w-1; Mon, 01 Mar 2021 11:24:13 -0500
X-MC-Unique: GVzkOax-MfuckiPgLnij_w-1
Received: by mail-ej1-f69.google.com with SMTP id ml13so6867116ejb.2
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xBe9/7eI6zhUsqxLc0YnWF1IvLGcvh13UBQze4VzE4I=;
 b=Nvoxm8wj2BKNKvOV1hYURFs3qNh2Y/HUq77j7MZhD5JijDCqhodnbFceXL919j0nc2
 oQVNQOPb3ci575soiZPXKz7GyTwIDqyE5onsrq6RY1RiPtdGjnAJC8hGWpez3Ck6Ik7+
 BvSpvgEUJuwQ7LmfEIGHVOoKytOQ34fsa/5k6nIflk4DkwGNCQUBzEU3ij6JdjJzJyx8
 XAPClgkxBR/mXDSfhhESLITLvnjWr9IQfGwxJ7Fa6sT6cHW6NnPSrsNbkeGi5dKYRubT
 8uDn7qdm2ZVVpXIoYSzZPuAWVa9sJpNG6y6PIr7kCfxp648Z6/7d8VRPGgsI2WjTlRDc
 WIig==
X-Gm-Message-State: AOAM533vCEfTBDitTwBVs0Ori3pT17ERxstPwrNikDh4wk6cDj1N/E37
 0LV/w6K4SCuuDL7a1O60S2SkKORir+i5jOxgOYhYJ1whPPAUxdckvtDSD0faRxGSBPd784McUjY
 iMWgfcxACJm968M9/vZXpev/TyJq4tOLFXnKr0FYXRUesMMNNSaT/Jd4YJheZkL/iUj4=
X-Received: by 2002:a17:906:af91:: with SMTP id
 mj17mr16125424ejb.230.1614615851680; 
 Mon, 01 Mar 2021 08:24:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAcLkHaojyEK5VCurS+AHhCPly8qVJbwoUCC+qNvtvP0+qGwjZD60OhWwbNFkE74qXb7nvqg==
X-Received: by 2002:a17:906:af91:: with SMTP id
 mj17mr16125412ejb.230.1614615851509; 
 Mon, 01 Mar 2021 08:24:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f9sm2898802eds.41.2021.03.01.08.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 08:24:11 -0800 (PST)
Subject: Re: About '-readconfig' [Was: Re: [PULL 27/29] vl: deprecate
 -writeconfig]
To: Kashyap Chamarthy <kchamart@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
 <20210301160335.GA86420@paraplu.home>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1294a3c2-352b-c9ba-7b29-71cc48227091@redhat.com>
Date: Mon, 1 Mar 2021 17:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301160335.GA86420@paraplu.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/21 17:03, Kashyap Chamarthy wrote:
> On Fri, Feb 26, 2021 at 09:05:24AM +0100, Paolo Bonzini wrote:
>> The functionality of -writeconfig is limited and the code
>> does not even try to detect cases where it prints incorrect
>> syntax (for example if values have a quote in them, since
>> qemu_config_parse does not support any kind of escaping)
>> so remove it.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   docs/system/deprecated.rst | 7 +++++++
>>   qemu-options.hx            | 7 +------
>>   softmmu/vl.c               | 1 +
>>   3 files changed, 9 insertions(+), 6 deletions(-)
> 
> [...]
> 
> Hi,
> 
> Sorry, I'm coming very late[1] to the discussion.  Will there be a
> replacement for '-readconfig'?

-readconfig is not being deprecated, there will be some code new to 
integrate it with the changes I'm planning to option parsing.

Paolo

> I agree with Gerd's comment[2] in the last year's thread (I missed to
> notice at that time) about '-readconfig' being useful.  I'm familiar
> with least one hosting provider who uses[3] '-readconfig'.  And I've
> also used it for small snippets myself.  I understand, these simple
> use-cases doesn't make it right to keep it. :-)
> 
> I'm not saying "don't deprecate '-readconfig'", but just noting its
> usefulness, even in its current form.  So I'm just curious if there's
> be a suggested replacement.  Even if it means: "use libvirt; or use your
> own bespoke scripts".
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg03681.html
>      "proposal: deprecate -readconfig/-writeconfig"
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2020-05/msg03681.html
> [3] https://github.com/flyingcircusio/fc.qemu/blob/f789e57f605969a0/src/fc/qemu/agent.py#L1153
> 


