Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6E3D64EB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 18:59:18 +0200 (CEST)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m83wj-0008Pa-Kd
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 12:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m83vQ-0006nx-01
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m83vM-0004dc-47
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 12:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627318669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjzhVBKioTBx9R5E5S4wo3Un9rykPc/5fuCSHeRA/g8=;
 b=SdZMmr3kxufwL9juhs1OGGCl5p5mYspUF/1OgvoXfwa0g2BSeZBDB99qJ7XvqqNuvNkhLW
 Be1W325rJEYYBX15NHHMy52XfInJTnVm8zObpMgQL/bJvNZDlIamkmmmFnJ3rjFpr9rJec
 8nJWfW2LHFN9z76xSSfiHkKLYvuPrI4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-km3hwJ5nM-KyuSUKSbY1cA-1; Mon, 26 Jul 2021 12:57:45 -0400
X-MC-Unique: km3hwJ5nM-KyuSUKSbY1cA-1
Received: by mail-qt1-f199.google.com with SMTP id
 e19-20020ac84b530000b0290251f0b91196so4750866qts.14
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 09:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RjzhVBKioTBx9R5E5S4wo3Un9rykPc/5fuCSHeRA/g8=;
 b=JWsFenImMsNZklo5T6Sdpc8ZqUL2pmFVHdl1uy5uanjo6DI6kUFhJLqtWNNsidlu78
 Cx6QstF8j3rVsYmN5Ihp2AHLvO3KrS27Vpi4m5d+SK1cWQQR6m6Rx0R3y0nVpLJNk2GO
 z+MPJcu7JEMfM9hG2znx89bwewGb+n86vdTfjr7zcpI/D/Rvu+OlRWbAcKnPD3DQRA3j
 oWhm07F9Rj03/Cx5Uz5Ndpvfkjba7H44KfowTJGhy0zwbJhfEwuSIlfVwH+epECTPj3L
 +MuVgXPXfb0ev5MzAl8K3LBRH8HrsnlvG8KNvw1uumns58T6suQsGfUeh0LJns8DQhUd
 Ym+g==
X-Gm-Message-State: AOAM531PTuh9Ma2B90tTN4UAPGM7iDGh26S+ANAmvZc8fcqo4RBV5QJY
 xdb6t8SEtrLJGj3GYYOppZOzGY24G6bypEx91jO8UMRoZy65R5C1ryLjIptwBV8KFb4Sy2uKNRk
 XCcZvPDsNdFsLyOY=
X-Received: by 2002:a37:9986:: with SMTP id
 b128mr18592942qke.485.1627318665462; 
 Mon, 26 Jul 2021 09:57:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycIQGQyBR9qPFlRGD0LNnZCQmHdy42B7ILUDxYeoNAMIlJmNHrI1O8bnMlBMLzX2jON4Pd3Q==
X-Received: by 2002:a37:9986:: with SMTP id
 b128mr18592922qke.485.1627318665243; 
 Mon, 26 Jul 2021 09:57:45 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 82sm286927qkl.97.2021.07.26.09.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 09:57:44 -0700 (PDT)
Date: Mon, 26 Jul 2021 12:57:43 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 1/4] tpm: mark correct memory region range dirty when
 clearing RAM
Message-ID: <YP7ph0a9kI9p4zhs@t490s>
References: <20210726160346.109915-1-david@redhat.com>
 <20210726160346.109915-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210726160346.109915-2-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26, 2021 at 06:03:43PM +0200, David Hildenbrand wrote:
> We might not start at the beginning of the memory region. Let's
> calculate the offset into the memory region via the difference in the
> host addresses.
> 
> Acked-by: Stefan Berger <stefanb@linux.ibm.com>
> Fixes: ffab1be70692 ("tpm: clear RAM when "memory overwrite" requested")
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/tpm/tpm_ppi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
> index 362edcc5c9..f243d9d0f6 100644
> --- a/hw/tpm/tpm_ppi.c
> +++ b/hw/tpm/tpm_ppi.c
> @@ -30,11 +30,14 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>          guest_phys_blocks_init(&guest_phys_blocks);
>          guest_phys_blocks_append(&guest_phys_blocks);
>          QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
> +            hwaddr mr_offs = (uint8_t *)memory_region_get_ram_ptr(block->mr) -
> +                             block->host_addr;

Didn't look closely previous - should it be reversed instead?

  block->host_addr - memory_region_get_ram_ptr(block->mr)

Thanks,

> +
>              trace_tpm_ppi_memset(block->host_addr,
>                                   block->target_end - block->target_start);
>              memset(block->host_addr, 0,
>                     block->target_end - block->target_start);
> -            memory_region_set_dirty(block->mr, 0,
> +            memory_region_set_dirty(block->mr, mr_offs,
>                                      block->target_end - block->target_start);
>          }
>          guest_phys_blocks_free(&guest_phys_blocks);
> -- 
> 2.31.1
> 

-- 
Peter Xu


