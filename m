Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DC35D932
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 09:45:32 +0200 (CEST)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWDjm-0003q7-Q4
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 03:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDhQ-0002aX-SD
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDhO-0007v8-T8
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618299781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yC8v9ZvdH8D2K8zK/fEPoB18ELwnWFrqgdwsmRFqnk=;
 b=YRR2ZbFDH18k7VU4WCC2OVh7odWwHklHBzCmVHerkScCJStEUc5oU5xqBsF3bz97VYKq5s
 /mBJgl9xAxa7bpOVIbxprvTaPaXMs8t7zt5ld1hnSC/D4FPk5Vk7Ns5V2bpfO35bzvof4c
 n4xqAfLQLQIHcZatp4QLcVtAB4qM7/0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-_lYoueXMPo2aLFLvzjxw-Q-1; Tue, 13 Apr 2021 03:43:00 -0400
X-MC-Unique: _lYoueXMPo2aLFLvzjxw-Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 r15-20020a50aacf0000b0290381d5d3eb2fso816159edc.7
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 00:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5yC8v9ZvdH8D2K8zK/fEPoB18ELwnWFrqgdwsmRFqnk=;
 b=UXXldnaQLixp34rAjLQgNUlHZ6LuyCYWcvnmijSFbXD9TVQ4WFxTrsG5Dj4j+ac/yY
 NDy64aRLiOfmLU7ybyyOhuV5TWtjcRM2JU15ArJdbjvkGxz+ziCZZ1DJ+yvLzuV538Eb
 9KzeRau+ai+JbGxKLgXnnq7uHIAhdQuVyMCby1DQWCSowVFWVFWqr2SnvUocv9/VbJ0C
 nuG7MKCd7qRfAubMbfBJXyQ/vJeKC5VzQZOLHys81x3uKkJK7DixnSNBwzRtYDK5r0XF
 hUKQo+/ILXy02+3uC3Ar4dMxaotFiEDTnHWWVSI09o0OEmJtUWDWkifNBItb7kye75eB
 O5SA==
X-Gm-Message-State: AOAM530SoEskYxmmeKS9QYiqZV1BmVYm0EB1LCqRU8pnbLInznfe66Tm
 SF4fRmmPd1JN99jkhGtuTY2hCoZlJ2HvJAdPGE0ShQqdMps5Aqqe7GhBebpNruMFaKIkRHOi4Bk
 cAR+buqwWPwyTAq0=
X-Received: by 2002:a05:6402:4395:: with SMTP id
 o21mr32676783edc.22.1618299778872; 
 Tue, 13 Apr 2021 00:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJRUQCXzP6wYtT0bA0ZuNiFUcC3JhsukJFOqPaP+Ln2Blr+TTKyEcBnS5ZqZ1A6530NiIVLA==
X-Received: by 2002:a05:6402:4395:: with SMTP id
 o21mr32676764edc.22.1618299778708; 
 Tue, 13 Apr 2021 00:42:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hc43sm7349200ejc.97.2021.04.13.00.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 00:42:58 -0700 (PDT)
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YG2ILNrmn0+vVVKJ@merkur.fritz.box> <87wnteus7k.fsf@linaro.org>
 <YG3SyTLha8a9Itlo@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c388d16d-4230-c828-08e0-d3c684f88106@redhat.com>
Date: Tue, 13 Apr 2021 09:42:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YG3SyTLha8a9Itlo@merkur.fritz.box>
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org, agraf@csgraf.de,
 stefanha@redhat.com, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/21 17:42, Kevin Wolf wrote:
>> +* Publishing other's private information, such as physical or electronic
>> +addresses, without explicit permission
>
> Yes, it's pretty clear that I'm not publishing new information about
> people when I'm keeping them in Cc: when replying to a thread, or even
> when they posted in another thread on the list recently. It becomes much
> less clear for adding people who aren't usually part of the QEMU
> community.

If you took the email from, say, the Libvirt or kernel mailing lists, 
that would not be considered private.  If somebody has two email 
addresses and you deliberately Cc him on an address that he's only using 
for communications within his family, that would be a problem.

I agree that this doxing is unlikely to happen since our communication 
revolves on email and we generally don't accept pseudonymous 
contributions.  But even there, we have had historically a couple 
exceptions to the no-pseudonyms rule.

Paolo


