Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21CB2FB6C2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:12:16 +0100 (CET)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rjz-0007AC-VY
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:12:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1riJ-0006UY-FQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:10:31 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:40207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l1riI-0008UN-1w
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:10:31 -0500
Received: by mail-qt1-x834.google.com with SMTP id v5so13698589qtv.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gqp35W32vPXjH5UD5m/z7/hXe4eHZ0Lax8MiE8SZPr0=;
 b=i15aL57WdGxRQuOthG6YUcNgR4prduw/QVWjmIpX98Ab4vI98c4sVCirouAvkr35OU
 9LL5WmI4+txq9XvEaRUZ0j2gQ4khRkOGIRkcaNnzFYZOip8iBBb/oo8TZrGrWoQYuajR
 3rmOkiSzLr0KYuJIiKyrCkxaU+K+QxGN6z+O53l1Elnf0iqq1GA5TOBqSsjMdZZV+ADe
 heco90EwzTCtGOP1zUDX2hZNksYhTO9xaPzEaLXOW39TUDHpYAgFqU/ocmU8WAIzGNZU
 +Y/UuPbsNcOZPxbV+LBt8AGKD59R5eb/EaKbp5lt6yLeo/FAl8Fv0PLhecZgC3GKYian
 x2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gqp35W32vPXjH5UD5m/z7/hXe4eHZ0Lax8MiE8SZPr0=;
 b=Q9TL2YvUjcCHOWrkXLrlwS/1Cf5DRpyUCGUOB6IXvQE1tg/9kmi1F7RkBWEdv37WzV
 Q9McATNvKGGI25jI5Ez7lIUVW0FTbfvidH8XDZfBjfRgfHqlsBy84vHl+gTbiePLv/a5
 rYsNazwE6lVPcM5Wz1/mxpsfPEP+wKLgTFNa7knkTrOnosE54iqHqi+nTxIchBvpDAwh
 TYlLonl9m4D9s3Bg/bU26A98VjpsXBjILB6J8p9eobQQe9sAuSTEivZc4kzsLYRQv2GF
 ilDugM9Jm7MM9GhhjTA7y+AfxEEsXW1nj2iGRe1vwFHrfrmcHuxeCam5uVm+R7nndg8z
 Hakw==
X-Gm-Message-State: AOAM5322iWrfxT1ZnuRQhhhNrHKsiLuwynvpWaiFj75fcLNKSp/qTeJI
 WMPsI9lOVhCcxacSgJxVWueADu/yXkE=
X-Google-Smtp-Source: ABdhPJxOhNESvch9CAHGhA+y/kBaXSRyKPxDExyxys6U4a+MMosmgsqPsz2oHgLBKUiw4DffwNi+4g==
X-Received: by 2002:ac8:36e2:: with SMTP id b31mr4366516qtc.19.1611065428886; 
 Tue, 19 Jan 2021 06:10:28 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:a75a:cb34:ba60:6de6:be1d?
 ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id a77sm12948617qkg.77.2021.01.19.06.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:10:28 -0800 (PST)
Subject: Re: [PATCH v2 1/1] vl.c: do not execute trace_init_backends() before
 daemonizing
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20210105181437.538366-1-danielhb413@gmail.com>
 <20210105181437.538366-2-danielhb413@gmail.com>
 <20210106165914.GA133192@stefanha-x1.localdomain>
 <CABgObfa3wrhou3Pug4wZ5i2kQ9WD3KZy3+F3Y=zQbobXUnru5g@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <04556d15-afee-333c-155f-bb0d2ab50436@gmail.com>
Date: Tue, 19 Jan 2021 11:10:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CABgObfa3wrhou3Pug4wZ5i2kQ9WD3KZy3+F3Y=zQbobXUnru5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Is this queued to be pushed? We can't test Libvirt with upstream QEMU
without this fix to be able to daemonize properly.


Thanks,


DHB

On 1/6/21 4:59 PM, Paolo Bonzini wrote:
> 
> 
> Il mer 6 gen 2021, 17:59 Stefan Hajnoczi <stefanha@gmail.com <mailto:stefanha@gmail.com>> ha scritto:
> 
>     Acked-by: Stefan Hajnoczi <stefanha@redhat.com <mailto:stefanha@redhat.com>
> 
> 
> I don't have anything queued shortly so feel free to include it yourself.
> 
> Paolo
> 
> 

