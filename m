Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1C86294EC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 10:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouseb-0003Gj-OH; Tue, 15 Nov 2022 04:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouseY-00038R-Rf
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouseW-00047C-34
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668506087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmeGLWXWb5yKPLKhU2XpcoYiHsqoRNqQ4QZX+kUWASU=;
 b=folZ23OlWH2xDlYmGsa4Iz1zXd69CgOJreAs8XOlArUd3Vo25hJy10vJIEFRYh/vvfcFd3
 hW2IhUyUxpoFa3Q/zKhZG9cj3pCleY7hpTqP9n9JnVlEl4Tz1aLkatlYPVWEr3qVuAHFGJ
 ATYkT6lF6lRbqiPdPf/9+T6zRJjrWjk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-d1NJOgdvMN6IA8BYoG91hw-1; Tue, 15 Nov 2022 04:54:45 -0500
X-MC-Unique: d1NJOgdvMN6IA8BYoG91hw-1
Received: by mail-qv1-f69.google.com with SMTP id
 ns11-20020a056214380b00b004c64784249eso2667392qvb.7
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 01:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LmeGLWXWb5yKPLKhU2XpcoYiHsqoRNqQ4QZX+kUWASU=;
 b=SstMgYD8VGhRvFlfjbhnvEglJta1QkmNWI58JprPkzFsy8HK1fGR+eHMrip8xhOOs7
 TlBxhRjOCeOyTc4biNx1ouXn9/AH3OiPjzHp89FguXQia2RC4a79PB7KvsPYkne3L+X7
 uyZVNKJj72uOagWDaALqt8zQ6emGgskRnXyIRnblv2jjxGwsvAaer7+vM26ReW+LGnlp
 C/YyMnJKU79lpCNwdxyFSuQty4abcq8GSK+vIWuz0VpwfGSwxzLrClTyl0W/xYAxeDoE
 heC0GPNZL8nJNuh9Mapx6NaK8KWf7litC6bxGc0bv8x1/sDaz/SxzQ3w93gdVbddkHED
 zSgw==
X-Gm-Message-State: ANoB5pm6tPF3NgAJzaof3y7pGbJmZvq9maNd6EdEMKg3GscituiUTAP+
 qkrNBTtSIjCzvmNz4Bjc1ONa1ZozLH0dNqPL5dLaAMj8xmext9MFYt3m28/QEDbLXOVhyS/BcUG
 LUYLRjK3r6PVBPao=
X-Received: by 2002:a37:bf46:0:b0:6ec:5409:5eaf with SMTP id
 p67-20020a37bf46000000b006ec54095eafmr14160521qkf.404.1668506084900; 
 Tue, 15 Nov 2022 01:54:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nM0DE2/7ktK+jLDobdCQpl3MBvMWxacBVkf70IbzdDyPXClOp0MVW1w+qAmQn5e5hxSVZ6g==
X-Received: by 2002:a37:bf46:0:b0:6ec:5409:5eaf with SMTP id
 p67-20020a37bf46000000b006ec54095eafmr14160496qkf.404.1668506084663; 
 Tue, 15 Nov 2022 01:54:44 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-149.web.vodafone.de.
 [109.43.177.149]) by smtp.gmail.com with ESMTPSA id
 x26-20020ac86b5a000000b003a51e8ef03dsm6878464qts.62.2022.11.15.01.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 01:54:44 -0800 (PST)
Message-ID: <602ae031-1336-2c41-0bad-9ff999fe7d98@redhat.com>
Date: Tue, 15 Nov 2022 10:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0] hw: Add compat machines for 8.0
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20221111124534.129111-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221111124534.129111-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/11/2022 13.45, Cornelia Huck wrote:
> Add 8.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 7 deletions(-)
> 

For the s390x part:

Reviewed-by: Thomas Huth <thuth@redhat.com>


