Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273BA2FD61E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:53:39 +0100 (CET)
Received: from localhost ([::1]:58102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Gji-0007uM-7x
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Gh8-0006D0-8w
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:50:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2Gh5-00072w-TT
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611161454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBWIY5qdYz+CXNsAdaVuYXGMm8Y6P7fbTUK+m0bxvxs=;
 b=Apbtpvf3gcnz+fqaywrbl9ANmu0KforbQDmkER55o4uyi8um94SORW7aG01ynVAsir2rF8
 A8nmdQLChe7qAhtRfm2XVGZV4nP/CE6BfdOdX6sZaMh+x174tUkRsfNCwbyCLNPouozKuJ
 PB3mwE1zMQK1wREGeNAM3ILF9QQY+fY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-XEAbbG1fO5e-ofmURNzl8A-1; Wed, 20 Jan 2021 11:50:51 -0500
X-MC-Unique: XEAbbG1fO5e-ofmURNzl8A-1
Received: by mail-ed1-f71.google.com with SMTP id f21so11091625edx.23
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oBWIY5qdYz+CXNsAdaVuYXGMm8Y6P7fbTUK+m0bxvxs=;
 b=dsdslNIqQwl6hw9k/+9AfczmQcAxQMvC1+I/qgYcbSXkYkvjWf91nHy+26OaabgawA
 rnU53sutUTQ4sZ5wNtOTYabl1D1KMWz91af3udNlAPDGthKs2+XsGl8tK11qoLFq8jET
 ShRFuqCD/PM3PAJxSWETrr/BV1snxqP1wniD/3fCdfvASLUd/FbqEF3dacZE3kHJrnwv
 2bLBwQJwXkIUnmAg1iLp7wbZ5cb7BF+x0Is4QqVJ/em13ORSF/B1rUwW3myXjIwP9I5r
 pxd5C41E3ddDgPgp91+XIO5siI3sthaDNiP2CUyV3eFQZmZrOSsBcYdxTOfgWbajAbVA
 yiEg==
X-Gm-Message-State: AOAM533wVrl7arFrMMP+/zU/3aymxCZw4EPDsqih7ec+n+2YCNmfeeIT
 65yvgIF9BoMUff84F1neZDkJBlIskwXYXMOUtc6D+Fta7KyUGWa107S5mtuqiyrAIi1wbFtwbrl
 0KUKpgnhk0Mwg3yo=
X-Received: by 2002:a05:6402:2207:: with SMTP id
 cq7mr8397175edb.272.1611161450671; 
 Wed, 20 Jan 2021 08:50:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynEi15hMBz6HL9PFJzWrlsVclVVOkeDQbIuger6dFXex8zm47rOfBxXR+3cXT8o2zvCHFepw==
X-Received: by 2002:a05:6402:2207:: with SMTP id
 cq7mr8397164edb.272.1611161450493; 
 Wed, 20 Jan 2021 08:50:50 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lh26sm1107832ejb.119.2021.01.20.08.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:50:49 -0800 (PST)
Subject: Re: Thread safety of coroutine-sigaltstack
To: Max Reitz <mreitz@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7f480097-e1d0-1cec-9bff-dd9f8d847dff@redhat.com>
Date: Wed, 20 Jan 2021 17:50:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 17:26, Max Reitz wrote:
> Now, this all seems obvious to me, but I’m wondering...  If 
> coroutine-sigaltstack really couldn’t create coroutines concurrently,
>  why wouldn’t we have noticed before?  I mean, this new backup case
> is kind of a stress test, yes, but surely we would have seen the
> problem already, right?  That’s why I’m not sure whether my analysis
> is correct.

Probably the BQL was hiding the issue?

> Anyway, I’ve attached a patch that wraps the whole
> SIGUSR2 handling section in a mutex, and that makes 256 pass reliably
> with Vladimir’s async backup series.  Besides being unsure whether
> the problem is really in coroutine-sigaltstack, I also don’t know
> whether getting out the big guns and wrapping everything in the mutex
> is the best solution.  So, it’s an RFC, I guess.

I think that's fine.  The coroutine pool will hide scalability issues.

Paolo


