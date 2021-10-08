Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D90426D63
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:19:31 +0200 (CEST)
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrek-0001Ld-FD
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mYrd4-0007x5-Ry
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mYrcv-0004ec-0M
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633706254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpbJUyhX+0Q2+Kl//tuSLdYoL1L5OUtVk8j4IpUmJNo=;
 b=b7h6yQK4uPmrR1pfs2BftxuUZblbJ37NjTPiTSP9lb25HOj9sIH7+sOD1MAVLnQzQ4xuAN
 93UJfxrIjplZWQ2FUXObcxI9WHcgTd8lgDxA/jDdMkh2WzhbpEczVGSpTYOZ1p/Yn7l9P0
 LCSNLd487g2ddDTGcOr7oG/UeU6ute4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-nptFM3XJPQ2r1byC4gw8CA-1; Fri, 08 Oct 2021 11:17:34 -0400
X-MC-Unique: nptFM3XJPQ2r1byC4gw8CA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k16-20020a5d6290000000b00160753b430fso7617074wru.11
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gpbJUyhX+0Q2+Kl//tuSLdYoL1L5OUtVk8j4IpUmJNo=;
 b=H4ff1e8NZJ5X1GlBo6LsWryMhvqridm/3WM4wwrvo1HWYWDGcYuDmuhO5577BnJ29Q
 B2t+x7semy4rf0UYcfRQ6amcHNzzit+/cm32ffrCY6mPpVo3Sb4rTGGiUdlCsGPj4jcQ
 vXjIiO9gbbdT/qbDxHP1hF5vOzxFjGkOfDfVNH83GaYpTtfmccZHZOxS0RbTApTU/8Ly
 P4H49nUjpYS+yN9autk7OFo+CZy5+j+pkX4OnP0l9SNJ4FwuDcCZgUfQkLUZHdgeTmBR
 0GvAKAvFjL1gerPNJdd6UyVCrpxtT8K2xIA/DjWFQsp3ImD3ZW1ex96sYxoJVHzqaDZM
 ZDyg==
X-Gm-Message-State: AOAM530sEMLoii8ZZSOzeFeOb4kjVILa/IKjz+le3p35B2qCT4LyKtlP
 TXRHNcAuCqiPrpbL5ZETDMqYiYMhUJiAnmWz4dyv72/SdP4YsTjVqEhnz+79rzb2CN88FPwc5fz
 o4q9i43JEQ4HxrcU=
X-Received: by 2002:a05:600c:4f12:: with SMTP id
 l18mr4084659wmq.156.1633706252861; 
 Fri, 08 Oct 2021 08:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeaxMQ9IU/CDRcxqDiZBQ4hqjgAYQ+MwtCaE2J8fXwky4ykQb4OriUnlxa2P/QGfKSFVmkkA==
X-Received: by 2002:a05:600c:4f12:: with SMTP id
 l18mr4084532wmq.156.1633706251685; 
 Fri, 08 Oct 2021 08:17:31 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.3.114])
 by smtp.gmail.com with ESMTPSA id v10sm2945747wri.29.2021.10.08.08.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 08:17:31 -0700 (PDT)
Message-ID: <924b4711-574f-0629-782f-09199a799d78@redhat.com>
Date: Fri, 8 Oct 2021 17:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 14/15] qdev: Base object creation on QDict rather than
 QemuOpts
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-15-kwolf@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211008133442.141332-15-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: damien.hedde@greensocs.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 libvir-list@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, its@irrelevant.dk,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/2021 15:34, Kevin Wolf wrote:
> QDicts are both what QMP natively uses and what the keyval parser
> produces. Going through QemuOpts isn't useful for either one, so switch
> the main device creation function to QDicts. By sharing more code with
> the -object/object-add code path, we can even reduce the code size a
> bit.
> 
> This commit doesn't remove the detour through QemuOpts from any code
> path yet, but it allows the following commits to do so.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/hw/qdev-core.h         | 11 +++---
>   include/hw/virtio/virtio-net.h |  3 +-
>   include/monitor/qdev.h         |  2 +
>   hw/core/qdev.c                 |  7 ++--
>   hw/net/virtio-net.c            | 23 +++++++-----
>   hw/vfio/pci.c                  |  4 +-
>   softmmu/qdev-monitor.c         | 69 +++++++++++++++-------------------
>   7 files changed, 60 insertions(+), 59 deletions(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 74d8b614a7..910042c650 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -180,7 +180,7 @@ struct DeviceState {
>       char *canonical_path;
>       bool realized;
>       bool pending_deleted_event;
> -    QemuOpts *opts;
> +    QDict *opts;
>       int hotplugged;
>       bool allow_unplug_during_migration;
>       BusState *parent_bus;
> @@ -205,8 +205,8 @@ struct DeviceListener {
>        * On errors, it returns false and errp is set. Device creation
>        * should fail in this case.
>        */
> -    bool (*hide_device)(DeviceListener *listener, QemuOpts *device_opts,
> -                        Error **errp);
> +    bool (*hide_device)(DeviceListener *listener, const QDict *device_opts,
> +                        bool from_json, Error **errp);
>       QTAILQ_ENTRY(DeviceListener) link;
>   };
>   
> @@ -835,13 +835,14 @@ void device_listener_unregister(DeviceListener *listener);
>   
>   /**
>    * @qdev_should_hide_device:
> - * @opts: QemuOpts as passed on cmdline.
> + * @opts: options QDict > + * @from_json: true if @opts entries are typed, false for all strings

Add the errp here too:

     * @errp: pointer to error object

>    *
>    * Check if a device should be added.
>    * When a device is added via qdev_device_add() this will be called,
>    * and return if the device should be added now or not.
>    */
> -bool qdev_should_hide_device(QemuOpts *opts, Error **errp);
> +bool qdev_should_hide_device(const QDict *opts, bool from_json, Error **errp);
>   
>   typedef enum MachineInitPhase {
>       /* current_machine is NULL.  */

Thank you to have added the errp pointer in the hide_device helpers, it helps in my series.

Laurent


