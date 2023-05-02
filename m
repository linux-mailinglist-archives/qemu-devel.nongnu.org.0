Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BA06F4D23
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 00:51:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptyoi-0006fH-SY; Tue, 02 May 2023 18:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptyoU-0006ex-2Z
 for qemu-devel@nongnu.org; Tue, 02 May 2023 18:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ptyoS-0005IF-9j
 for qemu-devel@nongnu.org; Tue, 02 May 2023 18:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683067774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O309kQs7TgMZ+myas8H6F+51aBgxrmpTeWVmYnDgEZY=;
 b=A6MmycqGzaPTvH/1PXRxilZ710y5lCGZGPYwFHGGMXN59tB7eOpcdR9T9J6S/blScHZpCM
 /TnjpTw38RONwMzTabhT4kgYw8tHZctn+oVlxR3pFQG/HF5atYa7A+DTJRmdEUPdxZbRCD
 HPxhhhmrUUkZS9RswcFNA5yi8XWzniY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-Z9S4ltsqPMe7bS8T63DRyg-1; Tue, 02 May 2023 18:49:33 -0400
X-MC-Unique: Z9S4ltsqPMe7bS8T63DRyg-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ed767b30easo7414441cf.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 15:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683067773; x=1685659773;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O309kQs7TgMZ+myas8H6F+51aBgxrmpTeWVmYnDgEZY=;
 b=QzChyzPjixhu8MR0QxQiP/pVnZ26c9pT1G9LNMqtYNpPX6Z62GHq7njrredlVoEYXN
 Aljytwo7sfOrNd7hpL8+nWF2BLlyzwPx41InZLuqxJu0s2n4rt2D1GpRUlpdy4Oq7tUj
 zBG8vDn+E64HwHTk4lYRdpC20Q+9m+/3z+xZoDdOfAIBFy1/PreU+cuLnsodIHnXiLFf
 2lfOkUm1H01O2fy7I5lxHpld9CO8/I+T0JT/UbpzDmapyoVAbNBa3mgVvvQIXiYdH7Jn
 RNYMSesa++slVVW3/TKsMXuxcMAsjDVsKlOo9WnNzbV+88IjJ2H2SmZnVptCTZU6wTIV
 eQSQ==
X-Gm-Message-State: AC+VfDz2hZVYOuT7XKoD/TUAmbqcoHUMu1oJ/yeb8ph9WlpiLV2RHQwZ
 p4PIzvGpTirKz0FJbS6ZCY897sRRHPX3Ll6rfXBghHYOAu/JpySGK8iod0+NBseVgjTsKBmFyj+
 ZZLTwpz+I7a4iDeA=
X-Received: by 2002:ac8:7f0d:0:b0:3ef:3281:fb5c with SMTP id
 f13-20020ac87f0d000000b003ef3281fb5cmr6440433qtk.2.1683067772777; 
 Tue, 02 May 2023 15:49:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TQZduwqqNl9YqA4BnoB9V4kLU37BsCgh+DpX6mBibrzB6DMajgaedg7RPxo2oD1Ga7YmR0w==
X-Received: by 2002:ac8:7f0d:0:b0:3ef:3281:fb5c with SMTP id
 f13-20020ac87f0d000000b003ef3281fb5cmr6440402qtk.2.1683067772496; 
 Tue, 02 May 2023 15:49:32 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 201-20020a3706d2000000b0074e26158cf2sm7730942qkg.93.2023.05.02.15.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 15:49:31 -0700 (PDT)
Date: Tue, 2 May 2023 18:49:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
Message-ID: <ZFGTerErJWnWHD6/@x1n>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 01, 2023 at 05:01:33PM +0300, Avihai Horon wrote:
> Hello everyone,

Hi, Avihai,

> === Flow of operation ===
> 
> To use precopy initial data, the capability must be enabled in the
> source.
> 
> As this capability must be supported also in the destination, a
> handshake is performed during migration setup. The purpose of the
> handshake is to notify the destination that precopy initial data is used
> and to check if it's supported.
> 
> The handshake is done in two levels. First, a general handshake is done
> with the destination migration code to notify that precopy initial data
> is used. Then, for each migration user in the source that supports
> precopy initial data, a handshake is done with its counterpart in the
> destination:
> If both support it, precopy initial data will be used for them.
> If source doesn't support it, precopy initial data will not be used for
> them.
> If source supports it and destination doesn't, migration will be failed.
> 
> Assuming the handshake succeeded, migration starts to send precopy data
> and as part of it also the initial precopy data. Initial precopy data is
> just like any other precopy data and as such, migration code is not
> aware of it. Therefore, it's the responsibility of the migration users
> (such as VFIO devices) to notify their counterparts in the destination
> that their initial precopy data has been sent (for example, VFIO
> migration does it when its initial bytes reach zero).
> 
> In the destination, migration code will query each migration user that
> supports precopy initial data and check if its initial data has been
> loaded. If initial data has been loaded by all of them, an ACK will be
> sent to the source which will now be able to complete migration when
> appropriate.

I can understand why this is useful, what I'm not 100% sure is whether the
complexity is needed.  The idea seems to be that src never switchover
unless it receives a READY notification from dst.

I'm imaging below simplified and more general workflow, not sure whether it
could work for you:

  - Introduce a new cap "switchover-ready", it means whether there'll be a
    ready event sent from dst -> src for "being ready for switchover"

  - When cap set, a new msg MIG_RP_MSG_SWITCHOVER_READY is defined and
    handled on src showing that dest is ready for switchover. It'll be sent
    only if dest is ready for the switchover

  - Introduce a field SaveVMHandlers.explicit_switchover_needed.  For each
    special device like vfio that would like to participate in the decision
    making, device can set its explicit_switchover_needed=1.  This field is
    ignored if the new cap is not set.

  - Dst qemu: when new cap set, remember how many special devices are there
    requesting explicit switchover (count of SaveVMHandlers that has the
    bit set during load setup) as switch_over_pending=N.

  - Dst qemu: Once a device thinks its fine to switchover (probably in the
    load_state() callback), it calls migration_notify_switchover_ready().
    That decreases switch_over_pending and when it hits zero, one msg
    MIG_RP_MSG_SWITCHOVER_READY will be sent to src.

Only until READY msg received on src could src switchover the precopy to
dst.

Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
more msg (dst->src).

This is based on the fact that right now we always set caps on both qemus
so I suppose it already means either both have or don't have the feature
(even if one has, not setting the cap means disabled on both).

Would it work for this case and cleaner?

Thanks,

-- 
Peter Xu


