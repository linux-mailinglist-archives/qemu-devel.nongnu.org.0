Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2D3281C3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:06:14 +0100 (CET)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGk7h-0005Vg-LC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGk6f-0004a3-RR
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:05:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lGk6d-0006tJ-0V
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614611106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rv26ch0Pz7L7YgaPPDZXBz2cUXfCtNgZlG/7rsH0IM=;
 b=hdwXxwSnvnKcZaLQLNIFB101njjNp17msl24H2LB3SdXheQxfp3LrII6oYXYncjQ7AqjZo
 1jPArMYsgwK2n/83HGt0sxAZ+/oWKhgsPFcv94l6WWaTiXhyQcFOVjnHlrVzNsmVyVfJSo
 jS46kmfzV/8QSAROKlxhHNeRu1xUR6c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-HXd6y87jPSupAZzVvbmCKQ-1; Mon, 01 Mar 2021 10:05:03 -0500
X-MC-Unique: HXd6y87jPSupAZzVvbmCKQ-1
Received: by mail-wr1-f69.google.com with SMTP id b7so9513562wrv.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 07:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4rv26ch0Pz7L7YgaPPDZXBz2cUXfCtNgZlG/7rsH0IM=;
 b=cnWD7vaA2yOtgYHLVvsrevjd6khF1ZovW6RqDyfcF4ypEe0QWLS8sdiOrr/xRs0ds+
 G/LNlBmhri8yKBTSyLV3GMO5m3BVHdq5cc/l+QJeOTZlbR9vbWiQ8wDc0uxmli5LUM4B
 88DTXuzy3h1m3uytv5oWS7AtuMpwlbw8YrsbSpGMVk/ugOLFnMiCM1N+3LD85GMnIzt3
 UsC+tK7wK7y9vArokOezgsj3IYfBK2BudYYbdDUzwq2Y5a3Gy2++ov5IV5rJgPteySeO
 +Jb1TwKHFQzFUjzi7+a7ONzTAGtsvF7HkSuzcvg9y1/YiyO/oq4jo4y8gK+EpqonjiFJ
 3llg==
X-Gm-Message-State: AOAM5329GtTt/VWFyRHf1DtkZMXqbIlGlZnc2UU4i4lLPUfNu8JDJGEc
 kgLQHD8A6+WgZY0xhyKycNhIperdBlbmpRp8OpLw62qSio74lm3vsFMXTMFV1X/c1chx5qdbFso
 naHtHX4YlMYM5tmr+5UI9kg6a81lMkd2g1rRa2IL6CXD6h9jclRRgfdKVXXLXqs5HnIM=
X-Received: by 2002:a5d:5043:: with SMTP id h3mr17015259wrt.120.1614611102170; 
 Mon, 01 Mar 2021 07:05:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/KS1qEsGkF6FEnTRaIS1ZLAKOwMTwSB6WjbFMGp0u3v2X5pPesc8VWWJ5oLDdGfkoK1THYg==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr17015232wrt.120.1614611101961; 
 Mon, 01 Mar 2021 07:05:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g17sm24029417wru.60.2021.03.01.07.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 07:05:01 -0800 (PST)
Subject: Re: [PULL 27/29] vl: deprecate -writeconfig
To: Markus Armbruster <armbru@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
 <87r1kzl2vy.fsf@dusky.pond.sub.org>
 <94db680f-a43f-7f94-a897-5512ceef6b98@redhat.com>
 <878s77hunk.fsf@dusky.pond.sub.org>
 <51d463b8-29ec-b0b9-fece-d8a7594f7dbe@redhat.com>
 <87lfb6gc0e.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8f8ab7fd-c0bd-9305-3699-84ac0e825ca8@redhat.com>
Date: Mon, 1 Mar 2021 16:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87lfb6gc0e.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 01/03/21 15:54, Markus Armbruster wrote:
>      warning: -writeconfig foo: -writeconfig is deprecated without replacement
> 
>      warning: -writeconfig foo: option is deprecated; there is no replacement

Hmm I don't know.  I like the brevity, but I find it to be less 
user-friendly.  And the "it" and "this option" sound wrong on a separate 
line.  Maybe it's just me.

Paolo

> 
> Properly guarded, we could have something like
> 
>     warning: -writeconfig foo: option -writeconfig is deprecated
>     This option will go away with no replacement.
> 
> I'm glad you like &error_fatal, too!  I have had to defend it a few
> times 


