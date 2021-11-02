Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ADB44345A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:10:33 +0100 (CET)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxIu-0008Pw-DV
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhxFg-0003BV-Lh
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhxFe-0000bb-Tm
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635872830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rrcRBIG6MU7mToL/+tM9E9xWkhtgbGbN0lbb1nVyZmw=;
 b=Lhr3euvdqqsdJPXh1/UiyUoqjHvB8/zn2MzuutAzn9k+hN8H1Adqt7kW5zcClPaA40ZnOz
 zrYmYNb8eVWdJ2IoYBNE/7N2hmX7HycVdCWltx7FG/CVQ7BBaNlvS4lynpOdgEto52YWIY
 Ivld6Vs0KTPd9YxbdMWmKiJkUkcZ3sk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-3fdYB0a_Oq-d1LJlZ6pFbg-1; Tue, 02 Nov 2021 13:07:09 -0400
X-MC-Unique: 3fdYB0a_Oq-d1LJlZ6pFbg-1
Received: by mail-ed1-f72.google.com with SMTP id
 i22-20020a05640242d600b003e28aecc0afso23488edc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rrcRBIG6MU7mToL/+tM9E9xWkhtgbGbN0lbb1nVyZmw=;
 b=gsOlPFMkRZ/7qK3uJlk1KITG5UnuZwBe7cOD2Ipy77GcCqNyouwGW9i++MsbMoxB9P
 7iTTXcHV90ZPgL4uxDHJ9PCZLkBbCJuDkL72dd1/sUXacaMDGB1Y1RcZKgIKpJHGa/L+
 /R3sIhZEU3WbeD1t7xTohI9tmUbT0KR/mU20Ia5D98EjwSdhyrsF88IcpftjDZFuzihF
 Hdo8UP2Mqtew/yT7pEzWH+UfYFu6Ezjeeck3EaXw9jqlrvkRkigfmAdpFpITh1+1aEZG
 XxIfqUZIeZ1hmiQRW8pbRfYhSQhnIcX5CIzSuKTsgjwILuXpla8om9dA9zhVhqOMDbL8
 sFuA==
X-Gm-Message-State: AOAM531Jx4MtIdcOvQ9q7iaBylyIhAHWDbPeo5WzhKtFkYZGJ7tsfF8q
 +Xx9OtflqrDVnaHtPP538T/yvNwObwyZFP5Mw6SN2EDqNDlWfDZbaGLmb0SqxQA0r25cQ/ocn5+
 WG4FiSUr+PcR2kW0=
X-Received: by 2002:a05:6402:40c6:: with SMTP id
 z6mr21341010edb.304.1635872828207; 
 Tue, 02 Nov 2021 10:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqwnw9RrODE68W3bIbcKoPpQHVTmi9UU3ubpnFOCRenTRj6dk1t8HELKhxsLLXur3HCFrzrQ==
X-Received: by 2002:a05:6402:40c6:: with SMTP id
 z6mr21340989edb.304.1635872828011; 
 Tue, 02 Nov 2021 10:07:08 -0700 (PDT)
Received: from redhat.com ([2.55.17.31])
 by smtp.gmail.com with ESMTPSA id i11sm883258ejw.55.2021.11.02.10.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 10:07:07 -0700 (PDT)
Date: Tue, 2 Nov 2021 13:07:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
Message-ID: <20211102130650-mutt-send-email-mst@kernel.org>
References: <20211102163342.31162-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211102163342.31162-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 04:33:42PM +0000, Stefan Hajnoczi wrote:
> Reported by Coverity (CID 1465222).
> 
> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
> Cc: Damien Hedde <damien.hedde@greensocs.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Ouch.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  softmmu/qdev-monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 4851de51a5..06f86a1a96 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -581,8 +581,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
>          if (prop) {
>              dev->id = id;
>          } else {
> -            g_free(id);
>              error_setg(errp, "Duplicate device ID '%s'", id);
> +            g_free(id);
>              return NULL;
>          }
>      } else {
> -- 
> 2.31.1


