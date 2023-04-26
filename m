Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367DF6EF980
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:36:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prj42-0000g1-ON; Wed, 26 Apr 2023 13:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prj3y-0000fj-JX
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prj3v-0002Tf-5f
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:36:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682530558;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LgSK8I6LuQZIBJ4ikWOGn7Voho5LolAh/IspLHRyJSk=;
 b=RFOqs91c7Pvy7Hhq59gf8OYaLSbxee77YqsLul9xf6BA+j6iywM/M2U4Mh/mStUhmfydmy
 7VcaAcUGTCkHjqmm3ayhJtndkREJwXj75fX7GTbGLUiDk0R2V2+QGJ7Nl+EIrqSL8+fpG3
 JU1hxa2NhENUEntnWgo/hSQRYXS0cJ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-mep5BX_lNP-jP164lUHX9Q-1; Wed, 26 Apr 2023 13:35:30 -0400
X-MC-Unique: mep5BX_lNP-jP164lUHX9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f250e9e090so13876665e9.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682530528; x=1685122528;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgSK8I6LuQZIBJ4ikWOGn7Voho5LolAh/IspLHRyJSk=;
 b=aBAUGqYz1TI3UT6D9/adYof0uzuFsMoqbR6j53E2NEQR3xE4+shK7QMEb8BKboTjWh
 SxVwRIMHWwDJdrVe1AcVpAYyk3QCNK/5r33FPnOUY8rvw4Le5obxArpJ8oWX2RS7g3Wd
 N4G2hwGlLg2nrr0EAOF1sFF3OKSBk3QaVYWQt3a1dlNB8BrCgD1XvigNFS54bg7GMqsx
 x2WlLVLNALHZXCRj/4YHdLxLK0sVkI7m2hINy2h2E7eA9aCkOuh75udm0aZiTePDJyKt
 9c/P4bqIJ09Rf0DAJBztUwsi8fi+bLDrQzl11yJU0iX+M8J4M0RFZb3A3lGi84ALRykF
 X5qw==
X-Gm-Message-State: AAQBX9fxZR/zgH/lTEAgJM0Fol6tIgm4bfAXBqyA56LvZojWF/uB6p4k
 G4SsCw0ziVTubTJ4pSSo9iWH8pcDzd/oOq/AAfUxZhCohhQG/e2NcUTRqZNaVWtDlca3A4UEJkA
 uP5zMDo7rtu/JqGXHem1URbRN2EFy
X-Received: by 2002:a05:600c:24cd:b0:3f1:7e3a:2ef2 with SMTP id
 13-20020a05600c24cd00b003f17e3a2ef2mr13134654wmu.14.1682530528809; 
 Wed, 26 Apr 2023 10:35:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350acrPmR91HAf129K8CWxAUopYrC2vmkBIBy/XCgOwL/MncJ7BWkdEAKt7z7I65MewxKhyK6xw==
X-Received: by 2002:a05:600c:24cd:b0:3f1:7e3a:2ef2 with SMTP id
 13-20020a05600c24cd00b003f17e3a2ef2mr13134635wmu.14.1682530528504; 
 Wed, 26 Apr 2023 10:35:28 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 s9-20020adfdb09000000b00301a351a8d6sm15836391wri.84.2023.04.26.10.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 10:35:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  Peter Xu <peterx@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH] multifd: Fix the number of channels ready
In-Reply-To: <87354mmudb.fsf@suse.de> (Fabiano Rosas's message of "Wed, 26 Apr
 2023 14:22:08 -0300")
References: <20230426162307.11060-1-quintela@redhat.com>
 <87354mmudb.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 19:35:27 +0200
Message-ID: <87r0s6eecg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fabiano Rosas <farosas@suse.de> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> We don't wait in the sem when we are doing a sync_main.  Make it wait
>> there.  To make things clearer, we mark the channel ready at the
>> begining of the thread loop.
>
> So in other words we're estabilishing that "channel ready" means ready
> to send, regardless of having sent the sync packet. Is that it?

Yeap.

There was a bug (from the beggining) that made the counter always get
up and up.  This fixes it.

It was always supposed to work this way.

/me puts (second time in the week) a brown paper bag on head

Later, Juan.


