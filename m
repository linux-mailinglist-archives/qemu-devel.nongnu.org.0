Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E959142BECF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 13:20:38 +0200 (CEST)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1macJI-0005gL-3N
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 07:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1macHf-0004sP-S5
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:18:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1macHc-0007iy-5h
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 07:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634123929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFWGhuxYQXZet0ddffdW8c9tREC5oUki5viobAiV2TE=;
 b=UrET6oYD8saus1UTLhNOepmeyyH9am4xGlgCxjgU9jejTj9X2RKHhjv/yRDaaIbc2ApE4U
 CAN1dhTCpkR/+qRGG7mvv80Uk87aVwvEKU4ywBwEnP++BZOp6o9NOZ4zjfmFlHRsFsLaZM
 48qrX/qkgl9dHJHSVe23oSHwtNuists=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283--0ffp0B3MvGZ90Ej3Xpt7w-1; Wed, 13 Oct 2021 07:18:48 -0400
X-MC-Unique: -0ffp0B3MvGZ90Ej3Xpt7w-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso1727627wrc.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lFWGhuxYQXZet0ddffdW8c9tREC5oUki5viobAiV2TE=;
 b=XVYNOMS1a4hXvagTjxZ7AondAR1b8pWmP1DeDG0uhlqVJzYVLfeh3EHKwVtnSdUgh1
 dPomF0pwiakSg8xFM15uWr0+U47Cu5Jy4SynmhyQ83esEHL6hTacZyVXk+gr5ZaEnv8u
 qdxfLq9GS9MPC0tpf7Gt0r1BInGiXQrhX3CbIvyE5rrcjaQyLGT3r4wMIlkJkRdXT91K
 R8iNlusk1oQruh4Ayt8saf2KhuzC5JwQWrOBLLnsDSIvto7fszzVHK4kyxvu95h8Cy5Q
 Z5EBARWH88UN0u2K7yv1W9XLI+6I1aPIict8K7EoBoPwJroJHt4gZ/VVKv0w8KAnNBek
 Llfg==
X-Gm-Message-State: AOAM532mc5OQ90o+ddkeGxP5DeHcFSOuzp9YLZPap0xHPmGCQjOvpDQW
 Q449WI52vuQ4O8K27rHYaB5bEZjZFAWu5074W6F9Aiv64s1uuklevf4LQdqYXQVeMtB/reFP8m6
 1kOE1q53CO2Tef68=
X-Received: by 2002:a1c:a747:: with SMTP id q68mr12364016wme.139.1634123927551; 
 Wed, 13 Oct 2021 04:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQmAhT6xcCiM9cB2ov6Dq0+CJt5yahwUq3ofLfmouy/3P0DRxOLS5n+uiSE+1XiA0J/7GASQ==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr12363998wme.139.1634123927386; 
 Wed, 13 Oct 2021 04:18:47 -0700 (PDT)
Received: from ?IPV6:2a02:908:1e48:3780:4451:9a65:d4e9:9bb6?
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id z6sm7612763wmp.1.2021.10.13.04.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 04:18:47 -0700 (PDT)
Message-ID: <bd3b8c08-528b-e337-4523-799b18eda85e@redhat.com>
Date: Wed, 13 Oct 2021 13:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 07/13] iotests/297: Split run_linters apart into
 run_pylint and run_mypy
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211004210503.1455391-1-jsnow@redhat.com>
 <20211004210503.1455391-8-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211004210503.1455391-8-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.10.21 23:04, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> Note, this patch really ought to be squashed with the next one,

Yes, it should be.

> but I am
> performing a move known as "Hedging my bets."
> It's easier to squash than de-squash :)

True.  Still, should be squashed. ;)

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/297 | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


