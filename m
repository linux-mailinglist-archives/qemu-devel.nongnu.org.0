Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB329288E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 15:49:41 +0200 (CEST)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUVXg-0001Xt-FZ
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 09:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kUVW3-00010H-8n
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 09:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kUVW1-0007ui-1k
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 09:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603115273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6v7bXK5Xi2W1YIyZRWdT01L4H3oX50uXa+ACYG7MtI=;
 b=WSOTG9lBsiyf3q+eXqADFJUt66IeOVZ80gc1E573RY40VHVhpsCtZm4FuIdlNOGS12diPY
 UV3UGYYfCR+LVb9AVskIm8Jsjk5axw+87WnlAs7egBZa5KSn10D8l5RDhK6Imjs+Ly0Kta
 XSS1JTeE/8NEmi2LZ3QdMfqo9wXQBmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-XB6yqlhwNIG1zgY28xaX0g-1; Mon, 19 Oct 2020 09:47:51 -0400
X-MC-Unique: XB6yqlhwNIG1zgY28xaX0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD271803652;
 Mon, 19 Oct 2020 13:47:49 +0000 (UTC)
Received: from w520.home (ovpn-112-77.phx2.redhat.com [10.3.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 109AE10013C1;
 Mon, 19 Oct 2020 13:47:45 +0000 (UTC)
Date: Mon, 19 Oct 2020 07:47:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhengui li <lizhengui@huawei.com>
Subject: Re: [PATCH] vfio: fix incorrect print type
Message-ID: <20201019074745.4a72f8ac@w520.home>
In-Reply-To: <1603114337-28056-1-git-send-email-lizhengui@huawei.com>
References: <1603114337-28056-1-git-send-email-lizhengui@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, xieyingtai@huawei.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Oct 2020 13:32:17 +0000
Zhengui li <lizhengui@huawei.com> wrote:

> fix incorrect print type.

Why is it incorrect, describe your change.  Patches must include a
Signed-off-by to adhere to the developer's certificate of origin.
Thanks,

Alex

> ---
>  hw/vfio/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 13471ae..acc3356 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -203,7 +203,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
>          buf.qword = cpu_to_le64(data);
>          break;
>      default:
> -        hw_error("vfio: unsupported write size, %d bytes", size);
> +        hw_error("vfio: unsupported write size, %u bytes", size);
>          break;
>      }
>  
> @@ -260,7 +260,7 @@ uint64_t vfio_region_read(void *opaque,
>          data = le64_to_cpu(buf.qword);
>          break;
>      default:
> -        hw_error("vfio: unsupported read size, %d bytes", size);
> +        hw_error("vfio: unsupported read size, %u bytes", size);
>          break;
>      }
>  


