Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478624B4285
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:09:12 +0100 (CET)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJVTy-0001Fn-Sh
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJVQi-0007vH-2n
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJVQb-0001Bz-U4
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644822312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/OjylwBtZO/mHLv7d4+yohIDfGfzzYELvgsdZgj0Prk=;
 b=UPQIJDJ3kHBUccuwW7uqlNI/MkHtspcTGVh5D3QOfqjDD0hpQ648L1L8ncSMGcXqhS66bu
 LJRRDdC+cwqh3rjllYKGhv8SxSeq6FeF1WWhi7hOU0rDVtCMy8oKWcYQ9V06MErASvK4Lt
 ov/FwS7NVdaoTisaSYaukINpBwiltek=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-UQqjV83qMn2uVYiyRVtcxw-1; Mon, 14 Feb 2022 02:05:05 -0500
X-MC-Unique: UQqjV83qMn2uVYiyRVtcxw-1
Received: by mail-pf1-f198.google.com with SMTP id
 t24-20020aa79398000000b004e025989ac7so11080066pfe.18
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 23:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/OjylwBtZO/mHLv7d4+yohIDfGfzzYELvgsdZgj0Prk=;
 b=Hzq+CnPu5IZmeSaTSz8svDpOIokyaQnf6H20Tl6zhCX2Cza+WUMvyfUylhu4Koig6W
 6ax5fOIYZY2quUCxIyqQ6IzmPoY63hJt/nU4KMlzkd6AlOptetPsicXduQ666M7FZiyI
 x8f1K43KFayZ6xd8dlFEUCnR8UCo3YE1hSQihZY0eeMNPjzjTZan38uG/ra0VwoQzKih
 o5KqC7hOruIR5PwATOhQv384HYRyj9G4Snsh2fmP8D5xpeAYW8s9rT+YAwWOVRZrLvva
 43d+L5Ojz8NSkPuUGatSBvoJ1AIR2DNIDfccPT8LVhg+iSq0Xbt11URUUe5uaklmlqsv
 Iedw==
X-Gm-Message-State: AOAM530BLa6JWCjffCMNUSF6cfQWGB1AkQdg8GzwGvJ6Uhr2nsXa7UU0
 xFTeU2M98g+93AHz3697fpst9915UkKHTrgQTxIM4zTHLVg6lekL4GIoiAtAfW3NufcJHPo0Xhb
 HcMk4az+ZnMGqNB4=
X-Received: by 2002:a17:902:7892:: with SMTP id
 q18mr12619338pll.128.1644822304135; 
 Sun, 13 Feb 2022 23:05:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkAWYysd/SeQsTa/qwTznU5ixKi8p5DYBrxLkCd55a0qwMP8i/ow2M5sXTksVSafleM+gbrg==
X-Received: by 2002:a17:902:7892:: with SMTP id
 q18mr12619319pll.128.1644822303862; 
 Sun, 13 Feb 2022 23:05:03 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id q4sm35652747pfj.113.2022.02.13.23.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 23:05:03 -0800 (PST)
Date: Mon, 14 Feb 2022 15:04:57 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel_iommu: support snoop control
Message-ID: <Ygn/GYWIXqzkTNp/@xz-m1.local>
References: <20220214060346.72455-1-jasowang@redhat.com>
 <Ygn3I3T2DH3SHFXj@xz-m1.local>
 <CACGkMEvr+EDokjH6b3kMac-Zf_n+6KY5+L105Gh4QLquWZUX+Q@mail.gmail.com>
 <CACGkMEswB4HA0jnHS7KAM3qH=_kWUi8KE0TBK-hPqC+a3y6xFw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEswB4HA0jnHS7KAM3qH=_kWUi8KE0TBK-hPqC+a3y6xFw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 02:40:20PM +0800, Jason Wang wrote:
> Or we can do tricks like checking IOMMU_NOTIFIER_DEVIOTLB_UNMAP and
> assume it's vhost.
> 
> But I'm not sure it's worth it.

If not any use, then probably not at all. :-)

-- 
Peter Xu


