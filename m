Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1943C5575DF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:49:25 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4IWg-0008VA-Rs
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o4ISM-0006zb-TD
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:44:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o4ISI-0006in-NS
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655973890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D2C/xGzcqaWguAIF9BC1lYERda5El5gZBjeZJsmgufI=;
 b=J/ok1NHJ0sLyuEwjSVKyI00svOlu3UAzG/Mx8+rnuNZ9okXNVEfnkU1UzLiOkkpHS8ZLNs
 mp42IK7exH6lEjoTqZIKMUojOKzgR5uAl7T09Vy1N20MiWIg2g9XG9BPRPh6RWLgMCJ3dw
 RXm8U/91eT2EBOuxt8iX2Yp3ge733kM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-1vzGPSZBOuiaUVPV8n4lWw-1; Thu, 23 Jun 2022 04:44:47 -0400
X-MC-Unique: 1vzGPSZBOuiaUVPV8n4lWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A705A80174C;
 Thu, 23 Jun 2022 08:44:46 +0000 (UTC)
Received: from localhost (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62B8F404E4DC;
 Thu, 23 Jun 2022 08:44:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] pc-bios/s390-ccw/virtio: Read device config after
 feature negotiation
In-Reply-To: <20220623071131.412457-3-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20220623071131.412457-1-thuth@redhat.com>
 <20220623071131.412457-3-thuth@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 23 Jun 2022 10:44:45 +0200
Message-ID: <87bkuj93b6.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23 2022, Thomas Huth <thuth@redhat.com> wrote:

> Feature negotiation should be done first, since some fields in the
> config area can depend on the negotiated features and thus should
> rather be read afterwards.

I suppose we don't negotiate any features that might affect the size of
the config space? Anyway, restricting ourselves to the minimum length
should be fine.

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/virtio.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/pc-bios/s390-ccw/virtio.c b/pc-bios/s390-ccw/virtio.c
> index 4e85a2eb82..0e92e994df 100644
> --- a/pc-bios/s390-ccw/virtio.c
> +++ b/pc-bios/s390-ccw/virtio.c
> @@ -262,10 +262,6 @@ void virtio_setup_ccw(VDev *vdev)
>      rc = run_ccw(vdev, CCW_CMD_WRITE_STATUS, &status, sizeof(status), false);
>      IPL_assert(rc == 0, "Could not write DRIVER status to host");
>  
> -    IPL_assert(
> -        run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false) == 0,
> -       "Could not get block device configuration");
> -
>      /* Feature negotiation */
>      for (i = 0; i < ARRAY_SIZE(vdev->guest_features); i++) {
>          feats.features = 0;
> @@ -278,6 +274,9 @@ void virtio_setup_ccw(VDev *vdev)
>          IPL_assert(rc == 0, "Could not set features bits");
>      }
>  
> +    rc = run_ccw(vdev, CCW_CMD_READ_CONF, &vdev->config, cfg_size, false);
> +    IPL_assert(rc == 0, "Could not get block device configuration");

Since you move this anyway: s/block device/boot device/ ?

> +
>      for (i = 0; i < vdev->nr_vqs; i++) {
>          VqInfo info = {
>              .queue = (unsigned long long) ring_area + (i * VIRTIO_RING_SIZE),

Related to feature negotiation: It seems that the bios currently
supports legacy virtio only, doesn't it? It's probably fine for now, but
there might be a way in the future to disable legacy virtio for all
devices in QEMU, so we'll probably want to add virtio-1 support some
day.


