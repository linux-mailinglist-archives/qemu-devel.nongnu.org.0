Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A772F1A91
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:10:54 +0100 (CET)
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzmP-0001Wh-Ub
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kyzkn-0000AP-Nb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kyzkm-0003TX-8f
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610381351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqZECK3bv/kq2PlxvYKy5vkzkPsMC3YF/nEVS5UP5IQ=;
 b=Vgjmw0nWVC5HoR3M30sRNV6nWu50D8R9oRR33cDWMlm083WXjYdPlwZ9oL9R8/pUnivedt
 eDzCULIqcdKt0MLN2FhfHXeSkBPFa5vWpym6icJ/YkJKtZu2+hNRZqvTy12Ktl8yY1LzBb
 O9L07k8iQbNlwdWXSOsO4XwxEKDvA/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-O2U0HcbVM36YveqpPWI5Bw-1; Mon, 11 Jan 2021 11:09:07 -0500
X-MC-Unique: O2U0HcbVM36YveqpPWI5Bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04077803622;
 Mon, 11 Jan 2021 16:09:03 +0000 (UTC)
Received: from [10.36.115.103] (ovpn-115-103.ams2.redhat.com [10.36.115.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA6B19C59;
 Mon, 11 Jan 2021 16:08:39 +0000 (UTC)
Subject: Re: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-2-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e8da7869-1c39-128a-b494-09ddc0d6b0e4@redhat.com>
Date: Mon, 11 Jan 2021 17:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210111152020.1422021-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Amit Shah <amit@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.01.21 16:20, Philippe Mathieu-Daudé wrote:
> runstate_check() returns a boolean. runstate_is_running()
> returns what runstate_check() returns, also a boolean.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/runstate.h | 2 +-
>  softmmu/runstate.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index e557f470d42..3ab35a039a0 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -6,7 +6,7 @@
>  
>  bool runstate_check(RunState state);
>  void runstate_set(RunState new_state);
> -int runstate_is_running(void);
> +bool runstate_is_running(void);
>  bool runstate_needs_reset(void);
>  bool runstate_store(char *str, size_t size);
>  
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 636aab0addb..c7a67147d17 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
>      current_run_state = new_state;
>  }
>  
> -int runstate_is_running(void)
> +bool runstate_is_running(void)
>  {
>      return runstate_check(RUN_STATE_RUNNING);
>  }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


