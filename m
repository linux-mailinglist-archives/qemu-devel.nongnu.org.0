Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEA95FB2F1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:12:31 +0200 (CEST)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiF3e-0001be-QW
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDI8-0002SM-Rm
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiDI1-0008Al-1E
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665487151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8Ttjha8skCMgdyuRLH97zOX0slvN+ZkrqpsFBAqW6M=;
 b=KeawL5vwIA2NO/xx2vn8qw9MElHelPuE3mC917ggtTEF3VLAN3WYJRdgg93PWrX4UTpthR
 7gSrtGEmm/ePUojq8KsAiITLh/Zyjyn2GReBoaISyVnqgUxI6GIH+RoTo93r3/EQBc86RU
 EXAmpzKUShUGPlEP4cnLqgbpi+7TGtg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-FaYEXE8wM_WCA9fd1YJRWQ-1; Tue, 11 Oct 2022 07:19:02 -0400
X-MC-Unique: FaYEXE8wM_WCA9fd1YJRWQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so3612861wml.7
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D8Ttjha8skCMgdyuRLH97zOX0slvN+ZkrqpsFBAqW6M=;
 b=aPMAWLxRMM1vxyE/QUkvNLuKLkg330TasisX9kS9wamKp3Bm/xv4bwUwlRwWK7NhZ9
 xAMZmdlqtdxsuGHM5//jkUWSJAtVO0J6zK0D/rpKif8pX1GmeRPGqeHYVJRaWX31a5jp
 K7qtbFcAomfnVWgW1SIo5fgF+jvs8KuW6ytQC195P6jpFX9lDll/2fgVGot9JvS+lc7C
 qQ3AbDrH0Uz3sxBjaZ/cXBfwNqZxuFhnMgerXLiorPDXA5fY6z409YFVvKLJGzYl/ulF
 GUv5yH6hnWM5YdS3rR6fEabfyOi0mxYa4o4bLODYdrDCxyJnn5d6NRz13gfAEN+WuIM8
 zbsA==
X-Gm-Message-State: ACrzQf158bDoDDxj5Ugk8P/5VVsbPyL5jJVPpbLO/BdNxxolTWbyZwxf
 znY34mx4u8QhEAfC0579VRcZIcWSaPFBUV4QrAR6Ss7e7E4glDaMAzA6EnHac/A7qHVO47YliPJ
 ReSUN+wLTcsf4t4U=
X-Received: by 2002:a05:600c:3ce:b0:3c6:bf0b:5467 with SMTP id
 z14-20020a05600c03ce00b003c6bf0b5467mr4855540wmd.130.1665487141452; 
 Tue, 11 Oct 2022 04:19:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qBot786TXZsdzWCd4P9LC+v0iJX2e6D9XXDHgDj16hPuhKJG/6yjEfEp8sXLd7DTDmC0RiQ==
X-Received: by 2002:a05:600c:3ce:b0:3c6:bf0b:5467 with SMTP id
 z14-20020a05600c03ce00b003c6bf0b5467mr4855529wmd.130.1665487141271; 
 Tue, 11 Oct 2022 04:19:01 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 h14-20020a1ccc0e000000b003bfaba19a8fsm12271277wmb.35.2022.10.11.04.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 04:19:00 -0700 (PDT)
Message-ID: <5ddbb099-bfea-9488-6c09-eecda1765943@redhat.com>
Date: Tue, 11 Oct 2022 13:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 3/9] tests/x86: Refactor hot unplug hd-geo-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-4-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220929223547.1429580-4-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 30/09/2022 00.35, Michael Labiuk via wrote:
> Moving common code to function.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/hd-geo-test.c | 144 +++++++++++++++-----------------------
>   1 file changed, 57 insertions(+), 87 deletions(-)

Nice refactoring, nice diffstat!

Reviewed-by: Thomas Huth <thuth@redhat.com>


