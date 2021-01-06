Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5A72EBDD8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:47:13 +0100 (CET)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8DY-0001qf-PH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx8CI-0000ze-Ry
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kx8CH-0003Tu-6r
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609937152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+iXBIzkXmPo74sItZ1ycPz0dBIXZDZRViF+pOAT1iE=;
 b=KgZvs0NFkW7G0FKPZYqpS0vCg+mmBIBfVRTpS168gzES2QGSSYndHd2Ty4nqUXR4BNLIUT
 XfVGtxvSUruYLQouUia0sTd+IusNvBeL6huDnthRb9Ty01ktTKIHGL8VPf+rG9FClamUxF
 +4FTnxMw49SM0R36wEXrQmHBNlxo33k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-KQZkQOevPwuLsos7fPpRgA-1; Wed, 06 Jan 2021 07:45:50 -0500
X-MC-Unique: KQZkQOevPwuLsos7fPpRgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D125D15724
 for <qemu-devel@nongnu.org>; Wed,  6 Jan 2021 12:45:49 +0000 (UTC)
Received: from [10.36.113.101] (ovpn-113-101.ams2.redhat.com [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EDE262464;
 Wed,  6 Jan 2021 12:45:42 +0000 (UTC)
Subject: Re: [PATCH 1/2] vhost-vdpa: fix "unsigned long long" error with stap
To: qemu-devel@nongnu.org
References: <20210105191721.120463-1-lvivier@redhat.com>
 <20210105191721.120463-2-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <577fc195-dd47-d70f-dacc-2f784600bf75@redhat.com>
Date: Wed, 6 Jan 2021 13:45:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105191721.120463-2-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/01/2021 20:17, Laurent Vivier wrote:
> The "%llu" format type is not understood by stap:
> 
> $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
> 
> parse error: invalid or missing conversion specifier
>           saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
>        source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)
>                                                                                                                  ^
> 
>   1 parse error.
>   WARNING: tapset "./qemu-system-x86_64-log.stp" has errors, and will be skipped
> 
> commit 35e28cb0f210 ("scripts/tracetool: silence SystemTap dtrace(1)
> long long warnings") has already fixed the problem for the dtrace format
> by dynamically replacing "unsigned long long" by "uint64_t", but as it
> seems the problem can happen with any format and this is the only
> occurrence of this type, simply replace it directly by "uint64_t" in the
> trace-events file.
> 
> Fixes: 778e67de4cd8 ("vhost-vdpa: add trace-events")
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/virtio/trace-events | 2 +-
>  hw/virtio/vhost-vdpa.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Ignore this patch, Daniel has proposed a better fix.

Thanks,
Laurent


