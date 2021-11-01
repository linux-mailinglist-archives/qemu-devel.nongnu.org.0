Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043454420BB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:22:27 +0100 (CET)
Received: from localhost ([::1]:52826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhct0-00028e-16
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhbeJ-0002VJ-AR
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:03:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhbeH-0001cM-3u
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635789788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VC4B4fkYnI8bf3XIYD1o2pcZZnG4PFJPPVTLssicFC0=;
 b=dk4fObHa/qjxOkCMwmc2txRMOKlSmBBfOnsIJ4KgdyL/nkNFdHFlnLNDwomyWTfWxF2XBE
 0imjvp+9yRNwUPoglXVkUV2UaqAP5cAPqsOq2sE5br/VEhlC00q6S4i9cWjF2YwoatHItA
 BGovnj/qRzOL6kd4PZw1aFIJUwua4KE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-W1zUK1MkOISExn66AgUdFA-1; Mon, 01 Nov 2021 14:03:07 -0400
X-MC-Unique: W1zUK1MkOISExn66AgUdFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so200490wmg.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VC4B4fkYnI8bf3XIYD1o2pcZZnG4PFJPPVTLssicFC0=;
 b=lOscMILmkYjByVIRS1f6kKNUQlNMIlKXEFsJNT1Vs6QnSlT6ykU6dbeQVUWUOs/xAF
 YDZb6fE6OrBoHqUMEMp2AM3H6vRBBuewY6NehdKefxK30jjuXIzBwuZ/E+a2e3QUKNaB
 h6Ro61UXBHbozx+AOshfQ8arHmLUMGP6COlNHnfSE9wncbdiIFS+VWz2j4hG0IlIW85O
 F5LWhAOdV86zw4C13NCo4Fht/3d7/GeSL1biYXoBoHSVMxBzZ5r0abzl6Ka/0IAzih+I
 lMwHxZ9uXrsj2jN0GaN3uiQBveONSmnArR4tMydI4zBDlD2l8b0yNT9ekIwj6bod+C5N
 qliA==
X-Gm-Message-State: AOAM5314Rma68GxNhJg0+WhTjelUJSN516VkM6LbvKFBu0bej7b9Dj5E
 34ECZTVkMREEKNWhKIdqrAoL7OUzL4BFGd6ZJ/UiocS/PXLC64vpFP3/WM/prbN79ir0AGPRoFh
 1azbeCxoecoa0ros=
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr544905wmh.106.1635789786387;
 Mon, 01 Nov 2021 11:03:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLlLfqebADt9yrKtMkHY94XVwzvZDARlshKz8Cn+GfMxhvhu+X0Xf1QDmfCkfiW+5iry4ySw==
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr544871wmh.106.1635789786187;
 Mon, 01 Nov 2021 11:03:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r7sm6523720wrq.29.2021.11.01.11.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:03:05 -0700 (PDT)
Message-ID: <ee7fe6bb-7df2-389e-913c-a704f6b5d815@redhat.com>
Date: Mon, 1 Nov 2021 19:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Qemu-devel] [PATCH 4/4] qdev-hotplug: Don't check type of
 qdev_get_machine()
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20190425200051.19906-1-ehabkost@redhat.com>
 <20190425200051.19906-5-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20190425200051.19906-5-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIMWL_WL_HIGH=-0.734, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/19 22:00, Eduardo Habkost wrote:
> Now that qdev_get_machine_hotplug_handler() is only compiled in
> softmmu mode, we don't need to check if qdev_gt_machine() is
> really of type TYPE_MACHINE.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/core/qdev-hotplug.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/core/qdev-hotplug.c b/hw/core/qdev-hotplug.c
> index 8ab31043a7..017500c1e1 100644
> --- a/hw/core/qdev-hotplug.c
> +++ b/hw/core/qdev-hotplug.c
> @@ -35,16 +35,11 @@ void qbus_set_bus_hotplug_handler(BusState *bus, Error **errp)
>  
>  HotplugHandler *qdev_get_machine_hotplug_handler(DeviceState *dev)
>  {
> -    MachineState *machine;
> -    MachineClass *mc;
> -    Object *m_obj = qdev_get_machine();
> +    MachineState *machine = MACHINE(qdev_get_machine());
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>  
> -    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
> -        machine = MACHINE(m_obj);
> -        mc = MACHINE_GET_CLASS(machine);
> -        if (mc->get_hotplug_handler) {
> -            return mc->get_hotplug_handler(machine, dev);
> -        }
> +    if (mc->get_hotplug_handler) {
> +        return mc->get_hotplug_handler(machine, dev);
>      }
>  
>      return NULL;
> 

I rebased this patch and tried it, but it fails 'check-unit':

Running test test-qdev-global-props
**
ERROR:../tests/unit/test-qdev-global-props.c:89:test_static_prop: child
process (/qdev/properties/static/default/subprocess [12678]) failed
unexpectedly
ERROR test-qdev-global-props - Bail out!
ERROR:../tests/unit/test-qdev-global-props.c:89:test_static_prop: child
process (/qdev/properties/static/default/subprocess [12678]) failed
unexpectedly
make: *** [Makefile.mtest:640: run-test-78] Error 1

Here the object is of type "container":

  Object *object_get_root(void)
  {
      static Object *root;

      if (!root) {
          root = object_new("container");
      }

      return root;
  }


