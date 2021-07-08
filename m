Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6DC3C195A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:45:07 +0200 (CEST)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Z1F-0002cP-FC
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Ysm-0002lk-Ov
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Ysl-0002yP-1s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psd7pt6dT106ryH+/A0Qwsyh7BVyMlHPGVCskCBZPPk=;
 b=MowoT1BYd8e7c73evNrN1+i4o09DP7dtYSLY4Cf80vIumCQpEcBkewLi3BVVOufW3FBTjP
 pglC80s486SwRfskdveLs1YqbbjnCNPkl3XmrHBlmgAjQgYXBlZDHUa1ivVw3zsk7I98/o
 biTC/BMtrWx2CbNryEpFsmtDBoDFpOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567--YiObZ1_OwiAONtPx9Whww-1; Thu, 08 Jul 2021 14:36:15 -0400
X-MC-Unique: -YiObZ1_OwiAONtPx9Whww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E29D80006E
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:36:14 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42FA960C4A;
 Thu,  8 Jul 2021 18:36:10 +0000 (UTC)
Date: Thu, 8 Jul 2021 13:36:08 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 06/18] crypto: drop gcrypt thread initialization code
Message-ID: <20210708183608.ldkrzmxwb4ejs5yg@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-7-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-7-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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

On Tue, Jul 06, 2021 at 10:59:12AM +0100, Daniel P. Berrangé wrote:
> This is only required on gcrypt < 1.6.0, and is thus obsolete
> since
> 
>   commit b33a84632a3759c00320fd80923aa963c11207fc
>   Author: Daniel P. Berrangé <berrange@redhat.com>
>   Date:   Fri May 14 13:04:08 2021 +0100
> 
>     crypto: bump min gcrypt to 1.8.0, dropping RHEL-7 support
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/init.c | 62 ---------------------------------------------------
>  1 file changed, 62 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


