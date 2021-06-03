Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B0399B4B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:11:30 +0200 (CEST)
Received: from localhost ([::1]:47238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohVp-0002IS-So
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohUC-0000dR-LS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohU9-0002Q2-3a
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622704184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1+qowy7yCh0fZhaiAnDb/NzxfUd9Lpzogn4eCYx6sI=;
 b=gNNz5kH6FuuURX59XRkOTEVAQ/L8ydl5otuItFgy8oRHx54xonkz2GwR1+H6oiNiLIIXrh
 FlAEkdat7/oOLWWfKNXkGLhZAVsFS/2YqLBtvOb7bWB2rp8c2A5G5ii+1+71TcFzCP6NZG
 55UT9/epsgJIoQYZGbvsHUe/OTIbxTI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-JX4svWMmOBWVIGOH2A8DNQ-1; Thu, 03 Jun 2021 03:09:43 -0400
X-MC-Unique: JX4svWMmOBWVIGOH2A8DNQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so1602904ejz.5
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P1+qowy7yCh0fZhaiAnDb/NzxfUd9Lpzogn4eCYx6sI=;
 b=nc+/pwLFa9YMx5IJbmYtWwsKNkU8Ld/4LX70qRFYzooHkPB/5JnrkVU4Um1xI+EXlZ
 iJA4Dm29AOHYlkoqbhSj5FKHm/0ABzebAt0kFUODjMc1eEvt/eS6jheSq8k6j0nRILnW
 jzDTU9xV6c7OyBybjxYDTPiS+nRuWcN+YSn9O/4I+A87EhaP1I4bBwOtfzAIeKRGTJdF
 4pPqBjGjqUSl49GzhztXsq9JFVmGAu+LGIu4+t8kXUT5jNdT+REfS2iD9QJWutgiHqW+
 m7T1jF3/SVb7Ef20+24q4CPR9kMHA5UfX+EzwpiGEVkHUSu8WStLlGNNUDEliClqRfwT
 1TEA==
X-Gm-Message-State: AOAM5325K2wRTtx+cL3pKWJrT6USYOqtIeUljiNRWGBmDYuwQdwR1LEO
 BzT8f9X6cmMGtboCgfaqnr6a09bfcMxQztUP24BzgQGOFxcvbs+iZh7PwgFb7glTEJLWewBN6Z0
 7x3otUiHffnrf2lU=
X-Received: by 2002:a17:906:5f99:: with SMTP id
 a25mr17462106eju.45.1622704181920; 
 Thu, 03 Jun 2021 00:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOyGd7P3tWw5+7iOfYvBn1dq/vbuAq78CRAGORcn7l88LVDmwUUJtW8S9DddJHFNryM5xM3g==
X-Received: by 2002:a17:906:5f99:: with SMTP id
 a25mr17462093eju.45.1622704181743; 
 Thu, 03 Jun 2021 00:09:41 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id f10sm1248316edx.60.2021.06.03.00.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:09:41 -0700 (PDT)
Subject: Re: [PATCH v3 13/19] scripts/qom-fuse: use QOMCommand.qom_list()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603003719.1321369-1-jsnow@redhat.com>
 <20210603003719.1321369-14-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2423d2a4-eaa4-7eb4-6dd3-b8ae9ee2d78a@redhat.com>
Date: Thu, 3 Jun 2021 09:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603003719.1321369-14-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 2:37 AM, John Snow wrote:
> the qom_list method provides a type-safe object that's easier to type
> check, so switch to using it.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qmp/qom-fuse | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


