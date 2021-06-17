Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359F13AB7CF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:43:46 +0200 (CEST)
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuBF-00032h-8g
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltu93-0000hN-9U
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltu91-0002Ol-1c
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623944486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vDRLFqGBKnmhP2eivxGLCPgf9TpvoziLwlRdRp6LBco=;
 b=VtCpDTqptnXWEddziC65VCDOygBhH6IZs6FCwe4/WEByrI+tPy9G45tXTEjTTwHfsebTO8
 KaKKWeyXgZF3pwQYU7PLtweapl+vPZN64zpJbTlH7Bm/O4N8QaSiI7XlTVf89ISv+5yLSA
 2O82cptGXhGTzO6IKapDMVtGZC8VSss=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-cXFzmyX5Nr-AVeTv1Jxaog-1; Thu, 17 Jun 2021 11:41:24 -0400
X-MC-Unique: cXFzmyX5Nr-AVeTv1Jxaog-1
Received: by mail-qt1-f200.google.com with SMTP id
 f13-20020ac85d0d0000b029024ba963cb08so4230064qtx.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vDRLFqGBKnmhP2eivxGLCPgf9TpvoziLwlRdRp6LBco=;
 b=F3TuntJQn9amUQDZaV00fPG3KtmUa7A7TsumYOJmLu02e/KN4MqxmkuxNulr5dXEyX
 JETZ1bdWqvsKhlAZt/jYYA3tgcSBIDufbOhg520xWXwACvy1PpTadXWI9BxdUcuP3Duo
 9ZI130titSjpUlmq81ONb2F6U62JeTw7MKvdUKdIlRUGcdm7FhRfAiE4al/AkNrpWLcb
 RO8aWMMaEffyByYe9yTTQE0HL417Qoy7pKnvzDOQziOmXylKr3yssLlpVEBGv/B+Kp+p
 CXKRSfegXrZEtVDma6zzeer8GSCKJkwdRc0c2lUvUOzhIm5chJb3dxWX4dsPA974A2Vk
 S0WQ==
X-Gm-Message-State: AOAM530txDuZDyxpBFszJYEjGJ3zqUvqLrY2+QYf3yL5VM6uSeh5DQ+G
 cung7hms9mWzpLGaPJb2+BN0AntvWVYZyBkbcoa9M53fFwmubA21vARKzAE3jdGkFfs9KXKAac8
 vpTCJVapR7RUiUwg=
X-Received: by 2002:ac8:7b46:: with SMTP id m6mr3674046qtu.113.1623944484289; 
 Thu, 17 Jun 2021 08:41:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV6QNQvxE76LdK/oLW1S+5jIn1QOCSkUv/TDzMezR07u657gI0W6n5DtqAUOX4J92gngYJFQ==
X-Received: by 2002:ac8:7b46:: with SMTP id m6mr3674026qtu.113.1623944484097; 
 Thu, 17 Jun 2021 08:41:24 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id z4sm3266889qtj.68.2021.06.17.08.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:41:23 -0700 (PDT)
Date: Thu, 17 Jun 2021 11:41:22 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 7/7] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
Message-ID: <YMttIu8esALzv8WQ@t490s>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
 <ba50a5a37c892d58d2f5996d2f393e664f31efa1.1623938622.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <ba50a5a37c892d58d2f5996d2f393e664f31efa1.1623938622.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 10:12:08PM +0800, huangy81@chinatelecom.cn wrote:
> @@ -487,12 +646,23 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
>                     info->sample_pages);
>      monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
>                     info->calc_time);
> +    monitor_printf(mon, "Mode: %s\n",
> +                   DirtyRateMeasureMode_str(info->mode));
>      monitor_printf(mon, "Dirty rate: ");
>      if (info->has_dirty_rate) {
>          monitor_printf(mon, "%"PRIi64" (MB/s)\n", info->dirty_rate);
> +        if (info->has_vcpu_dirty_rate) {
> +            DirtyRateVcpuList *rate, *head = info->vcpu_dirty_rate;
> +            for (rate = head; rate != NULL; rate = rate->next) {
> +                monitor_printf(mon, "vcpu[%"PRIi64"], Dirty rate: %"PRIi64"\n",

Maybe ending it with " (MB/s)" to match the dirty rate line?

Otherwise this patch looks good to me, thanks.  It's just that I still have a
few trivial comments out there, so this patch still may need some adjustment.

> +                               rate->value->id, rate->value->dirty_rate);
> +            }
> +        }
>      } else {
>          monitor_printf(mon, "(not ready)\n");
>      }
> +
> +    qapi_free_DirtyRateVcpuList(info->vcpu_dirty_rate);
>      g_free(info);
>  }

-- 
Peter Xu


