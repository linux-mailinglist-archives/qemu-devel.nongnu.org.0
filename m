Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989CA6BE8DA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 13:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd8t5-0003Xa-OC; Fri, 17 Mar 2023 08:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8t3-0003Wd-TI
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd8t2-0005EH-I5
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679054924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kScjxjWF3/DNY8MH6JIoXktFOWCux+jIyciHRIIYQeY=;
 b=N42YPBJEUJG0NbVx2e2g129OSDmJmS3Y9nfoC1lQyV/YvIvz6LHJA7Xp3yuY+soiz2+AA2
 ihttzQx0L+nlVfuas1gCiobjCOJPTxYtu8wcV6wkmbBkhIVSz8ak3BL+PC3RTiHE8m94ZJ
 1m1uZ0h0Cq8tEiPIteNuRODSBNNkMxg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-wBk5UuTlOOu08uo2xUfjkw-1; Fri, 17 Mar 2023 08:08:35 -0400
X-MC-Unique: wBk5UuTlOOu08uo2xUfjkw-1
Received: by mail-wr1-f69.google.com with SMTP id
 m5-20020a056000024500b002ceaa6f78a0so781866wrz.12
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 05:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kScjxjWF3/DNY8MH6JIoXktFOWCux+jIyciHRIIYQeY=;
 b=IxmkeJLT4Ul6QP2d92GsMnZvCfqfA79rhWt3xRzBy+Nowao685kyL6lZOePsrR8GEq
 RuD65V7B9sw6iZOx4wCGLeHzLAn/wsbQm68dbn4lmnoI7Xwiz/NnP0S5dQz0GN2AAjfD
 Xr8MdVI62ei8y0RnJnzXRnJkgqkZ8UfUBvMHSFdvlTL0JaB08zNgdxkxA+MSe04do+r8
 VI1z33u6TpljPbzmgpOUvEeUMcBdOjVXVolkoKmt15gjiE2BLTy5H0+ffhbTK+1wSInp
 I2o4d2XuTDmgIGNQ3BIzAO096NwN/VXql9LVBqlyVv0fswPyC9rXrp+Wy//YhEkRnDqL
 ohlw==
X-Gm-Message-State: AO0yUKWdbEyBKsS2Tzg1q7LQCzCafKaoYKbPfd98JbV0509Oae1EVc+k
 ioSvNmE8rRKij3dURV/J6Da9FhYlmIB9jy1qJz6yal7mFlxiuP+DYTcWCxAut9KgzsNnjmo26H6
 6cHAJGBdHhglkVCI=
X-Received: by 2002:adf:f150:0:b0:2c9:70a4:4f94 with SMTP id
 y16-20020adff150000000b002c970a44f94mr7656686wro.18.1679054914258; 
 Fri, 17 Mar 2023 05:08:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set8BjzNtWSjj0hviwgMCvvExxTLEB7Z7kxpInt7PqehO0hi0hW9EyLdwSex7xipSCivTOE1MHA==
X-Received: by 2002:adf:f150:0:b0:2c9:70a4:4f94 with SMTP id
 y16-20020adff150000000b002c970a44f94mr7656656wro.18.1679054913951; 
 Fri, 17 Mar 2023 05:08:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 j20-20020a5d6e54000000b002cea8664304sm1791406wrz.91.2023.03.17.05.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:08:33 -0700 (PDT)
Message-ID: <162c7939-abed-bdb5-47bb-e7b9e873f6b6@redhat.com>
Date: Fri, 17 Mar 2023 13:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/32] tests/tcg: add some help output for running
 individual tests
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
 Vijai Kumar K <vijai@behindbytes.com>,
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
 <20230315174331.2959-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315174331.2959-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> So you can do:
> 
>    cd tests/tcg/aarch64-linux-user
>    make -f ../Makefile.target help
> 
> To see the list of tests. You can then run each one individually.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index a3b0aaf8af..8318caf924 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -201,3 +201,10 @@ clean:
>   
>   distclean:
>   	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
> +
> +.PHONY: help
> +help:
> +	@echo "TCG tests help $(TARGET_NAME)"
> +	@echo "Built with $(CC)"
> +	@echo "Available tests:"
> +	@$(foreach t,$(RUN_TESTS),echo "  $t";)

Reviewed-by: Thomas Huth <thuth@redhat.com>


