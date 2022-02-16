Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDF64B848B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:37:37 +0100 (CET)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGki-00016T-RW
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:37:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKGcI-00048x-Qz
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:28:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKGcF-0001I7-Re
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645003730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DAgnXjhppYszNLnGuE2twe2wlpPEZuN/XnCcs4EnxkI=;
 b=Bwwu00zruZ0VNcPDHv8wS6SlmLl5ir/UFOvsSod1n0JCtyV8AmCAMJaFfjJdtPRhyRZ/7n
 a2cVcR70AaNYJzwIBPAH/GISh5Ja13rbV37rxUrYV/XjxTy01PebVhdXEXfeohZD3ZUWUj
 M9jTCL53spM2EJ3rVvLAid40QMzOVxc=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-1X_81zaXP_qsxo63YaPJMQ-1; Wed, 16 Feb 2022 04:28:49 -0500
X-MC-Unique: 1X_81zaXP_qsxo63YaPJMQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 p21-20020a631e55000000b00372d919267cso968993pgm.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DAgnXjhppYszNLnGuE2twe2wlpPEZuN/XnCcs4EnxkI=;
 b=NMZuzdKfQjnoxVf2OxGvOOijqCJoyZwBsmnmB1KvRIhyidKr6VdPQliExd8pfMbtr4
 1D8cInipNqDxgrGj9+ZXuvWMFux/agigUYty2qk+d5And3N5WZoxyFCgjCnTAwVW9hY+
 n40xxMRdWGXYiUr6aRSOvbREHjWwuI97dJG/Am5BFPZnDyx6q7L0OOhJMww2H/uYggbY
 W85he1atF+3aCY1O1OvcQ1DjIyM766u7wqY6NBM6QpHkrkPKsTzinj6HvN14JoMqDUQw
 PyQJs9cyxoXxatH+OIaM/gNY6gG+fHD8MTyp5EZzZ2oegjONLTgICAMLAbFSs1WeAOvx
 sEVw==
X-Gm-Message-State: AOAM533os4gO5EJlGOgPOPAQ3OsX1wzT06TtWOuJoEDXQDx2Q917zo6R
 tckyOD+7bnPrtfzG0a/IiL62Q3BH0LE8qIhroTOjyu//+9BTyoF9M+CuIpG+PyAEkcHDsN6pw4C
 gju7qCUTANLxfMkZ1xK2Rm7tfDK6seOH0Bf5i7nWWOyMvpbFduOVLDPPbKZw8BvZz
X-Received: by 2002:a05:6a00:84f:b0:4e1:9243:b638 with SMTP id
 q15-20020a056a00084f00b004e19243b638mr1979791pfk.1.1645003727963; 
 Wed, 16 Feb 2022 01:28:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPdyL+CeFpXpccXCd6u4nOZJ1XXyOOfQMArXQj4mA4GYkRAs8fFZYwzeCAgxnfEz2pfYhvEQ==
X-Received: by 2002:a05:6a00:84f:b0:4e1:9243:b638 with SMTP id
 q15-20020a056a00084f00b004e19243b638mr1979764pfk.1.1645003727582; 
 Wed, 16 Feb 2022 01:28:47 -0800 (PST)
Received: from xz-m1.local ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id q2sm9912491pfu.160.2022.02.16.01.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 01:28:47 -0800 (PST)
Date: Wed, 16 Feb 2022 17:28:34 +0800
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 00/20] migration: Postcopy Preemption
Message-ID: <YgzDwjHrpUq6tcmH@xz-m1.local>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 02:27:49PM +0800, Peter Xu wrote:
> The new patch layout:
> 
> Patch 1-3: Three leftover patches from patchset "[PATCH v3 0/8] migration:
> Postcopy cleanup on ram disgard" that I picked up here too.
> 
>   https://lore.kernel.org/qemu-devel/20211224065000.97572-1-peterx@redhat.com/
> 
>   migration: Dump sub-cmd name in loadvm_process_command tp
>   migration: Finer grained tracepoints for POSTCOPY_LISTEN
>   migration: Tracepoint change in postcopy-run bottom half
> 
> Patch 4-9: Original postcopy preempt RFC preparation patches (with slight
> modifications).
> 
>   migration: Introduce postcopy channels on dest node
>   migration: Dump ramblock and offset too when non-same-page detected
>   migration: Add postcopy_thread_create()
>   migration: Move static var in ram_block_from_stream() into global
>   migration: Add pss.postcopy_requested status
>   migration: Move migrate_allow_multifd and helpers into migration.c
> 
> Patch 10-15: Some newly added patches when working on postcopy recovery
> support.  After these patches migrate-recover command will allow re-entrance,
> which is a very nice side effect.
> 
>   migration: Enlarge postcopy recovery to capture !-EIO too
>   migration: postcopy_pause_fault_thread() never fails
>   migration: Export ram_load_postcopy()
>   migration: Move channel setup out of postcopy_try_recover()
>   migration: Add migration_incoming_transport_cleanup()
>   migration: Allow migrate-recover to run multiple times

Patches before 15 are IMHO good in various aspects with/without the new
preemption, so they can be considered for review earlier.

Especially:

    migration: Enlarge postcopy recovery to capture !-EIO too
    migration: Add migration_incoming_transport_cleanup()
    migration: Allow migrate-recover to run multiple times

Thanks,

-- 
Peter Xu


