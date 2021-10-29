Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CF6440410
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:27:53 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYTg-0003Gj-Mh
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgY1u-0007dq-0R
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgY1q-0001pd-Sk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635537545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LicGfhREA9CJzSNlKYBXn+yfbW9D7zYOnQajBU9wwA8=;
 b=CgJ5IxHvHTBJ0ksI06SDpqd/A82ANS/mhzzZ44xqyN9SX0/KETYM8tRZKKL/9qfFcfd5VF
 UW8g8tVevjGnypM3gMqrjgrRNAluYjLvo8SJ3VH8EGkfep7xiY0xmdlBwyNdZopWkvs1Lm
 m8/CIrLELn5JE0VXsAfdOI4+XEn4lDU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-GqF3ccuWMHm7rQ1Xk0ssmQ-1; Fri, 29 Oct 2021 15:59:03 -0400
X-MC-Unique: GqF3ccuWMHm7rQ1Xk0ssmQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p1-20020adfa201000000b001669acb9bcdso3889049wra.13
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LicGfhREA9CJzSNlKYBXn+yfbW9D7zYOnQajBU9wwA8=;
 b=x/7Lfd+RAGIFA/M82i4oyYnhj5tY50o1Xgpo0RZxYYuo/7orNldHaesMlCUYaINn8/
 gusrAx8hXLdVC8L50bz2sQmNZKj9RqGcXv9k6An0j1O0dN/HrlqlOXZdEgyOuQK3eesX
 +0q45AQb0EUyzwK+Y7+3w+DjF0339Y+/u4+KDzckwCqfMoR8PJIbqV7K4MR+MVfeVJis
 m9A+QPviAt9FP1Y5rUBhAjzN2BlKIdWiGMyjSuXvyUR02j9K/ch6RVlWFLaQ31CosWW6
 rPmpo4GS/RJcaSjQD9lxInLscmqooYm6hB6hB8mcdEhTs4YyOlhu8gmpA/CHQf26j36o
 2pPw==
X-Gm-Message-State: AOAM533q1FERmzbUEoWQTFHkroFIx+VCwa8nUXDzavACyJvSqfXA7OuO
 VXk3nd4hsw9pCUjLkbZf6nGplz8ni8s6xhZ/3RTXQCi2rCRVaIlxAhvFQLSpuyv199IkAIh/Usn
 rqVfGCDrR8HRKvYs=
X-Received: by 2002:a05:600c:4f16:: with SMTP id
 l22mr21449669wmq.152.1635537542753; 
 Fri, 29 Oct 2021 12:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgNa6tgy/ilA3SFYOIoLrw0unBQT5Nf16rfnVU56Xv2AJQlndwhQUnnm5urlI0uhHbNwH0qA==
X-Received: by 2002:a05:600c:4f16:: with SMTP id
 l22mr21449650wmq.152.1635537542579; 
 Fri, 29 Oct 2021 12:59:02 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l20sm11254583wmq.42.2021.10.29.12.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:59:02 -0700 (PDT)
Message-ID: <c43bff6d-497f-d8a0-f898-0dc73610ec87@redhat.com>
Date: Fri, 29 Oct 2021 21:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 3/3] machine: remove the done notifier for dynamic
 sysbus device type check
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
 <20211029142258.484907-4-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029142258.484907-4-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 edgari@xilinx.com, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 16:22, Damien Hedde wrote:
> Now that we check sysbus device types during device creation, we
> can remove the check in the machine init done notifier.
> This was the only thing done by this notifier, so we remove the
> whole sysbus_notifier structure of the MachineState.
> 
> Note: This notifier was checking all /peripheral and /peripheral-anon
> sysbus devices. Now we only check those added by -device cli option or
> device_add qmp command when handling the command/option. So if there
> are some devices added in one of these containers manually (eg in
> machine C code), these will not be checked anymore.
> This use case does not seem to appear apart from
> hw/xen/xen-legacy-backend.c (it uses qdev_set_id() and in this case,
> not for a sysbus device, so it's ok).
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> v3: clarify the commit title
> ---
>  include/hw/boards.h |  1 -
>  hw/core/machine.c   | 27 ---------------------------
>  2 files changed, 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


