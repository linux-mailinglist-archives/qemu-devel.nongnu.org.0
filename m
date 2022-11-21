Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F1B632F75
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:01:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEpm-0001dt-G6; Mon, 21 Nov 2022 17:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxEpf-0001bT-MN
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:00:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oxEpd-0005ef-F4
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669067999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFMsJiYu8wxaXVOS9Kah+NCqrmQ2wtKr4Kwrq3vrNsM=;
 b=KK1dhIBVsGjWXT5pR9qNFNU6LbIYVdFkzTlOwo6boY/7UKhz6Ypzhq27g0QpSEFhIQN6sG
 rgB41Mn4JFxwKO3m2ApMsRdAryY/sRtxBFot3+O+9t9o7YPjqfmkIylzA/hkpMxejJVwoQ
 DYKK8cPcqJ1nzHlyweo2quioUrSUSpY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-156-JW6QeHXsN7uaEqwrOjn4nQ-1; Mon, 21 Nov 2022 16:59:58 -0500
X-MC-Unique: JW6QeHXsN7uaEqwrOjn4nQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bq13-20020a05620a468d00b006fa5a75759aso17142094qkb.13
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oFMsJiYu8wxaXVOS9Kah+NCqrmQ2wtKr4Kwrq3vrNsM=;
 b=EWFnNQ/3o4q3gbHIU5RFdNnY2hDPf60LezpFVHhWSLPA7U62hGIhpLShovSZMT091W
 d68NUFNgnOvEdj4jDO4dIWOdWep0Bvqtgxu9MTS4nJQgD+8+O7SjnRrrwv+JWSOTlKJM
 kj0wx/cscafauLJTAxfYrZI1IJjSDjPPGRhCzkn4WblIesXSbnjzO//718LCy13YD/Hn
 QYR4PKqp/RHBKHlC+o7bv4S2bJjKW2+H8xBtedwW+J/fFAxPARg00EMRyVXxWY2gss23
 if+yYIVXHDw4bJZ5KxdRpJgdxHb9AI0KnrUwUhK5mAFoC4jw4F/HYwEhHN3qjSGZsSXc
 mD2Q==
X-Gm-Message-State: ANoB5pmbbmrt+B5kYuX6XXU3q6frSzwxfg7/q+dPLQ9cR4mvY0JjhHi0
 yvCdgCUZiQD0nEjxlBgcVXve36lBT/LsW7bkkE6Gng3Yj6QlC9fbRbMtrrReHsjVwbOgkrnPKRp
 FQm2qYLJJKxaKYpE=
X-Received: by 2002:a37:ae44:0:b0:6fa:104e:ac20 with SMTP id
 x65-20020a37ae44000000b006fa104eac20mr6833188qke.708.1669067998025; 
 Mon, 21 Nov 2022 13:59:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7G+mU5XwG3HhMXJsbhSphgD3I5MY5eLn6pin+0fRQBvPSUQL2mDa9YDQ8LDxx6wPPPeWE/0w==
X-Received: by 2002:a37:ae44:0:b0:6fa:104e:ac20 with SMTP id
 x65-20020a37ae44000000b006fa104eac20mr6833167qke.708.1669067997749; 
 Mon, 21 Nov 2022 13:59:57 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 v4-20020a05620a0a8400b006fa8299b4d5sm8682167qkg.100.2022.11.21.13.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 13:59:57 -0800 (PST)
Date: Mon, 21 Nov 2022 16:59:56 -0500
From: Peter Xu <peterx@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v3 2/2] migration: check magic value for deciding the
 mapping of channels
Message-ID: <Y3v03M/7/imLADUG@x1n>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-5-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221119093615.158072-5-manish.mishra@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Sat, Nov 19, 2022 at 09:36:15AM +0000, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses read peek to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


