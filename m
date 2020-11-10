Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682B2ADC45
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:41:22 +0100 (CET)
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWhp-0003IC-75
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcWfs-0002li-1U
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:39:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcWfq-0007an-Bg
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605026353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LneduIa8xBJMPB1IXf0Bv22+2jBa0xQ1pJe7CnReXvs=;
 b=B8AZDSqmVRDPG3lmzTDLMYZUZzlFDnVOmHpdoSX/tzoXuLRXLaX5uUplH+X5JgII/ifUFp
 RDlF1XLOnKL0xI13O3ctkZ+8cTPEYl/MTS1vFoTHeITlomgZe8RapCytT3u2EpU7UfJktL
 Y09EFfVK9IMcEj5FqpAiGf0qYfDBxuQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-jW7Z9M3VPEOyMon9bZOlZA-1; Tue, 10 Nov 2020 11:39:11 -0500
X-MC-Unique: jW7Z9M3VPEOyMon9bZOlZA-1
Received: by mail-ed1-f70.google.com with SMTP id x15so4432897edr.10
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LneduIa8xBJMPB1IXf0Bv22+2jBa0xQ1pJe7CnReXvs=;
 b=psr/r5DsviLEvIH3ZwEA5M6AsAAPQ5Xf8FzhHuGp99z8EWev1l51nzkSuEN3/vF5OA
 SR0WEZn1Qb6vDf4U197HVFCNP+C69qYGyoQlxQERrugYpvydlHopjYmQExdTpN9pFshC
 spr32Y1Z3KQ/R8SgtRup50g6/bepWcKAnuVsiFUxdJXBqgbqF1paIn2zegtY7uFG2hdE
 YRgx4aEj/VazlQGjO+GMZyBXtMxuE3CcjFOzYyo2VgXm9Qaduxnj1nZWFBxNARJxPlPY
 zh3Y1CkjYnwj3+uKaBpXwd3sN/nlzn+jZbTaq7HXtI05eCRPwiZz5kh4WzqveVxjUYid
 FJmA==
X-Gm-Message-State: AOAM533FMb7dwQmAjdhyif8JZnvQHR/uKH0yhyYFBE17z9uPkbP/oFLW
 jWtRF7TDOhrnwv3vpTPUHR8s6miARLSoBAFSV/SFWzLPOZCUXRVxIDNZ0kXEGd0SxajMlV2QMOh
 muGFVUVyrKf1k+3M=
X-Received: by 2002:a05:6402:54d:: with SMTP id i13mr172066edx.3.1605026350368; 
 Tue, 10 Nov 2020 08:39:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF05sAUFN97ekIMeS7hx9ak1PsdKI/HPOTbs9SlmkUgk7cEPjTmGQxDVpz9quKiWzi5A6PpQ==
X-Received: by 2002:a05:6402:54d:: with SMTP id i13mr172047edx.3.1605026350212; 
 Tue, 10 Nov 2020 08:39:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d20sm11026638edz.14.2020.11.10.08.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 08:39:09 -0800 (PST)
Subject: Re: [PATCH 0/8] qom: Use qlit to represent property defaults
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201109212556.3934583-1-ehabkost@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0156a49d-a22b-f741-b0db-d2cda4d6ca36@redhat.com>
Date: Tue, 10 Nov 2020 17:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109212556.3934583-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/20 22:25, Eduardo Habkost wrote:
> Based-on: 20201104160021.2342108-1-ehabkost@redhat.com
> Git branch: https://gitlab.com/ehabkost/qemu/-/commits/work/qdev-qlit-defaults
> 
> This extend qlit.h to support all QNum types (signed int,
> unsigned int, and double), and use QLitObject to represent field
> property defaults.
> 
> It allows us to get rid of most type-specific .set_default_value
> functions for QOM property types.
> 
> Eduardo Habkost (8):
>    qobject: Include API docs in docs/devel/qobject.html
>    qnum: Make qnum_get_double() get const pointer
>    qnum: QNumValue type for QNum value literals
>    qnum: qnum_value_is_equal() function
>    qlit: Support all types of QNums
>    qlit: qlit_type() function
>    qom: Make object_property_set_default() public
>    qom: Use qlit to represent property defaults
> 
>   docs/devel/index.rst                  |   1 +
>   docs/devel/qobject.rst                |  11 +++
>   include/hw/qdev-properties-system.h   |   2 +-
>   include/qapi/qmp/qlit.h               |  16 +++-
>   include/qapi/qmp/qnum.h               |  47 ++++++++++-
>   include/qapi/qmp/qobject.h            |  48 +++++++----
>   include/qom/field-property-internal.h |   4 -
>   include/qom/field-property.h          |  26 +++---
>   include/qom/object.h                  |  11 +++
>   include/qom/property-types.h          |  21 ++---
>   hw/core/qdev-properties-system.c      |   8 --
>   qobject/qlit.c                        |   4 +-
>   qobject/qnum.c                        | 116 +++++++++++++++-----------
>   qom/field-property.c                  |  27 ++++--
>   qom/object.c                          |   2 +-
>   qom/property-types.c                  |  36 ++------
>   tests/check-qjson.c                   |  72 ++++++++++++++--
>   17 files changed, 295 insertions(+), 157 deletions(-)
>   create mode 100644 docs/devel/qobject.rst
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo


