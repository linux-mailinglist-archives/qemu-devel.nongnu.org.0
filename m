Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049153C29C6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 21:42:58 +0200 (CEST)
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1wOn-0006dk-2s
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 15:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m1wNR-0005vX-L9
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 15:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1m1wNP-00027y-6o
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 15:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625859688;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjIax1dT4GnHgH2ZOgc3u2IXllhJAMuafwVyh5RFqiI=;
 b=i/RDTNuTFduDzoZT/F4a847qbcxgElSQWuOIIULAzhgTyNQObsJ93AWvdvEFnAU/Q3kwFg
 wmj2SAjxtamYB7OGTv9HLGgYxFAiczW/tmbU2YLszIWA2wSo8Jt996X5hHu6wnRqn8ZjB2
 dUhbuPa7tRPGLpETTXjNAiSQqIXts30=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-tW4PIwISPPKEtvVdA0NS-w-1; Fri, 09 Jul 2021 15:41:27 -0400
X-MC-Unique: tW4PIwISPPKEtvVdA0NS-w-1
Received: by mail-pf1-f198.google.com with SMTP id
 s14-20020a056a00194eb02903245e1dd027so7016203pfk.20
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 12:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=zjIax1dT4GnHgH2ZOgc3u2IXllhJAMuafwVyh5RFqiI=;
 b=dZEkHwvtQzePevXLo8iSPqROPVZIAECOhy5ukVWPOwMfzStcWo47xvkxwq5DW2yfBf
 CMnmu+201ikYDiud1WynDAUCRmrAm7mCdUpIsT67acDFDE/awmcMgDDy5QziEJTmqCJc
 nP+i1ElYYfsCv5R1YiLwoEKY+1aAz8KpV+Qg2G8FJpwmpth0nnEEVLMAg7rt0hlq1RK/
 F+FKxE3TiuzWFaIwCKpVXDC83vo/QGBZM9ZqPEgORCtigB6t+I2zq7Q8lT3k+HWooGA6
 pKuMHkUL8hwFRYzev82p5EsOpgYkDDLJGMKWXRh21ccnrM1NZ91/ipOXZOK8AeqV8ruo
 6FOw==
X-Gm-Message-State: AOAM532FwbxU3A/1nKUYjigQtRm/9DY3Kghv5r5TOPgY8vntvmMgjNOH
 KsA3LPlhoOadV3Tt1dkhXxhB07AeWMDUN0ZGEERlL08UHECCFO0cXzYLbPMVzafB3lI2Py7KPFS
 BMtc8rvIJJS2v8Mw=
X-Received: by 2002:aa7:9216:0:b029:2e5:6989:4f1a with SMTP id
 22-20020aa792160000b02902e569894f1amr38714438pfo.50.1625859685783; 
 Fri, 09 Jul 2021 12:41:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmn54ScRnWO/0lQ/POF6GBkYfNT9hE1/0lsiVtvmgKOx85v7cmjTESIVZOfiG+lwlLHLH8VQ==
X-Received: by 2002:aa7:9216:0:b029:2e5:6989:4f1a with SMTP id
 22-20020aa792160000b02902e569894f1amr38714412pfo.50.1625859685480; 
 Fri, 09 Jul 2021 12:41:25 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id c9sm6301231pja.7.2021.07.09.12.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 12:41:24 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
To: Cleber Rosa <crosa@redhat.com>, eric.auger@redhat.com,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, philmd@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-2-eric.auger@redhat.com>
 <df9835de-fe4a-2233-a625-3b04b7b0d514@redhat.com>
 <917bb587-ccd1-cac7-1e82-d2f869feaf02@redhat.com>
 <7e1cf0c6-97b4-ebfe-f046-c2fe06e5e6e3@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <a8b5b257-5bec-0bb5-66c3-798f802478d5@redhat.com>
Date: Fri, 9 Jul 2021 16:41:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7e1cf0c6-97b4-ebfe-f046-c2fe06e5e6e3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: wainersm@redhat.com
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/8/21 2:34 PM, Cleber Rosa wrote:
>
> On 7/8/21 4:56 AM, Eric Auger wrote:
>>
>> I am not sufficiently expert on the test infra and python to be really
>> efficient fixing that. Can anyone help quickly to target the soft
>> freeze? Otherwise, today I will drop that patch and restore the code I
>> had in v4, just based on Cleber series. I think the refactoring can
>> happen later...
>
>
> Hi Eric,
>
>
> The following diff works for me:
>
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py 
> b/tests/acceptance/avocado_qemu/__init__.py
> index af93cd63ea..b3bed00062 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -310,6 +310,8 @@ class LinuxDistro:
>              '31': {
>                  'x86_64':
>                  {'checksum': 
> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
> +                'aarch64':
> +                {'checksum': 
> '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
>                  'ppc64':
>                  {'checksum': 
> '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>                  's390x':
> @@ -323,10 +325,11 @@ def __init__(self, name, version, arch):
>          self.version = version
>          self.arch = arch
>          try:
> -            self._info = 
> self.KNOWN_DISTROS.get(name).get(version).get(arch)
> +            info = self.KNOWN_DISTROS.get(name).get(version).get(arch)
>          except AttributeError:
>              # Unknown distro
> -            self._info = {}
> +            info = None
> +        self._info = info or {}
>
>      @property
>      def checksum(self):
>
>

Thanks for that fix, Cleber.

Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


> I've tested it with both existing and the newly introduced tests.
>
>
> Cheers,
>
> - Cleber.
>


