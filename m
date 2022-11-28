Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF72F63A611
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 11:27:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbM2-0003Xx-C7; Mon, 28 Nov 2022 05:27:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozbLz-0003Tx-Em
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozbLx-0006nH-Aw
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 05:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669631228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EakgvtqQbRHA3en9YHhdcYMfAMkYs/ByBd1P9ZUTM4o=;
 b=Y1uy1MzSu5GHd8S58mO0dFCW6KE9axQYXXkXD+I6uLlfNI6/xAUVRRsAqpwbcfyPVAGOtt
 9kfUVJqpmSRV9xoIjEBRMTtkyqGlp+ay4ivrzTz3DEF8mIdQaakP6RUs7Ej2HYx/V+LI8Q
 TzGqGQ6Z1BOaJVeKzHGVvKHYqvrGGgA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-knXSrEhROOy3PHW6HUGQkA-1; Mon, 28 Nov 2022 05:27:06 -0500
X-MC-Unique: knXSrEhROOy3PHW6HUGQkA-1
Received: by mail-wm1-f70.google.com with SMTP id
 8-20020a05600c228800b003d0376e42deso3571999wmf.4
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 02:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EakgvtqQbRHA3en9YHhdcYMfAMkYs/ByBd1P9ZUTM4o=;
 b=IydTOvVinL+HX8atJyCRlPJ4ajgMM3X6UQnwj+PsXs/Yg5MLKH7HLYFYhj5knVqHbJ
 0TPxtTO7UZqfPdwQsXMfDi95CbtCOsdyeqx5P9Z1RbHKG/DQoDreCXNWSBWm0aRF1TPT
 3ERXXCJbz80jA35PSE+zKoPOEwq0w+3peD2MGtYMGV53JwmPn/8qeuekgdkHmGA1WjoQ
 N/FjpIvK+9LjMKv/mCqOsGpOdIRYuvLSRkGAT5K684AePL4pISRAuswzPEn7IK7xsqsl
 3qGaFx70VC4RjwbZYOFvAdwMGpuA9cvw5q84li0QlwIQuQZ2QmnnfJRtgqGOWXQICmJg
 0nnw==
X-Gm-Message-State: ANoB5pkN9XtLaWdYyEq2eCX7jd9jvh7aztZxn8JQYuto1gFUOKdbBAZo
 wm3QEccJ0jHZeE4KNxwZjxDS6NeY/eE45eUll7HxCl0bdgRESgjrX4//0my6i2zhLevdP9fO83d
 vcwbGTXVgsJKI3gc=
X-Received: by 2002:a5d:5d0f:0:b0:236:6f6f:8dd7 with SMTP id
 ch15-20020a5d5d0f000000b002366f6f8dd7mr20566486wrb.4.1669631225811; 
 Mon, 28 Nov 2022 02:27:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6qDLAQXNq0I3+seaYNGlyTO1lKmwOpxk1qBZoXUW8ZxuP1NXMntgaPYQvOPVQUGPl09fQDpQ==
X-Received: by 2002:a5d:5d0f:0:b0:236:6f6f:8dd7 with SMTP id
 ch15-20020a5d5d0f000000b002366f6f8dd7mr20566472wrb.4.1669631225551; 
 Mon, 28 Nov 2022 02:27:05 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 q10-20020a05600c46ca00b003c6bd91caa5sm15691302wmo.17.2022.11.28.02.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 02:27:05 -0800 (PST)
Date: Mon, 28 Nov 2022 05:27:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
Subject: Re: [PATCH 00/12] pci: Move and clean up monitor command code
Message-ID: <20221128052635-mutt-send-email-mst@kernel.org>
References: <20221128080202.2570543-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-1-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 09:01:50AM +0100, Markus Armbruster wrote:
> This is mainly about splitting off monitor-related code.  There's also
> a few UI fixes to HMP command pcie_aer_inject_error.  One UI issue
> remains: when the second argument is symbolic (found in table
> pcie_aer_error_list[]), then any -c is silently ignored.  Should it be
> rejected?  Should it override the value from the table?

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to queue.


> Markus Armbruster (12):
>   pci: Clean up a few things checkpatch.pl would flag later on
>   pci: Move QMP commands to new hw/pci/pci-qmp-cmds.c
>   pci: Move HMP commands from monitor/ to new hw/pci/pci-hmp-cmds.c
>   pci: Make query-pci stub consistent with the real one
>   pci: Build hw/pci/pci-hmp-cmds.c only when CONFIG_PCI
>   pci: Deduplicate get_class_desc()
>   pci: Move pcibus_dev_print() to pci-hmp-cmds.c
>   pci: Fix silent truncation of pcie_aer_inject_error argument
>   pci: Move HMP command from hw/pci/pcie_aer.c to pci-hmp-cmds.c
>   pci: Inline do_pcie_aer_inject_error() into its only caller
>   pci: Rename hmp_pcie_aer_inject_error()'s local variable @err
>   pci: Improve do_pcie_aer_inject_error()'s error messages
> 
>  hw/pci/pci-internal.h   |  25 +++++
>  include/monitor/hmp.h   |   1 +
>  include/sysemu/sysemu.h |   3 -
>  hw/pci/pci-hmp-cmds.c   | 234 ++++++++++++++++++++++++++++++++++++++++
>  hw/pci/pci-qmp-cmds.c   | 201 ++++++++++++++++++++++++++++++++++
>  hw/pci/pci-stub.c       |   9 +-
>  hw/pci/pci.c            | 226 +-------------------------------------
>  hw/pci/pcie_aer.c       | 113 +------------------
>  monitor/hmp-cmds.c      | 107 ------------------
>  hw/pci/meson.build      |   2 +
>  10 files changed, 476 insertions(+), 445 deletions(-)
>  create mode 100644 hw/pci/pci-internal.h
>  create mode 100644 hw/pci/pci-hmp-cmds.c
>  create mode 100644 hw/pci/pci-qmp-cmds.c
> 
> -- 
> 2.37.3


