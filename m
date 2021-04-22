Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC43367AB3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:12:32 +0200 (CEST)
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTVn-0005sC-Qt
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZTUj-0005KW-Eb
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lZTUe-0000tA-Ss
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619075478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=egW/bUNyZLWAhO7EbuOtNSNMHNRkImyvzEAuNuAh/V4=;
 b=byokD/k4jSNMz34TQpPIxeqbJ4e5rLRcM0dvPVJQAGXlV/pSAE9Pmf0KnRbKnH+vXHJY+b
 YoX3GP3Jn8Ejekeuhdku+NCvBtsvNhhLv1TYlG6ngoVP+7F+81G3VGuDk5H0sWFBmzqcQr
 qwBWOdjtvnYGDJWEecuLPcm2+3+Fz1Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-5UppqOEoPi2ZRgOtNYvaBA-1; Thu, 22 Apr 2021 03:11:11 -0400
X-MC-Unique: 5UppqOEoPi2ZRgOtNYvaBA-1
Received: by mail-ed1-f70.google.com with SMTP id
 c15-20020a056402100fb029038518e5afc5so8708099edu.18
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 00:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=egW/bUNyZLWAhO7EbuOtNSNMHNRkImyvzEAuNuAh/V4=;
 b=mOT4jNxaqo2sEZzLbCstF7W/De97CGQo/SlcAzvkYC8iu06HSs/4Lsj5Vjzt/WqGOc
 /LzBw33Vz0SV7GgcdSadvD4EGj6uT59VcxFGxuzKmdKNR2wZlL4eU6jyI561DWDk7kXy
 FuiuGTmy9jDHmv3kSg2TLqKWNmhmBo3v8nYDuK+sL8xmz1yokzu4g/vxRniPOZCsVSzC
 o3OF2cevCXczGapjDRN5O4tGUWU4GkvUwXsWwJ52QeOxAeOycDE86AcwemAMx44F9yre
 jTpKrnu1aB0WBP3VMgZOWH2NITIYTLfilc+yFNd/ETXbusOzTXXp1k+tvaSnyHweVWSU
 ujYA==
X-Gm-Message-State: AOAM531mVUMf5kT5fBuLvU/mGQuEDQ9xMinU7K1/wuWiVBfRhVOpqm7R
 38JpTVM5EHFh51xLpqhlcAUVTy6kTE29pC0NrSzSQDnu1EgNxQn9xDSSGUopotmB25hAKIyE0DL
 C6dWjrsq/paqA/u0=
X-Received: by 2002:a05:6402:350e:: with SMTP id
 b14mr2050747edd.307.1619075470530; 
 Thu, 22 Apr 2021 00:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxot+M1XrnKVV2UyXJjw6kqoj7oNnc5MzPvbMu5PwlFNzm9tzPa9OS+H8+XJmDyEgYij0+YxQ==
X-Received: by 2002:a05:6402:350e:: with SMTP id
 b14mr2050734edd.307.1619075470368; 
 Thu, 22 Apr 2021 00:11:10 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id he35sm1201231ejc.2.2021.04.22.00.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 00:11:09 -0700 (PDT)
Date: Thu, 22 Apr 2021 09:11:07 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [PATCH v3 2/2] block/rbd: Add an escape-aware strchr helper
Message-ID: <20210422071107.xmcekwjb7atg4n7x@steredhat>
References: <20210409143854.138177-1-ckuehl@redhat.com>
 <20210409143854.138177-3-ckuehl@redhat.com>
 <20210421110454.6jcig7ujr25my2xw@steredhat>
 <525092bf-1cae-98ef-53ec-e0fa86ab2cc5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <525092bf-1cae-98ef-53ec-e0fa86ab2cc5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connor,

On Wed, Apr 21, 2021 at 04:15:42PM -0500, Connor Kuehl wrote:
>On 4/21/21 6:04 AM, Stefano Garzarella wrote:
>>> +static char *qemu_rbd_strchr(char *src, char delim)
>>> +{
>>> +    char *p;
>>> +
>>> +    for (p = src; *p; ++p) {
>>> +        if (*p == delim) {
>>> +            return p;
>>> +        }
>>> +        if (*p == '\\' && p[1] != '\0') {
>>> +            ++p;
>>> +        }
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>
>> IIUC this is similar to the code used in qemu_rbd_next_tok().
>> To avoid code duplication can we use this new function inside it?
>
>Hi Stefano! Good catch. I think you're right. I've incorporated your
>suggestion into my next revision. The only thing I changed was the
>if-statement from:
>
>	if (end && *end == delim) {
>
>to:
>
>	if (end) {
>
>Since qemu_rbd_strchr() will only ever return a non-NULL pointer if it
>was able to find 'delim'.

Yeah, definitely better :-)

Thanks,
Stefano


