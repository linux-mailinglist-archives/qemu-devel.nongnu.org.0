Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77E66E282
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHo6O-0006Yy-1q; Tue, 17 Jan 2023 10:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHo6L-0006YT-K1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:42:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHo6J-00075T-Au
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673970134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iYW7f9loAu5vq6RW5nvbbNnkcjXsvlc3FQYi2e7aQE8=;
 b=LEA1O1lwBdqXFj+PaRqr38+uZzbULZOu7FFiixri3pAlZvSx+O/i3QZVaJfkDxfuRU1J2c
 hnvkqSS1ac1S+Mu5Q9Wisr9tT73NuPQgGgOsIJqvmquezJZ+a4+TwnXYFfwN4if+DonY85
 MyPPMkaP+84jiZyujYHE4xneMO4ac3o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-YF22NuT7P7KY3OY3AFXTVQ-1; Tue, 17 Jan 2023 10:42:12 -0500
X-MC-Unique: YF22NuT7P7KY3OY3AFXTVQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 lv8-20020a056214578800b0053477624294so6229403qvb.22
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYW7f9loAu5vq6RW5nvbbNnkcjXsvlc3FQYi2e7aQE8=;
 b=IAtCv+AHz1DIMhbw16Y8hFmSSiqIyc9iKkDn0Em8pICU0Qjj+AJvCIZ+7mqWZA0MF8
 DhY23Hwupz8lzNwJ0i1ucV+I1Q/UOFB5lgGVXomrTdIHDFmm7uD4fR2CYf59OSufZ1Br
 ElHa/jAJwovVohuxvKk76bwZIoZzheXh02cOqgjNiv4S/iTsbOY4ULOTYRUfUi20GTCY
 Y7gs6ibxyqnfAKWX0/9tQZhADl3zV1If99qi84V9y1iiaIK7Qh372cdIfG5rpEv7siUB
 Lc8K7SkQXH/2l3qlTbWipZ5MqfZXnaNcSAJXkmm0q4SqxUkFkqoF+C1WN1T9jWcH1kDr
 tBNw==
X-Gm-Message-State: AFqh2kpq5V19UdrGd0iMmkmXuyMpFQp4+LWMt+A7cBMCVeis1LwMJCCU
 zRRDyW3uHe8BtbQtS8pjWxxHgJkS45S7CNPdjjGv1OTjzVkD9y1BTEzITxZeDwDHtmuR6yL7/AI
 346pgAA494iWeC9M=
X-Received: by 2002:a05:622a:1ccd:b0:3b6:3ca2:dde8 with SMTP id
 bc13-20020a05622a1ccd00b003b63ca2dde8mr3451295qtb.67.1673970114090; 
 Tue, 17 Jan 2023 07:41:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXum3969GI+DA2f3bSdsYBDC7jI42H4xEtC/Vkm94RczvNH1NdnxIuL4wuOHTd2hHBcEef5N1g==
X-Received: by 2002:a05:622a:1ccd:b0:3b6:3ca2:dde8 with SMTP id
 bc13-20020a05622a1ccd00b003b63ca2dde8mr3451266qtb.67.1673970113814; 
 Tue, 17 Jan 2023 07:41:53 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 x7-20020ac84d47000000b003b2957fb45bsm6881924qtv.8.2023.01.17.07.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 07:41:52 -0800 (PST)
Date: Tue, 17 Jan 2023 10:41:51 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y8bBv1xQZ1pm8TDZ@x1n>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Jan 17, 2023 at 07:55:08PM +0800, Chuang Xu wrote:
> In this version:
> 
> - rename rcu_read_locked() to rcu_read_is_locked().
> - adjust the sanity check in address_space_to_flatview().
> - improve some comments.

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


