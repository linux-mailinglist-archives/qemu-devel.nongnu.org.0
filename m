Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296EC680544
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:50:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM7F-0006IM-Gu; Sun, 29 Jan 2023 23:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM7D-0006I8-E0
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:49:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM7C-0006Nr-2m
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:49:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3Ol84S0R9zitKgsk8aNCoqCvYXlTrsE1R7FuYtR/tB4=;
 b=OevbKiTG9dvmxtggtYgGRO4jjNIFlBmQrSVJJ6ob/Frr8Jdmdb1Wtjl29YDD4mTq7UCXD4
 osheXKkZ3tQpzir6CA4t/3IhxlwIU22ZsUH4BrbvC5nIhH/oHxZI8izjJWt8sJM0r8VYj2
 deWVhUK1yUKF5FpTV+DpgIK3u2Tm0b4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-aoSvaDNtP9a5jNclSAJC7w-1; Sun, 29 Jan 2023 23:49:54 -0500
X-MC-Unique: aoSvaDNtP9a5jNclSAJC7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 bj7-20020a0560001e0700b002bfb3c6ec00so1555131wrb.4
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Ol84S0R9zitKgsk8aNCoqCvYXlTrsE1R7FuYtR/tB4=;
 b=sNwi2Ib6FaVpLcrcU23c8vrE8fRgEP//W1NzesZUAFKrol2VjD5xBjUZjDKzG6wUf8
 wv8v/P+uupW1E8mMSophUbNDZL+WbfTz+Eu0ehZxbesYTvtwmDZo3IHYD0HEMv4xk1lj
 HnBux76dlcggXbP5SXtqlfLAsFUwUEB71+a6lqrBvNJxqNuLGYoQ64mKV3wKQlgVMxaq
 AoRcJoPhRfj8QwdS1+g6+g/TU7u/D04o4GcBiBCYhr5qVi+gFbCGUtIFys/ghAr3BMdZ
 UbeS6OzvYOyKZXtNCvchpES6/uaYNjDbocVmUHuzREEHhjeUUNDZ5weyjXvBAdwXAcih
 o3+g==
X-Gm-Message-State: AFqh2koeksHAucRIkpqMdu5t73qAgWxouctZtnuakDviUt3GfkLBwrcG
 WIfZXn8MMKITMCZ5cLGWRU/z2NIVrUO351RJQDw9RFJG/VSQOoMBOZYAUHQRMsIL6STCJNwmyJs
 Y/UVbjiMVs9fdEdg=
X-Received: by 2002:a05:600c:1d0b:b0:3db:88f:996d with SMTP id
 l11-20020a05600c1d0b00b003db088f996dmr47080102wms.36.1675054193760; 
 Sun, 29 Jan 2023 20:49:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtVk+bvKaxHz+ZzhVmopi7ByKNnkkzH2EQnccoY8UMQUjyLuXOtxaCb/nWJyHvjgEFlHGoR1g==
X-Received: by 2002:a05:600c:1d0b:b0:3db:88f:996d with SMTP id
 l11-20020a05600c1d0b00b003db088f996dmr47080091wms.36.1675054193607; 
 Sun, 29 Jan 2023 20:49:53 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 d33-20020a05600c4c2100b003dc41a9836esm7716812wmp.43.2023.01.29.20.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:49:53 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  dgilbert@redhat.com
Subject: Re: [PATCH 2/2] MAINTAINERS: Cover include/sysemu/accel-blocker.h
In-Reply-To: <20230119091545.3116376-3-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 19 Jan 2023 10:15:45 +0100")
References: <20230119091545.3116376-1-armbru@redhat.com>
 <20230119091545.3116376-3-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:49:52 +0100
Message-ID: <87fsbslj7z.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Markus Armbruster <armbru@redhat.com> wrote:
> Commit bd688fc931 "accel: introduce accelerator blocker API" aded
> include/sysemu/accel-blocker.h and accel/accel-blocker.c.  MAINTAINERS
> covers the latter in section "Guest CPU Cores (other accelerators) /
> Overall", but not the former.  Fix that.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


