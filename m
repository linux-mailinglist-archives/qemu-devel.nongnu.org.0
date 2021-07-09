Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3825C3C2917
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 20:38:32 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1vOR-0006yw-Ah
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 14:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1vNN-0006IQ-JR
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1vNG-0003YW-MM
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 14:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625855837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AT5k3Ev8QPVxMk23MyE/MxnpLE30yLbTUG6t11D6uK4=;
 b=Yixus9aB6jx1np/vXtTsCJbIwoDlMAxJXfBhh+qwgUPVSiTqUJbiEWKm7tknKGI4rn3M1H
 fWMxXmtwPgSEIN1C01wFVgrz7qPMCZsTWqyeRcMsWRbiImTu07BdKr+40J77dI/RIVvGbT
 vIPC1FcW+BsrcY8faoLrjubtQYKqCTo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-ycz9UTvsPm6TEYsqoJ6NZA-1; Fri, 09 Jul 2021 14:37:16 -0400
X-MC-Unique: ycz9UTvsPm6TEYsqoJ6NZA-1
Received: by mail-qt1-f199.google.com with SMTP id
 p20-20020a05622a0494b029024f09fe9ec9so6331815qtx.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 11:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AT5k3Ev8QPVxMk23MyE/MxnpLE30yLbTUG6t11D6uK4=;
 b=C1CFdSBK/qXZyTLMIw6v3cHGKU+p/GrEVVy9lrgmAL/euMJgU0AWLDc8zFA2mFrx2K
 H0D90SXKzDXpQ2peHSdF+SqhV7g/3TdFnXVBery2T+r70WiO1pJUUBZCFqrC08blDl07
 inbdumxq1LnBuiJCmVsOgqtucIFxvU9BqNHa8DeGKqohtiuXgnb/axqg2U0gCCT9RnDc
 7L3kGMEoKAK43eaGptZV8RCcJqoxr/esyaae6FdLIwKljf5n3hkNB4J/R4xtJSOew1xJ
 +N8oMajbAvSJjESzmj2mkPIgMoUfRoSKxFEffhh6je6jCI+DVO0aWa+rrEQcv4ecqObn
 F6gg==
X-Gm-Message-State: AOAM532FOHAtu3KJnML14nARLzdIqBaFGoK7at3Ei8mYaxC+Gu1bomyw
 4UjecOVYfw9PYj9u5S1nc3LDaX7qHCqTzEZlxVqR1fs+IjXw2DVntU/PqA36u03Wm6K6NBihJSW
 XTf5CgA3K5oGuJ0g=
X-Received: by 2002:a05:622a:394:: with SMTP id
 j20mr35512565qtx.270.1625855836513; 
 Fri, 09 Jul 2021 11:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzboqm1CwnTZ8eopVLG1Cu32p+ZMNuMvgRTi1GfN/oprIYHmTkcRdOsobVjeAXbWFAP73NGFA==
X-Received: by 2002:a05:622a:394:: with SMTP id
 j20mr35512549qtx.270.1625855836328; 
 Fri, 09 Jul 2021 11:37:16 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o123sm2877479qkd.6.2021.07.09.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 11:37:15 -0700 (PDT)
Date: Fri, 9 Jul 2021 14:37:14 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH 1/4] memory: introduce DIRTY_MEMORY_DIRTY_RATE dirty bits
Message-ID: <YOiXWi7osNDaIW5/@t490s>
References: <cover.1624771216.git.huangy81@chinatelecom.cn>
 <b858f91a8df4233afa5cc93d27f0b1adee30fc52.1624771216.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <b858f91a8df4233afa5cc93d27f0b1adee30fc52.1624771216.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 27, 2021 at 01:38:14PM +0800, huangy81@chinatelecom.cn wrote:
> @@ -370,9 +374,17 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
>                      qatomic_or(&blocks[DIRTY_MEMORY_VGA][idx][offset], temp);
>  
>                      if (global_dirty_tracking) {
> -                        qatomic_or(
> +                        if (global_dirty_tracking & GLOBAL_DIRTY_MIGRATION) {
> +                            qatomic_or(
>                                  &blocks[DIRTY_MEMORY_MIGRATION][idx][offset],
>                                  temp);
> +                        }
> +
> +                        if (global_dirty_tracking & GLOBAL_DIRTY_DIRTY_RATE) {
> +                            qatomic_or(
> +                                &blocks[DIRTY_MEMORY_DIRTY_RATE][idx][offset],
> +                                temp);

So what I meant in the other thread is instead of operating on this bitmap we
just record the number of total dirty pages, just like we used to do with rings.

PS. IIUC maybe this can even work for dirty rings.. because either dirty ring
or dirty logging collect dirty bits into the slot bitmap, then it's further
aggregated here from the slot bitmaps.  However merging them won't help much
because dirty ring can provide finer-granule per-vcpu dirty info, which can be
further used for per-vcpu throttling in the future.  So just raise this up.

> +                        }
>                      }

-- 
Peter Xu


