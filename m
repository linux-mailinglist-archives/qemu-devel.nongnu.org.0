Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BEC2E719B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 16:14:01 +0100 (CET)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuGhD-00034t-Lo
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 10:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuGeI-0001k9-Fg
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 10:10:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kuGeF-0003hr-N6
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 10:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609254654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SwhaOIlTkv9QP8a3UFA8Swo1TVOqoGRsxP6/lSEPEE=;
 b=CdFl8AlCmwMYVYLYjhOl6CM5uo6mK0akS1+lHjmfEstWHeZVo67ahhGC7prhlAmjyWLWUX
 G2Rq/EzxhMgKv4Pt1XHpg1C1TCYs/AGj2p38xNnOC8sXGMby1l5BCa0sUmu0et75U9kkRx
 wH48lp9zpz0oQnHrQQcSeG3a9K4wQHM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-k4azXfuWMC67GL810s7KQg-1; Tue, 29 Dec 2020 10:10:50 -0500
X-MC-Unique: k4azXfuWMC67GL810s7KQg-1
Received: by mail-wm1-f69.google.com with SMTP id g82so1355413wmg.6
 for <qemu-devel@nongnu.org>; Tue, 29 Dec 2020 07:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7SwhaOIlTkv9QP8a3UFA8Swo1TVOqoGRsxP6/lSEPEE=;
 b=e5QDrGyYsF05uZhtEbRoo783O5UCPuC6Ax9d/2QiDtWL11uyV0mL4zCtcl6eZTsiwd
 +0sjE/12H0V7EH6UKP58zb+ZBQS6szK855e6RsKxX5eOrrLwP1jj5m4aGqsNNY+Z3QkC
 Rx5ui2XBNwxR0MeAHhANCFQxptYp25PQ/dOlQG5nPrdKigvC5vU9ZuJrxmU54oIqp8VM
 VollYPIW1fTEX/tr6E6cB8jtKn/+n4f3aa7urOJlrbLvdrdxv/UXT9MULIrg1s5OSFoZ
 vG2hwD4h5HRkpiIJ3IjAnd2OLvl/YdywTjmH7A09YfHq/MrATrwK7W52Ri6AnBOY07rh
 y3jg==
X-Gm-Message-State: AOAM530uK4cdhywulma7V4RbRoCMEKWMt5h+evE0MQsgpAZ/KKYXpdtx
 s7OP5Ibhh4Qve+MnkE1DhFxDod8d0lkDmDChcEFxFgcQAqI5nlhbJF+wyxpUzT6MZPZO6so3ib+
 VCFf8wGz3PDLqdK4=
X-Received: by 2002:a1c:3987:: with SMTP id g129mr3813591wma.86.1609254649314; 
 Tue, 29 Dec 2020 07:10:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4EN527b2fWrlWr6SgP7Pc6BDSwryOWeW90KGfJeBL2lmFJ/rRtmMy/Pk9eoi3ptyMCovTBg==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr3813569wma.86.1609254649090; 
 Tue, 29 Dec 2020 07:10:49 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id b12sm5224778wmj.2.2020.12.29.07.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 07:10:48 -0800 (PST)
Subject: Re: [PATCH v2 0/3] pc: Support configuration of SMBIOS entry point
 type
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201214205029.2991222-1-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <328375f8-772f-c2b7-38d9-8b8dfe0e33b1@redhat.com>
Date: Tue, 29 Dec 2020 16:10:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214205029.2991222-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.07, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 9:50 PM, Eduardo Habkost wrote:
> This includes code previously submitted[1] by Daniel P. Berrangé
> to add a "smbios-ep" machine property on PC.
> 
> SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> large number of VCPUs can easily hit the table size limit of
> SMBIOS 2.1 entry points.
> 
> [1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
>     https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> 
> Daniel P. Berrangé (1):
>   hw/i386: expose a "smbios-ep" PC machine property
> 
> Eduardo Habkost (2):
>   smbios: Rename SMBIOS_ENTRY_POINT_* enums
>   hw/smbios: Use qapi for SmbiosEntryPointType
> 
>  qapi/qapi-schema.json        |  1 +
>  qapi/smbios.json             | 11 +++++++++++
>  include/hw/firmware/smbios.h | 10 ++--------
>  include/hw/i386/pc.h         |  3 +++
>  hw/arm/virt.c                |  2 +-
>  hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c            |  2 +-
>  hw/i386/pc_q35.c             |  2 +-
>  hw/smbios/smbios.c           |  8 ++++----
>  qapi/meson.build             |  1 +
>  10 files changed, 51 insertions(+), 15 deletions(-)
>  create mode 100644 qapi/smbios.json

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


