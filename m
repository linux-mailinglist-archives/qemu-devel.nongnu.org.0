Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9701351F689
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 10:30:52 +0200 (CEST)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnyn3-0006QB-O4
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 04:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nnyld-0005kc-27
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nnylY-0000df-12
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652084954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZldVjgZq2Fto+rtFkaNbbVpusmxdeaxLcuxM0uUsJY=;
 b=CWAU902P2m611RB644wNQvuNp2z1p7e/5hF1h6Q+gt2GoekWqSe2hNZ7+ryAYXYqZ+RXcA
 joa9u2c+1ynet/TlZFFepH4TAxmPPbbXggdlhWQaQ0C3Ix/IBeHqbs02NPQTtEwieQOqAM
 yltTZ+rdNMr58imWv4nLTSKihLxg1UE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-ukVEw8ZLPs64E3AH4gTGmg-1; Mon, 09 May 2022 04:29:12 -0400
X-MC-Unique: ukVEw8ZLPs64E3AH4gTGmg-1
Received: by mail-wm1-f72.google.com with SMTP id
 c62-20020a1c3541000000b0038ec265155fso9567609wma.6
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 01:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JZldVjgZq2Fto+rtFkaNbbVpusmxdeaxLcuxM0uUsJY=;
 b=Zu0ShtZDLEOd+oDDeEtnMcDliyeWVNJnBZtT7MngQehmom0oDgLPAj5Sqe+rGvAuoJ
 Z5T+ntsgwN8cC3e2UOMv3ay7K1tiXdZx7mUNaUNp+Q45xrVBFiW0jBqhzb5KPcLAoPN+
 yoyn6sNtVkTzACzanGKUA5q5d+kr299AOBW4SvrbKoCPXEONHWAQdd/A+uxA078R9dez
 8JlAFnWBVsYv74NYhxQPZu828QsCDPADyyF5cBRNKjx9pSsSJySArPDtCb51bTluc1Vr
 5P8Ly+YOBbiml308ZveNqOB2CTE0k021IBvbxgbGnGseD/Ha4ckZd0uEe82DkpCR769E
 x37g==
X-Gm-Message-State: AOAM532PQtdEelEhYlOEW65EvhKCTD2QkL/0L0VxOQOwhznj4Qis9RaM
 otvHJ7bM7m5wp4B8coYBZW+ws8jAjXZSYemO1Zwnc//dwcE/SJqOh6ECjC4bqw1HwgMmffuU1LM
 vJQy9iJlbPd6Cd9k=
X-Received: by 2002:a05:600c:19c8:b0:394:7cb0:717b with SMTP id
 u8-20020a05600c19c800b003947cb0717bmr13949436wmq.136.1652084951600; 
 Mon, 09 May 2022 01:29:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPYbdFk5/GyIRDoUmAej4Hc23sUn6KZF1vHsKZYV7q+jrUFr1E7dBhp78psAz3oYfgQSVZ7w==
X-Received: by 2002:a05:600c:19c8:b0:394:7cb0:717b with SMTP id
 u8-20020a05600c19c800b003947cb0717bmr13949415wmq.136.1652084951372; 
 Mon, 09 May 2022 01:29:11 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 q1-20020adf9dc1000000b0020c5253d8b8sm11140317wre.4.2022.05.09.01.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 01:29:10 -0700 (PDT)
Date: Mon, 9 May 2022 10:29:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, mst@redhat.com,
 eperezma@redhat.com, eli@mellanox.com
Subject: Re: [PATCH v4 6/7] vhost-vdpa: change name and polarity for
 vhost_vdpa_one_time_request()
Message-ID: <20220509082908.udont7vzjur673eq@sgarzare-redhat>
References: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
 <1651890498-24478-7-git-send-email-si-wei.liu@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1651890498-24478-7-git-send-email-si-wei.liu@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 06, 2022 at 07:28:17PM -0700, Si-Wei Liu wrote:
>The name vhost_vdpa_one_time_request() was confusing. No
>matter whatever it returns, its typical occurrence had
>always been at requests that only need to be applied once.
>And the name didn't suggest what it actually checks for.
>Change it to vhost_vdpa_first_dev() with polarity flipped
>for better readibility of code. That way it is able to
>reflect what the check is really about.
>
>This call is applicable to request which performs operation
>only once, before queues are set up, and usually at the beginning
>of the caller function. Document the requirement for it in place.
>
>Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>---
> hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
> 1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


