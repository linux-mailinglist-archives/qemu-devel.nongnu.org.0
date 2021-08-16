Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241783ED0F7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:22:26 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFYp7-0005UG-7Q
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFYo5-0004nY-FM
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:21:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFYo1-000730-It
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629105675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CcKEixR7aLip3gMX21+mtAX3KWvwMN/HI3f5U4dVyY=;
 b=KO8s/NgR0AEKdpXRwOYhgPtxo54nz+K8YCOBOc8gh/qnOIRSWhftOTCBiM2k463AFc/qSX
 azzpcaMqF2a/bxFtBa88k4aZJBRjn1b++ec+UNwOTvjvEvNNZ2IEBdKSUIP7L1lkiijuXn
 Q0Ky0gNl/S+nmzzqaK24S0MYwZNJLNQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-fT24vdcVOAKbzgKcJfDcyA-1; Mon, 16 Aug 2021 05:21:13 -0400
X-MC-Unique: fT24vdcVOAKbzgKcJfDcyA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so5248521wri.17
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 02:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6CcKEixR7aLip3gMX21+mtAX3KWvwMN/HI3f5U4dVyY=;
 b=ZdmF39/3BUyg5v/PhBwSORhApjcQKXBJTLb2M+i8HRhGPatsdnQjNLrlwO865KsxEP
 GaqUa+TdfGEdNOqm7d/m2xahUJMmN70KLRTmHS7l1W0DTm7IvSgWHJN326sRUEV7QLws
 PQg5JkK4NOGmAPBhxc1z4wCc3bfSU6MruNOTPi2ULasX1Pxa2KvswNZ26wP2zjClc8Ah
 UWaOvaHPLVB5F5qPzV6qtsl4MTgbJjG1CL3bTI1kySipv5xnxoLN705TqCQmuoxobmzM
 nzmmIoNCml/kanROMBMfLSBp32nOKzfTHduXRD7X6zGs9bS6yNseGUVyXKUBBETF4TOL
 ruQA==
X-Gm-Message-State: AOAM532cNtAxi/8x8d6+X4kERgs0LY0YDmLG9U2WbqEKHdlICBJum5j4
 npzNea3HzQeh3CZFvG93gmsExjd7E3fXcVUDhAsaq2GXe3QdruwJ/fFKVUtSJEl6ddcTyTJ4OoN
 O1Jac/aGkEu4eTPo=
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr15806617wrs.216.1629105672736; 
 Mon, 16 Aug 2021 02:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ/ATO2ZfYHgYRvY0dgB7XNO8Z3bVPnBWitQ3uANSXsEFJzyr0UB883HD8gbR+2jZmT7EAiQ==
X-Received: by 2002:a5d:4a52:: with SMTP id v18mr15806597wrs.216.1629105672606; 
 Mon, 16 Aug 2021 02:21:12 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i8sm9768922wma.7.2021.08.16.02.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 02:21:12 -0700 (PDT)
Subject: Re: [PATCH] hw/acpi: define PIIX4 acpi pci hotplug property strings
 at a single place
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <20210816083214.105740-1-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9c755d3e-83b2-8910-236d-9f4d0b122892@redhat.com>
Date: Mon, 16 Aug 2021 11:21:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816083214.105740-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 10:32 AM, Ani Sinha wrote:
> Now that we have "acpi-pci-hotplug-with-bridge-support" PIIX4 PM property being
> used for both q35 and i440fx machine types, it is better that we defined this
> property string at a single place within a header file like other PIIX4
> properties. We can then use this single definition at all the places that needs
> it instead of duplicating the string everywhere. While at it, this change also
> adds a definition for "acpi-root-pci-hotplug" PIIX4 PM property and uses
> this definition at all places that were formally using the string value.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/ich9.c         | 2 +-
>  hw/acpi/piix4.c        | 4 ++--
>  hw/i386/acpi-build.c   | 4 ++--
>  hw/i386/pc.c           | 4 ++--
>  hw/i386/pc_q35.c       | 2 +-
>  include/hw/acpi/acpi.h | 2 ++
>  6 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


