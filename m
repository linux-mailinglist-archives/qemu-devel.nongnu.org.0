Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753068693B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEZM-0002Mw-8O; Wed, 01 Feb 2023 09:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNEZF-00021J-Gr
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pNEZD-0000O7-95
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675263510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooInzJcDpo+JjAKy96V4Y8Ee/hrsbc2iMqeddHaVOlA=;
 b=Sp9saEUTxJyTVMnxWw9qbHZS9FdrOqbTvik8WkyGdjyERE9cVk0h5F6KXS17ed99pNf2P5
 lUTINZ8/CMH+vlyyvPAnpgEBWjuN3xGj09bzVQfLd+i88jjqkEodzh7CGwVuRASbCwswWS
 78E7cjdgiL2L1EQaTNV5XZqfhrSikes=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-hUp35lYsPGi6sYmKB6PWbg-1; Wed, 01 Feb 2023 09:58:21 -0500
X-MC-Unique: hUp35lYsPGi6sYmKB6PWbg-1
Received: by mail-qt1-f198.google.com with SMTP id
 bs11-20020ac86f0b000000b003b9b4ec27c4so2153720qtb.19
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 06:58:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ooInzJcDpo+JjAKy96V4Y8Ee/hrsbc2iMqeddHaVOlA=;
 b=gvZ9m38b/gi3ggY9rQ0sYdofKNmLrFTLTkktVMzVMJhjWQ/oiqM0S2HJ/4wtsIFpl/
 VYjNFVcefqr6bUaVNEee4EPpclC1J+zRG37iFpjrQAAsqB9Kwj/ZXZFZ3TerJ7M782h8
 WXQTr0KktsSwnT8fpVAugvGfNlVQAiF5VNionn+14fGV+kJE4/vYMxBsUaF5wPmxsmov
 sEAmqRXT52LfAfjALpC7f40wJHHRjEVRKm4NAXVf2FBrUzqWEbxQprR0nspUhpouJxML
 I/2K+4SSiCmTZlllrywRNnnWJz6U7usEMGtxvrdEZZMRyfJxXAL0Wh1qt9B5hYt+cdqG
 DmCg==
X-Gm-Message-State: AO0yUKV/8p5ijlUUpXUR0hDOZgRy+T5C1OJN+1UY+iRdr6baIeOmOOxU
 14pcW2tR5m1w2ThfoRRwAnMc3mpdSgepNAzYEp7wfzdEIu2EfbQYVMzrHdocMuUtaPD+VqWonzj
 /sESIp0D3iLJtSU0=
X-Received: by 2002:ac8:7108:0:b0:3b8:6d5a:3457 with SMTP id
 z8-20020ac87108000000b003b86d5a3457mr4097422qto.6.1675263501114; 
 Wed, 01 Feb 2023 06:58:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/KbplvqsQBpVko18Bk7VT6Hp8H6Y7Mf/gkBfpYyI7AfOdXPFS7cu85sMBQNqnZnw4XTjt1wA==
X-Received: by 2002:ac8:7108:0:b0:3b8:6d5a:3457 with SMTP id
 z8-20020ac87108000000b003b86d5a3457mr4097398qto.6.1675263500804; 
 Wed, 01 Feb 2023 06:58:20 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05622a145000b003b8391b7736sm8671754qtx.25.2023.02.01.06.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:58:20 -0800 (PST)
Date: Wed, 1 Feb 2023 09:58:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9p+C852jA2ntNYt@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
 <Y9KK72k8dZU7Ccau@work-vm> <Y9KbUaMo8DaH0YKv@x1n>
 <Y9KjZeu9t37XyZ3q@redhat.com> <Y9K31a04dTChnaOV@x1n>
 <Y9lwphMDs+Q3aVMr@x1n> <Y9l0328Sp3HJ948a@redhat.com>
 <Y9mBxpYBv+h8Y0TT@x1n>
 <25b5b38e-3445-2e2e-cc34-e4feae6c0c09@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25b5b38e-3445-2e2e-cc34-e4feae6c0c09@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 08:55:01AM +0100, Michal Prívozník wrote:
> On 1/31/23 22:01, Peter Xu wrote:
> > I'll wait 1-2 more days to see whether Michal has anything to comment.
> 
> Yeah, we can go with your patches and leave FD passing for future work.
> It's orthogonal after all.
> 
> In the end we can have (in the order of precedence):
> 
> 1) new cmd line argument, say:
> 
>    qemu-system-x86_64 -userfaultfd fd=5 # where FD 5 is passed by
> libvirt when exec()-ing qemu, just like other FDs, e.g. -chardev
> socket,fd=XXX
> 
> 2) your patches, where qemu opens /dev/userfaultfd
> 
> 3) current behavior, userfaultfd syscall

Sounds good.  Thanks.

-- 
Peter Xu


