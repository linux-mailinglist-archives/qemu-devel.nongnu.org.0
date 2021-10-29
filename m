Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179843FDB1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 15:58:05 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgSOS-00052t-D1
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 09:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgSMq-0003H2-RU
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mgSMn-00014j-VS
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 09:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635515781;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=70DjTbmD2CY+YArKFEX5rKoNxQLKWEDbPJaBDg+fp+I=;
 b=CMELpxrrtWnMgpDEFPqvYJ5W9PIz9t5NRhM9FdNUAxbyb4MZ6UelOUL4wSc8ZXskESxh7A
 Ah5RrCRDstN5eLyKiFfJ8lfQnyk1jTApqck1aHC1E4pDDZNhPRSqNzQOf8IpGPXBgCsE+W
 F65IvfmcgjtBFwaobZlhVW+mSNnsrxM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-84v-uGH_PL2qNpoA3qeR8Q-1; Fri, 29 Oct 2021 09:56:19 -0400
X-MC-Unique: 84v-uGH_PL2qNpoA3qeR8Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso3746939wmq.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 06:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=70DjTbmD2CY+YArKFEX5rKoNxQLKWEDbPJaBDg+fp+I=;
 b=H0KO4CHjNbW1NnzM6vOR/Vcf0xBHBbWUYhr6fiTGSts1zRsmxdsYc8+IOC2cbCCsvE
 HbWpJdQVLmpMoZQnOlpfuQIN4VLPv8AImaJiS/z20x6K/FPB9a5DcSXMcNuk2ByAH+oG
 vMEaD9w76naMMx1CrVGlTykKfGlgS5Nmi8Pvt6vs5nGxdgx3vQdNQDPO1ABwP6i7+kNV
 pA3B9O9bGmQDtcYl0upsRXmG2Q8DAlmcp7BcEUgSQvgj7kQWiOyZI7pnRPhduBn+bX1D
 AH/elQZ8tGFQ2nRdgSoerZEnM2T7pVLpCiXtO45opPfYEvkc8OFUWYuc8XoLDfqZ1RBc
 vJ4A==
X-Gm-Message-State: AOAM531JqI/M5JHdn9RinnXDiJMC25uX48HZRYYUN48kXYJj2ef+EYkW
 LWp1i7CED9x6K4KTfHjs3Tr5wAiibrlgKq32J2Joa9E7rFqy6iyHMkuqRU2jqVFHb0L08ipVQH1
 hqUJG0oG1or0oFJ8=
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr14553896wrc.184.1635515778716; 
 Fri, 29 Oct 2021 06:56:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyAD8le2G8o0jR4iDh6sWfCmkRlbmo2iVDdGXKupJYIwkQQBCyT6VcRC/FBrPrOLghch/1iw==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr14553859wrc.184.1635515778502; 
 Fri, 29 Oct 2021 06:56:18 -0700 (PDT)
Received: from localhost ([31.4.238.119])
 by smtp.gmail.com with ESMTPSA id v6sm7217708wrx.17.2021.10.29.06.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 06:56:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] failover: allow to pause the VM during the migration
In-Reply-To: <20210930170926.1298118-1-lvivier@redhat.com> (Laurent Vivier's
 message of "Thu, 30 Sep 2021 19:09:26 +0200")
References: <20210930170926.1298118-1-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 29 Oct 2021 15:56:17 +0200
Message-ID: <87ilxgrl32.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> If we want to save a snapshot of a VM to a file, we used to follow the
> following steps:
>
> 1- stop the VM:
>    (qemu) stop
>
> 2- migrate the VM to a file:
>    (qemu) migrate "exec:cat > snapshot"
>
> 3- resume the VM:
>    (qemu) cont
>
> After that we can restore the snapshot with:
>   qemu-system-x86_64 ... -incoming "exec:cat snapshot"
>   (qemu) cont
>
> But when failover is configured, it doesn't work anymore.
>
> As the failover needs to ask the guest OS to unplug the card
> the machine cannot be paused.
>
> This patch introduces a new migration parameter, "pause-vm", that
> asks the migration to pause the VM during the migration startup
> phase after the the card is unplugged.
>
> Once the migration is done, we only need to resume the VM with
> "cont" and the card is plugged back:
>
> 1- set the parameter:
>    (qemu) migrate_set_parameter pause-vm on
>
> 2- migrate the VM to a file:
>    (qemu) migrate "exec:cat > snapshot"
>
>    The primary failover card (VFIO) is unplugged and the VM is paused.
>
> 3- resume the VM:
>    (qemu) cont
>
>    The VM restarts and the primary failover card is plugged back
>
> The VM state sent in the migration stream is "paused", it means
> when the snapshot is loaded or if the stream is sent to a destination
> QEMU, the VM needs to be resumed manually.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

I agree with Dave that you should use a capability instead of a
parameter.

Other than that, the code for the new parameter looks ok.
> @@ -3734,13 +3752,27 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>                              "failure");
>              }
>          }
> -
>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
>      } else {
>          migrate_set_state(&s->state, old_state, new_state);
>      }
>  }


This change is spurious.

And to make this more generic, I think you can consider changing the
name to pause_during_migration.

Because that is basically what managedsave needs (If I understood Laine
correctly).

Later, Juan.


