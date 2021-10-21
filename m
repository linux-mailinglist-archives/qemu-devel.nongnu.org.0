Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37E6435FE2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:04:06 +0200 (CEST)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVrh-0002nj-OL
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVhX-0007Pu-SK
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdVhW-0003pk-Ff
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt/zoVLXfxQ1ezuY6HbwNSrTIyUneu/nkqgE9IW8aIk=;
 b=d+ckeYue/q1Jie7gJb0Vaj1/gEFgifkF63fPrhdy75ZinHKRbu6YaSg6dny1VKenQFd54k
 Y+XztOic9Vx+LqC+6CmL/w1+AScU7wamnlHY5nD4kYz/4dvOjuG0gvYHjdJKCyBVt8zX2E
 8SXE/jOX6e0vM2st1PKBX8lsUqnQcGY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-bIcGJoVTPwGsRKsb8x8Cbg-1; Thu, 21 Oct 2021 06:53:32 -0400
X-MC-Unique: bIcGJoVTPwGsRKsb8x8Cbg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so59461wrc.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rt/zoVLXfxQ1ezuY6HbwNSrTIyUneu/nkqgE9IW8aIk=;
 b=HaMcpcoMLvuUPL3iPPPyNqtxwrcBpuSrKI4DJIq4w1A+jSEoh3kI5wnK2QwHIVExkM
 /zCIM/gkDt4EDF9621HL3XG4i2YPYC3sW375EUQXbGm9JPD5CWadm+3ft6Ua+LClxlYk
 NefG7gQ+hdRCmw4R2xRLowK9+zKmvjOfkWSEsWePLnieOPjbrC9F/txZrBbsvaB2kYv3
 cx0q9/xShybPNoIINb31TEf+HqJ828PdEnRQeByJqo1ZpEOtyjwcM7sA09k/Z5MSDCDJ
 T1VvPXH/HZtBR6cBAnRRsTjTJKLnopBj20YTShUA9GOPLPaxylHxhEFPZ1ZKH7h9c313
 yOBQ==
X-Gm-Message-State: AOAM531CE7cIs/KSn3viF3TunUk2BGilFs1jsDCVRZX/6814CFnPNWuH
 5X5bjGwIJhI3FmcHni1CG8NLwKID7CP5APoSOzUkPgkuoziUE9eG7Dk/oU50naF+Eig9lZxkztY
 MmZ+DtTsvpmelB2o=
X-Received: by 2002:adf:aad4:: with SMTP id i20mr6408298wrc.402.1634813611253; 
 Thu, 21 Oct 2021 03:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwS8nc+GzEPIzXaJ8kFW56ifPd3R5bDLIa4L0Tr/EzVvoRsKNkXEf3YzFPaNDPbk5uN+FuQQ==
X-Received: by 2002:adf:aad4:: with SMTP id i20mr6408272wrc.402.1634813611040; 
 Thu, 21 Oct 2021 03:53:31 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id 25sm1212633wmj.9.2021.10.21.03.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:53:30 -0700 (PDT)
Message-ID: <98f810a0-08ad-c72d-1ba1-c41bca64e6cd@redhat.com>
Date: Thu, 21 Oct 2021 12:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/8] pci: Define pci_bus_dev_fn type
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211021104259.57754-2-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:42, Peter Xu wrote:
> It's used in quite a few places of pci.c and also in the rest of the code base.
> Define such a hook so that it doesn't need to be defined all over the places.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


