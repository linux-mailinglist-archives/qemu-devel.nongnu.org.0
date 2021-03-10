Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB8334225
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:54:48 +0100 (CET)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Ad-0005H8-UJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK194-00042p-Rd
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:53:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK193-0007gN-8y
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:53:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALorR8SdLf2eI1andKPLV//iYVgizuciI7QdQochvMg=;
 b=XxZJ4fC4Cv0zue1WbWOV4WwJT1Of9W35HrmN2kvhcZn94WetCGckjjXaic+1hYUK2o5bEZ
 3s3WEfy5d7AH3bzyVgcy/4uzxJIpo1cGSWEl9j2VlQxyyNWyVDUN2guJXlIXqTecuZCS5k
 0CwF5TR9SQbRb3WXWbXeu9Up8r0WZI4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-ap19sbK8PFiVvqRr76DazQ-1; Wed, 10 Mar 2021 10:53:06 -0500
X-MC-Unique: ap19sbK8PFiVvqRr76DazQ-1
Received: by mail-ej1-f70.google.com with SMTP id jo6so7404100ejb.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 07:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ALorR8SdLf2eI1andKPLV//iYVgizuciI7QdQochvMg=;
 b=WdZW7K1BamkaQGcCCBdd90428W0xHNA5LrQIDFMu6gBLaSnjPhbGj6MLGkOj2IwQE1
 s1U2BELCvDBx0gsYoU/hzwyJgBKlqUs7gtkZx/feA4WMiZJ65HrNfNFJS1zSG+QETBKK
 X23vASSNn0UlF75/3sgTHDvUR5c6OWksXZJVB2QvtrzGh6cHJzf7wqthD4nVc9z4FFM3
 /xfdm/xCPddl1kg5cmMED8wHEu96hWe35T6LNnJeubZniTtWgPP19gZFmJvQapdDyUFs
 VxhZcjbNB9RU4JqX0IW1Gaoiownxnk+ZmdquY7CU4aGsGHWIBydujb4ZHVAbYw+U3hB0
 4tjQ==
X-Gm-Message-State: AOAM530uFYIWv1JVh4BK/NLnmgUpJv6qkyyzWIClfF/un5q2HUxgGcEk
 1s8AIbklNX1iuwjzAXy+VQb9HXEttHjqwCcXlBcNrNbujk0tbdkzUYvU0gvJzmiq5saKyj1OT1C
 gCRI8+eAPwKBultY=
X-Received: by 2002:a17:906:4ada:: with SMTP id
 u26mr4408538ejt.129.1615391585867; 
 Wed, 10 Mar 2021 07:53:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyS5WquMQDyqlq97Y1QdsqAfM/4q1QRzYmfoTtE6jOb+cRdLHVtlVal/57t05uDnf289lpJfA==
X-Received: by 2002:a17:906:4ada:: with SMTP id
 u26mr4408520ejt.129.1615391585681; 
 Wed, 10 Mar 2021 07:53:05 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n16sm9727248edr.42.2021.03.10.07.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 07:53:05 -0800 (PST)
Subject: Re: [PATCH] qemu-timer: allow freeing a NULL timer
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210310154526.463850-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccea3f7b-5d05-aeb0-5a82-4d18cd254ccc@redhat.com>
Date: Wed, 10 Mar 2021 16:53:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310154526.463850-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: peter.maydell@linaro.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 4:45 PM, Paolo Bonzini wrote:
> Since 5f8e93c3e2 ("util/qemu-timer: Make timer_free() imply timer_del()", 2021-01-08)
> it is not possible anymore to pass a NULL pointer to timer_free().  Previously
> it would do nothing as it would simply pass NULL down to g_free().
> 
> Rectify this, which also fixes "-chardev braille" when there is no device.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/timer.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


