Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45DC2E25F3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 11:31:02 +0100 (CET)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksNtd-0002dT-UW
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 05:31:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ksNse-0001nC-Px
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 05:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ksNsd-00009M-5o
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 05:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608805798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iiYA9cPBbc9cG3VhTnXuCvZm5GnajoeAJh+3wYw7+NE=;
 b=AuRhl9/ifBtP9ZiPgtpquARw+KxCqr8bPm+sSt6FHKxUMPbRu6Seeycrybvxh+eCAZQrbk
 05UHrDGjMgqTSK9VLRjRCQvWpRGPluOGoE8U8h754CapZLYHEApOrR5nw9kTgXlzatihNR
 wlzwsj0UVC0uKXshxLnrtPuGkq8JeEw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-fsV4dA3UPYql1T8JW1HY1Q-1; Thu, 24 Dec 2020 05:29:56 -0500
X-MC-Unique: fsV4dA3UPYql1T8JW1HY1Q-1
Received: by mail-wm1-f70.google.com with SMTP id s130so582851wme.0
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 02:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iiYA9cPBbc9cG3VhTnXuCvZm5GnajoeAJh+3wYw7+NE=;
 b=UDRyG5odsnCqZXYjK8ZcoBZJHUy5bjFbj9sqQFeM4IdH9tENRhhJ+sIcqTD6EGdZjl
 wY9wteA9gltp2Va/ImwQ+QKRvvZhQIJ2iNu3iYSTbF9FE9QuMH8pz3ximra0e5+keByP
 bGjgiLqUCRkYEtDa1AsbF9wufMCrHuQFkB3rfaX6K3saAkj6MjbHJhJZRYZhW81fhx8f
 KeodgIyIpBwq/CyYrOovd9RTdQ/nRxR6e2UXKwJ4Yd4Ab8VcdRuUt55UYeX+HfM5O3kL
 9CjyDtfN1CHlluU+elbyOJxM9tVuu0PV6ezn1dQO9ondVfV5V2XvkmqNjYGZ4QvYOrTN
 nwdw==
X-Gm-Message-State: AOAM531uBGbAGUurlpu/ZwQJ5KKusJDn3+tstKkh/Ev9rcbIpbeAkszI
 nsElaNbWVe7VrXFpmGsuF76gnQyVYaQyIqIHCZIoUpD7YFylPzwxV5WaKEzLp/FrlnOZISSbt19
 qFOeZHPUSXEyDDEs=
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr3818717wmc.94.1608805795422; 
 Thu, 24 Dec 2020 02:29:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgeqI1yAR2j7L6aiqswgIX7BKqc5jD51yrhI30FwaizDDnVnri4mHc94iD8nm88lbiSiORyg==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr3818701wmc.94.1608805795251; 
 Thu, 24 Dec 2020 02:29:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s25sm42606444wrs.49.2020.12.24.02.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 02:29:54 -0800 (PST)
Subject: Re: [PATCH v2 1/2] ppc: Fix build with --without-default-devices
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
 <490464a3-d8a6-1814-2a5c-681eca3b96fa@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e84ce18f-5d8d-7ac5-3b3a-0dd9f0c939d1@redhat.com>
Date: Thu, 24 Dec 2020 11:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <490464a3-d8a6-1814-2a5c-681eca3b96fa@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/12/20 09:26, Cédric Le Goater wrote:
> In hw/ppc/Kconfig :
> 
>    config POWERNV
>        ...
>        select XICS
>        select XIVE
> 
>    config PSERIES
>        ...
>        select XICS_SPAPR
>        select XIVE_SPAPR
> 
> and in hw/intc/meson.build :
> 
>    specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c'))
>    ...
>    specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
>    specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
>    ...
> 
> 
> Couldn't we simply select XICS and XIVE in the PSERIES machine and
> compile 'xics_spapr.c' and 'spapr_xive.c'  when CONFIG_PSERIES is
> defined ? This to be in sync with the POWERNV machine.
> or introduce 'CONFIG_XICS_PNV 'CONFIG_XIVE_PNV' ?

I think just using CONFIG_PSERIES is the simplest.  But it's just a 
cleanup, not a bugfix.

Paolo


