Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE24441B29
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 13:29:02 +0100 (CET)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhWQv-0007Ql-JI
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 08:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWPA-0006FS-6G
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhWP5-0001oY-6X
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 08:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635769625;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1ePI39RPOMtpKEu7xDRJ9kYRpViHERHIcHsgX2zFJ8=;
 b=C/Dz3QUtSxA3bcSaSH3rKBX49bB0ylGrHFGVgQZbEJ26aP7X3x4EZqqw7/la+f+ENdd3Ow
 dpjYtGHOAsRrodbzApiO7vP1Rb6ACmlQQO4hNkTaGdppyUMJ3mNOJ4EpMONgCklm8wyO3S
 D5Cr6R0gDgrtIZXmrssNB6XJR8XNBpc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-S-qJ_n47NOmoI1a5eHzhcQ-1; Mon, 01 Nov 2021 08:27:04 -0400
X-MC-Unique: S-qJ_n47NOmoI1a5eHzhcQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a2-20020a5d4d42000000b0017b3bcf41b9so3461975wru.23
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 05:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W1ePI39RPOMtpKEu7xDRJ9kYRpViHERHIcHsgX2zFJ8=;
 b=s8Vdm2jqMeMS5Sz2EHLH3W2gRIxYhzPVgd96EcK6eQRg8CFvE2NUXIw4Bbjb6EU5Cv
 IlXUzwStUMTe7vnSk3Wj2GFI/3W4pP7UnOrjGKJnrf988PFExt+kJESSGxhu7C/ykxdS
 i0qGAFY31G9kjHp2qy5becLoNo8db+HgL8US6+xR4/FbtA9iNuGWSmHnJN/VXqYxaqpE
 9USXIwLoVpgDKjMaod/zPE9ZdcRDsYpWSOGntRJc0zjkFHuIpOynaUQvDJazXptnbfsp
 k8VQpURsv/Tu2B89RxgxxXT/FOQejyzh50ghcyPbxXOdPInNlnCPfdyd/NxiSXB9Kbli
 3k2g==
X-Gm-Message-State: AOAM532DYjpXLeb84ItXigfhpdY84Ne0IoMxnXdpp5Hl0LewwxApfsh7
 qLtJpaZ7vKvdLVDBqWso0QPVWLcJk62OUh6CDwFkGbjKd5StYeN39mVaUPPgY9RkN/Ws11+ys/T
 bFAubOXmTdn8e7Qw=
X-Received: by 2002:a05:6000:2c9:: with SMTP id
 o9mr38127531wry.92.1635769623161; 
 Mon, 01 Nov 2021 05:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywZH8vNR8UqAqx1Coxo2r59d1/5EABO7q0cdBxi7uVN3mEbnNOhAmS3dhxw0aH8TAR2s3P/Q==
X-Received: by 2002:a05:6000:2c9:: with SMTP id
 o9mr38127498wry.92.1635769622996; 
 Mon, 01 Nov 2021 05:27:02 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id n68sm15992797wmn.13.2021.11.01.05.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 05:27:02 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 1/3] migration: Make migration blocker work for
 snapshots too
In-Reply-To: <20210922162009.125622-2-peterx@redhat.com> (Peter Xu's message
 of "Wed, 22 Sep 2021 12:20:07 -0400")
References: <20210922162009.125622-1-peterx@redhat.com>
 <20210922162009.125622-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 13:27:01 +0100
Message-ID: <87bl34qcx6.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
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
> save_snapshot() checks migration blocker, which looks sane.  At the meant=
ime we
> should also teach the blocker add helper to fail if during a snapshot, ju=
st
> like for migrations.
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


