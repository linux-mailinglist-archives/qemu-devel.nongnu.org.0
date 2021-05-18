Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF338754F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:39:54 +0200 (CEST)
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwCg-0007V7-04
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livsg-0001SW-IH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1livsZ-0002wr-Cz
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621329543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQn0HM7lrOJf9g2OYfQEZJZONonk5IJXqVlKZe5WM3w=;
 b=dwfCVviYIvWGFLZxMSybYxmq5TCT+ZJgGXl/+cQNcVo0SrbIvonb9eApvdCzj27FbEgCUT
 KMq8NBrdY3i3ERtBSXdT8ppcSvSaxYM61nSGeMZk8aMYsdIdgAuXqD16J4/Oni9JRbqOmP
 vBJ0uUfW4fhNhs7njnAYOo83bd7m9VM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-eM7qdkoYM4-guG7bUY5now-1; Tue, 18 May 2021 05:19:02 -0400
X-MC-Unique: eM7qdkoYM4-guG7bUY5now-1
Received: by mail-ej1-f71.google.com with SMTP id
 z15-20020a170906074fb029038ca4d43d48so2128347ejb.17
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQn0HM7lrOJf9g2OYfQEZJZONonk5IJXqVlKZe5WM3w=;
 b=Zl7snv6rccWYLZC87W8CY/wwKL27x7rSYKiPmVwzYKDlkJOtWatWP6DWD8JYXlB3/z
 Nl+aKjyYEWOKYvbEZshFYvpp4Hjbc6qgF7KRILM4k9TvLfbn5LuWYZ1LHlhzTLyw2vyn
 4G1BWofYOePA6QW+cd704+kqQo5R5FLDDPeKJl+EbewY4NvAxozduaso/fLovcV2fvMG
 oiK9BA6oNNZNrYq157ReVLKb8yuWOWJDIjoRzic+C1ndqopKUHxbIjslcTnejgfdcGIV
 QJEWhWpFe5qga0fZe4BaZ1DYgqwBeRp9RXRuB+RKOj+r497FBT9r3nhQXFZ1/FA+fW2E
 Oryg==
X-Gm-Message-State: AOAM532lhWdeWGpnX7YBWMpyA8evfz/lixUmqUXAQIPML292yUQxVHBi
 cAOPljVlmTu6rm1X2CNYugdkNN4QSXGNHsJ3jdZKFvCj3WPZ+ugEZFkF0pbAtOtzZkJ25H0VMDY
 33GjmTKlwMXq4J5k=
X-Received: by 2002:a05:6402:2548:: with SMTP id
 l8mr5947820edb.208.1621329540957; 
 Tue, 18 May 2021 02:19:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTdtxpAuUMI81/Boha3fY/voXA5tMCrBwjjUhrtZAFrw5DXBuCTmf7mSqoS+45QVsJ1jSuiA==
X-Received: by 2002:a05:6402:2548:: with SMTP id
 l8mr5947803edb.208.1621329540765; 
 Tue, 18 May 2021 02:19:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u6sm10083891ejn.14.2021.05.18.02.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:19:00 -0700 (PDT)
Subject: Re: [PATCH v2 08/50] target/i386: Assert IOPL is 0 for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-9-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5d26054f-866d-af88-5b01-079c8d1350a2@redhat.com>
Date: Tue, 18 May 2021 11:18:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-9-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> On real hardware, the linux kernel has the iopl(2) syscall which
> can set IOPL to 3, to allow e.g. the xserver to briefly disable
> interrupts while programming the graphics card.
> 
> However, QEMU cannot and does not implement this syscall, so the
> IOPL is never changed from 0.  Which means that all of the checks
> vs CPL <= IOPL are false for user-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


