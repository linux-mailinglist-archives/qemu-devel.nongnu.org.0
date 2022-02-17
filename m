Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A24B9BA7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:03:56 +0100 (CET)
Received: from localhost ([::1]:54844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKchf-0005G9-2v
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:03:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKcaR-0002Sg-J9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:56:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKcaP-0005yU-52
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645088184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JP3k0FUCb0KTTE+z/eC+m9UUVSwfG5dF/n7uZG+AiJA=;
 b=ZJ03gn7f5Y15GkzAi5Eks8T/TZ1uPZqeOuw80jCxBLpZTNkrjHmRSnmGrurFP24HbVdcVp
 MZkj0iNyQvskFLqT3nuZVqOTuFwFB6AgXNfd8EJ8M+fyr02LWNTDFAief9SX2wcmLiIuFo
 Rnh6n7sFf+g1Nwz5O34wFzaW0BfsZNE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-1DjgtM5vObOlhmlVoWS9sA-1; Thu, 17 Feb 2022 03:56:23 -0500
X-MC-Unique: 1DjgtM5vObOlhmlVoWS9sA-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb1-20020a1709071c8100b006d03c250b6fso1080026ejc.11
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JP3k0FUCb0KTTE+z/eC+m9UUVSwfG5dF/n7uZG+AiJA=;
 b=UNbgfxL+k4tw6pPKfiUOSBuepw0EyfoBqVm55SfTVBtqaF2u1ww+jlsylXKZeC+3XP
 gWEPNEqL2xj9o4x45O1wWnWQjBY5LPo3+5+Ju9lTsGeh24ndPD7DUKFy3Vi0LB8AuTDH
 47kf6H8M352tX2SSmD0lWzSnthm5LobgyGtzZB/nc3LoqRx/X09O1s1B7MQPZkbDESiY
 8e/cTQvwXswLmUef4ArmvovNVLSnA7C+QQ1RcLYo/WwR7fthNC0tiVkIfcFez+VSdxIl
 xsuqLcTVsIZVvhhOXSu+PgeUf+5OhM6CdEPIYmQVgTyV3EDRU+TzDCOaP2HzBb64RIQY
 0+/g==
X-Gm-Message-State: AOAM530m/Jv/Vl6AHWvImsJZ8cN8zA4L/L5p5izEsfrt8hlHvGh/a9fs
 RMxR/kFFwR6Su5m+e65trb809woLE92NI8U7iEPwMuwq3AHSPj0YsAUK6oxNXr941KhuD8qFbH9
 m83W8P+IgImqgKBM=
X-Received: by 2002:a05:6402:1d8d:b0:408:4a31:9790 with SMTP id
 dk13-20020a0564021d8d00b004084a319790mr1585623edb.92.1645088182273; 
 Thu, 17 Feb 2022 00:56:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwddssocA12N+kBgyHLY7yZKyn6TjNhVGkJpReSXcDH0MhQbcarX74rJSJOTtZsuwnJMNtDMQ==
X-Received: by 2002:a05:6402:1d8d:b0:408:4a31:9790 with SMTP id
 dk13-20020a0564021d8d00b004084a319790mr1585609edb.92.1645088182089; 
 Thu, 17 Feb 2022 00:56:22 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id y21sm914591ejq.185.2022.02.17.00.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 00:56:21 -0800 (PST)
Date: Thu, 17 Feb 2022 09:56:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 3/3] hw/smbios: add assertion to ensure handles of
 tables 19 and 32 do not collide
Message-ID: <20220217095620.259e4c10@redhat.com>
In-Reply-To: <20220214141237.47946-4-ani@anisinha.ca>
References: <20220214141237.47946-1-ani@anisinha.ca>
 <20220214141237.47946-4-ani@anisinha.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 19:42:36 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Since change b3cddba9c14b034 ("hw/smbios: fix table memory corruption with large memory vms")
> we reserve additional space between handle numbers of tables 17 and 19 for
> large VMs. This may cause table 19 to collide with table 32 in their handle
> numbers for those large VMs. This change adds an assertion to ensure numbers
> do not collide. If they do, qemu crashes with useful debug information for
> taking additional steps.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/smbios/smbios.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> changelog:
> v3: reworded the commit log and comment in code.
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 44c53797a4..1f8d5c252f 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1048,6 +1048,12 @@ void smbios_get_tables(MachineState *ms,
>                                         mem_array[i].length);
>          }
>  
> +        /*
> +         * make sure 16 bit handle numbers in the headers of tables 19
> +         * and 32 do not overlap.
> +         */
> +        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
> +
>          smbios_build_type_32_table();
>          smbios_build_type_38_table();
>          smbios_build_type_41_table(errp);


