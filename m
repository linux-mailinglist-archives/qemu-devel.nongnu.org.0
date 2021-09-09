Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89480404627
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:28:47 +0200 (CEST)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEUI-0004cx-G8
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOESS-0003qT-TO
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:26:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOESQ-0006DK-TI
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631172409;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WskRNRgBSCIQpPbBQNZ3k5r/IdHIdoZKQsb40Luu8a0=;
 b=MxG83XzTnYditGesciO2QssEipLn7Q5LjkBc/4NpEdubNKgUZulT5pfbJ7QU+9fvR8lFZS
 Kc5CGeen4gCOYYiR/HD5EjXbiQxoA/SB01wUNHvSakyGvTxFzh9c0qJ1n2IB1bxjj13rAJ
 IUM823yD0EU+V4FeMjaHLvf87YUTrVA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-hXetew__Pe-tnRxe3CbLgw-1; Thu, 09 Sep 2021 03:26:48 -0400
X-MC-Unique: hXetew__Pe-tnRxe3CbLgw-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a7bc20a000000b002f8cf761457so266452wmi.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 00:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WskRNRgBSCIQpPbBQNZ3k5r/IdHIdoZKQsb40Luu8a0=;
 b=yESZNMLt5YSDaK5hxBb2FWelalBsLKcF17OHdkyFxqn3sSNZ6TUfvReznIquO1JkU0
 NvAMn1lSVdKBlPe2b94zR9RL6I5+fKrFJTXXIcp07XMi53sIKDxmTa3bXVC8GqAkfM11
 O8NpwlgcnTL+/f6obKGWA05vCVtXI2EV5hsxhnrtwTsJAxxMdGR2KgvEd2vhTCjIBzko
 o+vWc4heckKELkK69t2+ea6I2rWbP2YEqD4HfxQup1WNH0cZFN/I5N4MCk56pLH4S0t4
 uys7i8I6ccJLqb0ujt1dV/qSrPsyWhCedAHQ3R8AjXqx0/2ZkzvyT78l57PyPeEM0tAv
 Prpg==
X-Gm-Message-State: AOAM531dZ4Vt9CDzL+s6xjzojcBU63GXASGXPpAaIZnw78ppZ3key5h3
 AFkEln6lPpH+V97D5DeBeMfzFWSHxrtzL8PyxrsU1PKT3aPtyBgYjcTAADPBwFDZAl2f4aPPzr5
 h5WK2Zomp9Qdtoww=
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr1738330wrx.244.1631172407179; 
 Thu, 09 Sep 2021 00:26:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFWTW87wIIMPUXkFPQbel/XRD3H6JjZcXlEYPCN6IfNodAlgKaxSjynPiA0Zjt+DgHDVjbhg==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr1738303wrx.244.1631172407000; 
 Thu, 09 Sep 2021 00:26:47 -0700 (PDT)
Received: from localhost (static-41-120-85-188.ipcom.comunitel.net.
 [188.85.120.41])
 by smtp.gmail.com with ESMTPSA id c23sm758369wmb.37.2021.09.09.00.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 00:26:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 3/9] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
In-Reply-To: <20210904160913.17785-4-david@redhat.com> (David Hildenbrand's
 message of "Sat, 4 Sep 2021 18:09:07 +0200")
References: <20210904160913.17785-1-david@redhat.com>
 <20210904160913.17785-4-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Sep 2021 09:26:45 +0200
Message-ID: <87y286b45m.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> The parameter is unused, let's drop it.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


