Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665A354F447
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:31:13 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28Jr-0005Rg-VY
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o28Di-00048o-Ga
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o28Dg-0007lo-Fg
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 05:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655457887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oO6in2muACN7ce611W5f83Ngfip7TPDiOCuaXyXnQps=;
 b=Dxvu+7KGgDldwpT+yke2iQtaYHaTBRE9X3c3HeKjkz4+w43SMI7WkbjzusJMGj+kXS/l3D
 vLX4gU3QcQerl5eyh/XXmic3Zvu27z8W07Z3JxV/gid1WtvX7oZhiMQZOijJ5IRzVCRojU
 qkPYGyYimQbNTJtRd/EgUOlnMnzhLJc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-L94cUMfeM3y5NCIczS8yeQ-1; Fri, 17 Jun 2022 05:24:46 -0400
X-MC-Unique: L94cUMfeM3y5NCIczS8yeQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v8-20020adfa1c8000000b0021b81a553fbso180268wrv.18
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 02:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oO6in2muACN7ce611W5f83Ngfip7TPDiOCuaXyXnQps=;
 b=hrRd6qg3vAV+17+aT5MkGrxSEVuoYpc+TJKBwgTZj77gdRuoXhc6k1tZ6ckTVTAudV
 6/5qXVBd4NaHvTFXL9/jw+UogC776UZujhfeWufuxcM3On/LYHoKCza7Y/IXq+8zF4WV
 WTYv7JH/LKIW+GuHquvnGywm2EpRiYe4LeeA2A+5hF6xDPTUI3WkQKN2WanPu5ZGcWIg
 ZkDUJ9D7XXQUiuDLPxdLB1UgYYxEioWQq8RI0MFHEgmrj/nyGlQwJcFU+rUaliFddY09
 2cH5x0oaR++HWIJaS2zaRciKl+/IXVwxXIWzXuXH6VNvoMZuTcIqCBu+fuoP8YfJgGSA
 R0Pw==
X-Gm-Message-State: AOAM533gQDdTpszRdYpmy6Nykqc97BDUKd2yi3EiME67R7U65+WiA8mn
 iqJ9yszdGIMakXihKKyB9PXxooLUq9CVaGQYwccmlbs3rMXat7AjFcjnEfku/BxDLsh7DPWQpu2
 utz7bpUdZNKO4wcE=
X-Received: by 2002:a1c:4c12:0:b0:39c:6750:be17 with SMTP id
 z18-20020a1c4c12000000b0039c6750be17mr19881828wmf.21.1655457885185; 
 Fri, 17 Jun 2022 02:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4p8/2x4FgZ7vL7VTS6NYTPtGuczvbFJzgKFGcpTvCXlfW5IZ4w2daXaoVw4UkHjAx0AO54A==
X-Received: by 2002:a1c:4c12:0:b0:39c:6750:be17 with SMTP id
 z18-20020a1c4c12000000b0039c6750be17mr19881800wmf.21.1655457885001; 
 Fri, 17 Jun 2022 02:24:45 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 eh1-20020a05600c61c100b003973d425a7fsm5504934wmb.41.2022.06.17.02.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 02:24:44 -0700 (PDT)
Message-ID: <ddc5899e-d77e-27f2-3432-fd7ce5161229@redhat.com>
Date: Fri, 17 Jun 2022 11:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 08/10] tests/vm: remove ubuntu.i386 VM test
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-9-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220616142659.3184115-9-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2022 16.26, John Snow wrote:
> Ubuntu 18.04 is out of our support window, and Ubuntu 20.04 does not
> support i386 anymore. The debian project does, but they do not provide
> any cloud images for it, a new expect-style script would have to be
> written.
> 
> Since we have i386 cross-compiler tests hosted on GitLab CI, we don't
> need to support this VM test anymore.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/vm/Makefile.include |  3 +--
>   tests/vm/ubuntu.i386      | 40 ---------------------------------------
>   2 files changed, 1 insertion(+), 42 deletions(-)
>   delete mode 100755 tests/vm/ubuntu.i386

Reviewed-by: Thomas Huth <thuth@redhat.com>


