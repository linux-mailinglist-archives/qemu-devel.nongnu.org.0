Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07CF2B4355
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:10:16 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedKp-0000IE-Mi
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedEq-0003SX-HV
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:04:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kedEg-0004Nq-Se
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605528233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/saI5vWwye0QpsN/3GbhdRkzcHYr1bD657Iz1xZtlJg=;
 b=SUS3i/azWtPfvud/8qqgWP4Uvl/pS5zWlo71yK6LpR/NydIjJLjwdy2Dotw2Z+LdteTnz/
 VrfseLTZ2HDwOH4QMvvmyyNoGZdU8v3nf558u+N/OJMIKeKjHcUK/eE/qgeoZzK32VDi3p
 4ZGBU0mwKRyivY4BNBp0y+oPKSLOYvA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-3xChm46XPO2-AVLJyO9EAA-1; Mon, 16 Nov 2020 07:03:51 -0500
X-MC-Unique: 3xChm46XPO2-AVLJyO9EAA-1
Received: by mail-wr1-f69.google.com with SMTP id g5so9551398wrp.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/saI5vWwye0QpsN/3GbhdRkzcHYr1bD657Iz1xZtlJg=;
 b=kXZufXVbPPpZBbP1YSBwA+xseV9/ce6pgq/YXyr6TU+4KVlfTdNeVdqp20cAaM5pK3
 D1NMAG4r9405u0G7vyd+Anui5kRz9HMtMot8dTjn6ByWNGt82HvSYrFgsSXfhePY2cqn
 aCzhtX6bUbU5Hfb2vqQjLePZ/YOnIBmqB41zj8NCqWM7HN7oRJWOv+Q4xIW1D4oqZUOm
 ozk5cI1JkLTswAbU7WtE/gcVcZ2xIzgFrr2TPd0KWmlAwqFnJERqkoJcVoWVdF0+3kKU
 +Ud2feKpNBxopTA9x+oxqhCeH7uMn5ng3I671Rpf762OgAvOC5gWqJUXoKWHeK6i7yod
 f+RA==
X-Gm-Message-State: AOAM532KorgrljU3x6uv7+Q2GwpnZ4xOoawP165t+qhE27hZpRk0GLKZ
 wgY9kPK6DEN+9B1HuhKaMTMBLycOeausKGbJp90xA110ohZBBSGUjvWvE55LVCuHVeAsMEvDDQp
 xPbpS2y7750Ig70s=
X-Received: by 2002:a7b:c101:: with SMTP id w1mr15054506wmi.170.1605528230291; 
 Mon, 16 Nov 2020 04:03:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0lAb4TM6gJPe2/41dS7RzFXKSffJ3P9pmx+qtqgHzz3f6TmVHbj5bIUrWBUVu6lDqUx6vxQ==
X-Received: by 2002:a7b:c101:: with SMTP id w1mr15054478wmi.170.1605528230031; 
 Mon, 16 Nov 2020 04:03:50 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f11sm22206172wrs.70.2020.11.16.04.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 04:03:49 -0800 (PST)
Subject: Re: [PATCH-for-5.2] io_uring: do not use pointer after free
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201113154102.1460459-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c6eedb1a-06a6-a2e5-233d-dc4728b13ff0@redhat.com>
Date: Mon, 16 Nov 2020 13:03:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113154102.1460459-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/20 4:41 PM, Paolo Bonzini wrote:
> Even though only the pointer value is only printed, it is untidy
> and Coverity complains.
> 
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


