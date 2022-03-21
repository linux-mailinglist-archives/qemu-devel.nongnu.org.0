Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E323D4E2C78
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:39:44 +0100 (CET)
Received: from localhost ([::1]:44356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWK8G-0003Gh-0R
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:39:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWJy3-0004EK-S6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:29:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWJy1-000400-1P
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647876548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A9JnP6ONzlgICUDIOzfmcwk2lJnUAtFtVXHJrV8rC74=;
 b=XHUCuHbr9fCxsCxX8xp4QlbRRyrK/ZX8uu1w37ULlWQcqoIBIQ+wakhiZsuRl9cDzV6UiT
 jnQsgsp0V9Us4y/UwmLeG/NW9S2aj3PlH2bKhllZkxALuBEQ89BDJhQhxVPbxGVc1Vp/Dh
 OOyTPs94EzediGQleWZft6cDwX4a8nk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-Fw_RstxSP9SczW2Ysd-GiQ-1; Mon, 21 Mar 2022 11:29:05 -0400
X-MC-Unique: Fw_RstxSP9SczW2Ysd-GiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3B883C11C62;
 Mon, 21 Mar 2022 15:29:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30D20400E87A;
 Mon, 21 Mar 2022 15:29:04 +0000 (UTC)
Date: Mon, 21 Mar 2022 10:29:02 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 06/15] iotests: rebase qemu_io() on top of qemu_tool()
Message-ID: <20220321152902.tasnzpwo7b4ufqaa@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-7-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 04:36:46PM -0400, John Snow wrote:
> Rework qemu_io() to be analogous to qemu_img(); a function that requires
> a return code of zero by default unless disabled explicitly.
> 
> Tests that use qemu_io():
> 030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 205
> 209 219 236 245 248 254 255 257 260 264 280 298 300 302 304
> image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test
> migrate-during-backup migration-permissions
> 
> Test that use qemu_io_log():
> 242 245 255 274 303 307 nbd-reconnect-on-open
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> ---
> 
> Note: This breaks several tests at this point. I'll be fixing each
> broken test one by one in the subsequent commits. We can squash them all
> on merge to avoid test regressions.
> 
> (Seems like a way to have your cake and eat it too with regards to
> maintaining bisectability while also having nice mailing list patches.)

Interesting approach; it does appear to have made reviewing a bit
easier, so thanks for trying it.

I'll withhold actual R-b until the last squashed patch, but so far, I
haven't seen anything that causes me grief other than the lack of
bisectability that you already have documented how it will be
addressed.  [less wordy - this patch is incomplete, as advertised, but
looks good]

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


