Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59AA588F88
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 17:39:25 +0200 (CEST)
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJGSy-0003Zd-88
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 11:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJGQQ-0000fy-Qa
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJGQM-00077O-Ig
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659541000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ALFBzGV6gFudscF3wT3XLoiPGXN2+SeY3m5qnnOwDg=;
 b=gpUdlTkCYvSNTzSnmeqVG+XzDyTlqDZR0BfWpL3hm1YlHmonFAPFv91CMqbF0UXgg8zmWO
 5IHJSs/Uvb0TSOVHbmROAKdGsNyuoru0DzVK/nwLa9cMs3gCqp8X93BrkQ7CfxLuAA2pID
 FCOos7Ocs0MIPsiZA/+Mw40eTyZCfkY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-IxV3fZpYN6aO2tlxnhHYCQ-1; Wed, 03 Aug 2022 11:36:39 -0400
X-MC-Unique: IxV3fZpYN6aO2tlxnhHYCQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z6-20020a05640240c600b0043e1d52fd98so2301613edb.22
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 08:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=9ALFBzGV6gFudscF3wT3XLoiPGXN2+SeY3m5qnnOwDg=;
 b=Tx9AVonPl11XE96D4ZfGUet3Ma/4Y8QX3F9997/92WAipUXA8UHHm1uyQdQ71CIsIk
 4+EOZPVV4MTvquBBaclkeDyPhKwOMmYuG5Nz3+RvDxTvxVli+vUWrAuP/zsP3lzzQU1B
 EXaJWt3x9yAzMVjeBm5RgjQowhL2iLLUmE3q+dWNF/HjbCzidJi/zld0DWPE+BF3PXWc
 fBUaEPUjS1ApTH3HbvozyHfA1ueZ/OgbrieqVZ37Xo/Na9TCHwPIttPlHcGrf7YsV+q/
 vKjrRyyDTM07x6s2X/dKvK5aG5k3RBJnqjzu/nbXRyeRpMe+tiNuAfUckfLsIl9KjHbN
 GSsQ==
X-Gm-Message-State: ACgBeo3MD0KJSnnRJuzkh9GsuERS+/DeZ6ZArOZaaJe7yOtIx0HLaNCu
 LXXCebwnr0O5N6kcN+y+1+hFJm8WlHveFvGF8dOBMsdBFlWlXabIkNfNKl8edCuBzkkZYkpQqmI
 FG5yDEK0F6UjkybI=
X-Received: by 2002:a05:6402:268a:b0:43e:84d:c5cc with SMTP id
 w10-20020a056402268a00b0043e084dc5ccmr7739402edd.372.1659540996914; 
 Wed, 03 Aug 2022 08:36:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7i655e3N16grAwrBONSbvbRsJ72NW2FO9mOx0bcrOb60zHA+MXJI2IDSwt7aWETxxbsPTu2Q==
X-Received: by 2002:a05:6402:268a:b0:43e:84d:c5cc with SMTP id
 w10-20020a056402268a00b0043e084dc5ccmr7739384edd.372.1659540996683; 
 Wed, 03 Aug 2022 08:36:36 -0700 (PDT)
Received: from redhat.com ([2.54.191.86]) by smtp.gmail.com with ESMTPSA id
 g26-20020a170906539a00b0073080c22898sm3661498ejo.15.2022.08.03.08.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 08:36:36 -0700 (PDT)
Date: Wed, 3 Aug 2022 11:36:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: bchalios@amazon.es
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, imammedo@redhat.com,
 dwmw@amazon.co.uk, graf@amazon.de, xmarcalx@amazon.co.uk
Subject: Re: [PATCH 0/2] vmgenid: add generation counter
Message-ID: <20220803113537-mutt-send-email-mst@kernel.org>
References: <20220803134147.31073-1-bchalios@amazon.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803134147.31073-1-bchalios@amazon.es>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 03, 2022 at 03:41:45PM +0200, bchalios@amazon.es wrote:
> From: Babis Chalios <bchalios@amazon.es>
> 
> VM generation ID exposes a GUID inside the VM which changes every time a
> VM restore is happening. Typically, this GUID is used by the guest
> kernel to re-seed its internal PRNG. As a result, this value cannot be
> exposed in guest user-space as a notification mechanism for VM restore
> events.
> 
> This patch set extends vmgenid to introduce a 32 bits generation counter
> whose purpose is to be used as a VM restore notification mechanism for
> the guest user-space.
> 
> It is true that such a counter could be implemented entirely by the
> guest kernel, but this would rely on the vmgenid ACPI notification to
> trigger the counter update, which is inherently racy. Exposing this
> through the monitor allows the updated value to be in-place before
> resuming the vcpus, so interested user-space code can (atomically)
> observe the update without relying on the ACPI notification.

Producing another 4 bytes is not really the issue, the issue
is how does guest consume this.
So I would like this discussion to happen on the linux kernel mailing
list not just here.  Can you post the linux patch please?




> Babis Chalios (2):
>   vmgenid: make device data size configurable
>   vmgenid: add generation counter
> 
>  docs/specs/vmgenid.txt    | 101 ++++++++++++++++++--------
>  hw/acpi/vmgenid.c         | 145 +++++++++++++++++++++++++++++++-------
>  include/hw/acpi/vmgenid.h |  23 ++++--
>  3 files changed, 204 insertions(+), 65 deletions(-)
> 
> -- 
> 2.37.1
> 
> Amazon Spain Services sociedad limitada unipersonal, Calle Ramirez de Prado 5, 28045 Madrid. Registro Mercantil de Madrid . Tomo 22458 . Folio 102 . Hoja M-401234 . CIF B84570936


