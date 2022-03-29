Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCB4EAE96
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 15:36:42 +0200 (CEST)
Received: from localhost ([::1]:41102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZC1Y-0001Nj-UI
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 09:36:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBzW-0008Hy-Nq
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBzV-000571-0Q
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 09:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648560871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ax1pt8bougI3cdNSANcWdvvSYLw+SHdJbGsEnXqBzFQ=;
 b=Nz8NEosOxXA0pI/8Oit5RdNMnjDqsvqPRwIVp0bBRGJOxiNkkwBeUIw5ckDmfhbdGrr7X0
 xas2IRxc/yRIMEV8tSyItLNTDi4zNVh88FVvLlVtYTMFaSUaoEL74Mg8697HHRRnlQo6CF
 qJiZnS+MxXC63gjJD9HLb1Gf+gPQ070=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-RPA_i6n7NnimImVXp2zWOw-1; Tue, 29 Mar 2022 09:34:27 -0400
X-MC-Unique: RPA_i6n7NnimImVXp2zWOw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A72D811E90;
 Tue, 29 Mar 2022 13:34:27 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D9AE401E48;
 Tue, 29 Mar 2022 13:34:26 +0000 (UTC)
Message-ID: <8994a574-b9ff-efe8-d991-9726d680e1e0@redhat.com>
Date: Tue, 29 Mar 2022 15:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/4] virtio-ccw: move vhost_ccw_scsi to a separate file
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-3-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220328143019.682245-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/2022 16.30, Paolo Bonzini wrote:
> Remove unecessary use of #ifdef CONFIG_VHOST_SCSI, instead just use a
> separate file and a separate rule in meson.build.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/s390x/meson.build       |  1 +
>   hw/s390x/vhost-scsi-ccw.c  | 64 ++++++++++++++++++++++++++++++++++++++
>   hw/s390x/virtio-ccw-scsi.c | 47 ----------------------------
>   3 files changed, 65 insertions(+), 47 deletions(-)
>   create mode 100644 hw/s390x/vhost-scsi-ccw.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


