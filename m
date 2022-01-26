Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0306649D465
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:20:51 +0100 (CET)
Received: from localhost ([::1]:36670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpij-0005ky-Dn
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:20:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpfI-0002L9-N6
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:17:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpfH-0006dr-1j
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643231834;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OABGlx/Ar9DGzVJHJPrZWY+BDF+rcdIyYq5fU6pHk9w=;
 b=cQ9n8BqkkQATlxGxbndrDCU51EZZIco8Lga8YmxmVzBni31D90zCqsc0bRukeq/c5YQ+63
 8keJA6rXxq3vCIWCdW9fLn9fzr3hDRfH+ngM7YqjIUGfK0iM1oG2OjhXXhlhLEIRcFQ5bk
 f2Jw9+w61E/Rt0iT7MeWmt7LwolAPvU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-JZQUps0YMuOE_O68SFP1fg-1; Wed, 26 Jan 2022 16:17:13 -0500
X-MC-Unique: JZQUps0YMuOE_O68SFP1fg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso191893wrg.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=OABGlx/Ar9DGzVJHJPrZWY+BDF+rcdIyYq5fU6pHk9w=;
 b=ijE2m2yBIKre5l4zT5xODzsoiRvvXqAqgs9kZFUjcRUTjdOiUDNhzJk+aAgIYNOCKr
 aQLQvKfkXlA9u1x+KFr4Hfn+as6alNliUCojcULppakg0WPIrxb+OP7FAN0Xpf1wU7JY
 nRefUTZ09tEdVC9zRuuQ4N4FtmhbqU1f9BoWkK2v+npmJzoMjKkWFjt9oRjj7fSn0v0E
 a+wfYOCTxCDT2vWcQ8M5piFkfjulYC6X3HuuJG7jZgl7Yo+Y18TWrhzHDAvR15zKuzhy
 FReVNMrZkX/G6BWFWn+0ZKciyzFpxFWLjdIs5AkJymip5A5PLYSbn8LQ0zcHdU1ezQdO
 9W3A==
X-Gm-Message-State: AOAM531exyFeqaOPAvxnlBhJGKqo/Z2WzpHSXMRevWC0la3zDv3BHe/6
 +JUKrjFdQVbLBBQsMeHGpMUpZoNnnX/TbdYKlSWSH0Ky9bZYiAoNFSYtFOmPpsucGiqmGUZTgHe
 V+fIOOPkFH+9aRHI=
X-Received: by 2002:a5d:588e:: with SMTP id n14mr364553wrf.45.1643231832121;
 Wed, 26 Jan 2022 13:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytSVr/Y57mxKhBJjCgY879+bbhP4PQhx3QiQc3koGC9lg6+v6zRQOYReIzVEfW4prPHhoyFg==
X-Received: by 2002:a5d:588e:: with SMTP id n14mr364541wrf.45.1643231831928;
 Wed, 26 Jan 2022 13:17:11 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id bg23sm406896wmb.5.2022.01.26.13.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:17:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 5/7] migration: Drop return code for disgard ram process
In-Reply-To: <20211207115016.73195-6-peterx@redhat.com> (Peter Xu's message of
 "Tue, 7 Dec 2021 19:50:14 +0800")
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-6-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 22:17:10 +0100
Message-ID: <87pmoemc2x.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> It will just never fail.  Drop those return values where they're constantly
> zeros.
>
> A tiny touch-up on the tracepoint so trace_ram_postcopy_send_discard_bitmap()
> is called after the logic itself (which sounds more reasonable).
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


