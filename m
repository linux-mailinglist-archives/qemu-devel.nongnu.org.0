Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4E043F713
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:18:59 +0200 (CEST)
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLEA-0001mn-9Y
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgL5a-0007sW-DD
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgL5Y-0002Yu-DG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635487803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2u+inP+aKyI76LYtCQk95FBJS6VcSHyRUPCveCzt2tY=;
 b=brIQQdSd7s/GJDlKwOeAc7gl5XtQrJXC15tcmAvTAvJR3RPyy8eLsebxypfkejHz6b3ipf
 YH3RMTiFRlJh9GUbJ7uryk9mMs2Hx5Z+IXJx/JdIh8WJpZL8G3tDh8aSpxW7pdkgsoIdlt
 +GJlgihyiNlUKyYozmfkwZf1c6MaK74=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-czqWcuXUMi263LjRPKlcng-1; Fri, 29 Oct 2021 02:10:02 -0400
X-MC-Unique: czqWcuXUMi263LjRPKlcng-1
Received: by mail-wr1-f71.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so236265wro.19
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 23:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2u+inP+aKyI76LYtCQk95FBJS6VcSHyRUPCveCzt2tY=;
 b=YkftofomGjgiqtoNwU67tQkbLkk+A6sxBR/wzEdHhIZAh3BcBSZnl/JgXwbHkV/a3t
 irWqp6WFnrwF2BXhM/kNfDIutJotFe7ysxP/epS9GFsl6X9AKUa4UBOpFVomSfp0YKTc
 wUYT3LD0ao32U+VPmVXbUf2Lxxaq/U/nQq9pgQFWCtpI+fRomP1U7ivsxowtuhVImv9J
 i303KQ+AhKb6hBzh5rL5PsVKSLmCn9pWqRr8nE2XEFX7jd2Yr1bKUus8D4x77UeGS7CD
 +dukq+6K0O+fDqNg6wJPrNsbo20F9QGglxT6A6czdiCYDArL/zGBAqTBTKje03S+7i/z
 gWOg==
X-Gm-Message-State: AOAM530ODWYH+DZjKdvWB/q/unqDENwc6G0VDV4poSZ2eIl9r+Suvwt1
 nirUZI4LcF+nMoQkrFtd4I3sCm79RF9H4aXF1LdXxhFW9cse7mxf66B/W7OtxMiTRox6cG+XM09
 mTIFBYvETGX62HoQ=
X-Received: by 2002:adf:e34d:: with SMTP id n13mr11548235wrj.97.1635487800993; 
 Thu, 28 Oct 2021 23:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTkSJRPmQJhqc+BFf8IK1NjyZP0OfMTgJBhSd/NlxzBWplel7TqNHxy9lYkcDZuoWbGTtJwg==
X-Received: by 2002:adf:e34d:: with SMTP id n13mr11548196wrj.97.1635487800613; 
 Thu, 28 Oct 2021 23:10:00 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r1sm8891802wmr.36.2021.10.28.23.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 23:10:00 -0700 (PDT)
Message-ID: <a2e059da-4c3a-66b7-6ce6-2b2fed0f980a@redhat.com>
Date: Fri, 29 Oct 2021 08:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hvf: Use standard CR0 and CR4 register definitions
To: Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org
References: <20211029013315.79207-1-dirty@apple.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029013315.79207-1-dirty@apple.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, r.bolshakov@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 03:33, Cameron Esfahani wrote:
> No need to have our own definitions of these registers.
> 
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> ---
>  target/i386/hvf/vmx.h      | 17 +++++++++--------
>  target/i386/hvf/x86.c      |  6 +++---
>  target/i386/hvf/x86.h      | 34 ----------------------------------
>  target/i386/hvf/x86_mmu.c  |  2 +-
>  target/i386/hvf/x86_task.c |  3 ++-
>  5 files changed, 15 insertions(+), 47 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


