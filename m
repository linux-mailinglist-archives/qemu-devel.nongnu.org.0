Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78E5FCB99
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 21:29:07 +0200 (CEST)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oihPe-000730-Lj
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 15:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihKL-0000Ix-Ff
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oihKJ-0002OW-8g
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 15:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665602614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJIpKfiBAJm6hQNKxfVVLaJVoLnkvSycgacpeRb/lG8=;
 b=Rj8FHlHFZ4TkSOWAD4MPGnS/fWNInQ4f56oPMYEUiVYAj3VpggZ3UO6jYwtCl/cpfmzmS8
 NmkNfh8NeyQlykTdOTJ8/ELKxZTIGuL1iBngCkpQg7IhfvZmi8kJ9Y0tHFeaJu1J4xVG4A
 PwUoFAf4cxKPpYX3hooJzmKsV9R6W+o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-GIwQ6mcyMkmvuU6BTixjow-1; Wed, 12 Oct 2022 15:23:33 -0400
X-MC-Unique: GIwQ6mcyMkmvuU6BTixjow-1
Received: by mail-wr1-f71.google.com with SMTP id
 s5-20020adf9785000000b0022e1af0e7e8so5342635wrb.11
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 12:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJIpKfiBAJm6hQNKxfVVLaJVoLnkvSycgacpeRb/lG8=;
 b=bspdpu8M7YP43CSlJxbBMtTgRMKfGdrdw4nFCyeZa7ukFgOBTR8WfxSjDp+vQ/9iPi
 JwnuJ//KvDOMJM3acA1BrCt2IZyfrmyYOk5MUXkf0zL+Mq+4bRIHJzE+CyPmKc0zJZlM
 puqcnNzmxqIgJPlnoEDdahfC7NbTfvLSJC/r96u/a5LlcEnc5F7W7c6XcHflvuBaVpSU
 ZO4Y8HUYLF8IixZH5vjkuq1ZJ2MywOIotdGWpCnY6gJQmIyuKZ8lFiiKhVcEE9g2m8v+
 Gd6kKN5uxuEW58v4dtoFht61V1WKNxWfvjKybjJ3DCgl9jkhYmD86NScoduRsx/eUoUz
 7j3w==
X-Gm-Message-State: ACrzQf0F8kWTr2pLN79PsZuUjch3WQXZXDNIHwx0C7n/PmfCJUds65XC
 0eoKa2SkNUFkSUMT9cNdoXg2NdFTqK4PMpMF23o85PwpMw3jrUQnqzXgwJY1pIvr/Ft1kEoxexa
 z0tp9whGjqnd+Cr0=
X-Received: by 2002:a05:600c:1f15:b0:3b4:8600:fd7e with SMTP id
 bd21-20020a05600c1f1500b003b48600fd7emr3987716wmb.40.1665602612169; 
 Wed, 12 Oct 2022 12:23:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pFAZET5JNJqJmEycZNbIxBiZ16Ija8ZZq9BvuW2RJ/nApB4LfKdsPM9bUpnx/kpoygwchQQ==
X-Received: by 2002:a05:600c:1f15:b0:3b4:8600:fd7e with SMTP id
 bd21-20020a05600c1f1500b003b48600fd7emr3987705wmb.40.1665602611942; 
 Wed, 12 Oct 2022 12:23:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:fd00:9f9b:c2f8:47fc:4836?
 (p200300cbc713fd009f9bc2f847fc4836.dip0.t-ipconnect.de.
 [2003:cb:c713:fd00:9f9b:c2f8:47fc:4836])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a056000008100b0022cd96b3ba6sm445088wrx.90.2022.10.12.12.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 12:23:31 -0700 (PDT)
Message-ID: <2a309281-8842-81cc-96ff-0169013c67c7@redhat.com>
Date: Wed, 12 Oct 2022 21:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/3] target/s390x: Fix emulation of the VISTR instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221012182755.1014853-1-thuth@redhat.com>
 <20221012182755.1014853-3-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221012182755.1014853-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12.10.22 20:27, Thomas Huth wrote:
> The element size is encoded in the M3 field, not in the M4
> field.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1248
> Fixes: be6324c6b734 ("s390x/tcg: Implement VECTOR ISOLATE STRING")
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


