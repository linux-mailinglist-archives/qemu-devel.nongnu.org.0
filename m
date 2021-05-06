Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1D3757F8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:55:40 +0200 (CEST)
Received: from localhost ([::1]:49016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legLj-0004fg-7P
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legIz-0002zQ-I2
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legIt-0006gH-HU
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620316362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yz0Zt/n+4EKJV7bJGG+ESu3rWqj5qiPM7gzWCuuKgGg=;
 b=KJmxEPmFyos1Dj30QV2RvmrQqkVxPlgh1iJ1SQE5LtiufGBheMrEvG0TwNbSYXqbUmQ3I3
 R6A/6MPZlhTL9thy6zzfo0W2CLujKHL+bmtqfn1sRRb/CfN9qhtnReIP3GTwwZIlm6cVUT
 kJPLKpQfJMTqM6ISdvCo5SBXhkMe4Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-VbYjLe8mNdC3wKUUeALArg-1; Thu, 06 May 2021 11:52:37 -0400
X-MC-Unique: VbYjLe8mNdC3wKUUeALArg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E50F801817;
 Thu,  6 May 2021 15:52:37 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 115F760862;
 Thu,  6 May 2021 15:52:35 +0000 (UTC)
Date: Thu, 6 May 2021 16:52:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
Subject: Re: [PATCH 0/2] virtiofsd: Enable xattr if xattrmap is used
Message-ID: <YJQQwcVgMiUWLQ5c@work-vm>
References: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Carlos Venegas (jose.carlos.venegas.munoz@intel.com) wrote:
> 
> Using xattrmap for Kata Containers we found that xattr is should be used
> or xattrmap wont work.  These patches enable xattr when -o xattrmap is
> used. Also, they add help for the xattrmap  option on `virtiofsd --help` output.

Queued.  You might like to submit some more patches to give the error
that Greg was suggesting and/or update some docs.

Dave

> Carlos Venegas (2):
>   virtiofsd: Allow use "-o xattrmap" without "-o xattr"
>   virtiofsd: Add help for -o xattr-mapping
> 
>  tools/virtiofsd/helper.c         | 3 +++
>  tools/virtiofsd/passthrough_ll.c | 1 +
>  2 files changed, 4 insertions(+)
> 
> -- 
> 2.25.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


