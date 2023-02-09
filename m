Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F6691193
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:50:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCuC-0005vx-Jw; Thu, 09 Feb 2023 14:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQCu5-0005vP-SB
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQCu4-0004kv-A4
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675972098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=49k5dHSfFHAuH+GfZp3woB7SltOb5x6HuuT9s9fP7AQ=;
 b=KJNwx0q/LPLDuy5KzfBWGVJPEbZ7tAC5/A8zOcxNtZV8CedOF30cWZE+FS97I8K5WkBaAw
 EO2SziBT2TYlY/DCC2UkMvTWsq0x1aqq2sJGDvWHb2mOZbfFOzvkIcMnMm/4a3M9x7aPYN
 Ln3oA1u9aShhY1G+5+t+/DMp+zJgN7c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-eXJBOxGzMUqvyivRolQ09w-1; Thu, 09 Feb 2023 14:48:16 -0500
X-MC-Unique: eXJBOxGzMUqvyivRolQ09w-1
Received: by mail-qk1-f198.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so1931521qkg.7
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 11:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=49k5dHSfFHAuH+GfZp3woB7SltOb5x6HuuT9s9fP7AQ=;
 b=pDAoLSzo+EJYWiYb/Fd+PgcWbJP5KiBhOl7Edf8Q/uSIDNU2efuEIKfx5eY+LfBOwi
 ODT+uyF9TlS8prGQGt0YqtoDB5dsEsLl4bSqDHkDaXYotIdICqglLwY8gN8OYuUF2puq
 h8VnLWzxiybd6g304oIMZAdeKl1V3QVM6AAcQnDpklnbp2w7nLjw8qg9QwoSTDevgSUH
 BBgz393I+WYtdiYxrWxVLoftRmXlU5AjI/LLTGO9Dtgj4H4Xtm1b6ZCQTnKUT9gRyIui
 l/GHr4SwC1g5gKGERaGCpCgbio3oSwXSMEm/+Zsnch928pypfyaJ/OqhyVkm0fPMIzKE
 GRAw==
X-Gm-Message-State: AO0yUKXjLS+Gcxw2wO2pQ/u1WOWHOtBr0HhPyK0Om3/MUZYIKepidury
 PYU19y8yApIvXIRym+QDn1VT2pNtjPliXVZ/Czt87mXGKqtKXcUI0ZyuCvb0JWIufdsuQ84hVA7
 uqArQ8BihNn4L+Yo=
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr22355151qtp.0.1675972096497; 
 Thu, 09 Feb 2023 11:48:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+9MK3rviNvRzC7JCVVyRwITyo8s9SkB3XQTiJ8OgHdOFC0ba2ns2EdOKGBXPHp8u9feT3+yw==
X-Received: by 2002:ac8:4e8d:0:b0:3ba:1ace:8bae with SMTP id
 13-20020ac84e8d000000b003ba1ace8baemr22355117qtp.0.1675972096257; 
 Thu, 09 Feb 2023 11:48:16 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 e6-20020ac81306000000b003b8484fdfccsm1879077qtj.42.2023.02.09.11.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 11:48:15 -0800 (PST)
Date: Thu, 9 Feb 2023 14:48:14 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH RFCv1 2/8] memory: Add last stage indicator to global
 dirty log synchronization
Message-ID: <Y+VN/vWvdO2IxL3C@x1n>
References: <20230206112010.99871-1-gshan@redhat.com>
 <20230206112010.99871-3-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230206112010.99871-3-gshan@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Mon, Feb 06, 2023 at 07:20:04PM +0800, Gavin Shan wrote:
> The global dirty log synchronization is used when KVM and dirty ring
> are enabled. There is a particularity for ARM64 where the backup
> bitmap is used to track dirty pages in non-running-vcpu situations.
> It means the dirty ring works with the combination of ring buffer
> and backup bitmap. The dirty bits in the backup bitmap needs to
> collected in the last stage of live migration.
> 
> In order to identify the last stage of live migration and pass it
> down, an extra parameter is added to the relevant functions and
> callback. This last stage information isn't used yet.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  accel/kvm/kvm-all.c   |  2 +-
>  include/exec/memory.h |  5 +++--
>  migration/dirtyrate.c |  4 ++--
>  migration/ram.c       |  6 +++---

Better move the migration/ changes into the next patch.

Thanks,

-- 
Peter Xu


