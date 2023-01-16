Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08F66BA34
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLiX-0004df-Vb; Mon, 16 Jan 2023 04:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLiG-0004cv-8i
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:23:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLiE-000455-2t
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673861009;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzkGU4HelogPfVpwxBQfvWcpLOoLgMFYFNz1ehSZYMc=;
 b=J4Bm45cdw8qblUSv49zECC+T+Kz9xkeebl0XjJzpEpHSpAoAZaF2muFhk5dx/dPeQMtmWu
 5qfeyRQdRN64VESKsP1oEXz4wL1qm87gpAVySPbwhn7rP0peucm80jXKdAQuRqmXKFn0/Y
 /0J2jIDpwvWtenYFk5+dEEdzp0kU5zk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-wkJOBXlZNrKbPO_Q46Ae9g-1; Mon, 16 Jan 2023 04:23:27 -0500
X-MC-Unique: wkJOBXlZNrKbPO_Q46Ae9g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF1D685C6E6;
 Mon, 16 Jan 2023 09:23:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C69BD1121314;
 Mon, 16 Jan 2023 09:23:24 +0000 (UTC)
Date: Mon, 16 Jan 2023 09:23:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH 2/9] audio: remove special audio_calloc function
Message-ID: <Y8UXimBNmYD7Rfej@redhat.com>
References: <20230113162200.3010804-1-berrange@redhat.com>
 <20230113162200.3010804-3-berrange@redhat.com>
 <26c2ac70-7c88-f486-adc8-1836efd4bc63@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26c2ac70-7c88-f486-adc8-1836efd4bc63@t-online.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Jan 15, 2023 at 03:03:29PM +0100, Volker Rümelin wrote:
> Am 13.01.23 um 17:21 schrieb Daniel P. Berrangé:
> > The audio_calloc function does various checks on the size and
> > nmembers parameters to detect various error conditions. There
> > are only 5 callers
> > 
> >   * alsa_poll_helper: the pollfd count is small and bounded,
> >   * audio_pcm_create_voice_pair_: allocating a single fixed
> >     size struct
> >   * audio_pcm_sw_alloc_resources_: samples could be negative
> >     zero, or overflow, so needs a check
> >   * audio_pcm_hw_add_new_: voice size could be zero for
> >     backends that don't support audio input
> >   * st_rate_start: allocating a single fixed size struct
> > 
> > IOW, only two of the callers need special error checks and
> > it is clearer if their respective checks are inlined. Thus
> > audio_calloc can be eliminated.
> 
> Hi Daniel,
> 
> my patch series at
> https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg02895.html also
> removes audio_calloc(). There will be merge conflicts.

Ah, yes, sorry I missed that.  I've sent a few comments on your
impl. Consider this patch dropped.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


