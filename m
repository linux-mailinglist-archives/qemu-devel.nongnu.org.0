Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3878D3E28D4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 12:43:42 +0200 (CEST)
Received: from localhost ([::1]:47004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBxKH-0001WW-Ad
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 06:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxJF-0008SS-9W
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBxJD-00075i-Pl
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 06:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628246555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6foklNsGw6MYFa3FirTsSYHT1MyPEngr7yP+wuS8x2U=;
 b=f6cZXyNQrEa14UVaWxWtvRjIDmXVW896TiYjrfuE6ygZBIF9kntwC3YVfcf+SIcKnVnGln
 0ZXgEqOz4YpaK/+E2r1MYhYP6TgGAx4VWmk4ukdFybXA244h1UdgxSHeN9OdwC45oKUPUo
 gpR421LKmnj+OqCgVlAz2/oymQSGQ2A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-y3U59HCdN6SPCEUl-lPbnA-1; Fri, 06 Aug 2021 06:42:28 -0400
X-MC-Unique: y3U59HCdN6SPCEUl-lPbnA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m37-20020a05600c3b25b02902b5a02478adso1885765wms.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 03:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6foklNsGw6MYFa3FirTsSYHT1MyPEngr7yP+wuS8x2U=;
 b=RWF3+lXVNFdvaxrzP8c3+IcbIjrfSKKwOLwikyYps4h+xF4myOPTZr4vPnwSWeJTon
 OuaQlfSa9pGCgBLobAPxh8r0SlL1rk9W03P7r8ds/nIoG8jsgcS1AsQLDOBNGfyxnPHv
 /j+L6pCmv0dkuQq7GyP5YUMAFwW7alM8i+M15ICyjvNIGNHiWrrKryZh6Lq4Q0OMxHmx
 JQg8bFqsNvT8gdzxxEQW/eU3oxfV0pQARcZzuj/FZOUW8tvwg/AUtcmYaWWJC4gvgmQ+
 jhElZPTUTgkFL2Kg85/LQbBjAdD5QzTyniz40EmiaHQCKnie8rLjzJs0C6gH0gzzL5Un
 lPog==
X-Gm-Message-State: AOAM533q2l/ae5MESmF44CMsgtqmA7m4wwXDAZkIzWCkbcCPL6OxJ5Em
 VcfIuI4Yyl4+2/ggXqq+2JOC1K45icecXj/X1o1+3QJBfX0mF1Qs6nQT7QWCPdOMXZvukXhbD1M
 kyVDC8CtFdAQpxVE=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr19526797wma.164.1628246547779; 
 Fri, 06 Aug 2021 03:42:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx11HhXU+6ZaBhw49d6Upj2+uIh/AcbtI8rW4AOnnSDvGw7LN4NW0zpRIO7NPvBmqwfD0PZCA==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr19526791wma.164.1628246547669; 
 Fri, 06 Aug 2021 03:42:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d5sm8919740wre.77.2021.08.06.03.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:42:27 -0700 (PDT)
Date: Fri, 6 Aug 2021 12:42:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.2 1/6] acpi: Delete broken ACPI_GED_X86 macro
Message-ID: <20210806124226.21ba1d49@redhat.com>
In-Reply-To: <20210805193431.307761-2-ehabkost@redhat.com>
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-2-ehabkost@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 15:34:26 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The macro never worked and never will, because the
> AcpiGedX86State type never existed.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/acpi/generic_event_device.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 6bed92e8fc5..d49217c445f 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -70,8 +70,6 @@
>  OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  
>  #define TYPE_ACPI_GED_X86 "acpi-ged-x86"
> -#define ACPI_GED_X86(obj) \
> -    OBJECT_CHECK(AcpiGedX86State, (obj), TYPE_ACPI_GED_X86)
>  
>  #define ACPI_GED_EVT_SEL_OFFSET    0x0
>  #define ACPI_GED_EVT_SEL_LEN       0x4


