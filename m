Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690C47ECCC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:42:25 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0fDc-0000xf-HD
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0f7X-0006Nd-QS
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:36:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0f7U-0005nj-BB
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 02:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640331363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ICm1mKFok8jb8LW2XXdG0/LcPtJNWs1Q78kt9kSgdv8=;
 b=GzZ2+5e2lDmDOOD+Xne3J5kysSzPmb64ocWtSjNtHilq3J6t/Mnz74zFl60JubIiQRo+KY
 zdbE8KqD5d/qsIRvIK75yfJ886QxLpAVtJa8VD1wkP5oLuirhpV5VBtO0Dwd1z0+IyJM4g
 5PSH4nNpCsfC4FeZJgLFRjgHqzJdhk4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-JMeiBYmRMVe98-BvFbWgbg-1; Fri, 24 Dec 2021 02:36:01 -0500
X-MC-Unique: JMeiBYmRMVe98-BvFbWgbg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so1506977wra.19
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 23:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ICm1mKFok8jb8LW2XXdG0/LcPtJNWs1Q78kt9kSgdv8=;
 b=K+4Q1iU4zVXvrml1YFwiKSIKBb/5eZnlyStX/f0yz0UrzLtDVA2x2YK63tNBlnjh+H
 qbWGRiTiQmJjMRgrqJEN8diVvKOtwxaPI3GC9K9VC979rEG2+DLFhrUu8fd6nxvf/LY6
 9BNkO6p6ymR6SxcZDUkaTtHUcpGCkQdoNqkwGckFsyQilL1x9TESYKhfqjreTU4/TJq/
 q2XcLFr4EeeQjGD7MTT+9KtV7KP+CrZkW/7hDTPsJQo69hgNZs+y16KvZeYiyLCC+GTK
 Ei2mnkykpiQFHwGe6dOQdCD6fHhWNc4bWg0Yto8a+smg42Te1LxYx7P3kMhFfnBzhOFQ
 BZow==
X-Gm-Message-State: AOAM533MlGkR7VjhYqCIE/eC4s9I2Ww3sgoLmoTjmjGe2heMtnk9PeMe
 +oQWGNtlyo4ADl0jQXBfaIgc3z08dSENLQC9oQfizJO55YkWq/NcF9uh7bnVyCP7R7Tn8hJhsMs
 Gi9PrT5SaYlwAerE=
X-Received: by 2002:a7b:ce85:: with SMTP id q5mr3995338wmj.92.1640331360808;
 Thu, 23 Dec 2021 23:36:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJTptReyq3Vqhi6ronlr0pYIFaJVt6GuOL80kCt7tRoOOEqMmKq8rTTT4IsPpZHIDYq9R7KA==
X-Received: by 2002:a7b:ce85:: with SMTP id q5mr3995324wmj.92.1640331360618;
 Thu, 23 Dec 2021 23:36:00 -0800 (PST)
Received: from xz-m1.local ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id k33sm10448628wms.21.2021.12.23.23.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 23:35:59 -0800 (PST)
Date: Fri, 24 Dec 2021 15:35:55 +0800
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 6/6] migration: Move ram_release_pages() call to
 save_zero_page_to_file()
Message-ID: <YcV4Wy/NXmzdjFF8@xz-m1.local>
References: <20211221125235.67414-1-quintela@redhat.com>
 <20211221125235.67414-7-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211221125235.67414-7-quintela@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 01:52:35PM +0100, Juan Quintela wrote:
> We always need to call it when we find a zero page, so put it in a
> single place.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


