Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A01492F13
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 21:14:36 +0100 (CET)
Received: from localhost ([::1]:59328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9usF-0006JI-GD
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 15:14:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9ugI-0005An-Km
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:02:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9ugG-00066p-AN
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 15:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642536131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hf1gdN8DCljet+jJAcTsQPItFVtrIj46ElGCj6+1Atw=;
 b=A2aLCEW0OLKk76PzaexPRMKdVGb1QJEmZhWQfLiNI/Tcqr9q5mGf4x2l+90VC4yXGyXVnA
 8cd7mGqWr246lP/IBSD/F4BGMv++xlwARb1L8V5HP+zn4tBSQyNp/uIu6OiQLlvG6Duszt
 9nSXq17vfDmY0iR+oqMHNM31b4VVb8A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77--GcfvAubPoemZDdAvGSNlw-1; Tue, 18 Jan 2022 15:02:10 -0500
X-MC-Unique: -GcfvAubPoemZDdAvGSNlw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p14-20020a1c544e000000b003490705086bso94673wmi.7
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 12:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hf1gdN8DCljet+jJAcTsQPItFVtrIj46ElGCj6+1Atw=;
 b=fcHe1CYvWRQ2vx8bYhpio1Hki3EgcpCQY8IxZ3VS4ytwlgdDXItOJMdSLHwSfbQKhW
 rx6oWLMlREByASdcYCHlf+6eJCylFQXohOZn41NYatdmKepgP0Kg7qmbJoKbdWg+rs8U
 /jjKmU6qyxvjnoSh5/KqquaTvUtirD4r6rL1GJcV5Ayo1GT4Y05/x8gW1mZLGUnsz7G7
 KEocyu8CMh1ZxBY6kK1Fk35l5u23Hsh4fgYvbaaPMLIGXSIRMK2DMwUQyHKqBBZw3Q8H
 cBIYp44F4LrlKaJXymyDGm7bsU0gwkLXQRYWqOKREMB60UsWFI3J9JYU/X6LVMokfft/
 JKvQ==
X-Gm-Message-State: AOAM530wMFPiYY5PHWfU7PS91XmnVuaHQmtjsWaVrZTcHK+orhNjMgGr
 Q59kL68t7sHJqhQBxrl/v5eC+1hXwUd1rqR4mc64cuOjQ2PfeZFofYfWZ5zF2p7KNCUcKiqBfQN
 U26wAheYoP/QSiOc=
X-Received: by 2002:adf:e2c4:: with SMTP id d4mr25273385wrj.247.1642536128888; 
 Tue, 18 Jan 2022 12:02:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFF4oJhgbEmqbapRmahBlN+apnYhACQiUikDmrnO6CU5ME73txFlr2SD2RK/4i0bc3gXFsaw==
X-Received: by 2002:adf:e2c4:: with SMTP id d4mr25273372wrj.247.1642536128738; 
 Tue, 18 Jan 2022 12:02:08 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o12sm11209682wrc.51.2022.01.18.12.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 12:02:08 -0800 (PST)
Date: Tue, 18 Jan 2022 20:02:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 23/23] migration: Export ram_release_page()
Message-ID: <YeccvnAuP6I9TL3G@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-24-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-24-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Erm, why?

Dave

> ---
>  migration/ram.h | 2 ++
>  migration/ram.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/ram.h b/migration/ram.h
> index c515396a9a..6dca396a6b 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -66,6 +66,8 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis);
>  
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
>  
> +void ram_release_page(const char *rbname, uint64_t offset);
> +
>  int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
>  bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
>  void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
> diff --git a/migration/ram.c b/migration/ram.c
> index bdc7cec4cd..5404431c71 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1161,7 +1161,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
>      }
>  }
>  
> -static void ram_release_page(const char *rbname, uint64_t offset)
> +void ram_release_page(const char *rbname, uint64_t offset)
>  {
>      if (!migrate_release_ram() || !migration_in_postcopy()) {
>          return;
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


