Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A97316833
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:42:08 +0100 (CET)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9pkt-0002st-D7
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9pjz-0002L1-8S
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l9pjx-0006qw-C1
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612964467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jLMdw15nIwOnAF4HMNEySx4jD6vBmZw6kMB/pmJMusk=;
 b=KH0WfzQN96eKPbDtMqqCdFj6cnYDK3zDoxQd4DZ3qmiKTrFkCX30wQH+aylyOm5QOxf9M1
 KgKyt9IXR1nVos3cNRPxzqZCqARZNQv2PpDh0KnqoRVPNpg+M2TGpn2vfyqgiirxzQ48QV
 V9DMZrbh2JfrE7v1htHqBm6YriHu/Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-SmfahjSkP2Kl5jmCLVo11w-1; Wed, 10 Feb 2021 08:41:05 -0500
X-MC-Unique: SmfahjSkP2Kl5jmCLVo11w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35672192AB9D;
 Wed, 10 Feb 2021 13:41:04 +0000 (UTC)
Received: from [10.36.112.23] (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91E9E60657;
 Wed, 10 Feb 2021 13:40:25 +0000 (UTC)
Subject: Re: [PATCH 0/2] failover: trivial cleanup and fix
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210206123955.2196514-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <a0997558-cdb7-fbd3-4a65-95c9840faefc@redhat.com>
Date: Wed, 10 Feb 2021 14:40:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210206123955.2196514-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, jfreimann@redhat.com,
 Laurent Vivier <laurent@vivier.eu>, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/02/2021 13:39, Laurent Vivier wrote:
> The first patch removes a duplicate assignment to allow_unplug_during_migrati=
> on,
> and simplify the code.
> 
> The second patch fixes a dangling object in failover_add_primary() that preve=
> nts
> to cleanup the internal structure after the object has been unplugged.
> 
> Laurent Vivier (2):
>   pci: cleanup failover sanity check
>   virtio-net: add missing object_unref()

I can collect these two patches via the trivial branch if there will be no PR for virtio
or PCI soon.

Michael?

Thanks,
Laurent


