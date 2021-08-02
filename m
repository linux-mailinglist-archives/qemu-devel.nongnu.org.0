Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511593DDFA4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 20:55:03 +0200 (CEST)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAd5a-00022W-A0
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 14:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd4R-0001Jc-AG
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAd4P-0001K6-Fp
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627930428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SmH00HAVJeRi8VqN//+LN0ZssdMJgZfj9A0/pGtjopI=;
 b=W0HW2UflVaYU3/CVmj29tPQybHlNkJmZvTEG7sbcmPqkq84TpuucBoaZ/Ofql9CWznqKC9
 +wnlQq4Xh7cfsfl6RnRqgCFZub/BRQDqWwuKjA49DQxDI0NaIVVfjmacvyZnWe6Eht9loQ
 BatJbiFhzld5VoadfJIF+mvL+Fn6j6w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-6-g3Qnj5N3CMRSE2LO0zYQ-1; Mon, 02 Aug 2021 14:53:47 -0400
X-MC-Unique: 6-g3Qnj5N3CMRSE2LO0zYQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l38-20020a05600c1d26b0290259bef426efso165511wms.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SmH00HAVJeRi8VqN//+LN0ZssdMJgZfj9A0/pGtjopI=;
 b=bNKJobDWT2EOYMH4aRfebWO94Dc334Vp0jm7TA840zTrAT20uxH32BhE3dES9xzJz9
 RenEUbwARDj+dGMDFFNqWPjmmNyGcaGv0El1GWsy2avTH3caIqIRgE5vqkqS8hXmAJOd
 dQTn/u/0ar7Ghxyfzz/YnmSvpmf1tgPZublSeOAyNZpzY2pRDeq2nN32q4yCSjVjXq4n
 yNrsWhPjzR/+om+FIcp9U2quA8CJLc+BSRItC1ugTWvyhjGgWT5aDLSiCpMYpqVPYL/T
 eroHkLIVYY0fGvqYIBxK0v7eV4bGiT5hh1A4hLPf85eluAY/aRhHmvX/OSCR35rJn370
 hKpg==
X-Gm-Message-State: AOAM530RJv1if95d5Ryg1aeR3lMCcFD0JJ9d1iu+NPBtDNfOFkqFHeTE
 zIl52Q70eWm5qnXzdG78Cm+PJOCsZBhpSrBJ7EU4p9Q9Mp7d+l7e54K1hTYFAgLhqv8tH49qj1d
 By+Yh+RHa6oYcgvU=
X-Received: by 2002:adf:e507:: with SMTP id j7mr19759122wrm.113.1627930426256; 
 Mon, 02 Aug 2021 11:53:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEGrJeRXA/rus+C3ec/cSgKO33p2rh90/pZfmoY6/6SlE07178IGP+0ovB5Pdq+k0XYKdDwA==
X-Received: by 2002:adf:e507:: with SMTP id j7mr19759117wrm.113.1627930426111; 
 Mon, 02 Aug 2021 11:53:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id w13sm11949756wrq.91.2021.08.02.11.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 11:53:45 -0700 (PDT)
Subject: Re: [PATCH 3/4] chardev: remove needless class method
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
 <20210723102825.1790112-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c2262b60-4312-ab66-6325-7497b0616116@redhat.com>
Date: Mon, 2 Aug 2021 20:53:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723102825.1790112-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 12:28 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> "chr_option_parsed" is only implemented by the "mux" chardev, we can
> specialize the code there to avoid the needless generic class method.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/chardev/char.h | 1 -
>  chardev/char-mux.c     | 6 ++----
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


