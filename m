Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7786250A393
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:01:15 +0200 (CEST)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYJ0-0003Sw-AP
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhYHQ-0002lJ-0q
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhYHO-0002h6-Dr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650553173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KwnpPyBeRcmJr37esELy2Y/dGQntPsS0exU/fIwBEUU=;
 b=BeJFqqJF0FA3+b+MAcoAUg7Re7OaHw0HWU66pjyNXDT1VlbPlJLtxQ2qnUN7OGLEOkf/Q7
 rX8UNqdYD0do06JNLJjZSNTvt0GyanY+AvEftYoLGvHmGml+ylOGId2g4VhR6zVNsX6oXJ
 3H5kE7auk8wAKFD3e39mwzKww70lWTI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-GVcs5M8qPWGm3ZVYZjbhKQ-1; Thu, 21 Apr 2022 10:59:28 -0400
X-MC-Unique: GVcs5M8qPWGm3ZVYZjbhKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31BD92803044;
 Thu, 21 Apr 2022 14:59:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA7F7145BEE1;
 Thu, 21 Apr 2022 14:59:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8D97121E6A1F; Thu, 21 Apr 2022 16:59:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 10/17] vfio-user: run vfio-user context
References: <cover.1650379269.git.jag.raman@oracle.com>
 <1f71b01f49b461a41130ac9d19355344c3752f7d.1650379269.git.jag.raman@oracle.com>
Date: Thu, 21 Apr 2022 16:59:26 +0200
In-Reply-To: <1f71b01f49b461a41130ac9d19355344c3752f7d.1650379269.git.jag.raman@oracle.com>
 (Jagannathan Raman's message of "Tue, 19 Apr 2022 16:44:15 -0400")
Message-ID: <87zgkepjn5.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, dgilbert@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jagannathan Raman <jag.raman@oracle.com> writes:

> Setup a handler to run vfio-user context. The context is driven by
> messages to the file descriptor associated with it - get the fd for
> the context and hook up the handler with it
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qapi/misc.json            | 23 ++++++++++
>  hw/remote/vfio-user-obj.c | 95 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 117 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/misc.json b/qapi/misc.json
> index b83cc39029..f3cc4a4854 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -553,3 +553,26 @@
>  ##
>  { 'event': 'RTC_CHANGE',
>    'data': { 'offset': 'int', 'qom-path': 'str' } }
> +
> +##
> +# @VFU_CLIENT_HANGUP:
> +#
> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
> +# communication channel
> +#
> +# @id: ID of the TYPE_VFIO_USER_SERVER object
> +#
> +# @device: ID of attached PCI device

Is this the ID set with -device id=... and such?

> +#
> +# Since: 7.1
> +#
> +# Example:
> +#
> +# <- { "event": "VFU_CLIENT_HANGUP",
> +#      "data": { "id": "vfu1",
> +#                "device": "lsi1" },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
> +#
> +##
> +{ 'event': 'VFU_CLIENT_HANGUP',
> +  'data': { 'id': 'str', 'device': 'str' } }


