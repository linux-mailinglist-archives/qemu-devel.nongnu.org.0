Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD065E820E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:51:37 +0200 (CEST)
Received: from localhost ([::1]:40090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnlw-0003FT-HO
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obnOb-0004V8-E5
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:27:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1obnOY-00035E-PR
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663957642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mE1MTnBz3LUwvf3wMXfezpPfsKLJq9UBEbW78Qx5oH0=;
 b=ETk/xvPijj19uMoIeAX0BGLGa1LIMCaj8/DSrUrVniFk5eSC00HitkWskHcSfhzGl8Qxov
 F87sz3uU5BWnd6L1l7q9FdwAsEd/kInA0jhaa42SWpmO1wYYQiIaB4Ec7H7c+SeJLdT/na
 WNYMYEp0Ur3PjrN12moG8EqQ3M5QDhI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-4rBZ8MuNP7KTCkGyGecOIA-1; Fri, 23 Sep 2022 14:27:21 -0400
X-MC-Unique: 4rBZ8MuNP7KTCkGyGecOIA-1
Received: by mail-qk1-f197.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so562100qko.18
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 11:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mE1MTnBz3LUwvf3wMXfezpPfsKLJq9UBEbW78Qx5oH0=;
 b=LW0cfoiSLcavKCuvHbXTZksyIpLwhLLMWmzG1iKheiwF7tP7x8F+e9afLFnJV2Zh0f
 EehcliI+oYCKbOpGxfwPDoNIXZZvH1zIQpWSReUlhGo/xgIzRUYXuYEntRHEEqPxwkBQ
 kkhg1p3l2iLj/xHYjADowC1clxrFWvW/ru9aWGlpYoG5SzYiFJR6il4TxoOjXoTfB7rS
 qcQWbzDe5dr8L8P0adR/Fx4RaJhUJM2Fa6RHD4oVaU7iuB6uM6MknKGSLvkIxpG1c16P
 0QbZj5kBxKLpK1sXnVJgKp21YQRBy241nUo6lTmHDFSuUmwcW9NHxYAILNyg43+Xx4zj
 sqKw==
X-Gm-Message-State: ACrzQf3YLgxS0NZ32RQyK/BTWUQy6sbwvcLsF5pssdeoKD1XjoadyRFl
 uyuS3s1T2kPXkwG60WTN9+lKDI8YgndW9CYO3u0kFbsrAlEa6iZAC6NhVxCWyt1kZJDNueXfy+c
 tqmYWeu75uBOC9M0=
X-Received: by 2002:a05:6214:5003:b0:49e:9829:3df1 with SMTP id
 jo3-20020a056214500300b0049e98293df1mr8032937qvb.57.1663957640570; 
 Fri, 23 Sep 2022 11:27:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM73AHeABxM66nv8zLKfHVRYK84DmEghn1nkib1UbtxMVTWrAlGqEmPZ5gay1tS92vXqmkqF4g==
X-Received: by 2002:a05:6214:5003:b0:49e:9829:3df1 with SMTP id
 jo3-20020a056214500300b0049e98293df1mr8032921qvb.57.1663957640372; 
 Fri, 23 Sep 2022 11:27:20 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 u5-20020a37ab05000000b006b8e8c657ccsm6096661qke.117.2022.09.23.11.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 11:27:19 -0700 (PDT)
Date: Fri, 23 Sep 2022 14:27:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/5] migration: Fix race on qemu_file_shutdown()
Message-ID: <Yy36hm/PZuVizjeK@x1n>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-3-peterx@redhat.com>
 <YyyUMYfLxs0/QY41@redhat.com> <Yyy5Z0lZ6oTnBp8g@xz-m1.local>
 <Yy1c0Xed15lzcAtl@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yy1c0Xed15lzcAtl@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 08:14:25AM +0100, Daniel P. Berrangé wrote:
> > Besides that, do you have anything else in mind that would make
> > QIOChannelCached better than qemufile (e.g. on how we do caching)?
> 
> Depends what you mean by better ? I think the caching code would be
> a bit easier to understand, because QEMUFile gets a bit confusing
> about which logic is used for read side and which is used for the
> write side.

I see, looking forward to it.  Thanks,

-- 
Peter Xu


