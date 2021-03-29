Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E434CFD5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 14:12:43 +0200 (CEST)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQql8-0007ne-Ge
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 08:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQqjK-00078w-W7
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:10:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQqjI-0002Aj-Vm
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 08:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617019848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufaaHvqrPkYSMbtAjYMPu5xe5gVwD/UY1/0CQEYQwnk=;
 b=fQe/Ovv8s3AGDQX9fQAkFajpENJQ4+8Tv2ltlIGIWnWI9RlORmW71K+z37QuMtHBGqZjaN
 ujEW7qQW0F4b2gzOJXLMxiGHFbfCI4bPbpZ8aw05Lr+X6o5cL39njaGGjH33fikuAPF0J0
 YzWGh96PMbphStbbdoKKFujOURT0Cgs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-V4RIsm_SPJWKJz-5yqCkKw-1; Mon, 29 Mar 2021 08:10:46 -0400
X-MC-Unique: V4RIsm_SPJWKJz-5yqCkKw-1
Received: by mail-ej1-f71.google.com with SMTP id fy8so5681421ejb.19
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ufaaHvqrPkYSMbtAjYMPu5xe5gVwD/UY1/0CQEYQwnk=;
 b=uXS3GHw9oo4nEUEfYwuwjxqMJB9ZlZbhF7UUQyJJ2nqMVe0rf28gXexpNP0Tk7ruTO
 pvgTbRj6YfDPfiYcgXjPk28GFwqAj4uqZuXNBkas0pNYgqxGOHL1TMmRfp6BW1+b9Ppn
 vAWbOjmOFBfBYdB0+NUvGgjvgZdVdh3LoCJE/pbCaYieao9ln0L8Fip0ERza+6KeDouC
 esEeBSP/rnjffsd2ga+TMwdJ8QA9hlNNWuM8+K6zgcQcPEJgjryy8SHV75floVlQVdaT
 cLHva+t+CFq47wmUaNbgt+NlQr8wYDgGkKFJNoYPDSXbdqZbRv2zraGYgfoo9wCOqQNQ
 OZQA==
X-Gm-Message-State: AOAM533T2arRBNx1Id883W64qeCucx5a04d3BoFt3ABsmbmSCMHrVVU+
 BV261IRLSEMQpQI70s7qOpkT0BtaN8vfp3W6gzHGvDm7hMIvcQDaWY+ZTAjn+UjqAFbpRgPhVTw
 XHokKne9FKMENrYc=
X-Received: by 2002:a17:906:ecb8:: with SMTP id
 qh24mr29057696ejb.162.1617019844837; 
 Mon, 29 Mar 2021 05:10:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySUdhy1w3VKI0WEkndUrtWR9f51PKcOEez1EYbZaivXrhmvCZqEfHvz0/G/FS9QPCXaFzg0Q==
X-Received: by 2002:a17:906:ecb8:: with SMTP id
 qh24mr29057683ejb.162.1617019844666; 
 Mon, 29 Mar 2021 05:10:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id l10sm8974249edr.87.2021.03.29.05.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 05:10:41 -0700 (PDT)
Subject: Re: [PATCH v2] replay: notify CPU on event
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161700382734.1136014.13372992399972618499.stgit@pasha-ThinkPad-X280>
 <0fa410cd-32e8-5349-dbde-0c61fdc29e80@redhat.com>
 <4be6bee2-fa58-09ec-439f-8ccd99a965e8@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a05d12f6-7e2a-53f5-5aaf-1fbdea8b0bb5@redhat.com>
Date: Mon, 29 Mar 2021 14:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4be6bee2-fa58-09ec-439f-8ccd99a965e8@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/21 13:23, Pavel Dovgalyuk wrote:
>>
>> I still do not understand why the qemu_clock_notify function is used 
>> to notify the CPU.  It would be nice to have a description of the call 
>> chain in a comment or to have a more appropriate API.  I can queue the 
>> patch since it's deep in replay-events.c and not in common code, but 
>> if you post a short description here I'll integrate it.
> 
> Maybe I missed something.
> This call is needed for the case when vCPU is waiting in rr_wait_io_event.
> You mean that we can use qemu_cpu_kick instead?

I have no idea.  Using qemu_clock_notify however is definitely weird.

Paolo


