Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4764EB175
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 18:09:12 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZEP9-0007LC-BL
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 12:09:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEM9-0004mC-02
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZEM6-0006oW-Et
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 12:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648569959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RakZ3Vw7Pe4rO4RO70MrHz/aRIGzV3i6cbG5BWyub60=;
 b=OmMQLmVvCzo8/he5o7e4hvhEYpTn8tJRUVDub8ohif3PxZb5QyYhuRGDfNrT//GHBE4Aft
 8krPKPLQY3hue9V81S1Aw6MCNzEV3fYOGMRunWP7CexN/or5X6+h8RzkxkFLU4eR2P6toq
 wy4E2abkYmOi93UvGF8b1OnsARy1WRw=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-Rk9oT-BQNBqWJT1aT3RLTQ-1; Tue, 29 Mar 2022 12:05:57 -0400
X-MC-Unique: Rk9oT-BQNBqWJT1aT3RLTQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 v76-20020a1f2f4f000000b0033797bc3a1dso3493483vkv.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 09:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RakZ3Vw7Pe4rO4RO70MrHz/aRIGzV3i6cbG5BWyub60=;
 b=tk/LhAp+n8hIDhHS+jJcaRbgoVuq6c/ZP3+tdVTusB+SHR7zokw2IgiTzzkNjDV/9f
 nKz/uru/53c1GUF1xJwQEebxbGz8oP3W41FMbZzwAlq9tUKngHKiMCDvx5zQZ2FhjYxH
 EQ8jxfb1Cb5t0Ez4CvCBIyS3OzSatZa8YFMbaP2CFb8ZBZatYwQx690/aDd0xuIGgKc1
 41Ly51TxZyVQdJkdgLyDwpJwiJ5DEZ3UODj+ORsgypHjXBPDNBxwUDAZMpsmLIl9M6NJ
 AgplfDuwfuiqJ9uVebCx7ZY+RvzNU59gXliHUjAin5fl9OI+Esc96Lb8EM9zThNouU/9
 SO0Q==
X-Gm-Message-State: AOAM530EFJZNffzTEixgdaAeuvs/k6db0JxpCGK+7UJ5TU2CVjVSD5XS
 0dgrY+PUfZ+0SXdi0NKcZSrl31ULO/YU4CXz8TCSWW63Mn8h45m04SM+NcU6oCLnF7tk721V0+C
 JgR4NGd4DYok50/1A5CSI+pDENbwrNn0=
X-Received: by 2002:a05:6102:c86:b0:325:a06f:653 with SMTP id
 f6-20020a0561020c8600b00325a06f0653mr9305410vst.35.1648569955434; 
 Tue, 29 Mar 2022 09:05:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvOFcgT3xB1dH92xyyEKdtZ/gee8pOeb4ZLzAaEK7bMJFQPqW/WTlsNr9JlHXlw6+gRNIVeaGiwsE9WXwoWpM=
X-Received: by 2002:a05:6102:c86:b0:325:a06f:653 with SMTP id
 f6-20020a0561020c8600b00325a06f0653mr9305355vst.35.1648569954785; Tue, 29 Mar
 2022 09:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-5-jsnow@redhat.com>
 <CAN6ztm9yTfAeM+2ZR3jVQu7LbX7_2ybQQfViYtN7oXcHtbsyhQ@mail.gmail.com>
In-Reply-To: <CAN6ztm9yTfAeM+2ZR3jVQu7LbX7_2ybQQfViYtN7oXcHtbsyhQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 29 Mar 2022 12:05:44 -0400
Message-ID: <CAFn=p-ZZ+XRe4hL9a+Mm+RQkuYXZXcBw3p6iLjgW9vSdKR8qoA@mail.gmail.com>
Subject: Re: [PATCH 4/4] python/aqmp-tui: relicense as LGPLv2+
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 26, 2022 at 11:28 AM Niteesh G. S. <niteesh.gs@gmail.com> wrote:
>
> Hii John,
>
> On Sat, Mar 26, 2022 at 1:34 AM John Snow <jsnow@redhat.com> wrote:
>>
>> aqmp-tui, the async QMP text user interface tool, is presently licensed
>> as GPLv2+. I intend to include this tool as an add-on to an LGPLv2+
>> library package hosted on PyPI.org. I've selected LGPLv2+ to maximize
>> compatibility with other licenses while retaining a copyleft license.
>>
>> To keep licensing matters simple, I'd like to relicense this tool as
>> LGPLv2+ as well in order to keep the resultant license of the hosted
>> release files simple -- even if library users won't "link against" this
>> command line tool.
>>
>> Therefore, I am asking permission to loosen the license.
>>
>> Niteesh is effectively the sole author of this code, with scattered
>> lines from myself.
>>
>> CC: G S Niteesh Babu <niteesh.gs@gmail.com>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>
>    Reviewed-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>>
>>
>> ---
>>
>> Niteesh, if you agree to loosening the license on your work, you can
>> reply with a Reviewed-by line to let us know that you agree to the
>> change. If you disagree, an explicit 'nack' would be helpful.
>>
>> There is no obligation for you to agree to this change, but it'd make
>> things easier for me if you did.
>
>
>>
>> Thanks,
>> --js
>>
>> ---
>>  python/qemu/aqmp/aqmp_tui.py | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> index f1e926dd75..946ba9af24 100644
>> --- a/python/qemu/aqmp/aqmp_tui.py
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -3,7 +3,7 @@
>>  # Authors:
>>  #  Niteesh Babu G S <niteesh.gs@gmail.com>
>>  #
>> -# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# This work is licensed under the terms of the GNU LGPL, version 2 or
>>  # later.  See the COPYING file in the top-level directory.
>>  """
>>  AQMP TUI
>> --
>> 2.34.1
>>

Thanks Niteesh!


