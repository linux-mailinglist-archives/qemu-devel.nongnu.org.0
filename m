Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF654B472E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:53:54 +0100 (CET)
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJY3N-0000Yv-77
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJY1Y-00088O-3R
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJY1W-0001cy-9C
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644832317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D+zT5dgQQPCAnZehvan6q1k5J/dOouuydCvwGnWgNus=;
 b=OA42SETL+1jbsvJ7YJMxn1DQDfPMjyKGcEcp6GNQQenyNiWjW5RAqDjpQchl9RnFyyOcmt
 RQt8HRVKPasYnDLTV1hxPyXx0qz8gsgRfPsfCusXfJYhoMSfl4W2nofBETJ1vI+oH82TQ1
 GKXiyNOtJInh1A4IMvhuZdS0eoSGzdc=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-vbAYb7qAM_y4hS_F2NaClA-1; Mon, 14 Feb 2022 04:51:53 -0500
X-MC-Unique: vbAYb7qAM_y4hS_F2NaClA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d5-20020a623605000000b004e01ccd08abso11378523pfa.10
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 01:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D+zT5dgQQPCAnZehvan6q1k5J/dOouuydCvwGnWgNus=;
 b=DJbSN0kmjiBJtH9APFi4OhWQsXg5FxUvTkCWrKHoa7UaxFSBtjrRJTpIFQDrEjMPzN
 YlyM/xK70g4yiOw0/t4w2foDMMKlie3OVLXsy3vSGdpDd5cZlJh35NwkWmxKhnw5KEpK
 I7QL3AYpYI8+x0KvGrRNpGxyWUgykXTkMzXixQgAeYEWkp60NfBHGudNMXFQgyucYCAh
 38Hg1+H6f6SeVW4H/bP6WKhZNCkKAg6qvBr7ei1+TnV+y1Z2IXpkkWxf3YgQxS4GN+Y1
 82KOpYBgpew64BfWZ7uFbyllxKSZy/5i9pGi6Yin/Iagah/cByvj4+ldTCmKivaa82re
 qBWg==
X-Gm-Message-State: AOAM533ReLvGT6TDRkcHoJ5j7Ht5WMpVF8qEJEQcMj66o1PLO4CoI59Y
 izxECdymSdbbslJOsYe7wb0zLYjo+tLRYFruSWZ/6ICPvhwt9JsslSBdBMD0n/y1pKc1nlAbjfY
 8qIlemrnUkTxibfw=
X-Received: by 2002:a17:902:bcc6:: with SMTP id
 o6mr13658265pls.116.1644832312251; 
 Mon, 14 Feb 2022 01:51:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4UYOyb45ulf6hk/gpi9eG4IjBDmEuhiqbgYgmNUDA9uPaDrgaDgc89lKxsmyZL9l46bt8Tg==
X-Received: by 2002:a17:902:bcc6:: with SMTP id
 o6mr13658252pls.116.1644832312010; 
 Mon, 14 Feb 2022 01:51:52 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id s15sm2441160pgn.30.2022.02.14.01.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:51:51 -0800 (PST)
Date: Mon, 14 Feb 2022 17:51:45 +0800
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v14 6/7] softmmu/dirtylimit: Implement virtual CPU throttle
Message-ID: <YgomMXs4qJPe9Rex@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <ad0a6e05b5bec2c2c8dd3a7663e39e3cf9af71a3.1644509582.git.huangy81@chinatelecom.cn>
 <YgoQxbzrNleQT9TH@xz-m1.local>
 <b9c33974-7c1d-5efd-5667-cd705775e501@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <b9c33974-7c1d-5efd-5667-cd705775e501@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 05:05:38PM +0800, Hyman Huang wrote:
> But i'm ok if you insist because it's just about how to call the
> 'dirtylimit' and doesn't affect the whole logic.

If you don't have plan to add e.g. another adjust() method then it's pointless.
The hook can be easily added on top when necessary.

But I don't insist - your call. :)  Not really a big deal.

-- 
Peter Xu


