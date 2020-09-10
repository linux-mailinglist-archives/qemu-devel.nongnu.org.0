Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FC2645CD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 14:13:55 +0200 (CEST)
Received: from localhost ([::1]:49338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGLSb-0000GY-QU
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 08:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kGLRn-0008Bq-Po
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 08:13:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35092
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kGLRg-0007Nw-5m
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 08:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599739974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wt43Kdseg0nHvzpqwS3DQiGlvgk7gNShOQT4U8Bk5js=;
 b=TMr+In2Yxi9oWn6ylqRXf5NIP4RrYnaPmU0jdhn9WNt+z6XuOxcoz0+h5ld6r7byv5rwzD
 5l5JaqRfridjR/fk00AB3s7b+be/WnofGyq6E2Tq9AadSTbeaIXaGUEri8I7tKAZSKJo1q
 Nt9vJ8lLhjwgjVWjJLNprww8N7FYGUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-xp-_CIyGPAKXkQD4E6Xs7A-1; Thu, 10 Sep 2020 08:12:52 -0400
X-MC-Unique: xp-_CIyGPAKXkQD4E6Xs7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8EEEA1C1;
 Thu, 10 Sep 2020 12:12:51 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-29.ams2.redhat.com [10.36.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 374EE1A914;
 Thu, 10 Sep 2020 12:12:50 +0000 (UTC)
Date: Thu, 10 Sep 2020 14:12:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] qcow2: Return the original error code in
 qcow2_co_pwrite_zeroes()
Message-ID: <20200910121248.GF7100@linux.fritz.box>
References: <20200909123739.719-1-berto@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20200909123739.719-1-berto@igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 03:02:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.09.2020 um 14:37 hat Alberto Garcia geschrieben:
> This function checks the current status of a (sub)cluster in order to
> see if an unaligned 'write zeroes' request can be done efficiently by
> simply updating the L2 metadata and without having to write actual
> zeroes to disk.
> 
> If the situation does not allow using the fast path then the function
> returns -ENOTSUP and the caller falls back to writing zeroes.
> 
> If can happen however that the aforementioned check returns an actual
> error code so in this case we should pass it to the caller.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


