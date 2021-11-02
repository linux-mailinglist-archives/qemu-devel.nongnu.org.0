Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA0442A3F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:19:53 +0100 (CET)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpxQ-0004BD-6Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhpto-00012O-6T
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhptj-0003Mf-HH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635844561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=4BMBY0Aat1sVv7ZXsUkJ5hCzMECuZPQnPcpXetVjtZ4=;
 b=SfwgmeWKihA+NU6Ppffwft7NyWIz2V2AIV5+38jl93Tr9VPHALiTet/Dp7x8VbTcO/P/f6
 M+FrZ3sZQ7KSH4x9AbXyEnYGZ311UWhuAEVYOwVAU1k6YesWL3tvooYy9cCrttR4cIQIP8
 RTEoIG9RiLDP58QsyQoKxl8OpSYuA2w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-m-ZJFKLXOC2baff9yFbgOg-1; Tue, 02 Nov 2021 05:16:00 -0400
X-MC-Unique: m-ZJFKLXOC2baff9yFbgOg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so604921wms.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 02:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=4BMBY0Aat1sVv7ZXsUkJ5hCzMECuZPQnPcpXetVjtZ4=;
 b=pYZxh3tD9dgL2J3DgJcR5gpW3PaepDKdTAEyu4a+e/y+239FHxQzjI2EJmKp5BOa5p
 zlj+T3PxjueGuwpRACONrM7vxQaBVdrvFD5g5QBZcsVLI9dladICUBEwo0DcXjjNOjw/
 JcsxxOkZQhFmsVOkBRoo03y/AAzGpp9bcYtM4vY0eTztQZjGimcUNHh54bxqtKVDnKYm
 VzgsRLrxxzjdEMxMJrCe9BCv4VwsRCvebZaGyeVAjHEhD07C2UfbChW8Zn5y0LaQeO1T
 b0ihaHZmhX7NkDFf0ZINOj6oNZTzABfGHy7SibXvczZKI6vnZqPQqU+7obYqob/1Z+A7
 Rq4A==
X-Gm-Message-State: AOAM533dsH8aFlZAThbj7PVMFYUqoQul033U9m3F4xHpGHq7SheQZyBJ
 0hpTByid6pDHGnvAskHyF3dFs6BWUwg6bOxaaT2oWjJyCrfYY7gxOA4JIX1apwWWTT5JfG4G7oZ
 CG1Foqb5t2F+rdY4=
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr3791011wrm.229.1635844559653; 
 Tue, 02 Nov 2021 02:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzutZlhxwrMd5f4Rh0g2fZSIija4W5WpQZy7wTWoXvRbptmiiiOiWiY7URYA47WkdcR+/m7kg==
X-Received: by 2002:adf:dcd0:: with SMTP id x16mr3790989wrm.229.1635844559512; 
 Tue, 02 Nov 2021 02:15:59 -0700 (PDT)
Received: from localhost ([188.26.219.88])
 by smtp.gmail.com with ESMTPSA id h16sm10774906wrm.27.2021.11.02.02.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 02:15:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v1 1/2] migration: block-dirty-bitmap: add missing
 qemu_mutex_lock_iothread
In-Reply-To: <87a6imncqs.fsf@secure.mitica> (Juan Quintela's message of "Tue, 
 02 Nov 2021 10:11:23 +0100")
References: <20211005080751.3797161-1-eesposit@redhat.com>
 <20211005080751.3797161-2-eesposit@redhat.com>
 <87a6imncqs.fsf@secure.mitica>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 10:15:58 +0100
Message-ID: <875ytancj5.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> Emanuele Giuseppe Esposito <eesposit@redhat.com> wrote:
>> init_dirty_bitmap_migration assumes the iothread lock (BQL)
>> to be held, but instead it isn't.
>>
>> Instead of adding the lock to qemu_savevm_state_setup(),
>> follow the same pattern as the other ->save_setup callbacks
>> and lock+unlock inside dirty_bitmap_save_setup().
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

And I realized that this patch is already on the tree, just not through
the migration tree.

Ignore the noise.

Later, Juan.


