Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6F3FFC34
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:41:38 +0200 (CEST)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4lV-0006pH-9g
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM4kS-00064P-Mi
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM4kQ-0002SZ-LV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630658429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEZqDgWA/a4/P+zA4esuuU32x3f6S+2wbbkVyuKc63U=;
 b=PmcLUf/+GxHo2u3asvSCk3G4uJQZJT8wWdpB6eG+LmqD2FP4AygOLxqPx2Z3fn8UVF4CYf
 F04/hHpDV2X1LogMOMOwhUc19wc82mJTvspVi0Oz8OxUs551fMmk3MhQsqf0e7DdsYEJ6a
 8Ugqj+GeX9wXJVrnVYV+88kk8yEhSd8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-33Lb8qxPPUqyOCW9lPnOaw-1; Fri, 03 Sep 2021 04:40:28 -0400
X-MC-Unique: 33Lb8qxPPUqyOCW9lPnOaw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so1637075wmj.8
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 01:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sEZqDgWA/a4/P+zA4esuuU32x3f6S+2wbbkVyuKc63U=;
 b=O7x8UvhW/r2YFaGFnWUWlvoW6jHv2o3jrIWHeDTHOHSr6cwy1bloUgwk4VLR4KG8sN
 SR7Y0lva4vXWfzt3w0y+bPzz+yBCnu5d35pj9b2GaR1dXDJFr2ptCKlCoNc5v+pSUgXG
 81sNCMCN4Z3tzzf0G22KP15Ln0J04WDj38M8S8oEROgawzqrUR6Myo9GZdIi2vTHRLwO
 4doMtOcz2LiqVPT/YBlkHyBZzcP8Fkv9Rms2g1CmFAs/O4E7EhszjF0dp1dQrOkuiWJH
 gWDWBREJ0pn96Oy63Ijw9j9Fgb/xmfc83ssz+3dgZ+5o4v6I/99q6sMkY48eMKW/3ndM
 cxIQ==
X-Gm-Message-State: AOAM530Kbpfjb248ErDiWwHz7jfxt7bTTMBK/dQlGfz38vS+bAYc3x3t
 UFBy6uyyYX+IwbWusURQshwa6PQFiNr2y1t3N1QyEBrCob+XUnbe9t1LCcmpg6/hOkI8Kw6Q5kl
 bESFHHoMsUMX+E3I=
X-Received: by 2002:a05:600c:4048:: with SMTP id
 j8mr2059977wmm.173.1630658427414; 
 Fri, 03 Sep 2021 01:40:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNOqMlhjRymoRS+ysdrWZt4uxfHuh3WxgYaZv+ZVkq6KHsE3466Bch7u11NOSpDQrtfmfiHA==
X-Received: by 2002:a05:600c:4048:: with SMTP id
 j8mr2059962wmm.173.1630658427215; 
 Fri, 03 Sep 2021 01:40:27 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w9sm3605193wmc.19.2021.09.03.01.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 01:40:26 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] memory: Have 'info mtree' remove duplicated
 Address Space information
To: Peter Xu <peterx@redhat.com>
References: <20210902062604.182620-1-philmd@redhat.com>
 <20210902062604.182620-3-philmd@redhat.com> <YTFIXrxd0i6GZbtG@t490s>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ae681972-e2c2-1453-00b7-1d4674fbd6c2@redhat.com>
Date: Fri, 3 Sep 2021 10:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTFIXrxd0i6GZbtG@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 11:55 PM, Peter Xu wrote:
> Hi, Phil,
> 
> On Thu, Sep 02, 2021 at 08:26:04AM +0200, Philippe Mathieu-Daudé wrote:
>>   address-space shared 4 times:
> 
> I commented on the format of the output, I saw that it's switched back to the
> v1.  Any reason?

The code uses the format you asked, I simply forgot to update the
commit description :/ Sorry, I'll respin.

> 
> Although I still think what I proposed looks better, I don't have a strong "no"
> to this either.  Just want to know the motivations.
> 
> E.g., for a script parsing this output, it can easily skip and identify
> duplications when scanned "address-space:" following another "address-space:".
> Now it needs to understand two layouts, and that "N times" looks superfluous.


