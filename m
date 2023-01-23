Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07818677886
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 11:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJtjH-0000hs-Fc; Mon, 23 Jan 2023 05:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pJtjD-0000g1-Ik
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pJtjB-0006MH-93
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 05:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674468420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PgWgxK09nEOPg70Djcm+QF9SqsnK4MjZ4Jsojvum89c=;
 b=aAGmU9yjVDoxx/prq8evAWPQx9IVV53BYzOH1uuoe0DDu/KeAPs2CVys7023IwCN4+wfzU
 0CzLbC5e1BqB+z3EKqdlIlurBDmEhHgs1E8Z/18lyBt9TdJeIHveTA6qAURkbKqy+Pug8U
 A1U1KXCo0h01CbjOrOVWCp/PsUF0d38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-yy8neSvlMtOE-Yu2KiPoFQ-1; Mon, 23 Jan 2023 05:06:56 -0500
X-MC-Unique: yy8neSvlMtOE-Yu2KiPoFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49571100F90D;
 Mon, 23 Jan 2023 10:06:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EC1040C1141;
 Mon, 23 Jan 2023 10:06:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 940E9180060E; Mon, 23 Jan 2023 11:06:54 +0100 (CET)
Date: Mon, 23 Jan 2023 11:06:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
Message-ID: <20230123100654.bqiauwjbkkqroq7f@sirius.home.kraxel.org>
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
 <20230123083755.1038286-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123083755.1038286-3-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi,

> Here is the flow of things from the Qemu side:
> - Call gl_scanout (to update the fd) and gl_draw_async just like
>   in the local display case.

Ok.

> - Additionally, create an update with the cmd set to QXL_CMD_DRAW
>   to trigger the creation of a new drawable (associated with the fd)
>   by the Spice server.
> - Wait (or block) until the Encoder is done encoding the content.
> - Unblock the pipeline once the async completion cookie is received.

Care to explain?  For qemu it should make a difference what spice-server
does with the dma-bufs passed (local display / encode video + send to
remote).

>  #ifdef HAVE_SPICE_GL
> +        } else if (spice_dmabuf_encode) {
> +            if (g_strcmp0(preferred_codec, "gstreamer:h264")) {
> +                error_report("dmabuf-encode=on currently only works and tested"
> +                             "with gstreamer:h264");
> +                exit(1);
> +            }

IMHO we should not hard-code todays spice-server capabilities like this.
For starters this isn't true for spice-server versions which don't (yet)
have your patches.  Also the capability might depend on hardware
support.  IMHO we need some feature negotiation between qemu and spice
here.

take care,
  Gerd


