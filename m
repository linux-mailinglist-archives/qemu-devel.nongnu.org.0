Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76076212983
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 18:31:46 +0200 (CEST)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr27l-0001vv-Ir
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 12:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jr206-0007rG-FB
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 12:23:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35737
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jr203-0006Lr-Tz
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 12:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593707026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RytLM0wkVNDj78wPhEpEO39LSmFEGISsxQ8o1e59J/c=;
 b=RTBwKezLTD++ww7dFzyMP21XzoeAEgdlnKicCqcuANZMEAD+WSgBETAWt08BzljTQRLAn+
 8SY3R4g91K9UsYURv5b7OzWLaTiU3zLUSxT7EI48EZfBRasTeZXUsqIFMoNW1Dgs0SO+uz
 iG16q/uVw0Q5iAceYGK0lnldjJnd5CE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-oje2sbvnPJy7jvs9IZ1KQg-1; Thu, 02 Jul 2020 12:23:39 -0400
X-MC-Unique: oje2sbvnPJy7jvs9IZ1KQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5E88015F3;
 Thu,  2 Jul 2020 16:23:38 +0000 (UTC)
Received: from [10.3.112.202] (ovpn-112-202.phx2.redhat.com [10.3.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A08D25C1D6;
 Thu,  2 Jul 2020 16:23:37 +0000 (UTC)
Subject: Re: [PATCH v2 03/44] qdev: Use returned bool to check for
 qdev_realize() etc. failure
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200702155000.3455325-1-armbru@redhat.com>
 <20200702155000.3455325-4-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b4689d9d-dcc2-c0fe-a2ee-ae0bdfff3d67@redhat.com>
Date: Thu, 2 Jul 2020 11:23:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702155000.3455325-4-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/20 10:49 AM, Markus Armbruster wrote:
> Convert
> 
>      foo(..., &err);
>      if (err) {
>          ...
>      }
> 
> to
> 
>      if (!foo(..., &err)) {
>          ...
>      }
> 
> for qdev_realize(), qdev_realize_and_unref(), qbus_realize() and their
> wrappers isa_realize_and_unref(), pci_realize_and_unref(),
> sysbus_realize(), sysbus_realize_and_unref(), usb_realize_and_unref().
> Coccinelle script:
> 
>      @@
>      identifier fun = {isa_realize_and_unref, pci_realize_and_unref, qbus_realize, qdev_realize, qdev_realize_and_unref, sysbus_realize, sysbus_realize_and_unref, usb_realize_and_unref};
>      expression list args, args2;
>      typedef Error;
>      Error *err;
>      @@
>      -    fun(args, &err, args2);
>      -    if (err)
>      +    if (!fun(args, &err, args2))
>           {
>               ...
>           }
> 
> Chokes on hw/arm/musicpal.c's lcd_refresh() with the unhelpful error
> message "no position information".  Nothing to convert there; skipped.
> 
> Fails to convert hw/arm/armsse.c, because Coccinelle gets confused by
> ARMSSE being used both as typedef and function-like macro there.
> Converted manually.
> 
> A few line breaks tidied up manually.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

The conversion is quite straight-forward.  The patch is big, but 
correct, and you documented where it is not mechanical.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


