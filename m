Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BFD46FE42
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:56:02 +0100 (CET)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvcdF-00046G-85
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:56:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvbYM-0004q4-RK
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvbYH-0006sR-Ig
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639126006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjHNIVrgIhjaJ94CHv2UlIh5fgJKdcFZz3pzc3fXxHQ=;
 b=da7BiW9KG2nMzN4BCd0vP/S5cUX732cwnTPeIqrFhhc+esacWO+twKwDlOhvWovSWeowSq
 ILY47OO8LdxtzeKeXhBcVwAmVdxBtmA5A4Dzr2mVceN1cejmY7CzOvW6ZsVcWIbKduGzGc
 4ohv0iU/j5rJCccBGOHXukmyUCEPo0c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-DzlCAhvuMGmglZ_MJBqnOw-1; Fri, 10 Dec 2021 03:46:42 -0500
X-MC-Unique: DzlCAhvuMGmglZ_MJBqnOw-1
Received: by mail-wm1-f70.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso6327090wme.8
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FjHNIVrgIhjaJ94CHv2UlIh5fgJKdcFZz3pzc3fXxHQ=;
 b=oTc2hn2mCKT3W17/eKNsfw6L2Ufcz9fn1gJPdE3fdVrzdN8ZNpVeszWs7M09sj7Xw0
 x+GnVvOHkiMvcc9pWT0lptozJA4JWYcxomrqtFmUdx9KwjOCUdOV/ZAtZ2VUjTd1KeVv
 pKTBB3qGez772y+gmQijZF3IT+JpP4sQvOhcrwrvWFk0WHijGovWNXmlEdcAseznnZXf
 f5DzPqAnpDElWOqGsisLyDhGj5ef/iwoaLDOe8qrvvdndTNqoa3CTDVq7bjb5Ot0JFB8
 Z9TmyLozbpCCuNOfPkn/eJ1F9NJSY+djsozL819yDgT7jMhuFNtoaFTxt+UNph97RB+/
 8dZg==
X-Gm-Message-State: AOAM532fFCdzJYOqTE5H7pJJO/7SkyM1tdP5rxtDUsqwUh4zWaw3vjcR
 gqbExcPogZ9SzRhM9zpzLjnfEYRBC8j8Ty5WWTqoFlwpuSYExEwCCrvQvxqQo3tt0aFz0DRnMe2
 S0Uv9lRGAlTnnktI=
X-Received: by 2002:a5d:584e:: with SMTP id i14mr12575778wrf.386.1639126001312; 
 Fri, 10 Dec 2021 00:46:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAZpt+QPRtOXBk3kQ1rweV+byFrtr16skGsxs1pIEYiuNqRDPHSqlgBSXKiRg4jozfOMWQKg==
X-Received: by 2002:a5d:584e:: with SMTP id i14mr12575752wrf.386.1639126001043; 
 Fri, 10 Dec 2021 00:46:41 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id s63sm2351824wme.22.2021.12.10.00.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 00:46:40 -0800 (PST)
Message-ID: <4ebf08ed-dd35-8347-45f8-18be46fae16f@redhat.com>
Date: Fri, 10 Dec 2021 09:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
 <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
 <7da70e19-537b-9ca5-125d-f9bcf2d3f6df@redhat.com>
 <aa0b8d39-32ad-b3a0-afff-474de704211f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <aa0b8d39-32ad-b3a0-afff-474de704211f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2021 09.39, Paolo Bonzini wrote:
> On 12/10/21 08:53, Thomas Huth wrote:
>> On 02/11/2021 12.34, Paolo Bonzini wrote:
>>> On 28/10/21 20:59, Thomas Huth wrote:
>>>> Checking for xfsctl() can be done more easily in meson.build. Also,
>>>> this is not a "real" feature like the other features that we provide
>>>> with the "--enable-xxx" and "--disable-xxx" switches for the
>>>> configure script, since this does not influence lots of code (it's
>>>> only about one call to xfsctl() in file-posix.c), so people don't
>>>> gain much with the ability to disable this with "--disable-xfsctl".
>>>> Let's rather treat this like the other cc.has_function() checks in
>>>> meson.build, i.e. don't add a new option for this in meson_options.txt.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>
>>> I think we should just use ioctl and copy the relevant definitions from 
>>> Linux:
>>>
>>> struct dioattr {
>>>          u32           d_mem;          /* data buffer memory alignment */
>>>          u32           d_miniosz;      /* min xfer size                */
>>>          u32           d_maxiosz;      /* max xfer size                */
>>> };
>>>
>>> #define XFS_IOC_DIOINFO        _IOR ('X', 30, struct dioattr)
>>
>> I've now had a closer look at this idea, but it's getting messy: We'd 
>> additionally also need the platform_test_xfs_fd() function that is called 
>> from file-posix.c ...
> 
> platform_test_xfs_fd() is only used to decide whether to invoke 
> XFS_IOC_DIOINFO; but failures of XFS_IOC_DIOINFO are ignored anyway, so we 
> can get rid of is_xfs in BDRVRawState, too.

After staring at the code for a while, I wonder why we're not simply using 
fstat() here instead to get the st_blksize value... wouldn't that be better 
anyway since it also works with other file system types?

  Thomas


