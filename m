Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408862FB6BD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:08:43 +0100 (CET)
Received: from localhost ([::1]:41272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rgY-0004uy-CK
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1rYy-0000P2-2i
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:00:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1rYu-0006jD-8G
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611064843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNBIOZC1DIqGhpxss8m/ZF3DvS8VXut56uN/gfy/rhQ=;
 b=UGwco/gDM9UJMnd7iKBAHMX2uoLkmF2M7HquHdkqNABjcdB7bLBkcCBCxpmmnyoTYy9WRU
 pbP+MFFbiJnqitx3UOH6w7ppMiEJcTcftd9OrWP4AjsCvT4coqgs+sIUrXvKZQkV5l9nIR
 YzzGgiqjOXNiiyKSr9wKKGVCzlmXFbQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-suZB1AqQOh2AcYu5EVSBjg-1; Tue, 19 Jan 2021 09:00:40 -0500
X-MC-Unique: suZB1AqQOh2AcYu5EVSBjg-1
Received: by mail-ej1-f72.google.com with SMTP id f26so6318783ejy.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sNBIOZC1DIqGhpxss8m/ZF3DvS8VXut56uN/gfy/rhQ=;
 b=knyLsdJcDSg8l8/JnzeM+uK0kKuUXQnVazbtyVQrp4jXvctmfF+YFsvtMoP+mQYTLS
 /+gxZgG96iUHNnzz/0CWN+m3ITlA7ej/NfHZ4hO9/bSlOeehIBtxNw5DndmMmSakfZfl
 VOx5ddjqLHUjH+6r1CfebDIpGKrCxzZYy0fZgztIEeJGNl+JIIAzZkQzsI+cjpc4o6sm
 rMSFdEuOJtuNdRi6cqCPra9AoITnAVLZmko2OV7QHYwaOxRMRX8QV7He6zX7PWqYyt2G
 ZXN6B2mszq309U6xD8sraFiZJH0BsFKyydFO6apaC79XwQKIdO2Y3KFWCO5rMBfXmcV8
 ly6Q==
X-Gm-Message-State: AOAM533H8I5hHFrVupdZZ4l1oWlELgDpwY4ie43lSPMu+2yGzdKdYnrQ
 g/OxFrH2FAFz74B6c1xCfrs0pUnL5khwixQ0LofdsdGYKoCOW6GHX4LawKAeEOv72E/PhTOXZqo
 fZZoQ3y1+DqpPLDc=
X-Received: by 2002:a17:906:6b91:: with SMTP id
 l17mr2892494ejr.171.1611064838864; 
 Tue, 19 Jan 2021 06:00:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr5zmF4wrZOJQrJwA9sOYWtrToJMpNlssUjmMEAocroIKQbJJMZlLzUpfd6KLtE2WJC7YWQw==
X-Received: by 2002:a17:906:6b91:: with SMTP id
 l17mr2892487ejr.171.1611064838732; 
 Tue, 19 Jan 2021 06:00:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g2sm1707884ejk.108.2021.01.19.06.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:00:37 -0800 (PST)
Subject: Re: [PATCH] hw/usb: Convert to qdev_realize()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210119120151.53757-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2335ea3d-3409-fa80-a1fe-9cb796bee095@redhat.com>
Date: Tue, 19 Jan 2021 15:00:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119120151.53757-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: sai.pavan.boddu@xilinx.com, peter.maydell@linaro.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 1:01 PM, Markus Armbruster wrote:
> Device code shouldn't mess with QOM property "realized" since we have
> proper interfaces (merge commit 6675a653).  Commit 8ddab8dd3d
> "usb/hcd-xhci: Split pci wrapper for xhci base model" and commit
> f00ff136ee "usb: hcd-xhci-sysbus: Attach xhci to sysbus device"
> reintroduced two instances.  Clean them up.  Note that s->xhci is
> a (bus-less) TYPE_XHCI device.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/usb/hcd-xhci-pci.c    | 4 +---
>  hw/usb/hcd-xhci-sysbus.c | 5 +----
>  2 files changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


