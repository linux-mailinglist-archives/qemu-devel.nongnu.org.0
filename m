Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927096F1D59
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:24:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRoL-0001bF-Mb; Fri, 28 Apr 2023 13:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRoJ-0001b0-Eu
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psRoI-0006qg-2Z
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682702582;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVsb0mdE9v9AFGO9u/XfDfGRGP9JSThnj6YDxPO7BNI=;
 b=Sjn//9/O3zxCweeV2vOQ6vWhz8iogsLEbJoblEZm5u6TEPa0ynqGot+AR1NtK5Wlopv4Jg
 DN/W3v/q9TK3WQ6bmu5Bi0D3F9yFN8XmWm1nEkL5TNZPlAgJNI4+PwkxIcOpBZhx5ERHtj
 dcmIDzMl4Y4Q14sdS1+IZNHUQnEg0Ds=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-hRzCkRaCO9q2MTq31coj5w-1; Fri, 28 Apr 2023 13:23:01 -0400
X-MC-Unique: hRzCkRaCO9q2MTq31coj5w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fa5d643cd8so3258002f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682702580; x=1685294580;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jVsb0mdE9v9AFGO9u/XfDfGRGP9JSThnj6YDxPO7BNI=;
 b=hLN2Visp+f6QyYCo4neF7SKTkwo8t56s+1lc2nRb2uK0PJLsERZAokszfXOp1wTkZn
 Fp9VlNkm6hhEHe+zguvqCNK/LlwjvRaIe51KFtfeRLTlCNydqFAhkk4BM/QspiHOz1nq
 FocLS+cx3/btRDI3nQB9cRklsptO8OI92dyOEO1jenxCAT0mGOQiUbAkfLNUD1OIRhID
 V/J8SM0bQ5lJjl3d9yyss8hwW6tw7WK1FlfAAT4gyYwncVZMVQZnFUkpHLJKguBtkXKl
 b1V+OwJKxbcUZEJJ9rjKqJpS7vC2VXTtVW0bVmDlg7zACStiaHKpHWoD5YxRHPAkZW3Y
 p3yg==
X-Gm-Message-State: AC+VfDxfq9zyQb+nGCgIErjp7GiNKfoziHpaAbWSGqbc/9uwzOzuFtWE
 no/d8EVKN/9nnKrchvFxZYCwB13m39EmrN7bvaNJiMbFcY2KixoxsHR6n51+vFmOPQ1jjMV9x6G
 t8Lr2UxrGnyq5pTE=
X-Received: by 2002:adf:e9ce:0:b0:2f7:efb1:ec8c with SMTP id
 l14-20020adfe9ce000000b002f7efb1ec8cmr4711043wrn.23.1682702580132; 
 Fri, 28 Apr 2023 10:23:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dpb52XS4LvMd0X7HYQ+3GUU4ELbog1r1c3TMVNUI11MEaF7sxuMV+SqRYX65C6bi34MtpUg==
X-Received: by 2002:adf:e9ce:0:b0:2f7:efb1:ec8c with SMTP id
 l14-20020adfe9ce000000b002f7efb1ec8cmr4711030wrn.23.1682702579877; 
 Fri, 28 Apr 2023 10:22:59 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 u15-20020a5d468f000000b002f5fbc6ffb2sm21536927wrq.23.2023.04.28.10.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:22:59 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 11/13] ram.c: Move core decompression code into its
 own file
In-Reply-To: <e0873b0c137cef2ca799d68bf850548d11b5d61a.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:28 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <e0873b0c137cef2ca799d68bf850548d11b5d61a.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:22:55 +0200
Message-ID: <87edo3aplc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Lukas Straub <lukasstraub2@web.de> wrote:
> No functional changes intended.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


