Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF04371F24
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 20:04:58 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcwD-0002sF-MU
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 14:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcsv-0000uO-DO
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldcsp-0005gR-E7
 for qemu-devel@nongnu.org; Mon, 03 May 2021 14:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620064886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qV0kb7xAqsNF0tEU9Aj1NkFSvQVLN0Zd2omeBXYwwXE=;
 b=WlOFBhLA9nnIFKQBMJS644FV0Vv8h4ap/d6uxkLxAa+13AMFfDM25qN+tSjVgzopGiCd5h
 Ql3TnoRLaw61YLxGEBUgLlOMOiGsI23VKf+q3+ea1RTEoJf98Si4X4jiGs5hEzkyoVFZu9
 y2F03lrtfGNpqQgj3bHq3aBHl3/Lb9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-XUMr-c4lOhGaw70a-cdHZg-1; Mon, 03 May 2021 14:01:24 -0400
X-MC-Unique: XUMr-c4lOhGaw70a-cdHZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 337E480ED9E;
 Mon,  3 May 2021 18:01:23 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C78F060C5D;
 Mon,  3 May 2021 18:01:22 +0000 (UTC)
Subject: Re: [RESEND PATCH 31/32] sgx-epc: Add the fill_device_info() callback
 support
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-32-yang.zhong@intel.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9c62797b-a96b-8777-dd4e-676a3e107964@redhat.com>
Date: Mon, 3 May 2021 13:01:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430062455.8117-32-yang.zhong@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, kai.huang@intel.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 1:24 AM, Yang Zhong wrote:
> Since there is no fill_device_info() callback support, and when we
> execute "info memory-devices" command in the monitor, the segfault
> will be found.
> 
> This patch will add this callback support and "info memory-devices"
> will show sgx epc memory exposed to guest. The result as below:
> 
> qemu) info memory-devices
> Memory device [sgx-epc]: "epc1"
>   memaddr: 0x180000000
>   size: 29360128
>   memdev: /objects/mem1
> Memory device [sgx-epc]: "epc2"
>   memaddr: 0x181c00000
>   size: 10485760
>   memdev: /objects/mem2
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---

> +++ b/qapi/machine.json
> @@ -1184,6 +1184,29 @@
>            }
>  }
>  
> +##
> +# @SgxEPCDeviceInfo:
> +#
> +# Sgx EPC state information
> +#
> +# @id: device's ID
> +#
> +# @memaddr: physical address in memory, where device is mapped
> +#
> +# @size: size of memory that the device provides
> +#
> +# @memdev: memory backend linked with device
> +#
> +# Since: 5.1

6.1

> +##
> +{ 'struct': 'SgxEPCDeviceInfo',
> +  'data': { '*id': 'str',
> +            'memaddr': 'size',
> +            'size': 'size',
> +            'memdev': 'str'
> +          }
> +}
> +
>  ##
>  # @MemoryDeviceInfo:
>  #
> @@ -1198,7 +1221,8 @@
>    'data': { 'dimm': 'PCDIMMDeviceInfo',
>              'nvdimm': 'PCDIMMDeviceInfo',
>              'virtio-pmem': 'VirtioPMEMDeviceInfo',
> -            'virtio-mem': 'VirtioMEMDeviceInfo'
> +            'virtio-mem': 'VirtioMEMDeviceInfo',
> +            'sgx-epc': 'SgxEPCDeviceInfo'
>            }
>  }
>  
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


