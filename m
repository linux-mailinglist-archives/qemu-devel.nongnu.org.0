Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E24E25C4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:56:01 +0100 (CET)
Received: from localhost ([::1]:45468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWGdk-0000AF-BW
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:56:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nWGYm-0001Uv-8F
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nWGYk-0003Zh-3Y
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:50:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647863448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ftntAS5Cs6mLr7AoW9IRdBRPNsBRMmgxTHQFCkKBTzA=;
 b=NgO5hg2w2V+XVR1vO2e6pkxe8ZMAfMtkhdFcAKopvfqYTAmQh14jHKVxYlwmewTai2iEUj
 3nlsbOmiNBRktvqzVg39xYgBhjKJbZLN/tu6gLA4QaEb6Mw+CzWQH2DVqxGZhaVjvtPRHI
 uXpEkK5NZlbnOofuROe4CyG13ZXgZcQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-pMzSIEy3N8GPb6GWxlWaiA-1; Mon, 21 Mar 2022 07:50:47 -0400
X-MC-Unique: pMzSIEy3N8GPb6GWxlWaiA-1
Received: by mail-wr1-f72.google.com with SMTP id
 41-20020adf802c000000b00203f27bebddso1511510wrk.21
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ftntAS5Cs6mLr7AoW9IRdBRPNsBRMmgxTHQFCkKBTzA=;
 b=zNDnRlGOs1WwZ2f74hCz/TUToIMfFsYwtIeijRSDH1RTUaM2UIaaT+0S8cT8N2QoAq
 0tBND7nUJ+v5R0rVYDaWxlNOw92jBA4z6TsZi7JtLkWP41PgOCma9hC87AbzoT9VbQWC
 iZDJo5JWM0IDxTLgzGxiEC6pcjLtpj7FxeyMi92/uArg0tJ/q3enhPViM+LZqhKYxQd8
 I80kNSHCLPE8WrCDHSwE5HJijll1mW/YNLHEFB8YvPt4ZnkKF0v13yruKr0HwTvCIKPY
 M8cpZnyXxWeIXz5RYkGIDWPrIRpHZj05AwK/V0oka23y+5FiFj7UP/8867Un0euDzrTi
 QFPA==
X-Gm-Message-State: AOAM530vITQXsdCA/S+Qc3bxbwzOMQB/72dxOSBJvy0tmBHbHGuEs2p7
 mqzd4RUieQUc432VTnPOZ8PD9Yas8Jvw+Qigg8viS+A7uK1UA6ernxg1EiczO6gTCapxmT7winI
 xKuiIGOBHktZjuEM=
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id
 b9-20020adfd1c9000000b00203c4f8dd17mr17663822wrd.633.1647863446307; 
 Mon, 21 Mar 2022 04:50:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysKI20evaEmOf251Bv/7a1Ay1+GkSpqZb+i42fv+aUaIbTYuj2SMuryC36OZiHybFCRBMRUQ==
X-Received: by 2002:adf:d1c9:0:b0:203:c4f8:dd17 with SMTP id
 b9-20020adfd1c9000000b00203c4f8dd17mr17663802wrd.633.1647863446030; 
 Mon, 21 Mar 2022 04:50:46 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 a11-20020a056000188b00b00204109f7826sm3560619wri.28.2022.03.21.04.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 04:50:45 -0700 (PDT)
Date: Mon, 21 Mar 2022 11:50:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v5 1/8] migration: Export ram_transferred_ram()
Message-ID: <Yjhmk+MB4r4OOPxj@work-vm>
References: <20220310153454.3929-1-quintela@redhat.com>
 <20220310153454.3929-2-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220310153454.3929-2-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.h | 2 ++
>  migration/ram.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.h b/migration/ram.h
> index 2c6dc3675d..2e27c49f90 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -64,6 +64,8 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis);
>  
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>  
> +void ram_transferred_add(uint64_t bytes);
> +
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
>  void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
> diff --git a/migration/ram.c b/migration/ram.c
> index 170e522a1f..947ed44c89 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -394,7 +394,7 @@ uint64_t ram_bytes_remaining(void)
>  
>  MigrationStats ram_counters;
>  
> -static void ram_transferred_add(uint64_t bytes)
> +void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
>          ram_counters.precopy_bytes += bytes;
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


