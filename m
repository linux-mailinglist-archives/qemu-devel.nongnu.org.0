Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA7424F09
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:17:54 +0200 (CEST)
Received: from localhost ([::1]:58732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYObB-0000Ul-DW
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYOZ6-0007zQ-Gg
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mYOZ3-00033b-Qa
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633594540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DxAK0yUVKIgbMKdHtp5pztcrNSv2WtNDIOBUjJJ0tr4=;
 b=PGFSXS+HsNqFMkWeKMJZr1CM6R6e8LWma30sdfFYKN8RU+gSZif0qHJJEMwlAROZ1sxLbF
 NWWRBJTH2kJXnWZtOVblmJZFEL3tYrmVuFJvpI6XoYsuAGptZS8iU2Kn2muJOcnQkvm7E3
 77zVPoD5qynyD8QdA2lfzvQEluZGmpM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-cBEPshb1M2GjLvQxmyONOA-1; Thu, 07 Oct 2021 04:15:38 -0400
X-MC-Unique: cBEPshb1M2GjLvQxmyONOA-1
Received: by mail-ed1-f70.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso5105242edj.20
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 01:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DxAK0yUVKIgbMKdHtp5pztcrNSv2WtNDIOBUjJJ0tr4=;
 b=jobX45q1wButzSLyUIGw4xFpjheLoOenUGg6DCpbzsXvPBQS+MNiFPlH9WhHJTlfYl
 kFBxUMCWBmUqGAnW4UTmBRqTOxDCPL2x3vZC2WHkWRYDx66PyHGpvhK7J/g9K3E6TFTK
 /i2OfPufm9MudPtkLn4siTNYcO70x3m/MPRBvOSwa/sCsimFQSmwUsBw/lPVtVW2757R
 JfgI0o+zjKv7hBsH1akjVfu7ljeqmvVfr9zgu3uDcgVpVc6o2vYyARLJbwwBXQgyIaZX
 fVQsRvz5hFXsClC+ixnH0QxdelVwg7PpWV+LyB1vzkfVyTmfLOzJGezOPDAa4+CnkO1v
 5bEA==
X-Gm-Message-State: AOAM532eYHUwieRDtccQdPWvBy18reVWPh/icM5k2R2g/HFbBWL8kB8v
 2c3YL+MImYxHgHoJR9vogyRQYyuJ/M4ZMMgkyVNKaOQM+vk/OeHCleiuWLOA+G2wJYAN9krGNd1
 whiafAw8hqiOJ2c0=
X-Received: by 2002:a17:907:7790:: with SMTP id
 ky16mr4030305ejc.490.1633594537469; 
 Thu, 07 Oct 2021 01:15:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHKPf4wxs6qmoDWyLmObleuYSY56MD2+tOoMk+kBX/aZ7vXFJNgKVJ6dZTkxfklwAhD4ilvQ==
X-Received: by 2002:a17:907:7790:: with SMTP id
 ky16mr4030271ejc.490.1633594537261; 
 Thu, 07 Oct 2021 01:15:37 -0700 (PDT)
Received: from gator.home (cst2-174-28.cust.vodafone.cz. [31.30.174.28])
 by smtp.gmail.com with ESMTPSA id p22sm9793303ejl.90.2021.10.07.01.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 01:15:36 -0700 (PDT)
Date: Thu, 7 Oct 2021 10:15:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211007081535.izszbazepu7yp67c@gator.home>
References: <20211007072922.655330-1-eric.auger@redhat.com>
 <20211007072922.655330-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211007072922.655330-3-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, gshan@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 09:29:21AM +0200, Eric Auger wrote:
> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
> 
> The DBG2 table allows to describe one or more debug ports.
> 
> Generate an DBG2 table featuring a single debug port, the PL011.
> 
> The DBG2 specification can be found at
> "Microsoft Debug Port Table 2 (DBG2)"
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ---
> 
> v3 -> v4:
> - Change the revision in the header (0), + vs comments,
>   s/0x1000/vms->memmap[VIRT_UART].size
> - Added Michael's A-b
> 
> v2 -> v3:
> Took into account all comments from Igor on v2:
> mostly style adjustment, revision references
> 
> v1 -> v2:
> - rebased on Igor's refactoring
> ---
>  hw/arm/virt-acpi-build.c | 63 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


