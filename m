Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA83C1954
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:42:29 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Yyi-0005gA-V2
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Yra-0001FO-SK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1YrY-0002Ye-AM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlTmgs9Mm/msJkAV+LC6cJVhXXCEW1d8HoCa++baFQw=;
 b=MiXyUTJIhnZMEWAmZ58ndwQFc/f2RnICuQNXP1934yuMAyw+/o4b4xcC3RdipXCx1WJwcS
 LHf2IiAdnI5vYaZpe9n8iem2DYZKDmcsCeh8hjxosS5HeDf62MLccadWHL9hXNw5lXQXyg
 C38iL+B18j39BHXuagq8uPcKjhOfjQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-VdPd0THEMrmZ-_3wALdc7A-1; Thu, 08 Jul 2021 14:35:00 -0400
X-MC-Unique: VdPd0THEMrmZ-_3wALdc7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 274CE807355
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:34:59 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF25E5D6A8;
 Thu,  8 Jul 2021 18:34:53 +0000 (UTC)
Date: Thu, 8 Jul 2021 13:34:52 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 05/18] crypto: fix gcrypt min version 1.8 regression
Message-ID: <20210708183452.3naac5lmhdr2um7d@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-6-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-6-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 10:59:11AM +0100, Daniel P. Berrangé wrote:
> The min gcrypt was bumped:
> 
>   commit b33a84632a3759c00320fd80923aa963c11207fc
>   Author: Daniel P. Berrangé <berrange@redhat.com>
>   Date:   Fri May 14 13:04:08 2021 +0100
> 
>     crypto: bump min gcrypt to 1.8.0, dropping RHEL-7 support
> 
> but this was accidentally lost in conflict resolution for
> 
>   commit 5761251138cb69c310e9df7dfc82c4c6fd2444e4
>   Author: Paolo Bonzini <pbonzini@redhat.com>
>   Date:   Thu Jun 3 11:15:26 2021 +0200
> 
>     configure, meson: convert crypto detection to meson
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


