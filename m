Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821433AD0A5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:43:18 +0200 (CEST)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHaP-0006KH-KD
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1luHZL-0004r4-Nx
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1luHZI-0005oq-NS
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624034527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5FHESCds9wlmkbyCNjcJ5FnI8kr5hE+zS2gu70wgoE=;
 b=Eonav4OiHTHPlDz546AnKu/5CykzQe2bUGptaOmWUVw70cP6Ch2smePRxUwC6F0abCBD0Q
 kHInQzz8auH+VaE8aEbHWllGsB6kKt5dTw0c5OzEMb9bhF8TOfOVSJRWBAibH43p6R2fpH
 CU/ZtglX7THAbStU4DBgttKy+d6WZag=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460--fqM5B5eNA6ET0MYRhFyUw-1; Fri, 18 Jun 2021 12:42:06 -0400
X-MC-Unique: -fqM5B5eNA6ET0MYRhFyUw-1
Received: by mail-qv1-f72.google.com with SMTP id
 k13-20020ad454ed0000b029025d9d53c67eso6206129qvx.13
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f5FHESCds9wlmkbyCNjcJ5FnI8kr5hE+zS2gu70wgoE=;
 b=kxQPo9yDhIVC2Zah/fM0OQdtaVjMorrKshwe1ABvrpFFH8NPx/zcazgfe9YtWHltyj
 JHyr5T39S/6Xhu/5KWleuhoNEh8nNqd7aHx+7aKrJDw3jdVBEGFwYs7V1T+l1IBWX7Oa
 ott5YYbLqZ2B3TCZ2a5pRwqUAHzAZT7vc8gYPx0tsVXLvbvjQl01hfyvzyCexsbm9MGJ
 FWeq885O53js3q9aFsvuXssWW3F0yyOaZ2ipXFfX+ai+0BLbYwGjhcrqC+EHdqKQ2bjS
 Xfz+J9tdYiwxhTTe6gkAYqR9S2umaRbUMnpt/cVKa9KrD5j+01YV/UjG/SBgPZaPu12T
 Ri2g==
X-Gm-Message-State: AOAM531dOGUGUXXp0NeIRTfDbGIK7vT84rqHwjH8UiepXYK9NTNRbk8j
 w8TwV/WsofqjWUHpI2cFQI7truRP84wiZRKtBUNXlfYkveZnkN675kQXNZSLs45AHDPkyJq4Q/x
 +8Whj9BC4JKfDLvE=
X-Received: by 2002:a37:6c04:: with SMTP id h4mr10712618qkc.182.1624034525787; 
 Fri, 18 Jun 2021 09:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwauO2TL1DMmj2h+SkMMxxRQG+ss1kfcAyh5b0iXpunofXs0sdTWU6C0Q7mJnM6joF9tQ8PBQ==
X-Received: by 2002:a37:6c04:: with SMTP id h4mr10712597qkc.182.1624034525602; 
 Fri, 18 Jun 2021 09:42:05 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id u3sm5743032qtg.16.2021.06.18.09.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 09:42:05 -0700 (PDT)
Date: Fri, 18 Jun 2021 12:42:03 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v8 2/6] memory: make global_dirty_tracking a bitmask
Message-ID: <YMzM23e0prMLW5B2@t490s>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
 <0065e888fde8114be8a66406389cd75f014a0dd8.1624028590.git.huangy81@chinatelecom.cn>
 <YMy/5togwdtCK3z8@t490s>
 <2693c2a4-29f0-e196-c97c-985584c19419@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <2693c2a4-29f0-e196-c97c-985584c19419@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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

On Sat, Jun 19, 2021 at 12:16:49AM +0800, Hyman wrote:
> 
> 
> 在 2021/6/18 23:46, Peter Xu 写道:
> > On Fri, Jun 18, 2021 at 11:32:03PM +0800, huangy81@chinatelecom.cn wrote:
> > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > index b114f54..dd2404f 100644
> > > --- a/include/exec/memory.h
> > > +++ b/include/exec/memory.h
> > > @@ -55,7 +55,17 @@ static inline void fuzz_dma_read_cb(size_t addr,
> > >   }
> > >   #endif
> > > -extern bool global_dirty_log;
> > > +/* Possible bits for global_dirty_log */
> > 
> > s/log/tracking/
> here, we just rename global_dirty_log to global_dirty_tracking, but the
> function name remain the same? such as:
> memory_global_dirty_log_start/memory_global_dirty_log_stop

Then you may want to write it as:

  /* Possible bits for memory_global_dirty_log_{start|stop} */

It's a trivial nitpicking, I don't have a strong opinion here..  Before any
other's comments, please feel free to choose anything.  Thanks,

-- 
Peter Xu


