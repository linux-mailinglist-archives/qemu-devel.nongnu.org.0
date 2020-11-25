Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36652C4A51
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 23:04:53 +0100 (CET)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki2uC-0008Ez-El
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 17:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ki2sY-0007mw-NR
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 17:03:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ki2sT-0002tB-Ad
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 17:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606341783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpM2QVMAF4g7JVu233TUI9IzJbPw/HVIkZKwvGw4G2c=;
 b=V/2/aEzyJJV75+zV/CmCyZWy36Ydw2OPlYKbdiBj94R4G9mPvsJrz3tVLsCmhKFFuu/0k2
 Fb/7bcltDB78KZBWssgTsvaBSrmMnO0MB+YkGhAIhh6F64SM/ZTMgHDxAlOsf4StOOScFE
 nrX8sVqi7JZeh5tAAB4eXpkmkqP6bTs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-aD43DeVcM4Gt6OVUO1U5dQ-1; Wed, 25 Nov 2020 17:03:01 -0500
X-MC-Unique: aD43DeVcM4Gt6OVUO1U5dQ-1
Received: by mail-ed1-f71.google.com with SMTP id x15so78365edr.10
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 14:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpM2QVMAF4g7JVu233TUI9IzJbPw/HVIkZKwvGw4G2c=;
 b=DGBq2V0vOWVD6ngjn9QB8yBAX2I1S96lv0c0Lg/bf2CUBQlnlR7GOkwfDZSdW1cNHk
 L9+KWV2BvTwIXkuZQQDedEXnz2hYHljkXY3303kOXqrkBl8jaKWM0V9M370aonrQiGJE
 c/B4dy5IZlYgwexWaIkSlvrE7kxtr8BYkQUBRK6o7rotVRxn2yGf1kCb//ZgnnGywfZp
 fTDLn5A8dZJdZ1PhTC6KTNBp0kSggiLTGbEQIVahuOjvyYFO026wRwPoao2Dnjd+wF3s
 AqeV959ZmeCBISE0DygpZsp/HKaF6TM0G0e5EGWtvDNRgb6vBM85EovFbminhVJdnl/9
 OMxg==
X-Gm-Message-State: AOAM533o4ngevkkviXPP1WxVJU9OlCDYvjg1+aMQQ2QH6RsQCDtsed20
 FP8MtvsuEfYouEq7KG9G1bZd/T4bDHyR7xrrb8IFxCRIZ+fD7kzhvxErgj2jLaNCFtpWVRnH4uv
 QPvjdBE7MkL7D8k95G8Fk90pKXVUte5TY8dsSIl6n43SdhCpJE/BHQgx1vkXOLAcMJt8=
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr51303eje.496.1606341779577; 
 Wed, 25 Nov 2020 14:02:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwErFBtPkErGg+I/GzTTL5KSeaeeW7pAefGLXUlXgGy5ua25Cfi9Sj7GfBLAtKnVJBttKbZNg==
X-Received: by 2002:a17:906:314f:: with SMTP id
 e15mr51290eje.496.1606341779299; 
 Wed, 25 Nov 2020 14:02:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f19sm2046095edy.13.2020.11.25.14.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 14:02:58 -0800 (PST)
Subject: Re: [EXTERNAL] Re: [PATCH] WHPX: support for the kernel-irqchip on/off
To: Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <SN4PR2101MB0880B13258DA9251F8459F4DC0170@SN4PR2101MB0880.namprd21.prod.outlook.com>
 <167595b8-bf4a-b961-cfaa-593a3f8d1940@redhat.com>
 <SN4PR2101MB08804B299AF5979564CB4CB7C0FA0@SN4PR2101MB0880.namprd21.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dea94346-0f74-54db-f541-dd749e5608cf@redhat.com>
Date: Wed, 25 Nov 2020 23:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <SN4PR2101MB08804B299AF5979564CB4CB7C0FA0@SN4PR2101MB0880.namprd21.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/20 21:35, Sunil Muthuswamy wrote:
>   > Sorry, this has missed the 5.2 soft freeze.  Can you please resend it in
>> about a month?
>
> Paolo, is the branch open now for this kind of change? Where can I track
> the branch status?

Hi, you can track it at https://wiki.qemu.org/Planning/5.2.

It's close enough to the release that you can resend (or if no rebasing 
is needed, just tell me).

Paolo


