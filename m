Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DA2FD23A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:19:37 +0100 (CET)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EKe-0007Wc-Kn
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2EJK-0006Bo-41
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2EJI-0003hD-GY
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611152291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59tt9dsnl7EnLkuJn1XsKf1j7YDtGubtHyJNWwY0o/I=;
 b=FamE2HKB6fL4prndXVHBwhOcdZG1y5XiDBZbBSXn/gjZ5FAUugM8/yVdNTjtrs+HBt8vo0
 lh7SlSnwU4/L+uaNbNrtq/kXy4bNxUCs5iLdMfUnktTzFGG5V+0w5t7tc98usY8q3A1OHT
 9zhVzf3opDd2BSWN0yasmctxlbsOoTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-ntHoheUvNsO_vj8OTfkbew-1; Wed, 20 Jan 2021 09:18:08 -0500
X-MC-Unique: ntHoheUvNsO_vj8OTfkbew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C966D801817
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 14:18:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C43905C8A7;
 Wed, 20 Jan 2021 14:18:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2AEB9180062C; Wed, 20 Jan 2021 15:18:00 +0100 (CET)
Date: Wed, 20 Jan 2021 15:18:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 3/3] console: make QMP/HMP screendump run in coroutine
Message-ID: <20210120141800.73j3xdew7ahvdewg@sirius.home.kraxel.org>
References: <20201027133602.3038018-1-marcandre.lureau@redhat.com>
 <20201027133602.3038018-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201027133602.3038018-4-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 05:36:02PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Thanks to the monitors' coroutine support (merge commit b7092cda1b3),
> the screendump handler can trigger a graphic_hw_update(), yield and let
> the main loop run until update is done. Then the handler is resumed, and
> ppm_save() will write the screen image to disk in the coroutine context.
> 
> The IO is still blocking though, as the file is set blocking so far,
> this could be addressed by some future change (with other caveats).
> 
> Related to:
> https://bugzilla.redhat.com/show_bug.cgi?id=1230527
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Hmm, just noticed that with this patch applied screendump hangs for vms
with "-device qxl" ("-device qxl-vga" works fine).

Can you have a look?

thanks,
  Gerd


