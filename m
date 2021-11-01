Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C7441B31
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 13:32:08 +0100 (CET)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhWTv-00015u-5l
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 08:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWQr-0007uI-Gj
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWQp-00023z-TZ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635769735;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8qR17k6LdWln5Z9j7yn0SBvStVl/boUoidIF5mVebaM=;
 b=COq/PCfMA2eRQoUVMEVeGIOATFPa5SxgsB5Sww7wQunxrLTDbrEY2GaPcmu8X5IC2leQdK
 6VSGFvhQv1VIHy4rpfvetvLVew+OQPQnjYFVzIPFj4p/PxHADpwePg50VANoXfTP0X44XF
 xt6rQzOsz6by13KxbDCmkjzSGe51MWE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-SlhLUw-EPKKMDXQ20_Zzvg-1; Mon, 01 Nov 2021 08:28:54 -0400
X-MC-Unique: SlhLUw-EPKKMDXQ20_Zzvg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v5-20020a1cac05000000b0032ccf04ba2cso4603308wme.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 05:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8qR17k6LdWln5Z9j7yn0SBvStVl/boUoidIF5mVebaM=;
 b=t//hRAZoa+DVZNRoUobOoH2Cc0amlkJm39rxUaUAgseTDF1eN0Vhht9Ec/Q+vis69c
 iLUGeorlYc9j2zIcMSnS7tzv+No3O5S91z3jwQSCDJt/2MLG4Imxk17cEbbD/Yb1oeHP
 4/EOdSF0nMMKM/s7e6slUWp3d7bGJcbJypiMGBVcP5+6oPDSUY21Vw1MUHJMLAVcwyZm
 jPShApGO9NRqUg45fsiCfojOHJ9CmghVDvr4kv1aJcGILx8C7uCY1xtRVnOgY3k/8t+A
 bVf83uPIghwD61Ggp8KYn7+wU+kqanUap0EIA02apwl1wWP1sqpySclKxeUY/b9phzu2
 aU/A==
X-Gm-Message-State: AOAM5330e3tltnkbmQTOMzVVy5iKx77uegElc5n+4iMp5aRNH0TeS8Ap
 lJF4BPBFgKJOoHf2YN5UktQgBOGvHuZAgpzNY+P66IhD/5O8KS+wB5/GMuBx62jChRv8kRVrAMm
 6z+0j8xdiVnIGPVI=
X-Received: by 2002:a05:600c:2156:: with SMTP id
 v22mr17302556wml.159.1635769732963; 
 Mon, 01 Nov 2021 05:28:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2Uh5h5AqUGDecg5hFyl102gKCAsaqK0s7SEWvgq0it+m9uYvrxUMDPxQXE4ZRRA0607XgzA==
X-Received: by 2002:a05:600c:2156:: with SMTP id
 v22mr17302535wml.159.1635769732783; 
 Mon, 01 Nov 2021 05:28:52 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id f20sm15057784wmq.38.2021.11.01.05.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 05:28:52 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 3/3] dump-guest-memory: Block live migration
In-Reply-To: <20210922162009.125622-4-peterx@redhat.com> (Peter Xu's message
 of "Wed, 22 Sep 2021 12:20:09 -0400")
References: <20210922162009.125622-1-peterx@redhat.com>
 <20210922162009.125622-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 13:28:51 +0100
Message-ID: <877ddsqcu4.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Both dump-guest-memory and live migration caches vm state at the beginning.
> Either of them entering the other one will cause race on the vm state, and even
> more severe on that (please refer to the crash report in the bug link).
>
> Let's block live migration in dump-guest-memory, and that'll also block
> dump-guest-memory if it detected that we're during a live migration.
>
> Side note: migrate_del_blocker() can be called even if the blocker is not
> inserted yet, so it's safe to unconditionally delete that blocker in
> dump_cleanup (g_slist_remove allows no-entry-found case).
>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1996609
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


