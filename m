Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660EF453A42
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 20:35:18 +0100 (CET)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4Ef-0007Zc-Aq
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 14:35:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn4Be-0005ZU-6V
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mn4Bb-0004Bv-FB
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637091125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGHinHfIb+ijQ1yzYI87boYgDvLIZNd/UokJcdgxnj8=;
 b=HvhkrX2v9My0og+hg6p+xhtnCA2T4YeCsEI5WIUZWQLLI1by+zTQGFwhsCpMxpqbO5AFAU
 tFf6Ef3wzttpVVxIlDRfL3+Rip/YhdpBzEYZdozU5kyryBQNHizzR4lW8zPKEw9s1G6tkn
 RwFOWInSx0wV8KK7Z+mwHCyguDoIYY8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-cd35-RGBPd-xyownHtuLJg-1; Tue, 16 Nov 2021 14:32:04 -0500
X-MC-Unique: cd35-RGBPd-xyownHtuLJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 v10-20020aa7d9ca000000b003e7bed57968so6912328eds.23
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 11:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGHinHfIb+ijQ1yzYI87boYgDvLIZNd/UokJcdgxnj8=;
 b=77OOYhxzW/YKmhExenJzq26GGrU4Hqy+e/iKO29HUBeKcxPwvbbxwDJHUFyrSIZGSt
 uvF9Knknw7LnX7XaM30CjC871y3InvZeHCrb6OkHLck8miM2FXwh0ikCVnGv5s7s3oEU
 lJeI3xRxe0vbnt2Ero2k33O7gXfU/E/YcWM/G3hxctnu6HPKndM0R9kHus/wbr6OmN9C
 K7MRXOql5qkysWm3ll49mXicUp7YTcdlvF7ZeGwan00754R/vwDoF24HNpHzp1x1DshI
 7wxJcBClZ8GjS0PLmltJcN/AT0HMDSe2PprL+GMBg+cFwuLCRcTVN45oWZAa6+6iNubp
 kARA==
X-Gm-Message-State: AOAM533El5y74vlR/Dik/xsTblbjTkYzH1UWoshctEKGx20eDfvFxg4g
 9wHaVUy9SuR+fQEx7JSutOvMt4LJHI68ELSVcND4R3OMaZ8qQcxqKPO3cxNb3lUJELFAAyaPFLk
 dGpYVdOuxWUADSsI=
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr12393001edb.345.1637091122824; 
 Tue, 16 Nov 2021 11:32:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIREV+jl6W3uZCXpfNZq921Pb1ztt3FIqpS2t+xf7tnDANNq402AN0VCPWNBUOvg4Nk0j9jQ==
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr12392970edb.345.1637091122623; 
 Tue, 16 Nov 2021 11:32:02 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id h7sm4702259ede.40.2021.11.16.11.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:32:02 -0800 (PST)
Date: Tue, 16 Nov 2021 20:32:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 20/20] pcie: expire pending delete
Message-ID: <20211116203200.02fda064@redhat.com>
In-Reply-To: <20211115163607.177432-21-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
 <20211115163607.177432-21-mst@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel
 P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 11:39:09 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> From: Gerd Hoffmann <kraxel@redhat.com>
> 
> Add an expire time for pending delete, once the time is over allow
> pressing the attention button again.
> 
> This makes pcie hotplug behave more like acpi hotplug, where one can
> try sending an 'device_del' monitor command again in case the guest
> didn't respond to the first attempt.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-Id: <20211111130859.1171890-7-kraxel@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/hw/qdev-core.h | 1 +
>  hw/pci/pcie.c          | 2 ++
>  softmmu/qdev-monitor.c | 4 +++-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 72622bd337..20d3066595 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -181,6 +181,7 @@ struct DeviceState {
>      char *canonical_path;
>      bool realized;
>      bool pending_deleted_event;
> +    int64_t pending_deleted_expires_ms;
>      QDict *opts;
>      int hotplugged;
>      bool allow_unplug_during_migration;
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index a930ac738a..c5ed266337 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -548,6 +548,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
>      }
>  
>      dev->pending_deleted_event = true;
> +    dev->pending_deleted_expires_ms =
> +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */

do we block migration if unplug was requested?
(if not we might loose this state on destionatio, do we care about it?)

>  
>      /* In case user cancel the operation of multi-function hot-add,
>       * remove the function that is unexposed to guest individually,
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 588a62b88d..5925f1ae5f 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -943,7 +943,9 @@ void qmp_device_del(const char *id, Error **errp)
>  {
>      DeviceState *dev = find_device_state(id, errp);
>      if (dev != NULL) {
> -        if (dev->pending_deleted_event) {
> +        if (dev->pending_deleted_event &&
> +            (dev->pending_deleted_expires_ms == 0 ||
> +             dev->pending_deleted_expires_ms > qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL))) {
>              error_setg(errp, "Device %s is already in the "
>                               "process of unplug", id);
>              return;


