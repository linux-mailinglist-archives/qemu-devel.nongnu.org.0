Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9C513EFA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:19:06 +0200 (CEST)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDPd-0008TI-JE
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDO1-0005h4-Mm
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nkDNz-0007jq-Ln
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651187842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nK9zex+eUSEUvZ3S0kXm5lqk7HxT8GXcy6O+edd1fBc=;
 b=a0396FL5sw+T+z2JBY9zT6BfqpE1hbBVkLQ4/pFvqCq0dRsKHeQeGsEAwxqxFyQ8C5exNj
 4D95kLFgNwqcdxGVRS0+dbHc/YO3mQiRkkMnPuxQWCHR6YN2syb8LmH4JLCAzi2duKK45M
 XvLAjzTklsc5Dm6agQfmHbFfdrc6wKs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-0rHzRHXdMeO7lmEYB6XqIA-1; Thu, 28 Apr 2022 19:17:21 -0400
X-MC-Unique: 0rHzRHXdMeO7lmEYB6XqIA-1
Received: by mail-ej1-f69.google.com with SMTP id
 qb2-20020a1709077e8200b006f3dd7d3fc5so2020544ejc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 16:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nK9zex+eUSEUvZ3S0kXm5lqk7HxT8GXcy6O+edd1fBc=;
 b=s2d61JqN8O7T6fCDMKVyS/OO+H29yH9T4HGcohe9On8XbpZkzXnN4W88ZjgnzUJY6V
 OSUnfbX2t2ytOaGNMm3VS1Uj6TD7zEuVeuXKSjX97sHfgl7Fkh9RAM/kDaLeqhmwpmZs
 WuTodrTjBFMOcW89sEeCdyLF/dDg9M94FIiYuuD/rssrJc+mBNMkp9huGr41Tjlk0scW
 7yjL9nQFKKRiDgtNJQsflJWhoAuofLksqAaioRhC7gg1qx8K6KMDvVVqNApV2FnPl3SE
 pVZdEeZwgZd06J5fZqgmYa9PVroybp9FR/zKJ3CRrK7xDEsv37iLu6+ffLkkvW8Wps+Q
 njEQ==
X-Gm-Message-State: AOAM5327mYHNIpR78BgQuUu6X+tXznk08j9seRJ6PCWJydtSZLw1vrIw
 W08zt2PNXhfvicHRiBRREwI0F9VwLdYzcfSMECT9Xer1MX9WQe6S+ykW02C2G22RD/YJ8RudqpN
 w0pdot52O2l35enI=
X-Received: by 2002:a17:907:7f91:b0:6f3:d6bc:cd5b with SMTP id
 qk17-20020a1709077f9100b006f3d6bccd5bmr6755017ejc.460.1651187840274; 
 Thu, 28 Apr 2022 16:17:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj8IIfNZdaqj2xHdylPd1VQ3ix5yz2S8THO0YQxDyriOeV/cMQdm4OGozbsO1c783voCac5w==
X-Received: by 2002:a17:907:7f91:b0:6f3:d6bc:cd5b with SMTP id
 qk17-20020a1709077f9100b006f3d6bccd5bmr6754997ejc.460.1651187839930; 
 Thu, 28 Apr 2022 16:17:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 z15-20020aa7d40f000000b0042617ba63b9sm2212095edq.67.2022.04.28.16.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 16:17:19 -0700 (PDT)
Message-ID: <0d080a21-5dde-f6db-5aa9-08fb106109fc@redhat.com>
Date: Fri, 29 Apr 2022 01:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/6] virtio-scsi: clean up virtio_scsi_handle_event_vq()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220427143541.119567-1-stefanha@redhat.com>
 <20220427143541.119567-4-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220427143541.119567-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 16:35, Stefan Hajnoczi wrote:
> virtio_scsi_handle_event_vq() is only called from hw/scsi/virtio-scsi.c
> now and its return value is no longer used. Remove the function
> prototype from virtio-scsi.h and drop the return value.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


