Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BED5A2A16
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:55:01 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRajc-0007T7-4B
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRa7V-0004Pk-To
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRa7S-0004ih-PJ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661523333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwkLPif+QP44xUTFalYyNFr7iLnLtUy7KBlEe6+EY28=;
 b=TAF4NZyzvLmLIrQY4h5vsFXAgXRQedSYAJjoTr8fVPnS0HcpxTgoO8qEnqMocIlQxKfh+y
 P/YeU7ugdX9NWKZSnLyZKwgFA5Hcqg9jskyfIQs26u7fI/Ylhs3zMtxhtwuJrGijGw4N/F
 yeFrcaTa9nKMuPBh6fYYkN3s0tmGTM4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-cQ8Erb_KNQOGDhmuFI3ArQ-1; Fri, 26 Aug 2022 10:15:32 -0400
X-MC-Unique: cQ8Erb_KNQOGDhmuFI3ArQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r131-20020a1c4489000000b003a7b679981cso737036wma.6
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=LwkLPif+QP44xUTFalYyNFr7iLnLtUy7KBlEe6+EY28=;
 b=dwWf3agwbHSY32nTbKSKGLzshvAWwuQXvdBIs65FrI/XB+bO3tdkNSRCNEWp7gjwwQ
 kwZ+us4b0F4aImwmIjzG0pnpqcnP1DoOTyeeQCX33FhFP6qSwovT0Q6GVotECvwTxpwU
 QfmvL5Tq+4UZKBCfhqXKrBdIh8ys2p1L8NbibV6zUFkUIF+aLhIeDNInYuPvhwHzIR4b
 MQIGq46Zcmko5ttbU3gifjbOsKWrMF9O+hPkOfKT3GqfOofsoilvJNrhU7D52ts+ee+l
 kUBWcME8V1SF2vl1jAc+vyz0K2tdKdTi1LIVP1yB78igrKtKA6O20au9HXP/vve4KrDe
 p11Q==
X-Gm-Message-State: ACgBeo1n0vZ5yKwYoQPhP9nsujDCMbql2UXqXBhzzglqdhQwTRRKV/hZ
 aEoi5LGDIVQ6+qqLnI8XNQz1Yyyo16+OLPbGgzpH6aZHYdzc2b3sGMDlvM9jC+S9qVhDncvO+L8
 BOPXVuUyV9nfT8wU=
X-Received: by 2002:a05:600c:3844:b0:3a6:123:5ac5 with SMTP id
 s4-20020a05600c384400b003a601235ac5mr11261094wmr.102.1661523331588; 
 Fri, 26 Aug 2022 07:15:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR43KQyNATBeoJWQi0IIyIeub6vVLdQjGBm+IMQ3dt/T/dDaSTDEKHGIL03UdiwyI9lVgo+YKQ==
X-Received: by 2002:a05:600c:3844:b0:3a6:123:5ac5 with SMTP id
 s4-20020a05600c384400b003a601235ac5mr11261077wmr.102.1661523331309; 
 Fri, 26 Aug 2022 07:15:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa?
 (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de.
 [2003:cb:c708:f600:abad:360:c840:33fa])
 by smtp.gmail.com with ESMTPSA id
 m124-20020a1c2682000000b003a5f783abb8sm8874468wmm.30.2022.08.26.07.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 07:15:30 -0700 (PDT)
Message-ID: <6cb75197-1d9e-babd-349a-3e56b3482620@redhat.com>
Date: Fri, 26 Aug 2022 16:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220816101250.1715523-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 16.08.22 12:12, Emanuele Giuseppe Esposito wrote:
> Instead of sending a single ioctl every time ->region_* or ->log_*
> callbacks are called, "queue" all memory regions in a list that will
> be emptied only when committing.
> 

Out of interest, how many such regions does the ioctl support? As many
as KVM theoretically supports? (32k IIRC)

-- 
Thanks,

David / dhildenb


