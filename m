Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93213194E5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:12:32 +0100 (CET)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJGJ-0004bY-FE
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAJDz-0003iR-LF
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAJDv-0001kn-IX
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613077802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYvM7Ruap+yHz/h9QCAY/XkGc+UyvGC3KTxgcKADq/8=;
 b=NlOg+zSJT7rPHNM8uVc075pGNshwGl3SHsr5G2iJDqx9dz68wC3hS7qii3uxy80pz7GdGz
 4+3eYUWXVaR/cncJpE3w2IRAVvIvPUgB0Mrc+I8RdTwGjjPmKPFAvVkh0Ca5U3TzT0c1LB
 R/HFcBDWApasul3K+nG78sYQLCFvnKc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-PQur0t_JNXaezKkiYcfW2g-1; Thu, 11 Feb 2021 16:10:01 -0500
X-MC-Unique: PQur0t_JNXaezKkiYcfW2g-1
Received: by mail-wm1-f70.google.com with SMTP id z188so5824012wme.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 13:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=N9bxXbxh0/ljjFKKflYL8EnSGzIZPDdOtogtS4Y1xyU=;
 b=smULc13mctpN+X26bK6BFz5tZBcOKGBT3KUnegw+U2BjPeBdpBBXg8NiFynilibkcx
 18cL34xH50o2NPO6FLMIFF4M0DHJmy4apWtycYTyJsp5I5xigAArGI2Lq6YAdqIZ4Sq1
 ZJK/6KIgceMQziixB8fYDK56FLa8cdKXHo/AY+2+6lJiaXB4ia+rdn+YF17LDAsz2cBX
 HQSL6W4tFHTAvVL8lOzN5V9eEOsxCJhqgp3rNZj0znDkvqYsSVS+lQm/1zHTEpyM5Xda
 EJtwLDWFetPUgIG8R0Sq1vbX2g6nYoKfMXZoc8N75CN0uMqtqLiVzmGW2G0YmbVtEnd4
 aBag==
X-Gm-Message-State: AOAM530apt8+DBMveNmxESB3gIAvdrCE9fNd/lEkkZfqsLdK+HUEOq3D
 /LNj/sYnZtiGAeFm2SHs6aiTgGUEyw+8/1uBosTRNLiVf5emh5Rj1mFDJDhz5Pfgfe9IfCE2i/7
 amUF8BGdrUlY7OmI=
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr6853574wmj.174.1613077800016; 
 Thu, 11 Feb 2021 13:10:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze+R9E/Y6ai/Xnz548nRg6SPeAPWo+94jhNP1tR3joyXfOsj5ig2GvwmAcNM/opcs50ii7Jw==
X-Received: by 2002:a7b:ce99:: with SMTP id q25mr6853554wmj.174.1613077799842; 
 Thu, 11 Feb 2021 13:09:59 -0800 (PST)
Received: from [192.168.3.108] (p5b0c62a9.dip0.t-ipconnect.de. [91.12.98.169])
 by smtp.gmail.com with ESMTPSA id
 l5sm6500615wrv.44.2021.02.11.13.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 13:09:59 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Date: Thu, 11 Feb 2021 22:09:58 +0100
Message-Id: <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
References: <20210211210549.GE157159@xz-x1>
In-Reply-To: <20210211210549.GE157159@xz-x1>
To: Peter Xu <peterx@redhat.com>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Den Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 11.02.2021 um 22:05 schrieb Peter Xu <peterx@redhat.com>:
>=20
> =EF=BB=BFOn Thu, Feb 11, 2021 at 09:44:07PM +0100, David Hildenbrand wrot=
e:
>> Let=E2=80=98s take a look at init-on-free.
>>=20
>> The guest zeroes a page and puts it onto a buddy freelist. Free page rep=
orting code takes it off that list and reports it to the hypervisor. The hy=
pervisor discards the physical page and tells the guest he=E2=80=98s done p=
rocessing the page. The guest re-places the page onto the free page list.
>>=20
>> From that point on, the page can be re-allocated inside the guest and is=
 assumed to be zero. On access, a fresh (zeroed) page is populated by the h=
ypervisor. The guest won=E2=80=98t re-zero the page, as it has the guarante=
e (from free page reporting) that the page remained zero.
>>=20
>> Write-protecting the unpopulated page won=E2=80=98t work as discussed.
>=20
> IMHO no matter if it's init_on_alloc or init_on_free or both, as long as =
it's
> inited in some way then it means the guest OS wrote to it.  Then wr-prote=
ct
> will work..

The issue is when the discard happened before starting the snapshot. Write-=
protection won=E2=80=98t work and the zeroed content won=E2=80=98t be retai=
ned in the snapshot.

>=20
> MADV_DONTNEED during live snapshot seems to be a separate topic as you
> mentioned in the other thread.  For that, I agree we'd better simply let
> virtio_balloon_inhibited() to return true for live snapshot too just like
> postcopy.

Yes, but other issue.

>=20
> Thanks,
>=20
> --=20
> Peter Xu
>=20


