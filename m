Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4743E60F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:24:32 +0200 (CEST)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8Cd-00071M-Vy
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mg7t5-0003vd-Gr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:04:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mg7t2-0005U8-SN
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635437056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HS20Tju8PE0VNJM4FebsX/8e3EQ5O29vTqAM6dKKvw=;
 b=DjtClXK5U8uKtu3XUe9sZx/JemfAFd2yz8If79yuFP+Yonna8JteKuXt1A/nkoAubctfcg
 reLiAp0qTKS8Qu9F9UNjrqdspX3wfw0HW284Bze3PKQYTHcPNsuri+gLQ8rr2pwL9jYzZa
 Wl5RHpCCDgOXJdhHqjWUO6/f3h7ufJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-CKZlBilKMc-kv03e95yL_Q-1; Thu, 28 Oct 2021 12:04:15 -0400
X-MC-Unique: CKZlBilKMc-kv03e95yL_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so2574636wmc.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=5HS20Tju8PE0VNJM4FebsX/8e3EQ5O29vTqAM6dKKvw=;
 b=Bz3MMCaOzxBnwO6WmaQvFxd2l6uTOlcb+29irqnZoSPYdvXMmh7Ss+R+4Y717HxG3q
 y1f6jVrKIhy3UGsj2XWTGiIH3VFsGR9Nj2C0wehYDZW0ypoqcau4qtZzJODHDpCUApiH
 f6Ly4Z2y3B7g73Wo9yDxbnvzZ2IWyLJu4auE6S+J0w1Mf6N5aBRQVXV3eW0qlcPlHD3S
 k0nrVKSbuTRAnAnLMIedYQdJKu6fNDu8DeLsxo02BEs5HcXZ+xMiypPlOIaLsPwcl21u
 Yb3/SrCS0MwLkektb4Gj5FoxJoV2MWyLj9VygPWryca3pMCUdZQjpITG7s7HtfBqs5W6
 koEQ==
X-Gm-Message-State: AOAM530cv0a9liQxabijpW78Rjm6vXAawxh6uYdy0X/sk6alkPGiC6OI
 gbJEg+X2Kbp9Ids0TFWZxDukFVYr4vp1/JxW8TTjhAksMkCnbrHPCWLHnfxWpsq1mUCSXkOeNS6
 Mtz5VQJcF6G7X4Ng=
X-Received: by 2002:adf:e388:: with SMTP id e8mr6968029wrm.104.1635437053516; 
 Thu, 28 Oct 2021 09:04:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaYI1qTEHsvrNNIKE8X/F3pa8GNKOvjITWNGHC8B0BvxlWOSFkoLf4PQON9xlk7KIW4h64mw==
X-Received: by 2002:adf:e388:: with SMTP id e8mr6967948wrm.104.1635437053051; 
 Thu, 28 Oct 2021 09:04:13 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f8sm3315520wrj.41.2021.10.28.09.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:04:12 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:04:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 02/22] monitor: make hmp_handle_error return a boolean
Message-ID: <YXrJ+oL+GmbEFsji@work-vm>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028155457.967291-3-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> This turns the pattern
> 
>   if (err) {
>      hmp_handle_error(mon, err);
>      return;
>   }
> 
> into
> 
>   if (hmp_handle_error(mon, err);
                                  ^^^ {
>      return;
>   }
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Yeh, I guess so, doesn't save much.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/core/machine-hmp-cmds.c |  3 +--
>  include/monitor/hmp.h      |  2 +-
>  monitor/hmp-cmds.c         | 28 +++++++++++-----------------
>  3 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
> index 76b22b00d6..c356783ab9 100644
> --- a/hw/core/machine-hmp-cmds.c
> +++ b/hw/core/machine-hmp-cmds.c
> @@ -53,8 +53,7 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>      HotpluggableCPUList *saved = l;
>      CpuInstanceProperties *c;
>  
> -    if (err != NULL) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 6bc27639e0..a2cb002a3a 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -16,7 +16,7 @@
>  
>  #include "qemu/readline.h"
>  
> -void hmp_handle_error(Monitor *mon, Error *err);
> +bool hmp_handle_error(Monitor *mon, Error *err);
>  
>  void hmp_info_name(Monitor *mon, const QDict *qdict);
>  void hmp_info_version(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index bcaa41350e..9031cea881 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -62,11 +62,13 @@
>  #include <spice/enums.h>
>  #endif
>  
> -void hmp_handle_error(Monitor *mon, Error *err)
> +bool hmp_handle_error(Monitor *mon, Error *err)
>  {
>      if (err) {
>          error_reportf_err(err, "Error: ");
> +        return true;
>      }
> +    return false;
>  }
>  
>  /*
> @@ -577,8 +579,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
>  
>      info2l = qmp_query_vnc_servers(&err);
>      info2l_head = info2l;
> -    if (err) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>      if (!info2l) {
> @@ -693,8 +694,7 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      info = qmp_query_balloon(&err);
> -    if (err) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> @@ -1065,8 +1065,7 @@ void hmp_ringbuf_read(Monitor *mon, const QDict *qdict)
>      int i;
>  
>      data = qmp_ringbuf_read(chardev, size, false, 0, &err);
> -    if (err) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> @@ -1582,8 +1581,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>  
>      qmp_migrate(uri, !!blk, blk, !!inc, inc,
>                  false, false, true, resume, &err);
> -    if (err) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> @@ -1917,8 +1915,7 @@ void hmp_rocker(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      rocker = qmp_query_rocker(name, &err);
> -    if (err != NULL) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> @@ -1936,8 +1933,7 @@ void hmp_rocker_ports(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      list = qmp_query_rocker_ports(name, &err);
> -    if (err != NULL) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> @@ -1965,8 +1961,7 @@ void hmp_rocker_of_dpa_flows(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      list = qmp_query_rocker_of_dpa_flows(name, tbl_id != -1, tbl_id, &err);
> -    if (err != NULL) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> @@ -2115,8 +2110,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      list = qmp_query_rocker_of_dpa_groups(name, type != 9, type, &err);
> -    if (err != NULL) {
> -        hmp_handle_error(mon, err);
> +    if (hmp_handle_error(mon, err)) {
>          return;
>      }
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


