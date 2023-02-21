Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3649569EB92
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:59:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcWj-0001L7-5x; Tue, 21 Feb 2023 18:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUcWe-0001KJ-5l
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUcWc-00018b-KS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677023901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6gizhSVpDQr8UfyjYme+jRyarI7qBKUWaghtebGrko=;
 b=UcqBOP29c2Tg6qRAJlo/M2dR2TSYhMc2tEvTPsaIwTZO5KDBJgEk298gYwczsrDcaVRe10
 sbK6QFzna2Gt3/VfY9I+W+432TymBFxe4V8S1W55qt9k2Wyh6lfgBfLROwmVz24xW1XjDg
 t0F080fItCGhPb9E+O9Elx3HqByKxrc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-NyiQqHsvNgCfrLJITYNQww-1; Tue, 21 Feb 2023 18:58:19 -0500
X-MC-Unique: NyiQqHsvNgCfrLJITYNQww-1
Received: by mail-qv1-f72.google.com with SMTP id
 pv11-20020ad4548b000000b0056e96f4fd64so2834194qvb.15
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677023899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y6gizhSVpDQr8UfyjYme+jRyarI7qBKUWaghtebGrko=;
 b=p30eaeEUGLUjTUsiQ0spsQ19t/ZmZ/z/TRg+yBuicGpDA6cn4OXxpjUak2IHAns/jw
 VIVkA6CpZ0GDQTDAcSKNZci2Y8j2lXc54SfYhe8YrkwwfXPAbQt+defghAvPOvBovy+F
 nOKOOkUmLK5x225fsAnLeHPXD6ZIBHEKElHG7NyqyfkWXi57vUd6qunL2dkv2nX296U6
 rObV/XekY9ZfsAXWN158gydTQ6G2fP6k4aQYpsTmOGiOqzXLlug+fpjf6gphv1noaqUf
 bJJLEq6567V69WGrw68z3iqDfcxBeGs1Ll6HgRwYOlp4Y2feAwpguRMWtzRwJ3BXNp3U
 jebA==
X-Gm-Message-State: AO0yUKXUB88ETjzjtVfoUv1Tswhoaz8BZP4ZKSCHgrKNaJ35bc2WIDbW
 Vbnw/EDCYKuFvcS98cHXtWp5C1sTXabhoNqw48Q1JXPQOKf+tjZZHLDJOSTCiuAHL+FFaxUsWAc
 39Pkvdct1EHtdXn4=
X-Received: by 2002:ac8:5748:0:b0:3b8:36f8:830e with SMTP id
 8-20020ac85748000000b003b836f8830emr12493390qtx.6.1677023899006; 
 Tue, 21 Feb 2023 15:58:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/cGcmZEdynxhdKdTP+eZkmH2xZGQ/dfkziZmzecderu1kn0kvUUrxKqZbk8ByANNUpWzSJZA==
X-Received: by 2002:ac8:5748:0:b0:3b8:36f8:830e with SMTP id
 8-20020ac85748000000b003b836f8830emr12493297qtx.6.1677023897716; 
 Tue, 21 Feb 2023 15:58:17 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t22-20020a05620a0b1600b0073917fae4f8sm11740850qkg.25.2023.02.21.15.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 15:58:16 -0800 (PST)
Date: Tue, 21 Feb 2023 18:58:15 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v1 3/6] kvm: Synchronize the backup bitmap in the last
 stage
Message-ID: <Y/Val7mrVHHE8Bsb@x1n>
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-4-gshan@redhat.com> <Y/UDbqyB2N/OWWi5@x1n>
 <08c954d7-f4e4-4d63-28fc-50128f4bc2d7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08c954d7-f4e4-4d63-28fc-50128f4bc2d7@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi, Gavin,

On Wed, Feb 22, 2023 at 10:44:07AM +1100, Gavin Shan wrote:
> Peter, could you please give some hints for me to understand the atomic
> and non-atomic update here? Ok, I will drop this part of changes in next
> revision with the assumption that we have atomic update supported for
> ARM64.

See commit f39b7d2b96.  Please don't remove the change in this patch.

The comment was just something I thought about when reading, not something
I suggested to change.

If to remove it we'll need to remove the whole chunk not your changes alone
here.  Still, please take it with a grain of salt before anyone can help to
confirm because I can miss something else here.

In short: before we know anything solidly, your current code is exactly
correct, AFAICT.

Thanks,

-- 
Peter Xu


