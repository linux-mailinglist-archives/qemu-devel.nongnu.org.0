Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB753DDC7E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 17:31:47 +0200 (CEST)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAZus-0002FV-Qq
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 11:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mAZtH-0001YU-Tu
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:30:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mAZtG-00077t-A6
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627918205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mz+kXSmVPv70K8I+VHGmo4TAfS0XzVMXn3ftLNVemzs=;
 b=PdKVzU6JspiMRPNu8EBs3b+LNlURBfke/QPWOQjK29g0jmXzd30x+JU7dlW5ncbci6RJXw
 EAYRIfsQYAkTh5aPfvvhwfZihQG4jM41dTm/2vMs+upaD1mbDuiswBqqnFzlCiozwBTe04
 MFC+iAZjQiFrPinnQabJmOms8R/IDIk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-rneFf8F9NQSTvoH5GY0R3w-1; Mon, 02 Aug 2021 11:30:04 -0400
X-MC-Unique: rneFf8F9NQSTvoH5GY0R3w-1
Received: by mail-wm1-f70.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso93529wms.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 08:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=mz+kXSmVPv70K8I+VHGmo4TAfS0XzVMXn3ftLNVemzs=;
 b=Eov98hlCjWgJrY2EcugKvLIjyiWDsi+KC69uhKHJn90mABi1XUINgKTHVwdcBbbZHi
 zHx8WYuFkN0GmxZlRjyhKVqvPqlMnucLqw8HFUjxjAOm6Qwv+2sxopFwVwD/4slVKTpP
 3j9dK0tDT/bfWOq7zYCREItKMSRByy4ihv6vNGezDfAFpVN3aUlXiZwxG97BQcNNwpT2
 oNrKjqL1x3l0JwlJV+NMN9wBq7wzWhnwyw7EhRM7HMwHCSaJLISYIsks30lLJYrZDmPz
 xu6fdKxOesmK9P/zG3388y2DFwrNFyxwV0wR85BSBfb2UtAfPMDEWDzklWGCZEJsK0lQ
 KP7g==
X-Gm-Message-State: AOAM530vMAH3vkNOBCMokwGF3P7Tx10djaq0u2y5bBFhIycMa5yPUkaZ
 SfbWzGtQ43rSvwfv7ug9I+HMXhwS0+9toHy/zNAR5afLLunjEUSCmimXAgcUmURTOJAJvoabKAS
 gheTi2Kck8FR1llM=
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr17445971wmq.71.1627918203319; 
 Mon, 02 Aug 2021 08:30:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDHpxuNQ24e3GNTY6szGTjIbo72s6m4llcmgZZBmN8ZNHHoXm4S+JeYIT6sty/omi7VkG1cQ==
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr17445945wmq.71.1627918203067; 
 Mon, 02 Aug 2021 08:30:03 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60af.dip0.t-ipconnect.de. [91.12.96.175])
 by smtp.gmail.com with ESMTPSA id
 o22sm3149117wmq.3.2021.08.02.08.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 08:30:02 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210802152238.10783-1-david@redhat.com>
 <4fb72846-d3ab-9488-a755-de9c6e4cf47c@redhat.com>
 <4ed5c12a-539b-9d5e-eefc-447f0dc7f410@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2345cd63-b285-cd3d-893d-12dfe32f6cf6@redhat.com>
Date: Mon, 2 Aug 2021 17:30:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4ed5c12a-539b-9d5e-eefc-447f0dc7f410@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.08.21 17:27, Philippe Mathieu-Daudé wrote:
> 6.1 material btw.

Indeed, should have tagged that right away. thanks!


-- 
Thanks,

David / dhildenb


