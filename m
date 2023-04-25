Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78846EE2C3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:20:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIZG-0002nm-A5; Tue, 25 Apr 2023 09:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1prIZ9-0002dC-5r
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1prIZ7-0007bL-Jq
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qwff0QfFDBS4HQaM+Uym5fSdMtexnZiD8oQPYI1BZv0=;
 b=gb+RWQT2S0VtZ0NS8zkHGhI1n8ADRG4OJAy0ZVVv441vwuYomXZjsRNsA6HHFNBADgRuYx
 LnEciSjiNOkGs9CnXe7YNAX1LMSXtI9cuj1INXSodZ9hL2EtRZVpxrupDaqEyT5aAkEFzE
 yqhNPtGoiKEJnVThKJDbMapBAXzCUP0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-4HyDWOm_NIGsaslUJmaJLQ-1; Tue, 25 Apr 2023 09:18:37 -0400
X-MC-Unique: 4HyDWOm_NIGsaslUJmaJLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FD07A0F380;
 Tue, 25 Apr 2023 13:18:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBF88C15BA0;
 Tue, 25 Apr 2023 13:18:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6A21E180099C; Tue, 25 Apr 2023 15:18:35 +0200 (CEST)
Date: Tue, 25 Apr 2023 15:18:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 philmd@linaro.org, david@redhat.com, peterx@redhat.com, pbonzini@redhat.com, 
 marcel.apfelbaum@gmail.com, den-plotnikov@yandex-team.ru,
 Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] pci: make ROM memory resizable
Message-ID: <mlfkmafaoqkxtipgqspet7s2eoirmfspiltvjqbjd25iqkopbc@qkhsxgq4buf6>
References: <20230424203647.94614-1-vsementsov@yandex-team.ru>
 <20230425031348-mutt-send-email-mst@kernel.org>
 <kwqw7gyagjlykfvdyiwlfr3tuepofr5o7e2mtute6dmltbzkg6@jy3ea7jlvllc>
 <bc9f987b-e66c-ea23-1ff0-c921b7de14ad@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc9f987b-e66c-ea23-1ff0-c921b7de14ad@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> > If you supply your own versions for some reason you must make sure
> > they have identical size on all host machines.
> 
> on my ubuntu 22.04:
> 
> dpkg -L ipxe-qemu | grep efi-virtio
> /usr/lib/ipxe/qemu/efi-virtio.rom
> 
> ls -lthr /usr/lib/ipxe/qemu/efi-virtio.rom
> -rw-r--r-- 1 root root 512K Jan 13  2022 /usr/lib/ipxe/qemu/efi-virtio.rom
> 
> If look inside the file, it's filled with ffff starting from 0x32400

So it would actually fit into 256k without problems.
Strange ...

I guess that one is for ubuntu to sort out.

take care,
  Gerd


