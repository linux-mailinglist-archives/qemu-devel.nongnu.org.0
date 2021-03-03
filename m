Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEA132B637
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:33:50 +0100 (CET)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNt7-0001pT-Kr
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHNmh-0003Ud-7m
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHNmf-0002kD-Nq
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614763629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uu1eKAjScsWWYJluUcEerE0W2AVzL8hP4eM7OmqzkPY=;
 b=CZsmCGJyi9oVvxPYUMVrxOmgC33p+Gt/MtVK8Y42pZTCGOvZD5/a/zb/OIBouRxyZ/zf7Z
 envA8yiXy4yMzMo9OgVMMY9LbjxBQl/Jjzsxd+qRH1gUGdJZV6/JhBkdhnrVhUwMERjt1K
 +aPOkKNX21/n5p6AllMsPErsCrpoJ9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-iojUftg0MuiA3q1_JjhVbQ-1; Wed, 03 Mar 2021 04:27:05 -0500
X-MC-Unique: iojUftg0MuiA3q1_JjhVbQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EBC3107ACC7;
 Wed,  3 Mar 2021 09:27:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-154.ams2.redhat.com
 [10.36.112.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A961F47B;
 Wed,  3 Mar 2021 09:27:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1180E1800D4D; Wed,  3 Mar 2021 10:27:01 +0100 (CET)
Date: Wed, 3 Mar 2021 10:27:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/2] coreaudio: Handle output device change
Message-ID: <20210303092700.xnvsdzn7ykpzkvvu@sirius.home.kraxel.org>
References: <20210301114554.9430-1-akihiko.odaki@gmail.com>
 <20210301114554.9430-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210301114554.9430-2-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

>      status = coreaudio_get_voice(&core->outputDeviceID);
>      if (status != kAudioHardwareNoError) {
> -        coreaudio_logerr2 (status, typ,
> -                           "Could not get default output Device\n");
> -        return -1;
> +        coreaudio_playback_logerr (status,
> +                                   "Could not get default output Device\n");
> +        return status;

This "pass status code to caller" change can and should be splitted to a
separate patch.

Likewise with the logging changes.

That makes the patch with the actual functional change to deal with the
device changes smaller and easier to review.

thanks,
  Gerd


