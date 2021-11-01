Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13219442087
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:09:52 +0100 (CET)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcgp-0003wA-3d
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhbq2-0003xH-1R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhbpu-0004ba-It
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635790509;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wF1DRhe//0XFKERyIb9nQ5JXHMO49S0s+6Pu79C6bxY=;
 b=JA932h/kK/+P79VL1Qg13yJ5Tt1/B/OdiMDmiDuQuIO6rF0bcX2ogGhYzFIxg3D2rQ5b9D
 yI4wP/3Bv4JuAmsKK6rHaLpzSNX8+x55u5P9zxWrgHb78nuZUXX9orBjzBWLWgUVNO8Bp+
 zIt/pZ0OWv4DSylKdYv6SLm4wbkSEnk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-21gpWBwWNxqhMK2sOl277A-1; Mon, 01 Nov 2021 14:15:06 -0400
X-MC-Unique: 21gpWBwWNxqhMK2sOl277A-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adfa34d000000b00160aa1cc5f1so6502483wrb.14
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=wF1DRhe//0XFKERyIb9nQ5JXHMO49S0s+6Pu79C6bxY=;
 b=bnHesewatzAviAnvXmfrFtWB/emWsDmFv8dkcxi2i2oZSquY1HXnEkvYB72Fsld/Rs
 aW8uwMdTd+RI6OQEQBeSBBHTTbKhWYU3j9IVbj3jbRGW5X6X428kAVDzrfZKEm++W8PJ
 q0dSIuo0uVNpJ2hGbeU6XcUgndPlSf74Vo4/t0CeQNKD+DHFLZwTUcnXkiMW1EXj1xtA
 A4Q6tXourYn0dV0CkrtleUnBcICwLu/G5ezHdjMvsJLRiwzz4vCrm2dG1k6+Ka44u5HJ
 y5y7MsxkitJfbc4UlIva6tvwz1ypc5Esb51q+UgQ/F3vtNiDWomeR5ET0kvSVXO0fiIy
 a4Yg==
X-Gm-Message-State: AOAM533+l+xDwP2UdF8CGNUvbF13DmhF535/Kxrs7fMAAfmck5KuayHA
 8VeBabGnBqtBGsXs60WlrbPtkIJgGHhl/eEBwkU+/A/ncaNj9w3vL7tBTPzXQhlwG1t12JFBpzA
 VEU32UhxM0nj0EgA=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr15899510wrp.428.1635790505644; 
 Mon, 01 Nov 2021 11:15:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNsO0ph43FpXPnzTufLJIQngdXXsfwI4ktmKuq1qY750SzaOys7qkvHxfy/0IzaEzyROntLg==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr15899476wrp.428.1635790505459; 
 Mon, 01 Nov 2021 11:15:05 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id h16sm8674361wrm.27.2021.11.01.11.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:15:05 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 5/9] virtio-mem: Drop precopy notifier
In-Reply-To: <20211011175346.15499-6-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:42 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-6-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 19:15:03 +0100
Message-ID: <87y267spy0.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> wrote:
> Migration code now properly handles RAMBlocks which are indirectly managed
> by a RamDiscardManager. No need for manual handling via the free page
> optimization interface, let's get rid of it.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Good, good, good.


