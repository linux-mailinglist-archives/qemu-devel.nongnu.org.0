Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB74761FD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:41:30 +0100 (CET)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxa9Z-0002lw-7Q
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:41:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mxa6W-000123-VU
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mxa6T-0004Nb-Do
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FGEuG8xSyD+tDL1Bct6zlECf3DpCFXxVPUiSZGkpYT4=;
 b=Lnzuw5gTZzFEHkj5N9A+b8OZpRJjytr/G0+iFi61hEnjtmSQMU6eJ3KaVdsKH76zB9lrXP
 45zpZ1QTpeucMX/YUv2TsPLxsRso/tuI59akFoLE6yxDANchc9F/kfEgYcQRSGHKyT64PY
 4/crJ6lgmfKSL2Po112C+tUoJ6UhxVw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-WbDlq7ZgNAWElz_KhLZrBg-1; Wed, 15 Dec 2021 14:38:14 -0500
X-MC-Unique: WbDlq7ZgNAWElz_KhLZrBg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l13-20020adfbd8d000000b001a23a990dbfso35987wrh.5
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 11:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FGEuG8xSyD+tDL1Bct6zlECf3DpCFXxVPUiSZGkpYT4=;
 b=6BAoUvGOIL8E85gvn86GG98g686JhovrHWPUzh2D1udtzmezed4/mWXkUv1zDijpro
 Araq40vO2vvnlcGlW9Z0wCKTeXnqi6ichTFHyYPOKP4SodoewoZJujLT3zUNjz4sO2Bj
 HDjOM9DBzqCn+c+aNghGQgY43aBzPnNl7bOWbrQ/R3My3wFo+A8c9qXjYgLEdmwJdPUd
 X8w421u9N3ll6/pNQWDWtiwsqEXn+y9jp76skRWKrOFFygKDq9BpIZzjQu9iykOqWfh2
 y4i/wKqcJ8i/O8Or19XGv+dvoRYohh7F/mLK6+haYpO6JmhgIjcmYMC4HiXj3lda/1gG
 8sQA==
X-Gm-Message-State: AOAM530o/l98svUoWSGFra4j2abpiCnRDmtadayAxqtXq3KHkgtoH0Fb
 JMoyhR8lWjDL1Zzvqp7ZF82JySlG+G5Do7Ru9bUXwqqlccyEZxAQwYdGfBW4Jx2hwhSx1ZQxj3K
 au8e/B2EHwO3UiAI=
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr1703532wmq.102.1639597093281; 
 Wed, 15 Dec 2021 11:38:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLfq822q3wfHQ1cqkbrSLR0hxxV/hdZYK4e/qL4CbkJ4ExUJvFy43PcGeu7ak4MvYLYllrqg==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr1703515wmq.102.1639597093084; 
 Wed, 15 Dec 2021 11:38:13 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id g7sm2439184wrx.104.2021.12.15.11.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 11:38:12 -0800 (PST)
Date: Wed, 15 Dec 2021 19:38:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH] migration: Report the error returned when
 save_live_iterate fails
Message-ID: <YbpEIorKvJnOcCqy@work-vm>
References: <20211215141437.1238403-1-david.edmondson@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20211215141437.1238403-1-david.edmondson@oracle.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Edmondson (david.edmondson@oracle.com) wrote:
> Should qemu_savevm_state_iterate() encounter a failure when calling a
> particular save_live_iterate function, report the error code returned
> by the function.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  migration/savevm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index d59e976d50..26aac04d91 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1298,8 +1298,9 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
>          save_section_footer(f, se);
>  
>          if (ret < 0) {
> -            error_report("failed to save SaveStateEntry with id(name): %d(%s)",
> -                         se->section_id, se->idstr);
> +            error_report("failed to save SaveStateEntry with id(name): "
> +                         "%d(%s): %d",
> +                         se->section_id, se->idstr, ret);


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>              qemu_file_set_error(f, ret);
>          }
>          if (ret <= 0) {
> -- 
> 2.33.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


