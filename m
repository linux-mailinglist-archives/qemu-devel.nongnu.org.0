Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD8C3EDC91
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 19:48:19 +0200 (CEST)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgig-0007HI-E8
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 13:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFghd-0006bF-Hs
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFghZ-0001vl-Tq
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629136028;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnG7YBgwJp1fKekuqDV/DsZxo6LFVoiinW+/sKCXkNA=;
 b=GqKRALKTaSeoMHyDcMlaE8X8j1GS1vN5D7zXqe6dpgh2meAqBa/WjwxG8zwa6+oyij/5Ki
 bTj9YuRagW6ZIrXGcklLDn/y9WtbdHOjmukq7J9KdUwwYq49Qx1q1RrMBrjrD+XM8J3OJi
 OtqnqOiBVOTzbpTPZ20gsb2EgKP6ovw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-Fmi9FoTIMMeQxWWu57s7Uw-1; Mon, 16 Aug 2021 13:47:06 -0400
X-MC-Unique: Fmi9FoTIMMeQxWWu57s7Uw-1
Received: by mail-qv1-f71.google.com with SMTP id
 t3-20020a0cf9830000b0290359840930bdso10018755qvn.2
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wnG7YBgwJp1fKekuqDV/DsZxo6LFVoiinW+/sKCXkNA=;
 b=AsyZYYnSQbaw9oDgk770BoFwEhhVm+4RKIrkCQvI4iSBO8mYDey3X0yTBpRHKjKv3t
 M6SU9qlPS+oVQJZiH8y9KbxqkaRtMQEV6ge5UNma0ndPozAxLmJAbwvuzWwM6zh407hP
 poQc/ZH7cY0ja1FjqbHz+jA0QMIzX+v0MbsYZlqzw365zdOqH8iJBiYg3wDSVimFDWsM
 l9XUyPiEUHYGVQJ2TB8cN9hQccyDcRTJka7k33BFQZpmK+yvT4xGKhphJDjFGlIGwgb9
 JWZgVyYwSKkHtizt8ON/M6goOANLk4eLnQaPmWerIGU5tr3OyZk5Cmz6jPQltMM5h6Fz
 FCOg==
X-Gm-Message-State: AOAM531Yy0Th3aQ7FseFu/eBz2RebVr/gsPzgI1QSQ5WqZDHMomRS0Dk
 fg9fhJAbNxJidvG1AEn079UR1FwE+aAF5DEUJUKHzzP+ksivhsH3w26rHkJJh88Bs6syS7LSwaj
 R/oZYyyJu8wjFiSw=
X-Received: by 2002:a37:944:: with SMTP id 65mr94514qkj.412.1629136026104;
 Mon, 16 Aug 2021 10:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytpxr3o9sJUOq1034D5EM1wzS6wji24qesbqbATOo/9DbKNP8SqyS2zeT/4LBUVBL4SG9XEg==
X-Received: by 2002:a37:944:: with SMTP id 65mr94507qkj.412.1629136025965;
 Mon, 16 Aug 2021 10:47:05 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.241.196])
 by smtp.gmail.com with ESMTPSA id k5sm5174974qtq.6.2021.08.16.10.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:47:05 -0700 (PDT)
Subject: Re: [PATCH] Acceptance tests: add myself as a reviewer for the
 acceptance tests.
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210809192907.42138-1-willianr@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <62ce26b4-8ca0-0321-554b-a3f546dcb2c4@redhat.com>
Date: Mon, 16 Aug 2021 14:47:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809192907.42138-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: wainersm@redhat.com
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Willian,

The "Acceptance (Integration) Testing with the Avocado framework" 
section hasn't any formal maintainer but I always considered Cleber the 
de-facto one. In this case I don't know whether my acknowledgement is 
taken in account or not; anyway, you got it from me:

Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Thanks!

On 8/9/21 4:29 PM, Willian Rampazzo wrote:
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b1a8e442..3f8ad63165 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3422,6 +3422,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
>   R: Cleber Rosa <crosa@redhat.com>
>   R: Philippe Mathieu-Daudé <philmd@redhat.com>
>   R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> +R: Willian Rampazzo <willianr@redhat.com>
>   S: Odd Fixes
>   F: tests/acceptance/
>   


