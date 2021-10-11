Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F2428DC9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:27:52 +0200 (CEST)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvLL-0000I9-PP
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mZvEY-0008Cf-Ng
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mZvEU-0000qA-B8
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 09:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633958444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2chpklOqdeC5u11AqPshZnynC5ouEavlg4YwwHgbkA=;
 b=WHyVQlJRn9HJnqJAGL1WTKbzr0zWe71gtHDBK6l7RU8bfAyGHPmgiypjfSeuDmfZ4Eeu61
 2/oNxEYU4DpTCuZcdZ1KsoZFHRQcjv2gbVfeO5o9vuE9vPoip4zwtJz9mbQGQ/wkN2hgZ4
 05RubPgn3AVuWRToREYm6OvnpeUryZ4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-8tD5jaOuPFCPZaoZn09HyQ-1; Mon, 11 Oct 2021 09:20:40 -0400
X-MC-Unique: 8tD5jaOuPFCPZaoZn09HyQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so13279394wrb.14
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 06:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j2chpklOqdeC5u11AqPshZnynC5ouEavlg4YwwHgbkA=;
 b=dLKp3S0RC6ZgF588MlUpEJ0ph0bB8ihVYyDyrqEwFYYl2G7EVdXR4SHAjFw7CgJDHB
 emmxRKAHiYbOEi4WyqEQlzqnDrrr2AOunFkXfhM38Z9u0MM+V/0QqXsfe3fttd6JW/sN
 IY+MivX75ltVkI9ZoBegfUJ8xmpyJtg3fzQuIW4yMKW9eT0abf4R+FFqqYxK5RbNFb3j
 8D/IVwSnheF76qtihfv8CvE/zpXLGLn2LdDCPwfpM6BAU0jNnJotD3XOrVRZRlhprX5U
 tUdOtLyb2Cj1/dckbgbAIEyTXIyBf4rolg80Dn+EGpOHUb48DbSwm5/sZ4EoODQqCJ4l
 N+EA==
X-Gm-Message-State: AOAM5325dCWd07xOvT1kPaK5FkdTN6QCBKO6IJAKCWUcM0QXMHqT/+px
 qf2FTCe6hG2tXreGlARZw5vh0lGdsIJYMHSToLIU3St0M3fWhJgxS7AqBZ7U4rYCxkmNxwg3qg2
 pLlXpVlZCzFeDv+s=
X-Received: by 2002:adf:e292:: with SMTP id v18mr611478wri.369.1633958439689; 
 Mon, 11 Oct 2021 06:20:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKL7g4qhwdohRt+uKH47YrKMWUBGtnUeTXOiHLnXCaeZ50ERdkeo04iN1c+0L1KJbKhSk1tQ==
X-Received: by 2002:adf:e292:: with SMTP id v18mr611450wri.369.1633958439519; 
 Mon, 11 Oct 2021 06:20:39 -0700 (PDT)
Received: from [192.168.3.103] ([94.228.4.120])
 by smtp.gmail.com with ESMTPSA id 143sm21313283wma.37.2021.10.11.06.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 06:20:39 -0700 (PDT)
Message-ID: <21b18531-4de2-cb85-f48f-4c51e91be0f1@redhat.com>
Date: Mon, 11 Oct 2021 15:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] qapi: Improve input_type_enum()'s error message
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211011131558.3273255-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211011131558.3273255-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 michael.roth@amd.com, hreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 15:15, Markus Armbruster wrote:
> The error message claims the parameter is invalid:
> 
>     $ qemu-system-x86_64 -object qom-type=nonexistent
>     qemu-system-x86_64: -object qom-type=nonexistent: Invalid parameter 'nonexistent'
> 
> What's wrong is actually the *value* 'nonexistent'.  Improve the
> message to
> 
>     qemu-system-x86_64: -object qom-type=nonexistent: Parameter 'qom-type' does not accept value 'nonexistent'
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/qapi-visit-core.c          | 3 ++-
>  tests/unit/check-qom-proplist.c | 2 +-
>  tests/qemu-iotests/049.out      | 6 +++---
>  tests/qemu-iotests/206.out      | 2 +-
>  tests/qemu-iotests/237.out      | 6 +++---
>  tests/qemu-iotests/245          | 2 +-
>  6 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


