Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0A522FA3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:42:09 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noirA-0001vf-PB
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1noiYI-0005TQ-HB
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:22:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1noiYG-00081U-VH
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652260956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9v+ozSeNXj/DGfGA2ECp6SEpKs+GzAeSqSjtNa2lKs=;
 b=BKOp2tVV3YJpndYDQmu4OqX2MPX7dEvc1aCIFIGCkrTp1y3+6idQo/JURJfMW22gwQ9jId
 B4dQQaN5OvfegdOxjlox7QDeoOqR2nRhBE29idUw2eOIgNIg8TPo8lD6Tj0TYb2080mq2n
 0BJd24sNKl5KYYIzgZVRE8R4EGVxmkg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-SnKp4HJZO2Grpq_j9RH_sw-1; Wed, 11 May 2022 05:22:34 -0400
X-MC-Unique: SnKp4HJZO2Grpq_j9RH_sw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so534389wmj.0
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 02:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C9v+ozSeNXj/DGfGA2ECp6SEpKs+GzAeSqSjtNa2lKs=;
 b=q5OocxNagDkvAwXYEhi0m/CqpFODNAnYBSMuA/r2SkkhETR8jbdY+/Ivye4OGAfVuN
 /Y7kgk36qvJ033rPKZWclEVKjmfJQuVG7cJd7q3lPuyiYbTCAqlnZg8imTmfKhhrJsiS
 XgNrD1JVQukDlHUb2wZVbQsseu30EC+oOLGpOEuL4Ith5zJsbsLlIubIByg2dNlF5eiD
 NCa6wm9lzdJc0GOkC7aSQM5jS5eNds9q3uePrSTfQVzv1B3v4nAHZWGKfeK0Blv6V4+2
 6Upjmuu/hvM1X2osL0wu9cbLg0NeSfrUS2P7i/c7OAQuLNMZ4kCNExhPDKCH5KrZp6Ks
 hIiw==
X-Gm-Message-State: AOAM531g9mv2yycOOL1DVm0H14D/2z/6Xt7r3KwWRl88MrF4LfetNHPZ
 HzVniwomoe//fBUhNbGcta6lFLS7B6M3Yx2po1BkFneu987ByDWBfYXki++FdJna/SCXdYI8f0F
 AT5wwzdLGj2IQjTg=
X-Received: by 2002:adf:d1e9:0:b0:20c:6c76:14d5 with SMTP id
 g9-20020adfd1e9000000b0020c6c7614d5mr22403018wrd.375.1652260953473; 
 Wed, 11 May 2022 02:22:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLT4CZIwJgFJluNUjnM3ad0IOZv0ftgcwDfyJLYMcLTaAbOVTWWK6n6AZkJNSjfTglPK4ZHg==
X-Received: by 2002:adf:d1e9:0:b0:20c:6c76:14d5 with SMTP id
 g9-20020adfd1e9000000b0020c6c7614d5mr22402997wrd.375.1652260953188; 
 Wed, 11 May 2022 02:22:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c701:700:2393:b0f4:ef08:bd51?
 (p200300cbc70107002393b0f4ef08bd51.dip0.t-ipconnect.de.
 [2003:cb:c701:700:2393:b0f4:ef08:bd51])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b003942a244f44sm4671284wmb.29.2022.05.11.02.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 02:22:32 -0700 (PDT)
Message-ID: <94da21f4-60df-9cf9-3317-b762760ecf80@redhat.com>
Date: Wed, 11 May 2022 11:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] migration: Calculate ram size once
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20220510231708.7197-1-quintela@redhat.com>
 <20220510231708.7197-3-quintela@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220510231708.7197-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11.05.22 01:17, Juan Quintela wrote:
> We are recalculating ram size continously, when we know that it don't
> change during migration.  Create a field in RAMState to track it.

We do have resizable RAM, which triggers ram_mig_ram_block_resized() on
resizes when changing block->used_length.

ram_mig_ram_block_resized() aborts migration when we detect a resize on
the source. I assume that is what you care about here, right?


-- 
Thanks,

David / dhildenb


