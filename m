Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FEF43FB6C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 13:33:22 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQ8P-0004Fk-8I
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 07:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ6u-0003Wy-Gz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgQ6s-0005Am-BZ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 07:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635507105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gSlmxVnQyZaHgpuaC8VFXRb2dmX0UOpBI/mQRestYM=;
 b=izYRwhHD2Yv68fc704AExszioJZOCr+XtO+517u2TSMKtQINeOwibdZc3aUD1F9bvKWxhb
 +JcubO3FQM7A3+NRHE+rrcQEQGtaQAIL1jmfoSEvxuBj/S22FCp7WoQVmXWQzz/muzTYga
 XbeXi1p4yPJAKCKTz8N1Hxw4yT6McIs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-x9zGY0eZPLWuJ6Eu4o-0cA-1; Fri, 29 Oct 2021 07:31:44 -0400
X-MC-Unique: x9zGY0eZPLWuJ6Eu4o-0cA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so420184wmc.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 04:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5gSlmxVnQyZaHgpuaC8VFXRb2dmX0UOpBI/mQRestYM=;
 b=fgjWq+uRz1SaxZVPnU2yG5U8MY4iCqbuud/IC84xEQ5KrWvZ4GaTLXYuAkmj3BGhA8
 v3Q5Rip+N5YIvtUFBoJEOF7HdvMlr2HWwYcl5B0zH6vKxTODbU6OcidREn0p0QlGnELP
 fXp4PmC4rtczLoGtoYPm+vnK9tbqbx8L+4pTUDP2PrOG4Utdv26H5o+0RiyJ9I6DUVje
 HFPe7WN9I9fzRJXnDZfHO+oRZjLGv2BjXlNnSsaWU0NXu7cXsNC+f7nGZUelXGbdtJzW
 ncnfWApjYAFDy8Yi4hBMZMRHTNwwE2PENDF5Kzh1XRvQXGSCxu/xEvx7IvzWgny0xh0P
 cMeA==
X-Gm-Message-State: AOAM530V/JlYownNKOD8gwomdyK0ftIH5AVBj3rtXqXUi/qhk3hZY7es
 YF1/kChdRZPPwvAmp9mprWzKua+UgH60C+O2m/hu3cDLviCXWkJxcX22i8PJzo7IxfByS0vmW+s
 RUoAyycS7Y06hVYs=
X-Received: by 2002:adf:e50b:: with SMTP id j11mr6605685wrm.430.1635507103231; 
 Fri, 29 Oct 2021 04:31:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZKLSIJhT+PydvoQdvS3z07s8iIu6HZ1m27jDGruL26z/1Tn11mvFFlenCm29rYjO0IipNtg==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr6605653wrm.430.1635507103053; 
 Fri, 29 Oct 2021 04:31:43 -0700 (PDT)
Received: from [192.168.20.130] (192.red-83-57-30.dynamicip.rima-tde.net.
 [83.57.30.192])
 by smtp.gmail.com with ESMTPSA id z5sm10567951wmp.26.2021.10.29.04.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 04:31:42 -0700 (PDT)
Message-ID: <81fcf267-c210-f435-5e84-79f20f5fd407@redhat.com>
Date: Fri, 29 Oct 2021 13:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 7/9] qapi: Generalize enum member policy checking
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211028102520.747396-8-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, kchamart@redhat.com,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 12:25, Markus Armbruster wrote:
> The code to check enumeration value policy can see special feature
> flag 'deprecated' in QEnumLookup member flags[value].  I want to make
> feature flag 'unstable' visible there as well, so I can add policy for
> it.
> 
> Instead of extending flags[], replace it by @special_features (a
> bitset of QapiSpecialFeature), because that's how special features get
> passed around elsewhere.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Acked-by: John Snow <jsnow@redhat.com>
> ---
>  include/qapi/util.h    |  5 +----
>  qapi/qapi-visit-core.c |  3 ++-
>  scripts/qapi/types.py  | 22 ++++++++++++----------
>  3 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


