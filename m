Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3F4DDB69
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:15:41 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDOG-0001qQ-Dn
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:15:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVClz-0003y8-M2
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVClv-0004Kx-9Y
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647610562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uZfjcxrZZSQYHEAUPJMUOORRyWBzG7wVWRD9Yw+dHjo=;
 b=BnAx+tbeTi5D2xIs57K6GuNK7AliprP4Dq6bO4hfmOeKRnSToHVkoMMq/8c0Yx8ZJBFpby
 avMzJGMETuvQVtewLWcGx0Udsq6D2j2CDVSPe/oiGBczee62sILTBCt6M9xbVkBdrfMlxw
 9gaZG6RqvQx8AcZXTnbnskEM3Ih6ySQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-7CsufskJOKak9Q9bvjqycA-1; Fri, 18 Mar 2022 09:36:01 -0400
X-MC-Unique: 7CsufskJOKak9Q9bvjqycA-1
Received: by mail-ej1-f72.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso4526794ejc.22
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uZfjcxrZZSQYHEAUPJMUOORRyWBzG7wVWRD9Yw+dHjo=;
 b=xtM4vhQLyjBgHMDpB3Lt/17vfM5UxvRDYDKYZyeaXi8Xram0IEQkexLMUikFQSAUma
 BKdn8APBfjGFCWzEiOtF+wYOylUvrAU1PUEfF3E0EZp+7TR8hIhonIHONXWiB5t6JWiX
 3Mj94ZvAQP694kZT9AM/W64jvorriVAwBCYx4gAHMaF5vfNWiLvj05ZUTvivsKkowSXv
 mXvRz81GqGJcMqCGkebjKZ7r6Q+Bqxf6+UUjJTYxTZ5fLl+J4+f5v34yX5agL944YHNl
 llL3m50XNhzv2s/S4l+ARPD3Q+PMf8ASPPkD7hnvytuN8pmJq8fYG6Ad+Vg/u5QyoxOQ
 39Yw==
X-Gm-Message-State: AOAM5336hlA9jCpEvNm2li91IBnmdNJ6bu8VhiHh5tUA/f6VuCu/jeF3
 zmyA8B4EiTcN0sUOyBAAQIrjSdhrjGwp5AtGNzB+LDdi3RqTNH0MWQ/fNrA/9LSPY7zm0c2Lkix
 4uH+pvDsiG+FI+kA=
X-Received: by 2002:a05:6402:5208:b0:418:4be4:d248 with SMTP id
 s8-20020a056402520800b004184be4d248mr9336173edd.133.1647610559933; 
 Fri, 18 Mar 2022 06:35:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc43akBTeQphuy0nK0UPlA9ugtaidTWKdbSMI3S33dEyq0iLvxdNnRfRuUehy4RqlZnQV5Sw==
X-Received: by 2002:a05:6402:5208:b0:418:4be4:d248 with SMTP id
 s8-20020a056402520800b004184be4d248mr9336160edd.133.1647610559754; 
 Fri, 18 Mar 2022 06:35:59 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b006cee1bceddasm3677751ejn.130.2022.03.18.06.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 06:35:59 -0700 (PDT)
Message-ID: <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
Date: Fri, 18 Mar 2022 14:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220317234937.569525-1-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220317234937.569525-1-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.03.22 00:49, John Snow wrote:
> Hiya!
>
> This series effectively replaces qemu_img_pipe_and_status() with a
> rewritten function named qemu_img() that raises an exception on non-zero
> return code by default. By the end of the series, every last invocation
> of the qemu-img binary ultimately goes through qemu_img().
>
> The exception that this function raises includes stdout/stderr output
> when the traceback is printed in a a little decorated text box so that
> it stands out from the jargony Python traceback readout.
>
> (You can test what this looks like for yourself, or at least you could,
> by disabling ztsd support and then running qcow2 iotest 065.)
>
> Negative tests are still possible in two ways:
>
> - Passing check=False to qemu_img, qemu_img_log, or img_info_log
> - Catching and handling the CalledProcessError exception at the callsite.

Thanks!  Applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


