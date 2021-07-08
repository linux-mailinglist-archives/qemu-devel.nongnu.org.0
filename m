Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495E3C1996
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:06:24 +0200 (CEST)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZLr-0005HA-5q
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZFU-0007x7-UK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:59:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZFP-0001qH-7j
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625770781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E41uRCB/MNNyKWoCltt+509B2pJUjjTTLtTIwsCxFvM=;
 b=cRmjD8pJE4njYQKVEedIZksN8D+r7W5gwqUD7XT1plQ/h9OAeHWTzq1Gtkz5HSw2w08YkQ
 PNemoF/Te3xqWuYtzuhukzb/OZUXu6RJaewVXmombAltrg1PFITtEB38+rWjxK1alZTBHA
 BORLycxmhzPaO17A+Xaq+Qeq2cu/8qQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-B_r2LcMTM0O9VoXl2Eprxw-1; Thu, 08 Jul 2021 14:59:38 -0400
X-MC-Unique: B_r2LcMTM0O9VoXl2Eprxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C12F0A40E1
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:59:35 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6FD1042A49;
 Thu,  8 Jul 2021 18:59:35 +0000 (UTC)
Date: Thu, 8 Jul 2021 13:59:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 12/18] crypto: flip priority of backends to prefer gcrypt
Message-ID: <20210708185933.5kis2vmvi45qsxjh@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-13-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-13-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Tue, Jul 06, 2021 at 10:59:18AM +0100, Daniel P. Berrangé wrote:
> Originally we preferred to use nettle, over gcrypt because

s/nettle, over gcrypt/nettle over gcrypt,/

> gnutls already links to nettle and thus it minimizes the
> dependencies. In retrospect this was the wrong criteria to
> optimize for.
> 
> Currently shipping versions of gcrypt have cipher impls that
> are massively faster than those in nettle and this is way
> more important.  The nettle library is also not capable of
> enforcing FIPS compliance, since it considers that out of
> scope. It merely aims to provide general purpose impls of
> algorithms, and usage policy is left upto the layer above,
> such as GNUTTLS.

GNUTLS

> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  meson.build | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

My meson skills are weak, but the change looks reasonable, and the
proof is in building things.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


