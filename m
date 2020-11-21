Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5509F2BC06B
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 17:08:06 +0100 (CET)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgVQi-0007zE-UG
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 11:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kgVOe-0006nP-SX
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 11:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kgVOc-0006wq-5M
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 11:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605974752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yApvu3U/iJACEriQUsqjOaFY4u1ip1+2x/fhMAyufaI=;
 b=byMNdNgZi3SFEtN55mwhH6LQAXCCqPfjK8Rn3ERyJXwd3O6ekF7S8GIJSY8z7eiTO67I6Y
 MiT8B3MEgkEeVEtAtJETdBzFM7oDk9z06qyYPd2BxnXeOUV+L42cBsw5/G3wur0NzJ+9cu
 7fHMfk2zWVafUB3taT5nZEHKtWFPFnA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-1lqfliR0NCSZ46r8mTFaYA-1; Sat, 21 Nov 2020 11:05:44 -0500
X-MC-Unique: 1lqfliR0NCSZ46r8mTFaYA-1
Received: by mail-wr1-f69.google.com with SMTP id 91so4502745wrk.17
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 08:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yApvu3U/iJACEriQUsqjOaFY4u1ip1+2x/fhMAyufaI=;
 b=Mmx37PoDfAa00HfxG08QK7SHtFH6jxhD1RWlGExtv0HkV1XwbVJU0qij7jx0TrB43g
 q0Al9+KuLmkerK9Z3JPwVyrQnYMQlysY78dejcQeHVBrt3KEZp7RE0Nc7O55eqRr7vrT
 nmMIJVbuZNBEmld4qfEOQao18bnrc0KgtVEt7XgJAmGvsC/ikMTgg2AuPHZKOc4etfQh
 Lciqbf4WnxLQXa6razNTzbW6f9rIGywbLhXRPIPJSZbdwKI/yMcTvn7T4aAzklb0eNAU
 2+eGc2a5WZtIeNS35I3Sq1SxlDKtap6YAwCgtlt1EVf+DltCqq0xsgeZivgt2f0PurP6
 1glQ==
X-Gm-Message-State: AOAM530yetNtjCdhvN5HlxoE4NxsDaxSAMgyOrKO42JMvJvxdjmSWzze
 0mYNhImMUj/Td9zWYfWBNkV8FpVX0lzcZNZAkwj5THhrHmFd6a+vmb5UB9KcPW2/nvEoojhk1n7
 ZUAnCvCf8dDi7J68=
X-Received: by 2002:adf:e611:: with SMTP id p17mr23128002wrm.180.1605974742897; 
 Sat, 21 Nov 2020 08:05:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyer8oFuztVCJ5zAs4ohpZBMWU7vTjv6u/oPb6tKD0A2XfzXG5DnKSHhZSj3ducNJb7PesrLw==
X-Received: by 2002:adf:e611:: with SMTP id p17mr23127983wrm.180.1605974742686; 
 Sat, 21 Nov 2020 08:05:42 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id b145sm8402589wmd.0.2020.11.21.08.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 08:05:41 -0800 (PST)
Subject: Re: [PATCH] hmp-commands.hx: List abbreviation after command for
 cont, quit, print
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201121151711.20783-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2d016c8b-aa2b-6416-ab39-dc7517a02010@redhat.com>
Date: Sat, 21 Nov 2020 17:05:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201121151711.20783-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 4:17 PM, Peter Maydell wrote:
> We have four HMP commands which have a single-character abbreviated
> version: cont ('c'), quit ('q'), print ('p') and help ('h').  For
> cont, quit and print, we list the abbreviation first in the help
> documentation and the command name.  This has the odd effect that in
> the full 'help' command list these commands end up sorted out of
> alphabetical order (they end up after all the other commands that
> start with the same letter).  As it happens, the only place this
> currently changes the order is for 'cont'.
> 
> Abbreviation first is also not a very logical order, and it doesn't
> match what we use for 'help' (which is 'help|?').  Put the full
> command name first in both the help text and the .name field for
> cont, quit and print.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1614609
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hmp-commands.hx | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


