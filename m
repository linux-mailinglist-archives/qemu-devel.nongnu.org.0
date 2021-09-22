Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA1415013
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:43:58 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Dp-0004i1-EQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Ge-00010B-TO
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT6Gb-0000oU-IB
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632332564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVaOmuvSmYMdDMUDJJ0nLDELyFbMOLlDnDD2b93jvo8=;
 b=Htwu1n9DeDxsziaCPMz9t6wz0Mw0GtG++cWp/nBcFvG6MM6eM5UywOJvFWeioZrknvIQMD
 BBYgMXFCWrpjbf59/YJNDt/e8o6cbWAEIRHGKmLGfdTK7EBPQeGgjt1uf/R6xGfw+B7q+X
 6GVImcLQ8pK8m9UKXmhJNv9hUnuVK+E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-oT9GJEPoMYWSw9jbRydaFA-1; Wed, 22 Sep 2021 13:42:42 -0400
X-MC-Unique: oT9GJEPoMYWSw9jbRydaFA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso2811061wrb.20
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uVaOmuvSmYMdDMUDJJ0nLDELyFbMOLlDnDD2b93jvo8=;
 b=jM5EOD8FN/MKwH+kyJ4L6pAek0F6h29k/L5A2A02VO5JV2wa1WhFbtw8WibpxW4iBz
 NU6l5hbWGKAsgUeYkqMA72UntvrDciml9jlMqynAErohiCkZwCV7wl9H1k2k8BufvpXg
 6pHBI9KCJQBgnOItV5Lc/cVqVkXpc542w/24Aaq1flHhJXCwkxymsnqhManFlJmiJcYj
 r5OdZSM0UGlgOjEnAgTKegfYubdx+nLkmbl5ggouKD4I4ybFaI6ojyKwxh7wAEhJvlgo
 BkagcjAwYHYz16TuIMcZgQ3xVT2fTGeYnVrNBYGpbG9sg/m0iXYuMLkXEjsxGWx+blwN
 6tJQ==
X-Gm-Message-State: AOAM532O75wUNaW7UqZXKguQWM6CdYgHGautd1MDp47mkgW0iykeZ/a9
 shgpPk3Gr7rLlMgS6beCPD/iE4CMFzJQthAFztyH0607JeUGv2D6t7nPdcBrnskCMBvWOuU0R9V
 8CqjDMB39obSBj+k=
X-Received: by 2002:a1c:7310:: with SMTP id d16mr326724wmb.30.1632332561639;
 Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMUMMi8eLqjRXCSalitvGzPda/oA8H6U5KYwVIDPTTCJLTISya0LAgbbYFrl2db1iXLKfbNQ==
X-Received: by 2002:a1c:7310:: with SMTP id d16mr326712wmb.30.1632332561486;
 Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w1sm6588014wmc.19.2021.09.22.10.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:42:41 -0700 (PDT)
Message-ID: <bc37831d-4d31-8b02-acc9-c54191bbf31e@redhat.com>
Date: Wed, 22 Sep 2021 19:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-12-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 18:14, Damien Hedde wrote:
> It allows to try to add a subregion to a memory region with error
> handling. Like memory_region_add_subregion_overlap, it handles
> priority as well.
> Apart the error handling, the behavior is the same. It can be used
> to do the simple memory_region_add_subregion() (with no overlap) by
> setting the priority parameter to 0.
> 
> This commit is a preparation to further use this function in the
> context of qmp command which needs error handling support.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>   include/exec/memory.h | 22 ++++++++++++++++++++++
>   softmmu/memory.c      | 22 ++++++++++++++--------
>   2 files changed, 36 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


