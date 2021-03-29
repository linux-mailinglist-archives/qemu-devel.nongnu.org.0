Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4A34CFD6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 14:13:28 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqlr-0008G7-Ey
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 08:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQqkI-0007PN-40
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:11:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQqkE-0002fy-Pk
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617019904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fe2ZJI5iWIKNgDXByMOUtdAYwC2IeU2LlOay7KgIIEY=;
 b=JTAAgo3fEQtfjlwhuQ5RFvRLTNhcwc73GUvBObfR6ZWoUvGk1dypU8Wel4tnN/Z8CHhQjU
 Nv5R1g24Xahtjvp11Lf77f2Nf6kb2YhnCsD+Vs4LcQvRcYiR5x5vX3HLJmrTY77EjjnNHZ
 2crrDgoCJ/ELNewcKgZ/OHfbM1mNU4I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-mTfBQ0dCOnKJLnMhy8Xt4Q-1; Mon, 29 Mar 2021 08:11:42 -0400
X-MC-Unique: mTfBQ0dCOnKJLnMhy8Xt4Q-1
Received: by mail-ed1-f72.google.com with SMTP id k8so8472956edn.19
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 05:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fe2ZJI5iWIKNgDXByMOUtdAYwC2IeU2LlOay7KgIIEY=;
 b=FrXKkqRgIg0PnSHzEQXONOOKfOhPP8WYJnxjBXMR4QICbg7/dhbDUkPMfGFCSZGE+I
 79bTNTwCu/WoH+DqdWmqoWBrIJu7SkvJpui4QfRhFzLi2HxTicFLBRkyyX6ZWY7iNG0c
 nEy1Ek09SirjY+sJks8AZ/q2/XjgshkdI7+SM5ckXj5sKN/zpJwrCQRVHBvuVndma7MK
 qPlI2qOf0ojMPfuWmNOGZv4UJthwis4omOl7imIwCMrohU2rdmglGtmLx8jfnU0oZl27
 +43BipZKdBn+z2Hgw+xv4yoxOFKjMvmLdGeUK2i8mCGhvII9FiIuWtTMuAYBSHw3mjvQ
 DBUw==
X-Gm-Message-State: AOAM532Nlhw3H/uw1/2VNrMyc+FLoh5vqZh8I78Frn1ZngqaevTwIX9u
 oekHTTDF3r63v3pUDwgZAUiZ9xjaLn4wBVr7TwLbiaUcS4nCalhlruxZ86Uq/7G0kXuTZuJmCOK
 r8anG1MXiK4igUwE=
X-Received: by 2002:a05:6402:38d:: with SMTP id
 o13mr27857423edv.337.1617019901487; 
 Mon, 29 Mar 2021 05:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyESkzt3kBjsRxWHrEQyIRcmmLMzpM1bSeHT5AcCJFEcRnsNKSyYa/GIAoHgFX9+/42JODDpw==
X-Received: by 2002:a05:6402:38d:: with SMTP id
 o13mr27857250edv.337.1617019898916; 
 Mon, 29 Mar 2021 05:11:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n16sm8994993edr.42.2021.03.29.05.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 05:11:37 -0700 (PDT)
Subject: Re: [PATCH] replay: don't wait in run_on_cpu
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700514781.1141125.8890164582302771524.stgit@pasha-ThinkPad-X280>
 <e18262ca-c41b-2257-323a-ff22ba462ed5@redhat.com>
 <2f94f9b5-0a90-dbc1-e35e-d6c43580c127@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d43889b5-ebf6-12e5-af95-94e25bc7d383@redhat.com>
Date: Mon, 29 Mar 2021 14:11:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2f94f9b5-0a90-dbc1-e35e-d6c43580c127@ispras.ru>
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/21 12:55, Pavel Dovgalyuk wrote:
>>>
>>
>> Is the "or" saying that the execution is using the lockstep mode?  If 
>> so, can you put it in a separate function so that it's more 
>> self-explanatory and check if it should be used elsewhere?
> 
> It was replay (is that lockstep that you mentioned?).

Lockstep in the sense that (as is the case in record/replay mode) the 
I/O thread and vCPU thread execute in turns.

Paolo

> I check that the mutex is already locked, which means, that vCPU
> does nothing at this moment.


