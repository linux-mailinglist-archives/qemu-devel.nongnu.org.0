Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4F34CD43
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:44:52 +0200 (CEST)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoS3-0006v3-G4
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoQP-0005DF-9O
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoQK-0007YM-BS
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617010983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bs/r4zd2ylX4UjGQaGbxb25IDG0R9Zti9hD76pgbGJs=;
 b=VJNgMInqgsk+0YHh/v7JA41StldYeZQNBWv4unrTtVvE6bVnI8485k07ytJYbnQkl9Qg0m
 MOLT6jEugHK6yt6E0iEdLMnvvTeWO44ZFMg7nnynKuVGxXTW25ahbeV1IwSkfI/1eB9QRa
 C48EckIc4R+wylhuElvahdOgE6s1hOY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-355_I-MqMi-MWVfRFyPxoA-1; Mon, 29 Mar 2021 05:42:58 -0400
X-MC-Unique: 355_I-MqMi-MWVfRFyPxoA-1
Received: by mail-wm1-f70.google.com with SMTP id a3so1420181wmm.0
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 02:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bs/r4zd2ylX4UjGQaGbxb25IDG0R9Zti9hD76pgbGJs=;
 b=llmN03xO2qc4xtOLpSf8ZeZvAlafjDbV9FamQRtRVgoZFpWXDTuTH6YPHrlW8m2Jf+
 oRnFPtOSw/HOT99DEWWeSrrubPUyJESYZLoQVQ8vh46eDl9KKMN1eZuZuM3kVxqn1cWx
 brmVQOSmXW8W3J1Tk4jXEuuKO4PAV29UKiDz9Q4Q/rF1lABJgxcAhI6dsywXrbIE9++e
 +1oNJaTTulGxQDTdw/cfK6u3j3rWPLpNdHmA1gRh6BNYxbz0W7+0ZMBYxwqtuVfJgf1d
 rWF8vMmNKgS07MhCzzSuAo2f8kH+8YNSksMqUU0xVv6FTe5eGf72Z1IR/kE3Xqnq8MSe
 WyFA==
X-Gm-Message-State: AOAM532hTuwbxz2gCln362dUX6in/aI2u1L9EBEbepWUgIIKLK7vPN99
 xFYCcx1/vxtQEFaE28f/qm/Mucl9LNHhV6hhwkYak4e3QAbdOQXy9TlEwL7/0kK/2/miipEbij/
 ujsj/U2hfHquVpPI=
X-Received: by 2002:adf:eec9:: with SMTP id a9mr27513303wrp.252.1617010976922; 
 Mon, 29 Mar 2021 02:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUMTmruQOVR0o4dkHXvIY5UplgY4WhtwE+X1yCst/7+LboQJEqKdS0vicYeZDQG12s4G9iEQ==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr27513280wrp.252.1617010976719; 
 Mon, 29 Mar 2021 02:42:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n1sm33083433wro.36.2021.03.29.02.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 02:42:55 -0700 (PDT)
Subject: Re: [PATCH] Revert "qom: use qemu_printf to print help for
 user-creatable objects"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210328054758.2351461-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc229c1d-09b8-387f-6dbf-68eaa12e1538@redhat.com>
Date: Mon, 29 Mar 2021 11:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210328054758.2351461-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/21 07:47, Thomas Huth wrote:
> This reverts commit 6d9abb6de9cc53a508823db0283061824f2f98a2.
> 
> The real code change had already been added by Kevin's commit da0a932bbf
> ("hmp: QAPIfy object_add") and commit 6d9abb6d just added a duplicated
> include statement as a left-over of a rebase.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qom/object_interfaces.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> index c3324b0f86..b17aa57de1 100644
> --- a/qom/object_interfaces.c
> +++ b/qom/object_interfaces.c
> @@ -17,7 +17,6 @@
>   #include "qemu/qemu-print.h"
>   #include "qapi/opts-visitor.h"
>   #include "qemu/config-file.h"
> -#include "qemu/qemu-print.h"
>   
>   bool user_creatable_complete(UserCreatable *uc, Error **errp)
>   {
> 

Queued, thanks.

Paolo


