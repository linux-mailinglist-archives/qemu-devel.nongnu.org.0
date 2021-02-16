Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828031C6BA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 08:18:18 +0100 (CET)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBucj-0006XN-8p
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 02:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBubE-0005iK-SN
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:16:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBubC-0004pA-He
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 02:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613459801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+dARcGnKZZPIcEAQjVZCaeEyk0kMS0dyfL/zYzYHcQ=;
 b=EJAn5+aN+Cn1YVQxF9nyHx2UR2XYavP7w3GJ/M16Vu0b6iA3eqPVKDdgsn6O6nIGCB4dqU
 YEeVOTiDrjaMdxWCrXA6nfumWMtoyTXGinMcCkVX9LMMJJS7TkCKbiPQMYYzLsYR8s62nC
 8Pqd9DhgkYX8amQKyQAfFEyp1DhfVA4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-L79-q8weN-OK3PS4IJ7Jow-1; Tue, 16 Feb 2021 02:16:40 -0500
X-MC-Unique: L79-q8weN-OK3PS4IJ7Jow-1
Received: by mail-wr1-f72.google.com with SMTP id h20so12485089wrb.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 23:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+dARcGnKZZPIcEAQjVZCaeEyk0kMS0dyfL/zYzYHcQ=;
 b=UXtsT6ESjXeMZvIw363t1Kmhgkx5Iw1aDvB9FhHd3tjKHsYEjSk6euXJphIJyXSxMz
 iJOOvXksvKqHz5jcablY4kgwMmoAX2ErkTxwXGo4LhU5fv1O22uM9DiYnfT20qVa6puj
 jl6jZ8zpQXb6B69bx+N0yTZbZ+04O8xYRbzDT2J5hD+N9NR5rSXXRjbzy7A3ELeDXIHi
 49TPogRUZTn85Ai4AS5adoS4NRCEz1/tlFVT/XeBokn2K2pCRQfNUeFHeqro5P4EXDXa
 Yd+i88fmrJsvCSUfnv1V61spj910zgXfI93wQ7Jj8fr1rs4fX8i+t6N9vOrX85S3oHFr
 Q5Fg==
X-Gm-Message-State: AOAM531mjiFgP4tEDTnWhjRXken7qyYQ8d4qwstaqZrmzK5eCXGC4Bh2
 f7qjj0TDy2nduy2qSvhGWx7sUFPzn4SRlTjD/vFBZl28xB/FlNRJamRUFq6UllW3NTH8RKhJwIO
 6nz9bXlArpvOoIds=
X-Received: by 2002:a1c:2311:: with SMTP id j17mr1984596wmj.38.1613459799149; 
 Mon, 15 Feb 2021 23:16:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9pCi9BIKIlbdyqRyRMlq6oTotQzWdvyP+XuOzVjTw3cRy6UaQ/RbXyouLhNMAm4TXFku1nw==
X-Received: by 2002:a1c:2311:: with SMTP id j17mr1984581wmj.38.1613459798998; 
 Mon, 15 Feb 2021 23:16:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i8sm33827309wry.90.2021.02.15.23.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 23:16:38 -0800 (PST)
Subject: Re: [PATCH] scripts/checkpatch: Improve the check for authors mangled
 by the mailing list
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210216071512.1199827-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <64f7dbfd-e424-60e4-973c-2922ab4d2152@redhat.com>
Date: Tue, 16 Feb 2021 08:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216071512.1199827-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-trivial@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 8:15 AM, Thomas Huth wrote:
> There were recently some patches on the list which had their "From:"
> line mangled like this:
> 
>  From: qemu_oss--- via <qemu-devel@nongnu.org>
> 
> Since our test in the checkpatch.pl script did not trigger here, the
> patches finally also ended up in a pull request, with the wrong author
> set. So let's improve the regular expression to also complain on
> these new patterns, too.

:(

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


