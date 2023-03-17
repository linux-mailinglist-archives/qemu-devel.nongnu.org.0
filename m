Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727C36BE35C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd5N4-0003gT-Ff; Fri, 17 Mar 2023 04:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd5N2-0003g8-VI
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd5N0-0008Qy-Qc
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 04:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679041405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHgsqgsO5E6o6hDzqRYeUenlEPvFvFjVdUIrfaRUMC4=;
 b=KuyHonG4oCZ1Wr/D8QhDatUpqu4acRj9w6KmYxuynePsKqShyMGM1nIWZmhrF/CMeMB6lB
 bmia/381CeS2SVXG7u6RksQKL1+VnSUuE81U3aOFnGnO/qqaR5qxl2CXbf92jUBS0bFrro
 h/g1TxeI0/LvfwY+HRAHhfg14Se3RT0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-W0IDvBi-Pqi6i3eMu3MeoA-1; Fri, 17 Mar 2023 04:23:24 -0400
X-MC-Unique: W0IDvBi-Pqi6i3eMu3MeoA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m28-20020a05600c3b1c00b003ed307fddadso3933513wms.4
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 01:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHgsqgsO5E6o6hDzqRYeUenlEPvFvFjVdUIrfaRUMC4=;
 b=hd8rPLQhMOtI3UjqxMvdydc5It/HgxofPUyM/wUc/AZGyqkAdV9K0xtDxJ3oARCbBi
 RE9/TrcucSe4xG/Le828b15ttJM21p10mqi8JvL3xaioQJRhcIEA+YIHUdLT6xghVjHn
 2aiu2EANnYjZPuQaZUTqXeBZyv3GeY9T9kXibuB6RUEymyvmiTbQNJLQKS1VfB7xdWVq
 x5y4IDlFi3CSJT2ylXLFQ1WPTN6fkitSOwtuS0gE6GEcj+6D5M6HJvHBThIjH0/UyHnU
 4d2IYcTDe1xcVMIlq31xCv4cseMK3Viw/GZiIaWFAicVgPtGVokoewwu9/RWjrwcDoMc
 vd8A==
X-Gm-Message-State: AO0yUKW7LLYG2xXl/1CFm3CEZs7JZW260npOQSY+/PlgcGn1yau2CfiA
 KgHOdo2qHTWu60rkLWyr0fajAN+Cugzu2FRJBYyvtIK1SJ00AHC1/5jNz8Jp+WPCVbM7O5+V21k
 fDR8Cqg3MkbvFN3I=
X-Received: by 2002:a05:600c:3b14:b0:3ed:29f8:3ff2 with SMTP id
 m20-20020a05600c3b1400b003ed29f83ff2mr1624936wms.6.1679041403432; 
 Fri, 17 Mar 2023 01:23:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set/Byl7ANaZ54ebdfPQ0JOivRNouV25IbSsFneLLDwnZpLYKAFluFW9O9FThKmvmZOACBmza0A==
X-Received: by 2002:a05:600c:3b14:b0:3ed:29f8:3ff2 with SMTP id
 m20-20020a05600c3b1400b003ed29f83ff2mr1624903wms.6.1679041403150; 
 Fri, 17 Mar 2023 01:23:23 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 d12-20020adffbcc000000b002c54e26bca5sm1375468wrs.49.2023.03.17.01.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:23:22 -0700 (PDT)
Message-ID: <63a4c7f7-052a-e388-7938-f1a85edbed7b@redhat.com>
Date: Fri, 17 Mar 2023 09:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.1] hw: Add compat machines for 8.1
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
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230314173009.152667-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314173009.152667-1-cohuck@redhat.com>
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

On 14/03/2023 18.30, Cornelia Huck wrote:
> Add 8.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 16 +++++++++++++---
>   hw/i386/pc_q35.c           | 14 ++++++++++++--
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 10 deletions(-)

s390x part:
Reviewed-by: Thomas Huth <thuth@redhat.com>


