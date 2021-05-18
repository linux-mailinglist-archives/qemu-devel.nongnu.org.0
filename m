Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A558C388061
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:16:40 +0200 (CEST)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5Cp-0004wW-OL
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj5As-0003PG-CT
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj5Aq-0004Ne-4s
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621365275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3jxHJ2ZraUwRrmdA0s3DSF+rdeNMzdX+EeYOwa/Y8M=;
 b=EhsYPRc+UFSFFm4rlqizGIBNsAJiHLzvJiMD+UNgI9UGggSxBVCqG+8b8bb/bvxh4sPtTm
 kq6UUH+ccOIJs327OFXQtADH5cBm4fJa0suWpaIoSspWUc0Ut+PoG1+NIZao2uhVfDXDbm
 Yf6iAtkqrbcQK5VUk0eSKMAIwcm/r+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-wriPxjOBMYOb7hXd-KS-Eg-1; Tue, 18 May 2021 15:14:33 -0400
X-MC-Unique: wriPxjOBMYOb7hXd-KS-Eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C4EC107ACE4;
 Tue, 18 May 2021 19:14:32 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8458503CA;
 Tue, 18 May 2021 19:14:30 +0000 (UTC)
Subject: Re: [PATCH v2 4/6] hw/ide/via: Replace magic 2 value by ARRAY_SIZE /
 MAX_IDE_DEVS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210511041848.2743312-1-f4bug@amsat.org>
 <20210511041848.2743312-5-f4bug@amsat.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <e6865cb6-c566-2c33-22e1-b30ef89a7642@redhat.com>
Date: Tue, 18 May 2021 15:14:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511041848.2743312-5-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 12:18 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: John Snow <jsnow@redhat.com>

> ---
>   hw/ide/via.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index be09912b334..6c667a92130 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -90,7 +90,7 @@ static void bmdma_setup_bar(PCIIDEState *d)
>       int i;
>   
>       memory_region_init(&d->bmdma_bar, OBJECT(d), "via-bmdma-container", 16);
> -    for(i = 0;i < 2; i++) {
> +    for (i = 0; i < ARRAY_SIZE(d->bmdma); i++) {
>           BMDMAState *bm = &d->bmdma[i];
>   
>           memory_region_init_io(&bm->extra_io, OBJECT(d), &via_bmdma_ops, bm,
> @@ -122,7 +122,7 @@ static void via_ide_reset(DeviceState *dev)
>       uint8_t *pci_conf = pd->config;
>       int i;
>   
> -    for (i = 0; i < 2; i++) {
> +    for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
>           ide_bus_reset(&d->bus[i]);
>       }
>   
> @@ -188,9 +188,9 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>       bmdma_setup_bar(d);
>       pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>   
> -    qdev_init_gpio_in(ds, via_ide_set_irq, 2);
> -    for (i = 0; i < 2; i++) {
> -        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
> +    qdev_init_gpio_in(ds, via_ide_set_irq, ARRAY_SIZE(d->bus));
> +    for (i = 0; i < ARRAY_SIZE(d->bus); i++) {
> +        ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, MAX_IDE_DEVS);
>           ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>   
>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
> @@ -204,7 +204,7 @@ static void via_ide_exitfn(PCIDevice *dev)
>       PCIIDEState *d = PCI_IDE(dev);
>       unsigned i;
>   
> -    for (i = 0; i < 2; ++i) {
> +    for (i = 0; i < ARRAY_SIZE(d->bmdma); ++i) {
>           memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].extra_io);
>           memory_region_del_subregion(&d->bmdma_bar, &d->bmdma[i].addr_ioport);
>       }
> 


