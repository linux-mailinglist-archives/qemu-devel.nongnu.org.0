Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AC44B43A9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:16:42 +0100 (CET)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJWXJ-0005B1-2H
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWGr-0000Gj-G3
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:59:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nJWGq-0005Xb-2b
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644825579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmvBwVYMimXr1yId2LZx11ELWr7lIYXXmX7TpGnuM48=;
 b=eUwGmD5jDlfIeiXiaPSYRmJpriwC8Dqg+V++dYnx+lLXsEnH6kszRe7PIA7D2JVkvS0Bq2
 3nfCB3uKDJhpSq6dWIEOHW7etjeFCeCNHVPNZ9rQMR2dCtkhd5NUF47zYSI2ImqTGMXTKb
 LDZdo9TwhKNXr3q2xxb0hQw8s0v93Pg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-YhgUVem0PS2Qfvr01-wGVA-1; Mon, 14 Feb 2022 02:59:38 -0500
X-MC-Unique: YhgUVem0PS2Qfvr01-wGVA-1
Received: by mail-pj1-f71.google.com with SMTP id
 md16-20020a17090b23d000b001b8bd5e35e2so10457047pjb.0
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 23:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pmvBwVYMimXr1yId2LZx11ELWr7lIYXXmX7TpGnuM48=;
 b=15nd/k/aVDR6ni+JBpmAavRl0/+Jn17pSnSEbU1u8wGWk67U6IlphwyS86b++g4vJc
 0uZoKFw6m+1CZSzfYJvQUbIk/oWhoksUS73SkKe++JqgnRv2gYwcpdr4NAf+iO2KOhPP
 5ngtXi32QIgD7UCpMt/qkG+JsfM4SPb4h2C/vxKdqz5I0CVF489BN6Ywh85rXqPvjQNq
 CD+UZwCBClgPZBfE0YpMNBx2oxmqve5Me6B8rW4iEUQEIuYe5u5vvKji2v42Fmpj9urc
 G2Yp7R569A3GVsjH4q2+PC7XQAyeHAjPr0BIEB7U034/p52k+nSQXp2B8fUkcLsTQ9rX
 R52w==
X-Gm-Message-State: AOAM533Xp34K2VdEdFoLNccqiFrDJX5O0VbTT1/kbfyCpott3gDmCFIB
 jblJskvwHYIxvxzKJdhe7P2SEiH5y8NsyhjIz8MePUccT1Y38VVv36D6ijXDS17uDfKACfMFp7D
 eDQdPKazR7D5QCM8=
X-Received: by 2002:a17:902:700b:: with SMTP id
 y11mr13073737plk.38.1644825576916; 
 Sun, 13 Feb 2022 23:59:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiPkptXTSZjI3D1x8ua7iJOqHIX5sOKMpLyTh7gs35Y69gYTOv2YU84urZzBZkh82Sfdcyiw==
X-Received: by 2002:a17:902:700b:: with SMTP id
 y11mr13073721plk.38.1644825576677; 
 Sun, 13 Feb 2022 23:59:36 -0800 (PST)
Received: from xz-m1.local ([94.177.118.137])
 by smtp.gmail.com with ESMTPSA id g8sm35677086pfc.193.2022.02.13.23.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 23:59:36 -0800 (PST)
Date: Mon, 14 Feb 2022 15:59:28 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v14 2/7] cpus: Introduce cpu_list_generation_id
Message-ID: <YgoL4MTdrVeOSV2u@xz-m1.local>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <f38e0fba747bcbe534fb6669c989a9455eef1f46.1644509582.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <f38e0fba747bcbe534fb6669c989a9455eef1f46.1644509582.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Fri, Feb 11, 2022 at 12:17:36AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce cpu_list_generation_id to track cpu list generation so
> that cpu hotplug/unplug can be detected during measurement of
> dirty page rate.

Could you add a short paragraph on showing how the gen_id should be used?

> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu


