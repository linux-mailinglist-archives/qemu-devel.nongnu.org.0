Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADCB6FCA2A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:25:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPC5-0008LQ-0E; Tue, 09 May 2023 11:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwPC1-0008L3-19
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwPBv-0000gT-Nm
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683645829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2cM4IdB8QgFmSZUwMlHjpW+MYnUD0WvLNn4f0iQN8g0=;
 b=F0C96lBsKWwkUW7XBBAzi/Sd/nk2YD+oRi9W3QGjAs59quHyVhzcAJDj34LaaNDQ24AveD
 cWl5sFL5ggY0XtySGY7VgGRKTnVqmJbUFA6JnJUzxAEYzX/I0FAyucT9yVEJRlQtlR3rn9
 nz9AuEwBYEsJjd47Us8ZT0lmQjlH4K8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-3JHv8coEPuWfQmSzKiY4wg-1; Tue, 09 May 2023 11:23:47 -0400
X-MC-Unique: 3JHv8coEPuWfQmSzKiY4wg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3078df8ae31so1900551f8f.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683645827; x=1686237827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cM4IdB8QgFmSZUwMlHjpW+MYnUD0WvLNn4f0iQN8g0=;
 b=GwpcysWVy49gh+sEfXf9skVMPFcKan9/Puet4dOdmVfm18x32udZIFeBOsZlRswBw/
 JllOD3BJFOSqKBBCQDzWfShSkWEI2tAQpYtpj07xgusaKdP0Hf6kzKT7fUN42eBrcTEj
 gkslzhybJcPKsXTv6Hp9pBF5cJSd1VyXcDr3+KFHNdfV7zAPcxCUmoF0ItgucwD/e0gl
 1W1RTAuqm+j/1stQYcZAvcvgixmohCAHj+LdRdXVaOKa7ZEISozCXfj7gtOrBeXAY0hu
 pF3HZqixPJfkYL4HUYn/BVikGEEyp8xQ6zaRxNNLm+aAIaI+g23ejCaqGuTKnMTNkHOY
 evSg==
X-Gm-Message-State: AC+VfDzOahDv2udhKXnUr3kTq92XxW+Eph+3TFBGrJocys+ifFm2lvc2
 n9Cj3dHyrt/g22jO+V89DGbjbE0YcsSHrRGJiMRL9q5XYMILgb8Idq6/kS3W261ybjv127Q0O++
 AhABqMxiMN+nM03w=
X-Received: by 2002:a5d:48d0:0:b0:306:26fa:1d04 with SMTP id
 p16-20020a5d48d0000000b0030626fa1d04mr8388526wrs.13.1683645826775; 
 Tue, 09 May 2023 08:23:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dd4TGJt4tzPwdJFsvw8njnbZj/uBv22wXIe/tYyj+SA0BG0elg1X3Rwh+9cbIKcg/jx4dTw==
X-Received: by 2002:a5d:48d0:0:b0:306:26fa:1d04 with SMTP id
 p16-20020a5d48d0000000b0030626fa1d04mr8388518wrs.13.1683645826458; 
 Tue, 09 May 2023 08:23:46 -0700 (PDT)
Received: from redhat.com ([2.52.1.223]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002e5f6f8fc4fsm14742163wrm.100.2023.05.09.08.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 08:23:46 -0700 (PDT)
Date: Tue, 9 May 2023 11:23:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
Message-ID: <20230509112321-mutt-send-email-mst@kernel.org>
References: <20230503002701.854329-1-leobras@redhat.com> <ZFpSUXZIHU0F3yey@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFpSUXZIHU0F3yey@x1n>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 09, 2023 at 07:01:53AM -0700, Peter Xu wrote:
> On Tue, May 02, 2023 at 09:27:02PM -0300, Leonardo Bras wrote:
> > Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
> > set for machine types < 8.0 will cause migration to fail if the target
> > QEMU version is < 8.0.0 :
> > 
> > qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
> > qemu-system-x86_64: Failed to load PCIDevice:config
> > qemu-system-x86_64: Failed to load e1000e:parent_obj
> > qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
> > qemu-system-x86_64: load of migration failed: Invalid argument
> > 
> > The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
> > with this cmdline:
> > 
> > ./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]
> > 
> > In order to fix this, property x-pcie-err-unc-mask was introduced to
> > control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
> > default, but is disabled if machine type <= 7.2.
> > 
> > Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> 
> Since this one blocks mostly all backward migration for current master and
> all the downstream trees, shall we consider pick it up sooner?
> 
> And I think we should make sure qemu-stable gets this too, I'm not pretty
> sure how we normally do that and whether we need explicit CC: to stable
> list, perhaps not..
> 
> Thanks!
> 
> -- 
> Peter Xu


Yes will be in the pull I'm working on, targeting end of week.

-- 
MST


