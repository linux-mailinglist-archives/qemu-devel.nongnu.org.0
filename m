Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101893975D0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:51:47 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5k9-0000ln-Kl
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo5j2-0008Pd-On
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lo5iz-0003sR-JL
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622559031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B7hJMo1Sc+68yhGDqWiGCGDgWwjm52KWBbyn+C6u2mA=;
 b=Os97gXM67DSkfeTJL1Xhljf7CWfpREOc+GTeaKVVLbo/v+HZlVE5cXgP5EBwvX/rOP1WHL
 14qO/UwZgK3TYDosskHW499nvP02xU8Z7lx8LlbRfzkGmnTE/zVk5MvAQG41LHYs7cMQzI
 nTRDZhAWaYxLFJKstAPd6ljk4SfD56w=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-acwmUmmsNoOD9bfOFgacfQ-1; Tue, 01 Jun 2021 10:50:27 -0400
X-MC-Unique: acwmUmmsNoOD9bfOFgacfQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 o14-20020a05620a130eb02902ea53a6ef80so1085701qkj.6
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B7hJMo1Sc+68yhGDqWiGCGDgWwjm52KWBbyn+C6u2mA=;
 b=GmQUtCW4/IiEqrCS871Z6z6hKq40gQGxkAbaHrPC+CdbQc4WqQkDxUjgBJwlLyHJSc
 u5Z7Jkx2zS7LjiyMlPMOPd2gkaehk9TiHmm3a2po6wD7y+g2ykpmLEg3MAbEp8iOx3P+
 MCbilm/uEDr4loNPWyw4cW7wUSM6Ud5n5bidrqofHNJsvmyDjQf6ZDMSkLDw3bIczPiP
 SQsf2Bp6FN87g0fjhFbyqGRfX55ZPtF9tO9NORY/QxkeIdJOGoSAtx3cWmP7BI5Kkp04
 +j3T/kS/eyWQZQPxes/buXBf+j1EE6R1FsM00YBWBSSYKdc1yubz7ccR4d2yaJC9mC1G
 1lvA==
X-Gm-Message-State: AOAM530UDANs2H7PfwvyQWRQokxLD6TEH6ZdSHxFriQw2HGRDJyS38hE
 Bvm7qVqwv12XsfCfNj+hlDo0yQlaL3K7vYVswL+8qbsqXpp9RoBrixtMGkcb2GNOHS1K7U1yfdw
 I+t5vXv1xQIc9uV4=
X-Received: by 2002:a37:c0a:: with SMTP id 10mr21313539qkm.194.1622559027038; 
 Tue, 01 Jun 2021 07:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2HzOT1O7zapW6J3KaV1p0w8t/3+qA4vWGOXuBohWHnMaPD0KmTe3phP6G8npcxmYhGthMyg==
X-Received: by 2002:a37:c0a:: with SMTP id 10mr21313520qkm.194.1622559026768; 
 Tue, 01 Jun 2021 07:50:26 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id b9sm4812549qkk.89.2021.06.01.07.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:50:26 -0700 (PDT)
Date: Tue, 1 Jun 2021 10:50:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras.c@gmail.com>, lukasstraub2@web.de
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
Message-ID: <YLZJME3kiFe0rMRe@t490s>
References: <20210601054030.1153249-1-leobras.c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210601054030.1153249-1-leobras.c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de, berrange@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 02:40:31AM -0300, Leonardo Bras wrote:
> After yank feature was introduced in migration, whenever migration
> is started using TLS, the following error happens in both source and
> destination hosts:
> 
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> 
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
> 
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and multifd_load_cleanup().
> 
> Also, inside migration_channel_connect() and
> migration_channel_process_incoming() move yank_register_function() so
> it only runs once on a TLS migration.

Slightly inaccurate I guess, as it was run once too before this patch, but not
paired for tls?

IIUC when we call the 2nd time at below chunk we won't register again:

        if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
            yank_register_function(MIGRATION_YANK_INSTANCE,
                                   migration_yank_iochannel,
                                   QIO_CHANNEL(ioc));
        }

Because the 2nd call will be TYPE_QIO_CHANNEL_TLS, so object_dynamic_cast()
will return with a failure, I think (note, TYPE_QIO_CHANNEL_TLS's parent is
TYPE_QIO_CHANNEL, not TYPE_QIO_CHANNEL_SOCKET).

> 
> Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks Leo!

I have one pure question not directly related to Leo's patch (probably for
Lukas?): we check OBJECT(ioc)->ref == 1 when unregister each function.  In what
case will the ref be not one?

-- 
Peter Xu


