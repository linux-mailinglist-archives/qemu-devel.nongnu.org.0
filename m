Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B863B7772
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHuB-0003ib-FO
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyHsl-0001aJ-C5
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:50:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyHsi-0001VN-2f
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624989043;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fqKGgpOPhI4z4BXiyNuEds0Tx+8nmF5D0ypC78dSQhU=;
 b=OTbrxjfDIlGaSU5AYh5BbRmUlZ0L9iaiTIXPZLWIHJ65foWsbOta0QLCj4QRh6h2H5Tfzo
 JLWsxbt1kvYgQWc+NHo7OkLTqsdsip46mfayAy27818FZKrdD/h3+eXdrycDMhDmGIKQha
 duvce3SNSxmMqJNg3kQfxypyOlCZ/FQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-MooX437qMqyuc0Mb6zvsNA-1; Tue, 29 Jun 2021 13:50:41 -0400
X-MC-Unique: MooX437qMqyuc0Mb6zvsNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so24111wrq.21
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=fqKGgpOPhI4z4BXiyNuEds0Tx+8nmF5D0ypC78dSQhU=;
 b=pOV5k0ut0fBJyhBXuTNeIKyx3ZVS89laYFu94rpc/WwfCSTKMF15hGy1vKIv894ULx
 b/oCpAAMXpEpez23mQMNymL9i0UjM1AprSWQvi2tbLU/BXdLNb4trqC+0gFGLGwVSmwq
 47yQ83OLTnC/5Y1SxU+8zAVFWE5elt1RCotxA59zJV/CdkZTuiR62JBpaGAqEYBIHIhW
 U1ekzGoSwUrUrDDLl2egVXIkiT2xRcG4K99bGgwpnmtl1NB2lrBon4KGAZEToT+423GK
 le+I6t2SCkdMvd/lFKKGfuhGRQUXgELBaV0aKgSZUuxXnaGhBQBzK3IrH8YW1F6r7grP
 cA/g==
X-Gm-Message-State: AOAM533+urWXeMU5S6Reyk0IuzcA+eABFzbXosRRy6zDvqnDlkCOxx13
 Rob3ka8OTr57DU+2yxcuCULGtoTOaYd0b/KrmjUd1CYMI+rnnYIldu/pA/4QENxcK0SB9Jd8Hva
 LdKq4johM+3Ls7XA=
X-Received: by 2002:a1c:63c3:: with SMTP id x186mr14176162wmb.27.1624989040014; 
 Tue, 29 Jun 2021 10:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVFgmwwfRgrbAfkKdWeq4HMUGD5c5Uy9Adn3/xaGlETLOkZUKWf6cAW3ILM3aazg/up3IOZw==
X-Received: by 2002:a1c:63c3:: with SMTP id x186mr14176149wmb.27.1624989039820; 
 Tue, 29 Jun 2021 10:50:39 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id z6sm18126654wrh.65.2021.06.29.10.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 10:50:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] migration: failover: continue to wait card unplug
 on error
In-Reply-To: <20210629155007.629086-3-lvivier@redhat.com> (Laurent Vivier's
 message of "Tue, 29 Jun 2021 17:50:07 +0200")
References: <20210629155007.629086-1-lvivier@redhat.com>
 <20210629155007.629086-3-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Tue, 29 Jun 2021 19:50:38 +0200
Message-ID: <87im1wk1ap.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Reply-To: quintela@redhat.com
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> If the user cancels the migration in the unplug-wait state,
> QEMU will try to plug back the card and this fails because the card
> is partially unplugged.
> To avoid the problem, continue to wait the card unplug, but to
> allow the migration to be canceled if the card never finishes to unplug
> use a timeout.
>
> Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1976852
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  migration/migration.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 3e92c405a2b6..3b06d43a7f42 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3679,6 +3679,17 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>                 qemu_savevm_state_guest_unplug_pending()) {
>              qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>          }
> +        if (s->state != MIGRATION_STATUS_WAIT_UNPLUG) {
> +            int timeout = 120; /* 30 seconds */
> +            /*
> +             * migration has been canceled
> +             * but as we have started an unplug we must wait the end
> +             * to be able to plug back the card
> +             */
> +            while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
> +                qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> +            }
> +        }
>  
>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
>      } else {

I agree with the idea.  But if we are getting out due to timeout == 0,
shouldn't we return some error, warning, whatever?

Later, Juan.


