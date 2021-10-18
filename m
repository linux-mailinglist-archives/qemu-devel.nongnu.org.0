Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1B4313D8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:53:06 +0200 (CEST)
Received: from localhost ([::1]:60414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPKL-0002GR-JL
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcPJ2-0000hP-58
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mcPJ0-000232-9T
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634550701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSnw7pINrM3ID8dHT/kDUNdFBadK0si+32xhivZxgSo=;
 b=JcgYMZWyL8pHtmvFgu3IUsKL9pY2t9lY/9lQE1unvT0pIIrS3SATbPc10dE4vtl7CeteKC
 JwQrMTIh0/gMSHjjCaLuR9bY9XUKzctDIh5faJV0ADCvby0PUM1JSDNrgpZbXIB7r+Blco
 lNK1/4oIJB4SceEvIKWuCgOmGwExrmE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-0ZMLLgB2OSmvBFLVoy17ig-1; Mon, 18 Oct 2021 05:51:38 -0400
X-MC-Unique: 0ZMLLgB2OSmvBFLVoy17ig-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso3408044wrf.6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NSnw7pINrM3ID8dHT/kDUNdFBadK0si+32xhivZxgSo=;
 b=as8/rX00mb/G6hASeRCyKF89zhmDUzWqIqnLiFebQiuVL3cO2mD4VGJqIpL8wxFCLn
 NfhmmFkXCifDgdiuJyg6N5xYm56yQOmnzG7qyFiiMarz6MHzq1A9ipHjoXo9A43FMPY+
 sc0N6P9y6+2xxDcgtCVGXSkLs0EaUr8PD9ZBHpYNUIs7Ea8YSrq3JgN1pSoHTOsZ35X5
 faxVl4HNNs/Jka9/9DktPWK7Ghc+QM1z7uPw9OVGEHzr8I/HPToI4lAt92yfzFl2hoCr
 vnDhABh2fo5NGhHzYNPAlR940LpjCcYi3cl4uIAj7rSikgBaL46ytotVuH+HG9VzbYxb
 BU/g==
X-Gm-Message-State: AOAM530Ulq7JrCuY06XaVbTMKLqnkmzYPJ/EgsSIWmC9tRg1w+VNz6QZ
 iU5gsuuw0vkziQsbjwWmyBYj4bt3uXMoVlp7TxPazUppCFrYZd2OlNK9J9cHRlMv193wcQQ0zAV
 aymOOCRfcBgXMFmc=
X-Received: by 2002:a05:600c:3b82:: with SMTP id
 n2mr42728541wms.46.1634550697047; 
 Mon, 18 Oct 2021 02:51:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkIQNK4A1LmLxKn0Xjwly2yDAy0Ics84j1NFshWx+gb/uyS+I7XCBDjBfSgJ6iR6bRA3nx9w==
X-Received: by 2002:a05:600c:3b82:: with SMTP id
 n2mr42728527wms.46.1634550696820; 
 Mon, 18 Oct 2021 02:51:36 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id y5sm11699938wrq.85.2021.10.18.02.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:51:36 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211015100718.17828-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH 0/4] Replace custom test harness with "meson test"
Message-ID: <310bb057-00f4-d5be-e855-775690a723a1@redhat.com>
Date: Mon, 18 Oct 2021 11:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211015100718.17828-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, marcandre.lureau@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/2021 12.07, Paolo Bonzini wrote:
> Hi all,
> 
> Starting with Meson 0.57, "meson test" has all features of QEMU's
> makefile-based harness and more.

I just gave it a try, and basically I like this ... but I also encountered 
two issues:

> * CTRL+C will only interrupt the longest running test.  Pressing
>    CTRL+C repeatedly three times (which you would likely do anyway,
>    that's how things work) interrupts the whole run

I tried this, and while hitting CTRL-C multiple times brought me back to the 
shell prompt, the remaining tests kept getting started in the background 
instead of getting stopped ... something is still fishy here, I think.

> * Right now "make check-block" only does a single test run just like
>    "../tests/check-block.sh", but it would be possible to add the thorough
>    suite to "meson test --suite block" as well.

The output of the iotests is also not optimal yet... when running "make 
check SPEED=slow", the iotests are run multiple times with different target 
image types, but each run prints the same "▶ 1/1 test 001   OK" etc. to the 
console, so it's hard to say which target type  is currently exercised. 
Would it be possible to include the target image type here, e.g. something like:

▶ 1/1 test-qcow2 001                       OK

?

  Thomas


