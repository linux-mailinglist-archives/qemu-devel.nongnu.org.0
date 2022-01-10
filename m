Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733C48957D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:42:42 +0100 (CET)
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rCL-0002HK-Er
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:42:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6rA8-0000Mq-Fn
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6rA4-0006UN-UE
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641807620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uoT/T0E7Dupu7dKsTBj0XHcN3CmM3Z2zrJQdAeodpKE=;
 b=IF9svqY2X1nrGAwCyB1o/hK+Fc1tTdUNBxvDjHTP9xwoYR6r9VgK4wid384++7ZFFnHfRd
 mJcvraWLcg4e8XyWQGzNlUqmrry12zJVyV9VOilRiCHJ9QDsb+qomLFzckVEnRLg41HwPi
 Tz5GS1KFSVCf1FZfO5871SRmj6ajscQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-jR3nbRxpOnemC31eh2kBqw-1; Mon, 10 Jan 2022 04:40:14 -0500
X-MC-Unique: jR3nbRxpOnemC31eh2kBqw-1
Received: by mail-ed1-f72.google.com with SMTP id
 y10-20020a056402358a00b003f88b132849so9680759edc.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uoT/T0E7Dupu7dKsTBj0XHcN3CmM3Z2zrJQdAeodpKE=;
 b=NxqF4jb0CLITQqy8zfaMjKAQ6QcDJwJI3Izfsz3gYb032INsxF7RFZIBLceYOVikPq
 Hs1pA7gcDEad25KkRx/FZGT3PM0TolgidBVPUla4iP7Qk8LiJIa+GwOfdivTeOfgDXgo
 ouR3GuVLrILtN4Nxtw1Dz2m/GDZaNRB1V4bvrYG59JeJmPsA8wAXUDSgfGHSM+C6jJ7x
 /KWMw0QdHffaONQidtY+xQuCeHfXlMCnQQsnyT8VP/Y7903NV03bmmq48VGNr0/icW39
 2mG+ZLW6pBaTTMkvJNBvy6OBuH7JBgfDkp0flRPbN7JwaoQX3UCKJhKsfWl3Yu8eeIAE
 b6MA==
X-Gm-Message-State: AOAM532NVFCDe/smQPFljRgdnF2D72hmdAhtJiTmSGGlEy5qsOgZq2ya
 yWlSJMIne/16PS2Rr42oDorIHKDTCB+Gwy4RxsEjmjcq/7eQgYTteXcFB4fpZAEZy3BsJg880ig
 bhV+Y4WqnEHTuyw4=
X-Received: by 2002:aa7:cf12:: with SMTP id a18mr9442190edy.378.1641807613130; 
 Mon, 10 Jan 2022 01:40:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1ueQi0e76Nm1qOC+kaFoy9FrE/eUiFy5HqcillWYypatlXLxQHx6JuVoKnPc+sNuo1Ce2fQ==
X-Received: by 2002:aa7:cf12:: with SMTP id a18mr9442170edy.378.1641807612919; 
 Mon, 10 Jan 2022 01:40:12 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id 2sm2213305ejv.109.2022.01.10.01.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:40:12 -0800 (PST)
Date: Mon, 10 Jan 2022 04:40:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 4/5] libvhost-user: prevent over-running max RAM slots
Message-ID: <20220110043727-mutt-send-email-mst@kernel.org>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-5-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220106064717.7477-5-raphael.norwitz@nutanix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 06:47:35AM +0000, Raphael Norwitz wrote:
> When VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS support was added to
> libvhost-user, no guardrails were added to protect against QEMU
> attempting to hot-add too many RAM slots to a VM with a libvhost-user
> based backed attached.
> 
> This change adds the missing error handling by introducing a check on
> the number of RAM slots the device has available before proceeding to
> process the VHOST_USER_ADD_MEM_REG message.
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index 77ddc96ddf..0fe3aa155b 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -690,6 +690,11 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>      VuDevRegion *dev_region = &dev->regions[dev->nregions];
>      void *mmap_addr;
>  
> +    if (dev->nregions == VHOST_USER_MAX_RAM_SLOTS) {
> +        vu_panic(dev, "No free ram slots available");

A bit more verbose maybe? Describe what happened to trigger this?
e.g. adding a region with no free ram slots?

> +        return false;
> +    }
> +
>      if (vmsg->fd_num != 1 ||
>          vmsg->size != sizeof(vmsg->payload.memreg)) {
>          vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
> -- 
> 2.20.1


