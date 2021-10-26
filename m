Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D413E43B7E0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:04:48 +0200 (CEST)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPsV-00030e-VL
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfPpO-0000OP-JW
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:01:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfPpK-0003OW-Sr
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635267688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WKOHd7UJzBB/JaRWgcUVILjBf4/3B0fkgSRHuHpgsg=;
 b=HNyh4NaRYhNTk8QnJojXLjD7kVS2B5WkJzGYjbA8C4O32VTYm7zBBksrBY9t6oOpze796a
 jqO2vJNrd/WA5F0fGQveJfJQBVfWrb2KTyu4era/YJ6kFl6T1tXYtrs6OKGqdJEXwLGp/K
 2NWHVnTrkhw7cKJnxnVjmNS6dN3ioaM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-f7qWB5jLOXOJ4FS2ugf94Q-1; Tue, 26 Oct 2021 13:01:27 -0400
X-MC-Unique: f7qWB5jLOXOJ4FS2ugf94Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so1191194wmj.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4WKOHd7UJzBB/JaRWgcUVILjBf4/3B0fkgSRHuHpgsg=;
 b=nhCsJ4oS4kP6AU58f/uS+OyCkg6O4Sv4Yf3Hqo59B6vAe7kem9QMukSjrkBSUO3UTd
 VjoLuXAbP2VLRjImUt028PCBcVY1ijAiiVdIDM/10VOjafmMxfZB/xrksnSR+d9scvpL
 SfKOBakw/W6zBJ3IaSBZl5qrnpNfxMBTg8t2pqcvt8vyJSgvnRHUKitIZX3ceRc0E0nC
 K/uPQmi2gVi4UgV+cwxQ3NPvcTd/3+D45iJ0wh5WB97UsosuLMZSDe7ECmnr41xTEVem
 hMf9ekE/Kd4FHpYHQgTYE6U+7ztda79KmyGvCSP6P2rdX8KREZWHjeVOZGAuM/T+fqma
 Uu7g==
X-Gm-Message-State: AOAM533PnfBQuVJ/Z928YalogKb4H4t1g9GQmiKX2KLPnmYlkikU/nyx
 NQNaPqjTb4GW6CXo90yPOoW1nX0LvN3m49BBdR+tO/xsWLAbK/IsOyneL4EsGjuscuDm58UPfMn
 6CidGtJKe6rgzDn4=
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr34158537wrr.371.1635267686472; 
 Tue, 26 Oct 2021 10:01:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO34TQZJ0XkVxFg5CZE3s+eBRSasIiDE6uEhFB/zXP8OsDXBdhKvM6UITaM5FxFKE/12sQcQ==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr34158523wrr.371.1635267686354; 
 Tue, 26 Oct 2021 10:01:26 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b69sm1047282wmb.37.2021.10.26.10.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 10:01:25 -0700 (PDT)
Message-ID: <7d5dd3e5-668f-c6cf-0c6a-34e3e806cc8f@redhat.com>
Date: Tue, 26 Oct 2021 19:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] memory: Update description of
 memory_region_is_mapped()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211026160649.47545-1-david@redhat.com>
 <20211026160649.47545-4-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026160649.47545-4-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 18:06, David Hildenbrand wrote:
> Let's update the documentation, making it clearer what the semantics
> of memory_region_is_mapped() actually are.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/exec/memory.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


