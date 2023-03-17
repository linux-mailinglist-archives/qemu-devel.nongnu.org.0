Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AED06BE8CD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 13:07:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd8qC-0000vt-FP; Fri, 17 Mar 2023 08:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8q9-0000uW-R2
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8q6-0004jn-Ut
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlVkuVds0BzmioA6HMJHcmCMJQMnqByBFchTL1H/jl8=;
 b=drr482HbX2c7NU+p1K5kDbUc4gijM1kqDslEaCpl5ToDmT7tBK8FpXNV6wpS5yU7j8m6cO
 z37Bq98hEnMExgCd6TIxa7ZraApntfARSPyC7G7vhYuezPaC9AGo5cXwOiVBSD2dWPDZhs
 JyEkE9khSxzcPvBrYrmXbxuqcRTdHoo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-dbjzUi5AOxODSXOAySXaHw-1; Fri, 17 Mar 2023 08:05:41 -0400
X-MC-Unique: dbjzUi5AOxODSXOAySXaHw-1
Received: by mail-wr1-f71.google.com with SMTP id
 b9-20020a05600018a900b002cfe70737d2so765463wri.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 05:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xlVkuVds0BzmioA6HMJHcmCMJQMnqByBFchTL1H/jl8=;
 b=gTUKwwTUteMPg6I1WmDgznBVgO499qDYhxYxN/D8WKFd/Bxmk18M8FU9lH1YF2k8D2
 SrCQlwztWLmY5dDKCEC+SuROEYnJ7RwBLZMIPWg/gfC0k3patgEYlt47fZpn4fJpb4Jn
 XsTgTMFeCsZ8kYx889igJA7nloTmOSyOXqgbfcxTaDQLFQqKLPdUb1f+yMx/5CdQFdV+
 BpqGrjDPCZt+wK4vGdiy25GyKzPUvHWkN26KMXTT/g7aNZLBXHTJrVkSWDj5gKTUZfj2
 CVPWn7+wmPzOKDC9G2XuTAcfEBaogWMsL/Vfg49DMofBmd5KemtAHBSsvNRsiat83p5w
 2Shg==
X-Gm-Message-State: AO0yUKWaFf2z5R8x9nH6BkDNKNOfQnaRfU+f6efGcHNtFRua4kjp4JAm
 leJoZyyu5/VRIczcqYQ9O/7SJdCu052u/DjNaTTQAF91/hqhj+JyFQDb4sVYFRfe/Nxlwz77ZNd
 Tu7c6q7Cj938lRWU=
X-Received: by 2002:a05:600c:4746:b0:3ed:26fa:6ed0 with SMTP id
 w6-20020a05600c474600b003ed26fa6ed0mr2204835wmo.0.1679054739690; 
 Fri, 17 Mar 2023 05:05:39 -0700 (PDT)
X-Google-Smtp-Source: AK7set/rGd+QwS67ICAtgwac0dQrNdBoIvaXc11jgB0c1NyzXp4Ls03CcAuumKTL4rvmqnyB01+XFA==
X-Received: by 2002:a05:600c:4746:b0:3ed:26fa:6ed0 with SMTP id
 w6-20020a05600c474600b003ed26fa6ed0mr2204757wmo.0.1679054739358; 
 Fri, 17 Mar 2023 05:05:39 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c220b00b003ed3034698esm2135722wml.9.2023.03.17.05.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:05:38 -0700 (PDT)
Message-ID: <ec17a227-8c71-d238-6ead-89cfec687727@redhat.com>
Date: Fri, 17 Mar 2023 13:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/32] tests/docker: all add DOCKER_BUILDKIT to RUNC
 environment
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 Cleber Rosa <crosa@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Alexandre Iooss <erdnaxe@crans.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Sunil V L <sunilvl@ventanamicro.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Vijai Kumar K <vijai@behindbytes.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/03/2023 18.43, Alex Bennée wrote:
> It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
> itself to get the full benefit of caching.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/docker/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 54ed77f671..9401525325 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
>   # General rule for building docker images.
>   docker-image-%: $(DOCKER_FILES_DIR)/%.docker
>   	  $(call quiet-command,			\
> -		$(RUNC) build				\
> +		DOCKER_BUILDKIT=1 $(RUNC) build		\
>   		$(if $V,,--quiet)			\
>   		$(if $(NOCACHE),--no-cache,		\
>   			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \

Reviewed-by: Thomas Huth <thuth@redhat.com>


