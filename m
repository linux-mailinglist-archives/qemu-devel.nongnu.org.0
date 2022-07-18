Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B421A5783ED
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:41:12 +0200 (CEST)
Received: from localhost ([::1]:42402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQzn-0003x7-Qa
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDQtk-0001HP-5q
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDQth-0007UT-Us
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658151293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rlBEKdUs2RFgPEUFbIf/cmwxy+Q8obE7Ju/vxncl0XI=;
 b=G9DRS6QKc8s5K2aDs78S3RT9/LNtqOhHJiCR6g0ZzahwxE1YDd6bV+KvcRj72Ul+7vpyea
 w0I4oZADS8FED+Bv7PDeYzRmBzoz14MJB8CRHqogh+b46ZnBgAsabF198kJtCrd8zKiN13
 fapyrsGEAL+T/6RoTPmB8wUDHONXLV4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-vJTaIG4MNq-CumwHxba-dA-1; Mon, 18 Jul 2022 09:34:52 -0400
X-MC-Unique: vJTaIG4MNq-CumwHxba-dA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r188-20020a1c44c5000000b003a2fdeea756so3078302wma.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rlBEKdUs2RFgPEUFbIf/cmwxy+Q8obE7Ju/vxncl0XI=;
 b=PXpGdPgcQwPwFwkYjrtws0nukZqTgybXwwW8CgtwU1yVO19YWLcRMucXo9Vja5Eyf7
 RTRsRUULfNbbQJ3NKS3E2mNXFA/YARkIGeTnGDwJwcbJdRKikUnnSErH/FbU1owTdatz
 XfvYUPXS8i1/JOtUNqOeOGXmvF1dCXAjkm9w1Pld2wEP1smy+0Gbiy2uVFnySmt7xDrk
 pKdTLJx/XFRSp9QQAhObf70I8sjAnvLbvYEaG3xRp8Av26C82Lks41ObHDJPHHdzy38y
 prP4zjuPxOqvdscVDudO4eXc2WI6CsDP03MbpA6p5D+UWjseuYClEtxA/SxNIf4gEqr8
 UkSw==
X-Gm-Message-State: AJIora8/5jccbA5molywUEudrezQrdK2mh12g0kqGZmbUFDj4fW2bjV3
 fCkZZqzvUIl9Bngmr7c8iO8U9oYb5gASJyC9I7caY2EAFSK3J/k3GOz0izziTSJDK+mYbDOpSV1
 xKqYYat3E6F4HGmk=
X-Received: by 2002:a5d:59af:0:b0:21d:7f0c:a1ed with SMTP id
 p15-20020a5d59af000000b0021d7f0ca1edmr23646615wrr.211.1658151291052; 
 Mon, 18 Jul 2022 06:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tA97r0CEXe5EbnAI9Y7qkccNf66SfHpfevKRoOfX+2yDAH80c+62uY0d5ubMCwzOtErV7wrA==
X-Received: by 2002:a5d:59af:0:b0:21d:7f0c:a1ed with SMTP id
 p15-20020a5d59af000000b0021d7f0ca1edmr23646581wrr.211.1658151290699; 
 Mon, 18 Jul 2022 06:34:50 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k13-20020a05600c1c8d00b003a2e5caab12sm15587331wms.47.2022.07.18.06.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:34:50 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:34:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 13/13] migration: Use multifd before we check for the
 zero page
Message-ID: <YtVheJA1ONa6Csp5@work-vm>
References: <20220531104318.7494-1-quintela@redhat.com>
 <20220531104318.7494-14-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531104318.7494-14-quintela@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Juan Quintela (quintela@redhat.com) wrote:
> So we use multifd to transmit zero pages.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> ---
> 
> - Check zero_page property before using new code (Dave)
> ---
>  migration/ram.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 7ceef7976b..f9959262fa 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2181,6 +2181,32 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
>      return ram_save_page(rs, pss);
>  }
>  
> +/**
> + * ram_save_target_page_multifd: save one target page
> + *
> + * Returns the number of pages written
> + *
> + * @rs: current RAM state
> + * @pss: data about the page we want to send
> + */
> +static int ram_save_target_page_multifd(RAMState *rs, PageSearchStatus *pss)
> +{
> +    RAMBlock *block = pss->block;
> +    ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
> +    int res;
> +
> +    if (!migration_in_postcopy()) {
> +        return ram_save_multifd_page(rs, block, offset);
> +    }
> +
> +    res = save_zero_page(rs, block, offset);
> +    if (res > 0) {
> +        return res;
> +    }
> +
> +    return ram_save_page(rs, pss);
> +}
> +
>  /**
>   * ram_save_host_page: save a whole host page
>   *
> @@ -2945,7 +2971,12 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>  
> -    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
> +    if (migrate_use_multifd() && migrate_use_multifd_zero_page()) {
> +        (*rsp)->ram_save_target_page = ram_save_target_page_multifd;
> +    } else {
> +        (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
> +    }
> +
>      ret =  multifd_send_sync_main(f);
>      if (ret < 0) {
>          return ret;
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


