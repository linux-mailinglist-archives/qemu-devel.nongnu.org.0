Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E23628DB8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:47:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiku-0005IW-9a; Mon, 14 Nov 2022 18:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifF-0004xE-Ai
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oua3C-0003Mo-HO
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 09:03:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668434581;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HZtTKrPDKwy8tNoHsKI078jfw2o2V5VL35QRiOhd3Ug=;
 b=a+ySw6foB2a2WMweueJGv9wvuhV6/Q0ZIL/911i+ximjjIm9/Z5k85ZFP8A5u14ULHoTRZ
 /3ndL7X8Ik2IcB3C4V5syYcGiBucEQRdM10lVGp8iBV4TAgQeJbfee2XuUoX1WeGbTLE8U
 qbJ+Q2pR/G9BhHr82M5iT+ljRmOTMuk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-NuMl90rTN8Gf-V9JcNiuEg-1; Mon, 14 Nov 2022 09:02:58 -0500
X-MC-Unique: NuMl90rTN8Gf-V9JcNiuEg-1
Received: by mail-wr1-f69.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso2006916wrb.8
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 06:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZtTKrPDKwy8tNoHsKI078jfw2o2V5VL35QRiOhd3Ug=;
 b=LW9InNx6I/9BX+i9u2wmnSyzp1RHQ1qYtw7e8Dr0UZ7tF1YkduvhaXJhdqhwOmYjpD
 dKPVjYacPuWM2YVYI8PqxemB3zEzJPgGlvUkBhsntxgOFx2qsmNyyrW0+79JIWGVmFBc
 369C931HyPG/XxbeyGQEsA39an9uwtOJsYb55sWx/yLszFduOafsjNVCT5ve4rqe7UhB
 7AHtdP0eDH3xi3XcDRHAZeiRc6HhZ6uryvlkcID5xndxkMXeJkfGys6vNMRRvKUivsXD
 hWdcEARWsNlVN5Or1LGB1avcWYIXMuhZImuJyc5jv9IZ6n/R3j4DWoF0hdfxjeMltI58
 qHzw==
X-Gm-Message-State: ANoB5pnc0dXyUh1iSCBmO7vZuI2OzWOAplYo2wPrI6EcahX0g2AAjct7
 Hv9gC/oiTdn6EMsPu2Z5hPhRE9pZEijwNSIErQ/VENedTDIWfVvHwpBEJlkkHs0se2eq1KV5ITf
 FM86MdJQSeLABFSA=
X-Received: by 2002:adf:e0ce:0:b0:236:4c14:4e4c with SMTP id
 m14-20020adfe0ce000000b002364c144e4cmr7666808wri.634.1668434576912; 
 Mon, 14 Nov 2022 06:02:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5u9MRKs2i0jGjLbQEHS6s/CdIp1ZaAfBqQsduYd0n3JQ70Al7s+Wup5bueyQNbTR9LIH39LQ==
X-Received: by 2002:adf:e0ce:0:b0:236:4c14:4e4c with SMTP id
 m14-20020adfe0ce000000b002364c144e4cmr7666797wri.634.1668434576701; 
 Mon, 14 Nov 2022 06:02:56 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c2cda00b003cf774c31a0sm19373801wmc.16.2022.11.14.06.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 06:02:56 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,  "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 2/5] migration: Fix race on qemu_file_shutdown()
In-Reply-To: <20221004182430.97638-3-peterx@redhat.com> (Peter Xu's message of
 "Tue, 4 Oct 2022 14:24:27 -0400")
References: <20221004182430.97638-1-peterx@redhat.com>
 <20221004182430.97638-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 15:02:50 +0100
Message-ID: <87v8nhbpmd.fsf@secure.mitica>
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
> In qemu_file_shutdown(), there's a possible race if with current order of
> operation.  There're two major things to do:
>
>   (1) Do real shutdown() (e.g. shutdown() syscall on socket)
>   (2) Update qemufile's last_error
>
> We must do (2) before (1) otherwise there can be a race condition like:
>
>       page receiver                     other thread
>       -------------                     ------------
>       qemu_get_buffer()
>                                         do shutdown()
>         returns 0 (buffer all zero)
>         (meanwhile we didn't check this retcode)
>       try to detect IO error
>         last_error==NULL, IO okay
>       install ALL-ZERO page
>                                         set last_error
>       --> guest crash!
>
> To fix this, we can also check retval of qemu_get_buffer(), but not all
> APIs can be properly checked and ultimately we still need to go back to
> qemu_file_get_error().  E.g. qemu_get_byte() doesn't return error.
>
> Maybe some day a rework of qemufile API is really needed, but for now keep
> using qemu_file_get_error() and fix it by not allowing that race condition
> to happen.  Here shutdown() is indeed special because the last_error was
> emulated.  For real -EIO errors it'll always be set when e.g. sendmsg()
> error triggers so we won't miss those ones, only shutdown() is a bit tricky
> here.
>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


