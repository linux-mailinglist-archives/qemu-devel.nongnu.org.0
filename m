Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF73D5D2D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:38:37 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82ge-0003or-OV
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m82fk-00039N-LJ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m82ff-0000g5-HO
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627313853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LqER6731hZG/kDfWp1OgqgmmLLoAbSM8WUq+mUjUYo=;
 b=Rp+3y/LvLUHrXmTeDkPvbT88HpP87sU18ToG11RrVW4ELGrWSvhbYxsXsAJLgavTorR/lO
 gGXf5pxrlpouNrJIk9J+SVfyyngDLIDgaxzHFLx/cZvQUweBiCjY8M8yIkJ14wlaYWP5Kx
 oj0Zl7THgWdBXhmNCffBzyi7iJBt/vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-_DOjvaSFOqyqnQsbvGg27Q-1; Mon, 26 Jul 2021 11:37:32 -0400
X-MC-Unique: _DOjvaSFOqyqnQsbvGg27Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 752F91853027;
 Mon, 26 Jul 2021 15:37:31 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.phx2.redhat.com [10.3.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2594669323;
 Mon, 26 Jul 2021 15:37:31 +0000 (UTC)
Date: Mon, 26 Jul 2021 10:37:29 -0500
From: Eric Blake <eblake@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1? v2 3/9] util/selfmap: Discard mapping on error
Message-ID: <20210726153729.zlkph3jrxr6sq4yf@redhat.com>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
 <20210725122416.1391332-4-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210725122416.1391332-4-richard.henderson@linaro.org>
User-Agent: NeoMutt/20210205-647-5d4e008
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 25, 2021 at 02:24:10AM -1000, Richard Henderson wrote:
> From clang-13:
> util/selfmap.c:26:21: error: variable 'errors' set but not used \
>     [-Werror,-Wunused-but-set-variable]
> 
> Quite right of course, but there's no reason not to check errors.
> 
> First, incrementing errors is incorrect, because qemu_strtoul
> returns an errno not a count -- just or them together so that
> we have a non-zero value at the end.
> 
> Second, if we have an error, do not add the struct to the list,
> but free it instead.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/selfmap.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


