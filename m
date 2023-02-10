Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B859B691F52
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:50:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSql-0000kB-Bg; Fri, 10 Feb 2023 07:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSqi-0000ju-Gr
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:49:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQSqd-0005qI-HN
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676033390;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ngUWMsbSELi2FSCyW2HMqQhWYgXERbh8DsxK0CCXF6U=;
 b=ikgGmw10sjc9OtEoRc1shOPfOzeggwIOKtBD1B1KdP0aZurz0P5iaWjwWHZRruPfSJkXb4
 5cNKtqc7R8RXlDOHvoZG8I9OnUAmG4WZIS/bpMCEm19g9q3+YdjTnN7vHXo/ItQLJZvKYA
 4P1sBo58P6jwpCg3RCvxZZOSZmDwxS0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-aKAkesH9NL-KFnlwXUQgbA-1; Fri, 10 Feb 2023 07:49:48 -0500
X-MC-Unique: aKAkesH9NL-KFnlwXUQgbA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v5-20020adf8b45000000b002bde0366b11so1243538wra.7
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ngUWMsbSELi2FSCyW2HMqQhWYgXERbh8DsxK0CCXF6U=;
 b=ItgJxKjYopzvzFcM2ambYgR0HvhwhcMeP94sM7P1bC+J9T10pJyzt3JGDnzrAzASWr
 CrqoQzn9p9Vp6nIRXzsb9cW31sjmt95uiSa2NPDqRVOLvPFpY8iDWz5VIHu4NyHTYP8E
 sv+WdfA9kSzXMltRczxmLLOPY3E06huNG8NHIu/wcGNV1i55rFKVoWk/uJ7fkgDinM6X
 mxpjfX8jRQEqs10cU1J7JPE2T1OLCDCraht4NkTmt1G4fBR6xcJgAjMizm22i2l0vGDo
 mQMmAtoWIQwdkM1j4O4/3Pktc6fpqYjDTISWX9rLjImMLkpItT+A8PF6eEFa3N+BAzwi
 zVlA==
X-Gm-Message-State: AO0yUKXt42W2fOgOJEzP0c+rRLqn0xDSAskIAh5z4dJbjz/dK4R/GY90
 BGha/Pse5gizSQU0e1mZzI+glo7b2iiFiwtfYnEX1aChsJXZvGHlVE/9bodFeGKIaj74Yy14Klg
 sl5mmCL522Zp9lfM=
X-Received: by 2002:a05:600c:30d3:b0:3cf:68d3:3047 with SMTP id
 h19-20020a05600c30d300b003cf68d33047mr12545237wmn.41.1676033387692; 
 Fri, 10 Feb 2023 04:49:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+nLNb082DexRZKTs0b+UEd6111mU1CdHFQRtp8UvLMWBybKyhnGJ8osMgX4WCAfEWSnhG95w==
X-Received: by 2002:a05:600c:30d3:b0:3cf:68d3:3047 with SMTP id
 h19-20020a05600c30d300b003cf68d33047mr12545234wmn.41.1676033387501; 
 Fri, 10 Feb 2023 04:49:47 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a1c5414000000b003dc53217e07sm5169474wmb.16.2023.02.10.04.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 04:49:43 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v1 3/4] migration/multifd: Join all multifd threads in
 order to avoid leaks
In-Reply-To: <20230210063630.532185-3-leobras@redhat.com> (Leonardo Bras's
 message of "Fri, 10 Feb 2023 03:36:30 -0300")
References: <20230210063630.532185-1-leobras@redhat.com>
 <20230210063630.532185-3-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 10 Feb 2023 13:49:42 +0100
Message-ID: <87fsbdhehl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Leonardo Bras <leobras@redhat.com> wrote:
> Current approach will only join threads that are still running.
>
> For the threads not joined, resources or private memory are always kept in
> the process space and never reclaimed before process end, and this risks
> serious memory leaks.
>
> This should usually not represent a big problem, since multifd migration
> is usually just ran at most a few times, and after it succeeds there is
> not much to be done before exiting the process.
>
> Yet still, it should not hurt performance to join all of them.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


