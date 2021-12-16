Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9892476D85
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:37:39 +0100 (CET)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnCl-0006iE-1j
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:37:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxnBZ-0005RX-Fc
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:36:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxnBW-0005su-WD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639647382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QyFDatt2lpTwVoJu5iOD1S4cNl7E73ndMajMjxMxsg=;
 b=hR2TzL+vzJE7T9+c85AXC/mYwAL/VS3FuCDSO+rhTx7AVaD8EPhwFi5eN1qWuqjg3JpXt3
 tii1wYBdrmMgaTZd6JmvD8/CEwfFQzDqkfK8SAAZOmMynXYfOxkOBBhfF9KN0uECJVd4WD
 /+fs7xngW/wfnJB867R1SywvlFbaD48=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-qUQ9R6TUNmqpN-EwDUs5cQ-1; Thu, 16 Dec 2021 04:36:21 -0500
X-MC-Unique: qUQ9R6TUNmqpN-EwDUs5cQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o17-20020a05600c511100b00343141e2a16so7562700wms.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:36:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8QyFDatt2lpTwVoJu5iOD1S4cNl7E73ndMajMjxMxsg=;
 b=YuzCETBa6KeH+OD1LJBjxjBb/6bA+AG4U9GUiyrhphbykH7AJhDVtmCKHv3fbACvMC
 qYPBSpybFfKAmQp6UNjPpLHOQkNaMaB/CvjRl40epqDVs4WUiOfRpYbLeu1C0V8LkmDd
 3tEeoj0HUzZ6VsNRWqEh+zuNfFISZo3mJMYDDvYEuN/Jh9jyiw8Vi8v3MsOW1fQ2zZ7Z
 uVtfmllMMQjTTZWJosfoCb+KG/38JJvs9S2PIa7wmFvfMHtpm6dNbjY5w0U8baMBF06n
 50wVSB9gKnfH9WdQNRPQoFV3H6AIhd0hA8VoEm2SzEMMXfntlaHify1PWIx6OgeYysTl
 mGqA==
X-Gm-Message-State: AOAM530GakZQAYduT0dM7zW18ScqOG++K3TBmEzJm4YhuWuhxxmyxkyK
 HIiDWQEhzYfJA28HoI9Q1vGqgKhJ5AWv1f+zuyQz4bWZ4Zxb9DhUJN0t+A+C6J7U0sWgW3ThrEf
 2MTKP6LBdLX1hmKU=
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr7999165wrt.672.1639647380073; 
 Thu, 16 Dec 2021 01:36:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/X6nVGKPXCVMzIicFsN+brtBCsVKTG8qJwW8ddWxsaULJDrHo0znc7xFqJa6U6wjzjom0tw==
X-Received: by 2002:a5d:50cd:: with SMTP id f13mr7999146wrt.672.1639647379839; 
 Thu, 16 Dec 2021 01:36:19 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id y15sm5947434wry.72.2021.12.16.01.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:36:19 -0800 (PST)
Message-ID: <61ba1305-321a-1de2-a399-e7b608e4dad4@redhat.com>
Date: Thu, 16 Dec 2021 10:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] e1000: fix tx re-entrancy problem
To: Jon Maloy <jmaloy@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@redhat.com>
References: <20211021161047.578751-1-jmaloy@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211021161047.578751-1-jmaloy@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jon,

On 10/21/21 18:10, Jon Maloy wrote:
> The fact that the MMIO handler is not re-entrant causes an infinite
> loop under certain conditions:
> 
> Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX
> 
> We now eliminate the effect of this problem locally in e1000, by adding
> a boolean in struct E1000State indicating when the TX side is busy. This
> will cause any entering new call to return early instead of interfering
> with the ongoing work, and eliminates any risk of looping.
> 
> This is intended to address CVE-2021-20257.
> 
> Signed-off-by: Jon Maloy <jmaloy@redhat.com>
> ---
>  hw/net/e1000.c | 7 +++++++
>  1 file changed, 7 insertions(+)

I can not find the reproducer in the repository, have you sent one?


