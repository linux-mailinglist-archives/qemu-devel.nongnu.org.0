Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE543B0E3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:16:50 +0200 (CEST)
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKRl-0000sT-58
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfKNh-0006fg-Ri
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfKNg-0005vc-4U
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635246755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wyTWkZHHkOczDTcH69FVzVHQ9Lbd9dFk8ecI5I+7uEQ=;
 b=HN3dx130+mfONYZEXAMbvd5oo8rfliXpYc7o0K3rp+seU0IPVGkVpXjcKP9erZ71tnFTv2
 5o80IDV+QfmTnF2c59OK5/10JFbjJRSVgXBL9Z0rbSDxTnUt6hvDmoie4YMK+nW9bCtlvG
 LUrOUxSQ+8rZBm8/MEi6EBWRT92dQP4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-BBqKh2ieOAC0HJ7XTA6nTg-1; Tue, 26 Oct 2021 07:12:33 -0400
X-MC-Unique: BBqKh2ieOAC0HJ7XTA6nTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5-20020a1c0005000000b0032c9c156acbso4937228wma.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 04:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wyTWkZHHkOczDTcH69FVzVHQ9Lbd9dFk8ecI5I+7uEQ=;
 b=EMWMhysOPXMsG2WnG0xmE0Kb/KVCsZJg67Y+snIYMZXad9cgIxZTlIHMYLyFJ+hzQk
 TeHTihnBBITHUlDx8V+OMsUKnmLTgOZLTfXF2vNSpM0YqOjpzrVsz+bBhlIzYu/v5+iO
 CTS4AV5Y4SMGVwwxw1uU28gbNPcSF+l5J/4G1BphlEm4VgOAzY3KlSC1qIKmuqArds59
 6X5gCQhqSmZD1QcBEnkbnPAznCa3B+nU6htmqs4rao/QqRzXVPwi6xy+TiVHgRKOrNfQ
 3mz7eLNDpnELYdubPgfMwJIAKA1b3i++nlFiJwHhlAtoaIFvJB+nyFVumP9oUTLKLScY
 YQ3g==
X-Gm-Message-State: AOAM533uQ4gp2l8UdhDV6HaI+oiqLJ0fIFRttDzxwNRN+3kWY+ZO5b6r
 777S74WoQrf3npMMqM7LQkiXme5a7yJx0qlwKRjJNbyvct1bX91EYZ9al//uQ2kNGt9eDrvl3FJ
 M2DWD9xIzZL7XW64=
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr30994678wrx.143.1635246752846; 
 Tue, 26 Oct 2021 04:12:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHW72BV2Imq2wAATC5P/21dW7YjnUYq0GcQxvhuOI6Fz6rcLT8AhpmZj2+UdUe4qBPKw89EA==
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr30994650wrx.143.1635246752680; 
 Tue, 26 Oct 2021 04:12:32 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c17sm295796wmk.23.2021.10.26.04.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 04:12:32 -0700 (PDT)
Message-ID: <834e3cc1-f012-7daa-bb56-b3f670d19fd1@redhat.com>
Date: Tue, 26 Oct 2021 13:12:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] docs/devel/qapi-code-gen: Drop a duplicate paragraph
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211026111023.76937-1-armbru@redhat.com>
 <20211026111023.76937-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026111023.76937-2-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jsnow@redhat.com,
 mdroth@linux.vnet.ibm.com, eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 13:10, Markus Armbruster wrote:
> Commit 55ec69f8b1 "docs/devel/qapi-code-gen.txt: Update to new rST
> backend conventions" accidentally duplicated a paragraph.  Drop it.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


