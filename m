Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1AB4AD38F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:35:09 +0100 (CET)
Received: from localhost ([::1]:41178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHLxs-0004lq-Gl
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:35:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHKnY-0001GS-Su
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:20:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nHKnU-0001dS-Ug
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:20:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644304819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p9IVksn+HLy3AhAMbqT8IEZCuSwaM7vERsVDfLqFgOc=;
 b=BjUngwKs/fJclbhcw2t5A2vUQWLCbNBAvsxoTPd+PXb4zv8wJoqsF7m1SWnwksK9FZ+2Wb
 Q2tkxOj7MJYJkeil0zaBITKYNqKQHhNm1z7amJqPwiu79/WtIM+xLUnQl11nMGIFnSwtS+
 42yC69hSrU9EDlCMLtFloVv15Ms+FBI=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-KLa7ezMfNoWSwKL-04tIjw-1; Tue, 08 Feb 2022 02:20:16 -0500
X-MC-Unique: KLa7ezMfNoWSwKL-04tIjw-1
Received: by mail-pf1-f200.google.com with SMTP id
 y2-20020aa78f22000000b004d1f55e0073so9113494pfr.15
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p9IVksn+HLy3AhAMbqT8IEZCuSwaM7vERsVDfLqFgOc=;
 b=YiLYudzoJudouLRTjM9fYpeYy8H+ncFHv72AIV7i3iXUgnOKsxkytAt/t2Yn1hzVRx
 /ZyG19i3gwx0VK2sSKQlVwR2HFJXMoIsjiqjhED5+h2PLytogmlj5mz56KZVIbJmcQs2
 zd1tnPaUlAzw6XQARBXCY5oMzt5hDJ3eLsXF+PwcCsu/RJ6cteDEkBI7k6qeqQ8FIXcp
 HGThy+Be/34cpEzABIs4P/1DvBrKJju3XsahiuVpi9qziSHZNe9W8j6CbXoUqDDIfNzu
 +PGWA0OVTc4OwhZUyuroqg4/Hrh9n1DIhnNPnz9Q4o9HVTT99mOidwOOZPY2gG6NjZ6d
 dLpA==
X-Gm-Message-State: AOAM533Y++llSWRAOTcqkJb4L84XdW0x6ZfRCsXRzYbNKL+QHFPzIfMN
 +GxmAWoH1w0/ENlX/1cfyV9stBqFszr+j3QcBF1rboAyt3wZPAwOsOzGJueoF8A5cwdYxKQo0Wh
 0/XSEmSvMZPqweb0=
X-Received: by 2002:a63:6842:: with SMTP id d63mr2425039pgc.213.1644304814922; 
 Mon, 07 Feb 2022 23:20:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUKdAbYBYI2JHYfMrAaw1GCIGqljcNPLO9J3fXrsRyabpbFynEc7641yeYKOv/jo3auhlGTw==
X-Received: by 2002:a63:6842:: with SMTP id d63mr2425019pgc.213.1644304814564; 
 Mon, 07 Feb 2022 23:20:14 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id gb5sm1643437pjb.16.2022.02.07.23.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:20:14 -0800 (PST)
Date: Tue, 8 Feb 2022 15:20:06 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v12 1/5] accel/kvm/kvm-all: refactor per-vcpu dirty ring
 reaping
Message-ID: <YgIZpjogm7BuYNrQ@xz-m1.local>
References: <cover.1643026714.git.huangy81@chinatelecom.cn>
 <b5b435c3e2baa417879c9475ad5f3e6a01f89126.1643026714.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <b5b435c3e2baa417879c9475ad5f3e6a01f89126.1643026714.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 10:10:36PM +0800, huangy81@chinatelecom.cn wrote:
> @@ -2956,7 +2959,7 @@ int kvm_cpu_exec(CPUState *cpu)
>               */
>              trace_kvm_dirty_ring_full(cpu->cpu_index);
>              qemu_mutex_lock_iothread();
> -            kvm_dirty_ring_reap(kvm_state);
> +            kvm_dirty_ring_reap(kvm_state, cpu);

Shall we keep passing in NULL in this patch, and make it conditionally taking
cpu parameter if dirty limit enabled?

Ring reset can still be expensive, so ideally we can still try the best to reap
as much PFNs as possible, as long as we still don't need accuracy on RING_FULL
exit events.

>              qemu_mutex_unlock_iothread();
>              ret = 0;
>              break;
> -- 
> 1.8.3.1
> 

-- 
Peter Xu


