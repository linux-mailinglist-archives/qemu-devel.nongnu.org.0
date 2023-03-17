Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B8C6BE1DE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 08:25:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd4SC-0007Ow-2l; Fri, 17 Mar 2023 03:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4S9-0007O1-En
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 03:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd4S7-0006FX-9T
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 03:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679037877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xW5YRWUqoI7YaHI7gPZKm4zvNmnVkp4WxZPUXFEvJBo=;
 b=OnDUM4ca2p/TJYhsHtnYSvFbnWlXbO5i6hGFsmuk7AQBj/mfd3vZZQ33Gjfb+Tb76tW3la
 pup2VhwgRTcOuDOgB4HkRgKL04ZyMWznPmJvAOi0KYdQxhgTuDlbBbF6fr/jyuPK8MSGMn
 Z2GkYYpcIsGO1T50laN6BD5OnPIPWvY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-AllFK4oKNWiiYeT1V8TqjQ-1; Fri, 17 Mar 2023 03:24:35 -0400
X-MC-Unique: AllFK4oKNWiiYeT1V8TqjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay12-20020a05600c1e0c00b003ed201dcf71so1880391wmb.4
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 00:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679037874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xW5YRWUqoI7YaHI7gPZKm4zvNmnVkp4WxZPUXFEvJBo=;
 b=xPqbwmI8aotf732fnJtMxgUS7hh0QQcNqf2AMEL+vk8ndULNce7MP/n9E5S2wQdV7r
 lKnxJOMaWZ9m0vcW+W/a8a4njmWnvWXcRaGdae3e54t8QQaT+uEy7jXu7o1jYaFRONzJ
 +VoKA1XQSO7sLi9j8UMjJs60hkbXeibfJor/J4vNJk4d6NkQ12EH/JpjazI2VTszH8fW
 dPgOh9oTNf8hp+S3gRZ/bH8b/nDReHhrfvzAJbe8Ikn9nFgmbud5HnNNmxJe0/tLCat7
 wVT7Tf4ePkHl8WAUTXXOskuJYbc8blmLBaosk1ruY8zFP286+5JnwrjWykqye0KQpJ9l
 v11A==
X-Gm-Message-State: AO0yUKV2B7QpfhC1e37EaeqD9QGkVt8bDp7bLcuI38F19EPjC9se9c8i
 iOx+B3gWIJ8/c1HTWfsZlfun3Rcd3++mFy0uEi+nnWfFGlnHG3ss/On8nBg0y1kf6kKfrhtSQT9
 4+qd0euCCy5BHKkg=
X-Received: by 2002:a5d:4d06:0:b0:2c7:daa:1c56 with SMTP id
 z6-20020a5d4d06000000b002c70daa1c56mr5851985wrt.4.1679037874689; 
 Fri, 17 Mar 2023 00:24:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+aVAxUwOvFA/ilN/jNay4xxCe5XpeNTShUolDwE3ogiowCBRVEg+sW7qmY2hMDnR5uIw2AZQ==
X-Received: by 2002:a5d:4d06:0:b0:2c7:daa:1c56 with SMTP id
 z6-20020a5d4d06000000b002c70daa1c56mr5851904wrt.4.1679037874240; 
 Fri, 17 Mar 2023 00:24:34 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 y1-20020a5d4ac1000000b002ceaeb24c0asm1262440wrs.58.2023.03.17.00.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 00:24:32 -0700 (PDT)
Message-ID: <95ef3696-f934-376e-ee88-687477a32242@redhat.com>
Date: Fri, 17 Mar 2023 08:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 05/32] gitlab: update centos-8-stream job
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
 Peter Xu <peterx@redhat.com>
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-6-alex.bennee@linaro.org>
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
> A couple of clean-ups here:
> 
>    - inherit from the custom runners job for artefacts

I know, it's a difference between BE and AE, but in case you want to be 
consistent with the yml: s/artefacts/artifacts/

>    - call check-avocado directly
>    - add some comments to the top about setup
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../custom-runners/centos-stream-8-x86_64.yml  | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


