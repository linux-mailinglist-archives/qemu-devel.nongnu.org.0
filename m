Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F94429E4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:52:56 +0100 (CET)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpXL-0004yH-Ah
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhpWA-00047E-80
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhpW8-0000KS-9o
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635843099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afah4Ab44XJ6B4B4iF3m/NWFaAdep8PKu87Jt5uo7eI=;
 b=U6oGEwttcHxSpEGOKh+kPYo2Vdp+yDbYK0C/cOhwy7fNyqs912pIt/ep13AQT6cAvOhGrP
 VCidEwZ5aXOMINjKxJ71umJJhFVaLV0meVrBzAjwfi/tcchYR/cog9mWJJarDJTJb25HAr
 EjEHLLwqnS1anFQx4SLsPKpPRTBMFC8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-5q91lDU2OAuqPH69BEwRNQ-1; Tue, 02 Nov 2021 04:51:39 -0400
X-MC-Unique: 5q91lDU2OAuqPH69BEwRNQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so581842wmj.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=afah4Ab44XJ6B4B4iF3m/NWFaAdep8PKu87Jt5uo7eI=;
 b=NZmrsfqE9azDgPu/yOpXRsfo2YojSBEdJ46OQs9o/GmECv5UU2EGkixsfKOqxaIUSy
 hNiJ4j0FOM6JPwQqRGLzlpU9A/OcMOWz7IFvGvCW2GzmN4Y7PCCx13wghk7hfbyo9DuY
 VVOlTjTWacggHOTJyDn+kiXGKPGs3nnmbUAKA/TO5rLmbpA52FmVrvDJPrJCxjfNNuT3
 krL5IEpGkBOM+oKWfzCUoZlLPGmnUNDwxZ7QXXkHTnGQMa3QQXS9VHsRc4qxIpYKVH6c
 IXLOekRmMSjBU3x3UP9tSDoI1vzGQ0gd0B0z/6Gqwx8uI6jm06RhhejpnGskdphu95xG
 uhmw==
X-Gm-Message-State: AOAM533C1gsXDp1C1eTo9aO/O1ald/TjpSr5xcYXur64EKMYAOZWXPeC
 eMnQ2/uL8Lo6lw5fEYFRW2lzatMBOfHsM5GtLCBr/l1+alm/GdyjDYJ6w8wf/hJ4rJnjfPufkbm
 njKEfCgWBPdbEFco=
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr5387041wmc.9.1635843097367;
 Tue, 02 Nov 2021 01:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+cpO1X68Ib7e8TDus5+0XBDhF3hgg7AXL8xrHl4nOGyElKGcU0XYfdmaZJx47P9NJE20itg==
X-Received: by 2002:a1c:7e41:: with SMTP id z62mr5387017wmc.9.1635843097185;
 Tue, 02 Nov 2021 01:51:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x1sm1750961wmc.22.2021.11.02.01.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:51:36 -0700 (PDT)
Message-ID: <a2618cf2-a2a6-53f6-a7f0-8bb3a72d32e9@redhat.com>
Date: Tue, 2 Nov 2021 09:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 3/3] hw/i386: expose a "smbios-entry-point-type" PC
 machine property
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-4-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026151100.1691925-4-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 17:11, Eduardo Habkost wrote:
> The i440fx and Q35 machine types are both hardcoded to use the
> legacy SMBIOS 2.1 (32-bit) entry point. This is a sensible
> conservative choice because SeaBIOS only supports SMBIOS 2.1
> 
> EDK2, however, can also support SMBIOS 3.0 (64-bit) entry points,
> and QEMU already uses this on the ARM virt machine type.
> 
> This adds a property to allow the choice of SMBIOS entry point
> versions For example to opt in to 64-bit SMBIOS entry point:
> 
>    $QEMU -machine q35,smbios-entry-point-type=64

It would be nice to have a test for this...

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Based on a patch submitted by Daniel Berrangé.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> This is patch was previously submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> 
> Changes from v2:
> * Rename "smbios-ep" to "smbios-entry-point-type"
> 
> Changes from v1:
> * Include qapi-visit-smbios.h instead of qapi-visit-machine.h
> * Commit message fix: s/smbios_ep/smbios-ep/
> ---
>  include/hw/i386/pc.h |  4 ++++
>  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     |  2 +-
>  4 files changed, 32 insertions(+), 2 deletions(-)


