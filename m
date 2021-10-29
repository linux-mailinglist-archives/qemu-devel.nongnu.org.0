Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121643FB64
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 13:30:27 +0200 (CEST)
Received: from localhost ([::1]:49142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQ5a-0001CG-9Y
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 07:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ3X-00008j-Gv
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ3V-0004iK-8C
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635506896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kh2SpMCIwIHh3UXpjmKW4DjVfMQZt9Vxmp6vWl35Af8=;
 b=SmNHwgTKy9ladk1a9pF508CsgwGp+2HnELJvaa7HACzQrcyNW7HB5Y4hiHVwu1+CAYE0+E
 q9pjzqd3Vhaq7T3pxV2Tv5912s5zvtV5xlQBBN9BbU6q7yyp5JvTrumoMn3WTWXj83nE01
 WWukj1NZ6Y7SqEXBGOv3ABEvxT2pQA8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-XwaCpWe5N4WxwU5fLSwU6g-1; Fri, 29 Oct 2021 07:28:12 -0400
X-MC-Unique: XwaCpWe5N4WxwU5fLSwU6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 67-20020a1c0046000000b0032cd88916e5so1684513wma.6
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 04:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kh2SpMCIwIHh3UXpjmKW4DjVfMQZt9Vxmp6vWl35Af8=;
 b=WsmaEc/50SfcSSId/zgzF8jpGNBkgnqCwJtUZe4I+AWBSpN7FvPmUX4MzkWySp9qtH
 BcvhsssWiP1uWOFs15XlyOOA1aLgBGyhtunxog2nFkW9HJOYamn7ZL914qHcBgINruhB
 CrDCqTvyjLIm/6N9PfK00/GrQXru4n+FHIBqIsjFNnm1wyX97TJfT6T39RTtgYCG8GJU
 toH28YAfy28Ek+rXMnnvDC8084q/h2as6IHLL3/SdXcDiljT82vQZeuogu0YlkUOdrZZ
 FShCYUthHewYDMRrhY2mygEPqF9sOT0oM1+XlSThn0MM0RL8VMToAK3isblndN5ir6lM
 ppbQ==
X-Gm-Message-State: AOAM530nvsfKyAnXxcUHaoG8hniv23vt01EH7RE6QQfSzPxrY1aISc+a
 HT1I+zPYkkEct/ZkgZNxzMX9eX0iyoR9cOJShiewmLFBTuglaQ5ca7idSCryBPsRseft8sGUB+t
 P/Xl6JsUuyXM003Q=
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr11077149wmj.89.1635506891665; 
 Fri, 29 Oct 2021 04:28:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnK3BxPR7WCHg+ixlTOONSSlyMGxOx8Mymfu+WF/MImFf5G0vWcLsrGvlQ0LqIr7adD/0HTQ==
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr11077111wmj.89.1635506891442; 
 Fri, 29 Oct 2021 04:28:11 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id r11sm5304084wrt.42.2021.10.29.04.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 04:28:10 -0700 (PDT)
Message-ID: <bd0ae59a-8b11-723f-463a-dea748df1529@redhat.com>
Date: Fri, 29 Oct 2021 13:28:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 12/22] qapi: introduce x-query-numa QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-13-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028155457.967291-13-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
> This is a counterpart to the HMP "info numa" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx       |  2 +-
>  hw/core/machine-hmp-cmds.c | 35 ---------------------------------
>  hw/core/machine-qmp-cmds.c | 40 ++++++++++++++++++++++++++++++++++++++
>  qapi/machine.json          | 12 ++++++++++++
>  4 files changed, 53 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


