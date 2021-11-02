Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85C544313E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:07:43 +0100 (CET)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvO2-0004hn-C0
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvDx-0000Tu-VG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhvDw-0003Ge-E0
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635865035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uNkhVGEe9StMMKa844jt/FZ57VaIZv432nzIKDp/7/g=;
 b=Pe/gna2xWwO5cgU9bMaVNE3fLHAtbppCb4LZBcEDLUQrHNqCUcNxSqIhL5QD30Ni4Th1mr
 KN/KlJ7s8OmsiHwpWbOMokBQV1iTMGxWg2urrsqCtbzDoP29yPsID9EDFJ7gzBxUh7C+bT
 aNYB9Z37wvZHDTcxEh8uY/QpX4tJumA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-b3lERkvWNW20LzRa7Cqy-Q-1; Tue, 02 Nov 2021 10:57:12 -0400
X-MC-Unique: b3lERkvWNW20LzRa7Cqy-Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso3085129wru.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uNkhVGEe9StMMKa844jt/FZ57VaIZv432nzIKDp/7/g=;
 b=nTSTPDmBI9GGrHYPFmTC3bNwZG04faIXEmu+2rdZwjCzx+0MaHFvIbW1VcqRYjG2rI
 gX8BFr3Ajjtmkr/ci0rioMwIWM7dSVIvqBV8V/56flahi8ZzBDDIUs/2khVYKSImb2/H
 Cc5W+QFNNiyA2U6FgaqFs15DkUuazSOBnyqS6wng65QD0ekfiNiPqW2x1Qrai4WJKbRP
 IUfVCurngxkqbUX5zHY5fVRLKlMc/hcH12r6WUIfGt4ZzT2pviTUwCl/08Y3xt3A8PUp
 BLhQXHVsy6yTW6LKJLdY+oLeoHC8HFKn005x7EXvgxsBbq50pu3VaXDdERZKRu4RX04W
 Mwew==
X-Gm-Message-State: AOAM530O5QZbOVertIoms+WFIK3la11yFMiCAG9EgmBOh9e78ne3savQ
 vI0BT1kmVVRifs1ZXvZSJh1tYswcZzW0j4aM2DolOR6tusjmJ/ATwR6u+61dy/TOOZ0EAvwnfSc
 WR1h2D0yDFX3FceM=
X-Received: by 2002:a5d:624c:: with SMTP id m12mr49613326wrv.160.1635865030929; 
 Tue, 02 Nov 2021 07:57:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhn1pYRtDkG7LiyS6VIHuuDAj8ZzrJrhK+T6Vy1ZypuVHYTfhGD2imSEZVHFAN9ewp45utKg==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr49613278wrv.160.1635865030655; 
 Tue, 02 Nov 2021 07:57:10 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d8sm17737685wrv.80.2021.11.02.07.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 07:57:10 -0700 (PDT)
Message-ID: <0a2e6289-ce3c-86b4-943f-c08366866911@redhat.com>
Date: Tue, 2 Nov 2021 15:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 20/22] qapi: introduce x-query-irq QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-21-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-21-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
> This is a counterpart to the HMP "info irq" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> This command is unable to use the pre-existing HumanReadableText,
> because if 'common.json' is included into 'machine-target.json'
> the static marshalling method for HumanReadableText will be reported
> as unused by the compiler on all architectures except s390x.
> 
> Possible options were
> 
>  1 Support 'if' conditionals on 'include' statements in QAPI
>  2 Add further commands to 'machine-target.json' that use
>    HumanReadableText, such that it has at least one usage
>    on all architecture targets.
>  3 Duplicate HumanReadableText as TargetHumanReadableText
>    adding conditions
> 
> This patch takes option (3) in the belief that we will eventually
> get to a point where option (2) happens, and TargetHumanReadableText
> can be removed again.

Outdated description from v2, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx |  2 +-
>  monitor/hmp-cmds.c   | 38 --------------------------------------
>  monitor/qmp-cmds.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  qapi/machine.json    | 12 ++++++++++++
>  4 files changed, 57 insertions(+), 39 deletions(-)


