Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73BC3194D9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:08:06 +0100 (CET)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJC1-0002N2-Bo
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAJ9z-0001kN-V7
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lAJ9v-0001Rb-MD
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613077553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcYKcNqGVZRW+7Ah4dcbL0T7Yx53/6HMV8zhondE5KU=;
 b=N8yqk+ZoMJQ3VapkVYabYpcIDTuFzAX3cHFfkYLEMY5bQroS05mHhkYOXQE9kY44dVC7B6
 tJ87zuaO1PGEWOXVaOaPaAlW+AbLmYKF6G2yzmTaob4nIk8b664EiFHM2fC7N4ol1V84da
 P5LmvJSqtbxrHauCg8CI7kfR0c5L/hc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-0r58JcwWPyqK7kOGHDQQXA-1; Thu, 11 Feb 2021 16:05:52 -0500
X-MC-Unique: 0r58JcwWPyqK7kOGHDQQXA-1
Received: by mail-qt1-f197.google.com with SMTP id k17so5207882qtm.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 13:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xcYKcNqGVZRW+7Ah4dcbL0T7Yx53/6HMV8zhondE5KU=;
 b=aqqxnxmAOp8YKWDX09zYfwE11AEXFMuunPZG/nzrHjvAp6ANX/1WtB+7kBuQdZxTFq
 yALkkbDl63rP0UUaRq6eQa6gVVgoLf5JmMy/HqxzfJkvgpjBpeF74GkAYmJvB+OU9/sr
 whXIRQS+rKL2PzC1E+vtono3+3h81O5N4wtr8K1hSi2hJJLzP+zh57xIKIgcEhFAAjYd
 +0OzjP4e/PQs6lrsENm1Tts+oTE6ZPnwmqq+7b7owVPUlMtrt30KHSGHHLmsuS7gviS0
 /gHu2JQQZz+MrzVMkr/Ge44JePvJnQYJ5YS63/q9yv1Zl/M14NpJZqhNSvKIlsu97WKB
 pM0A==
X-Gm-Message-State: AOAM533CME8xDeIbUqgHutRWSPKqKP1inWR0z2tFhLcLuIxYS1JTMD64
 BOqpNw50mezJf6GmKUusBI/9s0zD6M2/TO8tbtUle+4QsxavwEm+fWp2+i4OpYdB4/S6GUQ0y4c
 alAaeLTtyA3T8EcM=
X-Received: by 2002:ac8:58d5:: with SMTP id u21mr9438925qta.228.1613077551689; 
 Thu, 11 Feb 2021 13:05:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWeBpPZQ91QjnVCnaGVi6jwBl40JO8TsXZEOD6zfqzesp3psrxmNsz6EZaO9p6KlWXsbwHGg==
X-Received: by 2002:ac8:58d5:: with SMTP id u21mr9438913qta.228.1613077551491; 
 Thu, 11 Feb 2021 13:05:51 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id y190sm4799166qkb.133.2021.02.11.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 13:05:50 -0800 (PST)
Date: Thu, 11 Feb 2021 16:05:49 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210211210549.GE157159@xz-x1>
References: <20210211203115.GD157159@xz-x1>
 <764B3931-54B7-426F-9872-5B71EED60947@redhat.com>
MIME-Version: 1.0
In-Reply-To: <764B3931-54B7-426F-9872-5B71EED60947@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 09:44:07PM +0100, David Hildenbrand wrote:
> Let‘s take a look at init-on-free.
> 
> The guest zeroes a page and puts it onto a buddy freelist. Free page reporting code takes it off that list and reports it to the hypervisor. The hypervisor discards the physical page and tells the guest he‘s done processing the page. The guest re-places the page onto the free page list.
> 
> From that point on, the page can be re-allocated inside the guest and is assumed to be zero. On access, a fresh (zeroed) page is populated by the hypervisor. The guest won‘t re-zero the page, as it has the guarantee (from free page reporting) that the page remained zero.
> 
> Write-protecting the unpopulated page won‘t work as discussed.

IMHO no matter if it's init_on_alloc or init_on_free or both, as long as it's
inited in some way then it means the guest OS wrote to it.  Then wr-protect
will work..

MADV_DONTNEED during live snapshot seems to be a separate topic as you
mentioned in the other thread.  For that, I agree we'd better simply let
virtio_balloon_inhibited() to return true for live snapshot too just like
postcopy.

Thanks,

-- 
Peter Xu


