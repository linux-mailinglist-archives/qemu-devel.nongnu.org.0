Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0502649A26
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eJo-0003SM-Tx; Mon, 12 Dec 2022 03:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4eJQ-0003PO-G8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:37:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4eJO-0005ft-M4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670834240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CqN3EShbFRO+CYHTjt9d5FOIYqyOtp+1/4J1kcv51U=;
 b=hDyij3UGYJf8zZxpK2tCTbzI5cx6TUueIK41u/MQ+FDT0psoo4kzIcnJD8u/meE7PF3Gw9
 5eawP/Cp1I4DACFH65C9rIZ0h2XRi/9PtP3ajOt7iWErpxsFGqY9Xn0EFKXZpYgAIRBAsz
 OjssLZy8iSRISaSSABHLWWi5iJR5XoU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-JdqXOOI9NO6Ab4w8NNyKNQ-1; Mon, 12 Dec 2022 03:37:18 -0500
X-MC-Unique: JdqXOOI9NO6Ab4w8NNyKNQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b47-20020a05600c4aaf00b003d031aeb1b6so3839740wmp.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2CqN3EShbFRO+CYHTjt9d5FOIYqyOtp+1/4J1kcv51U=;
 b=lZhGyRBAOCwMlsN+HKyaLwrizSehEQ7HGm0f2415w+S1VpfVNHmOlDKfteFaomSxef
 uEp1Y72sjNpSEfTyAW3Gd3AU4QmuEVbD5rK7Sa1UtkbwZwA4BIaYcwtx7oh7v7f2mqH8
 akCQFV+fn0RlcfB8BTVhn9fLq6+aHPzxfu2IG4jG0UD0dfEariGNU6B2SgYsQd9JAfCq
 nfY3HA0KobW2vtmoVXuHvoGG4uXiOljCsVEEMbzRUUYzODcTQOfl837b12ZAZRmIeQ9A
 eYPJLfUaVIpGxFl6y1qSBJ+QkqDkrMNa2e/17vhy7sFfqOJF3AbZ0ObPcUN4/vzZfJqo
 8I9g==
X-Gm-Message-State: ANoB5plqTRbdFY92b2k1fUTgedDNB6UKVZrVxPLKUPs96KzVOgyL9pYX
 315RGlz778MoZfc6wNd1ptEqyYrW5qyTUWzMgM4/w6Hrno6nRr8HgrGTeEfXblboW75/0wonzth
 KYB2d1Nxg/5baMLM=
X-Received: by 2002:adf:fc4b:0:b0:241:fa2d:deb1 with SMTP id
 e11-20020adffc4b000000b00241fa2ddeb1mr8727173wrs.4.1670834237560; 
 Mon, 12 Dec 2022 00:37:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5m3+ORwkGdnji9NGDoIEVvZre0stEBl5gX8iugCIfkF8cUlEbotPL+A9cccQNbRfVARhJKqA==
X-Received: by 2002:adf:fc4b:0:b0:241:fa2d:deb1 with SMTP id
 e11-20020adffc4b000000b00241fa2ddeb1mr8727159wrs.4.1670834237320; 
 Mon, 12 Dec 2022 00:37:17 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 az13-20020adfe18d000000b0024228b0b932sm10116297wrb.27.2022.12.12.00.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 00:37:16 -0800 (PST)
Message-ID: <47f2d716-49fa-23ad-5b36-746d40f88576@redhat.com>
Date: Mon, 12 Dec 2022 09:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/3] s390x/pci: rpcit fixes and enhancements
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 cohuck@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, qemu-devel@nongnu.org
References: <20221028194758.204007-1-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221028194758.204007-1-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 21.47, Matthew Rosato wrote:
> The following series fixes an issue with guest RPCIT processing discovered
> during development of [1] as well as proposes a few additional optimizations
> to the current RPCIT codepath.
> 
> [1] https://lore.kernel.org/linux-s390/20221019144435.369902-1-schnelle@linux.ibm.com/
> 
> Matthew Rosato (3):
>    s390x/pci: RPCIT second pass when mappings exhausted
>    s390x/pci: coalesce unmap operations
>    s390x/pci: shrink DMA aperture to be bound by vfio DMA limit

Thanks, I've queued patch 2 and 3 now to my s390x-next branch, too:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas



