Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B836C85A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:09:15 +0200 (CEST)
Received: from localhost ([::1]:49666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPKs-0003XQ-JC
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPGW-0007Br-Kz
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPGT-0008DP-0e
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619535880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h4162q/0uqkLXUOtErA2mfs44NsBvBNykNdvzns864Y=;
 b=EbSDXFNAbOL2/ZamjkNlP2Jojywd4kP1wJo/fZidU8HTcJOq9LcCNCUuCyc+2e+7Z/LQpl
 OiXJGl0NQuZzpy2jOV6g5OLrO7VFvVP3HvVOXNOkVkRcUjHs6Mne1NSHxDH5uD3aYRIwGQ
 17djCyQCV0vCaw08c9bydbrAbt+anZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-7BAw2vyNMY-Jtp-ksMPHrA-1; Tue, 27 Apr 2021 11:04:36 -0400
X-MC-Unique: 7BAw2vyNMY-Jtp-ksMPHrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AABC31008061
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 15:04:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 707A26060F;
 Tue, 27 Apr 2021 15:04:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C778F1800393; Tue, 27 Apr 2021 17:04:30 +0200 (CEST)
Date: Tue, 27 Apr 2021 17:04:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 4/9] ui/vdagent: core infrastructure
Message-ID: <20210427150430.ri2qq3kbcq3cyscb@sirius.home.kraxel.org>
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-5-kraxel@redhat.com>
 <CAMxuvazpGJdpdWMYa7a9M48yk48kkr8F-96HivkSvMfko8GPow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvazpGJdpdWMYa7a9M48yk48kkr8F-96HivkSvMfko8GPow@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> What about the endianness of the vdagent messages?
> 
> It looks like this was never well defined, but that it was settled on LE:
> https://gitlab.freedesktop.org/spice/linux/vd_agent/-/commit/99d9d3583143aef7143ec986cebe2980fdeeb776
> 
> It's worth checking or leaving a TODO, I suppose.

Ah, good to know, adding a comment and TODO item for now.

How does things look on the guest side?  Does vdagent work in bigendian
guests?  Which is pretty much s390x these days with even ppc moving to
little endian ...

take care,
  Gerd


