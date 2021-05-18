Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987E387CFF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:59:53 +0200 (CEST)
Received: from localhost ([::1]:54940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj28O-0003lt-Ee
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lj1yx-0005BZ-6v
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:50:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lj1yu-0002yd-CY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 11:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621353002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2KJL1IVpSfdemBmp5Az222rmP8oHZCk+VRnKzV1yy8=;
 b=MNSP+8PWFqRRk7o2LNNnD+9tHgVP7JDDyM7p7agyGFp5O1cJj3fqEQNtYbX8AvUgx8ICDg
 06B13892KcC8AkRsgYzXMDh03NlVbxKMIXOOhgVPh9oFWjuQWo9nmsyTn5Jp17yVzGHzkM
 F9+SupJNMcitZYsInRu5qxAHowsLYFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-A3vnHAZ0Osy9dVzXHJmqHA-1; Tue, 18 May 2021 11:49:56 -0400
X-MC-Unique: A3vnHAZ0Osy9dVzXHJmqHA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F855107ACCD;
 Tue, 18 May 2021 15:49:55 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-30.ams2.redhat.com
 [10.36.112.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EA6D10016FF;
 Tue, 18 May 2021 15:49:53 +0000 (UTC)
Subject: Re: [PATCH] fw_cfg: Set the max fw_cfg mem read size to 8 bytes
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <1621341794-1041-1-git-send-email-yangxiaojuan@loongson.cn>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7e258317-2027-6c0f-1953-675f3aa1ee0c@redhat.com>
Date: Tue, 18 May 2021 17:49:51 +0200
MIME-Version: 1.0
In-Reply-To: <1621341794-1041-1-git-send-email-yangxiaojuan@loongson.cn>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/18/21 14:43, Xiaojuan Yang wrote:
> From: yangxiaojuan <yangxiaojuan@loongson.cn>
> 
> fw_cfg_data_read() func supports access widths from
> 1 to 8 bytes while the ops set the wrong read size.
> 
> Most arch use 8 bytes to send ram_size to bios.
> 
> Signed-off-by: yangxiaojuan <yangxiaojuan@loongson.cn>
> ---
>  hw/nvram/fw_cfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 9b8dcca4ea..242614152c 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -540,7 +540,7 @@ static const MemoryRegionOps fw_cfg_data_mem_ops = {
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -        .max_access_size = 1,
> +        .max_access_size = 8,
>          .accepts = fw_cfg_data_mem_valid,
>      },
>  };
> 

This patch conflicts with (adjacent) commits

- cfaadf0e89e7 ("fw_cfg_mem: introduce the "data_width" property",
2014-12-22) and

- 6c87e3d5967a ("fw_cfg_mem: expose the "data_width" property with
fw_cfg_init_mem_wide()", 2014-12-22)

Your board code is supposed to call the fw_cfg_init_mem_wide() function,
for setting the maximum access width.

In fact, I see a call to fw_cfg_init_mem_wide() in
"hw/mips/loongson3_virt.c" already, from commit c76b409fef19 ("hw/mips:
Add Loongson-3 machine support", 2021-01-04). (I'm only highlighting
this board because your email address is from domain "loongson.cn".)

What is the actual problem you're trying to solve?

Thanks
Laszlo


