Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC87A6DFE9C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 21:17:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfy0-0008QL-Rz; Wed, 12 Apr 2023 15:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmfxs-0008Q1-Oj
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:17:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmfxq-0001Gq-Ly
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 15:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681327001;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iwGFxKj5XMyk7+zl8RLUgsL1yITugKhCNhxexeMrWxs=;
 b=F9GcLmlPdtpa7n9UY0to9p+0HUpWSXGJXq9qEzOXvzcAbo4DOUsibj0koyToh5eDKMyPRN
 bsb1aqfgSwx+rf8REaoX4Cu3sBZObVsDA0QjustTiMvrMil2pQYuJ8gWtncnZ89W12+Ddu
 gjUTRLJn5f/SZ4Bmx09a54sIEQGoISU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-11lDJdfRNJWskT9-04ZpFw-1; Wed, 12 Apr 2023 15:16:39 -0400
X-MC-Unique: 11lDJdfRNJWskT9-04ZpFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 hg16-20020a05600c539000b003f09d1918aaso1521405wmb.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 12:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681326999; x=1683918999;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwGFxKj5XMyk7+zl8RLUgsL1yITugKhCNhxexeMrWxs=;
 b=KaBej5y6qAyNXpM8snmxCtv21x3+bgVGXuAg7llejDCgaj4wc/xVuQCy/xfadtot6k
 1B5hHO4J9YhLyjT128rO5MwuYf8P20v23+As/xDtBBAuRVrJcLkJ1bhRG9IrvSZpLVgt
 w2MH/ZoyAXMEZddsTGLSgazKhO+7M1D/RDsRQ7r5Sg4W6P8yc0Ad0lGdRMv7UCgugVmk
 e2Ee/olgKPx2/HQJvjgg5bXnPkUTo37UNjhP8/hXRFXqqWLThfZwObcZ2v+V/LK2fsZ2
 ktd17UUcHcFo9KrY0OTYYYGLU7CYkoZu8Hw98jK4W59hWm4xSkrYO7ceLoIW4WbMtA6Q
 0lLQ==
X-Gm-Message-State: AAQBX9fqqLthq4ICunjbZFonDcne89CjOnVn5lLYM3ZfNi2NitYx8b6Z
 rPRLw2hYt6m2rLjsbAF1SoasFQRqczSkyfC+Ce7YG9odTApsrPQp2Ws0KdglvD2ZN8u7G514gak
 PV8v9Mel+Smd+14Y=
X-Received: by 2002:a5d:65c8:0:b0:2ef:ebf3:db20 with SMTP id
 e8-20020a5d65c8000000b002efebf3db20mr5294456wrw.10.1681326998849; 
 Wed, 12 Apr 2023 12:16:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350akbnYa3QI6Gc0pzZhG5bvk029FUEFJdek58M19pchA8CuStmO3xS02IgNinUvxS/zw4kSFeQ==
X-Received: by 2002:a5d:65c8:0:b0:2ef:ebf3:db20 with SMTP id
 e8-20020a5d65c8000000b002efebf3db20mr5294441wrw.10.1681326998568; 
 Wed, 12 Apr 2023 12:16:38 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 a15-20020a5d4d4f000000b002cfe685bfd6sm17960924wru.108.2023.04.12.12.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 12:16:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-8.0 3/3] migration: Recover behavior of preempt
 channel creation for pre-7.2
In-Reply-To: <20230326172540.2571110-4-peterx@redhat.com> (Peter Xu's message
 of "Sun, 26 Mar 2023 13:25:40 -0400")
References: <20230326172540.2571110-1-peterx@redhat.com>
 <20230326172540.2571110-4-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 12 Apr 2023 21:16:36 +0200
Message-ID: <87cz48oqqz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Peter Xu <peterx@redhat.com> wrote:
> In 8.0 devel window we reworked preempt channel creation, so that there'll
> be no race condition when the migration channel and preempt channel got
> established in the wrong order in commit 5655aab079.
>
> However no one noticed that the change will also be not compatible with
> older qemus, majorly 7.1/7.2 versions where preempt mode started to be
> supported.
>
> Leverage the same pre-7.2 flag introduced in the previous patch to recover
> the behavior hopefully before 8.0 releases, so we don't break migration
> when we migrate from 8.0 to older qemu binaries.
>
> Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be after main")
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>
queued.


