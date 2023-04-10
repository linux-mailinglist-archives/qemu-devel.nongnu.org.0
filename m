Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054566DC475
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 10:42:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pln4W-0004Jo-Uv; Mon, 10 Apr 2023 04:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pln4T-0004JR-Io
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 04:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pln4S-0005Yr-3B
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 04:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681116014;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=d7OQZo/Q9WzqODDOwoDOSuG7Uyq5XAD16clVNW9Ga1k=;
 b=EecrMblQE5l/YDFk71gPOIBTAouwPZSSzYzGMe+DH1JdpgKSeTO8FUrQ5uK0Fmf8boIuai
 /r4Bz8j2Rq8+EeTisFU0H8KLndEShjltfnqkDRoRMokH7tPgMp1T789uass+e724kEa27E
 XMLqPPmFf86AEyyJJhEYSdxfuXkb6Yw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-Kvt9mJfYMfqVUqsJV5qOvg-1; Mon, 10 Apr 2023 04:40:12 -0400
X-MC-Unique: Kvt9mJfYMfqVUqsJV5qOvg-1
Received: by mail-wm1-f72.google.com with SMTP id
 gw11-20020a05600c850b00b003ee8db23ef9so3606370wmb.8
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 01:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116011; x=1683708011;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7OQZo/Q9WzqODDOwoDOSuG7Uyq5XAD16clVNW9Ga1k=;
 b=ll1/ECgCtIPJBvlKZOYZq21lrtiam6WyLasyXmoBt9PKd6rv/zr8nJRg1tSJ/1Guzy
 /iGFIgdh8P5t6Guz+g/NkEfkve9hA2H404mkqP50mBHSX1OEf5RVbhWDiYwwiEoagRwB
 1nolHtt1c9SfAWN5xLvnwiQrnRZKQrv12nTxM9QeiFqYPHC0fN3GWoL2YyzCKAZDegxS
 ChjrdpVQP5y5NVPux7KqXKarS4ol2HB9wN6GG4PbWRmzrSKOfY66MRYnNwRFT+T3G6ck
 0Tos0wITotBl+VWTZdjj2kGTXyqPktgc07U5PHEdtgnG1dd56w7abP1ugzegxOFBiZxa
 Rbzw==
X-Gm-Message-State: AAQBX9dttV7DXmh9QhYADmS69CR1WLRgzxH/6w7awMGLeqSJEcb0z5HG
 ZqZBDUJh17sI9SrzC/AHjsyuNvXymqzjH/c8mFkev2j2wH5OezQd8PHEhCdciJ9DwQgqabuDog+
 QA+ZMYbI8NWHrH+w=
X-Received: by 2002:a7b:c40b:0:b0:3ed:c468:ab11 with SMTP id
 k11-20020a7bc40b000000b003edc468ab11mr6534617wmi.28.1681116011382; 
 Mon, 10 Apr 2023 01:40:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350beohq5x4rVNDbW68CBYh6bnZv7za9Uw/IqpN4kAqqw6pYv1wOZ5IVeHcKm7Za+nl86g1eu6g==
X-Received: by 2002:a7b:c40b:0:b0:3ed:c468:ab11 with SMTP id
 k11-20020a7bc40b000000b003edc468ab11mr6534605wmi.28.1681116011052; 
 Mon, 10 Apr 2023 01:40:11 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c1c0100b003f0548d00f1sm21281195wms.1.2023.04.10.01.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 01:40:10 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] postcopy-ram: do not use qatomic_mb_read
In-Reply-To: <20230406101612.241872-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Thu, 6 Apr 2023 12:16:12 +0200")
References: <20230406101612.241872-1-pbonzini@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 10 Apr 2023 10:40:09 +0200
Message-ID: <87ttxonn9y.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Paolo Bonzini <pbonzini@redhat.com> wrote:
> It does not even pair with a qatomic_mb_set(), so it is clearer to use
> load-acquire in this case; they are synonyms.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued on my tree.

I guess this is for 8.1, right?

Later, Juan.

> ---
>  migration/postcopy-ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 41c07136501a..23befd5ca8a2 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1495,7 +1495,7 @@ static PostcopyState incoming_postcopy_state;
>  
>  PostcopyState  postcopy_state_get(void)
>  {
> -    return qatomic_mb_read(&incoming_postcopy_state);
> +    return qatomic_load_acquire(&incoming_postcopy_state);
>  }
>  
>  /* Set the state and return the old state */


