Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851CE6936C9
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 11:00:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pR97f-00031M-Pk; Sun, 12 Feb 2023 04:58:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pR97d-000313-6V
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 04:58:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pR97b-0001M6-02
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 04:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676195889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBkrUlHUaSWxAi7OMw1gTNarve0pP4gSSwcBL65GRcw=;
 b=DzR0zofAkyNRfQ41mzhL67oqTTCIkktd2s6QKYudPLY/wJD7yuQ0nG5iTJo6sYGzJ2JDO7
 HWA9+EJN4AJ9lnllQ7/ZtehBXr5yUVhn1t3n9sucQrZOurmQxKonRp5jCz3FDIjeJWPblL
 maqguCY+0fZraPjGmz/tNomOha3Tvps=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-NPD0FPvQPoKLVmzrjRMDrg-1; Sun, 12 Feb 2023 04:58:07 -0500
X-MC-Unique: NPD0FPvQPoKLVmzrjRMDrg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y17-20020a056402359100b004acc4f8aa3fso182866edc.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 01:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBkrUlHUaSWxAi7OMw1gTNarve0pP4gSSwcBL65GRcw=;
 b=MRtb1ETes49FYrx5/ZQQTwsfbQJsF+PTM56sE9zX9uhxFXQrKH1F2aQVGReG+6chxQ
 5w/AnDyfY3LFeeygH4HTZjPAZwFN5oIKA8IeSa5CDVB7mogSRiSMF0WNe1UaqRI0gCcG
 PSfg3O4vPiBk6mrCCi1opb82ZZZaVf5lN17tL2zSoIqY67ZXiHb6eI5tXk8ULgvw/Mpc
 PiDvaRuYLCnV0h7+xIGMuIPFkdJHR3hCHhFP4WQHHs3qQnMF+lD3f1DVvSgbmdcPcD2Q
 ChWOzWUdBBNc9O4ExhCa5bt2NJ/jCHhNSI3lEt1fnHPwszIS5vrt+Ae4r/Fg37CMzOBH
 mPRw==
X-Gm-Message-State: AO0yUKUjagVLf1vIWIGWiMThoJynh5NZMNYQhd0Jo+89MaKCBZdfUUnS
 daXQJNty7msT4MJpjMAxNJdg3XMwRAuWXIjV20cqQtKh0IdjEkp6kKDM9O4pCiglPKTPbUhbSJi
 OCac2DZugU5e2Jqo=
X-Received: by 2002:a17:906:a18f:b0:872:84dd:8903 with SMTP id
 s15-20020a170906a18f00b0087284dd8903mr22453162ejy.59.1676195885453; 
 Sun, 12 Feb 2023 01:58:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/xOHC6jTj3HBsy3Qh8ghmS6W1Ygvc5RbCdFNmzvL4b85tiTrJRaaNwu+nqn7TQCzqOA+aK6w==
X-Received: by 2002:a17:906:a18f:b0:872:84dd:8903 with SMTP id
 s15-20020a170906a18f00b0087284dd8903mr22453149ejy.59.1676195885159; 
 Sun, 12 Feb 2023 01:58:05 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 k6-20020a1709065fc600b0081bfc79beaesm5036503ejv.75.2023.02.12.01.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 01:58:04 -0800 (PST)
Date: Sun, 12 Feb 2023 04:58:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] vhost: avoid a potential use of an uninitialized
 variable in vhost_svq_poll()
Message-ID: <20230212045724-mutt-send-email-mst@kernel.org>
References: <20230210102915.8707-1-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230210102915.8707-1-clopez@suse.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Feb 10, 2023 at 11:29:16AM +0100, Carlos López wrote:
> In vhost_svq_poll(), if vhost_svq_get_buf() fails due to a device
> providing invalid descriptors, len is left uninitialized and returned
> to the caller, potentally leaking stack data or causing undefined
> behavior.
> 
> Fix this by initializing len to 0.
> 
> Found with GCC 13 and -fanalyzer (abridged):
> 
> ../hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_svq_poll’:
> ../hw/virtio/vhost-shadow-virtqueue.c:538:12: warning: use of uninitialized value ‘len’ [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
>   538 |     return len;
>       |            ^~~
>   ‘vhost_svq_poll’: events 1-4
>     |
>     |  522 | size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
>     |      |        ^~~~~~~~~~~~~~
>     |      |        |
>     |      |        (1) entry to ‘vhost_svq_poll’
>     |......
>     |  525 |     uint32_t len;
>     |      |              ~~~
>     |      |              |
>     |      |              (2) region created on stack here
>     |      |              (3) capacity: 4 bytes
>     |......
>     |  528 |         if (vhost_svq_more_used(svq)) {
>     |      |             ~
>     |      |             |
>     |      |             (4) inlined call to ‘vhost_svq_more_used’ from ‘vhost_svq_poll’
> 
>     (...)
> 
>     |  528 |         if (vhost_svq_more_used(svq)) {
>     |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>     |      |            ||
>     |      |            |(8) ...to here
>     |      |            (7) following ‘true’ branch...
>     |......
>     |  537 |     vhost_svq_get_buf(svq, &len);
>     |      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     |      |     |
>     |      |     (9) calling ‘vhost_svq_get_buf’ from ‘vhost_svq_poll’
>     |
>     +--> ‘vhost_svq_get_buf’: events 10-11
>            |
>            |  416 | static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>            |      |                          ^~~~~~~~~~~~~~~~~
>            |      |                          |
>            |      |                          (10) entry to ‘vhost_svq_get_buf’
>            |......
>            |  423 |     if (!vhost_svq_more_used(svq)) {
>            |      |          ~
>            |      |          |
>            |      |          (11) inlined call to ‘vhost_svq_more_used’ from ‘vhost_svq_get_buf’
>            |
> 
>            (...)
> 
>            |
>          ‘vhost_svq_get_buf’: event 14
>            |
>            |  423 |     if (!vhost_svq_more_used(svq)) {
>            |      |        ^
>            |      |        |
>            |      |        (14) following ‘false’ branch...
>            |
>          ‘vhost_svq_get_buf’: event 15
>            |
>            |cc1:
>            | (15): ...to here
>            |
>     <------+
>     |
>   ‘vhost_svq_poll’: events 16-17
>     |
>     |  537 |     vhost_svq_get_buf(svq, &len);
>     |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     |      |     |
>     |      |     (16) returning to ‘vhost_svq_poll’ from ‘vhost_svq_get_buf’
>     |  538 |     return len;
>     |      |            ~~~
>     |      |            |
>     |      |            (17) use of uninitialized value ‘len’ here
> 
> Signed-off-by: Carlos López <clopez@suse.de>

Thanks for the fix!
Could you add a Fixes tag? Which version introduced this?


> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 4307296358..515ccf870d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -522,7 +522,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>  size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
>  {
>      int64_t start_us = g_get_monotonic_time();
> -    uint32_t len;
> +    uint32_t len = 0;
>  
>      do {
>          if (vhost_svq_more_used(svq)) {
> -- 
> 2.35.3


