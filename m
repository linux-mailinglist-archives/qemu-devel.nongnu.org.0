Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E6A6FC42C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:46:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKqu-0001sA-Hu; Tue, 09 May 2023 06:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKqr-0001r1-Bq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwKqp-0007Ph-SM
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683629147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tIyMi3ICqRcGyjdajsgzot+5k/UJ1ATdfM3Tonpoppw=;
 b=d0vBdyTp23Fz8iSfKQr7nJsf5x9TuOdcnf2VKEsvKyzlvYmqh2cWU9YqQ0L+YYR7B3NoBJ
 UQBcH9P3qgxe59EbcKwsXGPlmMkLKALWnfRcyyQVL0HmSoD+UYh1v72DLkOOOp24hnpQCa
 ewxGcwQ6LviE0pXwvccPfWt7e/hoAJw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-qsvI2NoIN9mQr5JQu9-Ebg-1; Tue, 09 May 2023 06:45:46 -0400
X-MC-Unique: qsvI2NoIN9mQr5JQu9-Ebg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3078ad2f421so1999444f8f.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683629144; x=1686221144;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tIyMi3ICqRcGyjdajsgzot+5k/UJ1ATdfM3Tonpoppw=;
 b=bt4b4zvMb0vIRB1xpNCjpIZwDpApQzP3I1Cd5L5Q377Zq5fevhE6kY1St4Ta+dyLu6
 liG+978S84lLU/tx3ODwVM8dyeZfMpBEW3V58SiS2c//GrIiTt5wVwfAK1q/Gn/twLZ+
 JPFb7yPpAS2UoQ6ZcMSWcNGqM2dw7qJvshOsVA8Nr79hbB1iwRxRSuvTmi+owktDc66n
 WccEEmjcdwSZlR0dGoTiA1nFwFG3EgkvmVm2q40lRjJpVvTBfDkEBC8YsiihR0Mu2upc
 afVQzX2tm3zKi7X1XKdUfiZ/0Mjretcr8z+V0x7oXWaQAC8laY7ga/Nbq1kpTe0OUg3b
 kUDg==
X-Gm-Message-State: AC+VfDyHNaQylkDGReXquw1ItkHDjGZtR9V2oXwwXPGk1Y7ww3+i0h/O
 jDS8gSIUzoI3pICb3iLh0Tm4GEZ9Y0UNjw+hKw/XyVzXvnXc+sg7pIdr0LBAtMYfGTSyeQwx/QJ
 L590KPVsCjxeXzsZK9PrevHkRdA==
X-Received: by 2002:adf:dbc7:0:b0:307:a5cb:fe69 with SMTP id
 e7-20020adfdbc7000000b00307a5cbfe69mr1138179wrj.57.1683629144594; 
 Tue, 09 May 2023 03:45:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vkwX8mKX+zA/inXHFk0HjQlTrV+V17dUL58Hak5Is60hg6S/Lh3ULxzH1B/S+vM14HRMnkw==
X-Received: by 2002:adf:dbc7:0:b0:307:a5cb:fe69 with SMTP id
 e7-20020adfdbc7000000b00307a5cbfe69mr1138164wrj.57.1683629144274; 
 Tue, 09 May 2023 03:45:44 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bcb90000000b003f42597a1b9sm5635521wmi.28.2023.05.09.03.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 03:45:43 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v2 5/6] multifd: Add the ramblock to MultiFDRecvParams
In-Reply-To: <88135197411df1a71d7832962b39abf60faf0021.1683572883.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Mon, 8 May 2023 21:11:07 +0200")
References: <cover.1683572883.git.lukasstraub2@web.de>
 <88135197411df1a71d7832962b39abf60faf0021.1683572883.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 12:45:42 +0200
Message-ID: <87pm79eqax.fsf@secure.mitica>
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
> This will be used in the next commits to add colo support to multifd.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


