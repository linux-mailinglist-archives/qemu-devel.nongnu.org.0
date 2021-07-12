Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F2F3C5F45
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:30:01 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xse-0007Pj-FC
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2xqZ-0005AL-74
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2xqX-0008UW-B6
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103668;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Rh5WX9LrYkPEPy+1GpzfX7KMaLPc7svRZm3LQ4bmcrM=;
 b=VhsoP7KUmoWiGid2dcwnqsp0/jG75MrM2WBC90D0hMkHYe/i24LLOalPGHV1lBY6df0CpN
 D7Bq0XkymP4uCv7M6kf8uH1umVj/LIgbA+CMUGvx4IK8vCPv6srex8g2M8/w6p2XIPYVWo
 n/iqENuHgfW6T/2WCmScWdyy5fXpNr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-1nekG3kyOv61vJA3oQ27kw-1; Mon, 12 Jul 2021 11:27:37 -0400
X-MC-Unique: 1nekG3kyOv61vJA3oQ27kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AE8D101C8D1;
 Mon, 12 Jul 2021 15:27:32 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD96010550AF;
 Mon, 12 Jul 2021 15:27:29 +0000 (UTC)
Date: Mon, 12 Jul 2021 16:27:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH 1/6] machine: Set the value of maxcpus to match cpus
 if specified as zero
Message-ID: <YOxfXuuH0gHXr7VV@redhat.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-2-wangyanan55@huawei.com>
 <20210712145737.6gsawrmzbicgdevx@gator>
MIME-Version: 1.0
In-Reply-To: <20210712145737.6gsawrmzbicgdevx@gator>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 04:57:37PM +0200, Andrew Jones wrote:
> On Fri, Jul 02, 2021 at 06:07:34PM +0800, Yanan Wang wrote:
> > It is currently allowed to explicitly specified the topology parameters
> > as 0 in the -smp cmdlines, such as -smp cpus=8,maxcpus=0,sockets=0. And
> > for the values of cpus/sockets/cores/threads, we always determine that
> > they are ommited if either set to 0 in the cmdline(e.g. sockets=0) or
> > just not explicitly specified, then we compute the ommited values.
> > 
> > We probably should also treat "maxcpus=0" as ommited and then set the
> > value to match smp cpus. This makes cmdlines like "-smp 8, maxcpus=0"
> > start to work as "-smp 8,maxcpus=8,sockets=8,cores=1,threads=1".
> > 
> > Note that this patch won't affect any existing working cmdlines, but
> > will allow configuration like "-smp cpus=n,maxcpus=0" to be valid.
> 
> Personally, I'd rather see -smp cpus=n,sockets=0 become an error than to
> "fix" -smp cpus=n,maxcpus=0.

Yes, a value of 0 is not really something a user should ever be explicitly
setting. It is purely an internal default that is used by QEMU to identify
when it needs to auto-fill a value.

A user should give a non-zero value, or omit the parameter entirely


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


