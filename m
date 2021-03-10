Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A83345B1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:51:49 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2zs-0008Kv-Dw
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK2Vs-0004Da-8Q
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK2Vo-0004aO-V0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615396843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OHPxz0Aw12RBX9p+WEUKKiT6PRman//prRXV8zZ7xgc=;
 b=Lcrx7pS/y7fwhP5ZSim3pEjUp0t2ZvYRQ9tMDyA6trCU8V33Use7na3BuJxM2OWUk7XaZw
 GaWq1OWBFYiuEwGN0vRys9h1ZTDxIzVORsXMzy753CQH9usg6Q09jgxeWn6RoN+zuD+nEF
 sE8sUY6xcR9Zl9jm3cyaRQdEM5W9jGE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-6eABNIXrN4Oi95gbsKjNsQ-1; Wed, 10 Mar 2021 12:20:41 -0500
X-MC-Unique: 6eABNIXrN4Oi95gbsKjNsQ-1
Received: by mail-ua1-f71.google.com with SMTP id l26so1414431uap.16
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:20:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OHPxz0Aw12RBX9p+WEUKKiT6PRman//prRXV8zZ7xgc=;
 b=EC9N5ywEHsvhp6NpNw3Xiyse1il4Vh9Tw3JYe0bPlJz3Bhgfi/uf+y5obRA92QV2Q5
 ZDu5aqssdFKw95DiQlGRMQs/HCd0rmOe9mm3McDPkbuutChg07SBao6lS+1TRsKK0tZz
 bNl0GH5TrtgKrekwj9BHIv5U+R9GsPCBGSW5eNxjLlgYWrAubMJnaDsUEDGIAH316U9R
 VjM0SpE23hhkN45eAvbsHgzzMB+OMePNh9OkqDw76jQwLZTB/SUBdVT2UmvbFpS0LNqO
 92JSTTZIKH778gJVw4aYHRyktYXrz+cgkhURxpGrCmGxb2UU95ERxv1k783SAVQvsFql
 Bnjg==
X-Gm-Message-State: AOAM532Q85BQikfZNasjDnRbsY0CE6zxG32f3I35WqX54HCfZmA9cRM2
 iQm6LzaQS8BJcs8ObyzimEHvWV+r2aIz2Ns0XlNPZ8Jp8uByAoZjX3koc8Y+JV/XSihDfBt083w
 OfTNOuLVz/ZcvOlV32SmIYfCASbrjLJU=
X-Received: by 2002:ab0:684f:: with SMTP id a15mr1581863uas.133.1615396840508; 
 Wed, 10 Mar 2021 09:20:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEiDwz/A36woXPBsOJzGz3WE3rJuKAzFcHHYgH3nelA8XgiQkfPXcVqq9QABuW9iTfCoNPsLKyc0gu6PY7nIE=
X-Received: by 2002:ab0:684f:: with SMTP id a15mr1581836uas.133.1615396840273; 
 Wed, 10 Mar 2021 09:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20210310164612.285362-1-pbonzini@redhat.com>
In-Reply-To: <20210310164612.285362-1-pbonzini@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 14:20:14 -0300
Message-ID: <CAKJDGDY9r-mRv2Au=C1deZdHRGsUAvWxGS3107xG6KCO3o84tw@mail.gmail.com>
Subject: Re: [PATCH] tests: remove "make check-speed" in favor of "make bench"
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 1:46 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> "make check-speed" has been broken since the removal of ninja2make
> last October.  It was just a backwards-compatibility alias for
> "make bench-speed", which in turn is in principle a subset of
> "make bench".  Advertise the latter and drop "make check-speed"
> completely since no one has noticed.
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Supersedes: <20210310094936.1318317-1-thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/Makefile.include | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


