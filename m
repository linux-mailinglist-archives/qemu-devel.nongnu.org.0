Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F93F74DA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:13:33 +0200 (CEST)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrme-00031R-0X
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIrlU-0001e3-Iq
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 08:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIrlS-0004mi-8J
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 08:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629893536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ClPwls1R0G0Z/fSErbxxNYe/djKxycynV5/Taf8bWos=;
 b=ZxY/IbzBfWwxz7JqV+O+hbF6NwyW/0xojn9vkXFP0dK7sBftfx3iETcJUrUr4FX3RToPAZ
 VaAoUZmNNGKMZuTgNE7CrmdXKgG1aHUKNvE7qPIvZxk6Rao3bW4fX+8MIBg0+Ury0hQWJ3
 JVINJ7FHQ+Cr6OrVg6/TYtWWvsFNeFU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-S-aLAqiQMsahCa96TSr8xA-1; Wed, 25 Aug 2021 08:12:15 -0400
X-MC-Unique: S-aLAqiQMsahCa96TSr8xA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m33-20020a05600c3b2100b002e87a0542efso1170320wms.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 05:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ClPwls1R0G0Z/fSErbxxNYe/djKxycynV5/Taf8bWos=;
 b=lccYUwVok9KTw3xAuW6S3fT7hsFFveK3YW5qEA6JDbiI+hMwdZZeiKAzEhYsCp/ltB
 I+72ITu64vHKTqsKHOxbAZT0EqVes5AdC1G1cuv4vKbx6kzGdH9wemSikABMyaxr2pZL
 fBMYifzZEoBoog+sQdGnkEal3o6fZcaDgBNwU75h24To5kzZ0dLHrh5JfE4RbpDj7OX7
 6WmQQkoZT4TQC3+VN3mMcInS0R3+9HuFoDY2AdnLLsNdintVC4tEgCIKNfmxVWhiA+CQ
 FkO3s/0vQmm7PsECJbbJgJ2xTHi+hi0/5J8Sv65OQhzmmRE14HPOX/c4dqeuo9E32UdF
 1SOg==
X-Gm-Message-State: AOAM530jf4v45Rhg+rO8NhR0t3uJwZeRDtMjeR/DETwx9xZNs7Ll5ZW/
 71DPAfE4Xeum9ras0d5YD3j+49ufzs1YSD4TvWAPtYijDFhdKCn6cBfw0R8ih+9P2PfiwP4Ay8N
 rJJVFXs3FAp7kdXw=
X-Received: by 2002:a5d:554e:: with SMTP id g14mr14285919wrw.48.1629893533994; 
 Wed, 25 Aug 2021 05:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhn9EzZGwTdx2YX/0Excq6oBXjr6Gsls2F2VWVJKibYZldNqqeO/1lYiDJXmMshRhLJDtBsQ==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr14285878wrw.48.1629893533665; 
 Wed, 25 Aug 2021 05:12:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id m7sm5039995wmq.29.2021.08.25.05.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 05:12:13 -0700 (PDT)
Date: Wed, 25 Aug 2021 14:12:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 1/7] memory_hotplug.c: handle dev->id = NULL in
 acpi_memory_hotplug_write()
Message-ID: <20210825141211.21448f50@redhat.com>
In-Reply-To: <20210825004835.472919-2-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-2-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 21:48:29 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> qapi_event_send_mem_unplug_error() deals with @device being NULL by
> replacing it with an empty string ("") when emitting the event. Aside
> from the fact that this behavior (qapi visitor mapping NULL pointer to
> "") can be patched/changed someday, there's also the lack of utility
> that the event brings to listeners, e.g. "a memory unplug error happened
> somewhere".
> 
> In theory we should just avoit emitting this event at all if dev->id is
> NULL, but this would be an incompatible change to existing guests.
> Instead, let's make the forementioned behavior explicit: if dev->id is
> NULL, pass an empty string to qapi_event_send_mem_unplug_error().
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/memory_hotplug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..6a71de408b 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -178,7 +178,7 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> +                qapi_event_send_mem_unplug_error(dev->id ? : "",
>                                                   error_get_pretty(local_err));
>                  error_free(local_err);
>                  break;


