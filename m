Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B808048D2E1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:33:59 +0100 (CET)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ucQ-0007su-8f
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:33:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7uKl-0008Vn-Sz
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7uKi-0003my-US
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642058138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NxgnPngM24OqaiLlQVccrhYlwSlEZ9dQqTLDaCojUR0=;
 b=isOF47B4nRnKcU3bZNN9nB/MmS8Nb4DWX8PCrOKncSra+kGMNV6/71RJmN7vtBE+g8kbwQ
 HmqB2dHAnpqJjelP7i9Vbv5kMT4lc/MOvMkXL8Ze0bLtdMwLrwxRfpFwADJjO/JfHiY9RE
 botY7kOt9h91MhBr54gwy/kPHqqcGgw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-rx1Wxl89MnauDeLoFfenBQ-1; Thu, 13 Jan 2022 02:15:36 -0500
X-MC-Unique: rx1Wxl89MnauDeLoFfenBQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 h33-20020a17090a29a400b001b20b7d48dfso5793218pjd.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NxgnPngM24OqaiLlQVccrhYlwSlEZ9dQqTLDaCojUR0=;
 b=yv3oPHEka7RuyHXLXT6q2PsL4tyLBfRsGfOpSU3glcnIu72tdVMc7rvRU61XOmgYEJ
 iwHyr1BOTDW0eOc7f5d5ZVnHH95MGRY7jlRnbwFc3nUu9hTmM0gZtRSVgKUslXULNusP
 A7C1n8RqeVTY7qkK4+xkT1g/brcgy76yeKcUlPsKITc1cUSxI7q/rqpQg9yUo46x7am8
 F25Tcm/JF1NuCVKZ79OWxHb4vUd3yrpFq1oKD+ZzymRFk5DlWPrkCdyTRYSwQHityphG
 xiaxvJ0XyNlRxO/jEPOJ76VSzmakqY3U7w+Zo5957LpKmElEGsL5PBDPIppIUZFksxih
 zdyg==
X-Gm-Message-State: AOAM531PiwE6I6pdi9XqKiAyWn39CAoJVM2yPn5bLN0BiHQ2cs13GglG
 iK723/g5KzZB5aixtPWiXYyvouf063YhHUZVQFX5wi48q/tIZOGwNt6sJbbEtHZEllCjtgb20P/
 SqYRm1FPTWp79yUQ=
X-Received: by 2002:a17:90b:314b:: with SMTP id
 ip11mr13012214pjb.133.1642058135218; 
 Wed, 12 Jan 2022 23:15:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLvK85MaZdrqMjsmeuC/OlUaY3nT0v+DEYusgILVKVjpfzbKa+JxlLGAjtRTZVbb7vtr2dAw==
X-Received: by 2002:a17:90b:314b:: with SMTP id
 ip11mr13012189pjb.133.1642058134970; 
 Wed, 12 Jan 2022 23:15:34 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id mw8sm1618600pjb.42.2022.01.12.23.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:15:34 -0800 (PST)
Date: Thu, 13 Jan 2022 15:15:28 +0800
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Message-ID: <Yd/RkBTwMFxYBOiX@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-6-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-6-leobras@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:42PM -0300, Leonardo Bras wrote:
> Implement zero copy on nocomp_send_write(), by making use of QIOChannel
> writev + flags & flush interface.
> 
> Change multifd_send_sync_main() so it can distinguish each iteration sync from
> the setup and the completion, so a flush_zero_copy() can be called
> after each iteration in order to make sure all dirty pages are sent
> before a new iteration is started.

Leo - could you remind me (since I remembered we've discussed something
similar) on why we can't simply do the sync() unconditionally for zero copy?

I remember why we need the sync(), but I can't remember what's the matter if we
simply sync() too during setup and complete of migration.

Another trivial nit here: 

> -void multifd_send_sync_main(QEMUFile *f)
> +int multifd_send_sync_main(QEMUFile *f, bool sync)

I'd name it "bool full" or anything not called "sync", because the function
already has a name that contains "sync", then it's werid to sync(sync==false).

The rest looks good to me.  Thanks.

-- 
Peter Xu


