Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2B47C21B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 16:01:55 +0100 (CET)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgeI-0000DH-3v
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 10:01:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzgbH-0007qg-0n
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:58:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzgbD-000688-4c
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640098720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnzFCEq+H3gesVWRk+r0JCtJ545gRzrw2KAB1Ua+ipg=;
 b=BeLZqdYy9TxueVjCbJwxKt8YvC+HURfq+Ekb2pGKA/HlcSoQAxSC9mcA3X+hsr3lOzqwoM
 UYpRu9B6hubtkH4ErwQzckEd/RfeTo/AY8lylg0dIYfSUMr3lqR5T1jXQoQ6TeknVvP2KR
 OLfhy/DLAIgI0OkKPUprIp2Zdq0Yp2w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-CI6dZ4hfMxe-0Bxd859D2Q-1; Tue, 21 Dec 2021 09:58:38 -0500
X-MC-Unique: CI6dZ4hfMxe-0Bxd859D2Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 ay24-20020a056402203800b003f8491e499eso5932364edb.21
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 06:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BnzFCEq+H3gesVWRk+r0JCtJ545gRzrw2KAB1Ua+ipg=;
 b=bLonS/We86ThCBZdlnoAQ1zJeha5aoioN9OFkFKaaS4+COyHWRsFI6SUG/+kHS1y+Q
 T1HUV3Sk+kdS2h9CBiyBwk6OVGdPKQvWjcnBE1jcIQLf3Gf4F086MW8KOxzSobhOi/UC
 JYiU12wLHXsktWw1ilVclQR2QsDCpqq/CYeHQ9me2m4MJxxkuQxZ5v+tVc4kylauMFkx
 32XNBV+x3QX9o+SZ23XjFvJ6lQoQ47zWvRBQFaAF6TNu98jQPx3m+hp9lpxeki41lSK1
 jWneA8E2afEVsBZ8jpKC7mLB0AvpPM5qvIGD4qW8EVAz9qm7dIzoFv3ymzCV/jRQRPZ3
 VdpA==
X-Gm-Message-State: AOAM532ttzoNszj+aB4JRcVWK0o3BEIEqUWWzEt0yRxW2fP8ckXTNMsW
 nULJXqtqM5hW8mliPiflxN0H3/KhbAW2kXELchFHW+zAv27hwtX+tSTP+45fqYZRQm96X1yAMQT
 YGDIPuIyXr6tknmI=
X-Received: by 2002:aa7:d546:: with SMTP id u6mr3572224edr.311.1640098717879; 
 Tue, 21 Dec 2021 06:58:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZLtM/+Fvl7D1BP0isoB7wVCd/9mMzzqz0h9wFQVlWEFVeX4/rRh87am9vvHCqjfm9uhrO4A==
X-Received: by 2002:aa7:d546:: with SMTP id u6mr3572212edr.311.1640098717720; 
 Tue, 21 Dec 2021 06:58:37 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id ds1sm8523098edb.91.2021.12.21.06.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 06:58:37 -0800 (PST)
Message-ID: <6ff66f81-061e-ae32-b580-e98abd5c3dda@redhat.com>
Date: Tue, 21 Dec 2021 15:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] acpi: validate hotplug selector on access
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211221144852.589983-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221144852.589983-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 15:48, Michael S. Tsirkin wrote:
> When bus is looked up on a pci write, we didn't
> validate that the lookup succeeded.
> Fuzzers thus can trigger QEMU crash by dereferencing the NULL
> bus pointer.
> 
> Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
> Cc: "Igor Mammedov" <imammedo@redhat.com>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/acpi/pcihp.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


