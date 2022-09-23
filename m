Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E045E8261
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 21:08:44 +0200 (CEST)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obo2U-0004vo-Tx
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 15:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obnio-0000ty-Is
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obnim-0001Dz-Dj
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663958899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcZj4oAakw7NzxFLR63X5HiohQDppY+RAJFyDkVYdTw=;
 b=aRFZY25cSECvWdtCyvjgbHx9IRvYf0rWzl28+rX4BrF29eKkXH/Q+osRJ+02MpMjTUeJ3C
 zdblmyshB7yrWYEOk4W6Hg+3A3fN0OqK8KalImUsIzxy51CK2a7qib2nHHVPhkC+PDOb4Y
 0JrKbL/ZMyuq2LDI1QW5foSERwX/ByQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-GZ_SDhluMIaP8Xz6bjZM7Q-1; Fri, 23 Sep 2022 14:48:18 -0400
X-MC-Unique: GZ_SDhluMIaP8Xz6bjZM7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 y20-20020a05600c365400b003b4d4ae666fso256933wmq.4
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 11:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xcZj4oAakw7NzxFLR63X5HiohQDppY+RAJFyDkVYdTw=;
 b=ivG4H5jZgPXfPNLf0O5nYIagzTUXWZbO+aYFQhILt9Rrpm+BFbwmcJ+vy7iMqjsxFV
 Co9zbuuEbTp6velEdUyg843hDoOzwNOBLd9u/ounVKU3hbCO9pOq112xlWJDUTdj0cN1
 bgJksceC9BCVvf9LImW4NIee8Lx+ZmTHZEPLAscCBs1SPuk8qooBK4Y3jRXMoA3WgWpz
 URh/5Nb0gwx3ylBbQaBJIbdot3Reosff89eHmpRdKZt16CmpFNIA+hHcfbco3vt9xZm7
 BakVexeiNOBHrXHTFkHGCSgTbg0cRpckQ//uTWJJQF6MLHuM7fyCElbGJcYgdst3X8+E
 NX/w==
X-Gm-Message-State: ACrzQf1yY2Ksu0Z4cMlEp7IK6dtv/3NhGZ0JOYkcytcJWB1bOt5JtN0f
 0qnNZDB7b2qNYpmSqaWvPJJYNRrTySDQz/VwIvW6qmiDC6fNY6UJZd/k1VhPfmx8nS/LvCiHEvK
 0OKkAvpG/hyElaKI=
X-Received: by 2002:a05:600c:1547:b0:3b4:c56b:a3a6 with SMTP id
 f7-20020a05600c154700b003b4c56ba3a6mr6986526wmg.29.1663958896302; 
 Fri, 23 Sep 2022 11:48:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7irMkZxkdU8OCZVuJM0rWKucA/Fj9+No5vqIKRBnloTbi+o1+yq3smZTbJ0wW++24DZlmgrA==
X-Received: by 2002:a05:600c:1547:b0:3b4:c56b:a3a6 with SMTP id
 f7-20020a05600c154700b003b4c56ba3a6mr6986505wmg.29.1663958896093; 
 Fri, 23 Sep 2022 11:48:16 -0700 (PDT)
Received: from [192.168.8.103] (tmo-097-189.customers.d1-online.com.
 [80.187.97.189]) by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b003b339438733sm3497293wmg.19.2022.09.23.11.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 11:48:15 -0700 (PDT)
Message-ID: <4927fe8e-724d-a6d0-063b-dfad0730cb61@redhat.com>
Date: Fri, 23 Sep 2022 20:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 5/8] s390x/pci: enable adapter event notification for
 interpreted devices
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
 <20220902172737.170349-6-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902172737.170349-6-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2022 19.27, Matthew Rosato wrote:
> Use the associated kvm ioctl operation to enable adapter event notification
> and forwarding for devices when requested.  This feature will be set up
> with or without firmware assist based upon the 'forwarding_assist' setting.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 816d17af99..e66a0dfbef 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
...
> @@ -1428,6 +1440,8 @@ static Property s390_pci_device_properties[] = {
>       DEFINE_PROP_S390_PCI_FID("fid", S390PCIBusDevice, fid),
>       DEFINE_PROP_STRING("target", S390PCIBusDevice, target),
>       DEFINE_PROP_BOOL("interpret", S390PCIBusDevice, interp, true),
> +    DEFINE_PROP_BOOL("forwarding_assist", S390PCIBusDevice, forwarding_assist,
> +                     true),
>       DEFINE_PROP_END_OF_LIST(),
>   };

It seems to be more common to use "-" as separator in property names than to 
use "_" :

$ grep -r DEFINE_PROP_BOOL * | sed -e 's/^.*("//' -e 's/".*//' | grep _ | wc -l
39
$ grep -r DEFINE_PROP_BOOL * | sed -e 's/^.*("//' -e 's/".*//' | grep - | wc -l
169

... so maybe rename "forwarding_assist" to "forwarding-assist" ?

  Thomas


