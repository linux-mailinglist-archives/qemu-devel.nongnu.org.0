Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6403602A7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 08:49:00 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWvoB-00032U-Ew
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 02:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWvn6-0002cU-NU
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 02:47:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWvn3-0003aT-0m
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 02:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618469267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uE7vYYyha21ujm72399oL/gHeLwr/GFUQzXRH1G46W8=;
 b=Xt/wD70crSNAgAhqNfEuFiyC8AEVDKjej548J++dEDzE12v1fsY/SF115goHscVya5dHGq
 WXF9Ju1xewe2xGLi1fivv7aSkFh7ajGkmigLuT1UTmD/PZ3gM8ecGE6kSV2IjTCeoLzLaZ
 3oo2cn9cirnAF+c044ri+rT2twlyNOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-mE3o1dhdMGeIOZguJbh3-g-1; Thu, 15 Apr 2021 02:47:42 -0400
X-MC-Unique: mE3o1dhdMGeIOZguJbh3-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AACD1883530;
 Thu, 15 Apr 2021 06:47:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8F3562AF7;
 Thu, 15 Apr 2021 06:47:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 458AC113525D; Thu, 15 Apr 2021 08:47:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 2/8] qapi/error: Use Python3-style super()
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-3-jsnow@redhat.com>
Date: Thu, 15 Apr 2021 08:47:31 +0200
In-Reply-To: <20210330171844.1197918-3-jsnow@redhat.com> (John Snow's message
 of "Tue, 30 Mar 2021 13:18:38 -0400")
Message-ID: <87im4ogi2k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/error.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
> index 126dda7c9b..38bd7c4dd6 100644
> --- a/scripts/qapi/error.py
> +++ b/scripts/qapi/error.py
> @@ -19,7 +19,7 @@ class QAPIError(Exception):
>  class QAPISourceError(QAPIError):
>      """Error class for all exceptions identifying a source location."""
>      def __init__(self, info, col, msg):
> -        Exception.__init__(self)
> +        super().__init__()
>          self.info = info
>          self.col = col
>          self.msg = msg

Missed in commit 2cae67bcb5 "qapi: Use super() now we have Python 3".

Reviewed-by: Markus Armbruster <armbru@redhat.com>


