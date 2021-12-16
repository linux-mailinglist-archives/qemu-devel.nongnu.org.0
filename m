Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D1C476D75
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:31:45 +0100 (CET)
Received: from localhost ([::1]:42432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxn72-0001qF-EA
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:31:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxn5j-0000SR-GB
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxn5h-00058s-VX
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639647021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ChvMYUHbtfNNPQtMXK6keGi1M82hDhF6u8++STagyQ=;
 b=WpLFfyM2ILPis8JdyYMC0aZTCte4ZXBX7IHTXxNNIQ+BKx0Nljo7lnsGNEpCIB4Zo08M+X
 S9CAwrWEZWkBhCgxOijYdOxEncSo6VWEtUvXhHVhc2rZENJDNpZF7OPyeb9yXFp2tz03b0
 pcqj2DOBQ2IOWBAAs+s4dPfPMAwLwBg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-Pwx5GyQ5OUOkAe0Y633CFA-1; Thu, 16 Dec 2021 04:30:15 -0500
X-MC-Unique: Pwx5GyQ5OUOkAe0Y633CFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z199-20020a1c7ed0000000b003456affcffaso1018596wmc.2
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ChvMYUHbtfNNPQtMXK6keGi1M82hDhF6u8++STagyQ=;
 b=zpThY6xH1pM83ZpUeqq75+N4XB4tYCOeGr8ASGoH6leaAkkJ0/YVrRcYo7JInFRODB
 RCjf5d0XDP1fmEnIXl/+HM7WsJ7m/ASs6/AgPdSgNI+D0jFsTh7e5WFLpF6T6kC1YD9k
 08TrX3dpy4b3chRUVuxDpR8IuQWI5ci7jUs2qolLu+euZJsdZlssgep+OoC6RbYWfl82
 roMD7hYtNGWrHTn4OOsgRUl4q5VMcv71uOPAd4ULp+ffXDDhtw2cAn0R2No9WjAkbU6R
 S/mv7kcjxtVKPGOwmIqVVDHz/kcTpBk9SCfKHtRVfUzLJD2lYi2E2LFbS/LWuuU/PcBp
 xYHQ==
X-Gm-Message-State: AOAM531qxVFthR6XijH6+sZJA+f0zc+yXycbBqrVm6kTBhg07ySynjil
 5tzMgYF3ysik32WkUiaQGgqRJvCxbpA4aLCI0qPYDPTEUpPkNFSOV8XwJjcDs8e08nAtcFYm1F/
 ytB37SgHs7xHjLhY=
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr4071672wmm.189.1639647014098; 
 Thu, 16 Dec 2021 01:30:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUdsdmMEbIcSSOQx/XwR2y8JYmE+cmLYNXQFceVP6RZj8a8gUfEnM5T+2XQBmkQy1Xz0VsZw==
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr4071647wmm.189.1639647013838; 
 Thu, 16 Dec 2021 01:30:13 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f1sm4579592wrh.116.2021.12.16.01.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:30:13 -0800 (PST)
Message-ID: <22922310-4041-9f72-7f8b-1426a073199e@redhat.com>
Date: Thu, 16 Dec 2021 10:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/5] migration: We only need last_stage in two places
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211216091332.25681-1-quintela@redhat.com>
 <20211216091332.25681-3-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216091332.25681-3-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 10:13, Juan Quintela wrote:
> And we are passing it all around.  Just add a field to RAMState that
> passes it.

Splitting half of the description in the subject makes it hard to read.
Better to repeat the subject as first description line. Matter of taste.

> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 41 ++++++++++++++++++-----------------------
>  1 file changed, 18 insertions(+), 23 deletions(-)


