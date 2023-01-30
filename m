Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F3F680BA9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:11:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMS4K-0002P9-M9; Mon, 30 Jan 2023 06:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMS4G-0002D2-G4
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMS4E-0005qr-Jr
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmamAZnuPyPuyAaU6cFwbVS6cQQoxJNcQDzv/CGkJWo=;
 b=KXeS2bq7TdMPQnsTxMts91JcDJNk+zlkaDYYNZLXwGzO9zEsvfVjIEtNAuZ4FT6vBPHndb
 kRy2BD7YaDiH/L+nDvxbXD4Ayp0yyxXSmRZK5rhJmZFD9VnESwk8v5VecIJiKuRO2m4aA5
 ByYySAA7s4QkEHvTu07jdgXSIPalfrU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-qY-Mm5SPN_6gUzqfiSkYVA-1; Mon, 30 Jan 2023 06:11:16 -0500
X-MC-Unique: qY-Mm5SPN_6gUzqfiSkYVA-1
Received: by mail-ed1-f69.google.com with SMTP id
 j10-20020a05640211ca00b0049e385d5830so8048330edw.22
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 03:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TmamAZnuPyPuyAaU6cFwbVS6cQQoxJNcQDzv/CGkJWo=;
 b=3x6eVQBPRi8DHn17hKt/33ougU6PALnE1qV1gbMOpLukPi6xLmnMvxx/SCsiRXKxGF
 XZLHy3fVOeS0uoJIWZsJlLlW9Fb9KnFTSDPKkFsxjndlQvNst6mSc7vxXXmr5yyTsRMI
 cV6w1ef2KJEpIMJURZc942Li509AE5y2UvrTwZX24I1HdusxXB7BWYtNemPoqtE7jCcs
 DUpShX7fmJMUzawXtwVWLtqvrNePbWa7YmNGl/YCZKZCKOKTEZRmbHsgT6rdVSZGB1tJ
 Z902owrpztZIBLX70xjh37FnHzhWM9SeNEqq5uUr9TiskbaOh9yf1KvAKL2zWAJJcfYl
 6Ywg==
X-Gm-Message-State: AO0yUKWwPKfX0+boM7hLYYOSG/tqUZrF43UvybIrZTdHMWG4eLwWbuNF
 30If4rSA88F71QgFC86FrlqIHav4qSkmTEjxBVIzCREzMibZECe76XAMoP//K9ytnk2jyqH+UUm
 i8u6O5uQ0OZNLMqg=
X-Received: by 2002:a17:906:9b90:b0:87b:f7dd:792f with SMTP id
 dd16-20020a1709069b9000b0087bf7dd792fmr14284854ejc.8.1675077075566; 
 Mon, 30 Jan 2023 03:11:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+MfXAL5XpJxtlUJouQ2E/ppO7vtpXQfag5l2x4Vvj5AqOUfAQoGhYiX+1miYGfPrOuAZ9QRA==
X-Received: by 2002:a17:906:9b90:b0:87b:f7dd:792f with SMTP id
 dd16-20020a1709069b9000b0087bf7dd792fmr14284832ejc.8.1675077075285; 
 Mon, 30 Jan 2023 03:11:15 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 kk4-20020a170907766400b0087943d525e1sm5841076ejc.215.2023.01.30.03.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:11:14 -0800 (PST)
Date: Mon, 30 Jan 2023 06:11:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, stephen@networkplumber.org,
 chenbo.xia@intel.com, thomas@monjalon.net, dmarchan@redhat.com
Subject: Re: [PATCH 2/3] libvhost-user: Adopt new backend naming
Message-ID: <20230130061037-mutt-send-email-mst@kernel.org>
References: <20230130104548.13262-1-maxime.coquelin@redhat.com>
 <20230130104548.13262-3-maxime.coquelin@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130104548.13262-3-maxime.coquelin@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 11:45:47AM +0100, Maxime Coquelin wrote:
> In order to get rid of harmful language, the Vhost-user
> specification changed features and requests naming from
> _SLAVE_ to _BACKEND_.


let's drop "to get rid of the remaining harmful language" 
as don't get rid of it.  consistency is sufficient motivation.


> This patch adopts the new naming convention.
> 
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 20 ++++++++++----------
>  subprojects/libvhost-user/libvhost-user.h | 20 ++++++++++----------
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> index fc69783d2b..f661af7c85 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -140,7 +140,7 @@ vu_request_to_string(unsigned int req)
>          REQ(VHOST_USER_SET_VRING_ENABLE),
>          REQ(VHOST_USER_SEND_RARP),
>          REQ(VHOST_USER_NET_SET_MTU),
> -        REQ(VHOST_USER_SET_SLAVE_REQ_FD),
> +        REQ(VHOST_USER_SET_BACKEND_REQ_FD),
>          REQ(VHOST_USER_IOTLB_MSG),
>          REQ(VHOST_USER_SET_VRING_ENDIAN),
>          REQ(VHOST_USER_GET_CONFIG),
> @@ -1365,7 +1365,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
>      int qidx = vq - dev->vq;
>      int fd_num = 0;
>      VhostUserMsg vmsg = {
> -        .request = VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
> +        .request = VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG,
>          .flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
>          .size = sizeof(vmsg.payload.area),
>          .payload.area = {
> @@ -1383,7 +1383,7 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
>  
>      vmsg.fd_num = fd_num;
>  
> -    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD)) {
> +    if (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD)) {
>          return false;
>      }
>  
> @@ -1461,9 +1461,9 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
>       */
>      uint64_t features = 1ULL << VHOST_USER_PROTOCOL_F_MQ |
>                          1ULL << VHOST_USER_PROTOCOL_F_LOG_SHMFD |
> -                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_REQ |
> +                        1ULL << VHOST_USER_PROTOCOL_F_BACKEND_REQ |
>                          1ULL << VHOST_USER_PROTOCOL_F_HOST_NOTIFIER |
> -                        1ULL << VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD |
> +                        1ULL << VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD |
>                          1ULL << VHOST_USER_PROTOCOL_F_REPLY_ACK |
>                          1ULL << VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS;
>  
> @@ -1494,7 +1494,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
>  
>      if (vu_has_protocol_feature(dev,
>                                  VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS) &&
> -        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_REQ) ||
> +        (!vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_REQ) ||
>           !vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_REPLY_ACK))) {
>          /*
>           * The use case for using messages for kick/call is simulation, to make
> @@ -1507,7 +1507,7 @@ vu_set_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
>           * that actually enables the simulation case.
>           */
>          vu_panic(dev,
> -                 "F_IN_BAND_NOTIFICATIONS requires F_SLAVE_REQ && F_REPLY_ACK");
> +                 "F_IN_BAND_NOTIFICATIONS requires F_BACKEND_REQ && F_REPLY_ACK");
>          return false;
>      }
>  
> @@ -1910,7 +1910,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
>          return vu_get_queue_num_exec(dev, vmsg);
>      case VHOST_USER_SET_VRING_ENABLE:
>          return vu_set_vring_enable_exec(dev, vmsg);
> -    case VHOST_USER_SET_SLAVE_REQ_FD:
> +    case VHOST_USER_SET_BACKEND_REQ_FD:
>          return vu_set_slave_req_fd(dev, vmsg);
>      case VHOST_USER_GET_CONFIG:
>          return vu_get_config(dev, vmsg);
> @@ -2416,9 +2416,9 @@ static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
>      if (vq->call_fd < 0 &&
>          vu_has_protocol_feature(dev,
>                                  VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS) &&
> -        vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
> +        vu_has_protocol_feature(dev, VHOST_USER_PROTOCOL_F_BACKEND_REQ)) {
>          VhostUserMsg vmsg = {
> -            .request = VHOST_USER_SLAVE_VRING_CALL,
> +            .request = VHOST_USER_BACKEND_VRING_CALL,
>              .flags = VHOST_USER_VERSION,
>              .size = sizeof(vmsg.payload.state),
>              .payload.state = {
> diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
> index 8cda9b8f57..8c5a2719e3 100644
> --- a/subprojects/libvhost-user/libvhost-user.h
> +++ b/subprojects/libvhost-user/libvhost-user.h
> @@ -54,12 +54,12 @@ enum VhostUserProtocolFeature {
>      VHOST_USER_PROTOCOL_F_RARP = 2,
>      VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
>      VHOST_USER_PROTOCOL_F_NET_MTU = 4,
> -    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
> +    VHOST_USER_PROTOCOL_F_BACKEND_REQ = 5,
>      VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
>      VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
>      VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
>      VHOST_USER_PROTOCOL_F_CONFIG = 9,
> -    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
> +    VHOST_USER_PROTOCOL_F_BACKEND_SEND_FD = 10,
>      VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
>      VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
>      VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
> @@ -92,7 +92,7 @@ typedef enum VhostUserRequest {
>      VHOST_USER_SET_VRING_ENABLE = 18,
>      VHOST_USER_SEND_RARP = 19,
>      VHOST_USER_NET_SET_MTU = 20,
> -    VHOST_USER_SET_SLAVE_REQ_FD = 21,
> +    VHOST_USER_SET_BACKEND_REQ_FD = 21,
>      VHOST_USER_IOTLB_MSG = 22,
>      VHOST_USER_SET_VRING_ENDIAN = 23,
>      VHOST_USER_GET_CONFIG = 24,
> @@ -113,13 +113,13 @@ typedef enum VhostUserRequest {
>  } VhostUserRequest;
>  
>  typedef enum VhostUserSlaveRequest {
> -    VHOST_USER_SLAVE_NONE = 0,
> -    VHOST_USER_SLAVE_IOTLB_MSG = 1,
> -    VHOST_USER_SLAVE_CONFIG_CHANGE_MSG = 2,
> -    VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG = 3,
> -    VHOST_USER_SLAVE_VRING_CALL = 4,
> -    VHOST_USER_SLAVE_VRING_ERR = 5,
> -    VHOST_USER_SLAVE_MAX
> +    VHOST_USER_BACKEND_NONE = 0,
> +    VHOST_USER_BACKEND_IOTLB_MSG = 1,
> +    VHOST_USER_BACKEND_CONFIG_CHANGE_MSG = 2,
> +    VHOST_USER_BACKEND_VRING_HOST_NOTIFIER_MSG = 3,
> +    VHOST_USER_BACKEND_VRING_CALL = 4,
> +    VHOST_USER_BACKEND_VRING_ERR = 5,
> +    VHOST_USER_BACKEND_MAX
>  }  VhostUserSlaveRequest;
>  
>  typedef struct VhostUserMemoryRegion {
> -- 
> 2.39.1


