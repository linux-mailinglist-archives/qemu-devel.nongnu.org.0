Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2128EDAF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 09:26:12 +0200 (CEST)
Received: from localhost ([::1]:36346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSxeM-0000rr-Ni
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 03:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kSxd0-0000JF-Et
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 03:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kSxcy-0006wg-8e
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 03:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602746682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpozT0OzfNMaQ26/HtTmi2XwmEEuqsW9fcNSoIFyDQE=;
 b=HKirFXLQzsLjGLhmr5NfkEYBizg6yEL492xg0C/WUkXXwXpHFjJ03gYhsQoi3SPVm+UNCp
 iOPYbVedDhHSlLbcOIpp0qsP1jSt6yLcpMB0lW/3L8TgIJx3uF7Y/whgBcvPKNA21dtE5C
 nhNBP4uPK/QtcriW+PkmV+hoquT8eRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-ENYxhzg4Oh2MQD9iZLBJ2w-1; Thu, 15 Oct 2020 03:24:39 -0400
X-MC-Unique: ENYxhzg4Oh2MQD9iZLBJ2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B2471015CAA;
 Thu, 15 Oct 2020 07:24:38 +0000 (UTC)
Received: from [10.72.13.96] (ovpn-13-96.pek2.redhat.com [10.72.13.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D66855D9CD;
 Thu, 15 Oct 2020 07:24:31 +0000 (UTC)
Subject: Re: [PATCH] vhost-vdpa: negotiate VIRTIO_NET_F_STATUS with driver
To: Si-Wei Liu <si-wei.liu@oracle.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <1601582985-14944-1-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a0326690-31c1-60b3-b31e-99b1e6571c52@redhat.com>
Date: Thu, 15 Oct 2020 15:24:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1601582985-14944-1-git-send-email-si-wei.liu@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/10/2 上午4:09, Si-Wei Liu wrote:
> Vendor driver may not support or implement config
> interrupt delivery for link status notifications.
> In this event, vendor driver is expected to NACK
> the feature, but guest will keep link always up.
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> ---
>   net/vhost-vdpa.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index bc0e0d2..55e01d9 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -55,6 +55,7 @@ const int vdpa_feature_bits[] = {
>       VIRTIO_F_IOMMU_PLATFORM,
>       VIRTIO_F_RING_PACKED,
>       VIRTIO_NET_F_GUEST_ANNOUNCE,
> +    VIRTIO_NET_F_STATUS,
>       VHOST_INVALID_FEATURE_BIT
>   };
>   


Acked-by: Jason Wang <jasowang@redhat.com>

Michael, do you want to pick this patch or I will do that?

Thanks


