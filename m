Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006794C6529
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:01:30 +0100 (CET)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObuJ-00018j-U7
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOboa-00079T-Uf
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:55:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nOboZ-0005DV-HR
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646038530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4sFbRhPOSygIlLzUo6FpdkMLIkUBt1LOjLofznyHJs=;
 b=E+jV/t4ChFlOyQLMqk03Sq52/kbHeV8Hs3DTGKgxY+3zpAPiq6BuBRIWkXVlCDHFL341mq
 Av3IEgb4PNoJ0kgIwjho/WLJiWzrsOfETlTjpmiH7O3llaFf7HStE2LZubJBhZ1b/n91yG
 UttoTlD0LLx0TCVacl8I45NBp+cN2LU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-_8NGF6wIPym0Rpur1R8-eQ-1; Mon, 28 Feb 2022 03:55:29 -0500
X-MC-Unique: _8NGF6wIPym0Rpur1R8-eQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 i20-20020a17090671d400b006d0ed9c68c1so4843136ejk.14
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 00:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4sFbRhPOSygIlLzUo6FpdkMLIkUBt1LOjLofznyHJs=;
 b=abUSWA8FV68IS8WYIZDZoxtTIl57MpQLNKO2rNOpQvffsiTH7g1QKcmJ4i0FARQo1u
 wfnZfK6RwzwEBxMJJ8MMc3h8d9awbc2E9cn7aSICJdZlE2Wy9sJIZ1JZGH+ixp+UFC0s
 5quE9ImQpoKMpbiPDNUpTve7vHdN+hvMjYW7r5bBFK2P5dAPPm/1cLz7WFHYHKEDiiY7
 AFPX06iwlVV739kYaQaOgeH3mrvLEGInma60hQTjShFdrmQvXGJ+aYbhFit/L5gPByix
 KF2MMbphhCjprbsjL0XrD6O/iKFNkekVUjnQ3oB9NC5kqdgYWgexz4uMpvZN0MCNJp2v
 Uaeg==
X-Gm-Message-State: AOAM5309bpEfYT4+/esAfff2J0JOck7SX5Uq+mOfIbOV2Vw0/KvIn2u2
 9vsOKrO7qjZPvQfrN46yQDyFxWm9oC7HAeC2FupU+qIaPWMwA9x4Icm7ciFv4T/+BaXK0kyVDqP
 5cMksEsPPAapXEPg=
X-Received: by 2002:a17:907:766a:b0:6cf:bb20:70c with SMTP id
 kk10-20020a170907766a00b006cfbb20070cmr14226586ejc.94.1646038528106; 
 Mon, 28 Feb 2022 00:55:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF4s9P3pA/TFZSjKOch4FnpcyZMSM4gHMjg0bwUth589nua6G/x1EiBkhHaZh/NYNIuv+PBg==
X-Received: by 2002:a17:907:766a:b0:6cf:bb20:70c with SMTP id
 kk10-20020a170907766a00b006cfbb20070cmr14226578ejc.94.1646038527943; 
 Mon, 28 Feb 2022 00:55:27 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 m7-20020aa7c487000000b00413a99bf3a3sm2355043edq.56.2022.02.28.00.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 00:55:27 -0800 (PST)
Date: Mon, 28 Feb 2022 09:55:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power
 control is enabled
Message-ID: <20220228095526.0b4f030d@redhat.com>
In-Reply-To: <20220228073957.e7izpppvu4in6fr4@sirius.home.kraxel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
 <20220225101259.begp7wy5o3jlafcf@sirius.home.kraxel.org>
 <20220225140231.16c13306@redhat.com>
 <20220225080628-mutt-send-email-mst@kernel.org>
 <20220225143528.3510dc98@redhat.com>
 <20220225084140-mutt-send-email-mst@kernel.org>
 <20220225163917.7519454f@redhat.com>
 <20220228073957.e7izpppvu4in6fr4@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 08:39:57 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>  
> > This where I wasn't comfortable with idea of calling random PCIe code
> > chunks and thought about chaining callbacks so that
> > pcie_cap_slot_[pre_]plug_cb() would do necessary PCIe steps
> > and acpi_pcihp_device_[pre_]plug_cb() do ACPI specific things not
> > intruding on each other, but that requires telling PCIe code that
> > it should not issue native hotplug event to guest.  
> 
> I think with both acpi and pcie hotplug being active it surely makes
> sense that both are in sync when it comes to device state.  So acpihp
> updating pcie slot state (power control, maybe also device presence)
> looks sane to me.
> 
> Not sure whenever it would be better to call into pcie code or just
> update the pci config space bits directly to make sure pcie doesn't
> take unwanted actions like sending out events.

If changing power state is preferred over disabling power control,
I can respin series with what Michael has suggested earlier and drop 2/4
as not necessary.

I'll wait for a day to see if there would more ideas/suggestions


> take care,
>   Gerd
> 


