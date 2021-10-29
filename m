Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4894440150
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:31:43 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVj9-0003kE-1t
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgVdh-00085I-Hs
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:26:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgVdd-0006GN-T6
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635528356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oS4cJSK/rB3azldIiPO/SPk9BQ1naXhLjUBwxtQ5yzA=;
 b=KoHHuYOHzrfwQj0WVAuFhXG6ss0daLIdyn8VojlCp6Zw8IDoCnptbM+1NFouXGujcLO8DC
 Xl2mHYTk7U1yCuVx4vqvKrRR7smjhorngwow9Gu+5y4JXAzNkQr2nvNxGEUXQ9gkXeHTiQ
 4tuPnr0FnVa3AWTh1mvGDZoN4sltCgg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-DWmaW_CbNo68BWqT_JLHvg-1; Fri, 29 Oct 2021 13:25:54 -0400
X-MC-Unique: DWmaW_CbNo68BWqT_JLHvg-1
Received: by mail-wr1-f72.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso595344wrq.16
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oS4cJSK/rB3azldIiPO/SPk9BQ1naXhLjUBwxtQ5yzA=;
 b=nuKG1y6c3Ko6bvNS4gArObpejFKZcfmfgO1NfvsVVEzCaMKlDv17SWFxgtr6S+cc1r
 Vs5Dm8McoeaWtuwaQBccsDNgaWoS8ZThpqqLJpH0jQ0pwMEVa/Dub/1fT+Bfk7ihIfRL
 gJlKpeWiiXZ85PlwT0j7ctlUbB5sI+K95QyYr6imJ4JR7MzDOADba5WKkZusmWZV937T
 GAHugp/J7EzJ7qCKY0k2EDI93yV18N600EEvZYHvjOs7XXmFy5xQchl6fk6sdFn+WDmb
 gxZUhHaAj3wHc06vY0Yc/DdqqJXzPo1pf9nmOzZLAx8x8Zoa66nwuxqovm0IIGK02cL0
 hDAg==
X-Gm-Message-State: AOAM532kUBgTLfp4uG6W4Fjfn9cRO3ej1qxkxo/3OgthcXoROXikGszS
 BW1h8wc8VUv9rPJd+gT3jxbU1jyNMys43wrMqnSwPR5lfub+osFZYFRbvdLudaI3VeJlxjM8tTk
 ZaCbvx1tuNgeaKEc=
X-Received: by 2002:adf:ab03:: with SMTP id q3mr16228334wrc.396.1635528353754; 
 Fri, 29 Oct 2021 10:25:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy424i3h1wlANrU5akp1JqIzoyJWgWAgIiXQWM7YMfO7X/eu8KnrtlCz7l2Tb5rcIhcbn8dQg==
X-Received: by 2002:adf:ab03:: with SMTP id q3mr16228296wrc.396.1635528353510; 
 Fri, 29 Oct 2021 10:25:53 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n17sm9828203wms.33.2021.10.29.10.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:25:53 -0700 (PDT)
Message-ID: <60ca6d72-57fa-5c8e-1bf3-b6c21670cca8@redhat.com>
Date: Fri, 29 Oct 2021 19:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/3] machine: add device_type_is_dynamic_sysbus function
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
 <20211029142258.484907-2-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029142258.484907-2-damien.hedde@greensocs.com>
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
> Right now the allowance check for adding a sysbus device using
> -device cli option (or device_add qmp command) is done well after
> the device has been created. It is done during the machine init done
> notifier: machine_init_notify() in hw/core/machine.c
> 
> This new function will allow us to do the check at the right time and
> issue an error if it fails.
> 
> Also make device_is_dynamic_sysbus() use the new function.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> Cc: Ani Sinha <ani@anisinha.ca>
> 
> v3: change the function name (Ani)
> ---
>  include/hw/boards.h | 15 +++++++++++++++
>  hw/core/machine.c   | 13 ++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


