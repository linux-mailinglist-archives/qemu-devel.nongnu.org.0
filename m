Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2C383BE8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:08:50 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihfe-00085s-10
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihUG-0004cX-MP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihUF-0005nR-8n
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621274222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbb0JOTGcICeq4h/aNZ6Xic/MX4h/RQpVHN/Wzk8Vm0=;
 b=O/MVPCfVFnJqyXm0k/HbY/FMSlEl2VTaPG87HQ/zf87d7pfjDpA1d3GMmsYnSEZt+7MFOp
 h+UHjyzH57OFsSZno4Kx1007GNipjpkNlZaho1NtOGQ7DvslVHKqm9daSP0hrVeJrNrZMR
 2+Gm9ZfpYhhcZhDGKOBsu5cxsoiaoJ0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-dNjGNSOgNpOeVTJdr9BhsQ-1; Mon, 17 May 2021 13:56:59 -0400
X-MC-Unique: dNjGNSOgNpOeVTJdr9BhsQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so1331248ejw.22
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xbb0JOTGcICeq4h/aNZ6Xic/MX4h/RQpVHN/Wzk8Vm0=;
 b=Cz7GkzMkpGQgjE5m8zuQeH7ivLvYNUWjoeK6T25owrOzrZvkBtjjWVMdb33PFLEUQ7
 VRkkanAgp1zS9xAGHUIu2FGyTXU6kjYUT51tTPZIbiKH0ypT5fuTYxqc3XYU0NB5ojy/
 naBUlcy+3V4NjGxDEuguNZHQmqTl3c8iJqtI8DPsYNa2lVpaBJvi7L5kiUsOimj0AjQJ
 MtqMWq9jd/5s1ZhTAUl1VLxVaB0rZl5LlN0yaUxWtYSpbiJabzbe8dvONu57w5wbhvKD
 6hvUT0H3KekB1Fq31t0yq4rITw0/tAEOddqA+PevZmJ/ME9AxtR+DkJle1AJNHB+q3XJ
 RFgw==
X-Gm-Message-State: AOAM533aGxLF8ENVMvZPMZTz7YD4u0EakL7+xP92AIgVlf+TOkOCzmH9
 DAA9A3WqQmSy+GX1RyBluJQIUCjFEgafxW3pkYtMTPUPiW9QEffeSJtV/lnXiSfWj5I2gZZZIiX
 ROYYwMqXmhEMrVOo=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr1461931edd.251.1621274217792; 
 Mon, 17 May 2021 10:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxenkOoISD9I/sJVN/yHbowKmSxRrsE2exOiKO0UXSKYT1SGTuvWPKZdC/0wveBWYgfpmiyHQ==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr1461909edd.251.1621274217609; 
 Mon, 17 May 2021 10:56:57 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y19sm11382511edc.73.2021.05.17.10.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 10:56:57 -0700 (PDT)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: P J P <ppandit@redhat.com>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <6881ef3c-99a1-1f5f-cca5-0850ec2bd6cf@redhat.com>
 <89fb8d54-707a-9965-75e2-665d4cb07d63@redhat.com>
 <bea5cec1-eb1b-3eab-8e71-4af7ae1078ff@redhat.com>
 <8n7o47n5-741n-819-187-n27p1o87q362@erqung.pbz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5dcc09b1-9131-fb6f-b25b-b290e742329b@redhat.com>
Date: Mon, 17 May 2021 19:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8n7o47n5-741n-819-187-n27p1o87q362@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 1:12 PM, P J P wrote:
> +-- On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote --+
> | This patch misses the qtest companion with the reproducer
> | provided by Alexander.
> 
> Do we need a revised patch[-series] including a qtest? OR it can be done at 
> merge time?

Paolo usually asks for it and don't queue patch without qtest when
reproducer is available, but since it is a recent CVE it might I
suppose it depends on the maintainer :)


