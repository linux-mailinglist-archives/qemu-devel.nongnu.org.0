Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877282F4545
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:35:40 +0100 (CET)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzagt-0006jq-Is
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzaR5-0002zX-KW
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:19:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzaR3-00060t-Rw
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610522357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGPeJYUnIMFEoxP1qOfM2rSvoX/Q+cx3KBot9HbxzzM=;
 b=cJ5BDQnOelEHrrxuMuolw/FyPqxw7AOcGk2FCGLQx/y8jXio+T6JhMzAtIyYEc+7Wn18Rs
 pha6edEREP/Shzg+YZ2VxUKJpcDcC7rSWtIPPByeZkpywrlJFrN3GfB/iCobmX+9lb/ilb
 Xzhn7A7e+w9cT5v/Bec3ZlEvJuKJRX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-FCBYT3PxPTqES4y9iGTyEA-1; Wed, 13 Jan 2021 02:19:15 -0500
X-MC-Unique: FCBYT3PxPTqES4y9iGTyEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B49EC107ACF7;
 Wed, 13 Jan 2021 07:19:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A23F13470;
 Wed, 13 Jan 2021 07:19:06 +0000 (UTC)
Subject: Re: [PATCH 7/9] accel/kvm: avoid using predefined PAGE_SIZE
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
 <20201221005318.11866-8-jiaxun.yang@flygoat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c108febd-1fce-c66d-2140-002d8feb0db9@redhat.com>
Date: Wed, 13 Jan 2021 08:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221005318.11866-8-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 kvm@vger.kernel.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/2020 01.53, Jiaxun Yang wrote:
> As per POSIX specification of limits.h [1], OS libc may define
> PAGE_SIZE in limits.h.
> 
> To prevent collosion of definition, we discard PAGE_SIZE from
> defined by libc and take QEMU's variable.
> 
> [1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   accel/kvm/kvm-all.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 389eaace72..3feb17d965 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -58,6 +58,9 @@
>   /* KVM uses PAGE_SIZE in its definition of KVM_COALESCED_MMIO_MAX. We
>    * need to use the real host PAGE_SIZE, as that's what KVM will use.
>    */
> +#ifdef PAGE_SIZE
> +#undef PAGE_SIZE
> +#endif
>   #define PAGE_SIZE qemu_real_host_page_size

If I get that right, the PAGE_SIZE macro is only used one time in this 
file... so it's maybe easier to get rid of the macro completely and replace 
the single occurance with qemu_real_host_page_size directly?

  Thomas


