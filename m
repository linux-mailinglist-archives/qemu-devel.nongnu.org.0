Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040F167DAC2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 01:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLCaJ-0007PX-Ev; Thu, 26 Jan 2023 19:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCaE-0007OH-Nc
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:27:10 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLCaB-0002z0-Ra
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 19:27:09 -0500
Received: by mail-wr1-x431.google.com with SMTP id m7so3552999wru.8
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 16:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ufBOX217VhVNp1zRbebYtR3XKFZMHj95f4h59XIZDkE=;
 b=ImKqUOUkBJknr4RmRDBQmoP6PXEZZCHUZVOXNgNmfrTD2zhA52u8NsG3Uj6fBEZgJ2
 XBB29eEuSD0vrVBhNjEal2iJJTxYIfj255jtdrPBeQqL/DlFb5uP8QkOycFHpxMkQ8vH
 bU/v7RlL4OezmHSLDZUdqE10gscxMNVn2VmhGVNAOLUVkzWd6cdivZQceNNXaL3xFeob
 my7IfyVfKLVw0J2F5PnASoiZXjsYne7VnI+pp0wqRBHXEbZ2C03tBtDhQkQTLZoBe5oP
 nTLYHGjDsge1oT2KW/ujYuTWTF98BkTzy2vgw5N8Ngk91Y4FbYvm3IVVHEj6osoAvPb2
 /XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufBOX217VhVNp1zRbebYtR3XKFZMHj95f4h59XIZDkE=;
 b=W7pVWF9U/HJPCRt5DtD3Vo1wCNnGhFrS8zcykT5WEa7TDtMYG0RrHn0jZHSu6Dz8mK
 tii2e17JR8qoHpInhh7B8lc+CGQSWw2+4BoaXxMaWLc6oVTbNy22rCqWdaj0fWwSMHMI
 DCMfvnJTCWViLekMROZzDk6EGbGl76ec7xk1KlP0TiBQwzELPYYIWZDWVoLeDyhkgwvR
 HVlrSyYY8CTTx5PzKYIjFeALO5FeAxhwX2yhg5gmjpXA6mSdNhnCZ8dwtYFu3tb9WVcl
 +I+LLakZRJPa104xmY1o0uZuSZ7839s9e1lFNeeP2gAwLfZ1x8hQywtBrvu/WtSqjMLz
 t0Fg==
X-Gm-Message-State: AFqh2kqhklgIbTDdzBjV+ZuWJJD2zchc9IBTk9O1wAuejyycPvhZqF1O
 L1ksX8F2OUp2f/0AuM+ZrEiKFA==
X-Google-Smtp-Source: AMrXdXvGT+D6yjPHz2j47CaCJ+8qgdUdgrkS4H4xEVFxO9Azj9Xy3UUzC/gPFjwYHv9pHc6W4qNq3g==
X-Received: by 2002:a5d:58e8:0:b0:2be:b07:d411 with SMTP id
 f8-20020a5d58e8000000b002be0b07d411mr30887595wrd.3.1674779225758; 
 Thu, 26 Jan 2023 16:27:05 -0800 (PST)
Received: from [192.168.0.114] ([196.77.8.13])
 by smtp.gmail.com with ESMTPSA id
 a5-20020adfeec5000000b002bfae6b17d2sm2560341wrp.55.2023.01.26.16.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 16:27:05 -0800 (PST)
Message-ID: <e704c4a9-a2aa-98c4-e484-d4605881e2ad@linaro.org>
Date: Fri, 27 Jan 2023 01:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 08/10] hw/ide: Let ide_init_ioport() take a
 MemoryRegion argument instead of ISADevice
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 20210518215545.1793947-10-philmd@redhat.com
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-9-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230126211740.66874-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 26/1/23 22:17, Bernhard Beschow wrote:
> Both callers to ide_init_ioport() have access to the I/O memory region
> of the ISA bus, so can pass it directly. This allows ide_init_ioport()
> to directly call portio_list_init().
> 
> Note, now the callers become the owner of the PortioList.
> 
> Inspired-by: <20210518215545.1793947-10-philmd@redhat.com>
>    'hw/ide: Let ide_init_ioport() take an ISA bus argument instead of device'
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/ide/internal.h |  3 ++-
>   hw/ide/ioport.c           | 15 ++++++++-------
>   hw/ide/isa.c              |  4 +++-
>   hw/ide/piix.c             |  8 ++++++--
>   4 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
> index 42c49414f4..c3e4d192fa 100644
> --- a/include/hw/ide/internal.h
> +++ b/include/hw/ide/internal.h
> @@ -628,7 +628,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
>                      int chs_trans, Error **errp);
>   void ide_init2(IDEBus *bus, qemu_irq irq);
>   void ide_exit(IDEState *s);
> -void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
> +void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Object *owner,
> +                     int iobase, int iobase2);
>   void ide_register_restart_cb(IDEBus *bus);
>   
>   void ide_exec_cmd(IDEBus *bus, uint32_t val);
> diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
> index b613ff3bba..00e9baf0d1 100644
> --- a/hw/ide/ioport.c
> +++ b/hw/ide/ioport.c
> @@ -50,15 +50,16 @@ static const MemoryRegionPortio ide_portio2_list[] = {
>       PORTIO_END_OF_LIST(),
>   };
>   
> -void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
> +void ide_init_ioport(IDEBus *bus, MemoryRegion *address_space_io, Object *owner,
> +                     int iobase, int iobase2)
>   {

Eh I have almost the same change locally :)

$ git diff d2968dc5d0940799~..629b479f0b8f082688
diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index fcfaa00cb9..f82e00076a 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,20 +50,21 @@ static const MemoryRegionPortio ide_portio2_list[] = {
      PORTIO_END_OF_LIST(),
  };

-int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+int ide_init_ioport(IDEBus *bus, Object *owner, ISADevice *dev,
+                    MemoryRegion *isa_io, int iobase, int iobase2)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



