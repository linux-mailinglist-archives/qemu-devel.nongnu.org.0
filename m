Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75132BAAD7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:12:46 +0100 (CET)
Received: from localhost ([::1]:48100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg6DV-0005Hm-Vo
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg6B7-0003sj-2i
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:10:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg6B5-0001e5-2p
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605877813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2MUOg7V3pTOF66oXVDgXqQAOPzCtj7BfkEKiev/jqM=;
 b=NOT5ELyOtYrh6zMjBk9vOLuJZejKbdADEVzWb11U9MjVZu4Y5ioGO8R6G/YZXawNUQ/plR
 2NwMm0LO4QlBmviVyppVZYj+5vJMBcSifOim1nlGVMDlhW12R8Im1p//wvsS9pzbK9N11t
 Jxtbm0ry/Qe7cjC5jEAVzQGN9OFM8Vg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-hY8oJYbyMteoxXvK_dDIWQ-1; Fri, 20 Nov 2020 08:10:11 -0500
X-MC-Unique: hY8oJYbyMteoxXvK_dDIWQ-1
Received: by mail-ej1-f72.google.com with SMTP id k2so1649759eji.21
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 05:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o2MUOg7V3pTOF66oXVDgXqQAOPzCtj7BfkEKiev/jqM=;
 b=JLDgZSIYBwseaACMdftQYnevx9f3SoNHmQp89uHcYnw95A5Mn+rVjH+eTviwB+q+3N
 OGwjrbjVGRvHbuwU2VBIe6PU0eaXR49+j5hnc4wGpLY6rAZRhJN+pjMnBMEYRvfaGRhE
 MCsf4XG02yxfSErb4rE/F8JrBivt9VaHPKeutpluHpw6+HX9wX9wjPBGL0RTv8WAZMm7
 A8dNhAvWwAG+DRELwin5/g0X2VJ/LRS36abMYE82AJz2MpiVSQ/vPOrOGVrB7nvndzRh
 OYPggRM2b3caaL+3aGtvRXui25SPM79Iz8vcKShZRGKiXshyb/RPiw5V85OAFOw11R8N
 2fOg==
X-Gm-Message-State: AOAM531AyqjSX1maX4V5jeEACLUh++rQZfhAO5enYlXtqOy1HzUDs8EI
 Q0XOq4DgpG99UDJnv+2FyyDPsNiRp09fScU6+AhKVSd6/f640CO1mYfRqXtQ5dYrhH+FJ8MigE0
 0Trg5W22Ul0FDx8I=
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr33279365ejd.328.1605877810597; 
 Fri, 20 Nov 2020 05:10:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsly/iI2TV6ZWorUsT8XsPYQCLnBww1Yd8ehyGrIQOrzp9RjyFIMGuVNlGgsu4ToTi8kn+4A==
X-Received: by 2002:a17:906:38db:: with SMTP id
 r27mr33279350ejd.328.1605877810324; 
 Fri, 20 Nov 2020 05:10:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d1sm1068808edd.59.2020.11.20.05.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 05:10:09 -0800 (PST)
Subject: Re: [PATCH for-5.2] Revert "hw/core/qdev-properties: Use
 qemu_strtoul() in set_pci_host_devaddr()"
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20201120130409.956956-1-mst@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f328f4c0-04b9-49e7-46f8-1435f8564042@redhat.com>
Date: Fri, 20 Nov 2020 14:10:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120130409.956956-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Herman <kherman@inbox.lv>, Geoffrey McRae <geoff@hostfission.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 14:04, Michael S. Tsirkin wrote:
> This reverts commit bccb20c49df1bd683248a366021973901c11982f as it
> introduced a regression blocking bus addresses > 0x1f or higher.
> Legal bus numbers go up to 0xff.
> 
> Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
> Reported-by: Klaus Herman <kherman@inbox.lv>
> Reported-by: Geoffrey McRae <geoff@hostfission.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> checkpatch will complain since it does not like strtoul but
> we had it for years so should be ok for 5.2, right?

Yes, of course.

Paolo

>   hw/core/qdev-properties-system.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index b81a4e8d14..9d80a07d26 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -858,7 +858,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>       Property *prop = opaque;
>       PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
>       char *str, *p;
> -    const char *e;
> +    char *e;
>       unsigned long val;
>       unsigned long dom = 0, bus = 0;
>       unsigned int slot = 0, func = 0;
> @@ -873,23 +873,23 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>       }
>   
>       p = str;
> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
> -        goto inval;
> -    }
> -    if (*e != ':') {
> +    val = strtoul(p, &e, 16);
> +    if (e == p || *e != ':') {
>           goto inval;
>       }
>       bus = val;
>   
> -    p = (char *)e + 1;
> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
> +    p = e + 1;
> +    val = strtoul(p, &e, 16);
> +    if (e == p) {
>           goto inval;
>       }
>       if (*e == ':') {
>           dom = bus;
>           bus = val;
> -        p = (char *)e + 1;
> -        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
> +        p = e + 1;
> +        val = strtoul(p, &e, 16);
> +        if (e == p) {
>               goto inval;
>           }
>       }
> @@ -898,13 +898,14 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>       if (*e != '.') {
>           goto inval;
>       }
> -    p = (char *)e + 1;
> -    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e == p) {
> +    p = e + 1;
> +    val = strtoul(p, &e, 10);
> +    if (e == p) {
>           goto inval;
>       }
>       func = val;
>   
> -    if (bus > 0xff) {
> +    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
>           goto inval;
>       }
>   
> 


