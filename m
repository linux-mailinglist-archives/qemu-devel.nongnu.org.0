Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA7643E67B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:47:01 +0200 (CEST)
Received: from localhost ([::1]:53346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8YO-0007gi-GO
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mg82v-0001kJ-2z
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mg82t-0008An-Lr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635437666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNRAhs+lX0diImmZK92mWw2v0/NdAbv4AL9MjgxyK3o=;
 b=iVBoL6+PG8C1TL9IVzPeM/xs7RdxwKFu8wDFO0Vhl+nqU1TVQdzGC60XvJe5w7fYwkQ8rc
 E1DqCdEaA9os8Tx9im3qKQPQHIdl3ferBqRKD8BejOKep0MnMLzXB+a/7Q2zEYGTMUagS5
 RdtP5IJhwOmhvcn15q89pv/5zHpyepg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-i4bFU1xzNAqQ4dkI1vadrw-1; Thu, 28 Oct 2021 12:14:24 -0400
X-MC-Unique: i4bFU1xzNAqQ4dkI1vadrw-1
Received: by mail-wm1-f71.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so915699wma.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vNRAhs+lX0diImmZK92mWw2v0/NdAbv4AL9MjgxyK3o=;
 b=q53KLM6WnZ33EOrn6qPtLNz31TOAC3f1NYasP2hDr3GRLqej5r0dsdxwv9kKYKSAYh
 HGOP+he6g+3V703QjffzaIkTdYQnJvWcFo/D8qHxgfhYiKwVjL3ubkUzHsmbsu3V65ly
 zSLH607+XpmBlWSteNR91MxeoPIRFYEOS4cqQ4FIUswEUrgEbUryX/R3g2eL9hAGvFI0
 paKGmjOt6/IDE6gIOFfK2Znm2/ZXLnNNXX2L1alja+ZFZCQ3UmjI5uJfC4t5weWhv9rY
 qaIMevlMfKmBGXt7j0iM1vjY32HrN4l2wLi8zhP2e14+bUK1ErphnxfXX5vvRabAv+SJ
 1vZA==
X-Gm-Message-State: AOAM533rVAl7ELzzIEcuGDT95CiHdmDmyW0C73bZxjYfzuWidJYhW52g
 uKkk1wBrXJW/Zk1L2kNSyXS8z0CEI/RrAQ/3ixeWTZ8ZkAov4RrPArHE/75Ow1iXdd1+nVSS3cY
 FbcaCCWoHU4qC6Rg=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr5462352wmq.154.1635437662750; 
 Thu, 28 Oct 2021 09:14:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0WhYU9stJjwAPIi09WoQE+ANRxNqsA3pjm9ugZIaLqvKxGX9iHDDYefxvLtCgTspqlj8nZA==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr5462299wmq.154.1635437662386; 
 Thu, 28 Oct 2021 09:14:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m3sm3373063wrx.52.2021.10.28.09.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:14:21 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:14:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 05/22] docs/devel: update error handling guidance for
 HMP commands
Message-ID: <YXrMW3WysIJqFg5N@work-vm>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-6-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211028155457.967291-6-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
> Best practice is to use the 'hmp_handle_error' function, not
> 'monitor_printf' or 'error_report_err'. This ensures that the
> message always gets an 'Error: ' prefix, distinguishing it
> from normal command output.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Yes OK; but that is potentially discouraging people from adding helpful
errors; certainly I'd want them to add text if they were calling
multiple qmp functions, so you knew what failed.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  docs/devel/writing-monitor-commands.rst | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
> index a973c48f66..a381b52024 100644
> --- a/docs/devel/writing-monitor-commands.rst
> +++ b/docs/devel/writing-monitor-commands.rst
> @@ -293,9 +293,7 @@ Here's the implementation of the "hello-world" HMP command::
>       Error *err = NULL;
>  
>       qmp_hello_world(!!message, message, &err);
> -     if (err) {
> -         monitor_printf(mon, "%s\n", error_get_pretty(err));
> -         error_free(err);
> +     if (hmp_handle_error(mon, err)) {
>           return;
>       }
>   }
> @@ -307,9 +305,10 @@ There are three important points to be noticed:
>  1. The "mon" and "qdict" arguments are mandatory for all HMP functions. The
>     former is the monitor object. The latter is how the monitor passes
>     arguments entered by the user to the command implementation
> -2. hmp_hello_world() performs error checking. In this example we just print
> -   the error description to the user, but we could do more, like taking
> -   different actions depending on the error qmp_hello_world() returns
> +2. hmp_hello_world() performs error checking. In this example we just call
> +   hmp_handle_error() which prints a message to the user, but we could do
> +   more, like taking different actions depending on the error
> +   qmp_hello_world() returns
>  3. The "err" variable must be initialized to NULL before performing the
>     QMP call
>  
> @@ -466,9 +465,7 @@ Here's the HMP counterpart of the query-alarm-clock command::
>       Error *err = NULL;
>  
>       clock = qmp_query_alarm_clock(&err);
> -     if (err) {
> -         monitor_printf(mon, "Could not query alarm clock information\n");
> -         error_free(err);
> +     if (hmp_handle_error(mon, err)) {
>           return;
>       }
>  
> @@ -607,9 +604,7 @@ has to traverse the list, it's shown below for reference::
>       Error *err = NULL;
>  
>       method_list = qmp_query_alarm_methods(&err);
> -     if (err) {
> -         monitor_printf(mon, "Could not query alarm methods\n");
> -         error_free(err);
> +     if (hmp_handle_error(mon, err)) {
>           return;
>       }
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


