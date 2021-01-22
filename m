Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5A300374
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:50:47 +0100 (CET)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vtm-0006oL-ND
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2vsp-0006O0-Mj
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l2vso-0003dn-41
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611319785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miWtfQhLtNY+cV2HCDVarYLDL/ABb0e8TvMmACw3G2E=;
 b=SxDu3RBGNAislDaNpfaoH7lVXN7bP9pzjUNhrRinmfi/lmZVyYc+E59F5GFBfT+/3opwht
 dd0X6mJGqefWvn8RY7ZVCovPfqXAUgKDeXpsGA7TXwN8Ir3OeuPlFVN0z5GXpGJ6Gk2+H2
 U24XWi27Q8W47rytBBuYfsmhMbKPhLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-CtRffNChPg2FBA1607mzlg-1; Fri, 22 Jan 2021 07:49:43 -0500
X-MC-Unique: CtRffNChPg2FBA1607mzlg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1243C107ACE4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:49:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-163.ams2.redhat.com
 [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 534796EF51;
 Fri, 22 Jan 2021 12:49:39 +0000 (UTC)
Subject: Re: [PULL 10/11] vnc: move initialization to
 framebuffer_update_request
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
 <20210115102424.1360437-11-kraxel@redhat.com>
 <26961441-e25b-25a1-b2e7-a6bb6a439022@redhat.com>
 <20210122084621.rdfxbamfzyc7aaft@sirius.home.kraxel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b139af38-cca4-452f-2cfa-62bbf88eae8f@redhat.com>
Date: Fri, 22 Jan 2021 13:49:38 +0100
MIME-Version: 1.0
In-Reply-To: <20210122084621.rdfxbamfzyc7aaft@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/22/21 09:46, Gerd Hoffmann wrote:
>> This patch breaks QEMU for me.
> 
>> The symptom is the following: in virt-manager, the display remains dead
>> (black), when I start an OVMF guest. At the same time, unusually high
>> CPU load can be seen on the host; it makes me think that virt-manager is
>> trying, in a busy loop, to complete the VNC handshake, or some such.
>> Ultimately, although the guest boots up fine, virt-manager gives up, and
>> the display window says "Viewer was disconnected".
> 
> It is the vnc_colordepth() call. Seems gtk-vnc sends a update request
> with incremental=0 as response to the VNC_ENCODING_WMVi message.  So
> sending that as response to an incremental=0 update request creates an
> endless loop ...

Interesting; I saw that commit 9e1632ad07ca *added* (as opposed to
*moving*) the vnc_colordepth() call; I thought it was a relatively
insignificant bit...

I'll report back on your separately posted patch.

Thanks!
Laszlo


> 
> take care,
>   Gerd
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index d429bfee5a65..0a3e2f4aa98c 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2041,7 +2041,6 @@ static void framebuffer_update_request(VncState *vs, int incremental,
>      } else {
>          vs->update = VNC_STATE_UPDATE_FORCE;
>          vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
> -        vnc_colordepth(vs);
>          vnc_desktop_resize(vs);
>          vnc_led_state_change(vs);
>          vnc_cursor_define(vs);
> 


