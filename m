Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A55C2051CD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 14:07:33 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnhi8-0006e1-6x
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 08:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jnhOe-00017D-ML
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 07:47:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48678
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jnhOd-0007ZY-4z
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 07:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592912842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HvGP4aYF9pmcQ/UjWh6TZo+I3Cs+gW4pxBqKOmj+cfM=;
 b=CDemA28FRxbUtPDojOseQ7XViOamx1EsYRHkLYUTuuVfM7l6tWh/BhrHxA7EJachs7DaLC
 FjtGMLl39DjllUglOrzArTyXZ/x7+6Ka6M6nqW4UMCGe1G6jldg0Qbi0k8RoPUG4p90yUW
 7D5UStAhTNFdKFqfWmxQI1B2VzpBNr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-7xMz8Q93P4CBRY9xCOnjIg-1; Tue, 23 Jun 2020 07:47:18 -0400
X-MC-Unique: 7xMz8Q93P4CBRY9xCOnjIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2906464;
 Tue, 23 Jun 2020 11:47:17 +0000 (UTC)
Received: from linux.fritz.box (ovpn-115-78.ams2.redhat.com [10.36.115.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 318DF7CCC0;
 Tue, 23 Jun 2020 11:47:16 +0000 (UTC)
Date: Tue, 23 Jun 2020 13:47:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 0/6] block: add block-dirty-bitmap-populate job
Message-ID: <20200623114714.GH5853@linux.fritz.box>
References: <20200619195621.58740-1-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619195621.58740-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, pkrempa@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.06.2020 um 21:56 hat Eric Blake geschrieben:
> [From John's original cover letter:]
> This is a new (very small) block job that writes a pattern into a
> bitmap. The only pattern implemented is the top allocation information.
> 
> This can be used to "recover" an incremental bitmap chain if an external
> snapshot was taken without creating a new bitmap first: any writes made
> to the image will be reflected by the allocation status and can be
> written back into a bitmap.
> 
> This is useful for e.g. libvirt managing backup chains if a user creates
> an external snapshot outside of libvirt.
> 
> v3:
>  - Addressed a bit more feedback
>  - Make it easier to decide if we want an x- prefix if we think there
>  are more tweaks to be made to the interface
>  - Drop dependency on John's JobRunner iotest series
>  - Renumber the new iotest
> 
> I know there was a lot of discussion about whether there are
> optimizations to be made with populating directly into the target
> bitmap rather than into a temporary that then gets merged in at the
> completion of the job, but the QMP aspect seems fairly stable.  Even
> so, we may still want to consider using an x- prefix until we know for
> sure whether libvirt can make decent use of the interface.

Fair enough, as long as everyone agrees that the QMP aspect includes
that merging the bits only at the end of the job is an implementation
detail and not something that client may rely on.

Kevin


