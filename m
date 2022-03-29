Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281074EB0F7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:48:12 +0200 (CEST)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZE4o-00023f-SR
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:48:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZE2q-0000PH-V9
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:46:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZE2o-00038C-Gj
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648568764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TS4EZM3Rfoz6Bb7fkuA+Y4WqkBBCEey6tX4cuc+kwsM=;
 b=InJX+Cy/VgpdZ9Xf0WE9/cOwIB0+tymEDzjGfdyWEsqLFalw+Pen1chu721OvubQI+k7Xw
 gawXAPJPTjUEqlj1cmnX2d2sqNG3jZ4MDSAd773wJhBC/Yvbt9dL2H5oBVMhPzLJ+DE69l
 VGdF2vyn7ZBtP8dJdOkrJYgEZySS4QM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-tsfspy4WMEax5qW5nXk48w-1; Tue, 29 Mar 2022 11:45:58 -0400
X-MC-Unique: tsfspy4WMEax5qW5nXk48w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB6EE18E5341
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 15:45:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37B4AC15E71;
 Tue, 29 Mar 2022 15:45:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1874021E691D; Tue, 29 Mar 2022 17:45:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Subject: Re: [PATCH v3 09/14] qapi: fix examples: SHUTDOWN and RESET events
References: <20220328140604.41484-1-victortoso@redhat.com>
 <20220328140604.41484-10-victortoso@redhat.com>
Date: Tue, 29 Mar 2022 17:45:56 +0200
In-Reply-To: <20220328140604.41484-10-victortoso@redhat.com> (Victor Toso's
 message of "Mon, 28 Mar 2022 16:05:59 +0200")
Message-ID: <875ynw224r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Victor Toso <victortoso@redhat.com> writes:

> Example output lacks mandatory member @reason.  Provide it.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> Reviewed-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/run-state.json | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 43d66d700f..1b9f64c9cd 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -150,7 +150,8 @@
>  #
>  # Example:
>  #
> -# <- { "event": "SHUTDOWN", "data": { "guest": true },
> +# <- { "event": "SHUTDOWN",
> +#      "data": { "guest": true, "reason": "guest-shutdown" },
>  #      "timestamp": { "seconds": 1267040730, "microseconds": 682951 } }
>  #
>  ##
> @@ -188,7 +189,8 @@
>  #
>  # Example:
>  #
> -# <- { "event": "RESET", "data": { "guest": false },
> +# <- { "event": "RESET",
> +#      "data": { "guest": false, "reason": "guest-reset" },
>  #      "timestamp": { "seconds": 1267041653, "microseconds": 9518 } }
>  #
>  ##

Reviewed-by: Markus Armbruster <armbru@redhat.com>


