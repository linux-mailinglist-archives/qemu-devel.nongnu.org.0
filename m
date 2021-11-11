Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34344D5D0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:31:37 +0100 (CET)
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8Ir-0007IJ-2r
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:31:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ml8GS-0004HH-2Q
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:29:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ml8GO-0005SE-NO
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636630143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nw0Lpg7VG3+TInGkIL3IS+ZM9RTN/ImYNxQQ0z4AihI=;
 b=iC9LsxfVRyJ9bbXrikvv6jzyN/JOrOFb26m7aE7CzHG1j1bRA75VzNQlu6/IE6MXgb37C7
 ZbKJSB6GRmMuAf5EsTQhBO+gLNj+mVzKGVu/NyyoaHOc6AmHh4lPLSU2QTARUsaeAYTueo
 oczILUJKPpujIABN+S+fW1MSdVv/hKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-Qh3WPnhcP4anTkthMQnLiw-1; Thu, 11 Nov 2021 06:29:00 -0500
X-MC-Unique: Qh3WPnhcP4anTkthMQnLiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75F501006AA1;
 Thu, 11 Nov 2021 11:28:59 +0000 (UTC)
Received: from localhost (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 716A960854;
 Thu, 11 Nov 2021 11:28:56 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] virtio-gpu: do not byteswap padding
In-Reply-To: <20211111110604.207376-2-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-2-pbonzini@redhat.com>
User-Agent: Notmuch/0.33.1 (https://notmuchmail.org)
Date: Thu, 11 Nov 2021 12:28:54 +0100
Message-ID: <87pmr77wy1.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, alex.bennee@linaro.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11 2021, Paolo Bonzini <pbonzini@redhat.com> wrote:

> In Linux 5.16, the padding of struct virtio_gpu_ctrl_hdr has become a
> single-byte field followed by a uint8_t[3] array of padding bytes,
> and virtio_gpu_ctrl_hdr_bswap does not compile anymore.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/hw/virtio/virtio-gpu-bswap.h | 1 -
>  1 file changed, 1 deletion(-)

Looks like the right way to adapt to the changes.

Acked-by: Cornelia Huck <cohuck@redhat.com>


