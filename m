Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E1532A13
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:12:03 +0200 (CEST)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTOM-00054E-FS
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSOT-0000Vo-9k
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntSOR-0004Os-P8
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:08:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653390483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PglnHa3TCxlkJHEEOakoSj8j9d0Ds6HnFOc18PYwcDg=;
 b=HsXObDeFyRMAECrKSNXJXyqq9Pnp3Rh02QMkAJ3P+HqSrvlPWkmSu0H/dlD1a3lhjWUQSD
 WlU/9P1dlMLd6b/RJjaZsOrp8760+7t0SePqmGsHxWalEiWWCb7xJ3M6WKklZPPJTNahqR
 a4uVR7lX1jZJU93Y3mARcXWLRCCcTSc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-NFlYcWTWNXexGgC16sRsyg-1; Tue, 24 May 2022 07:08:02 -0400
X-MC-Unique: NFlYcWTWNXexGgC16sRsyg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l34-20020a05600c1d2200b003973a50c1e4so1148313wms.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 04:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PglnHa3TCxlkJHEEOakoSj8j9d0Ds6HnFOc18PYwcDg=;
 b=B0avKOIZRjXTGbAgvN2ia/IIMbr8AwHHf1g9KRCvIUQWpKgqz4zB3B/v6x7TGg6N62
 NBZhpB0V6d+spZ5JpPm1dtU7Ch1pVLofrm2+A4w5gXtkcgpOnruK8QrVpt7krs/uXT4z
 IiEJ2oq7ER65RoBFSC3yDBA8/pDYkgGnPDdh+qaYaq7dZXRybILRU/KQFVDUZMmd0Xua
 vZcEFnix+AvTl+pHVkQpeonfx588eFIGlX0tbugOhJmHMICVhdGyITK/ex7TP3qQHWw8
 gO+ev7jlCMRqg0oQsHeiVqupiqQFmfyor153ILzbBTeTHP7SVj9Xd/l6UtggTvb4Zkjz
 CqTw==
X-Gm-Message-State: AOAM5315T/XF3wl49QSHHJjrzT/yuptsL/0iAP3JD0yTO2L+fsZ1ZjYJ
 YymY4DEGSjmlEW7cwOXalXIABv87rcI+zIH5bZy1++luv74kQGc3p9Ymq+cQRP4bAZ4t7n4MjXX
 /w+82Fvdf6WbTfog=
X-Received: by 2002:a5d:5957:0:b0:20e:5942:343f with SMTP id
 e23-20020a5d5957000000b0020e5942343fmr22872318wri.368.1653390480873; 
 Tue, 24 May 2022 04:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkaFl8cOuYQZmiXNu5RC1O3od+giHXYBvWx/OpOEbxErFEspQ8RIpWquVPnaOZWFzbbQ39vA==
X-Received: by 2002:a5d:5957:0:b0:20e:5942:343f with SMTP id
 e23-20020a5d5957000000b0020e5942343fmr22872273wri.368.1653390480487; 
 Tue, 24 May 2022 04:08:00 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adfbbd1000000b0020e6470b2a7sm12433171wrg.85.2022.05.24.04.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 04:07:59 -0700 (PDT)
Message-ID: <85d42f91-2837-c73a-128f-e40de852f780@redhat.com>
Date: Tue, 24 May 2022 13:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 06/13] s390x: topology: Adding books to STSI
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, philmd@redhat.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220420115745.13696-1-pmorel@linux.ibm.com>
 <20220420115745.13696-7-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420115745.13696-7-pmorel@linux.ibm.com>
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

On 20/04/2022 13.57, Pierre Morel wrote:
> Let's add STSI support for the container level 3, books,
> and provide the information back to the guest.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> +static char *drawer_bus_get_dev_path(DeviceState *dev)
> +{
> +    S390TopologyDrawer *drawer = S390_TOPOLOGY_DRAWER(dev);
> +    DeviceState *node = dev->parent_bus->parent;
> +    char *id = qdev_get_dev_path(node);
> +    char *ret;
> +
> +    if (id) {
> +        ret = g_strdup_printf("%s:%02d", id, drawer->drawer_id);
> +        g_free(id);
> +    } else {
> +        ret = g_malloc(6);
> +        snprintf(ret, 6, "_:%02d", drawer->drawer_id);

Please use g_strdup_printf() here as well.

  Thomas

> +    }
> +
> +    return ret;
> +}


