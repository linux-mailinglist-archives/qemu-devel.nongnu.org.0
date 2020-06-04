Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B51EEA6A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 20:40:47 +0200 (CEST)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgunG-0005KQ-S2
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 14:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jgum9-0004pK-1C
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 14:39:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49545
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jgum8-0000wQ-EB
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 14:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591295975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfO6aDpSvHidv2vAiv2vDdV46Jwm8PNc5DIkLubz3Co=;
 b=WPQFUAlVST4y9wbyj/UthMDMvegMcc4IMwAVZ++0luVJUmDF8xpuIUaF/y0j/9XTZKY7iw
 LgLM5erR9qJw43pJwVYLmziFKwex3uIBTr7xctaN3MY9jcZgW1M31ir1n6xi0N89jyJ3AP
 SjUyCrBNWcci2uDOXeEj/MgYI5tSFkw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-XldwZL8jPzC8tytroIUBiA-1; Thu, 04 Jun 2020 14:39:31 -0400
X-MC-Unique: XldwZL8jPzC8tytroIUBiA-1
Received: by mail-wm1-f70.google.com with SMTP id b63so3059548wme.1
 for <qemu-devel@nongnu.org>; Thu, 04 Jun 2020 11:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UfO6aDpSvHidv2vAiv2vDdV46Jwm8PNc5DIkLubz3Co=;
 b=WNXFcYz0Cdsvnlnspz3HxzY4bdOJ9LhfvwjgFj01rUYXWfU62GWv+zq/tzA+Te5WiG
 ooUgbt5YRL7rgcj7fhhO+dva33qL8yypv9qNR46M7oHIigXUDk/Fz2YhZp00089qN8ad
 EHXTeyLD2/IkeltJLYR2HX9+evgOCmW7krNCXo3y6nxvyrIk2hQZuizsdXVaojpHz0bi
 Egap77foMVi3f+R5AgJqN4lyBVcQ6bvZZ+kQQrzS0zZ1ZvAmzclKVjUYp5cn3Magf9uT
 gQTpgnjQYRC13+6FHTY+Sk7vVXGdNqHBHjeNq2L9YeXKAmtq35P2/ll0HtHGIOeP668e
 mf0g==
X-Gm-Message-State: AOAM533Uhz+AXVyEJhLGEryN3pOeeLMsjMXPWlv0iDPQ2FOaX7QQGYQ2
 7XtuNEEgqmUXjZfmtEUdZ6n9V54rJ1mq4KltTZV+I7J7hOYGtQe91LGF//MZVP6vmhUzxC/C60Y
 GnvWrUgnLvphuKaI=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr5637840wrt.322.1591295970270; 
 Thu, 04 Jun 2020 11:39:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx15DJV6nOGxCJLklNxJxUTov4icbMCkAVCIp9gU1Xrs8NtnWrm5jucept/RHTHgI7PAlwUcQ==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr5637815wrt.322.1591295970066; 
 Thu, 04 Jun 2020 11:39:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a0c0:5d2e:1d35:17bb?
 ([2001:b07:6468:f312:a0c0:5d2e:1d35:17bb])
 by smtp.gmail.com with ESMTPSA id a1sm8290262wmj.29.2020.06.04.11.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 11:39:29 -0700 (PDT)
Subject: Re: [PATCH v3] osdep: Make MIN/MAX evaluate arguments only once
To: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200603013603.2400199-1-eblake@redhat.com>
 <03a13d47-fe7d-88e5-b92e-3c396591f9c7@linaro.org>
 <ecef14ce-47ca-749e-25b4-8e3ee378bd34@redhat.com>
 <2e894b8d-a510-0689-83dc-f6c8da16410e@linaro.org>
 <b4edd86c-a4cc-0b1d-ae28-009fe0a471e1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9ed75afd-1b82-de22-0d35-23808669ee03@redhat.com>
Date: Thu, 4 Jun 2020 20:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b4edd86c-a4cc-0b1d-ae28-009fe0a471e1@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 12:22:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>, quintela@redhat.com,
 crosthwaite.peter@gmail.com, f4bug@amsat.org, dgilbert@redhat.com,
 kraxel@redhat.com, dirty.ice.hu@gmail.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/20 21:26, Eric Blake wrote:
> 
> Yes, I just tested; using "((void)0)" in place of
> "__builtin_unreachable()" has the same effect (no change to valid use,
> and still a compiler error on misuse). gcc:
> 
> /home/eblake/qemu/qemu-img.c: In function ‘is_allocated_sectors’:
> /home/eblake/qemu/qemu-img.c:1225:15: error: void value not ignored as
> it ought to be
>  1225 |             i = MIN_CONST(i, n);
>       |               ^
> 
> clang:
> 
> /home/eblake/qemu/qemu-img.c:1225:15: error: assigning to 'int' from
> incompatible type 'void'
>             i = MIN_CONST(i, n);
>               ^ ~~~~~~~~~~~~~~~
> 
> 
> Of course, a comment explaining the intent can't hurt either.  I'll wait
> to see if this gathers any other comments before spinning a v4 with that
> change.

Please go ahead and send v4.

Thanks,

Paolo


