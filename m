Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4850356571E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:28:38 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M7w-00066a-Dc
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lje-0007jk-5w
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Ljb-0008Hv-GT
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HbU9AM/7STSBP+9fWaIm6UNZ1VhXKpFhK1SEAKhreM8=;
 b=f9RHrVR9uG9sqfqd68c9cvU0+uyN5K272sylI42dVZnSk3er0mSzhI4EF3HUntJidMZRSq
 d+8A4EjBZ9S1TJZe6htwpY6JaU/uyE+dGZDiu44Q4UZxGP7xv5fdGydCPfz7rcIeLZxll/
 XPcqRRGHWuhKzKj6AEhQOIcAdWmllAE=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-8Wi7kqhfM6mHVoakbQhYpA-1; Mon, 04 Jul 2022 09:03:26 -0400
X-MC-Unique: 8Wi7kqhfM6mHVoakbQhYpA-1
Received: by mail-io1-f71.google.com with SMTP id
 h18-20020a5d9712000000b00674f83a60f0so5601991iol.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbU9AM/7STSBP+9fWaIm6UNZ1VhXKpFhK1SEAKhreM8=;
 b=4c3f0mKvRw3szB0f6cM2hQSBybAlyEx91OaxsKPOp4FTJPgHxRy2OKfV/uR+1GHvEs
 W51guTlvcPuZWQ0YhZ6cC3kNsJKf3uadBHUciPgVgMUeenDWk2McKwVrw7ZqrEODESsu
 1ZwAiAISFlJ5K1buZZyhH9s4rWhYn39Rv+FhRBD5MfyaY0i/PFHVD9k4iA5wi/IzLjz4
 2NDu+D0OFJrn5fqf2qGqmvSwTBh1NOI9jTrGAuL2kN8zB8+sZAZ4MUPTSF3ukd2vORH7
 CBzACYQcWG/Tydf9KB3clhzjoyuuZDF2D2e3FI5MeinTsCzLRKKHPcpTHSnviJIqbG7G
 VC2w==
X-Gm-Message-State: AJIora8aoVkoJutAxlw6ragI/XymXry3G4S05UKPlYNaYPP8IpiUHusp
 3wXV5FNQkRB6lhX62z1NC/FlCWreKhUk2xHsKzzu3q1k36zYNsjzXu/woP5lByyqK7xfLxSdZIN
 HfGTB2vg/vur3NuoOZ1BY3QPP7xhfpxE=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr17693835ilk.70.1656939805104; 
 Mon, 04 Jul 2022 06:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVc3YJj8Jau3dW6BhMrGjgcQh70CQ336k7kCx0pHsVSoL03tnpoBISyFtuCgbPKwdlf9zZ9DGB5cjT4Oo/6VI=
X-Received: by 2002:a05:6e02:1486:b0:2da:9864:b480 with SMTP id
 n6-20020a056e02148600b002da9864b480mr17693825ilk.70.1656939804976; Mon, 04
 Jul 2022 06:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-22-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-22-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 14:02:49 +0100
Message-ID: <CAELaAXx4=O2YYuXQBAB+dAEs-zP9U57b2pByUCGtO43kf1o4+Q@mail.gmail.com>
Subject: Re: [PATCH v2 21/26] job: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 9, 2022 at 12:02 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/job.h | 2 +-
>  job.c              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


