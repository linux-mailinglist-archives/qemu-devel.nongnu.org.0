Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B369447ECD2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:47:09 +0100 (CET)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0fIC-0005zI-AA
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ews-0001OG-S3
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ewr-0004KP-DU
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640330704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ALGLhs4D+zSLf8PSqAGQ0h6G4DyhB8+iP9NmT1eg4I=;
 b=MstiP1D6I1kESer1KtWFFIl8YqrnaDeqrSgIGJhXQrfe3cKZCf/595IPPvcUryl1hb3FBn
 bllI88hvahGs363Xwq/8dnUXuieS1g/rTmURlCfq2aK0XKLSagfPqhJi+fRdOPo0UUn8Pd
 z74sBIQwzU/P2YTdOKOp9LbksXZZ7IM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-amuxwXUIN42zbxBWv6h5PA-1; Fri, 24 Dec 2021 02:25:03 -0500
X-MC-Unique: amuxwXUIN42zbxBWv6h5PA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso1488090wra.18
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 23:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8ALGLhs4D+zSLf8PSqAGQ0h6G4DyhB8+iP9NmT1eg4I=;
 b=b2t3SFlB2NP0vcyo9LBWaY+13WVOMBJNpt1D5QSYOVKeLDkI6cVKmj5L/Lyoe7vu/K
 G5WskovbvzrnSLOAzL5KgsvNR/ZFOKWWX4nRGYQf4huQ1B3tpecvz9nDLsL3bzE33eIT
 kAnVLERuumpiVWEcI3+QI6oBcudNsJx23ItlWFd6QiL5RYa5S2CnXgL+KJjbjSmkizz4
 NhDv+bJYCWEeadSYdo5kVP5jZkr+yy2WiTAq77ung2Nr0vi6SIr0mpzm1Y+dGCBWmWgz
 bGft+0S1qhfsxkZ6e0OqD0vHDXfvKNntkm/cZIIT6a6NcRo7QJmNohlolEeLOgT2TA62
 PgWA==
X-Gm-Message-State: AOAM532kzaTDAhJdACxxTq2VT/5DOpNnWjC0eppDLJWbk2hFTaiDi2i1
 Eey4T0PczBTO7oxo/429x3QxUcyIR1kMGCXG4WHdX+gH8Z7so7/fSirwJafi8ESE4gkfaKPSLGC
 Yz3UHFbezLaGS1Js=
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr3688437wri.376.1640330702347; 
 Thu, 23 Dec 2021 23:25:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweuE+LEdximMmYshJy/JKg4NX5JQjYXZizOxRO2hhqWgAqL0TTkdIbeYrEfCC/h3uPfCg0dw==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr3688425wri.376.1640330702124; 
 Thu, 23 Dec 2021 23:25:02 -0800 (PST)
Received: from xz-m1.local ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id m10sm7093709wms.25.2021.12.23.23.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 23:25:01 -0800 (PST)
Date: Fri, 24 Dec 2021 15:24:55 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 3/6] migration: ram_release_pages() always receive 1
 page as argument
Message-ID: <YcV1x02ls6ESEuLz@xz-m1.local>
References: <20211221125235.67414-1-quintela@redhat.com>
 <20211221125235.67414-4-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211221125235.67414-4-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 01:52:32PM +0100, Juan Quintela wrote:
> -static void ram_release_pages(const char *rbname, uint64_t offset, int pages)
> +static void ram_release_page(const char *rbname, uint64_t offset)
>  {
>      if (!migrate_release_ram() || !migration_in_postcopy()) {
>          return;
>      }
>  
> -    ram_discard_range(rbname, offset, ((ram_addr_t)pages) << TARGET_PAGE_BITS);
> +    ram_discard_range(rbname, offset, 1ULL << TARGET_PAGE_BITS);

This is TARGET_PAGE_SIZE, afaict.. anyway,

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


