Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5893C6F11
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:59:16 +0200 (CEST)
Received: from localhost ([::1]:58836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3G8B-0006jm-VG
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3G7N-00062q-05
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:58:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3G7L-0004iu-Ik
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626173903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=juovBBqnqQ0+q6ZTZvEpy3aELyCs2RwScuX794yXldc=;
 b=JRrDPT8ECQJ0zbsMGrfz7WJPcZtcupRHV3y9B6iPaiYMhTy5g6ANHovpArPgHmLRjFaINt
 V21mi0bKeQKmIQNvgBZLC9iaRiGBCBO68wtTpUrK3bA0eONPxeL9BKfsyJY/9Vpe7oDfNZ
 mNcS985In1nfg9BFsYbuEkluyVfY1vg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Xr8WlImsODamz9YeMS87QQ-1; Tue, 13 Jul 2021 06:58:21 -0400
X-MC-Unique: Xr8WlImsODamz9YeMS87QQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r18-20020adff1120000b029013e2b4ee624so4283619wro.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=juovBBqnqQ0+q6ZTZvEpy3aELyCs2RwScuX794yXldc=;
 b=WWEOt2sMbjxe87OZtda1TqC/l5aQOccbc68J6sXvBTQEoBuGiFyCieD2mX7ZihJxym
 KPyKiHJOFYbdT9T6cBnfnYLDJFMM18FSdY8MopktqFgZR6qFlhOUQEq4RGEaCI7im1dH
 lPDYnL8G87I7oi74XiJ+myoHPwta/uFDmOl7aE0VHR0JQqalFJaxR50mfPnFp1RsLWGH
 M5fBQmUOGKEeRlczP27ws7n4S7StuPxMHpuK3LWaPnuJWSQQx5z3MRVVS9IMyEnKDWqa
 eY1bZSx42LOGFkLnqqkvIrdKx+rIZpYX92Rpg/WsjrkLIGhGPaCmEv2vKvd/JbSGoAaz
 pjxQ==
X-Gm-Message-State: AOAM532R6XobbICg7VcSSmS12/hqgmMs63f95EXh0BbjeTEaq/XWH1Z7
 5u1y8DsEYNrpXtHGJgf32/ac+8cGct3jCGOoWc6aWIDLC78MOPWTDSJw/7Z4NYfRaR9OrnHyB6O
 R4jWR3kdSBdl/TOk=
X-Received: by 2002:a1c:1d8e:: with SMTP id d136mr4420944wmd.52.1626173900729; 
 Tue, 13 Jul 2021 03:58:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaQ2fKDx+QrMmiDfTcjwhyeiBgJS4PiAAes7e/fYndj4B2nGUIyrlTG7dtCbpoti8bKaCKvg==
X-Received: by 2002:a1c:1d8e:: with SMTP id d136mr4420934wmd.52.1626173900553; 
 Tue, 13 Jul 2021 03:58:20 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id 6sm2056655wmi.3.2021.07.13.03.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 03:58:19 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:58:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] migration: failover: emit a warning when the card is not
 fully unplugged
Message-ID: <YO1xyXg7HW8GmvVi@work-vm>
References: <20210701131458.112036-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210701131458.112036-1-lvivier@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> When the migration fails or is canceled we wait the end of the unplug
> operation to be able to plug it back. But if the unplug operation
> is never finished we stop to wait and QEMU emits a warning to inform
> the user.
> 
> Based-on: 20210629155007.629086-1-lvivier@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Queued

> ---
>  migration/migration.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 3b06d43a7f42..e065c62e5189 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3689,6 +3689,10 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>              while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
>                  qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>              }
> +            if (qemu_savevm_state_guest_unplug_pending()) {
> +                warn_report("migration: partially unplugged device on "
> +                            "failure");
> +            }
>          }
>  
>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


