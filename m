Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10F47B2B4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:15:36 +0100 (CET)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNCB-0002bH-3k
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:15:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzLko-0003qg-SM
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:43:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzLkk-0008Ab-K4
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640018589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCP7S0pNbddq/VK5eHQiqPqfJZVzPc6jp5UvO1GrSMk=;
 b=EFt9u4I2flucriO7/fkPUAt/S7NZGcLzJuBKHUT4tiOhyNxJ51C6K0TS1mx5KuvE5QJTVn
 4HKTgh2uoMxvm8VjJ8kW1fH1ykfnjhiIUXAo4yL5uILy8+J57BMSvrxcVjEdLP8L25RG4f
 BZsSXRKk//lBv0nFPeu0OfxIFAIDPoE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-X2tIHOEEMKyZs7fQCsz-fA-1; Mon, 20 Dec 2021 11:43:08 -0500
X-MC-Unique: X2tIHOEEMKyZs7fQCsz-fA-1
Received: by mail-wm1-f69.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so177164wmq.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WCP7S0pNbddq/VK5eHQiqPqfJZVzPc6jp5UvO1GrSMk=;
 b=aS5NN/KmjTAcUigrRjZykeY7qqinXDDwa3XqefXYJaTUPJHti2a3DalhmoyE4s77fB
 MEMPQzDPbMXq9EcCaExt79ASzgjk3TGUHwMSMjfLkNj/hfBK+XT7WKSbUioltt0tiOaY
 nM+oYmM7MVIFJVeE6La8Ur0BjmMLxJIXTl/9oMcb5HV/K5fLPZFB01qjztZUalGtPBRj
 rRi2j5bomms0/kdZw2e11/1oEZlM9JPc4hrCk4zqFtOO/vwGdWaFaUiwoO0S7EzjJ2kq
 Ls5gwTdETIqtA/xUBRZWMTz3SsqGwREZcwfK5PbSiMmvML7d5LGG1wV3d6IXw97PY+i3
 qzKA==
X-Gm-Message-State: AOAM5310VBGo+w/q/VpqYEhTfCsT1dDmSi5Zfg3BsenVeDEes9qjb+cZ
 sfRSwGszK8BA93E8kaBXrjFx4ZAJtpnBgrewvY9R0sL2v2e3r+xOc+LkgVjS8Z3rVCl+fo/cDVc
 25Oq68yQa2sjzHyM=
X-Received: by 2002:a05:600c:1e05:: with SMTP id
 ay5mr1173966wmb.131.1640018587205; 
 Mon, 20 Dec 2021 08:43:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDcWLc4q0zx9tLYxCBOMpugd/aZMiJllTs50pAs5UMTNK8wXSj72lrqfoWWI62WaCosH2VrQ==
X-Received: by 2002:a05:600c:1e05:: with SMTP id
 ay5mr1173949wmb.131.1640018587042; 
 Mon, 20 Dec 2021 08:43:07 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a22sm15513711wme.19.2021.12.20.08.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 08:43:06 -0800 (PST)
Message-ID: <88d3bbf0-97d0-492c-84f2-bd4e695086d3@redhat.com>
Date: Mon, 20 Dec 2021 17:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/nvram: at24 return 0xff if 1 byte address
To: Patrick Venture <venture@google.com>
References: <20211220003240.1081986-1-venture@google.com>
 <498f2e14-607a-afc3-d73a-58e7f6dad8e2@redhat.com>
 <CAO=notwf2X4e3BH_xnC_7GkGz1STe=jrkosmBiFXqGV6FT0U3A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAO=notwf2X4e3BH_xnC_7GkGz1STe=jrkosmBiFXqGV6FT0U3A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cminyard@mvista.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 16:32, Patrick Venture wrote:
> On Mon, Dec 20, 2021 at 1:12 AM Philippe Mathieu-Daudé
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> 
>     Hi Patrick,
> 
>     On 12/20/21 01:32, Patrick Venture wrote:
>     > The at24 eeproms are 2 byte devices that return 0xff when they are
>     read
>     > from with a partial (1-byte) address written.  This distinction was
>     > found comparing model behavior to real hardware testing.
>     >
>     > Tested: `i2ctransfer -f -y 45 w1@85 0 r1` returns 0xff instead of next
>     > byte
>     >
>     > Signed-off-by: Patrick Venture <venture@google.com
>     <mailto:venture@google.com>>
>     > ---
>     >  hw/nvram/eeprom_at24c.c | 8 +++++++-
>     >  1 file changed, 7 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
>     > index a9e3702b00..184fac9702 100644
>     > --- a/hw/nvram/eeprom_at24c.c
>     > +++ b/hw/nvram/eeprom_at24c.c
>     > @@ -62,7 +62,9 @@ int at24c_eeprom_event(I2CSlave *s, enum
>     i2c_event event)
>     >      case I2C_START_SEND:
>     >      case I2C_START_RECV:
>     >      case I2C_FINISH:
>     > -        ee->haveaddr = 0;
>     > +        if (event != I2C_START_RECV) {
>     > +            ee->haveaddr = 0;
>     > +        }
> 
>     Alternatively (matter of taste, I find it easier to read):
> 
>            case I2C_START_SEND:
>            case I2C_FINISH:
>                ee->haveaddr = 0;
>                /* fallthrough */
>            case I2C_START_RECV:
> 
> 
> That may be easier to read :) I'm not sure, but I'm willing to bend and
> change my patch to behave this way.  Sometimes the fallthrough things
> leads to compiler annoyances in my experience.  We might  need
> __attribute__(fallthrough) or the like to convince the system that's
> what we really want. 

OK then.

> 
> 
>     >          DPRINTK("clear\n");
>     >          if (ee->blk && ee->changed) {
>     >              int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
>     > @@ -86,6 +88,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
>     >      EEPROMState *ee = AT24C_EE(s);
>     >      uint8_t ret;
>     > 
>     > +    if (ee->haveaddr == 1) {
>     > +        return 0xff;
> 
>     Don't we need to increase ee->haveaddr?
> 
> 
> We don't because the call to recv doesn't set any addr bytes.  This
> patch is primarily a behavioral fix to handle the device being treated
> as 8-bit addressable.  This is typically tested by writing a 1 byte
> address and then trying to read.  The chip itself will not have enough
> address bytes and reject this read by returning 0xff.  The
> haveaddr variable is strictly updated when they've written another byte
> to the address, or they've changed states in such a way that should
> clear any previously written address.  You can read from an eeprom by
> just reading or by setting an address and then reading.

Yes. And your approach is simple enough.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks,

Phil.


