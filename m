Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE553A2EAF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:54:33 +0200 (CEST)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrM4m-0000sY-IX
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM2h-0006p3-9L
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lrM2f-0005h8-HN
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623336740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVFvQ33BeDWxwSMSrsEgynn/qBGfoNRYCdPMlJb55+E=;
 b=cLBkmOaPodcM5IjHWjGQaHrSevIFyaqEV5l13W7KD8Wo71H1WNLUvlSa68k74/7iQFtjEy
 yqa9tVc36e7nOTnImboYyxPRD1FNJzP1PonuQcOFcLBcdRfWR4Dni0l70gFH68IQlxwEiC
 e6mGlKvsEpquYcUkidu0dTw/PdHVW+E=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-7OGWmJxkPz6smiSHBV342g-1; Thu, 10 Jun 2021 10:52:16 -0400
X-MC-Unique: 7OGWmJxkPz6smiSHBV342g-1
Received: by mail-oo1-f69.google.com with SMTP id
 d12-20020a4aeb8c0000b029023bbaaddcbbso17451811ooj.13
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MVFvQ33BeDWxwSMSrsEgynn/qBGfoNRYCdPMlJb55+E=;
 b=O2PwYtEmLSK2A656FtDoXJklU4GD4hV7FKKMvkaYwRuMXZ3EjscA3Yx+sty9n5AYCJ
 hcJQLXAQYYw5IP3YCIRBciCK4xsNtgUwAf7KhknE31M6DCjxdB8WftOUzWxcJLvG6Vy/
 2XaW+K4LlwP1mpkB/aMO4iNXK2b/6fkCyNonpYxl+F467URCGt0E53mpXklLvkLAxCFd
 WN8AC9y3Pfv9bomruXOcYuF7PAIYVzpXUtPvEIhqX6N/Vkb0Fuz8G/urkuVV62yJqR/X
 hgxgg+olyWU+tzzYFht2BXYDQojM66yt6F5DLdHXYs80n5Nm8Q/Gv7GnWuHQsykQwNBJ
 +YVQ==
X-Gm-Message-State: AOAM530kJgK+JJ3kyid5r8mytq6pi6UjK7AmwMiVV7RVlz4G8RJDV3bA
 9oX9iWF3JOY4quUbHFU/sd50pZTLzQFBiNtyMoPXRYwONolFLpXBZZXuSkyJja+jLHF+S6cNMjg
 VttPEEiEMLkGFdBs=
X-Received: by 2002:aca:47d0:: with SMTP id u199mr2863015oia.12.1623336735851; 
 Thu, 10 Jun 2021 07:52:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzdHVdBzaUxlHX9RU0fbd8jnNefVPByyot02wIwvC1qQMyx+Tyqt6GrOwMx45+XCAFLkFwNA==
X-Received: by 2002:aca:47d0:: with SMTP id u199mr2862997oia.12.1623336735394; 
 Thu, 10 Jun 2021 07:52:15 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 h7sm659181ots.44.2021.06.10.07.52.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:52:15 -0700 (PDT)
Subject: Re: [PATCH 03/11] target/i386/monitor: Return QMP error when SEV is
 disabled in build
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210610064556.1421620-1-philmd@redhat.com>
 <20210610064556.1421620-4-philmd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <52808f00-34db-7cc4-8a47-87a63bdabb25@redhat.com>
Date: Thu, 10 Jun 2021 09:52:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210610064556.1421620-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 1:45 AM, Philippe Mathieu-Daudé wrote:
> If the management layer tries to inject a secret, it gets an empty
> response in case the binary built without SEV:
> 
>   { "execute": "sev-inject-launch-secret",
>     "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
>   }
>   {
>       "return": {
>       }
>   }
> 
> Make it clearer by returning an error, mentioning the feature is
> disabled:
> 
>   { "execute": "sev-inject-launch-secret",
>     "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
>   }
>   {
>       "error": {
>           "class": "GenericError",
>           "desc": "this feature or command is not currently supported"
>       }
>   }
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


