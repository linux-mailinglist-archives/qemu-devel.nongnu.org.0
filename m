Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ACF4ECCAC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:49:22 +0200 (CEST)
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdNh-0005UJ-KC
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:49:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZdLn-0002db-HQ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:47:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZdLl-0001kJ-0k
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648666039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zeiu0hu3M0Bh14xs10PWRY8ErZlqfWK1/HZBNitM7ko=;
 b=icgcdawl+N6Czg22HQeqXobcgrjrAjIfb+54YzRGMVfDNwLdEx5sRgG5MKoB3byayopAuq
 8KELDC4G+YHnxaWmJMYQnAerVUGgma++8FzP3cgCPMoi0oPhm7s0moCer95IUmtFz0rqUI
 eXHf6GLjbvrv4CHRCPi+SvGE0Se1MFc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-VXzTLQ-HOEafwEVSwb5Fyw-1; Wed, 30 Mar 2022 14:47:18 -0400
X-MC-Unique: VXzTLQ-HOEafwEVSwb5Fyw-1
Received: by mail-qk1-f199.google.com with SMTP id
 h68-20020a376c47000000b0067e05dade89so13175803qkc.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zeiu0hu3M0Bh14xs10PWRY8ErZlqfWK1/HZBNitM7ko=;
 b=pHrHlSBVpXjAoR5E7pRAZyVsT7JGtLAJvK9s264vbOE/owGtN4oszsXkwOBEDfCygs
 E12rmENr/RNv9pugjaxErkUL1OATZrJNY6nHICBT/J7CYY75dT0YCGViASh9xssZBIMO
 3xcdUwKlONpgkz0DaP91uWe93LAE7ezhcxiTcNF1+V+D1Yldgl8QOnOuwyiwuBAOWdgA
 S9sELgPPedgU/LR63+c7gHJ3YvcCqiq6uZrP4AUhUu2Pa3VtWbjOVauLLAt8Y1w62xsH
 qf549Vwh0UCLS73l4suEPZHW0ogmkQWLs7wGbv9dMGN962UgS1s0Vu3lyg9JmElZ9wg9
 MGNw==
X-Gm-Message-State: AOAM5307U9JhlreMsfKFsIACHYr0YizBZH+ZCH9P5/ZpZ8PGwfDjmEIL
 X971nENwWAJvEk4p2AGjldrY4/hE/M/zpM0GtP28k2huMlYd7562q6MPvyEBCRNRmAYdTzLmyIV
 w2TCbDChJHgypASg=
X-Received: by 2002:a05:622a:1444:b0:2e1:cd41:1a53 with SMTP id
 v4-20020a05622a144400b002e1cd411a53mr885845qtx.101.1648666037745; 
 Wed, 30 Mar 2022 11:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+CBmnhnrDrF1I3FcwlR73EB2wWybFw2xGBM/tHDdmC02DdmRJ2ME/N1nyqpEc+sHu/IVPRA==
X-Received: by 2002:a05:622a:1444:b0:2e1:cd41:1a53 with SMTP id
 v4-20020a05622a144400b002e1cd411a53mr885825qtx.101.1648666037462; 
 Wed, 30 Mar 2022 11:47:17 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a059400b002e1d59e68f3sm18438361qtb.48.2022.03.30.11.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 11:47:17 -0700 (PDT)
Date: Wed, 30 Mar 2022 14:47:16 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Subject: Re: [PATCH 1/2] softmmu/physmem: move last_ram_page() call under
 qemu_mutex_lock_ramlist()
Message-ID: <YkSltGmYJTtu3U4j@xz-m1.local>
References: <20220325154013.16809-1-arbn@yandex-team.com>
MIME-Version: 1.0
In-Reply-To: <20220325154013.16809-1-arbn@yandex-team.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 06:40:12PM +0300, Andrey Ryabinin wrote:
> The 'ram_list.blocks' modifications protected by 'ram_list.mutex'.
> last_ram_page() uses state of 'ram_list.blocks' to identify ram's size.
> ram_block_add() calls last_ram_page() before the mutex lock
> making the following race possible:
> 
>      CPU#0                                       CPU#1
>                                       ram_block_add()
>                                          old_ram_size = last_ram_page()
>                                          qemu_mutex_lock_ramlist()
>                                          ...
>                                          dirty_memory_extend(old_ram_size, new_ram_size);
> ram_block_add()
>    old_ram_size = last_ram_page()
> 
> 					      //insert block to ram_list
> 					      QLIST_INSERT_*_RCU()
> 					      qemu_mutex_unlock_ramlist()
>    qemu_mutex_lock_ramlist()
>    ....
>    dirty_memory_extend(old_ram_size, new_ram_size);
> 
> Such race may result in leaking some dirty memory bitmaps.
> 
> Because of stale 'old_ram_size' value, the dirty_memory_extend() on CPU#0
> will allocate and reinitialize some of the already allocated on CPU#1
> dirty memory bitmap blocks.
> 
> Fix this by moving last_ram_page() call under the qemu_mutex_lock_ramlist()
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


