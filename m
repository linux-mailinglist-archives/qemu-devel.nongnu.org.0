Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B463D012F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:04:47 +0200 (CEST)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u6o-0004pf-8d
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u55-0002nH-KW
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u52-0007ub-03
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XzxOiDcBkPOJqQOCoTMG+ciAfcJPoyfZbYFz0r0CV0A=;
 b=M0X6hOYS8octxP1HuQj7RI1OBdaMSEJjH9Mp3hWuRfI1vkOJuMxJFlTW2ZmaIqMRmBif5g
 kVvKntV8ru+T/EoUBnBu0F5cpxHaYH+iyaA+FHzW5tcgblLN5Rk0wMM/R+u7xWnpgXFm0V
 EqlUBBe/0ICkUTKU/C27WlI7D2r0kCI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-varYYfH5Pi-xW9fR3lPSeg-1; Tue, 20 Jul 2021 14:02:53 -0400
X-MC-Unique: varYYfH5Pi-xW9fR3lPSeg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r18-20020adff1120000b029013e2b4ee624so10671525wro.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XzxOiDcBkPOJqQOCoTMG+ciAfcJPoyfZbYFz0r0CV0A=;
 b=hIE/KxQFdwGMMODTvP3UeUUnUJYoZfh7XrXp8Hoo1bbCo2N1qIaMKkQyNcp7BVWpmY
 DayEIVK8XGKMiraqyw4pC5riNbN6nhKd1vjn8oIpVMI3ICP/kcTYrf1DAgcuWZ0z53Om
 24hwVxMWOtPVBzQt4KH8I0IDOebSIt7H/1R6kNSkdPsW8MOZpQHTV+Of6DywoHZmFmXf
 1IgWShtWz5gds+Q8fyA0QKheZIFpJ2Xe5f0ra/nWr0dS30Z/gZ+0h3aW/9Ud/NeeLG89
 zW0qIGGc56alPZeLZ+oVo/eovaWKD3A/l0zgJazT9OprWDuyOEusjJvX5T6MiNojrPzv
 XMXA==
X-Gm-Message-State: AOAM530NOMGjgt6W7+ROFaGu9SnJHOXgli6FEKArUfSnuPIQZTREYZ8Q
 QRMAUOeEbYszhi8P3u0YfQmZIsJDeCP4RTad3ffHDW+G8eh1c7H02K1pii6zsny/GiZtVBgOlzO
 FuG7H4Ue9LiXFEIw=
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr37615366wrm.145.1626804172901; 
 Tue, 20 Jul 2021 11:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUmTAGikjDdL1as5Tpf5Jj0q5ygmzHOWO0RIn4fYklJGeLY7SCAE7O7o1UOE0Kv6m9xjdxaQ==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr37615337wrm.145.1626804172687; 
 Tue, 20 Jul 2021 11:02:52 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id o6sm23970861wry.91.2021.07.20.11.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 11:02:52 -0700 (PDT)
Subject: Re: [PATCH 04/16] multi-process: Fix pci_proxy_dev_realize() error
 handling
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-5-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <57b51182-3988-a9cc-10b6-ed2eac10937d@redhat.com>
Date: Tue, 20 Jul 2021 20:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-5-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:53 PM, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
> 
> pci_proxy_dev_realize() is wrong that way: it passes @errp to
> qio_channel_new_fd() without checking for failure.  If it runs into
> another failure, it trips error_setv()'s assertion.
> 
> Fix it to check for failure properly.
> 
> Fixes: 9f8112073aad8e485ac012ee18809457ab7f23a6
> Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Cc: Jagannathan Raman <jag.raman@oracle.com>
> Cc: John G Johnson <john.g.johnson@oracle.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/remote/proxy.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


