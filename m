Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA540460B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:20:02 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOELo-0001Q8-Lj
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOEKY-0000OT-3L
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:18:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mOEKU-00084N-Pn
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631171917;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UBHjiwpUuh97Dvg4zs7RAeG+PIXhLzmqqlO36TF65tg=;
 b=SBdtj2XffH9sTyzQATHAo9Os/wS3EdvsCjPLUas2uXdit//lJI8+xGxtNPjw0W8XYduInE
 LAGuoRoR7ThmRd1PZ0lcDZTaoGFFahQ1YM7JguqR+vY4hQzUUTbT8Q31LTB72mPPOOyCWr
 DFrIKYkjGiuHWwplx4+uCotLMqRprgg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-7i3FUI9tPbac_OxvcIQcxw-1; Thu, 09 Sep 2021 03:18:36 -0400
X-MC-Unique: 7i3FUI9tPbac_OxvcIQcxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso471521wma.9
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 00:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=UBHjiwpUuh97Dvg4zs7RAeG+PIXhLzmqqlO36TF65tg=;
 b=YxFN4WnMkFYjyQhMMtrTPANP6dix5HfyLlCAR4kbPm9BmpGLtNq8w/0msLayjvlpsQ
 kIkB1/QFslj+DgTyQpOeH6ZQmSpMldpKelHY0+ICuQoi2stB44HyjRLXLra7wUXVutMQ
 KFyLcShxKunK3qVYnyGzar7ZggaEf1icMdrOqcrnbBns7WLBrVnCIFBwudR4nl9AerIG
 uYbULSYzO4II/c5CPUL0ebDL8EZQ/O7tw5Xwr9f2pBAtFc1HfBnx/YAFtaY2P1qo18C8
 6yT1HZHYL+++a0UvVTMi8fcCPROPBbbyniRfPrcr9wd+NG1A9amwGc9bd6VKgv5uO8Gn
 S1hA==
X-Gm-Message-State: AOAM530w73Gjd+s5FOKzziPbtUCoSZvE7Mi+R7BwEojPHtN8CqPQPwWI
 xIn7yJ1/3A3ZUZJ2xXQXjSqEl8vLcoGqDy8arqr5NEr/uCVCjItsfN4FCo61korqaVj/iWyeh7h
 LzRGKrCY1iEGazis=
X-Received: by 2002:adf:e101:: with SMTP id t1mr1711850wrz.215.1631171914946; 
 Thu, 09 Sep 2021 00:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8facpyxmutBW9wm4tau8aM5q5Z2ODLEIL/jVI62tA4tUufdv05wuQLs3nPa5wxdPKZ4bGhA==
X-Received: by 2002:adf:e101:: with SMTP id t1mr1711830wrz.215.1631171914779; 
 Thu, 09 Sep 2021 00:18:34 -0700 (PDT)
Received: from localhost (static-41-120-85-188.ipcom.comunitel.net.
 [188.85.120.41])
 by smtp.gmail.com with ESMTPSA id z1sm781941wmi.34.2021.09.09.00.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 00:18:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH] multifd: Implement yank for multifd send side
In-Reply-To: <20210901175857.0858efe1@gecko.fritz.box> (Lukas Straub's message
 of "Wed, 1 Sep 2021 17:58:57 +0200")
References: <20210901175857.0858efe1@gecko.fritz.box>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Thu, 09 Sep 2021 09:18:33 +0200
Message-ID: <8735qecj3q.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lukas Straub <lukasstraub2@web.de> wrote:
> When introducing yank functionality in the migration code I forgot
> to cover the multifd send side.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Tested-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Leonardo Bras <leobras@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


