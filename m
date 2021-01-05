Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C22EB258
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:19:24 +0100 (CET)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqvT-0002Lp-6n
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwqu6-00012f-Ck
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:17:58 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:37441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kwqu4-0006qJ-P0
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 13:17:58 -0500
Received: by mail-qt1-x835.google.com with SMTP id z9so339738qtn.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 10:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NhwHGv71uhcJUIfaqRBHc4+t3HQzpiocmWY+gKRIFUA=;
 b=mZoHLuynPFk3lf0wfw7LwGLxInLM/lnoWhuZZlLBx/oSX9EPy8orfakNtYqk+6QagC
 +qSGYESlnzdSXSduu1kVHDluH9ZTTZ5Bdt2F8kMNT6NWvRz35CyyZr/gPikzLQV6hPD/
 4CnmVzYGHmYc8AFRb4Rwt028Jremg2xMZdghnavFHw+vxjOpWhEU+/Kak7ENIHjNvJXS
 AxXX2BzcAqHNVjpS5DHH294gTjoLKCD936jGH1J4uUHZ+Z0dy4xNjN1EvvIFglO/WnuJ
 edDl78FIsBjWcweO0knJHWxNmJQIY2lAVef+oMCvs3miRuQfqDNTCWKWPNtyw+i+erK9
 ZpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NhwHGv71uhcJUIfaqRBHc4+t3HQzpiocmWY+gKRIFUA=;
 b=WISzq9SAlMZ3du0W6q3fzTxtQ7I37cxEuVEHZWfW67zi95CuOvi6Ns77eO82h7bFfQ
 REBAw1A2PPV9Veb+sYPyX7qUG1p06l0fbsjsQ9V4xAGo2CqrAFY79QeIqfiu5IDopWGj
 ak+mL+wNsQyUEq2JqwpcaYqysZghi4kh8GsFpi7s08i02toCpOzDcYYrOGB7uKkJDu71
 D76/eppc9r0tIjooC4GxYzxzVtwzLsE9mSi5UAcnN1oFQd3mw+Ppa51/xuA3Slv2+tGX
 icNdkhiHWyzwmv5DzthDBevv4rkDSWqUc8Lwwx9dRErAelniZkn6U6VD4QxXenuyHoSM
 vpYQ==
X-Gm-Message-State: AOAM532cnIISWUn9nLbrcjy1TVUNiZWAQR8ZxPiW/C0R8MKTX1B4G9bZ
 SWZvCHxll+YRiouFwTiwddo=
X-Google-Smtp-Source: ABdhPJzVlEhu8NfYJvZ9zIiJou1Na+8qN0goKv8vNgU+oT//YLVZT4kLJ+j29SM7CySWm+NQu3nRPA==
X-Received: by 2002:ac8:6bc6:: with SMTP id b6mr714240qtt.232.1609870675482;
 Tue, 05 Jan 2021 10:17:55 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:63d2:cecd:bc88:6607:5111?
 ([2804:431:c7c7:63d2:cecd:bc88:6607:5111])
 by smtp.gmail.com with ESMTPSA id j124sm458358qkf.113.2021.01.05.10.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 10:17:54 -0800 (PST)
Subject: Re: [PATCH 1/1] vl.c: do not execute trace_init_backends() before
 daemonizing
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210105180325.536160-1-danielhb413@gmail.com>
 <6637b86c-d0f9-4253-2f04-3ceec1a6edc2@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <b04e25c8-fedc-4834-96ae-d1c86ab0e902@gmail.com>
Date: Tue, 5 Jan 2021 15:17:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6637b86c-d0f9-4253-2f04-3ceec1a6edc2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.249,
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



On 1/5/21 3:09 PM, Paolo Bonzini wrote:
> On 05/01/21 19:03, Daniel Henrique Barboza wrote:
>> +    /*
>> +     * The trace backend must be initialized before daemonizing.
> 
> after, not before. :)

hahaha messed up in the comment block. Typical.


> 
> With this fixed,
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


Thanks. I submitted a v2 with your R-b and the comment fix.


DHB


> 
>> +     * trace_init_backends() will call st_init(), which will create the
>> +     * trace thread in the parent, and also register st_flush_trace_buffer()
>> +     * in atexit(). This function will force the parent to wait for the
>> +     * writeout thread to finish, which will not occur, and the parent
>> +     * process will be left in the host.
>> +     */
>> +    if (!trace_init_backends()) {
>> +        exit(1);
>> +    }
>> +    trace_init_file();
>> +
> 

