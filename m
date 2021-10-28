Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74243E6B9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:59:56 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8kt-0006or-Mq
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8jT-0004l3-Jy
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:58:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg8jR-00005o-I0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635440304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S37ptxtY+0/JMFqOdYwx/kYBdaTvhHWm3g4d0IDIoiY=;
 b=fAU1Yg5Yd6WpBB97dpcxm6wDIbrsNQiUbpic5jQaWp9uEc+iVim9PUlrDGCxIMIyEeUbKu
 edCMZjw6jGEoohyxUm1xFU/fbcZafkLtZF3aBN8zOgPbeuCNRuz0DV1wMzvmv9oR4Q0oek
 RiiqIgZsNNPM7OsfcW2R8KYehcKCIjs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-5nNaH90jPMSbySSvowN6aw-1; Thu, 28 Oct 2021 12:58:20 -0400
X-MC-Unique: 5nNaH90jPMSbySSvowN6aw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f18-20020a5d58f2000000b001645b92c65bso2338682wrd.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S37ptxtY+0/JMFqOdYwx/kYBdaTvhHWm3g4d0IDIoiY=;
 b=WcnXBNVFf3PDM777/Eg5KLMmNZADyPuzcsT/gX6UsyM7AUmT/EZ5YMuZGINjAZYoZo
 /8McFMCcca321bZqpktLHlEo7SvQD2BT1x11CjK0x1MY3A7fd3CR1nvKo4zyQxAQys0Q
 /SasnocazkN6K4HKc/KPdhz1j2MSx136ZC01JNN6EwnxD5kDhV42fSC8AmzQzkpMRVS4
 sp+ytORXmfs6Be8tX3Mdu+Cgzve/c9meevqI0uCxmK6J5tC315CejTZEGFUfAvLCWW3h
 Rih0wPsPUisbYQXd7OGYqx5BqDhfWbteYxOWHbUSF3ovlx7WGUxKzVwoRIPxGhQk/Ig2
 QpTg==
X-Gm-Message-State: AOAM532WSSjeJZFofr8rsPLdCPZ4fyc0nJ0txdIq4jmlgyHMBku5yZa9
 CdxWVsdgVFpfyNuhasERtpQ1GAvT9UZUEfGR3V9KnORNI6ZOGPE28fTxzZ9dvW87VnVOiptRoX+
 Z3rm7tGhfFKKL8lM=
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr13548328wmp.165.1635440299489; 
 Thu, 28 Oct 2021 09:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv2lSV89Us68L9jd6lbCRmtRDKYZknt4rnRhyueFcuNbvBP4xoNtaLWoq5gZLBc1vAHq46Qg==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr13548311wmp.165.1635440299347; 
 Thu, 28 Oct 2021 09:58:19 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k14sm1503661wms.21.2021.10.28.09.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:58:19 -0700 (PDT)
Message-ID: <ab991d9a-2de3-5e5e-4c0c-b4c65f10111c@redhat.com>
Date: Thu, 28 Oct 2021 18:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 15/22] qapi: introduce x-query-ramblock QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-16-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-16-berrange@redhat.com>
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
> This is a counterpart to the HMP "info ramblock" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx   |  2 +-
>  include/exec/ramlist.h |  2 +-
>  monitor/hmp-cmds.c     |  6 ------
>  monitor/qmp-cmds.c     |  8 ++++++++
>  qapi/machine.json      | 12 ++++++++++++
>  softmmu/physmem.c      | 19 +++++++++++--------
>  6 files changed, 33 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


