Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FD68610A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:55:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN7xk-0007Bm-5U; Wed, 01 Feb 2023 02:55:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pN7xW-00076d-8t
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:55:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1pN7xU-00015W-96
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675238106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bejBOTQkLAYJT8CamCKcjPt+iQorefFGDG4dN3S3q9g=;
 b=gpG9vbISvqGh5XkLqDHvygErdXxAv7I/lYAuBt8ryQqMYzpbV99tyu9LisVCePtvcMn+jb
 KMkHrTc2R6LQAE2yZFe50s1JL+Y9itmvK/GElA7Kwu6w3pZPQ7BJjyBfud6qBNyiJuRr5X
 yrPK6lnALfnuV9fTpmM9peA5B+OaBfM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-9qgztufXPCqe6ubvvJJEpw-1; Wed, 01 Feb 2023 02:55:03 -0500
X-MC-Unique: 9qgztufXPCqe6ubvvJJEpw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g14-20020a056402090e00b0046790cd9082so12300431edz.21
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 23:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bejBOTQkLAYJT8CamCKcjPt+iQorefFGDG4dN3S3q9g=;
 b=Y+XGLv0HWKcIPTSsBW8xrXh7RZuxnMAZ+mxit1CqDK4kfIDK+f/h8ie4Xvqkw261V3
 BeimAxCu/ZugsSn1jpV3GGh8lxA83DG2wAC4oNlhk2tKvqPC+gEOAMZsF1v9/WNaCBcM
 6egA7I2L1mxxDQ86KwozxwwC9dWxw5TDj4ojfPy1ZcqAYQISFThVwX3IG2kjwVuzUVe3
 9r2r9megdq3/8Iav8jMFYbKSr/hqmhvCDqF1uEkcrVLMPS0/qc/L4HDuWKIemQQrVyv+
 eODMPVSUX0fdSrwGMfx/s264pFuVwgTBId5NMI3buEBhGHeVW5NVK/fy5jngEaOY6Zts
 Xdkw==
X-Gm-Message-State: AO0yUKUwKlZGqop5xptwCoyjBkiEK5Coh40DmZvXMwP4fARjT43vA8Nz
 RTKNYVqEiZE+F2CoD2CdBxfo893B5vFnlwX7oug7O2gYE/d0z56Rm9IlzgjD5ByWttu+9yTvoGb
 4pZu2tENPjn31BWU=
X-Received: by 2002:a17:907:2ce7:b0:886:7eae:26c4 with SMTP id
 hz7-20020a1709072ce700b008867eae26c4mr1209673ejc.5.1675238102418; 
 Tue, 31 Jan 2023 23:55:02 -0800 (PST)
X-Google-Smtp-Source: AK7set++q/hFRqrlUHzH6/d3PzAxWL9GHtOaEpxReYDpZmuTh7chnLIsDERleDB2XWUf6p8eb4SFSw==
X-Received: by 2002:a17:907:2ce7:b0:886:7eae:26c4 with SMTP id
 hz7-20020a1709072ce700b008867eae26c4mr1209667ejc.5.1675238102246; 
 Tue, 31 Jan 2023 23:55:02 -0800 (PST)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170906868c00b00887f0f8294esm4702102ejx.200.2023.01.31.23.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:55:01 -0800 (PST)
Message-ID: <25b5b38e-3445-2e2e-cc34-e4feae6c0c09@redhat.com>
Date: Wed, 1 Feb 2023 08:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com> <Y9KK72k8dZU7Ccau@work-vm>
 <Y9KbUaMo8DaH0YKv@x1n> <Y9KjZeu9t37XyZ3q@redhat.com> <Y9K31a04dTChnaOV@x1n>
 <Y9lwphMDs+Q3aVMr@x1n> <Y9l0328Sp3HJ948a@redhat.com> <Y9mBxpYBv+h8Y0TT@x1n>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <Y9mBxpYBv+h8Y0TT@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/31/23 22:01, Peter Xu wrote:
> I'll wait 1-2 more days to see whether Michal has anything to comment.

Yeah, we can go with your patches and leave FD passing for future work.
It's orthogonal after all.

In the end we can have (in the order of precedence):

1) new cmd line argument, say:

   qemu-system-x86_64 -userfaultfd fd=5 # where FD 5 is passed by
libvirt when exec()-ing qemu, just like other FDs, e.g. -chardev
socket,fd=XXX

2) your patches, where qemu opens /dev/userfaultfd

3) current behavior, userfaultfd syscall


Michal


