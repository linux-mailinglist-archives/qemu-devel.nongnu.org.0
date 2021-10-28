Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF643E6D3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:07:56 +0200 (CEST)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8sd-0006ns-N1
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8qp-0005L8-Gw
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8qn-0001tT-5B
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HSkjXPoTgwcro4mdx7BYAowtG2nTYjGbOHOd3As2F0=;
 b=SL22dQta/P10qu87SvlmyQXf4DvgnpWrYkHX+s644aav/ukv3SDgtbmW34Xa8QRAgKSTiO
 1mDNNnuF/pPH9x2mVCDhLEExf4+o/ka+mitmjcvZGtDpwUb7pU0gubKz35aUzM8mxDwHXp
 NIWupWgF+ABmGl5bj3h8koP5jK/8rJA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-QdIQFGO2PtSSL0OgjnyrXw-1; Thu, 28 Oct 2021 13:05:57 -0400
X-MC-Unique: QdIQFGO2PtSSL0OgjnyrXw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f2-20020a5d50c2000000b00167f5c0a206so2349098wrt.12
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 10:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+HSkjXPoTgwcro4mdx7BYAowtG2nTYjGbOHOd3As2F0=;
 b=2EVZh5LvQJRKvMfB18elL7Pa08uedKnjWYZVltVwKAh6UgHie+cyZ423kYfKYMdVwD
 x35yQTpTtXJ5IAgsEds81/VTEEwGE+VAV8+gaCd4V5KOD5fQgQoWWWpl3eCATqKsvv0B
 +qVrRkR77tntYNxfS4z24E71Zxc9s3fIkgXpLibkbENyicFCC9ZdGBiGr/+Haq8K1jdb
 ijvYKRzGbf8XLcRamKzoXV409Is/G0n4+6g+W9QTBAh2ojPCzrfCur2GKit22AVO5Chc
 NgeVIjkvNLFykuyNACMSoqR2hyLUfFL5l+Bi/eAmRJk7VTAWhW2b4vItEXPU8ht3I/xj
 uJFw==
X-Gm-Message-State: AOAM531wDbaE9oLiB6rlB1/mpYKgM/S4FKdEQdo+80Nc6yuZnLSOaCMY
 idEe6Njj7/QGnwEyo6Ckc5E+mNyeEe3sx/g2flC4FUxJUFKAqAVN+Wqkvpid+NWH7NoGFJAKFuP
 9fgUnHeH4me8q440=
X-Received: by 2002:adf:9bd2:: with SMTP id e18mr7296199wrc.235.1635440756569; 
 Thu, 28 Oct 2021 10:05:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkC0vJOh0sKXYNV6ed/UtUFLFb3/hhaqppHuDzT1ayEAlQ0YBEUP/ebr6I9tA5u5YCsSM0dA==
X-Received: by 2002:adf:9bd2:: with SMTP id e18mr7296130wrc.235.1635440756189; 
 Thu, 28 Oct 2021 10:05:56 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q14sm6526280wmq.4.2021.10.28.10.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 10:05:55 -0700 (PDT)
Message-ID: <ef20958f-9534-7625-080e-627ba9384b1b@redhat.com>
Date: Thu, 28 Oct 2021 19:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 21/22] qapi: introduce x-query-jit QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-22-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-22-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 17:54, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info jit" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> ad hoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  accel/tcg/cpu-exec.c       | 37 ++++++++++++----
>  accel/tcg/hmp.c            | 15 ++-----
>  accel/tcg/translate-all.c  | 80 ++++++++++++++++++----------------
>  include/exec/cpu-all.h     |  4 +-
>  include/tcg/tcg.h          |  2 +-
>  qapi/machine.json          | 13 ++++++
>  tcg/tcg.c                  | 88 ++++++++++++++++++++------------------
>  tests/qtest/qmp-cmd-test.c |  2 +
>  8 files changed, 140 insertions(+), 101 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


