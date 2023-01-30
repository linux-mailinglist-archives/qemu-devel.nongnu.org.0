Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF57680DFE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTXL-0001HV-By; Mon, 30 Jan 2023 07:45:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMTXG-0001Gc-0S
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:45:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMTXD-0006wT-KU
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675082718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CVXrBe5a2eNQ25FgDB0FujlzBlyvMktuKhNnFySl0k=;
 b=XcFXcJDoeCe55rsK34vHOd8uixX224uCAPRKvx7Yx2NXbcczBfQ3y5IvCp2/4l1Zlcgbrr
 E4wrq9CjYPiRO333GM/dc8AMmjGzohCc8KjukY+BVDVqc+RjZ+HGJ5sLZF+byJpaxAhWg+
 3MoJlJCWKZNHuxVxfDCnvNcgU0Aj2tI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-CbX8PLGdMSGWPJ0Hg8xMcQ-1; Mon, 30 Jan 2023 07:45:16 -0500
X-MC-Unique: CbX8PLGdMSGWPJ0Hg8xMcQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso6354702qvu.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 04:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9CVXrBe5a2eNQ25FgDB0FujlzBlyvMktuKhNnFySl0k=;
 b=fm3thVZLHpChdq7MfOHbERF1Pqr6RWkLDkhbY1nI75mtSO49RhbAXM10BsaTA0Q5tS
 LFk1jvb51UoEbA7tbMU4FvBH99lwIbILlD1paYexefOU08JEeu/MhP9fqlNVOaFXGbpb
 wQzXDPh6Jd9ULGC+qzdNuVLult9qdNTwFsKsLnD5mF6cZ/gcJT7ScqY/Za5Pq3LBxnH+
 U5hJzxvgm5OUDWTumPu6xJ4GCEDQMopEBHcXbgpJ0GJivpOM9HIfoLMNdCAEK7djF8++
 z3R3QYApKzyDv+w/1mbu9X4i91mmWqdKOT/0YbGYNvDaAPdLJAtnCIqqrqNdI9w9Ztvv
 bYPw==
X-Gm-Message-State: AO0yUKUNWNGP95DrZkP8I3AtpwD+oC5jRQkxGUihqtsMA19hrqC6BNiJ
 kKQBIAi4PcCGOhLc0klJRdKs0GDtxWnvOjCaPInkzAWdSCwwndVxTZ73BH6ypY8xkgUSvc6CwtZ
 Onmno/cljXGBr0B0=
X-Received: by 2002:a0c:ec11:0:b0:534:bc47:8ef6 with SMTP id
 y17-20020a0cec11000000b00534bc478ef6mr9701039qvo.5.1675082716193; 
 Mon, 30 Jan 2023 04:45:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+DUjxr6yFgYp1z+A8hXAV4l6piyB8qm3Bv6PiZaeV/lBiDDGtS+6JV/d//sYMvpFB9cKvMrA==
X-Received: by 2002:a0c:ec11:0:b0:534:bc47:8ef6 with SMTP id
 y17-20020a0cec11000000b00534bc478ef6mr9701021qvo.5.1675082715961; 
 Mon, 30 Jan 2023 04:45:15 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-179.web.vodafone.de.
 [109.43.178.179]) by smtp.gmail.com with ESMTPSA id
 p64-20020a374243000000b006ee8874f5fasm7899658qka.53.2023.01.30.04.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 04:45:15 -0800 (PST)
Message-ID: <ec298b45-ad69-4608-f6b3-b9c97bc7bf34@redhat.com>
Date: Mon, 30 Jan 2023 13:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] docs/s390x/pcidevices: document pci devices on s390x
Content-Language: en-US
To: Sebastian Mitterle <smitterl@redhat.com>, qemu-devel@nongnu.org
Cc: cohuck@redhat.com, clegoate@redhat.com, qemu-trivial@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230127123349.55294-1-smitterl@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230127123349.55294-1-smitterl@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/01/2023 13.33, Sebastian Mitterle wrote:
> Add some documentation about the zpci device and how
> to use it with pci devices on s390x.
> 
> Used source: Cornelia Huck's blog post
> https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
> 
> Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
> v3: add info zpci is autogenerated, fix typos and source formatting,
> improve style as suggested
> ---
>   docs/system/s390x/pcidevices.rst | 41 ++++++++++++++++++++++++++++++++
>   docs/system/target-s390x.rst     |  1 +
>   2 files changed, 42 insertions(+)
>   create mode 100644 docs/system/s390x/pcidevices.rst

Thanks, looks fine now to me, too!

Queued it to my staging branch:

  https://gitlab.com/thuth/qemu/-/commits/staging

  Thomas



