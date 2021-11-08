Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FBB4499EF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:33:02 +0100 (CET)
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7Zt-0007Nc-8i
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk7RA-000337-EU
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:24:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk7Qy-0002FQ-GC
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHxPg3cxnt2TQZYasYEVPH22GQ6W6uUgxqwxjahsAm4=;
 b=e1dWYEaIDBseXBOZMEnMyd2eoNqYm+SCt1J5SsWJNXhQJq1Ego+V4D2QuzA+bWgovM53XC
 ePTWcbZwz+aEkdGXx7yyWIw2JYuw/VNnbkvWWOMhyI46sn+L+uGbOzIzWtP2VJ3bUThwEI
 nk83Yeg8cGaHgIbuiJx8XhuehMIbntg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-4OSky-uqOfW5Op7lZbHENA-1; Mon, 08 Nov 2021 11:23:45 -0500
X-MC-Unique: 4OSky-uqOfW5Op7lZbHENA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso4207228wrj.12
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DHxPg3cxnt2TQZYasYEVPH22GQ6W6uUgxqwxjahsAm4=;
 b=w3k0+Hxc79v6pLnxm7IByb+orN3yqHdHoXLWqmClAAN9oS4NJytaOK/tKLUzb2Qfqf
 dhB5q+PWJ+pcm78inw966q6VYR3Sn+OFn9+Igru4yGG9S6GXNkAqX4qxUQeqYGGRZlyW
 OqG4M/9mJoZuQTXjkS5xWkmeKivEb4F3yV8zDJc1JfTbr9/Iaralz4OXeZCPlq7K6FHv
 Ix86kbcsnZzjTnPhI+r9LFbw32fv70H1o7nYSFMf0w+N9bDXu5S5hlhGsHxmN53Avkmz
 QaahepX/W8sKU6pI4sEWTwvOzEumH9xcWBnhsbsZV4ixm8E7NYZPzExG9UhHR0gRn4cc
 VY+A==
X-Gm-Message-State: AOAM532Fk1my8SRbvB7kDt/19HxfxBnHw8Kf/Tad+/uqHd5jkd0+zFxF
 4n8WkhMtjyqg6D6aAW2zeKJ9uUtyUqLNtjRMBYwuKQQdwT7s5HTIChxXSH+8O/9bh0HClrd7CE5
 mRZZ5dSQim66ozPQ=
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr35627734wmj.13.1636388624426; 
 Mon, 08 Nov 2021 08:23:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweXznOUk6zcPJhIVXGU0Y94y6K3emntqWnh3oZcVpZsJm3aoG/75s0aVy4JQRDtea1tuTKpQ==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr35627703wmj.13.1636388624178; 
 Mon, 08 Nov 2021 08:23:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm18996269wmg.30.2021.11.08.08.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 08:23:43 -0800 (PST)
Message-ID: <b476ec65-46fd-7d8c-770d-0351c245df09@redhat.com>
Date: Mon, 8 Nov 2021 17:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Artificially target-dependend compiles
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <87czneyaw3.fsf@dusky.pond.sub.org>
 <2e4b52b0-b1fc-58c5-9631-fbf9d7f927fc@redhat.com>
 <87fss9u3zj.fsf@dusky.pond.sub.org> <87ilx3nk5p.fsf@dusky.pond.sub.org>
 <837be094-8a70-b364-3f85-5e6af8c05304@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <837be094-8a70-b364-3f85-5e6af8c05304@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 16:38, Thomas Huth wrote:
> 
> Hmm, we used to have a config-all-devices.mak file in the past (see 
> commit a98006bc798169e which removed it), maybe we could re-introduce 
> something similar again, but producing a config-all.h header file 
> instead? So that this header file contains switches like 
> CONFIG_ANY_ACPI_VMGENID and CONFIG_ANY_ROCKER that are set if any of the 
> targets uses the device ... and these switches would not get poisoned in 
> common code... ?

That would work, however the schema would still not provide any more 
information than it currently does.

Paolo


