Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C93B7781
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:00:40 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyI2J-0003Bh-O3
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyI0b-0002Qr-PR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyI0Y-0006xN-72
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624989528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3JjusDHpGMBICm9dSqBsovwlTZsI9B/n1UfSASg3FU=;
 b=BghtAK6P8I+0gt6IcY6TP40DlsNk777zkKYaBi9YBrJwDTp+fGVunVmxMbAUVF0h9zxBVd
 sWlcUew7tJSQ0et3EKU23rodxzTOJNYeKn/zAOO2o5q1BMlRH/eFZqZndPXlUsUkIvILBc
 R/F9R3HLcb8QVUBqMgz0Z8K86gdGmfw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-SWM8ZljTOZekylLWEm86MA-1; Tue, 29 Jun 2021 13:58:47 -0400
X-MC-Unique: SWM8ZljTOZekylLWEm86MA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u7-20020a5d46870000b029012786ba1bc9so29439wrq.21
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M3JjusDHpGMBICm9dSqBsovwlTZsI9B/n1UfSASg3FU=;
 b=cV9nUrLSh7qgN8k6K3feC+aJf9OnZDw/0q8xCecuvBg59EObFD4VJMXbmwy+oq2e+1
 pUpaqISKPrOSL3ddnRtQF+VH9rbmH1J0+F0kJzzKXj85NKGvcQYqTg6zsTSb49Iuxw9g
 Bj7ExbEcLX/0ZF/+1dhjqH+10eTqz2BEm6Ht/grf58qqcUIN/QePVE7flnCfQ+EIN6+8
 Un/liHBy0G9Vubd36A0yE30a+ktDKRlFldRZ41GCq1Z7EnIv/KBbnTopfQhPVvWzBgVh
 y1cGdFksOPSpJoo+DjPI7P8al9G0c9QVKHIq5jQMHBGa8Qgy+kk++1TauMTXbVZS/CVt
 Ye+Q==
X-Gm-Message-State: AOAM5326TkvEQmK7JOnOipTaXtDNUp6Spw1vS6yNl1AFQGxWNmIwNxYO
 /XQp09tSgLTio1i9Bfc/h/PwmvwB8hD2/S/dEp/M2xsrU5a9ip2qffH0FXK3jXVnvsGV3Ix/ix8
 X/3bWEA079h+vR1I=
X-Received: by 2002:a7b:c247:: with SMTP id b7mr1327772wmj.44.1624989526563;
 Tue, 29 Jun 2021 10:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo6ltgALLpWQiYHWv1iaJFyOvBCpL2dm+cdjQKuZGO9sY1Sfgtk+oKIB2N0Z/0QHgnIwzraw==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr1327747wmj.44.1624989526352;
 Tue, 29 Jun 2021 10:58:46 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id f13sm19241887wrt.86.2021.06.29.10.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 10:58:45 -0700 (PDT)
Date: Tue, 29 Jun 2021 18:58:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lei Rao <lei.rao@intel.com>
Subject: Re: [PATCH 1/7] Some minor optimizations for COLO
Message-ID: <YNtfUxT3wz5ByfZr@work-vm>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
 <1623898035-18533-2-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1623898035-18533-2-git-send-email-lei.rao@intel.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: like.xu.linux@gmail.com, lukasstraub2@web.de,
 zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com, quintela@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Lei Rao (lei.rao@intel.com) wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
> 
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


OK, although to be honest, I think the compiler will probably do this
for you.

>  migration/colo.c   | 2 +-
>  net/colo-compare.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/colo.c b/migration/colo.c
> index 79fa1f6..616dc00 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -152,7 +152,7 @@ static void primary_vm_do_failover(void)
>       * kick COLO thread which might wait at
>       * qemu_sem_wait(&s->colo_checkpoint_sem).
>       */
> -    colo_checkpoint_notify(migrate_get_current());
> +    colo_checkpoint_notify(s);
>  
>      /*
>       * Wake up COLO thread which may blocked in recv() or send(),
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b100e7b..4a64a5d 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -170,7 +170,7 @@ static bool packet_matches_str(const char *str,
>          return false;
>      }
>  
> -    return !memcmp(str, buf, strlen(str));
> +    return !memcmp(str, buf, packet_len);
>  }
>  
>  static void notify_remote_frame(CompareState *s)
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


